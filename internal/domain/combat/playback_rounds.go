// Open-sourced by BaoLT

// Playback round builders align battle actions with the Flash client's batched onBattlePlayList flow.
package combat

func BuildPlaybackRounds(actions []*BattleAction) [][]map[string]interface{} {
	rounds := make([][]map[string]interface{}, 0, len(actions))

	for index := 0; index < len(actions); {
		if segments, nextIndex, ok := collectMultiTargetSkillCluster(actions, index); ok {
			rounds = append(rounds, buildMultiTargetSkillRounds(segments)...)
			index = nextIndex
			continue
		}

		currentDTO, ok := playbackDTO(actions[index])
		if !ok {
			index++
			continue
		}

		if index+1 < len(actions) && shouldPairPlaybackActions(actions[index], actions[index+1]) {
			nextDTO, ok := playbackDTO(actions[index+1])
			if ok {
				rounds = append(rounds, []map[string]interface{}{currentDTO, nextDTO})
				index += 2
				continue
			}
		}

		rounds = append(rounds, []map[string]interface{}{currentDTO})
		index++
	}

	return rounds
}

func FlattenPlaybackRounds(rounds [][]map[string]interface{}) []map[string]interface{} {
	total := 0
	for _, round := range rounds {
		total += len(round)
	}

	flat := make([]map[string]interface{}, 0, total)
	for _, round := range rounds {
		flat = append(flat, round...)
	}
	return flat
}

type multiTargetSkillSegment struct {
	opener *BattleAction
	hurt   *BattleAction
	follow *BattleAction
}

func collectMultiTargetSkillCluster(actions []*BattleAction, start int) ([]multiTargetSkillSegment, int, bool) {
	if start >= len(actions) {
		return nil, start, false
	}

	first := actions[start]
	if first == nil || first.ActionType != ActionTypeSkill {
		return nil, start, false
	}

	segments := make([]multiTargetSkillSegment, 0, 2)
	uniqueTargets := make(map[string]struct{})
	index := start

	for index < len(actions) {
		opener := actions[index]
		if !matchesMultiTargetSkillOpener(first, opener) {
			break
		}

		segment := multiTargetSkillSegment{opener: opener}
		uniqueTargets[opener.TargetID] = struct{}{}
		index++

		if index < len(actions) && isClusterHurtAction(opener, actions[index]) {
			segment.hurt = actions[index]
			index++
		}

		if index < len(actions) && isClusterFollowAction(opener, actions[index]) {
			segment.follow = actions[index]
			index++
		}

		segments = append(segments, segment)
	}

	if len(segments) < 2 || len(uniqueTargets) < 2 {
		return nil, start, false
	}

	return segments, index, true
}

func matchesMultiTargetSkillOpener(first *BattleAction, candidate *BattleAction) bool {
	if first == nil || candidate == nil {
		return false
	}

	return candidate.ActionType == ActionTypeSkill &&
		candidate.Round == first.Round &&
		candidate.ActorID == first.ActorID &&
		candidate.ActorPosition == first.ActorPosition &&
		candidate.SkillID == first.SkillID
}

func isClusterHurtAction(opener *BattleAction, candidate *BattleAction) bool {
	if opener == nil || candidate == nil {
		return false
	}

	return (candidate.ActionType == ActionTypeHurt || candidate.ActionType == ActionTypeDefended) &&
		candidate.ActorID == opener.TargetID &&
		candidate.ActorPosition == opener.TargetPosition &&
		candidate.TargetID == opener.ActorID
}

func isClusterFollowAction(opener *BattleAction, candidate *BattleAction) bool {
	if opener == nil || candidate == nil {
		return false
	}

	return (candidate.ActionType == ActionTypeIdle || candidate.ActionType == ActionTypeDie) &&
		candidate.ActorID == opener.TargetID &&
		candidate.ActorPosition == opener.TargetPosition
}

func buildMultiTargetSkillRounds(segments []multiTargetSkillSegment) [][]map[string]interface{} {
	rounds := make([][]map[string]interface{}, 0, len(segments)+2)

	openerDTO, ok := playbackDTO(segments[0].opener)
	if ok {
		openerDTO["tSObj"] = map[string]interface{}{}
		castSource := cloneStateMap(openerDTO["sSObj"])
		delete(castSource, "bullet")
		openerDTO["sSObj"] = castSource
		rounds = append(rounds, []map[string]interface{}{openerDTO})
	}

	projectileRound := make([]map[string]interface{}, 0, len(segments))
	for _, segment := range segments {
		projectileDTO, ok := buildProjectilePlaybackDTO(segment.opener)
		if !ok {
			continue
		}
		projectileRound = append(projectileRound, projectileDTO)
	}
	if len(projectileRound) > 0 {
		rounds = append(rounds, projectileRound)
	}

	hurtRound := make([]map[string]interface{}, 0, len(segments))
	for _, segment := range segments {
		if segment.hurt == nil {
			continue
		}

		hurtDTO, ok := playbackDTO(segment.hurt)
		if !ok {
			continue
		}

		openerDTO, ok := playbackDTO(segment.opener)
		if !ok {
			continue
		}

		sSObj := cloneStateMap(hurtDTO["sSObj"])
		for key, value := range extractHurtPlaybackState(openerDTO) {
			sSObj[key] = value
		}
		hurtDTO["sSObj"] = sSObj
		hurtRound = append(hurtRound, hurtDTO)
	}
	if len(hurtRound) > 0 {
		rounds = append(rounds, hurtRound)
	}

	followRound := make([]map[string]interface{}, 0, len(segments))
	for _, segment := range segments {
		if segment.follow == nil {
			continue
		}
		followDTO, ok := playbackDTO(segment.follow)
		if !ok {
			continue
		}
		followRound = append(followRound, followDTO)
	}
	if len(followRound) > 0 {
		rounds = append(rounds, followRound)
	}

	return rounds
}

func buildProjectilePlaybackDTO(opener *BattleAction) (map[string]interface{}, bool) {
	openerDTO, ok := playbackDTO(opener)
	if !ok {
		return nil, false
	}

	sourceState := cloneStateMap(openerDTO["sSObj"])
	bullet, hasBullet := sourceState["bullet"]
	if !hasBullet {
		return nil, false
	}

	return map[string]interface{}{
		"sid":   openerDTO["sid"],
		"tid":   openerDTO["tid"],
		"bid":   11500,
		"sSObj": map[string]interface{}{"bullet": bullet},
		"tSObj": map[string]interface{}{},
		"delay": 0,
	}, true
}

func shouldPairPlaybackActions(current *BattleAction, next *BattleAction) bool {
	if current == nil || next == nil {
		return false
	}

	currentBid := current.ActionTypeToBehavior()
	nextBid := next.ActionTypeToBehavior()
	return (currentBid == 3 || currentBid == 7) && (nextBid == 5 || nextBid == 6)
}

func playbackDTO(action *BattleAction) (map[string]interface{}, bool) {
	if action == nil {
		return nil, false
	}

	dto := action.ToDTO()
	if effects, ok := dto["effects"].([]string); ok && len(effects) > 0 && effects[0] == "skip" {
		return nil, false
	}
	return dto, true
}

func extractHurtPlaybackState(openerDTO map[string]interface{}) map[string]interface{} {
	targetState := cloneStateMap(openerDTO["tSObj"])
	delete(targetState, "attackEff")
	return targetState
}

func cloneStateMap(raw interface{}) map[string]interface{} {
	if raw == nil {
		return map[string]interface{}{}
	}

	state, ok := raw.(map[string]interface{})
	if !ok {
		return map[string]interface{}{}
	}

	cloned := make(map[string]interface{}, len(state))
	for key, value := range state {
		cloned[key] = value
	}
	return cloned
}
