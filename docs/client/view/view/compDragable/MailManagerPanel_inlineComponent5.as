// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MailManagerPanel_inlineComponent5

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.RendererImage;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;

    public class MailManagerPanel_inlineComponent5 extends RendererImage 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":RendererImage});
        private var _88844982outerDocument:MailManagerPanel;

        public function MailManagerPanel_inlineComponent5()
        {
            mx_internal::_document = this;
            this.x = 0;
            this.y = 0;
            this.percentWidth = 100;
            this.percentHeight = 100;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set outerDocument(_arg_1:MailManagerPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():MailManagerPanel
        {
            return (this._88844982outerDocument);
        }


    }
}//package com.qeedoo.ui.view.compDragable

