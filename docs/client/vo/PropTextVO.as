// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.PropTextVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class PropTextVO implements IEventDispatcher 
    {

        private var _bindingEventDispatcher:EventDispatcher;
        private var _309152637propOri:String;
        private var _993843058propName:String;
        private var _754105920propColor:uint;
        private var _1417869132propModified:String;

        public function PropTextVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        [Bindable(event="propertyChange")]
        public function get propColor():uint
        {
            return (this._754105920propColor);
        }

        [Bindable(event="propertyChange")]
        public function get propOri():String
        {
            return (this._309152637propOri);
        }

        public function set propOri(_arg_1:String):void
        {
            var _local_2:Object = this._309152637propOri;
            if (_local_2 !== _arg_1)
            {
                this._309152637propOri = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propOri", _local_2, _arg_1));
            };
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        [Bindable(event="propertyChange")]
        public function get propModified():String
        {
            return (this._1417869132propModified);
        }

        [Bindable(event="propertyChange")]
        public function get propName():String
        {
            return (this._993843058propName);
        }

        public function set propColor(_arg_1:uint):void
        {
            var _local_2:Object = this._754105920propColor;
            if (_local_2 !== _arg_1)
            {
                this._754105920propColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propColor", _local_2, _arg_1));
            };
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function set propName(_arg_1:String):void
        {
            var _local_2:Object = this._993843058propName;
            if (_local_2 !== _arg_1)
            {
                this._993843058propName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propName", _local_2, _arg_1));
            };
        }

        public function set propModified(_arg_1:String):void
        {
            var _local_2:Object = this._1417869132propModified;
            if (_local_2 !== _arg_1)
            {
                this._1417869132propModified = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propModified", _local_2, _arg_1));
            };
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }


    }
}//package com.qeedoo.game.vo

