// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ItemSlotStoneSeal

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import mx.events.DragEvent;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
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

    public class ItemSlotStoneSeal extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var isOpen:Boolean = false;
        public var sealIndex:int = -1;
        private var _1091760867holeImg:Image;
        private var _hasSeted:Boolean = false;
        private var slotTmp:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":ItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":34,
                    "height":34,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"holeImg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":1,
                                "y":1,
                                "visible":false,
                                "buttonMode":true
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ItemSlotStoneSeal()
        {
            mx_internal::_document = this;
            this.width = 34;
            this.height = 34;
            this.showStackNum = false;
            this.addEventListener("creationComplete", ___ItemSlotStoneSeal_ItemSlot1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ItemSlotStoneSeal._watcherSetupUtil = _arg_1;
        }


        private function _ItemSlotStoneSeal_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_STONE_SEAL);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000381));
            }, function (_arg_1:Object):void
            {
                holeImg.source = _arg_1;
            }, "holeImg.source");
            result[1] = binding;
            return (result);
        }

        private function dClick(_arg_1:GameEvent):void
        {
            var _local_2:Object;
            if ((((isOpen) && (type > 0)) && (giid > 0)))
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                if (_local_2)
                {
                    _local_2.toRemove(sealIndex);
                };
            };
        }

        private function _ItemSlotStoneSeal_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_STONE_SEAL;
            _local_1 = ResManager.getIconUrl(4130220000381);
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:ItemSlot;
            var _local_3:Object;
            var _local_4:Object;
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
                    case SLOT_STONE_SEAL:
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
                                        if (!isOpen)
                                        {
                                            Alert.show(Language.STONE_SEAL_PANEL_U[5], "", Alert.YES, this);
                                            return;
                                        };
                                        _local_4 = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                                        if (_local_4)
                                        {
                                            _local_4.stoneSealSetStone(_local_2, this);
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
                                            if (!isOpen)
                                            {
                                                Alert.show(Language.STONE_SEAL_PANEL_U[5], "", Alert.YES, this);
                                                return;
                                            };
                                            _local_4 = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                                            if (_local_4)
                                            {
                                                _local_4.stoneSealSetStone(_local_2, this);
                                            };
                                        };
                                    };
                                };
                            }
                            else
                            {
                                if (_local_2.slotType == SLOT_STONE_SEAL)
                                {
                                    _local_4 = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                                    if (((_local_4) && (_local_2 is ItemSlotStoneSeal)))
                                    {
                                        _local_4.toSwap((_local_2 as ItemSlotStoneSeal).sealIndex, this.sealIndex);
                                    };
                                };
                            };
                        };
                        return;
                };
            };
        }

        private function click(_arg_1:MouseEvent):void
        {
            var _local_2:Object;
            if (!isOpen)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                if (_local_2)
                {
                    _local_2.toBore(sealIndex);
                };
            };
        }

        public function setOpen(_arg_1:Boolean, _arg_2:int=0):void
        {
            isOpen = _arg_1;
            if (!isOpen)
            {
                clean();
                toolTip = Language.STONE_SEAL_PANEL_U[4];
            }
            else
            {
                if (_arg_2 == 0)
                {
                    toolTip = "";
                    clean();
                }
                else
                {
                    toolTip = "";
                    type = GamePredef.TBL_ITEM_TEMPLATE;
                    giid = _arg_2;
                };
            };
            holeImg.visible = (!(_arg_1));
        }

        public function set holeImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1091760867holeImg;
            if (_local_2 !== _arg_1)
            {
                this._1091760867holeImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "holeImg", _local_2, _arg_1));
            };
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

        override public function initialize():void
        {
            var target:ItemSlotStoneSeal;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ItemSlotStoneSeal_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ItemSlotStoneSealWatcherSetupUtil");
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

        public function set hasSeted(_arg_1:Boolean):void
        {
            _hasSeted = _arg_1;
        }

        public function init():void
        {
            addEventListener(MouseEvent.CLICK, click);
            addEventListener(Slot.EVENT_SLOT_DCLICK, dClick);
        }

        [Bindable(event="propertyChange")]
        public function get holeImg():Image
        {
            return (this._1091760867holeImg);
        }

        public function ___ItemSlotStoneSeal_ItemSlot1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.comp

