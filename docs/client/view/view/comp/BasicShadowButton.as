// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicShadowButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;

    public class BasicShadowButton extends Button 
    {

        public function BasicShadowButton()
        {
            this.addEventListener("initialize", ___BasicShadowButton_Button1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function init():void
        {
            textField.filters = GamePredef.FILTER_TEXT2;
        }

        public function ___BasicShadowButton_Button1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.comp

