// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotTempBag

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
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

    public class ItemSlotTempBag extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _selected:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":ItemSlot});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ItemSlotTempBag()
        {
            mx_internal::_document = this;
            this.movable = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotTempBag._watcherSetupUtil = _arg_1;
        }


        override public function get selected():Boolean
        {
            return (_selected);
        }

        private function _ItemSlotTempBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BAGPANEL_U[0];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = [GamePredef.TBL_ITEM_INSTANCE];
            _local_1 = Slot.SLOT_TEMP_BAG;
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            super.dragDropHandler(_arg_1);
        }

        override public function initialize():void
        {
            var target:ItemSlotTempBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotTempBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotTempBagWatcherSetupUtil");
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

        private function _ItemSlotTempBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                this.text = _arg_1;
            }, "this.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                this.type = _arg_1;
            }, "this.type");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_ITEM_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                this.acceptType = _arg_1;
            }, "this.acceptType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMP_BAG);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[3] = binding;
            return (result);
        }

        override public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
            if (_arg_1)
            {
                setStyleName(3);
            }
            else
            {
                resetQualityColor();
            };
        }


    }
}//package com.qeedoo.ui.view.comp

