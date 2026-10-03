// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.BasicFilteredLabel

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextInput;
    import mx.effects.Glow;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;

    public class BasicFilteredLabel extends TextInput 
    {

        private var glow:Glow;

        public function BasicFilteredLabel()
        {
            this.addEventListener("initialize", ___BasicFilteredLabel_TextInput1_initialize);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function ___BasicFilteredLabel_TextInput1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            textField.filters = [GamePredef.FILTER_TITLE];
            textField.selectable = false;
        }


    }
}//package com.qeedoo.ui.view.comp

