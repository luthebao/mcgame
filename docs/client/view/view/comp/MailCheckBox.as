// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MailCheckBox

package com.qeedoo.ui.view.comp
{
    import mx.controls.CheckBox;
    import com.qeedoo.game.system.Core;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class MailCheckBox extends CheckBox 
    {

        private var _core:Core = Core.getInstance();

        public function MailCheckBox()
        {
            this.addEventListener("click", ___MailCheckBox_CheckBox1_click);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function ___MailCheckBox_CheckBox1_click(_arg_1:MouseEvent):void
        {
            doClick();
        }

        private function doClick():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_MAILMANAGER);
            if (this.selected)
            {
                _local_1.chooseMail(1);
            }
            else
            {
                _local_1.chooseMail(0);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

