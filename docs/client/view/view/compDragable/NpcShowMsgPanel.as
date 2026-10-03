// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcShowMsgPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;

    public class NpcShowMsgPanel extends DragableCanvas 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":300
                });
            }
        });

        public function NpcShowMsgPanel()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 300;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }


    }
}//package com.qeedoo.ui.view.compDragable

