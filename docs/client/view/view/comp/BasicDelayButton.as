// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicDelayButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
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

    public class BasicDelayButton extends Button 
    {

        public var clickDelay:int = 1000;
        public var useDelay:Boolean = true;

        public function BasicDelayButton()
        {
            this.addEventListener("initialize", ___BasicDelayButton_Button1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function setDelay(_arg_1:MouseEvent):void
        {
            var _local_2:Timer;
            if (useDelay)
            {
                enabled = false;
                _local_2 = new Timer(clickDelay, 1);
                _local_2.addEventListener(TimerEvent.TIMER, setEnable);
                _local_2.start();
            };
        }

        private function setEnable(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER, setEnable);
            enabled = true;
        }

        public function ___BasicDelayButton_Button1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            addEventListener(MouseEvent.CLICK, setDelay);
            textField.filters = [GamePredef.FILTER_TITLE];
        }


    }
}//package com.qeedoo.ui.view.comp

