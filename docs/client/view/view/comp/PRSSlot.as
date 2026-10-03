// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PRSSlot

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.DragEvent;

    public class PRSSlot extends Slot 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Slot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":34,
                    "height":34
                });
            }
        });
        public var excBagPos:Number = 0;
        public var chipBagPos:Number = 0;

        public function PRSSlot()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
            this.styleName = "TransparentSlot";
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:PRSSlot;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as PRSSlot);
                if (_local_2 == this)
                {
                    return;
                };
                if (_local_2.slotType == this.slotType)
                {
                    return;
                };
                if (((_local_2.slotType == SLOT_PRS_CHIPBAG) && (this.slotType == SLOT_PRS_EXCBAG)))
                {
                    _core.remote.call("movePRSChip", null, _core.cid, _local_2.chipBagPos, this.excBagPos, 1);
                }
                else
                {
                    if (((this.slotType == SLOT_PRS_CHIPBAG) && (_local_2.slotType == SLOT_PRS_EXCBAG)))
                    {
                        _core.remote.call("movePRSChip", null, _core.cid, _local_2.excBagPos, this.chipBagPos, 2);
                    };
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

