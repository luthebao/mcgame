// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.SkillSlotVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class SkillSlotVO implements IEventDispatcher 
    {

        private var _3373707name:String;
        private var _3575610type:int = 52;
        private var _3059661cost:int;
        private var _747804969position:String;
        private var _102865796level:String;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _3172733giid:Number;
        private var _106845584point:int;
        private var _1087037752slotData:Object;
        private var _100346066index:Number;
        private var _3292052kind:int;

        public function SkillSlotVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
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

        [Bindable(event="propertyChange")]
        public function get level():String
        {
            return (this._102865796level);
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        public function set level(_arg_1:String):void
        {
            var _local_2:Object = this._102865796level;
            if (_local_2 !== _arg_1)
            {
                this._102865796level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "level", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name():String
        {
            return (this._3373707name);
        }

        [Bindable(event="propertyChange")]
        public function get kind():int
        {
            return (this._3292052kind);
        }

        public function set name(_arg_1:String):void
        {
            var _local_2:Object = this._3373707name;
            if (_local_2 !== _arg_1)
            {
                this._3373707name = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get point():int
        {
            return (this._106845584point);
        }

        public function set cost(_arg_1:int):void
        {
            var _local_2:Object = this._3059661cost;
            if (_local_2 !== _arg_1)
            {
                this._3059661cost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cost", _local_2, _arg_1));
            };
        }

        public function set slotData(_arg_1:Object):void
        {
            var _local_2:Object = this._1087037752slotData;
            if (_local_2 !== _arg_1)
            {
                this._1087037752slotData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotData", _local_2, _arg_1));
            };
        }

        public function set point(_arg_1:int):void
        {
            var _local_2:Object = this._106845584point;
            if (_local_2 !== _arg_1)
            {
                this._106845584point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "point", _local_2, _arg_1));
            };
        }

        public function set kind(_arg_1:int):void
        {
            var _local_2:Object = this._3292052kind;
            if (_local_2 !== _arg_1)
            {
                this._3292052kind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kind", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get position():String
        {
            return (this._747804969position);
        }

        public function set index(_arg_1:Number):void
        {
            var _local_2:Object = this._100346066index;
            if (_local_2 !== _arg_1)
            {
                this._100346066index = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "index", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get type():int
        {
            return (this._3575610type);
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        [Bindable(event="propertyChange")]
        public function get index():Number
        {
            return (this._100346066index);
        }

        [Bindable(event="propertyChange")]
        public function get cost():int
        {
            return (this._3059661cost);
        }

        [Bindable(event="propertyChange")]
        public function get slotData():Object
        {
            return (this._1087037752slotData);
        }

        public function set position(_arg_1:String):void
        {
            var _local_2:Object = this._747804969position;
            if (_local_2 !== _arg_1)
            {
                this._747804969position = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "position", _local_2, _arg_1));
            };
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function set giid(_arg_1:Number):void
        {
            var _local_2:Object = this._3172733giid;
            if (_local_2 !== _arg_1)
            {
                this._3172733giid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "giid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get giid():Number
        {
            return (this._3172733giid);
        }


    }
}//package com.qeedoo.game.vo

