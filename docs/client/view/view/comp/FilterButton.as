// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FilterButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;

    public class FilterButton extends Button 
    {

        private var _timer:Timer;
        public var delayTime:int;
        private var _filters:Array;


        override protected function createChildren():void
        {
            super.createChildren();
            textField.filters = _filters;
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            _arg_1.stopImmediatePropagation();
            this.enabled = true;
        }

        override protected function clickHandler(_arg_1:MouseEvent):void
        {
            super.clickHandler(_arg_1);
            if (((delayTime <= 0) || (!(this.enabled))))
            {
                return;
            };
            if (_timer)
            {
                _timer.reset();
                _timer.delay = delayTime;
            }
            else
            {
                _timer = new Timer(delayTime, 1);
                _timer.addEventListener(TimerEvent.TIMER, timerHandler);
            };
            this.enabled = false;
            _timer.start();
        }

        override public function get filters():Array
        {
            return (_filters);
        }

        override public function set filters(_arg_1:Array):void
        {
            _filters = _arg_1;
            if (textField)
            {
                textField.filters = _arg_1;
            };
        }

        override protected function createInFontContext(_arg_1:Class):Object
        {
            return (super.createInFontContext(UITextFieldHtml));
        }


    }
}//package com.qeedoo.ui.view.comp

