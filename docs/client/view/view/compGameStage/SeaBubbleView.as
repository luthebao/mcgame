// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.SeaBubbleView

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.controls.Image;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.display.Bitmap;

    public class SeaBubbleView 
    {

        private static var _instance:SeaBubbleView;

        private const BUBBLE_NUMBER_MAX:int = 3;
        private var bubble_time_interval:Number = 0;
        private var _core:Core;
        private var _timer:Timer;
        private var _isPlaying:Boolean;
        private var bubble_Period:Number;

        private var bubbleInsArr:Array = [];
        private var bubbleBitmapdataObj:Object = {
            "0":null,
            "10":null,
            "15":null,
            "20":null,
            "25":null
        };
        private var bubbleDataLoaded:Object = {
            "0":false,
            "10":false,
            "15":false,
            "20":false,
            "25":false
        };
        private var iconCode:Object = {
            "0":4130090100001,
            "10":4130090100002,
            "15":4130090100003,
            "20":4130090100004,
            "25":4130090100005
        };

        public function SeaBubbleView(_arg_1:Single)
        {
            _core = Core.getInstance();
        }

        public static function getInstance():SeaBubbleView
        {
            if (_instance == null)
            {
                _instance = new SeaBubbleView(new Single());
            };
            return (_instance);
        }


        public function destroBubble():void
        {
        }

        public function startBubble(_arg_1:Boolean):void
        {
            var _local_2:Boolean;
            var _local_3:String;
            var _local_4:Image;
            var _local_5:Object;
            var _local_6:int;
            _isPlaying = _arg_1;
            if (_arg_1)
            {
                _local_2 = true;
                for (_local_3 in bubbleDataLoaded)
                {
                    if (bubbleDataLoaded[_local_3] == false)
                    {
                        _local_2 = false;
                        _local_4 = new Image();
                        _local_4.source = ResManager.getIconUrl(iconCode[_local_3]);
                        _local_4.data = {
                            "id":_local_3,
                            "code":iconCode
                        };
                        _local_4.load();
                        _local_4.addEventListener(Event.COMPLETE, imgDataLoaded);
                        break;
                    };
                };
                if (_local_2)
                {
                    _local_5 = _core.view.getUI(ViewManager.STAGE_MAIN_CONTAINER).middleLayer;
                    _local_6 = 0;
                    while (_local_6 <= BUBBLE_NUMBER_MAX)
                    {
                        bubbleInsArr[_local_6] = new SingleBubbleView(bubbleBitmapdataObj);
                        _local_5.addChild(bubbleInsArr[_local_6]);
                        _local_6++;
                    };
                    _timer = new Timer(5000);
                    _timer.addEventListener(TimerEvent.TIMER, _play);
                    _timer.start();
                };
            }
            else
            {
                if (_timer)
                {
                    _timer.stop();
                    _timer.removeEventListener(TimerEvent.TIMER, _play);
                    _timer = null;
                };
                _local_6 = 0;
                while (_local_6 <= BUBBLE_NUMBER_MAX)
                {
                    if (bubbleInsArr[_local_6] != null)
                    {
                        SingleBubbleView(bubbleInsArr[_local_6]).stop();
                    };
                    _local_6++;
                };
            };
        }

        private function _play(_arg_1:TimerEvent):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Point;
            var _local_6:Point;
            if (_isPlaying)
            {
                _local_2 = 3;
                _local_3 = {
                    "0":new Point(563, 0),
                    "1":new Point(0, 0),
                    "2":new Point(0, 357),
                    "3":new Point(563, 357)
                };
                _local_4 = 0;
                while (_local_4 < _local_2)
                {
                    _local_5 = genRandomPoint(_local_3[_local_4], 337, 200);
                    _local_6 = _core.view.getUI(ViewManager.STAGE_MAIN_CONTAINER).globalToLocal(new Point(_core.player.posX, _core.player.posY));
                    SingleBubbleView(bubbleInsArr[_local_4]).x = (_local_5.x + _core.player.posX);
                    SingleBubbleView(bubbleInsArr[_local_4]).y = (_local_5.y + _core.player.posY);
                    SingleBubbleView(bubbleInsArr[_local_4]).play();
                    _local_4++;
                };
            };
        }

        private function genRandomPoint(_arg_1:Point, _arg_2:Number, _arg_3:Number):Point
        {
            var _local_4:Number = Math.ceil((Math.random() * _arg_2));
            var _local_5:Number = Math.ceil((Math.random() * _arg_3));
            return (new Point(((_arg_1.x + _local_4) - 450), ((_arg_1.y + _local_5) - 285)));
        }

        public function get isPlaying():Boolean
        {
            return (_isPlaying);
        }

        private function imgDataLoaded(_arg_1:Event):void
        {
            var _local_3:String;
            _arg_1.target.removeEventListener(Event.COMPLETE, imgDataLoaded);
            var _local_2:Bitmap = Bitmap(_arg_1.target.content);
            if (_local_2)
            {
                _local_3 = _arg_1.target.data.id;
                bubbleDataLoaded[_local_3] = true;
                bubbleBitmapdataObj[_local_3] = {
                    "bmd":_local_2.bitmapData,
                    "w":_local_2.width,
                    "h":_local_2.height
                };
            };
            startBubble(_isPlaying);
        }


    }
}//package com.qeedoo.ui.view.compGameStage

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.events.Event;

class SingleBubbleView extends Sprite 
{

    /*private*/ var _maxFrameId:Number;
    /*private*/ var _isPlaying:Boolean = false;
    /*private*/ var frameId:int = 0;
    /*private*/ var bitmap:Bitmap;
    /*private*/ var _playList:Object;
    /*private*/ var _movingSpeed:Number;

    public function SingleBubbleView(_arg_1:Object, _arg_2:Number=50, _arg_3:Number=3)
    {
        _playList = _arg_1;
        _maxFrameId = _arg_2;
        _movingSpeed = _arg_3;
        bitmap = new Bitmap();
        this.addChild(bitmap);
    }

    public function destroy():void
    {
        stop();
    }

    public function set playList(_arg_1:Object):void
    {
        _playList = _arg_1;
    }

    public function stop():void
    {
        _isPlaying = false;
        bitmap.bitmapData = null;
        this.visible = false;
        removeEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    /*private*/ function onEnterFrame(_arg_1:Event):void
    {
        if (!_isPlaying)
        {
            stop();
            return;
        };
        frameId++;
        if (frameId > _maxFrameId)
        {
            stop();
            return;
        };
        if (_playList[frameId])
        {
            bitmap.bitmapData = _playList[frameId].bmd;
            bitmap.x = (-(_playList[frameId].w) / 2);
            bitmap.y = (-(_playList[frameId].h) / 2);
        };
        this.y = (this.y - _movingSpeed);
    }

    public function set movingSpeed(_arg_1:Number):void
    {
        _movingSpeed = _arg_1;
    }

    public function set maxFrameId(_arg_1:Number):void
    {
        _maxFrameId = _arg_1;
    }

    public function get yBase():Number
    {
        return (this.y);
    }

    public function play():void
    {
        _isPlaying = true;
        frameId = 0;
        if (_playList[frameId])
        {
            bitmap.bitmapData = _playList[frameId].bmd;
            bitmap.x = (-(_playList[frameId].w) / 2);
            bitmap.y = (-(_playList[frameId].h) / 2);
        };
        this.visible = true;
        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }


}

class Single 
{


}


