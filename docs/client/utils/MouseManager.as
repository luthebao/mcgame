// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.MouseManager

package com.qeedoo.game.utils
{
    import flash.events.MouseEvent;
    import flash.display.Stage;

    public class MouseManager 
    {

        private static const MIN_DELAY:int = 1500;
        private static var lastClickTime:int = 0;
        private static var initialized:Boolean = false;
        public static var mouseDownFlag:Boolean = false;


        public static function checkClick():Boolean
        {
            var _local_1:int = new Date().getTime();
            if ((_local_1 - lastClickTime) < MIN_DELAY)
            {
                return (false);
            };
            lastClickTime = _local_1;
            return (true);
        }

        private static function mouseDownHandler(_arg_1:MouseEvent):void
        {
            mouseDownFlag = true;
        }

        public static function setUnClickable(_arg_1:int):void
        {
            lastClickTime = (new Date().getTime() + _arg_1);
        }

        private static function mouseUpHandler(_arg_1:MouseEvent):void
        {
            mouseDownFlag = false;
        }

        public static function initialize(_arg_1:Stage):void
        {
            if (!initialized)
            {
                _arg_1.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
                _arg_1.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
                initialized = true;
            };
        }

        public static function setClickTime():void
        {
            lastClickTime = new Date().getTime();
        }


    }
}//package com.qeedoo.game.utils

