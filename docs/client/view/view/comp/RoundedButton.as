// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RoundedButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;

    public class RoundedButton extends Button 
    {

        public function RoundedButton()
        {
            this.addEventListener("initialize", ___RoundedButton_Button1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function roundText():void
        {
            textField.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        public function ___RoundedButton_Button1_initialize(_arg_1:FlexEvent):void
        {
            roundText();
        }


    }
}//package com.qeedoo.ui.view.comp

