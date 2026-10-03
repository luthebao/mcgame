// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FilterTextArea

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextArea;

    public class FilterTextArea extends TextArea 
    {

        private var _filters:Array;


        override public function set filters(_arg_1:Array):void
        {
            _filters = _arg_1;
            if (textField)
            {
                textField.filters = _arg_1;
            };
        }

        override protected function createChildren():void
        {
            super.createChildren();
            textField.filters = _filters;
        }

        override public function get filters():Array
        {
            return (_filters);
        }


    }
}//package com.qeedoo.ui.view.comp

