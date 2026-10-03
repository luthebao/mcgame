// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotPetFunc

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
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

    public class ItemSlotPetFunc extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _petFuncType:Array;

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

        public function ItemSlotPetFunc()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotPetFunc._watcherSetupUtil = _arg_1;
        }


        private function _ItemSlotPetFunc_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_PETFUNC);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        private function _ItemSlotPetFunc_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_PETFUNC;
        }

        override public function dragDropHandler(event:DragEvent):void
        {
            var slot:ItemSlot;
            var itemTmp:Object;
            var inPetFuncType:Function;
            if (event.dragSource.hasFormat("slot"))
            {
                slot = (event.dragSource.dataForFormat("slot") as ItemSlot);
                if (slot == this)
                {
                    return;
                };
                if (!enabled)
                {
                    return;
                };
                switch (slotType)
                {
                    case SLOT_PETFUNC:
                        if (slot.slotType == SLOT_BAG)
                        {
                            if (ToolKit.isEqual(slot.type, GamePredef.TBL_ITEM_INSTANCE))
                            {
                                itemTmp = _core.getTemplateData(slot.type, slot.giid);
                                inPetFuncType = function (_arg_1:int, _arg_2:Array):Boolean
                                {
                                    var _local_4:*;
                                    var _local_3:Boolean;
                                    for (_local_4 in _arg_2)
                                    {
                                        if (ToolKit.isEqual(_arg_1, _arg_2[_local_4]))
                                        {
                                            _local_3 = true;
                                            break;
                                        };
                                    };
                                    return (_local_3);
                                };
                                if (itemTmp)
                                {
                                    if (((ToolKit.isEqual(itemTmp.type, GamePredef.ITEM_TYPE_PETFUNC)) && (inPetFuncType(itemTmp.propType, _petFuncType))))
                                    {
                                        slotData = slot.slotData;
                                        type = slot.type;
                                        giid = slot.giid;
                                        stackNum = slot.stackNum;
                                    };
                                };
                            };
                        };
                        return;
                };
            };
        }

        override public function initialize():void
        {
            var target:ItemSlotPetFunc;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotPetFunc_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotPetFuncWatcherSetupUtil");
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

        public function set petFuncType(_arg_1:Array):void
        {
            _petFuncType = _arg_1;
        }

        public function get petFuncType():Array
        {
            return (_petFuncType);
        }


    }
}//package com.qeedoo.ui.view.comp

