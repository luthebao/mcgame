// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CubeMasterButton

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import flash.display.Bitmap;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.compDragable.CubeMaster;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.UIComponent;
    import mx.events.FlexEvent;
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

    public class CubeMasterButton extends Canvas 
    {

        private var _bitMap:Bitmap;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":Canvas});
        private var _type:uint;
        private var _index:uint;
        private var _core:Core = Core.getInstance();

        public function CubeMasterButton()
        {
            mx_internal::_document = this;
            this.addEventListener("creationComplete", ___CubeMasterButton_Canvas1_creationComplete);
        }

        private function mouseOver(_arg_1:Event):void
        {
            _bitMap.bitmapData = CubeMaster.buttonLightBMD[_type];
        }

        public function get type():uint
        {
            return (_type);
        }

        public function set index(_arg_1:uint):void
        {
            _index = _arg_1;
        }

        private function click(_arg_1:Event):void
        {
            var _local_2:uint;
            var _local_3:uint;
            switch (_type)
            {
                case 0:
                    _local_2 = 1;
                    _local_3 = 0;
                    break;
                case 1:
                    _local_2 = 1;
                    _local_3 = 1;
                    break;
                case 2:
                    _local_2 = 0;
                    _local_3 = 0;
                    break;
                case 3:
                    _local_2 = 0;
                    _local_3 = 1;
                    break;
            };
            var _local_4:Object = _core.view.getUI(ViewManager.PANEL_CUBEMASTER);
            if (_local_4)
            {
                _local_4.moveCube(_local_2, _index, _local_3);
            };
        }

        private function mouseOut(_arg_1:Event):void
        {
            _bitMap.bitmapData = CubeMaster.buttonBMD[_type];
        }

        public function get index():uint
        {
            return (_index);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set type(_arg_1:uint):void
        {
            _type = _arg_1;
            if (((_arg_1 == 0) || (_arg_1 == 1)))
            {
                width = (55 / 2);
                height = 20;
            }
            else
            {
                width = 20;
                height = (55 / 2);
            };
            if (!_bitMap)
            {
                _bitMap = new Bitmap();
            };
            _bitMap.bitmapData = CubeMaster.buttonBMD[_arg_1];
            if (this.numChildren > 0)
            {
                this.removeAllChildren();
            };
            var _local_2:UIComponent = new UIComponent();
            _local_2.addChild(_bitMap);
            addChild(_local_2);
        }

        public function ___CubeMasterButton_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            addEventListener(MouseEvent.CLICK, click);
            addEventListener(MouseEvent.ROLL_OVER, mouseOver);
            addEventListener(MouseEvent.ROLL_OUT, mouseOut);
        }


    }
}//package com.qeedoo.ui.view.comp

