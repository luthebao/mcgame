// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CallBoardPanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.RendererImageLabel;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;

    public class CallBoardPanel_inlineComponent1 extends RendererImageLabel 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":RendererImageLabel});
        private var _88844982outerDocument:CallBoardPanel;

        public function CallBoardPanel_inlineComponent1()
        {
            mx_internal::_document = this;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set outerDocument(_arg_1:CallBoardPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():CallBoardPanel
        {
            return (this._88844982outerDocument);
        }


    }
}//package com.qeedoo.ui.view.compDragable

