// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ActivePanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import mx.controls.Label;
    import mx.events.PropertyChangeEvent;

    public class ActivePanel_inlineComponent1 extends Label 
    {

        private var _88844982outerDocument:ActivePanel;

        public function ActivePanel_inlineComponent1()
        {
            this.toolTip = "Số lần xem hôn lễ quý giá";
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():ActivePanel
        {
            return (this._88844982outerDocument);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function set outerDocument(_arg_1:ActivePanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

