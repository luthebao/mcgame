// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.Charactor

package com.qeedoo.game.object
{
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;

    public class Charactor extends Creature 
    {

        public var stQuest:int;
        public var actT:int;
        public var stTrade:int;
        public var pmLevel:Number;
        protected var _posMapId:Number;
        public var actTN:String;
        private var _state:int;
        public var stItem:int;
        public var broT:String;
        private var _1318998296_taskSweep:Boolean = false;
        private var _1916889178inGroup:Boolean;
        protected var _exprb:Number;
        private var _432720173isLeader:Boolean;
        public var ee:int;
        public var ef:int;
        public var cts:String;
        public var en:int;
        protected var _expRe:Number = 0;
        private var _actionState:int;
        public var gmLevel:Number;
        private var _groupAfk:Boolean = false;
        public var prsUseId:Number;
        public var star:int;
        public var stBehavior:int;
        public var vipT:int;
        public var wp:Number;
        protected var _exp:Number;
        public var levelRe:uint = 0;
        public var honor:Number;
        public var ct:String;
        public var t:int;
        public var stBattle:int;
        public var decoInfo:Object;
        public var chival:Number;
        protected var _core:Core;

        public function Charactor()
        {
            type = GamePredef.TBL_CHARACTOR;
            isSelf = false;
            inGroup = false;
            isLeader = false;
            _core = Core.getInstance();
            _state = GamePredef.ST_NORMAL;
            _actionState = GamePredef.ST_NORMAL;
        }

        public function set actionState(_arg_1:int):void
        {
            _actionState = _arg_1;
        }

        public function get actionState():int
        {
            return (_actionState);
        }

        override public function closeTo(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Array;
            var _local_4:* = null;
            if (((!(flyingState == GamePredef.FLYING_STATE_TAKING_OFF)) && (!(flyingState == GamePredef.FLYING_STATE_IN_THE_AIR))))
            {
                _local_4 = view.hitTestLayer;
            };
            _local_3 = _core.move.getCloseToRoute(view.posX, view.posY, _arg_1, _arg_2, _local_4);
            moveRoute = _local_3;
        }

        private function set _506332647groupAfk(_arg_1:Boolean):void
        {
            _groupAfk = _arg_1;
        }

        private function set _100893exp(_arg_1:Number):void
        {
            _exp = _arg_1;
            level = _core.basic.expToLevel(_exp);
        }

        public function get exp():Number
        {
            return (_exp);
        }

        public function set isLeader(_arg_1:Boolean):void
        {
            var _local_2:Object = this._432720173isLeader;
            if (_local_2 !== _arg_1)
            {
                this._432720173isLeader = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isLeader", _local_2, _arg_1));
            };
        }

        public function set inGroup(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1916889178inGroup;
            if (_local_2 !== _arg_1)
            {
                this._1916889178inGroup = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inGroup", _local_2, _arg_1));
            };
        }

        public function get expRe():Number
        {
            return (_expRe);
        }

        public function get posMapId():int
        {
            return (_posMapId);
        }

        [Bindable(event="propertyChange")]
        public function set exp(_arg_1:Number):void
        {
            var _local_2:Object = this.exp;
            if (_local_2 !== _arg_1)
            {
                this._100893exp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exp", _local_2, _arg_1));
            };
        }

        public function get state():int
        {
            return (_state);
        }

        public function set posMapId(_arg_1:int):void
        {
            _posMapId = _arg_1;
        }

        public function set taskSweep(_arg_1:Boolean):void
        {
            _taskSweep = _arg_1;
        }

        public function set state(_arg_1:int):void
        {
            _state = _arg_1;
        }

        public function get className():String
        {
            return (_core.getClassName(classId));
        }

        [Bindable(event="propertyChange")]
        public function set groupAfk(_arg_1:Boolean):void
        {
            var _local_2:Object = this.groupAfk;
            if (_local_2 !== _arg_1)
            {
                this._506332647groupAfk = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupAfk", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get inGroup():Boolean
        {
            return (this._1916889178inGroup);
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (((_arg_1.expRe) && (_arg_1.expRe > 0)))
            {
                this.levelRe = _core.basic.expReToLevelRe(_arg_1.expRe);
            };
            decoInfo = ((_arg_1.hasOwnProperty("decoInfo")) ? _arg_1.decoInfo : null);
            prsUseId = ((_arg_1.hasOwnProperty("prsUseId")) ? _arg_1.prsUseId : 0);
        }

        public function routeTo(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Array;
            var _local_4:* = null;
            if (((!(flyingState == GamePredef.FLYING_STATE_TAKING_OFF)) && (!(flyingState == GamePredef.FLYING_STATE_IN_THE_AIR))))
            {
                _local_4 = view.hitTestLayer;
            };
            _local_3 = _core.move.getRoute(view.posX, view.posY, _arg_1, _arg_2, _local_4);
            moveRoute = _local_3;
        }

        public function set _taskSweep(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1318998296_taskSweep;
            if (_local_2 !== _arg_1)
            {
                this._1318998296_taskSweep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_taskSweep", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function set expRe(_arg_1:Number):void
        {
            var _local_2:Object = this.expRe;
            if (_local_2 !== _arg_1)
            {
                this._96960816expRe = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expRe", _local_2, _arg_1));
            };
        }

        public function get groupAfk():Boolean
        {
            return (_groupAfk);
        }

        [Bindable(event="propertyChange")]
        public function get isLeader():Boolean
        {
            return (this._432720173isLeader);
        }

        private function set _96960816expRe(_arg_1:Number):void
        {
            _expRe = _arg_1;
            levelRe = _core.basic.expReToLevelRe(_expRe);
        }

        public function get taskSweep():Boolean
        {
            return (_taskSweep);
        }

        [Bindable(event="propertyChange")]
        public function get _taskSweep():Boolean
        {
            return (this._1318998296_taskSweep);
        }


    }
}//package com.qeedoo.game.object

