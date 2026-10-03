// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotMaterial

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
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

    public class ItemSlotMaterial extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _requireSlot:Object;
        private var _haveRequireSlot:Boolean = true;

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

        public function ItemSlotMaterial()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotMaterial._watcherSetupUtil = _arg_1;
        }


        public function get haveRequireSlot():Boolean
        {
            return (_haveRequireSlot);
        }

        public function get requireSlot():Object
        {
            return (_requireSlot);
        }

        public function set requireSlot(_arg_1:Object):void
        {
            _requireSlot = _arg_1;
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
                switch (slotType)
                {
                    case SLOT_MATERIAL:
                        trace("drop on a material slot ");
                        if (_local_2.slotType == SLOT_BAG)
                        {
                            _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                            if (!_local_3)
                            {
                                return;
                            };
                            if (!((ToolKit.isEqual(_local_3.kind, GamePredef.ITEM_KIND_MATERIAL)) || (ToolKit.isEqual(_local_3.id, 2039))))
                            {
                                return;
                            };
                            if (_haveRequireSlot)
                            {
                                if (requireSlot)
                                {
                                    if ((((ToolKit.isEqual(_local_2.type, (requireSlot.type - 1))) && (ToolKit.isEqual(_local_3.id, requireSlot.giid))) && (ToolKit.isBigOrEqual(_local_2.stackNum, requireSlot.stackNum))))
                                    {
                                        tempBagFlag = false;
                                        slotData = _local_2.slotData;
                                        type = _local_2.type;
                                        stackNum = requireSlot.stackNum;
                                        giid = _local_2.giid;
                                    };
                                };
                            }
                            else
                            {
                                tempBagFlag = false;
                                slotData = _local_2.slotData;
                                type = _local_2.type;
                                stackNum = _local_2.stackNum;
                                giid = _local_2.giid;
                            };
                        }
                        else
                        {
                            if (_local_2.slotType == SLOT_TEMP_SLOT)
                            {
                                _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                                if (!_local_3)
                                {
                                    return;
                                };
                                if (!((ToolKit.isEqual(_local_3.kind, GamePredef.ITEM_KIND_MATERIAL)) || (ToolKit.isEqual(_local_3.id, 2039))))
                                {
                                    return;
                                };
                                if (_haveRequireSlot)
                                {
                                    if (requireSlot)
                                    {
                                        if ((((ToolKit.isEqual(_local_2.type, requireSlot.type)) && (ToolKit.isEqual(_local_3.id, requireSlot.giid))) && (ToolKit.isBigOrEqual(_local_2.stackNum, requireSlot.stackNum))))
                                        {
                                            tempBagFlag = true;
                                            _local_2.slotData.idx = _local_2.posId;
                                            slotData = _local_2.slotData;
                                            setStyleName((slotData.q / 5));
                                            type = _local_2.type;
                                            stackNum = requireSlot.stackNum;
                                            giid = _local_2.giid;
                                        };
                                    };
                                }
                                else
                                {
                                    tempBagFlag = true;
                                    _local_2.slotData.idx = _local_2.posId;
                                    slotData = _local_2.slotData;
                                    setStyleName((slotData.q / 5));
                                    type = _local_2.type;
                                    stackNum = _local_2.stackNum;
                                    giid = _local_2.giid;
                                };
                            };
                        };
                        return;
                };
            };
        }

        private function _ItemSlotMaterial_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_MATERIAL);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        override public function reset():void
        {
            super.reset();
            _requireSlot = null;
            _haveRequireSlot = false;
        }

        override public function initialize():void
        {
            var target:ItemSlotMaterial;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotMaterial_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotMaterialWatcherSetupUtil");
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

        private function _ItemSlotMaterial_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_MATERIAL;
        }

        public function set haveRequireSlot(_arg_1:Boolean):void
        {
            _haveRequireSlot = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

