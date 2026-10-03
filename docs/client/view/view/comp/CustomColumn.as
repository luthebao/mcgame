// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CustomColumn

package com.qeedoo.ui.view.comp
{
    import mx.controls.Label;

    public class CustomColumn extends Label 
    {


        override public function set data(_arg_1:Object):void
        {
            if (_arg_1 != null)
            {
                super.data = _arg_1;
                if (data.cid == data.leaderId)
                {
                    setStyle("color", 0x60FF00);
                }
                else
                {
                    setStyle("color", 0xFFFFFF);
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

