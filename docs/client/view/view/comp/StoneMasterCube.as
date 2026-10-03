// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.StoneMasterCube

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import flash.display.Bitmap;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import com.qeedoo.ui.view.compDragable.StoneMaster;
    import flash.events.MouseEvent;
    import mx.core.UIComponent;
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

    public class StoneMasterCube extends Canvas 
    {

        private var _position:uint;
        private var _index:uint;
        private var _type:uint;
        private var _bitMap:Bitmap;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":50
                });
            }
        });
        private var _core:Core = Core.getInstance();

        public function StoneMasterCube()
        {
            mx_internal::_document = this;
            this.width = 50;
            this.height = 50;
        }

        private function onAddStone(_arg_1:Object):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_STONEMASTER);
            if (_local_2)
            {
                _local_2.onGetData(_arg_1);
            };
        }

        private function click(e:Event):void
        {
            var func:Function;
            if (_type == 2)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("removeStoneFromSteelyard", new Responder(onRemoveStone), _index, _position);
                    };
                };
                Alert.show(Language.ANNIVERSARY_LANG[26].toString(), "", (Alert.YES | Alert.NO), null, func);
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function get index():uint
        {
            return (_index);
        }

        private function mouseOver(_arg_1:Event):void
        {
            _bitMap.bitmapData = StoneMaster.stoneBMDLight[_index];
        }

        public function set position(_arg_1:uint):void
        {
            _position = _arg_1;
        }

        private function onRemoveStone(_arg_1:Object):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_STONEMASTER);
            if (_local_2)
            {
                _local_2.onGetData(_arg_1);
            };
        }

        public function register():void
        {
            addEventListener(MouseEvent.ROLL_OVER, mouseOver);
            addEventListener(MouseEvent.ROLL_OUT, mouseOut);
            addEventListener(MouseEvent.CLICK, click);
            this.doubleClickEnabled = true;
            this.mouseChildren = false;
            addEventListener(MouseEvent.DOUBLE_CLICK, doubleClick);
        }

        public function set index(_arg_1:uint):void
        {
            _index = _arg_1;
            if (!_bitMap)
            {
                _bitMap = new Bitmap();
            };
            _bitMap.bitmapData = StoneMaster.stoneBMD[_arg_1];
            if (this.numChildren > 0)
            {
                this.removeAllChildren();
            };
            var _local_2:UIComponent = new UIComponent();
            _local_2.addChild(_bitMap);
            addChild(_local_2);
        }

        private function mouseOut(_arg_1:Event):void
        {
            _bitMap.bitmapData = StoneMaster.stoneBMD[_index];
        }

        public function get position():uint
        {
            return (_position);
        }

        public function set type(_arg_1:uint):void
        {
            _type = _arg_1;
        }

        private function doubleClick(_arg_1:Event):void
        {
            if (_type == 1)
            {
                _core.remote.call("addStoneToSteelyard", new Responder(onAddStone), _index);
            };
        }

        public function get type():uint
        {
            return (_type);
        }


    }
}//package com.qeedoo.ui.view.comp

