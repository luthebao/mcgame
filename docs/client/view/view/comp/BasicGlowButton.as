// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicGlowButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import mx.effects.Glow;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;

    public class BasicGlowButton extends Button 
    {

        private var glow:Glow;

        public function BasicGlowButton()
        {
            this.addEventListener("initialize", ___BasicGlowButton_Button1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function removeGlow(_arg_1:Object):void
        {
            glow.target = _arg_1;
            this.glow.end();
            filters = [];
        }

        public function setGlow(_arg_1:Object):void
        {
            glow = new Glow();
            glow.target = _arg_1;
            glow.repeatCount = 0;
            glow.duration = 3000;
            glow.color = 0xFFFF00;
            glow.blurXTo = 10;
            glow.blurYTo = 10;
            glow.strength = 100;
            glow.alphaTo = 100;
            glow.play();
        }

        private function init():void
        {
            textField.filters = [GamePredef.FILTER_TITLE];
        }

        public function ___BasicGlowButton_Button1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.comp

