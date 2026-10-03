// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TextCombo

package com.qeedoo.ui.view.comp
{
    import mx.controls.ComboBox;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class TextCombo extends ComboBox 
    {

        private var _843602650maxChar:int = 0;

        public function TextCombo()
        {
            super();
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.cornerRadius = 5;
                this.color = 0xFFFFFF;
            };
            this.editable = true;
            this.addEventListener("creationComplete", ___TextCombo_ComboBox1_creationComplete);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function set maxChars(_arg_1:int):void
        {
            this.textInput.maxChars = _arg_1;
        }

        public function set maxChar(_arg_1:int):void
        {
            var _local_2:Object = this._843602650maxChar;
            if (_local_2 !== _arg_1)
            {
                this._843602650maxChar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxChar", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        public function ___TextCombo_ComboBox1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get maxChar():int
        {
            return (this._843602650maxChar);
        }


    }
}//package com.qeedoo.ui.view.comp

