// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossLineLabel

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;

    public class CrossLineLabel extends Label 
    {

        private var _lineColor:uint = 9503234;


        override protected function updateDisplayList(_arg_1:Number, _arg_2:Number):void
        {
            super.updateDisplayList(_arg_1, _arg_2);
            if (this.textWidth)
            {
                this.graphics.clear();
                this.graphics.lineStyle(1, lineColor);
                this.graphics.moveTo(0, (this.height / 2));
                this.graphics.lineTo((this.textWidth + 5), (this.height / 2));
                this.graphics.endFill();
            };
        }

        public function set lineColor(_arg_1:uint):void
        {
            if (_arg_1 != _lineColor)
            {
                _lineColor = _arg_1;
                this.invalidateDisplayList();
            };
        }

        public function get lineColor():uint
        {
            return (_lineColor);
        }


    }
}//package com.qeedoo.ui.view.comp

