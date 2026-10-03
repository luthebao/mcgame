// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SecretTreasureHuntPanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;

    public class SecretTreasureHuntPanel_inlineComponent1 extends Canvas 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "events":{"click":"___SecretTreasureHuntPanel_inlineComponent1_BasicDelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "label":"Cầu viện",
                                "styleName":"BtnStdGreen"
                            });
                        }
                    })]});
            }
        });
        private var _88844982outerDocument:SecretTreasureHuntPanel;

        public function SecretTreasureHuntPanel_inlineComponent1()
        {
            mx_internal::_document = this;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set outerDocument(_arg_1:SecretTreasureHuntPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():SecretTreasureHuntPanel
        {
            return (this._88844982outerDocument);
        }

        public function ___SecretTreasureHuntPanel_inlineComponent1_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            outerDocument.callHelp(data);
        }


    }
}//package com.qeedoo.ui.view.compDragable

