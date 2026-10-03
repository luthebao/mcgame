// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.BuffVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class BuffVO implements IEventDispatcher 
    {

        private var _759220509timeLeftStr:String;
        private var _1140107293toolTip:String;
        private var _97533bid:Number;
        private var _1148582130addTime:Number;
        private var _1313955948timeAll:Number;
        private var _3035219buff:int;
        private var _3575610type:int;
        private var _2053458143battleLeft:int;
        private var _525658375hasRoundLimit:Boolean = true;
        private var _1065974863needTimer:Boolean = false;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _896505829source:String;
        private var _3355id:Number;
        private var _2077607820timeLeft:Number;
        private var _5288267roundLeft:int;
        private var _1327629297ineffectiveTime:Number;

        public function BuffVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get hasRoundLimit():Boolean
        {
            return (this._525658375hasRoundLimit);
        }

        [Bindable(event="propertyChange")]
        public function get addTime():Number
        {
            return (this._1148582130addTime);
        }

        public function set hasRoundLimit(_arg_1:Boolean):void
        {
            var _local_2:Object = this._525658375hasRoundLimit;
            if (_local_2 !== _arg_1)
            {
                this._525658375hasRoundLimit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hasRoundLimit", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get id():Number
        {
            return (this._3355id);
        }

        public function set addTime(_arg_1:Number):void
        {
            var _local_2:Object = this._1148582130addTime;
            if (_local_2 !== _arg_1)
            {
                this._1148582130addTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeLeftStr():String
        {
            return (this._759220509timeLeftStr);
        }

        public function set ineffectiveTime(_arg_1:Number):void
        {
            var _local_2:Object = this._1327629297ineffectiveTime;
            if (_local_2 !== _arg_1)
            {
                this._1327629297ineffectiveTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ineffectiveTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get source():String
        {
            return (this._896505829source);
        }

        [Bindable(event="propertyChange")]
        public function get timeAll():Number
        {
            return (this._1313955948timeAll);
        }

        [Bindable(event="propertyChange")]
        public function get ineffectiveTime():Number
        {
            return (this._1327629297ineffectiveTime);
        }

        public function set timeAll(_arg_1:Number):void
        {
            var _local_2:Object = this._1313955948timeAll;
            if (_local_2 !== _arg_1)
            {
                this._1313955948timeAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeAll", _local_2, _arg_1));
            };
        }

        public function set buff(_arg_1:int):void
        {
            var _local_2:Object = this._3035219buff;
            if (_local_2 !== _arg_1)
            {
                this._3035219buff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buff", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get roundLeft():int
        {
            return (this._5288267roundLeft);
        }

        public function set id(_arg_1:Number):void
        {
            var _local_2:Object = this._3355id;
            if (_local_2 !== _arg_1)
            {
                this._3355id = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "id", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get type():int
        {
            return (this._3575610type);
        }

        public function set battleLeft(_arg_1:int):void
        {
            var _local_2:Object = this._2053458143battleLeft;
            if (_local_2 !== _arg_1)
            {
                this._2053458143battleLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleLeft", _local_2, _arg_1));
            };
        }

        public function set needTimer(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1065974863needTimer;
            if (_local_2 !== _arg_1)
            {
                this._1065974863needTimer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needTimer", _local_2, _arg_1));
            };
        }

        public function set source(_arg_1:String):void
        {
            var _local_2:Object = this._896505829source;
            if (_local_2 !== _arg_1)
            {
                this._896505829source = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "source", _local_2, _arg_1));
            };
        }

        public function set toolTip(_arg_1:String):void
        {
            var _local_2:Object = this._1140107293toolTip;
            if (_local_2 !== _arg_1)
            {
                this._1140107293toolTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toolTip", _local_2, _arg_1));
            };
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function set timeLeftStr(_arg_1:String):void
        {
            var _local_2:Object = this._759220509timeLeftStr;
            if (_local_2 !== _arg_1)
            {
                this._759220509timeLeftStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLeftStr", _local_2, _arg_1));
            };
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        [Bindable(event="propertyChange")]
        public function get needTimer():Boolean
        {
            return (this._1065974863needTimer);
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        [Bindable(event="propertyChange")]
        public function get buff():int
        {
            return (this._3035219buff);
        }

        public function get battleBuffTooltip():String
        {
            if (hasRoundLimit)
            {
                return (toolTip + roundLeft);
            };
            return (toolTip);
        }

        [Bindable(event="propertyChange")]
        public function get battleLeft():int
        {
            return (this._2053458143battleLeft);
        }

        [Bindable(event="propertyChange")]
        public function get toolTip():String
        {
            return (this._1140107293toolTip);
        }

        public function set timeLeft(_arg_1:Number):void
        {
            var _local_2:Object = this._2077607820timeLeft;
            if (_local_2 !== _arg_1)
            {
                this._2077607820timeLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLeft", _local_2, _arg_1));
            };
        }

        public function set roundLeft(_arg_1:int):void
        {
            var _local_2:Object = this._5288267roundLeft;
            if (_local_2 !== _arg_1)
            {
                this._5288267roundLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roundLeft", _local_2, _arg_1));
            };
        }

        public function set type(_arg_1:int):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }

        public function set bid(_arg_1:Number):void
        {
            var _local_2:Object = this._97533bid;
            if (_local_2 !== _arg_1)
            {
                this._97533bid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeLeft():Number
        {
            return (this._2077607820timeLeft);
        }

        [Bindable(event="propertyChange")]
        public function get bid():Number
        {
            return (this._97533bid);
        }


    }
}//package com.qeedoo.game.vo

