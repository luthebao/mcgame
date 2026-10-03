// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererItemSlot

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
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

    public class RendererItemSlot extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":ItemSlot});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RendererItemSlot()
        {
            mx_internal::_document = this;
            this.scaleX = 0.8;
            this.scaleY = 0.8;
            this.addEventListener("creationComplete", ___RendererItemSlot_ItemSlot1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RendererItemSlot._watcherSetupUtil = _arg_1;
        }


        private function _RendererItemSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        private function _RendererItemSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_TREASURE;
        }

        private function initV():void
        {
            movable = false;
        }

        public function ___RendererItemSlot_ItemSlot1_creationComplete(_arg_1:FlexEvent):void
        {
            initV();
        }

        override public function initialize():void
        {
            var target:RendererItemSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RendererItemSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RendererItemSlotWatcherSetupUtil");
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

        override public function set data(_arg_1:Object):void
        {
            setStyleName(0);
            if (_arg_1.q)
            {
                slotData = {};
                slotData.q = _arg_1.q;
            };
            super.data = _arg_1;
            type = _arg_1.type;
            giid = _arg_1.itemId;
            stackNum = _arg_1.stackNum;
            isInAuction = true;
        }


    }
}//package com.qeedoo.ui.view.comp

