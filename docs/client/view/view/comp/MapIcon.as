// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MapIcon

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;

    public class MapIcon extends Canvas 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":20,
                    "height":20
                });
            }
        });
        public var type:int;
        public var itemId:int;

        public function MapIcon()
        {
            mx_internal::_document = this;
            this.width = 20;
            this.height = 20;
            this.buttonMode = true;
            this.useHandCursor = true;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }


    }
}//package com.qeedoo.ui.view.comp

