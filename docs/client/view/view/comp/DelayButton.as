// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.DelayButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import flash.events.MouseEvent;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class DelayButton extends Button 
    {

        public var clickDelay:int = 1000;
        public var useDelay:Boolean = true;

        public function DelayButton()
        {
            addEventListener(MouseEvent.CLICK, setDelay);
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


    }
}//package com.qeedoo.ui.view.comp

