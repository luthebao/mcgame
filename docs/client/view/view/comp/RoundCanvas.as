// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RoundCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;

    public class RoundCanvas extends Canvas 
    {


        override protected function updateDisplayList(_arg_1:Number, _arg_2:Number):void
        {
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:LotteryItemSlot;
            super.updateDisplayList(_arg_1, _arg_2);
            var _local_3:Number = ((_arg_1 / 2) - 30);
            var _local_4:Number = ((_arg_2 / 2) - 45);
            var _local_5:Number = (360 / this.numChildren);
            var _local_6:Number = (_local_3 - 50);
            var _local_11:Number = (((_arg_1 + _arg_2) / 2) / 640);
            var _local_12:int;
            while (_local_12 < this.numChildren)
            {
                _local_10 = LotteryItemSlot(this.getChildAt(_local_12));
                _local_7 = (((_local_5 * _local_12) + 180) * (Math.PI / 180));
                _local_8 = (_local_3 + (Math.sin(_local_7) * _local_6));
                _local_9 = (_local_4 + (Math.cos(_local_7) * _local_6));
                _local_10.x = _local_8;
                _local_10.y = _local_9;
                _local_12++;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

