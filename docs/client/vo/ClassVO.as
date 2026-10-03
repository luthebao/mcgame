// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.ClassVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class ClassVO implements IEventDispatcher 
    {

        private var _1259379801resCodeFemale:Number;
        private var _3355id:int;
        private var _1543550368aptAgility:int;
        private var _1270522743attEnergy:int;
        private var _1484072972largeImgFemale:Number;
        private var _1319279616attIntelligence:int;
        private var _348170509aptEnergy:int;
        private var _1507058930iconCodeFemale:Number;
        private var _985636905descriptionMale:String;
        private var _1918674506colorCodeMale3:int;
        private var _183433628attAgility:int;
        private var _646890503brightCode:int;
        private var _3373707name:String;
        private var _349942603largeImgMale:Number;
        private var _1911434378aptStamina:int;
        private var _2107580008descriptionFemale:String;
        private var _726281148imgCodeFemale:Number;
        private var _430564954resCodeMale:Number;
        private var _1023416178attStamina:int;
        private var _1330341732classDescription:String;
        private var _1918674507colorCodeMale2:int;
        private var _1905926168schoolDescription:String;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _1187557461colorCodeFemale1:int;
        private var _766017843iconCodeMale:Number;
        private var _1187557462colorCodeFemale2:int;
        private var _1187557463colorCodeFemale3:int;
        private var _395626106aptStrength:int;
        private var _1181680126attStrength:int;
        private var _1918674508colorCodeMale1:int;
        private var _702954884aptIntelligence:int;
        private var _1934232963imgCodeMale:Number;

        public function ClassVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        [Bindable(event="propertyChange")]
        public function get attIntelligence():int
        {
            return (this._1319279616attIntelligence);
        }

        [Bindable(event="propertyChange")]
        public function get attStrength():int
        {
            return (this._1181680126attStrength);
        }

        public function set attStrength(_arg_1:int):void
        {
            var _local_2:Object = this._1181680126attStrength;
            if (_local_2 !== _arg_1)
            {
                this._1181680126attStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attStrength", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get brightCode():int
        {
            return (this._646890503brightCode);
        }

        public function set aptIntelligence(_arg_1:int):void
        {
            var _local_2:Object = this._702954884aptIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._702954884aptIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptIntelligence", _local_2, _arg_1));
            };
        }

        public function set aptStrength(_arg_1:int):void
        {
            var _local_2:Object = this._395626106aptStrength;
            if (_local_2 !== _arg_1)
            {
                this._395626106aptStrength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStrength", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptEnergy():int
        {
            return (this._348170509aptEnergy);
        }

        public function set brightCode(_arg_1:int):void
        {
            var _local_2:Object = this._646890503brightCode;
            if (_local_2 !== _arg_1)
            {
                this._646890503brightCode = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "brightCode", _local_2, _arg_1));
            };
        }

        public function set attIntelligence(_arg_1:int):void
        {
            var _local_2:Object = this._1319279616attIntelligence;
            if (_local_2 !== _arg_1)
            {
                this._1319279616attIntelligence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attIntelligence", _local_2, _arg_1));
            };
        }

        public function set aptStamina(_arg_1:int):void
        {
            var _local_2:Object = this._1911434378aptStamina;
            if (_local_2 !== _arg_1)
            {
                this._1911434378aptStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStamina", _local_2, _arg_1));
            };
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

        public function set attEnergy(_arg_1:int):void
        {
            var _local_2:Object = this._1270522743attEnergy;
            if (_local_2 !== _arg_1)
            {
                this._1270522743attEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attEnergy", _local_2, _arg_1));
            };
        }

        public function set aptEnergy(_arg_1:int):void
        {
            var _local_2:Object = this._348170509aptEnergy;
            if (_local_2 !== _arg_1)
            {
                this._348170509aptEnergy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptEnergy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get id():int
        {
            return (this._3355id);
        }

        public function set attStamina(_arg_1:int):void
        {
            var _local_2:Object = this._1023416178attStamina;
            if (_local_2 !== _arg_1)
            {
                this._1023416178attStamina = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attStamina", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get descriptionMale():String
        {
            return (this._985636905descriptionMale);
        }

        [Bindable(event="propertyChange")]
        public function get iconCodeMale():Number
        {
            return (this._766017843iconCodeMale);
        }

        public function set id(_arg_1:int):void
        {
            var _local_2:Object = this._3355id;
            if (_local_2 !== _arg_1)
            {
                this._3355id = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "id", _local_2, _arg_1));
            };
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function set descriptionMale(_arg_1:String):void
        {
            var _local_2:Object = this._985636905descriptionMale;
            if (_local_2 !== _arg_1)
            {
                this._985636905descriptionMale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descriptionMale", _local_2, _arg_1));
            };
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
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeFemale1():int
        {
            return (this._1187557461colorCodeFemale1);
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeFemale2():int
        {
            return (this._1187557462colorCodeFemale2);
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeFemale3():int
        {
            return (this._1187557463colorCodeFemale3);
        }

        [Bindable(event="propertyChange")]
        public function get resCodeFemale():Number
        {
            return (this._1259379801resCodeFemale);
        }

        [Bindable(event="propertyChange")]
        public function get resCodeMale():Number
        {
            return (this._430564954resCodeMale);
        }

        [Bindable(event="propertyChange")]
        public function get aptAgility():int
        {
            return (this._1543550368aptAgility);
        }

        [Bindable(event="propertyChange")]
        public function get classDescription():String
        {
            return (this._1330341732classDescription);
        }

        public function set colorCodeMale1(_arg_1:int):void
        {
            var _local_2:Object = this._1918674508colorCodeMale1;
            if (_local_2 !== _arg_1)
            {
                this._1918674508colorCodeMale1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeMale1", _local_2, _arg_1));
            };
        }

        public function set largeImgMale(_arg_1:Number):void
        {
            var _local_2:Object = this._349942603largeImgMale;
            if (_local_2 !== _arg_1)
            {
                this._349942603largeImgMale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "largeImgMale", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attAgility():int
        {
            return (this._183433628attAgility);
        }

        public function set colorCodeMale3(_arg_1:int):void
        {
            var _local_2:Object = this._1918674506colorCodeMale3;
            if (_local_2 !== _arg_1)
            {
                this._1918674506colorCodeMale3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeMale3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get descriptionFemale():String
        {
            return (this._2107580008descriptionFemale);
        }

        public function set colorCodeMale2(_arg_1:int):void
        {
            var _local_2:Object = this._1918674507colorCodeMale2;
            if (_local_2 !== _arg_1)
            {
                this._1918674507colorCodeMale2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeMale2", _local_2, _arg_1));
            };
        }

        public function set iconCodeMale(_arg_1:Number):void
        {
            var _local_2:Object = this._766017843iconCodeMale;
            if (_local_2 !== _arg_1)
            {
                this._766017843iconCodeMale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconCodeMale", _local_2, _arg_1));
            };
        }

        public function set imgCodeFemale(_arg_1:Number):void
        {
            var _local_2:Object = this._726281148imgCodeFemale;
            if (_local_2 !== _arg_1)
            {
                this._726281148imgCodeFemale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgCodeFemale", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgCodeMale():Number
        {
            return (this._1934232963imgCodeMale);
        }

        [Bindable(event="propertyChange")]
        public function get aptIntelligence():int
        {
            return (this._702954884aptIntelligence);
        }

        [Bindable(event="propertyChange")]
        public function get aptStrength():int
        {
            return (this._395626106aptStrength);
        }

        [Bindable(event="propertyChange")]
        public function get aptStamina():int
        {
            return (this._1911434378aptStamina);
        }

        [Bindable(event="propertyChange")]
        public function get name():String
        {
            return (this._3373707name);
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get attEnergy():int
        {
            return (this._1270522743attEnergy);
        }

        public function set colorCodeFemale1(_arg_1:int):void
        {
            var _local_2:Object = this._1187557461colorCodeFemale1;
            if (_local_2 !== _arg_1)
            {
                this._1187557461colorCodeFemale1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeFemale1", _local_2, _arg_1));
            };
        }

        public function set colorCodeFemale3(_arg_1:int):void
        {
            var _local_2:Object = this._1187557463colorCodeFemale3;
            if (_local_2 !== _arg_1)
            {
                this._1187557463colorCodeFemale3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeFemale3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attStamina():int
        {
            return (this._1023416178attStamina);
        }

        public function set colorCodeFemale2(_arg_1:int):void
        {
            var _local_2:Object = this._1187557462colorCodeFemale2;
            if (_local_2 !== _arg_1)
            {
                this._1187557462colorCodeFemale2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeFemale2", _local_2, _arg_1));
            };
        }

        public function set resCodeMale(_arg_1:Number):void
        {
            var _local_2:Object = this._430564954resCodeMale;
            if (_local_2 !== _arg_1)
            {
                this._430564954resCodeMale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resCodeMale", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get largeImgMale():Number
        {
            return (this._349942603largeImgMale);
        }

        public function set resCodeFemale(_arg_1:Number):void
        {
            var _local_2:Object = this._1259379801resCodeFemale;
            if (_local_2 !== _arg_1)
            {
                this._1259379801resCodeFemale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resCodeFemale", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeMale1():int
        {
            return (this._1918674508colorCodeMale1);
        }

        [Bindable(event="propertyChange")]
        public function get imgCodeFemale():Number
        {
            return (this._726281148imgCodeFemale);
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeMale3():int
        {
            return (this._1918674506colorCodeMale3);
        }

        public function set aptAgility(_arg_1:int):void
        {
            var _local_2:Object = this._1543550368aptAgility;
            if (_local_2 !== _arg_1)
            {
                this._1543550368aptAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgility", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeMale2():int
        {
            return (this._1918674507colorCodeMale2);
        }

        public function set classDescription(_arg_1:String):void
        {
            var _local_2:Object = this._1330341732classDescription;
            if (_local_2 !== _arg_1)
            {
                this._1330341732classDescription = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classDescription", _local_2, _arg_1));
            };
        }

        public function set descriptionFemale(_arg_1:String):void
        {
            var _local_2:Object = this._2107580008descriptionFemale;
            if (_local_2 !== _arg_1)
            {
                this._2107580008descriptionFemale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descriptionFemale", _local_2, _arg_1));
            };
        }

        public function set schoolDescription(_arg_1:String):void
        {
            var _local_2:Object = this._1905926168schoolDescription;
            if (_local_2 !== _arg_1)
            {
                this._1905926168schoolDescription = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "schoolDescription", _local_2, _arg_1));
            };
        }

        public function set iconCodeFemale(_arg_1:Number):void
        {
            var _local_2:Object = this._1507058930iconCodeFemale;
            if (_local_2 !== _arg_1)
            {
                this._1507058930iconCodeFemale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconCodeFemale", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get schoolDescription():String
        {
            return (this._1905926168schoolDescription);
        }

        public function set attAgility(_arg_1:int):void
        {
            var _local_2:Object = this._183433628attAgility;
            if (_local_2 !== _arg_1)
            {
                this._183433628attAgility = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attAgility", _local_2, _arg_1));
            };
        }

        public function set largeImgFemale(_arg_1:Number):void
        {
            var _local_2:Object = this._1484072972largeImgFemale;
            if (_local_2 !== _arg_1)
            {
                this._1484072972largeImgFemale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "largeImgFemale", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconCodeFemale():Number
        {
            return (this._1507058930iconCodeFemale);
        }

        [Bindable(event="propertyChange")]
        public function get largeImgFemale():Number
        {
            return (this._1484072972largeImgFemale);
        }

        public function set imgCodeMale(_arg_1:Number):void
        {
            var _local_2:Object = this._1934232963imgCodeMale;
            if (_local_2 !== _arg_1)
            {
                this._1934232963imgCodeMale = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgCodeMale", _local_2, _arg_1));
            };
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }


    }
}//package com.qeedoo.game.vo

