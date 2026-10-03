// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicTxtButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;

    public class BasicTxtButton extends Label 
    {

        public function BasicTxtButton()
        {
            this.height = 20;
            this.styleName = "TxtHorStyle";
            this.addEventListener("initialize", ___BasicTxtButton_Label1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function init():void
        {
            textField.filters = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        public function set label(_arg_1:String):void
        {
            this.text = _arg_1;
        }

        public function ___BasicTxtButton_Label1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.comp

