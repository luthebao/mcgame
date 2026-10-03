// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DailyActPanel_element

package com.qeedoo.ui.view.compDragable
{
    import mx.core.MovieClipLoaderAsset;
    import flash.utils.ByteArray;

    public class DailyActPanel_element extends MovieClipLoaderAsset 
    {

        private static var bytes:ByteArray = null;

        public var dataClass:Class = DailyActPanel_element_dataClass;

        public function DailyActPanel_element()
        {
            initialWidth = (11000 / 20);
            initialHeight = (8000 / 20);
        }

        override public function get movieClipData():ByteArray
        {
            if (bytes == null)
            {
                bytes = ByteArray(new dataClass());
            };
            return (bytes);
        }


    }
}//package com.qeedoo.ui.view.compDragable

