// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.Treasure_treasureSelectEff

package com.qeedoo.ui.view.compDragable
{
    import mx.core.MovieClipLoaderAsset;
    import flash.utils.ByteArray;

    public class Treasure_treasureSelectEff extends MovieClipLoaderAsset 
    {

        private static var bytes:ByteArray = null;

        public var dataClass:Class = Treasure_treasureSelectEff_dataClass;

        public function Treasure_treasureSelectEff()
        {
            initialWidth = (640 / 20);
            initialHeight = (640 / 20);
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

