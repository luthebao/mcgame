// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SimpleConainer

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponent;

    public class SimpleConainer extends UIComponent 
    {


        public function removeAllChildren():void
        {
            while (numChildren > 0)
            {
                removeChildAt(0);
            };
        }

        public function getChildren():Array
        {
            var _local_1:Array = [];
            var _local_2:int = numChildren;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_1.push(getChildAt(_local_3));
                _local_3++;
            };
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.comp

