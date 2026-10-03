// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.HtmlTextArea

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextArea;
    import flash.text.TextFormat;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import flash.geom.Point;
    import flash.events.MouseEvent;

    public class HtmlTextArea extends TextArea 
    {

        public function HtmlTextArea()
        {
            this.addEventListener("click", ___HtmlTextArea_TextArea1_click);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function searchLink(_arg_1:int):void
        {
            var _local_2:TextFormat = textField.getTextFormat(_arg_1, (_arg_1 + 1));
            if (((_local_2) && (_local_2.url)))
            {
                _arg_1 = _local_2.url.indexOf("http://");
                if (_arg_1 >= 0)
                {
                    navigateToURL(new URLRequest(_local_2.url), "blank");
                    return;
                };
            };
        }

        private function checkLink(_arg_1:MouseEvent):void
        {
            var _local_2:Point = textField.globalToLocal(new Point(_arg_1.stageX, _arg_1.stageY));
            var _local_3:int = textField.getCharIndexAtPoint(_local_2.x, _local_2.y);
            if (_local_3 > 0)
            {
                searchLink(_local_3);
            };
        }

        public function ___HtmlTextArea_TextArea1_click(_arg_1:MouseEvent):void
        {
            checkLink(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp

