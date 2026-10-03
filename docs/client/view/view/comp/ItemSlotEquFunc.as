// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotEquFunc

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

    public class ItemSlotEquFunc extends ItemSlot implements IBindingClient 
    {

        public static const EQUIP_COMMON:Object = {"kinds":{
                "1":true,
                "2":true,
                "3":true,
                "4":true,
                "12":true
            }};
        public static const EQUIP_MW:Object = {"kinds":{"8":true}};
        public static const EQUIP_MW_MAIN:Object = {
            "kinds":{"8":true},
            "types":{"800":true}
        };
        public static const EQUIP_MW_SUB:Object = {
            "kinds":{"8":true},
            "types":{"801":true}
        };
        public static const EQUIP_PETEQU:Object = {"kinds":{"9":true}};
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var dragable:Boolean = true;

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
        private var defaultAcceptObj:Object = EQUIP_COMMON;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ItemSlotEquFunc()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotEquFunc._watcherSetupUtil = _arg_1;
        }


        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:ItemSlot;
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Object;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ItemSlot);
                if (((_local_2 == this) || (!(dragable))))
                {
                    return;
                };
                switch (slotType)
                {
                    case SLOT_EQUFUNC:
                        if (_local_2.slotType == SLOT_BAG)
                        {
                            _local_3 = false;
                            _local_4 = ToolKit.isEqual(_local_2.type, GamePredef.TBL_EQUIPT_INSTANCE);
                            _local_5 = _core.getTemplateData(_local_2.type, _local_2.giid);
                            acceptObj = ((acceptObj) || (defaultAcceptObj));
                            _local_3 = ((_local_4) && (checkAcceptObj(_local_5)));
                            if (_local_3)
                            {
                                slotData = _local_2.slotData;
                                type = _local_2.type;
                                giid = _local_2.giid;
                                stackNum = _local_2.stackNum;
                                dropSlot = _local_2;
                            };
                        };
                };
            };
        }

        private function _ItemSlotEquFunc_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_EQUFUNC);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:ItemSlotEquFunc;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotEquFunc_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotEquFuncWatcherSetupUtil");
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

        private function _ItemSlotEquFunc_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_EQUFUNC;
        }


    }
}//package com.qeedoo.ui.view.comp

