// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MagicCell

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponent;
    import com.qeedoo.game.system.Core;
    import flash.display.Bitmap;
    import com.qeedoo.ui.view.compDragable.CubeMaster;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.event.GameEvent;
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

    public class MagicCell extends UIComponent 
    {

        public var col:uint;
        private var _core:Core = Core.getInstance();
        public var moving:Boolean = false;
        private var _type:uint;
        public var row:uint;
        private var _stepsCount:uint = 0;
        private var _color:uint;
        public var moveType:uint;
        private var _bitMap:Bitmap;


        public function set color(_arg_1:uint):void
        {
            _color = _arg_1;
            if (!_bitMap)
            {
                _bitMap = new Bitmap();
                addChild(_bitMap);
            };
            if (_type == 1)
            {
                _bitMap.bitmapData = CubeMaster.smallCubeBMD[_arg_1];
            }
            else
            {
                if (_type == 2)
                {
                    _bitMap.bitmapData = CubeMaster.bigCubeBMD[_arg_1];
                };
            };
        }

        private function click(e:Event):void
        {
            var cell:MagicCell;
            cell = (e.currentTarget as MagicCell);
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("replaceMagicCube", new Responder(onClickHandler), cell.row, cell.col);
                };
            };
            Alert.show(Language.ANNIVERSARY_LANG[17].toString(), "", (Alert.YES | Alert.NO), null, func);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function onClickHandler(_arg_1:Object):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_CUBEMASTER);
            if (_local_2)
            {
                _local_2.onGetData(_arg_1);
            };
        }

        public function register():void
        {
            addEventListener(Event.ENTER_FRAME, moveOneCube);
            if (_type == 2)
            {
                addEventListener(MouseEvent.CLICK, click);
            };
        }

        private function moveOneCube(_arg_1:Event):void
        {
            if (moving)
            {
                switch (moveType)
                {
                    case 0:
                        _arg_1.currentTarget.x = (_arg_1.currentTarget.x + (_arg_1.currentTarget.width / 24));
                        break;
                    case 1:
                        _arg_1.currentTarget.x = (_arg_1.currentTarget.x - (_arg_1.currentTarget.width / 24));
                        break;
                    case 2:
                        _arg_1.currentTarget.y = (_arg_1.currentTarget.y + (_arg_1.currentTarget.height / 24));
                        break;
                    case 3:
                        _arg_1.currentTarget.y = (_arg_1.currentTarget.y - (_arg_1.currentTarget.height / 24));
                        break;
                };
                _stepsCount++;
                if (_stepsCount >= 24)
                {
                    moving = false;
                    _stepsCount = 0;
                    CubeMaster.decoProxy.dispatchEvent(new GameEvent(GameEvent.CUBE_MOVE_END, false));
                };
            };
        }

        public function get type():uint
        {
            return (_type);
        }

        public function set type(_arg_1:uint):void
        {
            _type = _arg_1;
            if (_arg_1 == 1)
            {
                this.width = 20;
                this.height = 20;
            }
            else
            {
                if (_arg_1 == 2)
                {
                    this.width = 55;
                    this.height = 55;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

