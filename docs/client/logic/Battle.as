// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.Battle

package com.qeedoo.game.logic
{
    import com.qeedoo.game.system.Core;
    import flash.geom.Point;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.object.Player;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import flash.utils.setTimeout;
    import flash.display.DisplayObject;

    public class Battle 
    {

        public static var BATTLE_ID:Array = [];
        public static var BATTLE_POS:Array = [];
        public static var SKILL_KIND_USE:int = 1;
        public static var SKILL_KIND_POSIVE:int = 2;
        public static var SKILL_KIND_BUFF:int = 3;
        public static var SKILL_KIND_FUNC:int = 4;
        public static var SKILL_TARGET_TYPE_SELF:int = 1;
        public static var SKILL_TARGET_TYPE_SELF_PLAYER:int = 2;
        public static var SKILL_TARGET_TYPE_SELF_PET:int = 3;
        public static var SKILL_TARGET_TYPE_ENEMEY:int = 4;
        public static var SKILL_TARGET_TYPE_ENEMEY_PLAYER:int = 5;
        public static var SKILL_TARGET_TYPE_ENEMEY_CRE:int = 6;
        public static var SKILL_TARGET_TYPE_ENEMEY_NOBOSS:int = 7;
        public static var SKILL_TARGET_TYPE_TEAM:int = 8;
        public static var SKILL_TARGET_TYPE_TEAM_PLAYER:int = 9;
        public static var SKILL_TARGET_TYPE_TEAM_PET:int = 10;
        public static var SKILL_TARGET_TYPE_ALL:int = 11;
        public static var SKILL_TARGET_TYPE_PLAYER:int = 12;
        public static var BATTLE_AREA_TYPE_V:int = 1;
        public static var BATTLE_AREA_TYPE_H:int = 2;
        public static var BATTLE_AREA_TYPE_C:int = 3;
        public static var BATTLE_AREA_TYPE_R:int = 4;
        public static var BATTLE_STATE_NORMAL:int = 0;
        public static var BATTLE_STATE_DEFENCE:int = 1;
        public static var BATTLE_STATE_DIZZY:int = 10;
        public static var BATTLE_STATE_CONFUSION:int = 20;
        public static var BATTLE_STATE_SLEEP:int = 30;
        public static var BATTLE_STATE_POISON:int = 40;
        public static var BATTLE_STATE_FIRE:int = 50;
        public static var BATTLE_STATE_ICE:int = 60;
        public static var BATTLE_STATE_LIGHT:int = 70;
        public static var BATTLE_STATE_SILENCE:int = 80;
        public static var BATTLE_STATE_REBELLION:int = 90;
        public static var BATTLE_STATE_STONE:int = 100;

        private const BATTLE_SEND_DELAY:Number = 4000;

        private var _lastCmd:Array;
        private var nid:uint = 0;
        private var _newRoundTime:Number;
        private var _sending:Boolean;
        public var battleFieldId:String = null;
        private var _cmdAry:Array;
        private var _core:Core;

        {
            BATTLE_ID[0] = [4, 2, 0, 1, 3];
            BATTLE_ID[1] = [9, 7, 5, 6, 8];
            BATTLE_ID[2] = [18, 16, 15, 17, 19];
            BATTLE_ID[3] = [13, 11, 10, 12, 14];
            BATTLE_POS[0] = new Point(2, 0);
            BATTLE_POS[1] = new Point(3, 0);
            BATTLE_POS[2] = new Point(1, 0);
            BATTLE_POS[3] = new Point(4, 0);
            BATTLE_POS[4] = new Point(0, 0);
            BATTLE_POS[5] = new Point(2, 1);
            BATTLE_POS[6] = new Point(3, 1);
            BATTLE_POS[7] = new Point(1, 1);
            BATTLE_POS[8] = new Point(4, 1);
            BATTLE_POS[9] = new Point(0, 1);
            BATTLE_POS[10] = new Point(2, 3);
            BATTLE_POS[11] = new Point(1, 3);
            BATTLE_POS[12] = new Point(3, 3);
            BATTLE_POS[13] = new Point(0, 3);
            BATTLE_POS[14] = new Point(4, 3);
            BATTLE_POS[15] = new Point(2, 2);
            BATTLE_POS[16] = new Point(1, 2);
            BATTLE_POS[17] = new Point(3, 2);
            BATTLE_POS[18] = new Point(0, 2);
            BATTLE_POS[19] = new Point(4, 2);
        }


        public function battleAuto():void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Array;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Array;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:Boolean;
            var _local_14:String;
            var _local_15:String;
            var _local_1:* = _core.view.getUI(ViewManager.STAGE_BATTLE);
            var _local_2:Player = _core.player;
            var _local_3:int = _local_2.battleId;
            if (GamePredef.GLOBAL_SETTING.bs1 > 0)
            {
                if (((_local_2.currentHp / _local_2.property.finalHp) * 100) < GamePredef.GLOBAL_SETTING.p2)
                {
                    if (GamePredef.GLOBAL_SETTING.bt1 == GamePredef.TBL_SKILL)
                    {
                        _local_4 = null;
                        if (((GamePredef.GLOBAL_SETTING.bs1) && (GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs1].targetType == SKILL_TARGET_TYPE_ENEMEY)))
                        {
                            _local_4 = battleGetRandomEnemy(_local_1.cList);
                            _local_3 = -1;
                            if (_local_4)
                            {
                                _local_3 = _local_4.battleId;
                            };
                        };
                        battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs1);
                        return;
                    };
                    _local_5 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs1);
                    if (((_local_5) && (_local_5.slot)))
                    {
                        battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_5.slot.id);
                        return;
                    };
                };
            };
            if (GamePredef.GLOBAL_SETTING.bs9 > 0)
            {
                if (((_local_2.currentMp / _local_2.property.finalMp) * 100) < GamePredef.GLOBAL_SETTING.p3)
                {
                    _local_6 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs9);
                    if (((_local_6) && (_local_6.slot)))
                    {
                        battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_6.slot.id);
                        return;
                    };
                };
            };
            if (GamePredef.GLOBAL_SETTING.bs3 > 0)
            {
                _local_7 = battleGetGroupPlayerList(_local_1.cList);
                for each (_local_8 in _local_7)
                {
                    if (((_local_8.hp / _local_8.hpMax) * 100) < GamePredef.GLOBAL_SETTING.p4)
                    {
                        _local_3 = _local_8.battleId;
                        if (GamePredef.GLOBAL_SETTING.bt3 == GamePredef.TBL_SKILL)
                        {
                            _local_4 = null;
                            if (((GamePredef.GLOBAL_SETTING.bs3) && (GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs3].targetType == SKILL_TARGET_TYPE_ENEMEY)))
                            {
                                _local_4 = battleGetRandomEnemy(_local_1.cList);
                                _local_3 = -1;
                                if (_local_4)
                                {
                                    _local_3 = _local_4.battleId;
                                };
                            };
                            battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs3);
                            return;
                        };
                        _local_9 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs3);
                        if (((_local_9) && (_local_9.slot)))
                        {
                            battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_9.slot.id);
                            return;
                        };
                    };
                };
            };
            if (GamePredef.GLOBAL_SETTING.bs5 > 0)
            {
                _local_10 = battleGetGroupPetList(_local_1.cList);
                for each (_local_11 in _local_10)
                {
                    if (((_local_11.hp / _local_11.hpMax) * 100) < GamePredef.GLOBAL_SETTING.p5)
                    {
                        _local_3 = _local_11.battleId;
                        if (GamePredef.GLOBAL_SETTING.bt5 == GamePredef.TBL_SKILL)
                        {
                            _local_4 = null;
                            if (((GamePredef.GLOBAL_SETTING.bs5) && (GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs5].targetType == SKILL_TARGET_TYPE_ENEMEY)))
                            {
                                _local_4 = battleGetRandomEnemy(_local_1.cList);
                                _local_3 = -1;
                                if (_local_4)
                                {
                                    _local_3 = _local_4.battleId;
                                };
                            };
                        };
                        if (_aidPet(_local_3))
                        {
                            return;
                        };
                    };
                };
            };
            if (GamePredef.BATTLE_AUTO_DEFENSE_PLAYER)
            {
                battleCmd(-1, GamePredef.BATTLE_ACTION_DEFENCE, -1);
                return;
            };
            _local_4 = battleGetRandomEnemy(_local_1.cList);
            _local_3 = -1;
            if (_local_4)
            {
                _local_3 = _local_4.battleId;
            };
            if (GamePredef.GLOBAL_SETTING.bs7 > 0)
            {
                _local_12 = GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs7];
                _local_13 = true;
                _local_14 = "";
                _local_15 = "";
                if (((_local_12.useMp >= 1) && (_local_2.currentMp < _local_12.useMp)))
                {
                    _local_13 = false;
                    _local_14 = "mp";
                };
                if (((_local_12.useMp > 0) && (_local_12.useMp < 1)))
                {
                    if (_local_12.useMp > (_local_2.currentMp / _local_2.property.finalMp))
                    {
                        _local_13 = false;
                        _local_14 = "mp";
                    };
                };
                if (((_local_12.useHp >= 1) && (_local_2.currentHp < _local_12.useHp)))
                {
                    _local_13 = false;
                    _local_15 = "hp";
                };
                if (((_local_12.useHp > 0) && (_local_12.useHp < 1)))
                {
                    if (_local_12.useHp > (_local_2.currentHp / _local_2.property.finalHp))
                    {
                        _local_13 = false;
                        _local_15 = "hp";
                    };
                };
                if (!_local_13)
                {
                    if (((_local_14 == "mp") && (_local_15 == "")))
                    {
                        _core.sysMidNote(Language.AUTOBATTLECANVA_U[4]);
                    };
                    if (((_local_15 == "hp") && (_local_14 == "")))
                    {
                        _core.sysMidNote(Language.AUTOBATTLECANVA_U[5]);
                    };
                    if (((_local_15 == "hp") && (_local_14 == "mp")))
                    {
                        _core.sysMidNote(Language.AUTOBATTLECANVA_U[6]);
                    };
                };
                if (((_local_12) && (_local_13)))
                {
                    switch (Number(_local_12.type))
                    {
                        case GamePredef.SKILL_TYPE_DEFENDER:
                            _local_4 = battleGetRandomTeam(_local_1.cList);
                            if (_local_4)
                            {
                                _local_3 = _local_4.battleId;
                            };
                            break;
                        case GamePredef.SKILL_TYPE_CLOSE:
                            if (!isFrontPos(_local_2.battleId))
                            {
                                _local_4 = battleGetRandomFrontEnemy(_local_1.cList);
                            }
                            else
                            {
                                _local_4 = battleGetRandomEnemy(_local_1.cList);
                            };
                            if (_local_4)
                            {
                                _local_3 = _local_4.battleId;
                            };
                            break;
                    };
                    battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs7);
                    return;
                };
            }
            else
            {
                if (!isFrontPos(_local_2.battleId))
                {
                    _local_4 = battleGetRandomFrontEnemy(_local_1.cList);
                    if (_local_4)
                    {
                        _local_3 = _local_4.battleId;
                    };
                };
                battleCmd(_local_3, GamePredef.BATTLE_ACTION_ATTACK, 0);
                return;
            };
            if (!isFrontPos(_local_2.battleId))
            {
                _local_4 = battleGetRandomFrontEnemy(_local_1.cList);
                if (_local_4)
                {
                    _local_3 = _local_4.battleId;
                };
            };
            battleCmd(_local_3, GamePredef.BATTLE_ACTION_ATTACK, 0);
        }

        public function battleClearCmd():void
        {
            _cmdAry = [];
        }

        public function watchOnEnd():void
        {
            _core = Core.getInstance();
            _core.state = GamePredef.ST_NORMAL;
            _core.view.getUI(ViewManager.STAGE_BATTLE).endBattle();
            restoreUI();
            _core.view.getUI(ViewManager.MAIN_SELF).update();
            _cmdAry = [];
            if (((_core.player) && (((!(_core.player.inGroup)) || (_core.player.isLeader)) || (_core.player.groupAfk))))
            {
                if (!_core.player.isDead)
                {
                    _core.player.walkable = true;
                    if (_core.player.normalView)
                    {
                        _core.player.normalView.lastCheckTime = new Date().getTime();
                    };
                };
            };
        }

        public function get currentRound():int
        {
            return (_cmdAry.length + 1);
        }

        public function battlePetAuto():void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Array;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Array;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:Object;
            var _local_14:Boolean;
            var _local_15:String;
            var _local_16:String;
            var _local_1:* = _core.view.getUI(ViewManager.STAGE_BATTLE);
            var _local_2:Object = battleGetPlayerPet(_local_1.cList);
            if (!_local_2)
            {
                battleCmd(-1, GamePredef.BATTLE_ACTION_AUTO, 0);
                return;
            };
            var _local_3:int = _local_2.battleId;
            if (GamePredef.GLOBAL_SETTING.bs2 > 0)
            {
                if (((_local_2.hp / _local_2.hpMax) * 100) < GamePredef.GLOBAL_SETTING.p6)
                {
                    if (GamePredef.GLOBAL_SETTING.bt2 == GamePredef.TBL_SKILL)
                    {
                        _local_4 = null;
                        if (((GamePredef.GLOBAL_SETTING.bs2) && (GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs2].targetType == SKILL_TARGET_TYPE_ENEMEY)))
                        {
                            _local_4 = battleGetRandomEnemy(_local_1.cList);
                            _local_3 = -1;
                            if (_local_4)
                            {
                                _local_3 = _local_4.battleId;
                            };
                        };
                        battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs2);
                        return;
                    };
                    _local_5 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs2);
                    if (((_local_5) && (_local_5.slot)))
                    {
                        battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_5.slot.id);
                        return;
                    };
                };
            };
            if (GamePredef.GLOBAL_SETTING.bs10 > 0)
            {
                if (((_local_2.mp / _local_2.mpMax) * 100) < GamePredef.GLOBAL_SETTING.p7)
                {
                    _local_6 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs10);
                    if (((_local_6) && (_local_6.slot)))
                    {
                        battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_6.slot.id);
                        return;
                    };
                };
            };
            if (GamePredef.GLOBAL_SETTING.bs4 > 0)
            {
                _local_7 = battleGetGroupPlayerList(_local_1.cList);
                for each (_local_8 in _local_7)
                {
                    if (((_local_8.hp / _local_8.hpMax) * 100) < GamePredef.GLOBAL_SETTING.p8)
                    {
                        _local_3 = _local_8.battleId;
                        if (GamePredef.GLOBAL_SETTING.bt4 == GamePredef.TBL_SKILL)
                        {
                            _local_4 = null;
                            if (((GamePredef.GLOBAL_SETTING.bs4) && (GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs4].targetType == SKILL_TARGET_TYPE_ENEMEY)))
                            {
                                _local_4 = battleGetRandomEnemy(_local_1.cList);
                                _local_3 = -1;
                                if (_local_4)
                                {
                                    _local_3 = _local_4.battleId;
                                };
                            };
                            battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs4);
                            return;
                        };
                        _local_9 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs4);
                        if (((_local_9) && (_local_9.slot)))
                        {
                            battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_9.slot.id);
                            return;
                        };
                    };
                };
            };
            if (GamePredef.GLOBAL_SETTING.bs6 > 0)
            {
                _local_10 = battleGetGroupPetList(_local_1.cList);
                for each (_local_11 in _local_10)
                {
                    if (((_local_11.hp / _local_11.hpMax) * 100) < GamePredef.GLOBAL_SETTING.p9)
                    {
                        _local_3 = _local_11.battleId;
                        if (GamePredef.GLOBAL_SETTING.bt6 == GamePredef.TBL_SKILL)
                        {
                            _local_4 = null;
                            if (((GamePredef.GLOBAL_SETTING.bs6) && (GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs6].targetType == SKILL_TARGET_TYPE_ENEMEY)))
                            {
                                _local_4 = battleGetRandomEnemy(_local_1.cList);
                                _local_3 = -1;
                                if (_local_4)
                                {
                                    _local_3 = _local_4.battleId;
                                };
                            };
                            battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs6);
                            return;
                        };
                        _local_12 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs6);
                        if (((_local_12) && (_local_12.slot)))
                        {
                            battleCmd(_local_3, GamePredef.BATTLE_ACTION_ITEM, _local_12.slot.id);
                            return;
                        };
                    };
                };
            };
            if (GamePredef.BATTLE_AUTO_DEFENSE_PET)
            {
                battleCmd(-1, GamePredef.BATTLE_ACTION_DEFENCE, -1);
                return;
            };
            _local_4 = battleGetRandomEnemy(_local_1.cList);
            _local_3 = -1;
            if (_local_4)
            {
                _local_3 = _local_4.battleId;
            };
            if (GamePredef.GLOBAL_SETTING.bs8 > 0)
            {
                _local_13 = GameData.d[GamePredef.TBL_SKILL][GamePredef.GLOBAL_SETTING.bs8];
                _local_14 = true;
                _local_15 = "";
                _local_16 = "";
                if (((_local_13.useMp >= 1) && (_local_2.mp < _local_13.useMp)))
                {
                    _local_14 = false;
                    _local_15 = "mp";
                };
                if (((_local_13.useMp > 0) && (_local_13.useMp < 1)))
                {
                    if (_local_13.useMp > (_local_2.mp / _local_2.mpMax))
                    {
                        _local_14 = false;
                        _local_15 = "mp";
                    };
                };
                if (((_local_13.useHp >= 1) && (_local_2.hp < _local_13.useHp)))
                {
                    _local_14 = false;
                    _local_16 = "hp";
                };
                if (((_local_13.useHp > 0) && (_local_13.useHp < 1)))
                {
                    if (_local_13.useHp > (_local_2.hp / _local_2.hpMax))
                    {
                        _local_14 = false;
                        _local_16 = "hp";
                    };
                };
                if (!_local_14)
                {
                    if (((_local_15 == "mp") && (_local_16 == "")))
                    {
                        _core.sysMidNote(Language.AUTOBATTLECANVA_U[7]);
                    };
                    if (((_local_16 == "hp") && (_local_15 == "")))
                    {
                        _core.sysMidNote(Language.AUTOBATTLECANVA_U[8]);
                    };
                    if (((_local_16 == "hp") && (_local_15 == "mp")))
                    {
                        _core.sysMidNote(Language.AUTOBATTLECANVA_U[9]);
                    };
                };
                if (((_local_13) && (_local_14)))
                {
                    switch (Number(_local_13.type))
                    {
                        case GamePredef.SKILL_TYPE_DEFENDER:
                            _local_4 = battleGetRandomTeam(_local_1.cList);
                            if (_local_4)
                            {
                                _local_3 = _local_4.battleId;
                            };
                            break;
                        case GamePredef.SKILL_TYPE_CLOSE:
                            if (!isFrontPos(_local_2.battleId))
                            {
                                _local_4 = battleGetRandomFrontEnemy(_local_1.cList);
                            }
                            else
                            {
                                _local_4 = battleGetRandomEnemy(_local_1.cList);
                            };
                            if (_local_4)
                            {
                                _local_3 = _local_4.battleId;
                            };
                            break;
                    };
                    battleCmd(_local_3, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs8);
                    return;
                };
            }
            else
            {
                if (!isFrontPos(_local_2.battleId))
                {
                    _local_4 = battleGetRandomFrontEnemy(_local_1.cList);
                    if (_local_4)
                    {
                        _local_3 = _local_4.battleId;
                    };
                };
                battleCmd(_local_3, GamePredef.BATTLE_ACTION_ATTACK, 0);
                return;
            };
            if (!isFrontPos(_local_2.battleId))
            {
                _local_4 = battleGetRandomFrontEnemy(_local_1.cList);
                if (_local_4)
                {
                    _local_3 = _local_4.battleId;
                };
            };
            battleCmd(_local_3, GamePredef.BATTLE_ACTION_ATTACK, 0);
        }

        private function updateUI():void
        {
            _core.view.getUI(ViewManager.MAIN_SELF).update();
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).refreshBuffPerBattle();
        }

        public function battleGetHLine(_arg_1:Number, _arg_2:Object):Array
        {
            var _local_3:Point = BATTLE_POS[_arg_1];
            var _local_4:Array = BATTLE_ID[_local_3.y];
            var _local_5:Array = [];
            var _local_6:Array = [];
            _local_6[0] = _arg_1;
            _local_6[1] = _local_4[(_local_3.x - 1)];
            _local_6[2] = _local_4[(_local_3.x + 1)];
            _local_6[3] = _local_4[(_local_3.x - 2)];
            _local_6[4] = _local_4[(_local_3.x + 2)];
            _local_6[5] = _local_4[(_local_3.x - 3)];
            _local_6[6] = _local_4[(_local_3.x + 3)];
            _local_6[7] = _local_4[(_local_3.x - 4)];
            _local_6[8] = _local_4[(_local_3.x + 4)];
            var _local_7:int;
            while (_local_7 < 9)
            {
                if (((_local_6[_local_7] > -1) && (_arg_2[_local_6[_local_7]])))
                {
                    _local_5.push(_arg_2[_local_6[_local_7]]);
                };
                _local_7++;
            };
            return (_local_5);
        }

        public function newSeq():void
        {
            _newRoundTime = new Date().getTime();
        }

        public function battleGetPlayerPet(_arg_1:Object):Object
        {
            var _local_2:Object;
            var _local_3:Object;
            if (!_core.battlePet)
            {
                return (null);
            };
            for (_local_2 in _arg_1)
            {
                _local_3 = _arg_1[_local_2];
                if ((((((_local_3) && (_local_3.visible)) && (!(_local_3.leftSide))) && (_local_3.gameObject.type == GamePredef.TBL_PET)) && (_local_3.gameObject.id == _core.battlePet.id)))
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        private function restoreUI():void
        {
            var _local_1:*;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Array;
            var _local_8:uint;
            _core.view.show(ViewManager.MAIN_SELF);
            _core.view.show(ViewManager.MAIN_PET);
            _core.view.show(ViewManager.MAIN_GROUP);
            _core.view.show(ViewManager.MAIN_MINIMAP);
            if (!_core.hidesysbar)
            {
                _core.view.show(ViewManager.MAIN_SYS_BTN_BAR);
            };
            _core.view.show(ViewManager.MAIN_AWARD_WARN);
            _core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).restore();
            _core.view.show(ViewManager.STAGE_MAIN);
            _core.view.show(ViewManager.MAIN_DOG_FIGHT);
            _core.view.hideAll(ViewManager.TYPE_PANEL);
            _core.view.show(ViewManager.MAIN_USER_BAR);
            _core.view.show(ViewManager.MAIN_QUEST_GUIDE);
            _core.view.show(ViewManager.MAIN_ACTIVITY);
            _core.view.show(ViewManager.MAIN_LONGBUFF);
            if (((_core.wbMapId) && (_core.player.posMapId == _core.wbMapId)))
            {
                _core.view.show(ViewManager.PANEL_WB_BATTLEAUTO);
                _core.view.show(ViewManager.WB_RANK_CANVAS);
            };
            if (_core.classify < 1)
            {
                _core.view.show(ViewManager.MAIN_ADDICT_WARN);
            };
            _core.view.getUI(ViewManager.MAIN_USER_BAR).setAllSkill(1);
            if (((_core.player) && (_core.player.posMapId == 73)))
            {
                _core.view.show(ViewManager.UI_SHADE);
                _core.view.getUI(ViewManager.SHADE_PVP).showPVPShadePanel2();
            };
            if (((((_core.player) && (_core.player.mapData)) && (_core.player.mapData.templateId)) && (((int(_core.player.mapData.templateId) == 2007) || (int(_core.player.mapData.templateId) == 2008)) || (int(_core.player.mapData.templateId) == 2009))))
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_MAZE_INFO);
                if (((_local_1) && (!(_local_1.visible))))
                {
                    _local_1.visible = true;
                };
                _local_2 = _core.view.getUI(ViewManager.MAIN_SYS);
                if (((_local_2) && (_local_2.sysBtnBar.visible)))
                {
                    _local_2.sysBtnBar.visible = false;
                };
                _local_3 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
                if (((_local_3) && (_local_3.visible)))
                {
                    _local_3.visible = false;
                };
                _local_4 = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
                if (((_local_4) && (_local_4.visible)))
                {
                    _local_4.visible = false;
                };
                _local_5 = _core.view.getUI(ViewManager.MAIN_USER_BAR);
                if (((_local_5) && (_local_5.visible)))
                {
                    _local_5.visible = false;
                };
                _local_6 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_6) && (_local_6.visible)))
                {
                    _local_6.visible = false;
                };
            };
            if (((_core.player) && (_core.player.posMapId == 110)))
            {
                _local_7 = [ViewManager.MAIN_ACTIVITY, ViewManager.MAIN_MINIMAP, ViewManager.MAIN_QUEST_GUIDE];
                for each (_local_8 in _local_7)
                {
                    _local_2 = _core.view.getUI(_local_8);
                    if (_local_2)
                    {
                        if (_local_8 == ViewManager.MAIN_QUEST_GUIDE)
                        {
                            _local_2.hide();
                        }
                        else
                        {
                            _local_2.visible = false;
                        };
                    };
                };
                _local_2 = _core.view.getUI(ViewManager.PANEL_BLOODY_BATTLE_INFO);
                if (_local_2)
                {
                    _local_2.show();
                };
            };
            if (((int(_core.player.level) >= 35) && (_core.replayMCZD)))
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_MCZD);
                _local_2.showPanel();
                _core.replayMCZD = false;
            };
        }

        public function battleOnEnd():void
        {
            var _local_1:Date;
            var _local_2:Number;
            var _local_3:Object;
            this.battleFieldId = null;
            _core = Core.getInstance();
            if (nid > 0)
            {
                _local_1 = new Date();
                _local_2 = ((_local_1.getTime() + ((_local_1.getTimezoneOffset() * 60) * 1000)) - _core.serverTimeOffSet);
                _core.player.lastHitNpc = {
                    "nid":nid,
                    "last":_local_2
                };
            }
            else
            {
                _core.player.lastHitNpc = null;
            };
            _core.state = GamePredef.ST_NORMAL;
            if (_core.view.getUI(ViewManager.STAGE_BATTLE))
            {
                _core.view.getUI(ViewManager.STAGE_BATTLE).endBattle();
            };
            restoreUI();
            updateUI();
            _cmdAry = [];
            if (((_core.player) && (((!(_core.player.inGroup)) || (_core.player.isLeader)) || (_core.player.groupAfk))))
            {
                if (!_core.player.isDead)
                {
                    _core.player.walkable = true;
                    if (_core.player.normalView)
                    {
                        _core.player.normalView.lastCheckTime = new Date().getTime();
                    };
                };
            };
            if (((((_core.player) && (_core.player.mapData)) && (_core.player.mapData.templateId)) && (int(_core.player.mapData.templateId) == 87)))
            {
                _local_3 = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
                if (_local_3)
                {
                    _local_3.visible = true;
                    _local_3.tripleHideUI();
                };
            };
        }

        public function battleGetGroupPlayerList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if ((((((_local_4) && (_local_4.visible)) && (!(_local_4.leftSide))) && (_local_4.gameObject.type == GamePredef.TBL_CHARACTOR)) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4);
                };
            };
            return (_local_2);
        }

        public function battleGetVNeighbor(_arg_1:Number, _arg_2:Object):Object
        {
            var _local_3:int = battleGetVNeighborBid(_arg_1);
            return (_arg_2[_local_3]);
        }

        public function battleGetVLine(_arg_1:Number, _arg_2:Object):Array
        {
            var _local_3:Point = BATTLE_POS[_arg_1];
            var _local_4:Object = _arg_2[_arg_1];
            var _local_5:Object = battleGetVNeighbor(_arg_1, _arg_2);
            var _local_6:Array = [];
            if (_local_5)
            {
                _local_6.push(_local_5);
            };
            _local_6.push(_local_4);
            if (_local_5)
            {
                trace(_local_5.battleId);
            };
            return (_local_6);
        }

        private function sendNow():void
        {
            _lastCmd = _cmdAry;
            _core = Core.getInstance();
            _core.remote.battleUpdateCmd(_cmdAry);
            _cmdAry = [];
        }

        public function battleGetRandomFrontEnemy(_arg_1:Object):Object
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if ((((((_local_4) && (_local_4.visible)) && (_local_4.leftSide)) && (!(_local_4.isDead()))) && (!(isBehindSomeOne(_local_4.battleId, _arg_1)))))
                {
                    _local_2.push(_local_4);
                };
            };
            if (_local_2.length > 0)
            {
                return (_local_2[int((Math.random() * _local_2.length))]);
            };
            return (null);
        }

        public function isFrontPos(_arg_1:int):Boolean
        {
            var _local_2:Point = BATTLE_POS[_arg_1];
            if (((_local_2.y == 1) || (_local_2.y == 2)))
            {
                return (true);
            };
            return (false);
        }

        private function battleSendCmd():void
        {
            if (_sending)
            {
                return;
            };
            var _local_1:Object = _core.view.getUI(ViewManager.STAGE_BATTLE);
            _local_1.cPlayerCmd.hide();
            _local_1.cPetCmd.hide();
            _local_1.cTime.hide();
            _local_1.skillCanvas.text = Language.BATTLE_S[0];
            _core.cmdState = GamePredef.ST_BATTLE_WAIT;
            _core.view.hide(ViewManager.MAIN_USER_BAR);
            var _local_2:Number = (new Date().getTime() - _newRoundTime);
            if (_local_2 < BATTLE_SEND_DELAY)
            {
                _sending = true;
                setTimeout(sendLater, (BATTLE_SEND_DELAY - _local_2));
            }
            else
            {
                sendNow();
            };
        }

        public function isBehindSomeOne(_arg_1:Number, _arg_2:Object):Boolean
        {
            if (isFrontPos(_arg_1))
            {
                return (false);
            };
            var _local_3:Object = battleGetVNeighbor(_arg_1, _arg_2);
            if ((((_local_3) && (!(_local_3.isDead()))) && (_local_3.visible)))
            {
                return (true);
            };
            return (false);
        }

        public function battleGetRandomEnemy(_arg_1:Object):Object
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if (((((_local_4) && (_local_4.visible)) && (_local_4.leftSide)) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4);
                };
            };
            if (_local_2.length > 0)
            {
                return (_local_2[int((Math.random() * _local_2.length))]);
            };
            return (null);
        }

        public function battleGetFrontRandomEnemy(_arg_1:Object):Object
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if (((((_local_4) && (_local_4.visible)) && (_local_4.leftSide)) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4);
                };
            };
            if (_local_2.length > 0)
            {
                return (_local_2[int((Math.random() * _local_2.length))]);
            };
            return (null);
        }

        public function battleGetVNeighborPos(_arg_1:Number):Point
        {
            var _local_2:int = battleGetVNeighborBid(_arg_1);
            return (BATTLE_POS[_local_2]);
        }

        public function newRound():void
        {
            _sending = false;
        }

        private function hideUI():void
        {
            _core.view.hide(ViewManager.MAIN_TARGET);
            _core.view.hide(ViewManager.MAIN_SELF);
            _core.view.hide(ViewManager.MAIN_PET);
            _core.view.hide(ViewManager.MAIN_GROUP);
            _core.view.hide(ViewManager.MAIN_MINIMAP);
            _core.view.hide(ViewManager.MAIN_SYS_BTN_BAR);
            _core.view.hide(ViewManager.MAIN_AWARD_WARN);
            _core.view.hide(ViewManager.MAIN_TEMP_BAG_WARN);
            _core.view.hide(ViewManager.STAGE_MAIN);
            _core.view.hide(ViewManager.MAIN_DOG_FIGHT);
            _core.view.hideAll(ViewManager.TYPE_PANEL);
            _core.view.getUI(ViewManager.MAIN_USER_BAR).setAllSkill(2);
            _core.view.hide(ViewManager.MAIN_QUEST_GUIDE);
            _core.view.hide(ViewManager.PANEL_WB_BATTLEAUTO);
            _core.view.hide(ViewManager.WB_RANK_CANVAS);
            _core.view.hide(ViewManager.MAIN_ADDICT_WARN);
            _core.view.hide(ViewManager.MAIN_LINE);
            _core.view.hide(ViewManager.POPU_STAR_INSTACE_MAP);
            _core.view.hide(ViewManager.MAIN_ACTIVITY);
            _core.view.hide(ViewManager.MAIN_LONGBUFF);
            _core.view.hide(ViewManager.UI_SHADE);
            _core.view.hide(ViewManager.PANEL_PET_SOUL);
            _core.view.hide(ViewManager.POPU_SOUL_PRODUCT);
            _core.view.hide(ViewManager.PANEL_PET_STONE);
        }

        public function battleGetRandomTeam(_arg_1:Object):Object
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if (((((_local_4) && (_local_4.visible)) && (!(_local_4.leftSide))) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4);
                };
            };
            if (_local_2.length > 0)
            {
                return (_local_2[int((Math.random() * _local_2.length))]);
            };
            return (null);
        }

        public function battleGetGroupList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if (((((_local_4) && (_local_4.visible)) && (!(_local_4.leftSide))) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4.battleId);
                };
            };
            return (_local_2);
        }

        public function battleGetRandom(_arg_1:Number, _arg_2:Object, _arg_3:int):Array
        {
            var _local_7:Object;
            var _local_8:Object;
            var _local_4:int = (_arg_3 - 1);
            var _local_5:Object = _arg_2[_arg_1];
            var _local_6:Array = [];
            for (_local_7 in _arg_2)
            {
                _local_8 = _arg_2[_local_7];
                if ((((((_local_8) && (_local_8.visible)) && (_local_8.sameGroup(_local_5))) && (!(_local_8.battleId == _arg_1))) && (!(_local_8.isDead()))))
                {
                    if (_local_4-- > 0)
                    {
                        _local_6.push(_local_8);
                    };
                };
            };
            _local_6.push(_local_5);
            return (_local_6);
        }

        public function battleGetCross(_arg_1:Number, _arg_2:Object):Array
        {
            var _local_3:Point = BATTLE_POS[_arg_1];
            var _local_4:Object = _arg_2[_arg_1];
            var _local_5:Object = battleGetVNeighbor(_arg_1, _arg_2);
            var _local_6:Object = _arg_2[BATTLE_ID[_local_3.y][(_local_3.x - 1)]];
            var _local_7:Object = _arg_2[BATTLE_ID[_local_3.y][(_local_3.x - -1)]];
            var _local_8:Array = [];
            if (_local_5)
            {
                _local_8.push(_local_5);
            };
            if (_local_6)
            {
                _local_8.push(_local_6);
            };
            if (_local_7)
            {
                _local_8.push(_local_7);
            };
            _local_8.push(_local_4);
            return (_local_8);
        }

        private function sendLater():void
        {
            _sending = false;
            battleSendCmd();
        }

        public function battleGetEnemyList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if (((((_local_4) && (_local_4.visible)) && (_local_4.leftSide)) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4);
                };
            };
            return (_local_2);
        }

        public function battleCmd(_arg_1:Number, _arg_2:int, _arg_3:Number=-1, _arg_4:int=-1):void
        {
            var _local_5:Object;
            var _local_6:Boolean;
            _core = Core.getInstance();
            _core.view.hide(ViewManager.PANEL_SKILLMANAGER);
            _core.view.hide(ViewManager.PANEL_BAG);
            if (_core.view.getUI(ViewManager.MAIN_TARGET_SELECT))
            {
                _local_5 = _core.view.getUI(ViewManager.MAIN_TARGET_SELECT);
                if (((_local_5) && ((_local_5 as DisplayObject).visible)))
                {
                    _core.view.restoreUI();
                };
            };
            if (((_lastCmd) && (_arg_2 == GamePredef.BATTLE_ACTION_AUTO)))
            {
                _cmdAry = _lastCmd;
                battleSendCmd();
                return;
            };
            _cmdAry.push({
                "tid":_arg_1,
                "action":_arg_2,
                "id":_arg_3,
                "level":_arg_4
            });
            if (_cmdAry.length >= 2)
            {
                battleSendCmd();
                return;
            };
            _local_5 = _core.view.getUI(ViewManager.STAGE_BATTLE);
            _local_5.cPlayerCmd.hide();
            if (!_core.battlePet)
            {
                battleSendCmd();
            }
            else
            {
                _local_6 = _local_5.petActive;
                if (_local_6)
                {
                    _core.view.getUI(ViewManager.MAIN_USER_BAR).setAllSkill(3);
                    _local_5.cPetCmd.show();
                }
                else
                {
                    battleSendCmd();
                };
            };
        }

        public function battleOnStart(_arg_1:Object, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            this.battleFieldId = _arg_1.battleFieldId;
            this.nid = ((_arg_1.nid) ? _arg_1.nid : 0);
            _core = Core.getInstance();
            _core.state = GamePredef.ST_CORE_BATTLE;
            _core.player.normalView.pause();
            _core.player.walkable = false;
            _core.player.normalView.lastCheckPoint = new Point(_core.player.normalView.posX, _core.player.normalView.posY);
            hideUI();
            var _local_4:Object = _core.view.getUI(ViewManager.MAIN_BATTLE_PLAYER);
            ((_local_4) && (_local_4.needToShow = (!(_arg_3))));
            var _local_5:* = _core.view.getUI(ViewManager.STAGE_BATTLE);
            _local_5.startBattle(_arg_1, _arg_2, _arg_3);
            _cmdAry = [];
            _newRoundTime = (new Date().getTime() - BATTLE_SEND_DELAY);
            _sending = false;
        }

        public function battleGetTargetList(_arg_1:Object, _arg_2:int, _arg_3:Object, _arg_4:Object, _arg_5:int):Array
        {
            var _local_6:Array;
            var _local_9:Object;
            switch (Number(_arg_5))
            {
                case BATTLE_AREA_TYPE_V:
                    _local_6 = battleGetVLine(_arg_4.battleId, _arg_1);
                    break;
                case BATTLE_AREA_TYPE_H:
                    _local_6 = battleGetHLine(_arg_4.battleId, _arg_1);
                    break;
                case BATTLE_AREA_TYPE_C:
                    _local_6 = battleGetCross(_arg_4.battleId, _arg_1);
                    break;
                case BATTLE_AREA_TYPE_R:
                    _local_6 = battleGetRandom(_arg_4.battleId, _arg_1, _arg_2);
                    break;
                default:
                    _local_6 = battleGetRandom(_arg_4.battleId, _arg_1, _arg_2);
            };
            var _local_7:Array = [];
            var _local_8:int;
            while (_local_8 < _arg_2)
            {
                _local_9 = _local_6[_local_8];
                if ((((_local_9) && (!(_local_9.isDead()))) && (_local_9.visible)))
                {
                    _local_7.push(_local_9);
                };
                _local_8++;
            };
            return (_local_7);
        }

        private function _aidPet(_arg_1:Number):Boolean
        {
            var _local_7:Object;
            var _local_2:Boolean;
            var _local_3:Object = _core.data.getGameData(GamePredef.TBL_SKILL, GamePredef.GLOBAL_SETTING.bs5);
            var _local_4:Object = _core.battle.battleGetPlayerPet(_core.view.getUI(ViewManager.STAGE_BATTLE).cList);
            var _local_5:Boolean = ((!(null == _local_3)) && (_local_3.targetType == Battle.SKILL_TARGET_TYPE_SELF_PET));
            var _local_6:Boolean = (((_local_5) && (!(null == _local_4))) && (_local_4.battleId == _arg_1));
            if (GamePredef.GLOBAL_SETTING.bt5 == GamePredef.TBL_SKILL)
            {
                if (((!(_local_5)) || (_local_6)))
                {
                    battleCmd(_arg_1, GamePredef.BATTLE_ACTION_SKILL, GamePredef.GLOBAL_SETTING.bs5);
                    _local_2 = true;
                };
            }
            else
            {
                _local_7 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, GamePredef.GLOBAL_SETTING.bs5);
                if (((_local_7) && (_local_7.slot)))
                {
                    battleCmd(_arg_1, GamePredef.BATTLE_ACTION_ITEM, _local_7.slot.id);
                    _local_2 = true;
                };
            };
            return (_local_2);
        }

        public function battleGetVNeighborBid(_arg_1:Number):int
        {
            var _local_3:int;
            var _local_2:Point = BATTLE_POS[_arg_1];
            if (((_local_2.y == 0) || (_local_2.y == 2)))
            {
                _local_3 = BATTLE_ID[(_local_2.y - -1)][_local_2.x];
            }
            else
            {
                _local_3 = BATTLE_ID[(_local_2.y - 1)][_local_2.x];
            };
            return (_local_3);
        }

        public function battleGetGroupPetList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if ((((((_local_4) && (_local_4.visible)) && (!(_local_4.leftSide))) && (_local_4.gameObject.type == GamePredef.TBL_PET)) && (!(_local_4.isDead()))))
                {
                    _local_2.push(_local_4);
                };
            };
            return (_local_2);
        }


    }
}//package com.qeedoo.game.logic

