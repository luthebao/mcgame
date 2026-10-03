// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotCreature

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;

    public class ItemSlotCreature extends ItemSlot 
    {

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":ItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":34,
                    "height":34
                });
            }
        });

        public function ItemSlotCreature()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:ItemSlot;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ItemSlot);
                if (_local_2 == this)
                {
                    return;
                };
                if (!enabled)
                {
                    return;
                };
                if (sourceGroup)
                {
                    return;
                };
                switch (slotType)
                {
                    case SLOT_CREATURE:
                        if (((ToolKit.isEqual(_local_2.type, GamePredef.TBL_CREATURE)) && (_local_2.slotData)))
                        {
                            slotData = _local_2.slotData;
                            type = _local_2.type;
                            giid = _local_2.giid;
                            stackNum = _local_2.stackNum;
                        };
                        return;
                    case SLOT_JEWEL:
                        if (((ToolKit.isEqual(_local_2.type, GamePredef.TBL_ITEM_TEMPLATE)) && (_local_2.slotData)))
                        {
                            slotData = _local_2.slotData;
                            type = _local_2.type;
                            giid = _local_2.giid;
                            stackNum = _local_2.stackNum;
                        };
                        return;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

