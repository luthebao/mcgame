// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.ToolTipVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class ToolTipVO implements IEventDispatcher 
    {

        private var _993674992propSuit:String;
        private var _1786820714genMCost:String;
        private var _755439989propBasic:String;
        private var _3062044cre2:int;
        private var _2125731805priceType:String;
        private var _994192832propBind:String;
        private var _1611566147customize:String;
        private var _1411922449bProp4:String;
        private var _2043719706activeLine:String;
        private var _1411922452bProp1:String;
        private var _815592395targetNum:String;
        private var _1005290219currencyType:int;
        private var _575402001currency:Number;
        private var _2043958003activeTime:String;
        private var _1306045074preSkill:String;
        private var _1869749240maintainCost:String;
        private var _108401031reqCL:String;
        private var _204474875activeNPC:String;
        private var _1894776345clsJewel2:Class;
        private var _103659588maker:String;
        private var _1407588379costVisible:Boolean;
        private var _439241862reqClass:String;
        private var _756288675propAdded:String;
        private var _1310369910expCost:String;
        private var _1178238231clsStar3:Class;
        private var _3062043cre1:int;
        private var _1178238233clsStar5:Class;
        private var _1178238235clsStar7:Class;
        private var _3062047cre5:int;
        private var _1178238237clsStar9:Class;
        private var _3237038info:String;
        private var _1714035539moneyCost:String;
        private var _934532241reqEnv:String;
        private var _1298740563endure:String;
        private var _102865796level:String;
        private var _1454910359currentPoint:String;
        private var _1894776347clsJewel4:Class;
        private var _1576501672rareMCost:String;
        private var _441785000equSkill0:String;
        private var _1894776351clsJewel8:Class;
        private var _1249743735effectEndTime:String;
        private var _431118970reqLevel:String;
        private var _664016577propFeatherPet:String;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _1511253621activeEquipName:String;
        private var _2129320517clsStar10:Class;
        private var _1894776349clsJewel6:Class;
        private var _722769290btnVisible:Boolean;
        private var _1411922451bProp2:String;
        private var _3575610type:String;
        private var _106934601price:String;
        private var _3062046cre4:int;
        private var _747804969position:String;
        private var _1306563286guildExp:String;
        private var _170514808urlIcon:String;
        private var _1715818494effectTime:String;
        private var _3023933bind:String;
        private var _1249801634lwingName:String;
        private var _1469746035guildMoney:String;
        private var _1894776344clsJewel1:Class;
        private var _1724546052description:String;
        private var _747928928propJewel:String;
        private var _762141852dexProgress:String;
        private var _9888733className:String;
        private var _3292052kind:String;
        private var _267844315magicWeaponLevel:String;
        private var _1178238229clsStar1:Class;
        private var _1984815176preBuilds:Array;
        private var _993680394propSoul:String;
        private var _1952114124expSkill:String;
        private var _1662836996element:String;
        private var _148001439useType:String;
        private var _96805apt:String;
        private var _3373707name:String;
        private var _1178238232clsStar4:Class;
        private var _1178238230clsStar2:Class;
        private var _1178238234clsStar6:Class;
        private var _1178238236clsStar8:Class;
        private var _3062045cre3:int;
        private var _1894776346clsJewel3:Class;
        private var _1894776350clsJewel7:Class;
        private var _951516156consume:String;
        private var _1391475432clsJewel10:Class;
        private var _889937718propFeatherChar:String;
        private var _1470959791guildLevel:String;
        private var _1411922450bProp3:String;
        private var _1894776348clsJewel5:Class;
        private var _1894776352clsJewel9:Class;
        private var _333642022guildContrib:String;

        public function ToolTipVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        [Bindable(event="propertyChange")]
        public function get activeNPC():String
        {
            return (this._204474875activeNPC);
        }

        public function set activeNPC(_arg_1:String):void
        {
            var _local_2:Object = this._204474875activeNPC;
            if (_local_2 !== _arg_1)
            {
                this._204474875activeNPC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeNPC", _local_2, _arg_1));
            };
        }

        public function set consume(_arg_1:String):void
        {
            var _local_2:Object = this._951516156consume;
            if (_local_2 !== _arg_1)
            {
                this._951516156consume = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consume", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get consume():String
        {
            return (this._951516156consume);
        }

        [Bindable(event="propertyChange")]
        public function get maintainCost():String
        {
            return (this._1869749240maintainCost);
        }

        [Bindable(event="propertyChange")]
        public function get costVisible():Boolean
        {
            return (this._1407588379costVisible);
        }

        [Bindable(event="propertyChange")]
        public function get currency():Number
        {
            return (this._575402001currency);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel2():Class
        {
            return (this._1894776345clsJewel2);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel4():Class
        {
            return (this._1894776347clsJewel4);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel5():Class
        {
            return (this._1894776348clsJewel5);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel6():Class
        {
            return (this._1894776349clsJewel6);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel7():Class
        {
            return (this._1894776350clsJewel7);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel1():Class
        {
            return (this._1894776344clsJewel1);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel3():Class
        {
            return (this._1894776346clsJewel3);
        }

        [Bindable(event="propertyChange")]
        public function get className():String
        {
            return (this._9888733className);
        }

        [Bindable(event="propertyChange")]
        public function get apt():String
        {
            return (this._96805apt);
        }

        public function set clsStar1(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238229clsStar1;
            if (_local_2 !== _arg_1)
            {
                this._1178238229clsStar1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar1", _local_2, _arg_1));
            };
        }

        public function set clsStar2(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238230clsStar2;
            if (_local_2 !== _arg_1)
            {
                this._1178238230clsStar2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar2", _local_2, _arg_1));
            };
        }

        public function set clsStar3(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238231clsStar3;
            if (_local_2 !== _arg_1)
            {
                this._1178238231clsStar3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar3", _local_2, _arg_1));
            };
        }

        public function set clsStar5(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238233clsStar5;
            if (_local_2 !== _arg_1)
            {
                this._1178238233clsStar5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get targetNum():String
        {
            return (this._815592395targetNum);
        }

        public function set clsStar7(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238235clsStar7;
            if (_local_2 !== _arg_1)
            {
                this._1178238235clsStar7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar7", _local_2, _arg_1));
            };
        }

        public function set clsStar4(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238232clsStar4;
            if (_local_2 !== _arg_1)
            {
                this._1178238232clsStar4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar4", _local_2, _arg_1));
            };
        }

        public function set clsStar8(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238236clsStar8;
            if (_local_2 !== _arg_1)
            {
                this._1178238236clsStar8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar8", _local_2, _arg_1));
            };
        }

        public function set clsJewel2(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776345clsJewel2;
            if (_local_2 !== _arg_1)
            {
                this._1894776345clsJewel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel2", _local_2, _arg_1));
            };
        }

        public function set currency(_arg_1:Number):void
        {
            var _local_2:Object = this._575402001currency;
            if (_local_2 !== _arg_1)
            {
                this._575402001currency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currency", _local_2, _arg_1));
            };
        }

        public function set clsJewel7(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776350clsJewel7;
            if (_local_2 !== _arg_1)
            {
                this._1894776350clsJewel7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bind():String
        {
            return (this._3023933bind);
        }

        public function set clsJewel8(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776351clsJewel8;
            if (_local_2 !== _arg_1)
            {
                this._1894776351clsJewel8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel8", _local_2, _arg_1));
            };
        }

        public function set clsJewel1(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776344clsJewel1;
            if (_local_2 !== _arg_1)
            {
                this._1894776344clsJewel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel1", _local_2, _arg_1));
            };
        }

        public function set clsStar9(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238237clsStar9;
            if (_local_2 !== _arg_1)
            {
                this._1178238237clsStar9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel9():Class
        {
            return (this._1894776352clsJewel9);
        }

        [Bindable(event="propertyChange")]
        public function get expSkill():String
        {
            return (this._1952114124expSkill);
        }

        public function set clsJewel4(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776347clsJewel4;
            if (_local_2 !== _arg_1)
            {
                this._1894776347clsJewel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propBind():String
        {
            return (this._994192832propBind);
        }

        public function set clsJewel6(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776349clsJewel6;
            if (_local_2 !== _arg_1)
            {
                this._1894776349clsJewel6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel6", _local_2, _arg_1));
            };
        }

        public function set apt(_arg_1:String):void
        {
            var _local_2:Object = this._96805apt;
            if (_local_2 !== _arg_1)
            {
                this._96805apt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "apt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get maker():String
        {
            return (this._103659588maker);
        }

        public function set guildContrib(_arg_1:String):void
        {
            var _local_2:Object = this._333642022guildContrib;
            if (_local_2 !== _arg_1)
            {
                this._333642022guildContrib = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildContrib", _local_2, _arg_1));
            };
        }

        public function set className(_arg_1:String):void
        {
            var _local_2:Object = this._9888733className;
            if (_local_2 !== _arg_1)
            {
                this._9888733className = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "className", _local_2, _arg_1));
            };
        }

        public function set cre1(_arg_1:int):void
        {
            var _local_2:Object = this._3062043cre1;
            if (_local_2 !== _arg_1)
            {
                this._3062043cre1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cre1", _local_2, _arg_1));
            };
        }

        public function set clsJewel9(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776352clsJewel9;
            if (_local_2 !== _arg_1)
            {
                this._1894776352clsJewel9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel9", _local_2, _arg_1));
            };
        }

        public function set clsJewel5(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776348clsJewel5;
            if (_local_2 !== _arg_1)
            {
                this._1894776348clsJewel5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel5", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get activeLine():String
        {
            return (this._2043719706activeLine);
        }

        public function set guildExp(_arg_1:String):void
        {
            var _local_2:Object = this._1306563286guildExp;
            if (_local_2 !== _arg_1)
            {
                this._1306563286guildExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildExp", _local_2, _arg_1));
            };
        }

        public function set priceType(_arg_1:String):void
        {
            var _local_2:Object = this._2125731805priceType;
            if (_local_2 !== _arg_1)
            {
                this._2125731805priceType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "priceType", _local_2, _arg_1));
            };
        }

        public function set clsStar6(_arg_1:Class):void
        {
            var _local_2:Object = this._1178238234clsStar6;
            if (_local_2 !== _arg_1)
            {
                this._1178238234clsStar6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel8():Class
        {
            return (this._1894776351clsJewel8);
        }

        public function set propSuit(_arg_1:String):void
        {
            var _local_2:Object = this._993674992propSuit;
            if (_local_2 !== _arg_1)
            {
                this._993674992propSuit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propSuit", _local_2, _arg_1));
            };
        }

        public function set cre2(_arg_1:int):void
        {
            var _local_2:Object = this._3062044cre2;
            if (_local_2 !== _arg_1)
            {
                this._3062044cre2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cre2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get customize():String
        {
            return (this._1611566147customize);
        }

        public function set cre3(_arg_1:int):void
        {
            var _local_2:Object = this._3062045cre3;
            if (_local_2 !== _arg_1)
            {
                this._3062045cre3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cre3", _local_2, _arg_1));
            };
        }

        public function set clsJewel10(_arg_1:Class):void
        {
            var _local_2:Object = this._1391475432clsJewel10;
            if (_local_2 !== _arg_1)
            {
                this._1391475432clsJewel10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel10", _local_2, _arg_1));
            };
        }

        public function set clsJewel3(_arg_1:Class):void
        {
            var _local_2:Object = this._1894776346clsJewel3;
            if (_local_2 !== _arg_1)
            {
                this._1894776346clsJewel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsJewel3", _local_2, _arg_1));
            };
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        [Bindable(event="propertyChange")]
        public function get rareMCost():String
        {
            return (this._1576501672rareMCost);
        }

        public function set cre4(_arg_1:int):void
        {
            var _local_2:Object = this._3062046cre4;
            if (_local_2 !== _arg_1)
            {
                this._3062046cre4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cre4", _local_2, _arg_1));
            };
        }

        public function set cre5(_arg_1:int):void
        {
            var _local_2:Object = this._3062047cre5;
            if (_local_2 !== _arg_1)
            {
                this._3062047cre5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cre5", _local_2, _arg_1));
            };
        }

        public function set propFeatherChar(_arg_1:String):void
        {
            var _local_2:Object = this._889937718propFeatherChar;
            if (_local_2 !== _arg_1)
            {
                this._889937718propFeatherChar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propFeatherChar", _local_2, _arg_1));
            };
        }

        public function set activeLine(_arg_1:String):void
        {
            var _local_2:Object = this._2043719706activeLine;
            if (_local_2 !== _arg_1)
            {
                this._2043719706activeLine = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeLine", _local_2, _arg_1));
            };
        }

        public function set expSkill(_arg_1:String):void
        {
            var _local_2:Object = this._1952114124expSkill;
            if (_local_2 !== _arg_1)
            {
                this._1952114124expSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expSkill", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeEquipName():String
        {
            return (this._1511253621activeEquipName);
        }

        [Bindable(event="propertyChange")]
        public function get btnVisible():Boolean
        {
            return (this._722769290btnVisible);
        }

        public function set targetNum(_arg_1:String):void
        {
            var _local_2:Object = this._815592395targetNum;
            if (_local_2 !== _arg_1)
            {
                this._815592395targetNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetNum", _local_2, _arg_1));
            };
        }

        public function set propBind(_arg_1:String):void
        {
            var _local_2:Object = this._994192832propBind;
            if (_local_2 !== _arg_1)
            {
                this._994192832propBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propBind", _local_2, _arg_1));
            };
        }

        public function set type(_arg_1:String):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }

        public function set propFeatherPet(_arg_1:String):void
        {
            var _local_2:Object = this._664016577propFeatherPet;
            if (_local_2 !== _arg_1)
            {
                this._664016577propFeatherPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propFeatherPet", _local_2, _arg_1));
            };
        }

        public function set customize(_arg_1:String):void
        {
            var _local_2:Object = this._1611566147customize;
            if (_local_2 !== _arg_1)
            {
                this._1611566147customize = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "customize", _local_2, _arg_1));
            };
        }

        public function set bind(_arg_1:String):void
        {
            var _local_2:Object = this._3023933bind;
            if (_local_2 !== _arg_1)
            {
                this._3023933bind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bind", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name():String
        {
            return (this._3373707name);
        }

        [Bindable(event="propertyChange")]
        public function get guildMoney():String
        {
            return (this._1469746035guildMoney);
        }

        [Bindable(event="propertyChange")]
        public function get preBuilds():Array
        {
            return (this._1984815176preBuilds);
        }

        public function set maker(_arg_1:String):void
        {
            var _local_2:Object = this._103659588maker;
            if (_local_2 !== _arg_1)
            {
                this._103659588maker = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maker", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get urlIcon():String
        {
            return (this._170514808urlIcon);
        }

        public function set price(_arg_1:String):void
        {
            var _local_2:Object = this._106934601price;
            if (_local_2 !== _arg_1)
            {
                this._106934601price = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "price", _local_2, _arg_1));
            };
        }

        public function set preBuilds(_arg_1:Array):void
        {
            var _local_2:Object = this._1984815176preBuilds;
            if (_local_2 !== _arg_1)
            {
                this._1984815176preBuilds = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "preBuilds", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propJewel():String
        {
            return (this._747928928propJewel);
        }

        public function set guildLevel(_arg_1:String):void
        {
            var _local_2:Object = this._1470959791guildLevel;
            if (_local_2 !== _arg_1)
            {
                this._1470959791guildLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get priceType():String
        {
            return (this._2125731805priceType);
        }

        [Bindable(event="propertyChange")]
        public function get equSkill0():String
        {
            return (this._441785000equSkill0);
        }

        [Bindable(event="propertyChange")]
        public function get endure():String
        {
            return (this._1298740563endure);
        }

        [Bindable(event="propertyChange")]
        public function get genMCost():String
        {
            return (this._1786820714genMCost);
        }

        [Bindable(event="propertyChange")]
        public function get info():String
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get propBasic():String
        {
            return (this._755439989propBasic);
        }

        public function set effectTime(_arg_1:String):void
        {
            var _local_2:Object = this._1715818494effectTime;
            if (_local_2 !== _arg_1)
            {
                this._1715818494effectTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "effectTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moneyCost():String
        {
            return (this._1714035539moneyCost);
        }

        public function set rareMCost(_arg_1:String):void
        {
            var _local_2:Object = this._1576501672rareMCost;
            if (_local_2 !== _arg_1)
            {
                this._1576501672rareMCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rareMCost", _local_2, _arg_1));
            };
        }

        public function set useType(_arg_1:String):void
        {
            var _local_2:Object = this._148001439useType;
            if (_local_2 !== _arg_1)
            {
                this._148001439useType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useType", _local_2, _arg_1));
            };
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function set dexProgress(_arg_1:String):void
        {
            var _local_2:Object = this._762141852dexProgress;
            if (_local_2 !== _arg_1)
            {
                this._762141852dexProgress = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dexProgress", _local_2, _arg_1));
            };
        }

        public function set propAdded(_arg_1:String):void
        {
            var _local_2:Object = this._756288675propAdded;
            if (_local_2 !== _arg_1)
            {
                this._756288675propAdded = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propAdded", _local_2, _arg_1));
            };
        }

        public function set reqEnv(_arg_1:String):void
        {
            var _local_2:Object = this._934532241reqEnv;
            if (_local_2 !== _arg_1)
            {
                this._934532241reqEnv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqEnv", _local_2, _arg_1));
            };
        }

        public function set activeEquipName(_arg_1:String):void
        {
            var _local_2:Object = this._1511253621activeEquipName;
            if (_local_2 !== _arg_1)
            {
                this._1511253621activeEquipName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeEquipName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currencyType():int
        {
            return (this._1005290219currencyType);
        }

        public function set genMCost(_arg_1:String):void
        {
            var _local_2:Object = this._1786820714genMCost;
            if (_local_2 !== _arg_1)
            {
                this._1786820714genMCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "genMCost", _local_2, _arg_1));
            };
        }

        public function set reqClass(_arg_1:String):void
        {
            var _local_2:Object = this._439241862reqClass;
            if (_local_2 !== _arg_1)
            {
                this._439241862reqClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqClass", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get element():String
        {
            return (this._1662836996element);
        }

        public function set preSkill(_arg_1:String):void
        {
            var _local_2:Object = this._1306045074preSkill;
            if (_local_2 !== _arg_1)
            {
                this._1306045074preSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "preSkill", _local_2, _arg_1));
            };
        }

        public function set reqLevel(_arg_1:String):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        public function set reqCL(_arg_1:String):void
        {
            var _local_2:Object = this._108401031reqCL;
            if (_local_2 !== _arg_1)
            {
                this._108401031reqCL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqCL", _local_2, _arg_1));
            };
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
        public function get clsStar1():Class
        {
            return (this._1178238229clsStar1);
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
        public function get clsStar5():Class
        {
            return (this._1178238233clsStar5);
        }

        public function set guildMoney(_arg_1:String):void
        {
            var _local_2:Object = this._1469746035guildMoney;
            if (_local_2 !== _arg_1)
            {
                this._1469746035guildMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildMoney", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clsStar7():Class
        {
            return (this._1178238235clsStar7);
        }

        public function set propBasic(_arg_1:String):void
        {
            var _local_2:Object = this._755439989propBasic;
            if (_local_2 !== _arg_1)
            {
                this._755439989propBasic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propBasic", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clsStar3():Class
        {
            return (this._1178238231clsStar3);
        }

        public function set urlIcon(_arg_1:String):void
        {
            var _local_2:Object = this._170514808urlIcon;
            if (_local_2 !== _arg_1)
            {
                this._170514808urlIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "urlIcon", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clsStar6():Class
        {
            return (this._1178238234clsStar6);
        }

        [Bindable(event="propertyChange")]
        public function get cre1():int
        {
            return (this._3062043cre1);
        }

        [Bindable(event="propertyChange")]
        public function get clsStar2():Class
        {
            return (this._1178238230clsStar2);
        }

        [Bindable(event="propertyChange")]
        public function get guildContrib():String
        {
            return (this._333642022guildContrib);
        }

        [Bindable(event="propertyChange")]
        public function get clsStar4():Class
        {
            return (this._1178238232clsStar4);
        }

        [Bindable(event="propertyChange")]
        public function get position():String
        {
            return (this._747804969position);
        }

        [Bindable(event="propertyChange")]
        public function get guildExp():String
        {
            return (this._1306563286guildExp);
        }

        [Bindable(event="propertyChange")]
        public function get cre4():int
        {
            return (this._3062046cre4);
        }

        public function set currentPoint(_arg_1:String):void
        {
            var _local_2:Object = this._1454910359currentPoint;
            if (_local_2 !== _arg_1)
            {
                this._1454910359currentPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentPoint", _local_2, _arg_1));
            };
        }

        public function set btnVisible(_arg_1:Boolean):void
        {
            var _local_2:Object = this._722769290btnVisible;
            if (_local_2 !== _arg_1)
            {
                this._722769290btnVisible = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnVisible", _local_2, _arg_1));
            };
        }

        public function set expCost(_arg_1:String):void
        {
            var _local_2:Object = this._1310369910expCost;
            if (_local_2 !== _arg_1)
            {
                this._1310369910expCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expCost", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get type():String
        {
            return (this._3575610type);
        }

        [Bindable(event="propertyChange")]
        public function get propSuit():String
        {
            return (this._993674992propSuit);
        }

        [Bindable(event="propertyChange")]
        public function get clsStar8():Class
        {
            return (this._1178238236clsStar8);
        }

        public function set kind(_arg_1:String):void
        {
            var _local_2:Object = this._3292052kind;
            if (_local_2 !== _arg_1)
            {
                this._3292052kind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kind", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cre5():int
        {
            return (this._3062047cre5);
        }

        [Bindable(event="propertyChange")]
        public function get clsJewel10():Class
        {
            return (this._1391475432clsJewel10);
        }

        public function set propJewel(_arg_1:String):void
        {
            var _local_2:Object = this._747928928propJewel;
            if (_local_2 !== _arg_1)
            {
                this._747928928propJewel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propJewel", _local_2, _arg_1));
            };
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get price():String
        {
            return (this._106934601price);
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponLevel():String
        {
            return (this._267844315magicWeaponLevel);
        }

        public function set equSkill0(_arg_1:String):void
        {
            var _local_2:Object = this._441785000equSkill0;
            if (_local_2 !== _arg_1)
            {
                this._441785000equSkill0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equSkill0", _local_2, _arg_1));
            };
        }

        public function set lwingName(_arg_1:String):void
        {
            var _local_2:Object = this._1249801634lwingName;
            if (_local_2 !== _arg_1)
            {
                this._1249801634lwingName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lwingName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cre2():int
        {
            return (this._3062044cre2);
        }

        [Bindable(event="propertyChange")]
        public function get propFeatherPet():String
        {
            return (this._664016577propFeatherPet);
        }

        [Bindable(event="propertyChange")]
        public function get guildLevel():String
        {
            return (this._1470959791guildLevel);
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        [Bindable(event="propertyChange")]
        public function get propAdded():String
        {
            return (this._756288675propAdded);
        }

        [Bindable(event="propertyChange")]
        public function get useType():String
        {
            return (this._148001439useType);
        }

        public function set info(_arg_1:String):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dexProgress():String
        {
            return (this._762141852dexProgress);
        }

        [Bindable(event="propertyChange")]
        public function get reqEnv():String
        {
            return (this._934532241reqEnv);
        }

        public function set endure(_arg_1:String):void
        {
            var _local_2:Object = this._1298740563endure;
            if (_local_2 !== _arg_1)
            {
                this._1298740563endure = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endure", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get reqClass():String
        {
            return (this._439241862reqClass);
        }

        [Bindable(event="propertyChange")]
        public function get clsStar9():Class
        {
            return (this._1178238237clsStar9);
        }

        public function set clsStar10(_arg_1:Class):void
        {
            var _local_2:Object = this._2129320517clsStar10;
            if (_local_2 !== _arg_1)
            {
                this._2129320517clsStar10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clsStar10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get reqLevel():String
        {
            return (this._431118970reqLevel);
        }

        [Bindable(event="propertyChange")]
        public function get reqCL():String
        {
            return (this._108401031reqCL);
        }

        [Bindable(event="propertyChange")]
        public function get activeTime():String
        {
            return (this._2043958003activeTime);
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

        [Bindable(event="propertyChange")]
        public function get effectEndTime():String
        {
            return (this._1249743735effectEndTime);
        }

        [Bindable(event="propertyChange")]
        public function get preSkill():String
        {
            return (this._1306045074preSkill);
        }

        [Bindable(event="propertyChange")]
        public function get expCost():String
        {
            return (this._1310369910expCost);
        }

        public function set moneyCost(_arg_1:String):void
        {
            var _local_2:Object = this._1714035539moneyCost;
            if (_local_2 !== _arg_1)
            {
                this._1714035539moneyCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyCost", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get kind():String
        {
            return (this._3292052kind);
        }

        [Bindable(event="propertyChange")]
        public function get currentPoint():String
        {
            return (this._1454910359currentPoint);
        }

        [Bindable(event="propertyChange")]
        public function get propFeatherChar():String
        {
            return (this._889937718propFeatherChar);
        }

        [Bindable(event="propertyChange")]
        public function get lwingName():String
        {
            return (this._1249801634lwingName);
        }

        public function set effectEndTime(_arg_1:String):void
        {
            var _local_2:Object = this._1249743735effectEndTime;
            if (_local_2 !== _arg_1)
            {
                this._1249743735effectEndTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "effectEndTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cre3():int
        {
            return (this._3062045cre3);
        }

        public function set magicWeaponLevel(_arg_1:String):void
        {
            var _local_2:Object = this._267844315magicWeaponLevel;
            if (_local_2 !== _arg_1)
            {
                this._267844315magicWeaponLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponLevel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get clsStar10():Class
        {
            return (this._2129320517clsStar10);
        }

        public function set costVisible(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1407588379costVisible;
            if (_local_2 !== _arg_1)
            {
                this._1407588379costVisible = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costVisible", _local_2, _arg_1));
            };
        }

        public function set currencyType(_arg_1:int):void
        {
            var _local_2:Object = this._1005290219currencyType;
            if (_local_2 !== _arg_1)
            {
                this._1005290219currencyType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currencyType", _local_2, _arg_1));
            };
        }

        public function set bProp3(_arg_1:String):void
        {
            var _local_2:Object = this._1411922450bProp3;
            if (_local_2 !== _arg_1)
            {
                this._1411922450bProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bProp3", _local_2, _arg_1));
            };
        }

        public function set bProp4(_arg_1:String):void
        {
            var _local_2:Object = this._1411922449bProp4;
            if (_local_2 !== _arg_1)
            {
                this._1411922449bProp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bProp4", _local_2, _arg_1));
            };
        }

        public function set bProp1(_arg_1:String):void
        {
            var _local_2:Object = this._1411922452bProp1;
            if (_local_2 !== _arg_1)
            {
                this._1411922452bProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bProp1", _local_2, _arg_1));
            };
        }

        public function set activeTime(_arg_1:String):void
        {
            var _local_2:Object = this._2043958003activeTime;
            if (_local_2 !== _arg_1)
            {
                this._2043958003activeTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeTime", _local_2, _arg_1));
            };
        }

        public function set bProp2(_arg_1:String):void
        {
            var _local_2:Object = this._1411922451bProp2;
            if (_local_2 !== _arg_1)
            {
                this._1411922451bProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bProp2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bProp2():String
        {
            return (this._1411922451bProp2);
        }

        [Bindable(event="propertyChange")]
        public function get bProp3():String
        {
            return (this._1411922450bProp3);
        }

        [Bindable(event="propertyChange")]
        public function get bProp4():String
        {
            return (this._1411922449bProp4);
        }

        public function set maintainCost(_arg_1:String):void
        {
            var _local_2:Object = this._1869749240maintainCost;
            if (_local_2 !== _arg_1)
            {
                this._1869749240maintainCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maintainCost", _local_2, _arg_1));
            };
        }

        public function set propSoul(_arg_1:String):void
        {
            var _local_2:Object = this._993680394propSoul;
            if (_local_2 !== _arg_1)
            {
                this._993680394propSoul = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propSoul", _local_2, _arg_1));
            };
        }

        public function set description(_arg_1:String):void
        {
            var _local_2:Object = this._1724546052description;
            if (_local_2 !== _arg_1)
            {
                this._1724546052description = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "description", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bProp1():String
        {
            return (this._1411922452bProp1);
        }

        [Bindable(event="propertyChange")]
        public function get description():String
        {
            return (this._1724546052description);
        }

        [Bindable(event="propertyChange")]
        public function get propSoul():String
        {
            return (this._993680394propSoul);
        }

        [Bindable(event="propertyChange")]
        public function get effectTime():String
        {
            return (this._1715818494effectTime);
        }

        public function set element(_arg_1:String):void
        {
            var _local_2:Object = this._1662836996element;
            if (_local_2 !== _arg_1)
            {
                this._1662836996element = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "element", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.game.vo

