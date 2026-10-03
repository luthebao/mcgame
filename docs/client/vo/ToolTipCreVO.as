// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.vo.ToolTipCreVO

package com.qeedoo.game.vo
{
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;

    public class ToolTipCreVO implements IEventDispatcher 
    {

        private var _94756344close:int;
        private var _900562936skill9:int;
        private var _1407272001attSta:int;
        private var _1410966192aptSpr:String;
        private var _675985193attLast:int;
        private var _507317139growRate:String;
        private var _1407289694attAgi:int;
        private var _900562943skill2:int;
        private var _170514808urlIcon:String;
        private var _3023933bind:String;
        private var _1509076629catchable:String;
        private var _957830652counter:int;
        private var _10025402classInfo:String;
        private var _900562937skill8:int;
        private var _900562940skill5:int;
        private var _1410983778aptAgi:String;
        private var _1407281778attInt:int;
        private var _94842723color:Number;
        private var _1410975862aptInt:String;
        private var _1407272108attSpr:int;
        private var _1410966085aptSta:String;
        private var _2147319859skill13:int;
        private var _9888733className:String;
        private var _900562944skill1:int;
        private var _2147319861skill15:int;
        private var _1662836996element:String;
        private var _1410966068aptStr:String;
        private var _900562938skill7:int;
        private var _3373707name:String;
        private var _2147319858skill12:int;
        private var _2147319860skill14:int;
        private var _111577457useLv:int;
        private var _3540562star:int;
        private var _900562941skill4:int;
        private var _2147319857skill11:int;
        private var _836775759urlRes:String;
        private var _102865796level:int;
        private var _98778cri:int;
        private var _1407271984attStr:int;
        private var _900562939skill6:int;
        private var _2147319856skill10:int;
        private var _456092036petColor:uint;
        private var _3321596life:String;
        private var _673585610elementInfo:String;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _900562942skill3:int;
        private var _722769290btnVisible:Boolean;

        public function ToolTipCreVO()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        [Bindable(event="propertyChange")]
        public function get skill1():int
        {
            return (this._900562944skill1);
        }

        [Bindable(event="propertyChange")]
        public function get skill2():int
        {
            return (this._900562943skill2);
        }

        public function set skill3(_arg_1:int):void
        {
            var _local_2:Object = this._900562942skill3;
            if (_local_2 !== _arg_1)
            {
                this._900562942skill3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill6():int
        {
            return (this._900562939skill6);
        }

        public function set life(_arg_1:String):void
        {
            var _local_2:Object = this._3321596life;
            if (_local_2 !== _arg_1)
            {
                this._3321596life = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "life", _local_2, _arg_1));
            };
        }

        public function set petColor(_arg_1:uint):void
        {
            var _local_2:Object = this._456092036petColor;
            if (_local_2 !== _arg_1)
            {
                this._456092036petColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petColor", _local_2, _arg_1));
            };
        }

        public function set skill2(_arg_1:int):void
        {
            var _local_2:Object = this._900562943skill2;
            if (_local_2 !== _arg_1)
            {
                this._900562943skill2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill4():int
        {
            return (this._900562941skill4);
        }

        [Bindable(event="propertyChange")]
        public function get life():String
        {
            return (this._3321596life);
        }

        [Bindable(event="propertyChange")]
        public function get skill8():int
        {
            return (this._900562937skill8);
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
        public function get skill3():int
        {
            return (this._900562942skill3);
        }

        public function set aptInt(_arg_1:String):void
        {
            var _local_2:Object = this._1410975862aptInt;
            if (_local_2 !== _arg_1)
            {
                this._1410975862aptInt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptInt", _local_2, _arg_1));
            };
        }

        public function set skill4(_arg_1:int):void
        {
            var _local_2:Object = this._900562941skill4;
            if (_local_2 !== _arg_1)
            {
                this._900562941skill4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill4", _local_2, _arg_1));
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

        public function set skill5(_arg_1:int):void
        {
            var _local_2:Object = this._900562940skill5;
            if (_local_2 !== _arg_1)
            {
                this._900562940skill5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill5", _local_2, _arg_1));
            };
        }

        public function set skill6(_arg_1:int):void
        {
            var _local_2:Object = this._900562939skill6;
            if (_local_2 !== _arg_1)
            {
                this._900562939skill6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill6", _local_2, _arg_1));
            };
        }

        public function set skill7(_arg_1:int):void
        {
            var _local_2:Object = this._900562938skill7;
            if (_local_2 !== _arg_1)
            {
                this._900562938skill7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill7", _local_2, _arg_1));
            };
        }

        public function set skill8(_arg_1:int):void
        {
            var _local_2:Object = this._900562937skill8;
            if (_local_2 !== _arg_1)
            {
                this._900562937skill8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get counter():int
        {
            return (this._957830652counter);
        }

        public function set skill9(_arg_1:int):void
        {
            var _local_2:Object = this._900562936skill9;
            if (_local_2 !== _arg_1)
            {
                this._900562936skill9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill9():int
        {
            return (this._900562936skill9);
        }

        [Bindable(event="propertyChange")]
        public function get className():String
        {
            return (this._9888733className);
        }

        [Bindable(event="propertyChange")]
        public function get close():int
        {
            return (this._94756344close);
        }

        public function set growRate(_arg_1:String):void
        {
            var _local_2:Object = this._507317139growRate;
            if (_local_2 !== _arg_1)
            {
                this._507317139growRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "growRate", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill7():int
        {
            return (this._900562938skill7);
        }

        public function set catchable(_arg_1:String):void
        {
            var _local_2:Object = this._1509076629catchable;
            if (_local_2 !== _arg_1)
            {
                this._1509076629catchable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "catchable", _local_2, _arg_1));
            };
        }

        public function set attInt(_arg_1:int):void
        {
            var _local_2:Object = this._1407281778attInt;
            if (_local_2 !== _arg_1)
            {
                this._1407281778attInt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attInt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill12():int
        {
            return (this._2147319858skill12);
        }

        [Bindable(event="propertyChange")]
        public function get skill13():int
        {
            return (this._2147319859skill13);
        }

        [Bindable(event="propertyChange")]
        public function get skill14():int
        {
            return (this._2147319860skill14);
        }

        [Bindable(event="propertyChange")]
        public function get skill10():int
        {
            return (this._2147319856skill10);
        }

        [Bindable(event="propertyChange")]
        public function get bind():String
        {
            return (this._3023933bind);
        }

        public function set counter(_arg_1:int):void
        {
            var _local_2:Object = this._957830652counter;
            if (_local_2 !== _arg_1)
            {
                this._957830652counter = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "counter", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skill11():int
        {
            return (this._2147319857skill11);
        }

        public function set aptAgi(_arg_1:String):void
        {
            var _local_2:Object = this._1410983778aptAgi;
            if (_local_2 !== _arg_1)
            {
                this._1410983778aptAgi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptAgi", _local_2, _arg_1));
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

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get skill5():int
        {
            return (this._900562940skill5);
        }

        [Bindable(event="propertyChange")]
        public function get aptSpr():String
        {
            return (this._1410966192aptSpr);
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        [Bindable(event="propertyChange")]
        public function get attSpr():int
        {
            return (this._1407272108attSpr);
        }

        [Bindable(event="propertyChange")]
        public function get classInfo():String
        {
            return (this._10025402classInfo);
        }

        [Bindable(event="propertyChange")]
        public function get skill15():int
        {
            return (this._2147319861skill15);
        }

        [Bindable(event="propertyChange")]
        public function get star():int
        {
            return (this._3540562star);
        }

        public function set skill10(_arg_1:int):void
        {
            var _local_2:Object = this._2147319856skill10;
            if (_local_2 !== _arg_1)
            {
                this._2147319856skill10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill10", _local_2, _arg_1));
            };
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function set urlRes(_arg_1:String):void
        {
            var _local_2:Object = this._836775759urlRes;
            if (_local_2 !== _arg_1)
            {
                this._836775759urlRes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "urlRes", _local_2, _arg_1));
            };
        }

        public function set skill12(_arg_1:int):void
        {
            var _local_2:Object = this._2147319858skill12;
            if (_local_2 !== _arg_1)
            {
                this._2147319858skill12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill12", _local_2, _arg_1));
            };
        }

        public function set skill14(_arg_1:int):void
        {
            var _local_2:Object = this._2147319860skill14;
            if (_local_2 !== _arg_1)
            {
                this._2147319860skill14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill14", _local_2, _arg_1));
            };
        }

        public function set skill1(_arg_1:int):void
        {
            var _local_2:Object = this._900562944skill1;
            if (_local_2 !== _arg_1)
            {
                this._900562944skill1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill1", _local_2, _arg_1));
            };
        }

        public function set skill13(_arg_1:int):void
        {
            var _local_2:Object = this._2147319859skill13;
            if (_local_2 !== _arg_1)
            {
                this._2147319859skill13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnVisible():Boolean
        {
            return (this._722769290btnVisible);
        }

        [Bindable(event="propertyChange")]
        public function get color():Number
        {
            return (this._94842723color);
        }

        public function set attSta(_arg_1:int):void
        {
            var _local_2:Object = this._1407272001attSta;
            if (_local_2 !== _arg_1)
            {
                this._1407272001attSta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attSta", _local_2, _arg_1));
            };
        }

        public function set skill15(_arg_1:int):void
        {
            var _local_2:Object = this._2147319861skill15;
            if (_local_2 !== _arg_1)
            {
                this._2147319861skill15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill15", _local_2, _arg_1));
            };
        }

        public function set aptSta(_arg_1:String):void
        {
            var _local_2:Object = this._1410966085aptSta;
            if (_local_2 !== _arg_1)
            {
                this._1410966085aptSta = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptSta", _local_2, _arg_1));
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

        public function set classInfo(_arg_1:String):void
        {
            var _local_2:Object = this._10025402classInfo;
            if (_local_2 !== _arg_1)
            {
                this._10025402classInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get urlIcon():String
        {
            return (this._170514808urlIcon);
        }

        [Bindable(event="propertyChange")]
        public function get name():String
        {
            return (this._3373707name);
        }

        [Bindable(event="propertyChange")]
        public function get growRate():String
        {
            return (this._507317139growRate);
        }

        public function set elementInfo(_arg_1:String):void
        {
            var _local_2:Object = this._673585610elementInfo;
            if (_local_2 !== _arg_1)
            {
                this._673585610elementInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get catchable():String
        {
            return (this._1509076629catchable);
        }

        public function set aptStr(_arg_1:String):void
        {
            var _local_2:Object = this._1410966068aptStr;
            if (_local_2 !== _arg_1)
            {
                this._1410966068aptStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptStr", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptInt():String
        {
            return (this._1410975862aptInt);
        }

        public function set skill11(_arg_1:int):void
        {
            var _local_2:Object = this._2147319857skill11;
            if (_local_2 !== _arg_1)
            {
                this._2147319857skill11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get attInt():int
        {
            return (this._1407281778attInt);
        }

        public function set star(_arg_1:int):void
        {
            var _local_2:Object = this._3540562star;
            if (_local_2 !== _arg_1)
            {
                this._3540562star = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "star", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get aptAgi():String
        {
            return (this._1410983778aptAgi);
        }

        public function set aptSpr(_arg_1:String):void
        {
            var _local_2:Object = this._1410966192aptSpr;
            if (_local_2 !== _arg_1)
            {
                this._1410966192aptSpr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "aptSpr", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get useLv():int
        {
            return (this._111577457useLv);
        }

        public function set attLast(_arg_1:int):void
        {
            var _local_2:Object = this._675985193attLast;
            if (_local_2 !== _arg_1)
            {
                this._675985193attLast = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attLast", _local_2, _arg_1));
            };
        }

        public function set attStr(_arg_1:int):void
        {
            var _local_2:Object = this._1407271984attStr;
            if (_local_2 !== _arg_1)
            {
                this._1407271984attStr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attStr", _local_2, _arg_1));
            };
        }

        public function set cri(_arg_1:int):void
        {
            var _local_2:Object = this._98778cri;
            if (_local_2 !== _arg_1)
            {
                this._98778cri = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cri", _local_2, _arg_1));
            };
        }

        public function set attAgi(_arg_1:int):void
        {
            var _local_2:Object = this._1407289694attAgi;
            if (_local_2 !== _arg_1)
            {
                this._1407289694attAgi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attAgi", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get urlRes():String
        {
            return (this._836775759urlRes);
        }

        [Bindable(event="propertyChange")]
        public function get aptSta():String
        {
            return (this._1410966085aptSta);
        }

        [Bindable(event="propertyChange")]
        public function get petColor():uint
        {
            return (this._456092036petColor);
        }

        [Bindable(event="propertyChange")]
        public function get attSta():int
        {
            return (this._1407272001attSta);
        }

        [Bindable(event="propertyChange")]
        public function get elementInfo():String
        {
            return (this._673585610elementInfo);
        }

        [Bindable(event="propertyChange")]
        public function get aptStr():String
        {
            return (this._1410966068aptStr);
        }

        [Bindable(event="propertyChange")]
        public function get attAgi():int
        {
            return (this._1407289694attAgi);
        }

        public function set color(_arg_1:Number):void
        {
            var _local_2:Object = this._94842723color;
            if (_local_2 !== _arg_1)
            {
                this._94842723color = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "color", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get level():int
        {
            return (this._102865796level);
        }

        [Bindable(event="propertyChange")]
        public function get cri():int
        {
            return (this._98778cri);
        }

        [Bindable(event="propertyChange")]
        public function get attLast():int
        {
            return (this._675985193attLast);
        }

        [Bindable(event="propertyChange")]
        public function get attStr():int
        {
            return (this._1407271984attStr);
        }

        public function set attSpr(_arg_1:int):void
        {
            var _local_2:Object = this._1407272108attSpr;
            if (_local_2 !== _arg_1)
            {
                this._1407272108attSpr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "attSpr", _local_2, _arg_1));
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

        public function set close(_arg_1:int):void
        {
            var _local_2:Object = this._94756344close;
            if (_local_2 !== _arg_1)
            {
                this._94756344close = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "close", _local_2, _arg_1));
            };
        }

        public function set useLv(_arg_1:int):void
        {
            var _local_2:Object = this._111577457useLv;
            if (_local_2 !== _arg_1)
            {
                this._111577457useLv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useLv", _local_2, _arg_1));
            };
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        [Bindable(event="propertyChange")]
        public function get element():String
        {
            return (this._1662836996element);
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

