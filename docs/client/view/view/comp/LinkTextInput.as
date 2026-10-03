// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LinkTextInput

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextInput;
    import com.qeedoo.ui.utils.LinkEventUtil;
    import flash.events.TextEvent;

    public class LinkTextInput extends TextInput 
    {


        override public function initialize():void
        {
            super.initialize();
        }

        private function linkEventHandler(_arg_1:TextEvent):void
        {
            LinkEventUtil.linkHandler(_arg_1, stage);
        }

        public function init():void
        {
            addEventListener(TextEvent.LINK, linkEventHandler);
        }


    }
}//package com.qeedoo.ui.view.comp

