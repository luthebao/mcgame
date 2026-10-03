// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RoundedRadioButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.RadioButton;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;

    public class RoundedRadioButton extends RadioButton 
    {

        public function RoundedRadioButton()
        {
            this.addEventListener("initialize", ___RoundedRadioButton_RadioButton1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function roundText():void
        {
            textField.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        public function ___RoundedRadioButton_RadioButton1_initialize(_arg_1:FlexEvent):void
        {
            roundText();
        }


    }
}//package com.qeedoo.ui.view.comp

