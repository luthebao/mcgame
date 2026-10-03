// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MenuSkin

package com.qeedoo.ui.view.comp
{
    import flash.display.Sprite;
    import mx.core.IRectangularBorder;
    import mx.core.EdgeMetrics;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;

    public class MenuSkin extends Sprite implements IRectangularBorder 
    {

        private var _bm:EdgeMetrics;
        public var PanelSkinClass:Class = MenuSkin_PanelSkinClass;
        protected var skin:DisplayObject;

        public function MenuSkin()
        {
            if (PanelSkinClass)
            {
                skin = new PanelSkinClass();
                this.addChild(skin);
            };
        }

        public function get backgroundImageBounds():Rectangle
        {
            return (null);
        }

        public function layoutBackgroundImage():void
        {
        }

        public function set backgroundImageBounds(_arg_1:Rectangle):void
        {
        }

        public function get hasBackgroundImage():Boolean
        {
            return (false);
        }

        override public function set width(_arg_1:Number):void
        {
            if (skin)
            {
                skin.width = _arg_1;
            };
        }

        override public function set height(_arg_1:Number):void
        {
            if (skin)
            {
                skin.height = _arg_1;
            };
        }

        public function get borderMetrics():EdgeMetrics
        {
            if (_bm == null)
            {
                _bm = new EdgeMetrics(2, 10, 2, 10);
            };
            return (_bm);
        }


    }
}//package com.qeedoo.ui.view.comp

