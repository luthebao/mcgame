// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotStars

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class ItemSlotStars extends ItemSlot 
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

        public function ItemSlotStars()
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
            var _local_3:Object;
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
                switch (slotType)
                {
                    case SLOT_STARS_ADD:
                        if (_local_2.slotType == SLOT_BAG)
                        {
                            if (ToolKit.isEqual(_local_2.type, GamePredef.TBL_ITEM_INSTANCE))
                            {
                                _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                                if (_local_3)
                                {
                                    if (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_STAR_ADD))
                                    {
                                        slotData = _local_2.slotData;
                                        type = _local_2.type;
                                        giid = _local_2.giid;
                                        stackNum = _local_2.stackNum;
                                    };
                                };
                            };
                        };
                        return;
                    case SLOT_STARS_SPEED:
                        if (_local_2.slotType == SLOT_BAG)
                        {
                            if (ToolKit.isEqual(_local_2.type, GamePredef.TBL_ITEM_INSTANCE))
                            {
                                _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                                if (_local_3)
                                {
                                    if (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_STAR_SPEED))
                                    {
                                        slotData = _local_2.slotData;
                                        type = _local_2.type;
                                        giid = _local_2.giid;
                                        stackNum = _local_2.stackNum;
                                    };
                                };
                            };
                        };
                        return;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

