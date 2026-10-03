// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.LifeSkillPanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.LifeListItemRenderer;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;

    public class LifeSkillPanel_inlineComponent1 extends LifeListItemRenderer 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":LifeListItemRenderer});
        private var _88844982outerDocument:LifeSkillPanel;

        public function LifeSkillPanel_inlineComponent1()
        {
            mx_internal::_document = this;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set outerDocument(_arg_1:LifeSkillPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():LifeSkillPanel
        {
            return (this._88844982outerDocument);
        }


    }
}//package com.qeedoo.ui.view.compDragable

