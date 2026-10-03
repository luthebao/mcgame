// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotStar

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class ItemSlotStar extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

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

        public function ItemSlotStar()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotStar._watcherSetupUtil = _arg_1;
        }


        private function _ItemSlotStar_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_STAR;
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
                    case SLOT_STAR:
                        trace("drop on a star slot ");
                        if (_local_2.slotType == SLOT_BAG)
                        {
                            if (ToolKit.isEqual(_local_2.type, GamePredef.TBL_ITEM_INSTANCE))
                            {
                                _local_3 = _core.getTemplateData(_local_2.type, _local_2.giid);
                                if (_local_3)
                                {
                                    if (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_STAR))
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

        override public function initialize():void
        {
            var target:ItemSlotStar;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotStar_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotStarWatcherSetupUtil");
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

        private function _ItemSlotStar_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_STAR);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

