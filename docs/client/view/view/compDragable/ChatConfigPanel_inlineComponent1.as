// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChatConfigPanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import mx.controls.RadioButton;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;

    public class ChatConfigPanel_inlineComponent1 extends RadioButton 
    {

        private var _88844982outerDocument:ChatConfigPanel;

        public function ChatConfigPanel_inlineComponent1()
        {
            this.selectedField = "name";
            this.addEventListener("click", ___ChatConfigPanel_inlineComponent1_RadioButton1_click);
        }

        public function set outerDocument(_arg_1:ChatConfigPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():ChatConfigPanel
        {
            return (this._88844982outerDocument);
        }

        override public function initialize():void
        {
            super.initialize();
        }

        private function onClick():void
        {
            outerDocument.onItemClick();
        }

        public function ___ChatConfigPanel_inlineComponent1_RadioButton1_click(_arg_1:MouseEvent):void
        {
            onClick();
        }


    }
}//package com.qeedoo.ui.view.compDragable

