// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotJewel

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
    import flash.utils.getDefinitionByName;
    import mx.events.CloseEvent;
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

    use namespace mx_internal;

    public class ItemSlotJewel extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _hasSeted:Boolean = false;
        private var slotTmp:ItemSlot;

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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ItemSlotJewel()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
            this.showStackNum = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotJewel._watcherSetupUtil = _arg_1;
        }


        private function _ItemSlotJewel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_JEWEL);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        private function _ItemSlotJewel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_JEWEL;
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
                if ((this as ItemSlot).giid > 0)
                {
                    Alert.show(Language.PET_STONE_PANEL[47]);
                    return;
                };
                if (!enabled)
                {
                    return;
                };
                switch (slotType)
                {
                    case SLOT_JEWEL:
                        trace("drop on a jewel slot ");
                        if (_local_2.slotType == SLOT_BAG)
                        {
                            if (ToolKit.isEqual(_local_2.type, GamePredef.TBL_ITEM_INSTANCE))
                            {
                                _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                                if (_local_3)
                                {
                                    if (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_JEWEL))
                                    {
                                        if (_hasSeted)
                                        {
                                            slotTmp = _local_2;
                                            Alert.show(Language.ITEMSLOTJEWEL_S[0], "", (Alert.YES | Alert.NO), this, jewelHandler);
                                            return;
                                        };
                                        slotData = _local_2.slotData;
                                        type = _local_2.type;
                                        tempBagFlag = false;
                                        giid = _local_2.giid;
                                        if (showStackNum)
                                        {
                                            stackNum = _local_2.stackNum;
                                        };
                                    };
                                };
                            };
                        }
                        else
                        {
                            if (_local_2.slotType == SLOT_TEMP_SLOT)
                            {
                                if (ToolKit.isEqual(_local_2.type, GamePredef.TBL_ITEM_TEMPLATE))
                                {
                                    _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                                    if (_local_3)
                                    {
                                        if (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_JEWEL))
                                        {
                                            if (_hasSeted)
                                            {
                                                slotTmp = _local_2;
                                                Alert.show(Language.ITEMSLOTJEWEL_S[0], "", (Alert.YES | Alert.NO), this, jewelHandler);
                                                return;
                                            };
                                            slotData = _local_2.slotData;
                                            type = _local_2.type;
                                            _local_2.slotData.id = _local_2.posId;
                                            tempBagFlag = true;
                                            giid = _local_2.giid;
                                            if (showStackNum)
                                            {
                                                stackNum = _local_2.stackNum;
                                            };
                                        };
                                    };
                                };
                            };
                        };
                        return;
                };
            };
        }

        public function set hasSeted(_arg_1:Boolean):void
        {
            _hasSeted = _arg_1;
        }

        override public function initialize():void
        {
            var target:ItemSlotJewel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotJewel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotJewelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        private function jewelHandler(_arg_1:CloseEvent):void
        {
            if (((_arg_1.detail == Alert.YES) && (slotTmp)))
            {
                slotData = slotTmp.slotData;
                type = slotTmp.type;
                giid = slotTmp.giid;
                if (showStackNum)
                {
                    stackNum = slotTmp.stackNum;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

