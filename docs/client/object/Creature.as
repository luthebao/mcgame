// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.Creature

package com.qeedoo.game.object
{
    import flash.events.IEventDispatcher;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.EventDispatcher;
    import com.qeedoo.game.config.Debug;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.resource.AbstractGameRes;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import com.qeedoo.game.utils.MouseManager;

    public class Creature implements ICreature, IEventDispatcher 
    {

        public static const EVENT_BAHAVIOR_END:String = "EVENT_BAHAVIOR_END";

        public var element:int;
        public var iconCode:Number;
        public var brightCode:int;
        public var aptEnergy:int;
        public var id:Number;
        public var currentMp:Number;
        public var hp:int;
        public var wingResCode:Number;
        public var moveRoute:Array;
        public var withCloud:int;
        public var normalView:Object;
        public var flyerResCode:Number;
        public var type:int;
        public var hpMax:int;
        public var decoBottomCode:Number;
        public var decoFootCode:Number;
        public var leagueIcon:int = -1;
        public var mountResCode:Number;
        private var _oldTime:int = 0;
        public var sp:int;
        public var aptAgility:int;
        public var currentHp:Number;
        private var _3446917posY:Number;
        public var decoBottomCodeOnMount:Number;
        public var dressResCode:Number;
        public var bossFlag:Number;
        public var battleView:Object;
        private var _core:Core;
        private var _flyingState:int = GamePredef.FLYING_STATE_ON_GROUND;
        public var level:int;
        public var aptStrength:int;
        public var aptStamina:int;
        public var name:String;
        public var dir:int;
        public var decoLightMaskCode:Number;
        public var qLevel:int;
        public var catchable:int;
        public var isSelf:Boolean;
        private var _mountState:int = GamePredef.MOUNT_STATE_OFF;
        public var posDir:int;
        public var aptIntelligence:int;
        public var mp:int;
        public var view:Object;
        public var growBase:int;
        protected var _inBattle:Boolean;
        public var resCode:Number;
        public var classId:int;
        public var currentSp:Number;
        private var _bindingEventDispatcher:EventDispatcher;
        public var mpMax:int;
        public var spMax:int;
        public var gender:int;
        public var decoHeadCode:Number;
        public var flyerFrontResCode:Number;
        public var fairy:Object;
        public var property:Object;
        private var _3446916posX:Number;
        public var doubleFly:Boolean;
        public var npcFlag:Boolean;
        public var colorCode:int;
        public var battleId:int;
        public var decoLightCode:Number;
        public var life:int;

        public function Creature()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
            type = GamePredef.TBL_CREATURE;
            isSelf = false;
            _core = Core.getInstance();
            Debug.refObj(this);
        }

        public function set posY(_arg_1:Number):void
        {
            var _local_2:Object = this._3446917posY;
            if (_local_2 !== _arg_1)
            {
                this._3446917posY = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "posY", _local_2, _arg_1));
            };
        }

        public function set mountState(_arg_1:int):void
        {
            _mountState = _arg_1;
        }

        public function walkTo(_arg_1:int, _arg_2:int):void
        {
            moveRoute = [[_arg_1, _arg_2]];
            walk();
        }

        public function onBeginWeddingFly():void
        {
            flyingState = GamePredef.FLYING_STATE_TAKING_OFF;
            this.view.doubleFly = true;
            doubleFly = true;
            if ((this is Player))
            {
                _core.view.getUI(ViewManager.STAGE_MAIN_CONTAINER).drawClouds();
            };
            this.view.playFlying(true, (this is Player), ((_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR) || (_core.player.flyingState == GamePredef.FLYING_STATE_PRE_LANDING)));
            _core.view.switchLayer(this, true);
            this.view.behaviorForFlying(AbstractGameRes.BH_BREATH_SLOW);
            if ((this is Charactor))
            {
                if (Charactor(this).isLeader)
                {
                    if (!this.view.weddingFlyer)
                    {
                        this.view.createWeddingFlyer();
                    };
                    this.view.weddingFlyer.host = this.view;
                    this.view.weddingFlyerOn();
                }
                else
                {
                    this.view.flyerGuest = this.view;
                };
            };
        }

        public function set posX(_arg_1:Number):void
        {
            var _local_2:Object = this._3446916posX;
            if (_local_2 !== _arg_1)
            {
                this._3446916posX = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "posX", _local_2, _arg_1));
            };
        }

        public function stopFlying():void
        {
            var _local_1:Player;
            var _local_2:int;
            if (flyingState != GamePredef.FLYING_STATE_IN_THE_AIR)
            {
                return;
            };
            if ((this is Player))
            {
                _local_1 = Player(this);
                if ((((_local_1.inGroup) && (!(_local_1.isLeader))) && (!(_local_1.groupAfk))))
                {
                    _local_2 = new Date().time;
                    if ((((_local_2 - _oldTime) > 30000) || (_oldTime == 0)))
                    {
                        _oldTime = _local_2;
                        _core.remote.fixFlyState();
                    };
                    _core.sysMidNote(Language.NPCVIEW_S[0]);
                    return;
                };
                if (_local_1.taskSweep)
                {
                    _core.sysMidNote(Language.TASKSWEEPPANEL_U[23]);
                    return;
                };
                flyingState = GamePredef.FLYING_STATE_PRE_LANDING;
                this.view.landToSafeArea();
            };
        }

        public function onBeginFlying():void
        {
            flyingState = GamePredef.FLYING_STATE_TAKING_OFF;
            if ((this is Player))
            {
                _core.view.getUI(ViewManager.STAGE_MAIN_CONTAINER).drawClouds();
            };
            this.view.playFlying(true, (this is Player), ((_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR) || (_core.player.flyingState == GamePredef.FLYING_STATE_PRE_LANDING)));
            _core.view.switchLayer(this, true);
            if (_mountState != GamePredef.MOUNT_STATE_OFF)
            {
                _mountState = GamePredef.MOUNT_STATE_OFF;
            };
            this.view.behaviorForFlying(AbstractGameRes.BH_BREATH_SLOW);
            this.view.flyerOn();
        }

        public function get inBattle():Boolean
        {
            return (_inBattle);
        }

        public function chatGM(_arg_1:String, _arg_2:Number, _arg_3:String):void
        {
            _core.remote.chatGM(_arg_1, _arg_2, _arg_3);
        }

        public function getQuestionList(_arg_1:int):void
        {
            _core.remote.getQuestionList(_arg_1);
        }

        public function get flyingState():int
        {
            return (_flyingState);
        }

        public function stopMounting():void
        {
            var _local_1:Player;
            if ((this is Player))
            {
                _local_1 = Player(this);
                if (_local_1.taskSweep)
                {
                    _core.sysMidNote(Language.TASKSWEEPPANEL_U[34]);
                    return;
                };
                _core.remote.stopMounting();
            };
        }

        public function p2pWisper(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            _core.remote.p2pWisper(_arg_1, _arg_2, _arg_3);
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public function set data(_arg_1:Object):void
        {
            var _local_2:Object;
            for (_local_2 in _arg_1)
            {
                if (hasOwnProperty(_local_2))
                {
                    this[_local_2] = _arg_1[_local_2];
                };
            };
            if (_arg_1.isFlying)
            {
                flyingState = GamePredef.FLYING_STATE_IN_THE_AIR;
            };
            if (!_arg_1.doubleFly)
            {
                doubleFly = false;
            };
        }

        public function submitQuestion(_arg_1:Object):void
        {
            _core.remote.submitQuestion(_arg_1);
        }

        public function get mountState():int
        {
            return (_mountState);
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function onStopFlying():void
        {
            flyingState = GamePredef.FLYING_STATE_LANDING;
            doubleFly = false;
            if ((this is Player))
            {
                _core.view.getUI(ViewManager.STAGE_MAIN_CONTAINER).clearClouds();
            };
            this.view.playFlying(false, (this is Player), ((_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR) || (_core.player.flyingState == GamePredef.FLYING_STATE_PRE_LANDING)));
        }

        public function set inBattle(_arg_1:Boolean):void
        {
            _inBattle = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get posY():Number
        {
            return (this._3446917posY);
        }

        public function beginFlying():void
        {
            var _local_1:Player;
            var _local_2:int;
            if (flyingState != GamePredef.FLYING_STATE_ON_GROUND)
            {
                return;
            };
            if ((this is Player))
            {
                _local_1 = Player(this);
                if ((((_local_1.inGroup) && (!(_local_1.isLeader))) && (!(_local_1.groupAfk))))
                {
                    _local_2 = new Date().time;
                    if ((((_local_2 - _oldTime) > 30000) || (_oldTime == 0)))
                    {
                        _oldTime = _local_2;
                        _core.remote.fixFlyState();
                    };
                    _core.sysMidNote(Language.NPCVIEW_S[0]);
                    return;
                };
                if (_local_1.taskSweep)
                {
                    _core.sysMidNote(Language.TASKSWEEPPANEL_U[23]);
                    return;
                };
                _core.remote.beginFlying();
            };
        }

        public function closeTo(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Array;
            _local_3 = _core.move.getCloseToRoute(view.posX, view.posY, _arg_1, _arg_2, view.hitTestLayer);
            moveRoute = _local_3;
            walk();
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        public function wisper(_arg_1:String, _arg_2:String):void
        {
            if (_core.player.checkChatTime())
            {
                _core.remote.wisper(id, type, _arg_2, _arg_1);
            }
            else
            {
                _core.sysMidNote(GamePredef.CHAT_TOOFAST);
            };
        }

        public function set flyingState(_arg_1:int):void
        {
            _flyingState = _arg_1;
            if ((this is Player))
            {
                _core.view.getUI(ViewManager.MAIN_MINIMAP).changeFlyingButton();
            };
        }

        [Bindable(event="propertyChange")]
        public function get posX():Number
        {
            return (this._3446916posX);
        }

        public function battleRouteTo(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Array;
            _local_3 = _core.move.getBattleRoute(view.posX, view.posY, _arg_1, _arg_2);
            moveRoute = _local_3;
            walk();
        }

        public function walk():void
        {
            if (!(((GamePredef.GLOBAL_SETTING.ac) && (view.isWalking)) && (MouseManager.mouseDownFlag)))
            {
                view.behavior(AbstractGameRes.BH_RUN_NORMAL);
                view.walk(null);
            };
        }

        public function say(_arg_1:String, _arg_2:int):void
        {
            if (_core.player.checkChatTime())
            {
                _core.remote.say(id, type, _arg_2, _arg_1);
            }
            else
            {
                _core.sysMidNote(GamePredef.CHAT_TOOFAST);
            };
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function beginMounting(_arg_1:int):void
        {
            var _local_2:Player;
            if ((this is Player))
            {
                _local_2 = Player(this);
                if (_local_2.taskSweep)
                {
                    _core.sysMidNote(Language.TASKSWEEPPANEL_U[34]);
                    return;
                };
                _core.remote.call("beginMounting", null, _arg_1);
            };
        }


    }
}//package com.qeedoo.game.object

