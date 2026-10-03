// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.ShopSlotVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class ShopSlotVO implements IEventDispatcher 
    {

        private var _1871571223itemDescription:String;
        private var _3575610type:Number;
        private var _2127804432itemColor:uint;
        private var _3681st:int;
        private var _1302660062stackNum:int;
        private var _1579499688moneyType2:Number;
        private var _1713519590moneyType:Number;
        private var _1177331774itemName:String;
        private var _1087037752slotData:Object;
        private var _1177017728itemCost:Number;
        private var _3172733giid:Number;
        private var _1302658492stackMax:Number;
        private var _176116450limitNu:uint;
        private var _2127811250itemCost2:Number;
        private var _3145580flag:Number;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _100346066index:Number;

        public function ShopSlotVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get itemCost():Number
        {
            return (this._1177017728itemCost);
        }

        public function set itemCost(_arg_1:Number):void
        {
            var _local_2:Object = this._1177017728itemCost;
            if (_local_2 !== _arg_1)
            {
                this._1177017728itemCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemCost", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get moneyType():Number
        {
            return (this._1713519590moneyType);
        }

        public function set itemColor(_arg_1:uint):void
        {
            var _local_2:Object = this._2127804432itemColor;
            if (_local_2 !== _arg_1)
            {
                this._2127804432itemColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemColor", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemColor():uint
        {
            return (this._2127804432itemColor);
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
        public function get itemCost2():Number
        {
            return (this._2127811250itemCost2);
        }

        public function set moneyType2(_arg_1:Number):void
        {
            var _local_2:Object = this._1579499688moneyType2;
            if (_local_2 !== _arg_1)
            {
                this._1579499688moneyType2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyType2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get type():Number
        {
            return (this._3575610type);
        }

        public function set moneyType(_arg_1:Number):void
        {
            var _local_2:Object = this._1713519590moneyType;
            if (_local_2 !== _arg_1)
            {
                this._1713519590moneyType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyType", _local_2, _arg_1));
            };
        }

        public function set stackNum(_arg_1:int):void
        {
            var _local_2:Object = this._1302660062stackNum;
            if (_local_2 !== _arg_1)
            {
                this._1302660062stackNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stackNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemName():String
        {
            return (this._1177331774itemName);
        }

        public function set st(_arg_1:int):void
        {
            var _local_2:Object = this._3681st;
            if (_local_2 !== _arg_1)
            {
                this._3681st = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "st", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stackMax():Number
        {
            return (this._1302658492stackMax);
        }

        public function set limitNu(_arg_1:uint):void
        {
            var _local_2:Object = this._176116450limitNu;
            if (_local_2 !== _arg_1)
            {
                this._176116450limitNu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitNu", _local_2, _arg_1));
            };
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get slotData():Object
        {
            return (this._1087037752slotData);
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

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function set itemDescription(_arg_1:String):void
        {
            var _local_2:Object = this._1871571223itemDescription;
            if (_local_2 !== _arg_1)
            {
                this._1871571223itemDescription = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDescription", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stackNum():int
        {
            return (this._1302660062stackNum);
        }

        [Bindable(event="propertyChange")]
        public function get moneyType2():Number
        {
            return (this._1579499688moneyType2);
        }

        [Bindable(event="propertyChange")]
        public function get st():int
        {
            return (this._3681st);
        }

        [Bindable(event="propertyChange")]
        public function get limitNu():uint
        {
            return (this._176116450limitNu);
        }

        public function set itemCost2(_arg_1:Number):void
        {
            var _local_2:Object = this._2127811250itemCost2;
            if (_local_2 !== _arg_1)
            {
                this._2127811250itemCost2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemCost2", _local_2, _arg_1));
            };
        }

        public function set flag(_arg_1:Number):void
        {
            var _local_2:Object = this._3145580flag;
            if (_local_2 !== _arg_1)
            {
                this._3145580flag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "flag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemDescription():String
        {
            return (this._1871571223itemDescription);
        }

        [Bindable(event="propertyChange")]
        public function get flag():Number
        {
            return (this._3145580flag);
        }

        public function set type(_arg_1:Number):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }

        public function set stackMax(_arg_1:Number):void
        {
            var _local_2:Object = this._1302658492stackMax;
            if (_local_2 !== _arg_1)
            {
                this._1302658492stackMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stackMax", _local_2, _arg_1));
            };
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

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function set itemName(_arg_1:String):void
        {
            var _local_2:Object = this._1177331774itemName;
            if (_local_2 !== _arg_1)
            {
                this._1177331774itemName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get giid():Number
        {
            return (this._3172733giid);
        }


    }
}//package com.qeedoo.game.vo

