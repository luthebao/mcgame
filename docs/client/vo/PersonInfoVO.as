// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.PersonInfoVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class PersonInfoVO implements IEventDispatcher 
    {

        private var _1435363073charName:String;
        private var _103671180maxHp:int;
        private var _1088997916currentExp:Number;
        private var _432720173isLeader:Boolean;
        private var _657608118currentSp:int;
        private var _657607932currentMp:int;
        private var _103671335maxMp:int;
        private var _102865796level:int;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _2067266016showExp:Boolean;
        private var _1536740290charClass:String;
        private var _103671521maxSp:int;
        private var _657607777currentHp:int;
        private var _934457169resUrl:String;
        private var _1081163239maxExp:Number;

        public function PersonInfoVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        public function set charClass(_arg_1:String):void
        {
            var _local_2:Object = this._1536740290charClass;
            if (_local_2 !== _arg_1)
            {
                this._1536740290charClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charClass", _local_2, _arg_1));
            };
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get charName():String
        {
            return (this._1435363073charName);
        }

        [Bindable(event="propertyChange")]
        public function get level():int
        {
            return (this._102865796level);
        }

        [Bindable(event="propertyChange")]
        public function get maxHp():int
        {
            return (this._103671180maxHp);
        }

        public function set level(_arg_1:int):void
        {
            var _local_2:Object = this._102865796level;
            if (_local_2 !== _arg_1)
            {
                this._102865796level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "level", _local_2, _arg_1));
            };
        }

        public function set charName(_arg_1:String):void
        {
            var _local_2:Object = this._1435363073charName;
            if (_local_2 !== _arg_1)
            {
                this._1435363073charName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "charName", _local_2, _arg_1));
            };
        }

        public function set maxHp(_arg_1:int):void
        {
            var _local_2:Object = this._103671180maxHp;
            if (_local_2 !== _arg_1)
            {
                this._103671180maxHp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxHp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get maxExp():Number
        {
            return (this._1081163239maxExp);
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

        [Bindable(event="propertyChange")]
        public function get maxMp():int
        {
            return (this._103671335maxMp);
        }

        [Bindable(event="propertyChange")]
        public function get resUrl():String
        {
            return (this._934457169resUrl);
        }

        public function set maxExp(_arg_1:Number):void
        {
            var _local_2:Object = this._1081163239maxExp;
            if (_local_2 !== _arg_1)
            {
                this._1081163239maxExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currentSp():int
        {
            return (this._657608118currentSp);
        }

        public function set showExp(_arg_1:Boolean):void
        {
            var _local_2:Object = this._2067266016showExp;
            if (_local_2 !== _arg_1)
            {
                this._2067266016showExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showExp", _local_2, _arg_1));
            };
        }

        public function set maxSp(_arg_1:int):void
        {
            var _local_2:Object = this._103671521maxSp;
            if (_local_2 !== _arg_1)
            {
                this._103671521maxSp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxSp", _local_2, _arg_1));
            };
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function set currentExp(_arg_1:Number):void
        {
            var _local_2:Object = this._1088997916currentExp;
            if (_local_2 !== _arg_1)
            {
                this._1088997916currentExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get charClass():String
        {
            return (this._1536740290charClass);
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function set maxMp(_arg_1:int):void
        {
            var _local_2:Object = this._103671335maxMp;
            if (_local_2 !== _arg_1)
            {
                this._103671335maxMp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxMp", _local_2, _arg_1));
            };
        }

        public function set currentHp(_arg_1:int):void
        {
            var _local_2:Object = this._657607777currentHp;
            if (_local_2 !== _arg_1)
            {
                this._657607777currentHp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentHp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get isLeader():Boolean
        {
            return (this._432720173isLeader);
        }

        public function set resUrl(_arg_1:String):void
        {
            var _local_2:Object = this._934457169resUrl;
            if (_local_2 !== _arg_1)
            {
                this._934457169resUrl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resUrl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get showExp():Boolean
        {
            return (this._2067266016showExp);
        }

        [Bindable(event="propertyChange")]
        public function get currentHp():int
        {
            return (this._657607777currentHp);
        }

        [Bindable(event="propertyChange")]
        public function get currentExp():Number
        {
            return (this._1088997916currentExp);
        }

        public function set currentSp(_arg_1:int):void
        {
            var _local_2:Object = this._657608118currentSp;
            if (_local_2 !== _arg_1)
            {
                this._657608118currentSp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentSp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get maxSp():int
        {
            return (this._103671521maxSp);
        }

        public function set currentMp(_arg_1:int):void
        {
            var _local_2:Object = this._657607932currentMp;
            if (_local_2 !== _arg_1)
            {
                this._657607932currentMp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentMp", _local_2, _arg_1));
            };
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get currentMp():int
        {
            return (this._657607932currentMp);
        }


    }
}//package com.qeedoo.game.vo

