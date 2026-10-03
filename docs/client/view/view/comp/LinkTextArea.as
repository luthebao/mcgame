// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LinkTextArea

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextArea;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.text.TextFormat;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.qeedoo.ui.utils.LinkEventUtil;
    import mx.events.FlexEvent;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.TextEvent;
    import flash.text.StyleSheet;
    import mx.core.IUITextField;
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

    public class LinkTextArea extends TextArea 
    {

        public var onLink:Function = linkHandler;

        public function LinkTextArea()
        {
            this.selectable = false;
            this.addEventListener("initialize", ___LinkTextArea_TextArea1_initialize);
            this.addEventListener("rollOver", ___LinkTextArea_TextArea1_rollOver);
            this.addEventListener("link", ___LinkTextArea_TextArea1_link);
        }

        public static function checkSearchable(_arg_1:String):Boolean
        {
            var _local_3:uint;
            var _local_4:Object;
            var _local_2:Array = _arg_1.split("|");
            if (_local_2.length < 3)
            {
                return (false);
            };
            if (((_local_2[0] == "L_P") && (_local_2[1] == 330)))
            {
                return (false);
            };
            if (_local_2[0] == "L_N")
            {
                _local_3 = _local_2[1];
                _local_4 = GameData.d[GamePredef.TBL_NPC][_local_3];
                if (((_local_4.lk) && (!(_local_4.lk == 1))))
                {
                    return (false);
                };
            };
            return (true);
        }


        private function searchLink(_arg_1:int):Boolean
        {
            var _local_3:String;
            var _local_2:TextFormat = textField.getTextFormat(_arg_1, (_arg_1 + 1));
            if (((_local_2) && (_local_2.url)))
            {
                _arg_1 = _local_2.url.indexOf("http://");
                if (_arg_1 >= 0)
                {
                    navigateToURL(new URLRequest(_local_2.url), "blank");
                    return (false);
                };
                trace(_local_2.url.substr(6));
                _local_3 = _local_2.url.substr(6);
                if (checkSearchable(_local_3))
                {
                    LinkEventUtil.linkTextHandler(_local_2.url.substr(6), stage);
                    return (true);
                };
            };
            return (false);
        }

        public function ___LinkTextArea_TextArea1_initialize(_arg_1:FlexEvent):void
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

        public function checkPoint(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:Point = textField.globalToLocal(new Point(_arg_1, _arg_2));
            var _local_4:int = textField.getCharIndexAtPoint(_local_3.x, _local_3.y);
            if (_local_4 > 0)
            {
                return (searchLink(_local_4));
            };
            return (false);
        }

        override public function set htmlText(_arg_1:String):void
        {
            var _local_2:uint = getStyle("color");
            var _local_3:String = ("#" + ((_local_2.toString(16)) || ("ffffff")));
            super.htmlText = ToolKit.getColorTxt(_local_3, _arg_1);
        }

        public function ___LinkTextArea_TextArea1_rollOver(_arg_1:MouseEvent):void
        {
            focusText(_arg_1);
        }

        public function ___LinkTextArea_TextArea1_link(_arg_1:TextEvent):void
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
            if (!styleSheet)
            {
                _local_1 = new Object();
                _local_1.color = "#FFCCCC";
                styleSheet = new StyleSheet();
                styleSheet.setStyle("a:hover", _local_1);
            };
        }

        private function init():void
        {
            setLinkStyle();
        }

        public function get field():IUITextField
        {
            return (textField);
        }

        private function linkHandler(_arg_1:TextEvent):void
        {
            LinkEventUtil.linkHandler(_arg_1, stage);
        }


    }
}//package com.qeedoo.ui.view.comp

