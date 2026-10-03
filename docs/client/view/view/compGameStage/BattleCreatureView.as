// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.BattleCreatureView

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.ui.view.comp.TipBattle;
    import flash.display.DisplayObject;
    import com.qeedoo.ui.view.comp.ScrollText;
    import com.qeedoo.ui.view.compBattle.BattleStage;
    import flash.display.Sprite;
    import com.qeedoo.ui.view.comp.PropBar;
    import com.qeedoo.game.system.Core;
    import flash.geom.Point;
    import com.qeedoo.game.resource.AbstractGameRes;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.object.Pet;
    import com.qeedoo.game.object.Player;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.game.object.Creature;
    import flash.filters.GlowFilter;
    import com.qeedoo.effects.EnterFrameMove;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.resource.Loader10;
    import com.qeedoo.game.logic.Battle;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.game.data.GameData;
    import flash.net.URLRequest;
    import mx.effects.Fade;
    import mx.events.EffectEvent;
    import mx.core.UIComponent;
    import com.qeedoo.game.view.ICreatureView;
    import com.qeedoo.effects.AlphaResize;
    import com.qeedoo.ui.view.comp.TipCre;
    import com.qeedoo.ui.view.comp.BasicToolTip;

    public class BattleCreatureView extends CreatureView 
    {

        public static const BH_DODGE:uint = 10140;
        public static const BH_DODGE_COOL:uint = 10150;
        public static const BH_RELIVE:uint = 12000;
        public static const BH_POSITION:uint = 14000;
        public static const BH_RETURN:uint = 15000;
        public static const BH_SUMMON:uint = 16000;
        public static const BH_RETURNED:uint = 17000;
        public static const BH_SUMMONED:uint = 18000;
        public static const BH_DEFENDED:uint = 19000;
        public static var cmdMode:Boolean = true;
        private static var _battleToolTip:TipBattle;

        protected var _buffDict:Object;
        private var criticalEffectRoute:Array = [3, -2, 1];
        private var creatureCloud:DisplayObject = null;
        protected var _scrollText:ScrollText;
        protected var _battleDir:int;
        private var _dead:Boolean;
        private var _showProp:Boolean;
        private var _battleField:BattleStage;
        protected var _buffContainer:Sprite;
        protected var _mpBar:PropBar;
        protected var _spBar:PropBar;
        private var _core:Core;
        protected var _barContainer:Sprite;
        public var isAirBattle:Boolean;
        public var isWatch:Boolean;
        protected var _guest:Boolean;
        protected var _hpBar:PropBar;
        private var _waitIcon:DisplayObject;
        protected var _battlePos:Point;

        public function BattleCreatureView(_arg_1:Boolean, _arg_2:*)
        {
            this.isAirBattle = _arg_1;
            this.isWatch = _arg_2;
            addBattleUI();
        }

        public static function set moveSpeedBattle(_arg_1:int):void
        {
            MOVE_SPEED_BATTLE = _arg_1;
        }


        public function set showProp(v:Boolean):void
        {
            if (v)
            {
                addChild(_barContainer);
            }
            else
            {
                try
                {
                    removeChild(_barContainer);
                }
                catch(e:Object)
                {
                };
            };
        }

        public function showSkillArea(_arg_1:Object):void
        {
            var _local_3:BattleCreatureView;
            var _local_2:Array = _core.battle.battleGetTargetList(_battleField.cList, _arg_1.targetNum, _core.player.view, this, _arg_1.areaAttack);
            for each (_local_3 in _local_2)
            {
                if (_local_3.visible)
                {
                    _local_3.showBlue();
                };
            };
        }

        private function setInitBehavior():void
        {
            var _local_1:Function;
            if (_dead)
            {
                _local_1 = _callBack;
                _callBack = null;
                behavior(AbstractGameRes.BH_DEAD);
                _callBack = _local_1;
            };
        }

        public function get leftSide():Boolean
        {
            if (_battlePos.x < (GamePredef.APP_WIDTH_OLD / 2))
            {
                return (true);
            };
            return (false);
        }

        public function set battlePos(_arg_1:Point):void
        {
            _battlePos = _arg_1;
        }

        private function closeToTarget(_arg_1:Number, _arg_2:BattleCreatureView):void
        {
            if (((!(_gameObject)) || (!(_arg_2))))
            {
                behaviorEnd();
                return;
            };
            var _local_3:Number = ToolKit.getDisByXY(posX, posY, _arg_2.posX, _arg_2.posY);
            if (_local_3 < GamePredef.VALID_DIS_BATTLE_CLOSETO)
            {
                behavior(AbstractGameRes.BH_BREATH_SLOW);
                behaviorEnd();
                return;
            };
            _speed = _arg_1;
            _gameObject.battleRouteTo(_arg_2.posX, _arg_2.posY);
        }

        private function addBattleUI():void
        {
            _core = Core.getInstance();
            _barContainer = new Sprite();
            _buffContainer = new Sprite();
            _hpBar = new PropBar();
            _mpBar = new PropBar();
            _spBar = new PropBar();
            _hpBar.frontColor = GamePredef.PROPERTY_COLOR_HP;
            _mpBar.frontColor = GamePredef.PROPERTY_COLOR_MP;
            _spBar.frontColor = GamePredef.PROPERTY_COLOR_SP;
            _mpBar.y = ((_hpBar.y + _hpBar.height) - 1);
            _spBar.y = ((_mpBar.y + _mpBar.height) - 1);
            _barContainer.addChild(_hpBar);
            _barContainer.addChild(_mpBar);
            _barContainer.addChild(_spBar);
            addChild(_buffContainer);
            _isBattleView = true;
            _waitIcon = new ((ResManager.BATTLE_CMD as Class))();
            _waitIcon.visible = false;
            addChild(_waitIcon);
            _scrollText = new ScrollText();
            addChild(_scrollText);
            _speed = MOVE_SPEED_BATTLE;
            _buffDict = {};
            showProp = true;
            if (isWatch)
            {
                _hpBar.visible = false;
                _mpBar.visible = false;
                _spBar.visible = false;
            };
        }

        public function get hp():Number
        {
            return (_hpBar.value);
        }

        public function turnBack():void
        {
            if (_gameObject.battleId < 10)
            {
                faceTo(((_guest) ? 5 : 1));
            }
            else
            {
                faceTo(((_guest) ? 1 : 5));
            };
        }

        override protected function setName():void
        {
            if (((_gameObject.hasOwnProperty("gmLevel")) && (_gameObject.gmLevel > 0)))
            {
                _namePrefix = "GM-";
                _textName.textColor = 0xFF00;
            }
            else
            {
                _namePrefix = "";
            };
            _textName.text = (_namePrefix + _gameObject.name);
            _textName.x = (-(_textName.textWidth) / 2);
            if (!(_gameObject is Pet))
            {
                if (!(_gameObject is Player))
                {
                    if (!(_gameObject is Charactor))
                    {
                        if ((_gameObject is Creature))
                        {
                            _textName.text = _textName.text.split("【")[0];
                            _gameObject.name = _textName.text;
                        };
                    };
                };
            };
        }

        public function clearColor():void
        {
            var _local_1:Array;
            var _local_2:Object;
            if (_resLoader)
            {
                _resLoader.filters = [];
            };
            if ((((_cg) && (_cg.filters)) && (_cg.filters.length >= 1)))
            {
                _local_1 = new Array();
                for each (_local_2 in _cg.filters)
                {
                    _local_1.push(_local_2);
                };
                while (((_local_1.length > 0) && (_local_1[(_local_1.length - 1)] is GlowFilter)))
                {
                    _local_1.pop();
                };
                _cg.filters = _local_1;
            };
        }

        public function set hp(_arg_1:Number):void
        {
            _hpBar.value = _arg_1;
        }

        private function dodgeEndHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(EnterFrameMove.EFFECT_END, dodgeEndHandler);
            dodgeBack();
            alpha = 1;
        }

        private function checkCatchValid():Boolean
        {
            return (((_gameObject.level - 5) < _core.player.level) && (leftSide));
        }

        public function battleBehavior(_arg_1:int, _arg_2:BattleCreatureView=null):void
        {
            var _local_4:Number;
            var _local_5:Creature;
            var _local_6:Point;
            if (!_gameObject)
            {
                behaviorEnd();
                return;
            };
            var _local_3:* = _core.view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
            if (((_local_3) && (_local_3.visible)))
            {
                _local_3.hide();
            };
            switch (_arg_1)
            {
                case AbstractGameRes.BH_RUN_FAST:
                    if (_arg_2)
                    {
                        closeToTarget(MOVE_SPEED_BATTLE, _arg_2);
                    }
                    else
                    {
                        behaviorEnd();
                    };
                    return;
                case AbstractGameRes.BH_RUN_NORMAL:
                    if (_arg_2)
                    {
                        closeToTarget(MOVE_SPEED_NORMAL, _arg_2);
                    }
                    else
                    {
                        behaviorEnd();
                    };
                    return;
                case AbstractGameRes.BH_ATTACK:
                    behavior(AbstractGameRes.BH_ATTACK);
                    return;
                case AbstractGameRes.BH_MAGIC:
                    behavior(AbstractGameRes.BH_MAGIC);
                    return;
                case AbstractGameRes.BH_HURT:
                    behavior(AbstractGameRes.BH_HURT);
                    return;
                case AbstractGameRes.BH_DEAD:
                    behavior(AbstractGameRes.BH_DEAD);
                    return;
                case AbstractGameRes.BH_BACK:
                    _local_4 = MOVE_SPEED_BATTLE;
                    if (hp <= 0)
                    {
                        _local_4 = MOVE_SPEED_POSITION;
                    };
                    moveToPoint(_local_4, _battlePos.x, _battlePos.y);
                    if (((_wing_cg) && (!(_wing_cg.visible))))
                    {
                        _wing_cg.visible = true;
                    };
                    return;
                case AbstractGameRes.BH_BREATH_SLOW:
                    behavior(AbstractGameRes.BH_BREATH_SLOW);
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_DEFENCE:
                    behavior(AbstractGameRes.BH_DEFENCE);
                    return;
                case AbstractGameRes.BH_TURNBACK:
                    behavior(AbstractGameRes.BH_BREATH_SLOW);
                    turnBack();
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_TURNTO:
                    behavior(AbstractGameRes.BH_BREATH_SLOW);
                    if (_arg_2)
                    {
                        faceToTarget(_arg_2);
                    };
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_DIE:
                    trace("BH_DIE");
                    fadeOut();
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_CATCHED:
                    fadeOut();
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_CHECKESC:
                    if (((_gameObject.isSelf) && (_gameObject.state == GamePredef.ST_NORMAL)))
                    {
                        _core.state = GamePredef.ST_NORMAL;
                        _core.player.inBattle = false;
                        _core.battle.battleOnEnd();
                        _core.remote.battleEscaped();
                        if (!_core.player.groupAfk)
                        {
                            _core.remote.groupLeave();
                        };
                        _core.remote.battlePlayEnd();
                    };
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_ESCAPE:
                    _local_5 = (_gameObject as Creature);
                    trace(((("AbstractGameRes.BH_ESCAPE: " + _local_5.name) + " , ") + _local_5.currentHp));
                    if (_local_5.currentHp <= 0)
                    {
                        behaviorEnd();
                    }
                    else
                    {
                        _local_6 = getEscPoint();
                        moveToPoint(MOVE_SPEED_ESCAPE, _local_6.x, _local_6.y);
                    };
                    return;
                case AbstractGameRes.BH_ESCAPED:
                    fadeOut();
                    behaviorEnd();
                    return;
                case AbstractGameRes.BH_NOTHING:
                    return;
                case AbstractGameRes.BH_RUSH:
                    if (_arg_2 == null)
                    {
                        behaviorEnd();
                        return;
                    };
                    _speed = MOVE_SPEED_RUSH;
                    _gameObject.battleRouteTo(_arg_2.posX, _arg_2.posY);
                    return;
                case BH_DODGE:
                    dodge();
                    return;
                case BH_DODGE_COOL:
                    dodgeCool();
                    return;
                case BH_RELIVE:
                    relive();
                    return;
                case BH_POSITION:
                    if (_arg_2 == null)
                    {
                        behaviorEnd();
                        return;
                    };
                    position(_arg_2);
                    return;
                case BH_RETURN:
                    behavior(AbstractGameRes.BH_MAGIC);
                    return;
                case BH_SUMMON:
                    behavior(AbstractGameRes.BH_MAGIC);
                    return;
                case BH_RETURNED:
                    returned();
                    return;
                case BH_SUMMONED:
                    summon();
                    return;
                case BH_DEFENDED:
                    defended();
                    return;
                default:
                    behaviorEnd();
            };
        }

        override protected function addVisibleTimer():void
        {
        }

        public function position(_arg_1:BattleCreatureView):void
        {
            var _local_2:Point = _battlePos;
            _battlePos = _arg_1.battlePos;
            _arg_1.battlePos = _local_2;
            var _local_3:EnterFrameMove = new EnterFrameMove();
            _local_3.target = this;
            _local_3.stepLength = MOVE_SPEED_POSITION;
            _local_3.xBy = (_battlePos.x - posX);
            _local_3.yBy = (_battlePos.y - posY);
            _local_3.play(true);
            var _local_4:EnterFrameMove = new EnterFrameMove();
            _local_4.target = _arg_1;
            _local_4.stepLength = MOVE_SPEED_POSITION;
            _local_4.xBy = (_arg_1.battlePos.x - _arg_1.posX);
            _local_4.yBy = (_arg_1.battlePos.y - _arg_1.posY);
            _local_4.play(true);
            _local_3.addEventListener(EnterFrameMove.EFFECT_END, positionEndHandler);
        }

        private function summonEnd(_arg_1:TimerEvent):void
        {
            behaviorEnd();
        }

        private function clearDefault():void
        {
            _sprite.callBack = null;
        }

        public function get hpMax():int
        {
            return (_hpBar.valueMax);
        }

        public function getEscPointBySide(_arg_1:Boolean):Point
        {
            if (_arg_1)
            {
                return (new Point((posX + 30), (posY + 30)));
            };
            return (new Point((posX - 30), (posY - 30)));
        }

        public function clearBuff():void
        {
            var _local_1:Object;
            var _local_2:Loader10;
            for (_local_1 in _buffDict)
            {
                _local_2 = Loader10(_buffDict[_local_1]);
                _local_2.unload();
                _buffContainer.removeChild(_local_2);
                delete _buffDict[_local_1];
            };
        }

        public function set mp(_arg_1:Number):void
        {
            _mpBar.value = _arg_1;
        }

        private function createToolTip():TipBattle
        {
            var _local_1:TipBattle = TipBattle(_core.view.getUI(ViewManager.TOOLTIP_BATTLE));
            _local_1.show(infoObj);
            return (_local_1);
        }

        private function setBarPos():void
        {
            var _local_1:int;
            if (isAirBattle)
            {
                _local_1 = -(GamePredef.FLIGHT_HEIGHT);
            };
            if (_cg)
            {
                _sprite = _cg;
            };
            _barContainer.y = (((_sprite.y + _sprite.headY) - 10) + _local_1);
            _barContainer.x = (-(_barContainer.width) / 2);
            _waitIcon.x = ((-(_waitIcon.width) / 2) + 15);
            _waitIcon.y = (((_sprite.y + _sprite.headY) - 20) + _local_1);
            _sprite.callBack = _battleField.nextActionRound;
            _scrollText.y = (((_sprite.y + _sprite.headY) - 55) + _local_1);
            _buffContainer.x = (-(_buffContainer.width) / 2);
            _buffContainer.y = (((_sprite.y + _sprite.headY) - 30) + _local_1);
        }

        override protected function resLoadCompleteHandler(_arg_1:Event):void
        {
            applyRes(_arg_1);
        }

        public function get behindSomeOne():Boolean
        {
            if (frontPos)
            {
                return (false);
            };
            var _local_1:BattleCreatureView = BattleCreatureView(_core.battle.battleGetVNeighbor(_gameObject.battleId, _battleField.cList));
            if ((((_local_1) && (!(_local_1.isDead()))) && (_local_1.visible)))
            {
                return (true);
            };
            return (false);
        }

        override public function behavior(_arg_1:int, _arg_2:int=0):void
        {
            var _local_3:int = -1;
            if (_sprite)
            {
                _local_3 = _sprite.behavior;
                _sprite.behavior = _arg_1;
            };
            if (_weapon)
            {
                _weapon.behavior = _arg_1;
            };
            if (_cg)
            {
                if (_local_3 < 0)
                {
                    _local_3 = _cg.behavior;
                };
                _cg.behavior = _arg_1;
                _cg.play(((_cg.dir + "-") + _cg.behavior));
            };
            if (_weapon_cg)
            {
                _weapon_cg.behavior = _arg_1;
                _weapon_cg.play(((_weapon_cg.dir + "-") + _weapon_cg.behavior));
            };
            if (_wing_cg)
            {
                if ((((_local_3 > 0) && (_local_3 == AbstractGameRes.BH_RUN_NORMAL)) && (wing_run_lastTune)))
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                    wing_run_lastTune = null;
                }
                else
                {
                    if (_local_3 == AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = true;
                    };
                };
                if ((((_arg_1 == AbstractGameRes.BH_RUN_NORMAL) && (WING_RUN_OFFSET[_gameObject.resCode])) && (WING_RUN_OFFSET[_gameObject.resCode].wing)))
                {
                    wing_run_lastTune = WING_RUN_OFFSET[_gameObject.resCode][_wing_cg.dir];
                    _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
                }
                else
                {
                    if (_arg_1 == AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = false;
                    };
                };
                _wing_cg.play(((_wing_cg.dir + "-") + _wing_cg.behavior));
            };
        }

        private function checkSkillValid(_arg_1:Object):Boolean
        {
            var _local_2:Object;
            if (!_arg_1)
            {
                return (false);
            };
            switch (Number(_arg_1.targetType))
            {
                case Battle.SKILL_TARGET_TYPE_SELF:
                    if (_core.player.view != this)
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_SELF_PLAYER:
                    if (_core.player.view != this)
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_SELF_PET:
                    if (_gameObject.type != GamePredef.TBL_PET)
                    {
                        return (false);
                    };
                    _local_2 = _core.battlePet;
                    if (!_local_2)
                    {
                        return (false);
                    };
                    if (_gameObject.id != _local_2.id)
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_ENEMEY:
                    if (!leftSide)
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_ENEMEY_PLAYER:
                    if (((!(leftSide)) || (!(_gameObject.type == GamePredef.TBL_CHARACTOR))))
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_ENEMEY_CRE:
                    if (((!(leftSide)) || (!(_gameObject.type == GamePredef.TBL_CREATURE))))
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_ENEMEY_NOBOSS:
                    if (((!(leftSide)) || (_gameObject.bossFlag)))
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_TEAM:
                    if (leftSide)
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_TEAM_PLAYER:
                    if (((leftSide) || (!(_gameObject.type == GamePredef.TBL_CHARACTOR))))
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_TEAM_PET:
                    if (((leftSide) || (!(_gameObject.type == GamePredef.TBL_PET))))
                    {
                        return (false);
                    };
                    break;
                case Battle.SKILL_TARGET_TYPE_ALL:
                    break;
                case Battle.SKILL_TARGET_TYPE_PLAYER:
                    if (_gameObject.type != GamePredef.TBL_CHARACTOR)
                    {
                        return (false);
                    };
                    break;
            };
            if (Number(_arg_1.type) == GamePredef.SKILL_TYPE_CLOSE)
            {
                return (checkAttackValid());
            };
            if (GamePredef.COUPLE_SKILL_CODE.indexOf(_arg_1.codeName) >= 0)
            {
                if (_core.player.cpid != this.gameObject.id)
                {
                    return (false);
                };
            };
            return (true);
        }

        public function showRed():void
        {
            var _local_1:Array;
            var _local_2:Object;
            if (_resLoader)
            {
                _resLoader.filters = [GamePredef.FILTER_NOALLOW_SELECTED];
            };
            if (_cg)
            {
                if (!_cg.filters)
                {
                    _cg.filters = [GamePredef.FILTER_NOALLOW_SELECTED];
                }
                else
                {
                    _local_1 = new Array();
                    for each (_local_2 in _cg.filters)
                    {
                        _local_1.push(_local_2);
                    };
                    _local_1.push(GamePredef.FILTER_NOALLOW_SELECTED);
                    _cg.filters = _local_1;
                };
            };
        }

        private function applyRes(_arg_1:Event):void
        {
            if (((_sprite) && (!(_sprite.behavior == AbstractGameRes.BH_BREATH_SLOW))))
            {
                return;
            };
            if (_deleted)
            {
                return;
            };
            clearDefault();
            super.resLoadCompleteHandler(_arg_1);
            setBarPos();
            setInitBehavior();
            setBattleCloud();
        }

        private function globalBackEffect(_arg_1:Number):void
        {
            _battleField.backEffect(_arg_1);
            behaviorEnd();
        }

        public function get sp():Number
        {
            return (_spBar.value);
        }

        private function dodgeBack():void
        {
            var _local_1:EnterFrameMove = new EnterFrameMove();
            _local_1.target = this;
            _local_1.stepLength = MOVE_SPEED_BATTLE;
            _local_1.xBy = (_battlePos.x - posX);
            _local_1.yBy = (_battlePos.y - posY);
            _local_1.addEventListener(EnterFrameMove.EFFECT_END, dodgeBackEndHandler);
            _local_1.play(true);
        }

        override protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
            var _local_2:uint;
            var _local_3:String;
            if (_battleToolTip)
            {
                destroyToolTip(_battleToolTip);
            };
            if (!cmdMode)
            {
                return;
            };
            super.mouseDownHandler(_arg_1);
            _core.view.restoreUI();
            clearAllColor();
            switch (_core.cmdState)
            {
                case GamePredef.ST_BATTLE_ATTACK:
                    if (!checkAttackValid())
                    {
                        return;
                    };
                    _core.battle.battleCmd(_gameObject.battleId, GamePredef.BATTLE_ACTION_ATTACK, 0);
                    return;
                case GamePredef.ST_BATTLE_SKILL:
                    if (!checkSkillValid(_core.skill))
                    {
                        return;
                    };
                    _core.battle.battleCmd(_gameObject.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                    _core.skill = null;
                    _core.skillLevel = -1;
                    return;
                case GamePredef.ST_BATTLE_ITEM:
                    if (!checkItemValid(_core.item))
                    {
                        return;
                    };
                    if (_core.item != null)
                    {
                        _core.battle.battleCmd(_gameObject.battleId, GamePredef.BATTLE_ACTION_ITEM, _core.item.id);
                        _core.item = null;
                    };
                    return;
                case GamePredef.ST_BATTLE_CATCH:
                    _local_2 = 0;
                    for (_local_3 in _core.player.petList)
                    {
                        _local_2++;
                    };
                    if (_local_2 >= _core.player.petMaxNum)
                    {
                        _core.sysMidNote(Language.BATTLECREATUREVIEW_S[0]);
                        return;
                    };
                    if (!checkCatchValid())
                    {
                        _core.sysMidNote(Language.BATTLECREATUREVIEW_S[1]);
                        return;
                    };
                    _core.battle.battleCmd(_gameObject.battleId, GamePredef.BATTLE_ACTION_CATCH);
                    return;
            };
        }

        private function get infoObj():Object
        {
            return ({
                "hp":hp,
                "mp":mp,
                "hpMax":hpMax,
                "mpMax":mpMax,
                "sp":sp,
                "spMax":spMax,
                "level":_gameObject.level,
                "bossFlag":_gameObject.bossFlag,
                "x":posX,
                "y":posY
            });
        }

        public function get frontPos():Boolean
        {
            var _local_1:Point = Battle.BATTLE_POS[_gameObject.battleId];
            if (((_local_1.y == 1) || (_local_1.y == 2)))
            {
                return (true);
            };
            return (false);
        }

        private function checkAttackValid():Boolean
        {
            var _local_1:BattleCreatureView;
            if (!leftSide)
            {
                return (false);
            };
            if (!behindSomeOne)
            {
                return (true);
            };
            if (_core.battle.currentRound == 1)
            {
                return (!(_core.player.view.behindSomeOne));
            };
            _local_1 = BattleCreatureView(_core.battle.battleGetVNeighbor(_core.player.battleId, _battleField.cList));
            if (_local_1)
            {
                if (_local_1.behindSomeOne)
                {
                    return (false);
                };
                return (true);
            };
            return (false);
        }

        private function setBuffBarPos():void
        {
            var _local_2:Object;
            var _local_3:Loader10;
            var _local_1:int;
            for (_local_2 in _buffDict)
            {
                _local_3 = Loader10(_buffDict[_local_2]);
                _local_3.x = (_local_1 * 20);
                _local_1++;
            };
            _buffContainer.x = (((_buffContainer.width / 2) - 10) - ((_local_1 - 1) * 20));
        }

        private function globalFrontEffect(_arg_1:Number):void
        {
            _battleField.frontEffect(_arg_1);
            behaviorEnd();
        }

        public function set hpMax(_arg_1:int):void
        {
            _hpBar.valueMax = _arg_1;
        }

        public function get battlePos():Point
        {
            return (_battlePos);
        }

        private function checkItemValid(_arg_1:Object):Boolean
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            if (!_arg_1)
            {
                return (false);
            };
            var _local_2:Object = _core.data.getData(GamePredef.TBL_ITEM_INSTANCE, _arg_1.itemId);
            if (((_local_2) && (_local_2.tid)))
            {
                _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2.tid];
                _local_4 = _core.player.level;
                if ((((_local_3) && (_local_3.reqLevel)) && (_local_4)))
                {
                    if (_local_3.reqLevel > _local_4)
                    {
                        return (false);
                    };
                };
                if (_local_3.skillId)
                {
                    _local_5 = GameData.d[GamePredef.TBL_SKILL][_local_3.skillId];
                    if (_local_5)
                    {
                        if (!checkSkillValid(_local_5))
                        {
                            return (false);
                        };
                    };
                };
                if (((((_local_3.useType == 1) && (!(_core.battle.currentRound == 1))) || ((_local_3.useType == 2) && (_core.battle.currentRound == 1))) || (_local_3.useType == 4)))
                {
                    return (false);
                };
            };
            return (true);
        }

        public function set mpMax(_arg_1:int):void
        {
            _mpBar.valueMax = _arg_1;
        }

        private function destroyToolTip(_arg_1:TipBattle):void
        {
            _arg_1.hide();
        }

        private function returnEnd(_arg_1:TimerEvent):void
        {
            behaviorEnd();
            destroy();
        }

        public function set spMax(_arg_1:int):void
        {
            _spBar.valueMax = _arg_1;
        }

        public function getEscPoint():Point
        {
            if (_gameObject.battleId < 10)
            {
                return (getEscPointBySide(_guest));
            };
            return (getEscPointBySide((!(_guest))));
        }

        public function addBuff(_arg_1:Number):void
        {
            if (((_arg_1 < 10000000) && (_buffDict[_arg_1])))
            {
                delBuff(_arg_1);
            };
            var _local_2:int;
            if (_arg_1 > 10000000)
            {
                _local_2 = int(Math.floor((_arg_1 / 10000)));
            }
            else
            {
                _local_2 = _arg_1;
            };
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_BUFF][_local_2];
            var _local_4:Loader10 = new Loader10();
            _buffContainer.addChild(_local_4);
            _local_4.load(new URLRequest(ResManager.getIconUrl(_local_3.iconCode)));
            _local_4.scaleX = 0.5;
            _local_4.scaleY = 0.5;
            _buffDict[_arg_1] = _local_4;
            setBuffBarPos();
        }

        public function set speed(_arg_1:*):void
        {
            this._speed = _arg_1;
        }

        private function setBattleCloud():void
        {
            if (((isAirBattle) && ((_gameObject is Pet) || ((_gameObject is Creature) && (_gameObject.withCloud == 1)))))
            {
                if (creatureCloud == null)
                {
                    creatureCloud = new ((ResManager.VIEW_BATTLE_CLOUD as Class))();
                    creatureCloud.x = -40;
                    creatureCloud.y = -30;
                    this._body.addChildAt(creatureCloud, 0);
                }
                else
                {
                    this._body.setChildIndex(creatureCloud, 0);
                };
            };
        }

        private function relive():void
        {
            var _local_1:Fade = new Fade(this);
            _local_1.alphaFrom = 0.8;
            _local_1.alphaTo = 0.4;
            _local_1.duration = 800;
            _local_1.addEventListener(EffectEvent.EFFECT_END, reliveHandler);
            _local_1.play();
        }

        private function playCriticalHit():void
        {
            var num:int;
            var bs:BattleStage;
            var func:Function;
            if (!CreatureView.LOAD_EFFECT)
            {
                return;
            };
            num = 0;
            bs = BattleStage(_core.view.getUI(ViewManager.STAGE_BATTLE));
            func = function (_arg_1:Event):void
            {
                if (criticalEffectRoute[num])
                {
                    bs.x = criticalEffectRoute[num];
                    bs.y = criticalEffectRoute[num++];
                }
                else
                {
                    bs.x = 0;
                    bs.y = 0;
                    removeEventListener(Event.ENTER_FRAME, func);
                };
            };
            addEventListener(Event.ENTER_FRAME, func);
        }

        override protected function mouseOutHandler(_arg_1:MouseEvent):void
        {
            super.mouseOutHandler(_arg_1);
            if (_battleToolTip)
            {
                destroyToolTip(_battleToolTip);
            };
            _battleToolTip = null;
            _core.view.resoreMouse();
            clearAllColor();
        }

        override protected function onAddedToStage(_arg_1:Event):void
        {
            _callBack = _battleField.nextActionRound;
            if (_sprite)
            {
                _sprite.callBack = _callBack;
            };
            hitTestLayer = new UIComponent();
        }

        public function get mp():Number
        {
            return (_mpBar.value);
        }

        override protected function setPosition():void
        {
            faceTo(_battleDir);
            setPos(_battlePos);
        }

        public function initBattleView(_arg_1:Object, _arg_2:Object, _arg_3:Point, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean):void
        {
            var _local_7:Number;
            var _local_8:Charactor;
            var _local_9:Number;
            var _local_10:Object;
            var _local_11:Number;
            _battleField = BattleStage(_core.view.getUI(ViewManager.STAGE_BATTLE));
            _battleDir = _arg_4;
            _battlePos = _arg_3;
            _guest = _arg_5;
            _showProp = _arg_6;
            hpMax = _arg_2.hpMax;
            mpMax = _arg_2.mpMax;
            spMax = _arg_2.spMax;
            hp = _arg_2.hp;
            mp = _arg_2.mp;
            sp = _arg_2.sp;
            if (_arg_2.type == GamePredef.TBL_PET)
            {
                _local_7 = Number(_arg_2.cid);
                if (_local_7)
                {
                    _local_8 = _core.getCharactor(_arg_2.cid);
                    if (_local_8.prsUseId)
                    {
                        _local_9 = _local_8.prsUseId;
                        _local_10 = GameData.d[GamePredef.TBL_PRS_SHOW][_local_9];
                        _local_11 = Number(_local_10["resCode"]);
                        _arg_1.resCode = _local_11;
                        _arg_2.resCode = _local_11;
                    };
                };
            };
            gameObject = _arg_1;
            _gameObject.bossFlag = Number(_gameObject.bossFlag);
            _gameObject.battleId = _arg_2.battleId;
            _gameObject.inBattle = true;
            if (isAirBattle)
            {
                this._body.y = -(GamePredef.FLIGHT_HEIGHT);
            }
            else
            {
                this._body.y = 0;
            };
            if (_gameObject.type == GamePredef.TBL_CREATURE)
            {
                if (leftSide)
                {
                    _mpBar.visible = false;
                    _spBar.visible = false;
                    _textName.textColor = 0xFFFFFF;
                    if (_gameObject.id == 1255)
                    {
                        _showProp = false;
                    };
                };
            }
            else
            {
                if (_gameObject.type == GamePredef.TBL_PET)
                {
                    _spBar.visible = false;
                    if (leftSide)
                    {
                        _showProp = false;
                    };
                }
                else
                {
                    if (leftSide)
                    {
                        _showProp = false;
                    };
                };
            };
            if (_gameObject.bossFlag == 1)
            {
                _textName.textColor = 0xFF0000;
            }
            else
            {
                if (_gameObject.bossFlag == 2)
                {
                    _textName.textColor = 0xFF00;
                };
            };
            if (_arg_2.c)
            {
                _textName.textColor = _arg_2.c;
            };
            if (hp <= 0)
            {
                _dead = true;
            }
            else
            {
                _dead = false;
            };
            this.showProp = _showProp;
        }

        public function isDead():Boolean
        {
            return (hp <= 0);
        }

        public function clearAllColor():void
        {
            var _local_1:BattleCreatureView;
            for each (_local_1 in _battleField.cList)
            {
                if (_local_1.visible)
                {
                    _local_1.clearColor();
                };
            };
        }

        public function set guest(_arg_1:Boolean):void
        {
            _guest = _arg_1;
        }

        private function get info():String
        {
            return ((((((((((((((((Language.BATTLECREATUREVIEW_S[2] + _gameObject.level) + "\n") + "HP:") + hp) + "/") + hpMax) + "\n") + "MP:") + mp) + "/") + mpMax) + "\n") + "SP:") + sp) + "/") + spMax);
        }

        public function sameGroup(_arg_1:BattleCreatureView):Boolean
        {
            return (_arg_1.leftSide == leftSide);
        }

        public function showWaitIcon():void
        {
            _waitIcon.visible = true;
        }

        public function battleState(sObj:Object, target:ICreatureView=null):void
        {
            var param:* = undefined;
            var buffId:* = undefined;
            var value:Object;
            var adjustHp:Number;
            var val:Number;
            var tView:BattleCreatureView;
            var sid:uint;
            var hps:Number;
            var i:* = undefined;
            var midNote:String;
            var blueMsg:String;
            if (sObj == null)
            {
                return;
            };
            if (!_gameObject)
            {
                return;
            };
            var isArray:* = function (_arg_1:*):Boolean
            {
                var _local_3:*;
                var _local_2:int;
                for (_local_3 in _arg_1)
                {
                    _local_2++;
                };
                if (0 == _local_2)
                {
                    return (false);
                };
                return (true);
            };
            if (sObj[GamePredef.BS_BUFF_DEL])
            {
                if (isArray(sObj[GamePredef.BS_BUFF_DEL]))
                {
                    for (buffId in sObj[GamePredef.BS_BUFF_DEL])
                    {
                        delBuff(Number(sObj[GamePredef.BS_BUFF_DEL][buffId]));
                    };
                }
                else
                {
                    delBuff(Number(sObj[GamePredef.BS_BUFF_DEL]));
                };
            };
            for (param in sObj)
            {
                if (param != GamePredef.BS_BUFF_DEL)
                {
                    value = sObj[param];
                    if (param == GamePredef.BS_CATCH_FAILED)
                    {
                        if (_core.player.id == Number(value.cid))
                        {
                            if (value.rate > 0)
                            {
                                _core.sysMsg(Language.BATTLESTAGE_S[14].replace("{rate}", int(value.rate)));
                            }
                            else
                            {
                                if (value.rate == 0)
                                {
                                    _core.sysMsg(Language.BATTLESTAGE_S[13].replace("{num}", int(value.selfCatch)));
                                };
                            };
                        };
                    };
                    switch (param)
                    {
                        case GamePredef.BS_SKILL:
                            if (_battleField)
                            {
                                _battleField.showSkill(value.toString());
                            };
                            break;
                        case GamePredef.BS_BULLET:
                            if (target)
                            {
                                bulletTo(Number(value), target);
                            };
                            break;
                        case GamePredef.BS_HURT_SP:
                            sp = Number(value);
                            _gameObject.currentSp = Number(value);
                            break;
                        case GamePredef.BS_HURT_HP:
                            if (sObj[GamePredef.BS_CRI])
                            {
                                _scrollText.show(Math.round((hp - Number(value))).toString(), 0xFF0000, 50, 3, 45);
                            }
                            else
                            {
                                _scrollText.show(Math.round((hp - Number(value))).toString());
                            };
                            hp = Number(value);
                            _gameObject.currentHp = Number(value);
                            break;
                        case GamePredef.BS_HURT_MP:
                            if (sObj[GamePredef.BS_CRI])
                            {
                                _scrollText.show(Math.round((mp - Number(value))).toString(), GamePredef.PROPERTY_COLOR_MP, 50, 3, 45);
                            }
                            else
                            {
                                _scrollText.show(Math.round((mp - Number(value))).toString(), GamePredef.PROPERTY_COLOR_MP);
                            };
                            mp = Number(value);
                            _gameObject.currentMp = Number(value);
                            break;
                        case GamePredef.BS_RECOVER_SP:
                            sp = Number(value);
                            _gameObject.currentSp = Number(value);
                            break;
                        case GamePredef.BS_RECOVER_HP:
                            adjustHp = Math.round((Number(value) - hp));
                            if (adjustHp >= 0)
                            {
                                if (sObj[GamePredef.BS_CRI])
                                {
                                    _scrollText.show(("+" + adjustHp), 0xFF00, 50, 3, 45);
                                }
                                else
                                {
                                    _scrollText.show(("+" + adjustHp), 0xFF00);
                                };
                            };
                            hp = Number(value);
                            _gameObject.currentHp = Number(value);
                            if ((((_gameObject.type == GamePredef.TBL_PET) && (_core.battlePet)) && (_gameObject.id == _core.battlePet.id)))
                            {
                                _core.battlePet.currentHp = _gameObject.currentHp;
                            };
                            break;
                        case GamePredef.BS_REBORN:
                            _scrollText.show(Language.BATTLESTAGE_S[12]);
                            hp = Number(value);
                            _gameObject.currentHp = Number(value);
                            if ((((_gameObject.type == GamePredef.TBL_PET) && (_core.battlePet)) && (_gameObject.id == _core.battlePet.id)))
                            {
                                _core.battlePet.currentHp = _gameObject.currentHp;
                            };
                            break;
                        case GamePredef.BS_RECOVER_MP:
                            if (sObj[GamePredef.BS_CRI])
                            {
                                _scrollText.show(("+" + Math.round((Number(value) - mp))), GamePredef.PROPERTY_COLOR_MP, 50, 3, 45);
                            }
                            else
                            {
                                _scrollText.show(("+" + Math.round((Number(value) - mp))), GamePredef.PROPERTY_COLOR_MP);
                            };
                            mp = Number(value);
                            _gameObject.currentMp = Number(value);
                            if ((((_gameObject.type == GamePredef.TBL_PET) && (_core.battlePet)) && (_gameObject.id == _core.battlePet.id)))
                            {
                                _core.battlePet.currentMp = _gameObject.currentMp;
                            };
                            break;
                        case GamePredef.BS_RECOVER_TARGET_MP:
                            val = Number(value);
                            tView = (target as BattleCreatureView);
                            if (tView == null)
                            {
                                return;
                            };
                            tView.mp = val;
                            tView.gameObject.currentMp = val;
                            break;
                        case GamePredef.BS_RECOVER_TARGET_HP:
                            tView = (target as BattleCreatureView);
                            if (tView == null)
                            {
                                return;
                            };
                            val = Number(value);
                            if (sObj[GamePredef.BS_CRI])
                            {
                                tView._scrollText.show(("+" + Math.round((val - tView.hp))), 0xFF00, 50, 3, 45);
                            }
                            else
                            {
                                tView._scrollText.show(("+" + Math.round((val - tView.hp))), 0xFF00);
                            };
                            tView.hp = val;
                            tView.gameObject.currentHp = val;
                            break;
                        case GamePredef.BS_RECOVER_TARGET_SP:
                            val = Number(value);
                            sp = val;
                            _gameObject.currentSp = val;
                            break;
                        case GamePredef.BS_HURT_SHAR:
                            sid = value.sid;
                            hps = value.hp;
                            tView = _battleField.cList[sid];
                            if (tView == null)
                            {
                                return;
                            };
                            val = Number(hps);
                            if (sObj[GamePredef.BS_CRI])
                            {
                                tView._scrollText.show(("-" + Math.round((tView.hp - val))), 0xFF0000, 50, 3, 45);
                            }
                            else
                            {
                                tView._scrollText.show(("-" + Math.round((tView.hp - val))), 0xFF0000);
                            };
                            tView.hp = val;
                            tView.gameObject.currentHp = val;
                            break;
                        case GamePredef.BS_USE_HP:
                            hp = Math.round(Number(value));
                            _gameObject.currentHp = Number(value);
                            if ((((_gameObject.type == GamePredef.TBL_PET) && (_core.battlePet)) && (_gameObject.id == _core.battlePet.id)))
                            {
                                _core.battlePet.currentHp = _gameObject.currentHp;
                            };
                            break;
                        case GamePredef.BS_USE_MP:
                            mp = Math.round(Number(value));
                            _gameObject.currentMp = Number(value);
                            if ((((_gameObject.type == GamePredef.TBL_PET) && (_core.battlePet)) && (_gameObject.id == _core.battlePet.id)))
                            {
                                if (!_core.battlePet.skillAddMp)
                                {
                                    trace(("BS_USE_MP >> currentMp:" + _gameObject.currentMp));
                                    _core.battlePet.currentMp = _gameObject.currentMp;
                                }
                                else
                                {
                                    _core.battlePet.skillAddMp = false;
                                };
                            };
                            break;
                        case GamePredef.BS_USE_SP:
                            sp = Math.round(Number(value));
                            _gameObject.currentSp = sp;
                            break;
                        case GamePredef.BS_FRONT_EFFECT:
                            frontEffect(Number(value));
                            break;
                        case GamePredef.BS_ATTACK_EFFECT:
                            attackEffect(Number(value));
                            break;
                        case GamePredef.BS_SKILL_EFFECT:
                            skillEffect(Number(value));
                            break;
                        case GamePredef.BS_BUFF_ADD:
                            addBuff(value.id);
                            break;
                        case GamePredef.BS_BUFF_DEL:
                            delBuff(Number(value));
                            break;
                        case GamePredef.BS_BUFF_COL_DEL:
                            for (i in value)
                            {
                                delBuff(Number(value[i]));
                            };
                            break;
                        case GamePredef.BS_STATUS:
                            if (value.hasOwnProperty("text"))
                            {
                                _scrollText.freeShow(value.text.toString(), uint(value.color.toString()), int(value.size.toString()), int(value.speed.toString()), int(value.range.toString()));
                            }
                            else
                            {
                                _scrollText.show(value.toString());
                            };
                            break;
                        case GamePredef.BS_SAY:
                            onSay(value.toString());
                            break;
                        case GamePredef.BS_BUFF_CLEAR:
                            clearBuff();
                            break;
                        case GamePredef.BS_GLOBAL_FRONT_EFFECT:
                            globalFrontEffect(Number(value));
                            break;
                        case GamePredef.BS_GLOBAL_BACK_EFFECT:
                            globalBackEffect(Number(value));
                            break;
                        case GamePredef.BS_EXP_BATTLE:
                            _scrollText.show((value + Language.BATTLECREATUREVIEW_S[3]), 0xFF00, 50, 3, 45);
                            break;
                        case GamePredef.BS_HINT:
                            onSay(value.content.toString());
                            if (_core.cid == Number(value.cid))
                            {
                                midNote = String(Language.PET_LOW_LOYALTY[2]).replace("{pet}", value.petName.toString());
                                blueMsg = String(Language.PET_LOW_LOYALTY[1]).replace("{pet}", value.petName.toString());
                                _core.sysMidNote(midNote);
                                _core.sysBlueMsg(blueMsg);
                            };
                            break;
                        case GamePredef.BS_RECOVER_HP_MAX:
                            hpMax = Number(value);
                            _gameObject.hpMax = Number(value);
                            break;
                    };
                };
            };
            if (sObj[GamePredef.BS_CRI])
            {
                playCriticalHit();
            };
        }

        public function set sp(_arg_1:Number):void
        {
            _spBar.value = _arg_1;
        }

        private function reliveHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(EnterFrameMove.EFFECT_END, reliveHandler);
            behavior(AbstractGameRes.BH_BREATH_SLOW);
            alpha = 1;
            behaviorEnd();
            if (_wing_cg)
            {
                _wing_cg.visible = true;
                _wing_cg.dir = _cg.dir;
                _wing_cg.play(((_wing_cg.dir + "-") + _wing_cg.behavior));
            };
        }

        private function moveToPoint(_arg_1:Number, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Number = ToolKit.getDisByXY(posX, posY, _arg_2, _arg_3);
            if (_local_4 < GamePredef.VALID_DIS_BATTLE_BACK)
            {
                behavior(AbstractGameRes.BH_BREATH_SLOW);
                behaviorEnd();
                return;
            };
            _speed = _arg_1;
            walkTo(_arg_2, _arg_3);
        }

        private function dodgeCool():void
        {
            alpha = 0.3;
            dodge();
        }

        public function get mpMax():int
        {
            return (_mpBar.valueMax);
        }

        override protected function updateObjectPos():void
        {
        }

        public function get spMax():int
        {
            return (_spBar.valueMax);
        }

        private function returned():void
        {
            var _local_1:AlphaResize = new AlphaResize(this);
            _local_1.duration = 1000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 0;
            _local_1.play();
            _local_1.addEventListener(TimerEvent.TIMER_COMPLETE, returnEnd);
        }

        public function defended():void
        {
            var _local_1:Point = getEscPoint();
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = this;
            _local_2.stepLength = MOVE_SPEED_BATTLE;
            _local_2.xBy = (_local_1.x - posX);
            _local_2.yBy = (_local_1.y - posY);
            _local_2.play();
            behaviorEnd();
        }

        private function dodge():void
        {
            var _local_1:Point = getEscPoint();
            var _local_2:EnterFrameMove = new EnterFrameMove();
            _local_2.target = this;
            _local_2.stepLength = MOVE_SPEED_BATTLE;
            _local_2.xBy = (_local_1.x - posX);
            _local_2.yBy = (_local_1.y - posY);
            _local_2.addEventListener(EnterFrameMove.EFFECT_END, dodgeEndHandler);
            _local_2.play();
        }

        public function get guest():Boolean
        {
            return (_guest);
        }

        private function summon():void
        {
            var _local_1:AlphaResize = new AlphaResize(this);
            _local_1.duration = 1000;
            _local_1.play();
            _local_1.addEventListener(TimerEvent.TIMER_COMPLETE, summonEnd);
        }

        public function hideWaitIcon():void
        {
            _waitIcon.visible = false;
        }

        override protected function mouseOverHandler(_arg_1:MouseEvent):void
        {
            var _local_2:Object;
            var _local_3:TipCre;
            var _local_4:Object;
            super.mouseOverHandler(_arg_1);
            if (_battleToolTip)
            {
                destroyToolTip(_battleToolTip);
                _battleToolTip = null;
            };
            if (_showProp)
            {
                if (((_arg_1.shiftKey) && (_gameObject.type == GamePredef.TBL_CREATURE)))
                {
                    _local_2 = _core.data.gameData[_gameObject.type][_gameObject.id];
                    if (_local_2)
                    {
                        _local_3 = TipCre(_core.view.getUI(ViewManager.TOOLTIP_PET));
                        _local_4 = {
                            "temp":_local_2,
                            "btnVisible":true,
                            "type":BasicToolTip.TYPE_TEMP
                        };
                        _local_3.object = _local_4;
                        _local_3.show();
                    };
                }
                else
                {
                    _battleToolTip = createToolTip();
                };
            };
            if (!cmdMode)
            {
                return;
            };
            showBlue();
            switch (_core.cmdState)
            {
                case GamePredef.ST_BATTLE_ATTACK:
                    if (!checkAttackValid())
                    {
                        showRed();
                        return;
                    };
                    return;
                case GamePredef.ST_BATTLE_SKILL:
                    if (!checkSkillValid(_core.skill))
                    {
                        showRed();
                    }
                    else
                    {
                        showSkillArea(_core.skill);
                    };
                    return;
                case GamePredef.ST_BATTLE_ITEM:
                    if (!checkItemValid(_core.item))
                    {
                        showRed();
                    };
                    return;
                case GamePredef.ST_BATTLE_CATCH:
                    if (!checkCatchValid())
                    {
                        showRed();
                        return;
                    };
                    return;
            };
        }

        public function get battleId():int
        {
            return (_gameObject.battleId);
        }

        private function dodgeBackEndHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(EnterFrameMove.EFFECT_END, dodgeBackEndHandler);
            alpha = 1;
            behaviorEnd();
        }

        public function showBlue():void
        {
            var _local_1:Array;
            var _local_2:Object;
            if (_resLoader)
            {
                _resLoader.filters = [GamePredef.FILTER_ALLOW_SELECTED];
            };
            if (_cg)
            {
                if (!_cg.filters)
                {
                    _cg.filters = [GamePredef.FILTER_ALLOW_SELECTED];
                }
                else
                {
                    _local_1 = new Array();
                    for each (_local_2 in _cg.filters)
                    {
                        _local_1.push(_local_2);
                    };
                    _local_1.push(GamePredef.FILTER_ALLOW_SELECTED);
                    _cg.filters = _local_1;
                };
            };
        }

        override protected function defaultResComplete(_arg_1:Event):void
        {
            super.defaultResComplete(_arg_1);
            setBarPos();
            setBattleCloud();
        }

        override public function destroy():void
        {
            super.destroy();
            if (_battleToolTip)
            {
                destroyToolTip(_battleToolTip);
            };
            if (_scrollText)
            {
                _scrollText.destroy();
                _scrollText = null;
            };
        }

        public function delBuff(_arg_1:Number):void
        {
            var _local_2:Loader10;
            if (_buffDict[_arg_1])
            {
                _local_2 = Loader10(_buffDict[_arg_1]);
                _local_2.unload();
                _buffContainer.removeChild(_local_2);
                delete _buffDict[_arg_1];
                setBuffBarPos();
            };
        }

        private function positionEndHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(EnterFrameMove.EFFECT_END, positionEndHandler);
            behaviorEnd();
        }


    }
}//package com.qeedoo.ui.view.compGameStage

