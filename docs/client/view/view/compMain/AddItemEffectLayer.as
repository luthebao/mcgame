// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.AddItemEffectLayer

package com.qeedoo.ui.view.compMain
{
    import mx.core.UIComponent;
    import flash.utils.Timer;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import com.qeedoo.game.system.Core;
    import flash.geom.Matrix;
    import flash.geom.ColorTransform;
    import mx.controls.Image;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.utils.setTimeout;
    import flash.utils.clearTimeout;
    import flash.events.TimerEvent;

    public class AddItemEffectLayer extends UIComponent 
    {

        private var _timer:Timer;
        private var _lastItemParticle:ItemParticle = null;
        private var _bmp:Bitmap;
        private var _type:Number;
        private var _requestHandler:Number = 0;
        private var _index:Number = 1;
        private var _itemId:Number;
        private var _bmd:BitmapData;

        private var _core:Core = Core.getInstance();
        private var _iconDic:Object = {};
        private var _matrix:Matrix = new Matrix();
        private var _ctf_alpha0:ColorTransform = new ColorTransform(1, 1, 1, 0);
        private var _ctf_alphaDynamic:ColorTransform = new ColorTransform(1, 1, 1, 1);

        public function AddItemEffectLayer()
        {
            this.width = 50;
            this.height = 200;
            this.mouseEnabled = false;
            _bmd = new BitmapData(width, height);
            _bmp = new Bitmap(_bmd);
            _bmd.colorTransform(_bmd.rect, _ctf_alpha0);
            addChild(_bmp);
            _timer = new Timer(30);
        }

        public function addItem(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:Object;
            _type = _arg_1;
            _itemId = _arg_2;
            _local_3 = _core.getTemplateData(_arg_1, _arg_2, false);
            var _local_4:Image = new Image();
            _local_4.width = 32;
            _local_4.height = 32;
            _local_4.scaleContent = true;
            if (_local_3)
            {
                _local_4.source = ResManager.getIconUrl(_local_3.iconCode);
                ResManager.setColorCode(_local_4, _local_3.colorCode);
                _local_4.load();
                _local_4.addEventListener(Event.COMPLETE, onSrcLoadComplete);
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1) + "_") + _arg_2), imgDataLoaded);
                _requestHandler = setTimeout(requestData, 300);
            };
        }

        private function requestData():void
        {
            if (_requestHandler > 0)
            {
                clearTimeout(_requestHandler);
                _requestHandler = 0;
            };
            _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _type) + "_") + _itemId), imgDataLoaded);
            _core.data.getGameData(_type, _itemId);
        }

        private function onSrcLoadComplete(_arg_1:Event):void
        {
            var _local_3:ItemParticle;
            _arg_1.target.removeEventListener(Event.COMPLETE, onSrcLoadComplete);
            var _local_2:Bitmap = Bitmap(_arg_1.target.content);
            if (_local_2)
            {
                _local_2.filters = _arg_1.target.filters;
                _local_3 = new ItemParticle(_local_2, ++_index, _lastItemParticle);
                _lastItemParticle = _local_3;
                _iconDic[_index] = _local_3;
                if (!_timer.hasEventListener(TimerEvent.TIMER))
                {
                    trace("没有监听器，新建");
                    this.visible = true;
                    _timer.addEventListener(TimerEvent.TIMER, onTimer);
                    _timer.start();
                };
            };
        }

        private function onTimer(_arg_1:Event):void
        {
            var _local_3:*;
            var _local_4:*;
            var _local_5:Boolean;
            var _local_2:Boolean;
            _bmd.lock();
            _bmd.colorTransform(_bmd.rect, _ctf_alpha0);
            for (_local_3 in _iconDic)
            {
                _local_4 = _iconDic[_local_3];
                if (_local_4)
                {
                    _local_2 = true;
                    _local_5 = ItemParticle(_local_4).update(this);
                    if (_local_5)
                    {
                        _matrix.tx = _local_4.x;
                        _matrix.ty = _local_4.y;
                        _ctf_alphaDynamic.alphaMultiplier = _local_4.alpha;
                        _bmd.draw(_local_4.bmp, _matrix, _ctf_alphaDynamic);
                    };
                };
            };
            _bmd.unlock();
            if (!_local_2)
            {
                _timer.removeEventListener(TimerEvent.TIMER, onTimer);
                _timer.stop();
                this.visible = false;
                trace("移除监听器");
            };
        }

        public function removeItem(_arg_1:Number):void
        {
            delete _iconDic[_arg_1];
        }

        private function imgDataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), imgDataLoaded);
            addItem(_arg_1.data.type, _arg_1.data.index);
        }


    }
}//package com.qeedoo.ui.view.compMain

import flash.display.Bitmap;
import com.qeedoo.ui.view.compMain.AddItemEffectLayer;

class ItemParticle 
{

    /*private*/ var _x:Number;
    /*private*/ var _img:Bitmap;
    /*private*/ var _alive:Number;
    /*private*/ var _index:Number;
    /*private*/ var _before:ItemParticle;
    /*private*/ var _alpha:Number = 1;
    /*private*/ var _a:Number = 6;
    /*private*/ var _b:Number = 30;
    /*private*/ var _y:Number;

    public function ItemParticle(_arg_1:Bitmap, _arg_2:Number, _arg_3:ItemParticle)
    {
        _img = _arg_1;
        _alive = 0;
        _x = 0;
        _y = _b;
        _index = _arg_2;
        _before = _arg_3;
    }

    public function get bmp():Bitmap
    {
        return (_img);
    }

    public function update(_arg_1:AddItemEffectLayer):Boolean
    {
        if (((_before == null) || (_before.alive > 5)))
        {
            _alive++;
            _x = _alive;
            _y = ((_a * _x) + _b);
            if (_x > 15)
            {
                _x = 15;
            };
            if (_y > (_arg_1.height - _img.height))
            {
                _y = (_arg_1.height - _img.height);
                _alpha = (_alpha - 0.1);
            };
            if (_alpha < 0.1)
            {
                _arg_1.removeItem(_index);
            };
            return (true);
        };
        return (false);
    }

    /*private*/ function get alive():Number
    {
        return (_alive);
    }

    public function get alpha():Number
    {
        return (_alpha);
    }

    public function get x():Number
    {
        return (_x);
    }

    public function get y():Number
    {
        return (_y);
    }


}


