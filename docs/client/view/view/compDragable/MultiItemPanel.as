// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MultiItemPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Label;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.Slot;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
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

    public class MultiItemPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const NUM_PER_PAGE:uint = 3;
        private var currentIdx:uint = 0;
        public var _MultiItemPanel_BasicGlowButton1:BasicGlowButton;
        private var _666737697slotItem2:ItemSlot;
        private var _1464371768txtTitle:BasicTitleCanvas;
        private var _803560629pageSel:PageSelector;
        private var selectedIdx:int = -1;
        private var _666737698slotItem3:ItemSlot;
        private var _2113277654slotBag:ItemSlot;
        private var _878845122txtInfo:Text;
        private var _1820004046itemSelected:ItemSlot;
        private var itemList:Object;
        private var packItemSid:uint = 0;
        private var _666737696slotItem1:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":204,
                    "height":244,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"txtTitle"
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slotBag",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":85,
                                "y":39,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slotItem1",
                        "events":{"click":"__slotItem1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":101,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slotItem2",
                        "events":{"click":"__slotItem2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":136,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"slotItem3",
                        "events":{"click":"__slotItem3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":172,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MultiItemPanel_BasicGlowButton1",
                        "events":{"click":"___MultiItemPanel_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":118,
                                "y":184,
                                "styleName":"HorizontalTab"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"txtInfo",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "left";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":18,
                                "y":77,
                                "width":160
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"itemSelected",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":118,
                                "y":136,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":85,
                                "y":144,
                                "text":"==>",
                                "width":31.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":213,
                                "x":27
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var titleTxt:String = Language.MULTI_ITEM_PANEL[3];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MultiItemPanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 204;
            this.height = 244;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MultiItemPanel._watcherSetupUtil = _arg_1;
        }


        public function set txtInfo(_arg_1:Text):void
        {
            var _local_2:Object = this._878845122txtInfo;
            if (_local_2 !== _arg_1)
            {
                this._878845122txtInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtInfo", _local_2, _arg_1));
            };
        }

        private function _MultiItemPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = titleTxt;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtTitle.text = _arg_1;
            }, "txtTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slotItem1.slotType = _arg_1;
            }, "slotItem1.slotType");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slotItem2.slotType = _arg_1;
            }, "slotItem2.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                slotItem3.slotType = _arg_1;
            }, "slotItem3.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MULTI_ITEM_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MultiItemPanel_BasicGlowButton1.label = _arg_1;
            }, "_MultiItemPanel_BasicGlowButton1.label");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_LOTTO);
            }, function (_arg_1:int):void
            {
                itemSelected.slotType = _arg_1;
            }, "itemSelected.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():Function
            {
                return (onPageChanged);
            }, function (_arg_1:Function):void
            {
                pageSel.onPageChanged = _arg_1;
            }, "pageSel.onPageChanged");
            result[6] = binding;
            return (result);
        }

        public function __slotItem2_click(_arg_1:MouseEvent):void
        {
            selItem(2);
        }

        private function selItem(_arg_1:uint):void
        {
            if (this[("slotItem" + _arg_1)].slotData)
            {
                itemSelected.clean();
                itemSelected.type = this[("slotItem" + _arg_1)].type;
                itemSelected.giid = this[("slotItem" + _arg_1)].giid;
                itemSelected.stackNum = this[("slotItem" + _arg_1)].stackNum;
                itemSelected.quality = this[("slotItem" + _arg_1)].quality;
                itemSelected.slotData = this[("slotItem" + _arg_1)].slotData;
                if (this[("slotItem" + _arg_1)].type == GamePredef.TBL_CREATURE)
                {
                    itemSelected.setStyleName(_core.basic.colorByGrowRate((itemSelected.quality / 10)));
                }
                else
                {
                    itemSelected.setStyleName(_core.basic.getColorByQuality(this[("slotItem" + _arg_1)].quality));
                };
                this.selectedIdx = this[("slotItem" + _arg_1)].slotData.idx;
                currentIdx = _arg_1;
            };
        }

        override public function initialize():void
        {
            var target:MultiItemPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MultiItemPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MultiItemPanelWatcherSetupUtil");
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

        public function set itemSelected(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1820004046itemSelected;
            if (_local_2 !== _arg_1)
            {
                this._1820004046itemSelected = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemSelected", _local_2, _arg_1));
            };
        }

        public function set pageSel(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._803560629pageSel;
            if (_local_2 !== _arg_1)
            {
                this._803560629pageSel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slotBag():ItemSlot
        {
            return (this._2113277654slotBag);
        }

        [Bindable(event="propertyChange")]
        public function get slotItem1():ItemSlot
        {
            return (this._666737696slotItem1);
        }

        private function _MultiItemPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = titleTxt;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = Language.MULTI_ITEM_PANEL[2];
            _local_1 = Slot.SLOT_LOTTO;
            _local_1 = onPageChanged;
        }

        public function set txtTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1464371768txtTitle;
            if (_local_2 !== _arg_1)
            {
                this._1464371768txtTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slotItem2():ItemSlot
        {
            return (this._666737697slotItem2);
        }

        [Bindable(event="propertyChange")]
        public function get slotItem3():ItemSlot
        {
            return (this._666737698slotItem3);
        }

        [Bindable(event="propertyChange")]
        public function get txtInfo():Text
        {
            return (this._878845122txtInfo);
        }

        public function set slotItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._666737696slotItem1;
            if (_local_2 !== _arg_1)
            {
                this._666737696slotItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotItem1", _local_2, _arg_1));
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_4:*;
            slotItem1.clean();
            slotItem2.clean();
            slotItem3.clean();
            var _local_3:uint = (0 - _arg_1);
            for (_local_4 in itemList)
            {
                if (itemList[_local_4])
                {
                    _local_3++;
                    if (this.hasOwnProperty(("slotItem" + _local_3)))
                    {
                        this[("slotItem" + _local_3)].type = itemList[_local_4].ti;
                        this[("slotItem" + _local_3)].giid = itemList[_local_4].ii;
                        this[("slotItem" + _local_3)].stackNum = itemList[_local_4].n;
                        this[("slotItem" + _local_3)].quality = itemList[_local_4].q;
                        this[("slotItem" + _local_3)].slotData = itemList[_local_4];
                        this[("slotItem" + _local_3)].slotData.idx = _local_4;
                        if (itemList[_local_4].ti == GamePredef.TBL_CREATURE)
                        {
                            this[("slotItem" + _local_3)].setStyleName(_core.basic.colorByGrowRate((itemList[_local_4].q / 10)));
                        }
                        else
                        {
                            this[("slotItem" + _local_3)].setStyleName(_core.basic.getColorByQuality(itemList[_local_4].q));
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtTitle():BasicTitleCanvas
        {
            return (this._1464371768txtTitle);
        }

        public function __slotItem1_click(_arg_1:MouseEvent):void
        {
            selItem(1);
        }

        public function __slotItem3_click(_arg_1:MouseEvent):void
        {
            selItem(3);
        }

        [Bindable(event="propertyChange")]
        public function get itemSelected():ItemSlot
        {
            return (this._1820004046itemSelected);
        }

        [Bindable(event="propertyChange")]
        public function get pageSel():PageSelector
        {
            return (this._803560629pageSel);
        }

        public function setItemList(_arg_1:Object, _arg_2:uint):void
        {
            var _local_4:uint;
            var _local_5:*;
            if (!visible)
            {
                super.show();
            };
            this.packItemSid = _arg_2;
            slotItem1.clean();
            slotItem2.clean();
            slotItem3.clean();
            var _local_3:Object = _core.data.sList[_arg_2];
            if (_local_3)
            {
                slotBag.type = _local_3.type;
                slotBag.giid = _local_3.itemId;
                if (((_arg_1) && (_arg_1.packItemList)))
                {
                    itemList = _arg_1.packItemList;
                    _local_4 = 0;
                    for (_local_5 in _arg_1.packItemList)
                    {
                        if (_arg_1.packItemList[_local_5])
                        {
                            _local_4++;
                            if (this.hasOwnProperty(("slotItem" + _local_4)))
                            {
                                this[("slotItem" + _local_4)].type = _arg_1.packItemList[_local_5].ti;
                                this[("slotItem" + _local_4)].giid = _arg_1.packItemList[_local_5].ii;
                                this[("slotItem" + _local_4)].stackNum = _arg_1.packItemList[_local_5].n;
                                this[("slotItem" + _local_4)].quality = _arg_1.packItemList[_local_5].q;
                                this[("slotItem" + _local_4)].slotData = _arg_1.packItemList[_local_5];
                                this[("slotItem" + _local_4)].slotData.idx = _local_5;
                                this[("slotItem" + _local_4)].setStyleName(_core.basic.colorByGrowRate((_arg_1.packItemList[_local_5].q / 10)));
                            };
                        };
                    };
                    pageSel.initPageSeletor(_local_4, NUM_PER_PAGE);
                    if (_local_4 <= NUM_PER_PAGE)
                    {
                        pageSel.visible = false;
                    }
                    else
                    {
                        pageSel.visible = true;
                    };
                };
                itemSelected.clean();
                selectedIdx = -1;
                txtInfo.text = Language.MULTI_ITEM_PANEL[0].toString().replace("{num}", _arg_1.packGetNum);
                if (_arg_1.packGetNum == "all")
                {
                    txtInfo.text = Language.MULTI_ITEM_PANEL[1];
                };
            };
        }

        public function set slotBag(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113277654slotBag;
            if (_local_2 !== _arg_1)
            {
                this._2113277654slotBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotBag", _local_2, _arg_1));
            };
        }

        private function getItemByIdx():void
        {
            var _local_1:*;
            if (selectedIdx >= 0)
            {
                if (this[("slotItem" + currentIdx)])
                {
                    _local_1 = this[("slotItem" + currentIdx)];
                    if (_local_1.type)
                    {
                        if (((_local_1.type == GamePredef.TBL_CREATURE) && (!(_core.player.enoughPetSlot(1)))))
                        {
                            _core.sysMsg(Language.MULTI_ITEM_PANEL[4]);
                            return;
                        };
                        if ((((_local_1.type == GamePredef.TBL_ITEM_TEMPLATE) || (_local_1.type == GamePredef.TBL_EQUIPT_TEMPLATE)) && (!(_core.player.enoughBag(1)))))
                        {
                            _core.sysMsg(Language.MULTI_ITEM_PANEL[4]);
                            return;
                        };
                        _core.remote.call("selMultiItemByIdx", new Responder(onGetItemByIdx), packItemSid, selectedIdx);
                    };
                };
            };
        }

        private function onGetItemByIdx(_arg_1:int):void
        {
            var _local_2:Object;
            if (_arg_1 >= 0)
            {
                itemSelected.clean();
                currentIdx = 0;
                if (_arg_1 == 0)
                {
                    super.hide();
                }
                else
                {
                    itemList[selectedIdx] = null;
                    delete itemList[selectedIdx];
                    _local_2 = new Object();
                    _local_2.packItemList = itemList;
                    _local_2.packGetNum = _arg_1;
                    setItemList(_local_2, packItemSid);
                };
                selectedIdx = -1;
            };
        }

        public function set slotItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._666737697slotItem2;
            if (_local_2 !== _arg_1)
            {
                this._666737697slotItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotItem2", _local_2, _arg_1));
            };
        }

        public function set slotItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._666737698slotItem3;
            if (_local_2 !== _arg_1)
            {
                this._666737698slotItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotItem3", _local_2, _arg_1));
            };
        }

        public function ___MultiItemPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            getItemByIdx();
        }


    }
}//package com.qeedoo.ui.view.compDragable

