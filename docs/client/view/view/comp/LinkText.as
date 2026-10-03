// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LinkText

package com.qeedoo.ui.view.comp
{
    import mx.controls.Text;
    import mx.events.FlexEvent;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.TextEvent;
    import flash.text.StyleSheet;
    import com.qeedoo.ui.utils.LinkEventUtil;
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

    public class LinkText extends Text 
    {

        public var onLink:Function = linkHandler;

        public function LinkText()
        {
            this.addEventListener("initialize", ___LinkText_Text1_initialize);
            this.addEventListener("rollOver", ___LinkText_Text1_rollOver);
            this.addEventListener("link", ___LinkText_Text1_link);
        }

        public function ___LinkText_Text1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }

        private function focusText(_arg_1:MouseEvent):void
        {
            if (!(getFocus() is TextField))
            {
                setFocus();
            };
        }

        override public function set htmlText(_arg_1:String):void
        {
            var _local_2:uint = getStyle("color");
            var _local_3:String = ("#" + ((_local_2.toString(16)) || ("ffffff")));
            super.htmlText = ToolKit.getColorTxt(_local_3, _arg_1);
        }

        public function ___LinkText_Text1_rollOver(_arg_1:MouseEvent):void
        {
            focusText(_arg_1);
        }

        public function ___LinkText_Text1_link(_arg_1:TextEvent):void
        {
            onLink(_arg_1);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function setLinkStyle():void
        {
            var _local_1:Object;
            if (!textField.styleSheet)
            {
                _local_1 = new Object();
                _local_1.color = "#FFCCCC";
                textField.styleSheet = new StyleSheet();
                textField.styleSheet.setStyle("a:hover", _local_1);
            };
        }

        private function init():void
        {
            setLinkStyle();
        }

        private function linkHandler(_arg_1:TextEvent):void
        {
            LinkEventUtil.linkHandler(_arg_1, stage);
        }


    }
}//package com.qeedoo.ui.view.comp

