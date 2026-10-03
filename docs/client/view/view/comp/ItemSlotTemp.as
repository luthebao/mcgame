// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotTemp

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.DragEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import flash.events.Event;
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

    public class ItemSlotTemp extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var douClick:Function;
        private var dragDropFunc:Function;
        private var _ban:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":ItemSlot});
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ItemSlotTemp()
        {
            mx_internal::_document = this;
            this.addEventListener("creationComplete", ___ItemSlotTemp_ItemSlot1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotTemp._watcherSetupUtil = _arg_1;
        }


        public function set onDragDrop(_arg_1:Function):void
        {
            dragDropFunc = _arg_1;
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            if (_ban)
            {
                return;
            };
            dragDropFunc(_arg_1);
        }

        private function _ItemSlotTemp_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_TEMP_SLOT;
            _local_1 = [GamePredef.TBL_ITEM_INSTANCE, GamePredef.TBL_ITEM_TEMPLATE];
        }

        override public function initialize():void
        {
            var target:ItemSlotTemp;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotTemp_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotTempWatcherSetupUtil");
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

        private function init():void
        {
            this.addEventListener(Slot.EVENT_SLOT_DCLICK, doubleClick);
        }

        private function set banSet(_arg_1:Boolean):void
        {
            _ban = _arg_1;
            if (_arg_1)
            {
                _canvas.alpha = 0.3;
            }
            else
            {
                _canvas.alpha = 1;
            };
        }

        public function set DoubleFunc(_arg_1:Function):void
        {
            douClick = _arg_1;
        }

        public function ___ItemSlotTemp_ItemSlot1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _ItemSlotTemp_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TEMP_SLOT);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_ITEM_INSTANCE, GamePredef.TBL_ITEM_TEMPLATE]);
            }, function (_arg_1:Array):void
            {
                this.acceptType = _arg_1;
            }, "this.acceptType");
            result[1] = binding;
            return (result);
        }

        private function doubleClick(_arg_1:Event):void
        {
            douClick(_arg_1);
        }

        public function set sData(_arg_1:Object):void
        {
            this.id = _arg_1.id;
            this.posId = _arg_1.idx;
            this.type = _arg_1.type;
            this.giid = _arg_1.itemId;
            this.stackNum = _arg_1.num;
            this.slotData = _arg_1.slotData;
            this.banSet = _arg_1.en;
            setStyleName((slotData.q / 5));
        }


    }
}//package com.qeedoo.ui.view.comp

