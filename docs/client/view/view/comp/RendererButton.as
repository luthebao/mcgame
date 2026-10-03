// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import flash.events.MouseEvent;
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

    public class RendererButton extends Button 
    {

        private var _click:Function;
        private var _needShow:Boolean = true;
        private var _obj:Object;

        public function RendererButton()
        {
            this.styleName = "BtnStdRed";
            this.addEventListener("click", ___RendererButton_Button1_click);
        }

        private function onClick():void
        {
            if (_click)
            {
                _click(_obj);
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                super.visible = _needShow;
            }
            else
            {
                super.visible = _arg_1;
            };
        }

        override public function initialize():void
        {
            super.initialize();
        }

        override public function set data(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (_obj.onClick)
            {
                _click = _obj.onClick;
                _needShow = true;
                this.enabled = true;
            }
            else
            {
                _needShow = false;
                this.enabled = false;
            };
            if (_obj.label)
            {
                this.label = _obj.label;
            };
            styleName = "BtnStdRed";
            super.data = _arg_1;
        }

        public function ___RendererButton_Button1_click(_arg_1:MouseEvent):void
        {
            onClick();
        }


    }
}//package com.qeedoo.ui.view.comp

