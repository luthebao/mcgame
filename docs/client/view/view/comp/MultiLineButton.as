// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MultiLineButton

package com.qeedoo.ui.view.comp
{
    import mx.controls.Button;
    import flash.display.DisplayObject;
    import flash.text.TextLineMetrics;

    public class MultiLineButton extends Button 
    {


        override protected function createChildren():void
        {
            super.createChildren();
            if (!textField)
            {
                textField = new NoTruncationUITextField();
                textField.styleName = this;
                addChild(DisplayObject(textField));
            };
            textField.multiline = true;
            textField.wordWrap = true;
        }

        override public function measureText(_arg_1:String):TextLineMetrics
        {
            textField.text = _arg_1;
            var _local_2:TextLineMetrics = textField.getLineMetrics(0);
            _local_2.width = textField.textWidth;
            _local_2.height = textField.textHeight;
            return (_local_2);
        }


    }
}//package com.qeedoo.ui.view.comp

