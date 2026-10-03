// Open-sourced by BaoLT

// Social teacher and student handlers.
package social

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) InitTS(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := parseSessionCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("InitTS: fetching teacher/student list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	students, err := h.socialService.GetTeacherStudentList(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("InitTS: failed to get teacher/student list",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := toTeacherStudentInitPayload(students)

	h.logger.Info("InitTS: returning teacher/student list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("count", len(result)))

	if err := ctx.Connection.SendCallback("onInitTS", result); err != nil {
		h.logger.Error("InitTS: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) FindTeacher(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	name, ok := args[0].(string)
	if !ok {
		h.logger.Warn("FindTeacher: invalid name type", zap.Any("name", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	if err := validateName(name); err != nil {
		h.logger.Warn("FindTeacher: name failed validation",
			zap.Int("len", len(name)))
		return nil, pkgerrors.ErrInvalidInput
	}

	h.logger.Info("FindTeacher called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.String("teacher_name", name))

	result, err := h.socialService.FindTeacher(ctx.Context, characterID, name)
	if err != nil {
		h.logger.Warn("FindTeacher: failed to find teacher",
			zap.String("teacher_name", name),
			zap.Error(err))
		return nil, err
	}

	if err := ctx.Connection.SendCallback("onFindTeacher", result); err != nil {
		h.logger.Error("FindTeacher: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return result, nil
}

func (h *Handler) FindStudent(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	name, ok := args[0].(string)
	if !ok {
		h.logger.Warn("FindStudent: invalid name type", zap.Any("name", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	if err := validateName(name); err != nil {
		h.logger.Warn("FindStudent: name failed validation",
			zap.Int("len", len(name)))
		return nil, pkgerrors.ErrInvalidInput
	}

	h.logger.Info("FindStudent called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.String("student_name", name))

	result, err := h.socialService.FindStudent(ctx.Context, characterID, name)
	if err != nil {
		h.logger.Warn("FindStudent: failed to find student",
			zap.String("student_name", name),
			zap.Error(err))
		return nil, err
	}

	if err := ctx.Connection.SendCallback("onFindStudent", result); err != nil {
		h.logger.Error("FindStudent: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return result, nil
}

func (h *Handler) ReportTS(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := parseSessionCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("ReportTS: reporting teacher/student progress",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	result, err := h.socialService.ReportTeacherStudentProgress(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("ReportTS: failed to report progress",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	if err := ctx.Connection.SendCallback("onReportTS", result); err != nil {
		h.logger.Error("ReportTS: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return result, nil
}

func (h *Handler) DelST(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var studentID int64
	switch value := args[0].(type) {
	case float64:
		studentID = int64(value)
	case int:
		studentID = int64(value)
	case int64:
		studentID = value
	default:
		h.logger.Warn("DelST: invalid student ID type", zap.Any("student_id", args[0]))
		return nil, pkgerrors.ErrInvalidInput
	}

	h.logger.Info("DelST called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("student_id", studentID))

	result, err := h.socialService.DeleteStudent(ctx.Context, characterID, studentID)
	if err != nil {
		h.logger.Warn("DelST: failed to delete student",
			zap.Int64("student_id", studentID),
			zap.Error(err))
		return nil, err
	}

	if err := ctx.Connection.SendCallback("onDelST", result); err != nil {
		h.logger.Error("DelST: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	h.logger.Info("Student deleted",
		zap.Int64("character_id", characterID),
		zap.Int64("student_id", studentID))

	return result, nil
}
