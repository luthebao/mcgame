// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotAuction

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
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

    public class ItemSlotAuction extends ItemSlot implements IBindingClient 
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

        public function ItemSlotAuction()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotAuction._watcherSetupUtil = _arg_1;
        }


        private function _ItemSlotAuction_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_AUCTION);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            return (result);
        }

        private function _ItemSlotAuction_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_AUCTION;
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
                    case SLOT_AUCTION:
                        if (((_local_2.slotType == SLOT_BAG) || (_local_2.slotType == SLOT_PET)))
                        {
                            if (_local_2.type == GamePredef.TBL_PET)
                            {
                                _local_3 = _core.player.petList[_local_2.giid];
                                if (_local_3)
                                {
                                    if (!ToolKit.isEqual(_local_3.binded, 0))
                                    {
                                        _core.sysMidNote(Language.ITEMSLOTAUCTION_S[0]);
                                        return;
                                    };
                                }
                                else
                                {
                                    return;
                                };
                            };
                            if (type == GamePredef.TBL_PET)
                            {
                                _core.view.getUI(ViewManager.PANEL_BAG).petInit();
                            }
                            else
                            {
                                _core.view.getUI(ViewManager.PANEL_BAG).updateView();
                            };
                            type = _local_2.type;
                            giid = _local_2.giid;
                            stackNum = _local_2.stackNum;
                            slotData = _local_2.slotData;
                            _local_2.reset();
                        };
                        return;
                };
            };
        }

        override public function initialize():void
        {
            var target:ItemSlotAuction;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotAuction_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotAuctionWatcherSetupUtil");
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


    }
}//package com.qeedoo.ui.view.comp

