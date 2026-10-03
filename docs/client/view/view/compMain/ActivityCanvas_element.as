// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.ActivityCanvas_element

package com.qeedoo.ui.view.compMain
{
    import mx.core.MovieClipLoaderAsset;
    import flash.utils.ByteArray;

    public class ActivityCanvas_element extends MovieClipLoaderAsset 
    {

        private static var bytes:ByteArray = null;

        public var dataClass:Class = ActivityCanvas_element_dataClass;

        public function ActivityCanvas_element()
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
}//package com.qeedoo.ui.view.compMain

