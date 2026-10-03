// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ShopPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import com.qeedoo.game.ui.IPanelUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ShopSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.PageSelector;
    import flash.utils.Timer;
    import com.qeedoo.game.ui.ISlot;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.containers.HBox;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import mx.managers.DragManager;
    import mx.events.DragEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.setTimeout;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
    import mx.events.CloseEvent;
    import com.adobe.crypto.MD5;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.net.Responder;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.core.UIComponent;
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

    public class ShopPanel extends DragableCanvas implements IPanelUI, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ITEM_COUNT_PER_PAGE_NORMAL_SHOP:int = 12;
        private const ITEM_COUNT_PER_PAGE_NEW_SHOP:int = 9;
        private var _2115046235shopSlot9:ShopSlot;
        private var _1141924044shopSlot11:ShopSlot;
        private var _slotList:Object;
        private var _2115046236shopSlot8:ShopSlot;
        private var _2115046240shopSlot4:ShopSlot;
        private var _selectedSlot:ShopSlot;
        public var _ShopPanel_BasicGlowButton2:BasicGlowButton;
        public var _ShopPanel_BasicGlowButton3:BasicGlowButton;
        public var _ShopPanel_BasicGlowButton4:BasicGlowButton;
        public var _ShopPanel_BasicGlowButton1:BasicGlowButton;
        private var _2115046237shopSlot7:ShopSlot;
        private var _2115046241shopSlot3:ShopSlot;
        public var shopType:int = 1;
        private var _2115046238shopSlot6:ShopSlot;
        private var _2115046242shopSlot2:ShopSlot;
        public var _ShopPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2115046239shopSlot5:ShopSlot;
        public var _ShopPanel_RoundedLabel1:RoundedLabel;
        private var _2115046243shopSlot1:ShopSlot;
        private var _2106311967tileItem:Tile;
        private var ITEM_COUNT_PER_PAGE:int;
        private var _2115046244shopSlot0:ShopSlot;
        private var _607339634pageSelector:PageSelector;
        private var _laterTimer:Timer;
        private var currentNPCID:Number = -1;
        private var _1141924045shopSlot10:ShopSlot;
        private var _slot:ISlot;
        private var _autoOpenBag:Boolean;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":460,
                    "height":310,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ShopPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.top = "40";
                            this.bottom = "40";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "id":"tileItem",
                                    "events":{"mouseDown":"__tileItem_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalAlign = "center";
                                        this.top = "3";
                                        this.paddingBottom = 5;
                                        this.paddingLeft = 5;
                                        this.paddingRight = 5;
                                        this.paddingTop = 5;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "height":195,
                                            "width":386,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot0",
                                                "events":{
                                                    "click":"__shopSlot0_click",
                                                    "doubleClick":"__shopSlot0_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot1",
                                                "events":{
                                                    "click":"__shopSlot1_click",
                                                    "doubleClick":"__shopSlot1_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot2",
                                                "events":{
                                                    "click":"__shopSlot2_click",
                                                    "doubleClick":"__shopSlot2_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot3",
                                                "events":{
                                                    "click":"__shopSlot3_click",
                                                    "doubleClick":"__shopSlot3_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot4",
                                                "events":{
                                                    "click":"__shopSlot4_click",
                                                    "doubleClick":"__shopSlot4_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot5",
                                                "events":{
                                                    "click":"__shopSlot5_click",
                                                    "doubleClick":"__shopSlot5_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot6",
                                                "events":{
                                                    "click":"__shopSlot6_click",
                                                    "doubleClick":"__shopSlot6_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot7",
                                                "events":{
                                                    "click":"__shopSlot7_click",
                                                    "doubleClick":"__shopSlot7_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot8",
                                                "events":{
                                                    "click":"__shopSlot8_click",
                                                    "doubleClick":"__shopSlot8_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot9",
                                                "events":{
                                                    "click":"__shopSlot9_click",
                                                    "doubleClick":"__shopSlot9_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot10",
                                                "events":{
                                                    "click":"__shopSlot10_click",
                                                    "doubleClick":"__shopSlot10_doubleClick"
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot11",
                                                "events":{
                                                    "click":"__shopSlot11_click",
                                                    "doubleClick":"__shopSlot11_doubleClick"
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":204});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_ShopPanel_RoundedLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":173});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_ShopPanel_BasicGlowButton1",
                                    "events":{"click":"___ShopPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalRed",
                                            "width":38,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_ShopPanel_BasicGlowButton2",
                                    "events":{"click":"___ShopPanel_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalRed",
                                            "width":38,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_ShopPanel_BasicGlowButton3",
                                    "events":{"click":"___ShopPanel_BasicGlowButton3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalRed",
                                            "width":61,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_ShopPanel_BasicGlowButton4",
                                    "events":{"click":"___ShopPanel_BasicGlowButton4_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnNormalRed",
                                            "width":89,
                                            "height":19
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var _1267797936_itemList:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ShopPanel()
        {
            mx_internal::_document = this;
            this.width = 460;
            this.height = 310;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___ShopPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ShopPanel._watcherSetupUtil = _arg_1;
        }


        public function ___ShopPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __shopSlot3_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function dragOverHandler(_arg_1:DragEvent):void
        {
            DragManager.showFeedback(DragManager.MOVE);
        }

        public function __shopSlot10_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot7_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function init():void
        {
            addEventListener(DragEvent.DRAG_ENTER, dragEnterHandler);
            addEventListener(DragEvent.DRAG_OVER, dragOverHandler);
            addEventListener(DragEvent.DRAG_DROP, dragDropHandler);
        }

        private function doubleClickHandler(_arg_1:Event):void
        {
            var _local_2:ShopSlot;
            _local_2 = ShopSlot(_arg_1.currentTarget);
            if (_local_2.giid >= 0)
            {
                _local_2.selected = true;
                buy();
            };
        }

        public function showDataDirect(_arg_1:int):void
        {
            var _local_3:Object;
            var _local_2:Object = _core.data.getData(GamePredef.TBL_SHOP, _arg_1);
            if (_local_2)
            {
                shopType = _local_2.type;
                tileItem.visible = false;
                _selectedSlot = null;
                _itemList.source = [];
                _slotList = _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_arg_1];
                for each (_local_3 in _slotList)
                {
                    _local_3.currentAmount = -1;
                };
                initView();
                show();
                setDataLater();
                currentNPCID = -1;
                if (shopType == 1)
                {
                    ITEM_COUNT_PER_PAGE = ITEM_COUNT_PER_PAGE_NORMAL_SHOP;
                }
                else
                {
                    ITEM_COUNT_PER_PAGE = ITEM_COUNT_PER_PAGE_NEW_SHOP;
                };
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function ___ShopPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_REPAIR_NORMAL);
        }

        public function __shopSlot6_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot8_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot4_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function set shopSlot1(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046243shopSlot1;
            if (_local_2 !== _arg_1)
            {
                this._2115046243shopSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot1", _local_2, _arg_1));
            };
        }

        public function __shopSlot0_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function set shopSlot7(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046237shopSlot7;
            if (_local_2 !== _arg_1)
            {
                this._2115046237shopSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot7", _local_2, _arg_1));
            };
        }

        public function showData(_arg_1:Object):void
        {
            var _local_2:Object;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.hide)
            {
                if (_arg_1.hide == currentNPCID)
                {
                    this.visible = false;
                };
            }
            else
            {
                shopType = _core.data.getData(GamePredef.TBL_SHOP, _arg_1.shopId).type;
                tileItem.visible = false;
                _selectedSlot = null;
                _itemList.source = [];
                _slotList = _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_arg_1.shopId];
                for each (_local_2 in _slotList)
                {
                    _local_2.currentAmount = -1;
                };
                initView();
                show();
                setDataLater();
                currentNPCID = _arg_1.id;
                if (shopType == 1)
                {
                    ITEM_COUNT_PER_PAGE = ITEM_COUNT_PER_PAGE_NORMAL_SHOP;
                }
                else
                {
                    ITEM_COUNT_PER_PAGE = ITEM_COUNT_PER_PAGE_NEW_SHOP;
                };
            };
        }

        override public function hide():void
        {
            if (_laterTimer != null)
            {
                _laterTimer.stop();
            };
            super.hide();
            if (_autoOpenBag)
            {
                _core.view.hide(ViewManager.PANEL_BAG);
                _autoOpenBag = false;
            };
        }

        private function mouseAction(_arg_1:Event, _arg_2:int):void
        {
            _arg_1.stopImmediatePropagation();
            if (_arg_2 == GamePredef.ACTION_REPAIR_NOWEAR)
            {
            };
            if (_core.state == GamePredef.ST_BATTLE)
            {
                return;
            };
            _core.view.showMouse(ResManager.MOUSE_ACTION_IMG[_arg_2]);
            _core.view.mouseState = _arg_2;
            _core.view.mouseTargetType = GamePredef.MOUSE_TARGET_CHA;
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot10():ShopSlot
        {
            return (this._1141924045shopSlot10);
        }

        public function __shopSlot0_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function onShopItemBuy(_arg_1:Number):void
        {
            _selectedSlot.slotData.currentAmount = _arg_1;
            _selectedSlot.slotData = _selectedSlot.slotData;
        }

        public function set shopSlot4(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046240shopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2115046240shopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot4", _local_2, _arg_1));
            };
        }

        private function sell(_arg_1:Number, _arg_2:String=null):void
        {
            _core.remote.sellItem(_arg_1, _arg_2);
            var _local_3:Function = _core.view.getUI(ViewManager.MAIN_USER_BAR).setNum;
            setTimeout(_local_3, 2000);
        }

        public function set shopSlot6(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046238shopSlot6;
            if (_local_2 !== _arg_1)
            {
                this._2115046238shopSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot11():ShopSlot
        {
            return (this._1141924044shopSlot11);
        }

        public function set shopSlot8(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046236shopSlot8;
            if (_local_2 !== _arg_1)
            {
                this._2115046236shopSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot8", _local_2, _arg_1));
            };
        }

        public function __shopSlot2_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function set shopSlot9(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046235shopSlot9;
            if (_local_2 !== _arg_1)
            {
                this._2115046235shopSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot9", _local_2, _arg_1));
            };
        }

        public function set shopSlot0(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046244shopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._2115046244shopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot0", _local_2, _arg_1));
            };
        }

        private function sortList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_2:Array = [];
            for each (_local_3 in _arg_1)
            {
                _local_3.shopType = shopType;
                _local_2.push(_local_3);
            };
            return (_local_2.sortOn("position", Array.NUMERIC));
        }

        public function set shopSlot3(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046241shopSlot3;
            if (_local_2 !== _arg_1)
            {
                this._2115046241shopSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot3", _local_2, _arg_1));
            };
        }

        public function __shopSlot4_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __shopSlot10_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set shopSlot5(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046239shopSlot5;
            if (_local_2 !== _arg_1)
            {
                this._2115046239shopSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot5", _local_2, _arg_1));
            };
        }

        public function __shopSlot8_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function ___ShopPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            Alert.show(Language.SHOPPANEL_S[3], "", 3, this, repairAll);
        }

        private function set _itemList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1267797936_itemList;
            if (_local_2 !== _arg_1)
            {
                this._1267797936_itemList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_itemList", _local_2, _arg_1));
            };
        }

        public function set shopSlot2(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046242shopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2115046242shopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot2", _local_2, _arg_1));
            };
        }

        public function set shopSlot10(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924045shopSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1141924045shopSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot10", _local_2, _arg_1));
            };
        }

        public function set shopSlot11(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924044shopSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1141924044shopSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot11", _local_2, _arg_1));
            };
        }

        private function timerCompHander(_arg_1:TimerEvent):void
        {
            _laterTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompHander);
            _itemList.source = sortList(_slotList);
            tileItem.visible = true;
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(_itemList.length, ITEM_COUNT_PER_PAGE);
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                this[("shopSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        private function dragDropHandler(event:DragEvent):void
        {
            var func:Function;
            var sellItem:Function;
            var iData:Object = _core.data.getGameData(_slot.slotData.type, _slot.slotData.itemId);
            if (((iData) && (iData.color > 2)))
            {
                if (_core.delPass)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            sell(_slot.slotData.id, _core.delPass);
                        };
                    };
                    Alert.show(Language.SHOPPANEL_S[0], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    sellItem = function (_arg_1:String):void
                    {
                        sell(_slot.slotData.id, MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.BAGPANEL_S[20], sellItem);
                };
            }
            else
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        sell(_slot.slotData.id);
                    };
                };
                Alert.show(Language.SHOPPANEL_S[0], "", (Alert.YES | Alert.NO), null, func);
            };
        }

        override public function initialize():void
        {
            var target:ShopPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ShopPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ShopPanelWatcherSetupUtil");
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

        private function repairPetEquAll(_arg_1:CloseEvent):void
        {
            var _local_2:* = _core.battlePet;
            if ((((_arg_1) && (_arg_1.detail == Alert.YES)) && (_local_2)))
            {
                _core.remote.repairPetEquAll(_local_2.id, 1);
            };
        }

        public function __shopSlot11_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        private function buy():void
        {
            var bagpanel:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuy), MD5.hash(_arg_1));
            };
            if (_selectedSlot.slotData.gt == 1)
            {
                if (((_selectedSlot.slotData.gold > 0) && (!(bagpanel.goldSelected))))
                {
                    Alert.show(Language.SHOPPANEL_S[8], "", Alert.YES, null, null);
                }
                else
                {
                    if (((_selectedSlot.slotData.money > 0) && (!(bagpanel.silverSelected))))
                    {
                        Alert.show(Language.SHOPPANEL_S[9], "", Alert.YES, null, null);
                    }
                    else
                    {
                        if (((_selectedSlot.slotData.gold > 0) && (bagpanel.goldLockFlag)))
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
                        }
                        else
                        {
                            if (((_selectedSlot.slotData.money > 0) && (bagpanel.silverLockFlag)))
                            {
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.BAGPANEL_S[21], func);
                            }
                            else
                            {
                                doBuy(true);
                            };
                        };
                    };
                };
            }
            else
            {
                if (_selectedSlot.slotData.gold > 0)
                {
                    if (bagpanel.goldDisable())
                    {
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
                    }
                    else
                    {
                        doBuy(true);
                    };
                }
                else
                {
                    if (bagpanel.silverDisable())
                    {
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.BAGPANEL_S[21], func);
                    }
                    else
                    {
                        doBuy(true);
                    };
                };
            };
        }

        private function _ShopPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ShopPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_RoundedLabel1.text = _arg_1;
            }, "_ShopPanel_RoundedLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_RoundedLabel1.toolTip = _arg_1;
            }, "_ShopPanel_RoundedLabel1.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton1.label = _arg_1;
            }, "_ShopPanel_BasicGlowButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton2.toolTip = _arg_1;
            }, "_ShopPanel_BasicGlowButton2.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton2.label = _arg_1;
            }, "_ShopPanel_BasicGlowButton2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton3.toolTip = _arg_1;
            }, "_ShopPanel_BasicGlowButton3.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton3.label = _arg_1;
            }, "_ShopPanel_BasicGlowButton3.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton4.toolTip = _arg_1;
            }, "_ShopPanel_BasicGlowButton4.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOPPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ShopPanel_BasicGlowButton4.label = _arg_1;
            }, "_ShopPanel_BasicGlowButton4.label");
            result[9] = binding;
            return (result);
        }

        public function __shopSlot5_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __shopSlot9_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __shopSlot1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot5():ShopSlot
        {
            return (this._2115046239shopSlot5);
        }

        private function clickHandler(_arg_1:Event):void
        {
            var _local_2:ShopSlot;
            clearSelection();
            _local_2 = ShopSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            _selectedSlot = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot0():ShopSlot
        {
            return (this._2115046244shopSlot0);
        }

        public function __shopSlot11_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot2():ShopSlot
        {
            return (this._2115046242shopSlot2);
        }

        private function dragEnterHandler(_arg_1:DragEvent):void
        {
            var _local_2:ISlot;
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as ISlot);
                _slot = _local_2;
                if (_local_2.slotType == Slot.SLOT_BAG)
                {
                    DragManager.acceptDragDrop(UIComponent(_arg_1.currentTarget));
                };
            };
        }

        public function ___ShopPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            Alert.show(Language.SHOPPANEL_S[7], "", 3, this, repairPetEquAll);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot6():ShopSlot
        {
            return (this._2115046238shopSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot8():ShopSlot
        {
            return (this._2115046236shopSlot8);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot1():ShopSlot
        {
            return (this._2115046243shopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot3():ShopSlot
        {
            return (this._2115046241shopSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot4():ShopSlot
        {
            return (this._2115046240shopSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot7():ShopSlot
        {
            return (this._2115046237shopSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot9():ShopSlot
        {
            return (this._2115046235shopSlot9);
        }

        public function __shopSlot1_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot3_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot5_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot7_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        public function __shopSlot9_doubleClick(_arg_1:MouseEvent):void
        {
            doubleClickHandler(_arg_1);
        }

        private function clearSelection():void
        {
            var _local_1:int;
            while (_local_1 < tileItem.numChildren)
            {
                ShopSlot(tileItem.getChildAt(_local_1)).selected = false;
                _local_1++;
            };
        }

        private function setDataLater():void
        {
            if (_laterTimer != null)
            {
                _laterTimer.stop();
                _laterTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerCompHander);
            };
            _laterTimer = new Timer(500, 1);
            _laterTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timerCompHander);
            _laterTimer.start();
        }

        public function set tileItem(_arg_1:Tile):void
        {
            var _local_2:Object = this._2106311967tileItem;
            if (_local_2 !== _arg_1)
            {
                this._2106311967tileItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileItem", _local_2, _arg_1));
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("shopSlot" + _local_4)].slotData = _itemList[_local_3];
                this[("shopSlot" + _local_4)].visible = true;
                _local_4++;
            };
        }

        [Bindable(event="propertyChange")]
        private function get _itemList():ArrayCollection
        {
            return (this._1267797936_itemList);
        }

        public function __shopSlot6_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __shopSlot2_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _ShopPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SHOPPANEL_U[3];
            _local_1 = Language.SHOPPANEL_S[4];
            _local_1 = Language.SHOPPANEL_S[5];
            _local_1 = Language.SHOPPANEL_U[0];
            _local_1 = Language.SHOPPANEL_S[1];
            _local_1 = Language.SHOPPANEL_U[1];
            _local_1 = Language.SHOPPANEL_S[2];
            _local_1 = Language.SHOPPANEL_U[2];
            _local_1 = Language.SHOPPANEL_S[6];
            _local_1 = Language.SHOPPANEL_U[4];
        }

        private function repairAll(_arg_1:CloseEvent):void
        {
            if (((_arg_1) && (_arg_1.detail == Alert.YES)))
            {
                _core.remote.repairAll(2);
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get tileItem():Tile
        {
            return (this._2106311967tileItem);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((visible) && (!(_arg_1))))
            {
                if (_core.remote)
                {
                    _core.remote.shopClosePanel();
                };
            };
            super.visible = _arg_1;
        }

        public function __tileItem_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function ___ShopPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        public function doBuy(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:NumPanel;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if ((((_selectedSlot.slotData.gold > 0) && (_local_2)) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                }
                else
                {
                    if (((_local_2) && (_local_2.silverSelected)))
                    {
                        _local_2.silverLockFlag = false;
                    };
                };
                if (_selectedSlot)
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    _local_3.parent = this;
                    _local_3.showSelected(_selectedSlot, null, 2, onShopItemBuy);
                    _local_3.closeWith(this);
                };
            };
        }

        override public function show():void
        {
            var _local_1:Object;
            super.show();
            clearSelection();
            _local_1 = _core.view.getUI(ViewManager.PANEL_BAG);
            if (!_local_1.visible)
            {
                _local_1.startFollow(this);
                _local_1.show();
                _autoOpenBag = true;
            }
            else
            {
                _autoOpenBag = false;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

