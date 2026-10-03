// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipMapSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;

    public class TipMapSlot extends Slot 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Slot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":50
                });
            }
        });

        public function TipMapSlot()
        {
            mx_internal::_document = this;
            this.width = 50;
            this.height = 50;
            this.styleName = "TransparentSlot";
            this.addEventListener("creationComplete", ___TipMapSlot_Slot1_creationComplete);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function ___TipMapSlot_Slot1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            this.restItemIconSize();
        }


    }
}//package com.qeedoo.ui.view.comp

