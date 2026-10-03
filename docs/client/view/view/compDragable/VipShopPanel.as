// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.VipShopPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.ShopSlot;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.VipShopSlot;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.utils.ArrayQueue;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.CloseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import mx.collections.SortField;
    import mx.collections.Sort;
    import mx.utils.ObjectUtil;
    import com.qeedoo.game.utils.TextUtil;
    import mx.events.FlexEvent;
    import com.adobe.crypto.MD5;
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

    public class VipShopPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const VIP_SHOP_SLOT_NUM:int = 6;
        private const ITEM_COUNT_PER_PAGE:int = 20;
        public var _VipShopPanel_BasicDelayButton2:BasicDelayButton;
        private var _1141924040shopSlot15:ShopSlot;
        public var _VipShopPanel_BasicDelayButton1:BasicDelayButton;
        private var reflashTime:Number = 0;
        private var _3773vs:ViewStack;
        private var _2115046236shopSlot8:ShopSlot;
        public var _VipShopPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2115046240shopSlot4:ShopSlot;
        private var _1344515517idVipShopSlot3:VipShopSlot;
        private var _1051699068btnReflashEnable:Boolean = false;
        private var _1141924043shopSlot12:ShopSlot;
        private var _2115046238shopSlot6:ShopSlot;
        private var _2115046242shopSlot2:ShopSlot;
        public var _selectedVipSlot:VipShopSlot;
        private var _1344515518idVipShopSlot4:VipShopSlot;
        private var _960253463idSystemAll:Canvas;
        private var _2115046244shopSlot0:ShopSlot;
        private var _1344515519idVipShopSlot5:VipShopSlot;
        private var sysShopReflashTime:Number = 0;
        private var firstTimeFlag:Boolean = true;
        private var _1141924038shopSlot17:ShopSlot;
        private var _1141924041shopSlot14:ShopSlot;
        private var _277229570idTabCanvas0:BasicGlowButton;
        private var _1102666777linkTA:LinkTextArea;
        private var _2115046235shopSlot9:ShopSlot;
        private var _1141924044shopSlot11:ShopSlot;
        private var _1141924036shopSlot19:ShopSlot;
        private var _2115046237shopSlot7:ShopSlot;
        private var _2115046241shopSlot3:ShopSlot;
        private var _1560582704idReflashTile:Tile;
        private var _1344515514idVipShopSlot0:VipShopSlot;
        private var _2016333467idSystemAllTile:Tile;
        private var _1141924039shopSlot16:ShopSlot;
        private var _2115046239shopSlot5:ShopSlot;
        private var _2115046243shopSlot1:ShopSlot;
        private var _1141924042shopSlot13:ShopSlot;
        private var _1344515515idVipShopSlot1:VipShopSlot;
        private var _607339634pageSelector:PageSelector;
        private var _1560582673idReflashTime:RoundedLabel;
        private var _277229569idTabCanvas1:BasicGlowButton;
        public var _VipShopPanel_RoundedLabel2:RoundedLabel;
        public var _VipShopPanel_RoundedLabel3:RoundedLabel;
        private var _1141924045shopSlot10:ShopSlot;
        private var _133132290idReflash:Canvas;
        private var _1344515516idVipShopSlot2:VipShopSlot;
        private var _1141924037shopSlot18:ShopSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":590,
                    "height":380,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_VipShopPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 0;
                                        this.left = "45";
                                        this.top = "40";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HTabWrapper",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTabCanvas0",
                                                "events":{"click":"__idTabCanvas0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab",
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTabCanvas1",
                                                "events":{"click":"__idTabCanvas1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "65";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"idReflash",
                                                "events":{"mouseDown":"__idReflash_mouseDown"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "60";
                                                    this.left = "10";
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":305,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"idReflashTile",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.top = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":360,
                                                                    "height":247,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":VipShopSlot,
                                                                        "id":"idVipShopSlot0",
                                                                        "events":{
                                                                            "click":"__idVipShopSlot0_click",
                                                                            "doubleClick":"__idVipShopSlot0_doubleClick"
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VipShopSlot,
                                                                        "id":"idVipShopSlot1",
                                                                        "events":{
                                                                            "click":"__idVipShopSlot1_click",
                                                                            "doubleClick":"__idVipShopSlot1_doubleClick"
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VipShopSlot,
                                                                        "id":"idVipShopSlot2",
                                                                        "events":{
                                                                            "click":"__idVipShopSlot2_click",
                                                                            "doubleClick":"__idVipShopSlot2_doubleClick"
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VipShopSlot,
                                                                        "id":"idVipShopSlot3",
                                                                        "events":{
                                                                            "click":"__idVipShopSlot3_click",
                                                                            "doubleClick":"__idVipShopSlot3_doubleClick"
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VipShopSlot,
                                                                        "id":"idVipShopSlot4",
                                                                        "events":{
                                                                            "click":"__idVipShopSlot4_click",
                                                                            "doubleClick":"__idVipShopSlot4_doubleClick"
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VipShopSlot,
                                                                        "id":"idVipShopSlot5",
                                                                        "events":{
                                                                            "click":"__idVipShopSlot5_click",
                                                                            "doubleClick":"__idVipShopSlot5_doubleClick"
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"idReflashTime",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.bottom = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 14;
                                                                this.textAlign = "center";
                                                                this.fontStyle = "normal";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"width":228});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"_VipShopPanel_BasicDelayButton1",
                                                            "events":{"click":"___VipShopPanel_BasicDelayButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":5000,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":65,
                                                                    "x":285
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":200,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"_VipShopPanel_RoundedLabel2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "8";
                                                                            this.color = 0xFFFFFF;
                                                                            this.horizontalCenter = "0";
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkTextArea,
                                                                        "id":"linkTA",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0.3;
                                                                            this.backgroundColor = 0;
                                                                            this.borderStyle = "none";
                                                                            this.color = 16774324;
                                                                            this.bottom = "5";
                                                                            this.left = "2";
                                                                            this.right = "2";
                                                                            this.top = "30";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "editable":false,
                                                                                "enabled":true,
                                                                                "selectable":false
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"idSystemAll",
                                                "events":{"mouseDown":"__idSystemAll_mouseDown"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "60";
                                                    this.left = "15";
                                                    this.right = "15";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"idSystemAllTile",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot0"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot1"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot2"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot3"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot4"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot5"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot6"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot7"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot8"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot9"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot10"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot11"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot12"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot13"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot14"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot15"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot16"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot17"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot18"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot19"
                                                                    })]});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageSelector",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "40";
                                                                this.horizontalCenter = "0";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_VipShopPanel_RoundedLabel3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "15";
                                                                this.left = "20";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 14;
                                                                this.textAlign = "center";
                                                                this.fontStyle = "normal";
                                                                this.fontWeight = "bold";
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "id":"_VipShopPanel_BasicDelayButton2",
                                                            "events":{"click":"___VipShopPanel_BasicDelayButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "15";
                                                                this.right = "60";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":3000,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":100
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]});
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var shopItemList:ArrayCollection = new ArrayCollection();
        private var vipShopItemList:ArrayCollection = new ArrayCollection();
        private var _buyLog:ArrayQueue = new ArrayQueue(30);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function VipShopPanel()
        {
            mx_internal::_document = this;
            this.width = 590;
            this.height = 380;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___VipShopPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            VipShopPanel._watcherSetupUtil = _arg_1;
        }


        public function set idReflash(_arg_1:Canvas):void
        {
            var _local_2:Object = this._133132290idReflash;
            if (_local_2 !== _arg_1)
            {
                this._133132290idReflash = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReflash", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idReflash():Canvas
        {
            return (this._133132290idReflash);
        }

        public function set idTabCanvas1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229569idTabCanvas1;
            if (_local_2 !== _arg_1)
            {
                this._277229569idTabCanvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas1", _local_2, _arg_1));
            };
        }

        private function buyVipSlotSelected(_arg_1:int):void
        {
            _core.remote.call("buyVipShopItem", new Responder(onBuyVipSlotSelected), _selectedVipSlot.slotData.id, _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get idSystemAll():Canvas
        {
            return (this._960253463idSystemAll);
        }

        public function __idVipShopSlot2_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function onGetVipShopConfig(_arg_1:Object):void
        {
            var _local_5:*;
            var _local_6:int;
            trace("onGetVipShopConfig");
            var _local_2:Boolean = _arg_1.flag;
            var _local_3:Object = _arg_1.vipShop;
            reflashTime = _arg_1.reflashTime;
            var _local_4:Object = _arg_1.shopDynamic;
            btnReflashEnable = _local_2;
            if (!_local_2)
            {
                Alert.show(Language.VIPSHOPPANEL_U[11], "", Alert.YES, null, null);
                return;
            };
            idReflashTile.visible = true;
            firstTimeFlag = false;
            vipShopItemList.removeAll();
            for (_local_5 in _local_3)
            {
                vipShopItemList.addItem(_local_3[_local_5]);
            };
            _local_6 = 0;
            while (_local_6 < VIP_SHOP_SLOT_NUM)
            {
                if (vipShopItemList[_local_6])
                {
                    this[("idVipShopSlot" + _local_6)].slotData = vipShopItemList[_local_6];
                    this[("idVipShopSlot" + _local_6)].type = vipShopItemList[_local_6].type;
                    this[("idVipShopSlot" + _local_6)].giid = vipShopItemList[_local_6].itemId;
                    this[("idVipShopSlot" + _local_6)].visible = true;
                };
                _local_6++;
            };
            trace(((("reflashTime:" + reflashTime) + "==") + dateFormatter(reflashTime)));
            if (reflashTime > 0)
            {
                idReflashTime.text = ((_checkReflashTimeValid(reflashTime)) ? Language.VIPSHOPPANEL_U[6].toString().replace("{time}", dateFormatter(reflashTime)) : Language.VIPSHOPPANEL_U[15]);
            };
            setShopDynamic(_local_4);
        }

        public function set idSystemAll(_arg_1:Canvas):void
        {
            var _local_2:Object = this._960253463idSystemAll;
            if (_local_2 !== _arg_1)
            {
                this._960253463idSystemAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSystemAll", _local_2, _arg_1));
            };
        }

        private function _checkReflashTimeValid(_arg_1:Number):Boolean
        {
            var _local_2:Date = new Date(_arg_1);
            var _local_3:Number = _local_2.getDate();
            var _local_4:Date = new Date();
            var _local_5:Number = _local_4.getDate();
            return ((_local_3 == _local_5) ? true : false);
        }

        private function showPmPanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PM);
            if (_local_1)
            {
                _local_1.initPanelData(null);
            };
        }

        private function onBuyVipSlotSelected(_arg_1:Object):void
        {
            var _local_2:Boolean = _arg_1.flag;
            var _local_3:Object = _arg_1.shopDynamic;
            if (!_local_2)
            {
                return;
            };
            setShopDynamic(_local_3);
        }

        public function ___VipShopPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            getVipShopCharConfig();
        }

        public function __idVipShopSlot3_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _VipShopPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.VIPSHOPPANEL_U[0];
            _local_1 = Language.VIPSHOPPANEL_U[1];
            _local_1 = Language.VIPSHOPPANEL_U[2];
            _local_1 = Language.VIPSHOPPANEL_U[0];
            _local_1 = Language.VIPSHOPPANEL_U[16];
            _local_1 = btnReflashEnable;
            _local_1 = Language.VIPSHOPPANEL_U[5];
            _local_1 = Language.VIPSHOPPANEL_U[3];
            _local_1 = Language.VIPSHOPPANEL_U[1];
            _local_1 = Language.VIPSHOPPANEL_U[8];
            _local_1 = Language.VIPSHOPPANEL_U[9];
        }

        public function set shopSlot12(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924043shopSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1141924043shopSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot12", _local_2, _arg_1));
            };
        }

        public function set shopSlot13(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924042shopSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1141924042shopSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot13", _local_2, _arg_1));
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

        public function set shopSlot14(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924041shopSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1141924041shopSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot14", _local_2, _arg_1));
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

        public function set shopSlot15(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924040shopSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1141924040shopSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot15", _local_2, _arg_1));
            };
        }

        public function set shopSlot16(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924039shopSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1141924039shopSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot16", _local_2, _arg_1));
            };
        }

        public function set shopSlot18(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924037shopSlot18;
            if (_local_2 !== _arg_1)
            {
                this._1141924037shopSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot18", _local_2, _arg_1));
            };
        }

        public function set shopSlot19(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924036shopSlot19;
            if (_local_2 !== _arg_1)
            {
                this._1141924036shopSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot19", _local_2, _arg_1));
            };
        }

        public function set shopSlot17(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924038shopSlot17;
            if (_local_2 !== _arg_1)
            {
                this._1141924038shopSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot17", _local_2, _arg_1));
            };
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                this[("shopSlot" + _local_1)].st = -1;
                this[("shopSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        private function get btnReflashEnable():Boolean
        {
            return (this._1051699068btnReflashEnable);
        }

        private function getVipShopCharConfig():void
        {
            var pmLev:Number = _core.player.pmLevel;
            trace(("getVipShopCharConfig " + pmLev));
            pmLev = ((pmLev) ? pmLev : 0);
            if (pmLev <= 0)
            {
                Alert.show(Language.VIPSHOPPANEL_U[14]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("getVipShopCharConfig", new Responder(onGetVipShopConfig));
                };
            };
            var msg:String = Language.VIPSHOPPANEL_U[13].toString().replace("{gold}", GamePredef.VIP_SHOP_REFLASH_GOLD);
            Alert.show(msg, Language.VIPSHOPPANEL_U[12], (Alert.YES | Alert.NO), null, func);
        }

        private function setShopSlot():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                if (shopItemList[_local_1])
                {
                    this[("shopSlot" + _local_1)].slotData = shopItemList[_local_1];
                    this[("shopSlot" + _local_1)].type = shopItemList[_local_1].type;
                    this[("shopSlot" + _local_1)].giid = shopItemList[_local_1].itemId;
                    this[("shopSlot" + _local_1)].stackNum = shopItemList[_local_1].stackNum;
                    this[("shopSlot" + _local_1)].st = shopItemList[_local_1].st;
                    this[("shopSlot" + _local_1)].visible = true;
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot0():ShopSlot
        {
            return (this._2115046244shopSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot1():ShopSlot
        {
            return (this._2115046243shopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot2():ShopSlot
        {
            return (this._2115046242shopSlot2);
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
        public function get shopSlot5():ShopSlot
        {
            return (this._2115046239shopSlot5);
        }

        private function clickHandler(_arg_1:Event):void
        {
            clearSelection();
            var _local_2:VipShopSlot = VipShopSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            _selectedVipSlot = _local_2;
        }

        public function __idVipShopSlot0_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot9():ShopSlot
        {
            return (this._2115046235shopSlot9);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot7():ShopSlot
        {
            return (this._2115046237shopSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot8():ShopSlot
        {
            return (this._2115046236shopSlot8);
        }

        public function __idVipShopSlot3_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        private function setShopDynamic(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:SortField;
            var _local_5:Sort;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:Number;
            var _local_9:String;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Object;
            var _local_14:String;
            trace("setShopDynamic");
            clearBuyLog();
            var _local_2:ArrayCollection = new ArrayCollection();
            for each (_local_3 in _arg_1)
            {
                _local_2.addItem(_local_3);
            };
            _local_4 = new SortField();
            _local_4.name = "time";
            _local_5 = new Sort();
            _local_5.fields = [_local_4];
            _local_4.numeric = true;
            _local_4.descending = true;
            _local_2.sort = _local_5;
            _local_2.refresh();
            for (_local_6 in _local_2)
            {
                _local_7 = _local_2[_local_6];
                _local_8 = _local_7.cid;
                _local_9 = _local_7.cName;
                _local_10 = _local_7.type;
                _local_11 = _local_7.itemId;
                _local_12 = _local_7.num;
                _local_13 = ObjectUtil.copy(_core.data.getGameData(_local_10, _local_11));
                if (!_local_13)
                {
                    return;
                };
                if (((!(_local_13.color)) || (_local_13.color < 0)))
                {
                    _local_13.color = 0;
                };
                _local_14 = Language.VIPSHOPPANEL_U[7];
                _local_14 = _local_14.replace("{name}", ((((((" [@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _local_8) + "|") + _local_9) + "|0|0|0] "));
                if (_local_10 == GamePredef.TBL_EQUIPT_TEMPLATE)
                {
                    _local_14 = _local_14.replace("{item}", TextUtil.decode(((((((((((((" [@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _local_11) + "|") + _local_13.name) + "|") + _local_13.color) + "|") + 0) + "|") + 0) + "]")));
                }
                else
                {
                    if (_local_10 == GamePredef.TBL_ITEM_TEMPLATE)
                    {
                        _local_14 = _local_14.replace("{item}", TextUtil.decode(((((((((((((" [@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _local_11) + "|") + _local_13.name) + "|") + _local_13.color) + "|") + 0) + "|") + 0) + "]")));
                    };
                };
                _local_14 = (_local_14 + "<br>");
                _buyLog.push(TextUtil.decode(_local_14));
            };
            if (initialized)
            {
                linkTA.htmlText = _buyLog.join();
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot6():ShopSlot
        {
            return (this._2115046238shopSlot6);
        }

        private function delayReflashShop():Boolean
        {
            var _local_1:Number = 10000;
            var _local_2:Date = new Date();
            var _local_3:Number = _local_2.getTime();
            if (((!(sysShopReflashTime)) || ((sysShopReflashTime) && (_local_3 >= (sysShopReflashTime + _local_1)))))
            {
                sysShopReflashTime = _local_3;
                return (false);
            };
            return (true);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        private function dateFormatter(_arg_1:Number):String
        {
            if (!_arg_1)
            {
                return ("");
            };
            var _local_2:Date = new Date(_arg_1);
            var _local_3:String = Language.VIPSHOPPANEL_U[17].toString();
            _local_3 = _local_3.replace("{hour}", ("0" + _local_2.getHours()).toString().substr(-2));
            return (_local_3.replace("{minute}", ("0" + _local_2.getMinutes()).toString().substr(-2)));
        }

        public function set idSystemAllTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._2016333467idSystemAllTile;
            if (_local_2 !== _arg_1)
            {
                this._2016333467idSystemAllTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idSystemAllTile", _local_2, _arg_1));
            };
        }

        public function initPanel():void
        {
            if (!initialized)
            {
                _core.player.normalView.pause();
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            callLater(_core.player.normalView.resume);
            idReflashTile.visible = false;
            _core.remote.call("getVipShopConfig", new Responder(onGetVipShopConfig));
        }

        public function ___VipShopPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __idSystemAll_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            var _local_2:Number = new Date().getTime();
            if (((_arg_1) && ((firstTimeFlag) || (_local_2 >= reflashTime))))
            {
                initReflashShop();
            };
        }

        private function _setNumToBuy():void
        {
            var _local_1:NumPanel = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
            _local_1.numStepper.value = 1;
            _local_1.numStepper.enabled = false;
            _local_1.parent = this;
            _local_1.showSelected(_selectedVipSlot, null, NumPanel.TYPE_BUY, buyVipSlotSelected);
            _local_1.closeWith(this);
        }

        private function getShopListBySid(_arg_1:int):ArrayCollection
        {
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_arg_1];
            return (addDataToList(_local_2));
        }

        public function __idVipShopSlot5_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function initReflashShop():void
        {
            trace("initReflashShop");
            if (!idReflashTile.visible)
            {
                return;
            };
            idReflashTile.visible = false;
            _core.remote.call("getVipShopConfig", new Responder(onGetVipShopConfig));
        }

        private function set btnReflashEnable(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1051699068btnReflashEnable;
            if (_local_2 !== _arg_1)
            {
                this._1051699068btnReflashEnable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReflashEnable", _local_2, _arg_1));
            };
        }

        public function __idReflash_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __idVipShopSlot0_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __idVipShopSlot4_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
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

        public function __idVipShopSlot2_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:VipShopSlot = VipShopSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _local_2.selected = true;
            buyFromVipShop();
        }

        public function __idTabCanvas1_click(_arg_1:MouseEvent):void
        {
            setTab(1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot10():ShopSlot
        {
            return (this._1141924045shopSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot12():ShopSlot
        {
            return (this._1141924043shopSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot13():ShopSlot
        {
            return (this._1141924042shopSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot14():ShopSlot
        {
            return (this._1141924041shopSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot16():ShopSlot
        {
            return (this._1141924039shopSlot16);
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

        [Bindable(event="propertyChange")]
        public function get shopSlot11():ShopSlot
        {
            return (this._1141924044shopSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot19():ShopSlot
        {
            return (this._1141924036shopSlot19);
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

        public function set shopSlot0(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046244shopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._2115046244shopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot17():ShopSlot
        {
            return (this._1141924038shopSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot18():ShopSlot
        {
            return (this._1141924037shopSlot18);
        }

        public function buyFromVipShop():void
        {
            var pmLev:Number = _core.player.pmLevel;
            pmLev = ((pmLev) ? pmLev : 0);
            if (pmLev <= 0)
            {
                Alert.show(Language.VIPSHOPPANEL_U[14]);
                return;
            };
            var bagpanel:Object = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuy), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuy(true);
            };
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

        public function set shopSlot7(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046237shopSlot7;
            if (_local_2 !== _arg_1)
            {
                this._2115046237shopSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot7", _local_2, _arg_1));
            };
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

        public function set shopSlot9(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046235shopSlot9;
            if (_local_2 !== _arg_1)
            {
                this._2115046235shopSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot9", _local_2, _arg_1));
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

        public function set shopSlot4(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046240shopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2115046240shopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot15():ShopSlot
        {
            return (this._1141924040shopSlot15);
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

        [Bindable(event="propertyChange")]
        public function get idSystemAllTile():Tile
        {
            return (this._2016333467idSystemAllTile);
        }

        public function set idVipShopSlot0(_arg_1:VipShopSlot):void
        {
            var _local_2:Object = this._1344515514idVipShopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._1344515514idVipShopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idVipShopSlot0", _local_2, _arg_1));
            };
        }

        public function set idVipShopSlot1(_arg_1:VipShopSlot):void
        {
            var _local_2:Object = this._1344515515idVipShopSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1344515515idVipShopSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idVipShopSlot1", _local_2, _arg_1));
            };
        }

        public function set idVipShopSlot5(_arg_1:VipShopSlot):void
        {
            var _local_2:Object = this._1344515519idVipShopSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1344515519idVipShopSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idVipShopSlot5", _local_2, _arg_1));
            };
        }

        public function set idVipShopSlot2(_arg_1:VipShopSlot):void
        {
            var _local_2:Object = this._1344515516idVipShopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1344515516idVipShopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idVipShopSlot2", _local_2, _arg_1));
            };
        }

        public function set idVipShopSlot3(_arg_1:VipShopSlot):void
        {
            var _local_2:Object = this._1344515517idVipShopSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1344515517idVipShopSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idVipShopSlot3", _local_2, _arg_1));
            };
        }

        public function set idVipShopSlot4(_arg_1:VipShopSlot):void
        {
            var _local_2:Object = this._1344515518idVipShopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1344515518idVipShopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idVipShopSlot4", _local_2, _arg_1));
            };
        }

        private function addDataToList(_arg_1:Object):ArrayCollection
        {
            var _local_3:Object;
            var _local_4:SortField;
            var _local_5:Sort;
            var _local_6:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            for each (_local_3 in _arg_1)
            {
                if (_local_3 != null)
                {
                    _local_6 = new Object();
                    _local_6.slotData = _local_3;
                    _local_6.type = _local_3.type;
                    _local_6.giid = _local_3.itemId;
                    _local_6.position = _local_3.position;
                    _local_6.st = _local_3.st;
                    if (_local_6.slotData.sid == GamePredef.VIP_SHOP_ID)
                    {
                        if (_local_6.st != GamePredef.SHOP_SELL_TYPE_HIDE)
                        {
                            _local_2.addItem(_local_6);
                        };
                    };
                };
            };
            _local_4 = new SortField();
            _local_4.name = "position";
            _local_5 = new Sort();
            _local_5.fields = [_local_4];
            _local_4.numeric = true;
            _local_2.sort = _local_5;
            _local_2.refresh();
            return (_local_2);
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        private function clearBuyLog():void
        {
            if (initialized)
            {
                linkTA.htmlText = "";
            };
            _buyLog.clear();
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:VipShopPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _VipShopPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_VipShopPanelWatcherSetupUtil");
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

        public function __idVipShopSlot1_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __idVipShopSlot5_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        private function _VipShopPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_VipShopPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas0.label = _arg_1;
            }, "idTabCanvas0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas1.label = _arg_1;
            }, "idTabCanvas1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idReflashTile.label = _arg_1;
            }, "idReflashTile.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idReflashTime.text = _arg_1;
            }, "idReflashTime.text");
            result[4] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (btnReflashEnable);
            }, function (_arg_1:Boolean):void
            {
                _VipShopPanel_BasicDelayButton1.enabled = _arg_1;
            }, "_VipShopPanel_BasicDelayButton1.enabled");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopPanel_BasicDelayButton1.label = _arg_1;
            }, "_VipShopPanel_BasicDelayButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopPanel_RoundedLabel2.text = _arg_1;
            }, "_VipShopPanel_RoundedLabel2.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idSystemAllTile.label = _arg_1;
            }, "idSystemAllTile.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopPanel_RoundedLabel3.text = _arg_1;
            }, "_VipShopPanel_RoundedLabel3.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopPanel_BasicDelayButton2.label = _arg_1;
            }, "_VipShopPanel_BasicDelayButton2.label");
            result[10] = binding;
            return (result);
        }

        public function ___VipShopPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            showPmPanel();
        }

        public function __idVipShopSlot4_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set idReflashTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._1560582704idReflashTile;
            if (_local_2 !== _arg_1)
            {
                this._1560582704idReflashTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReflashTile", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idVipShopSlot0():VipShopSlot
        {
            return (this._1344515514idVipShopSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get idVipShopSlot1():VipShopSlot
        {
            return (this._1344515515idVipShopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get idVipShopSlot4():VipShopSlot
        {
            return (this._1344515518idVipShopSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get idVipShopSlot5():VipShopSlot
        {
            return (this._1344515519idVipShopSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get idVipShopSlot3():VipShopSlot
        {
            return (this._1344515517idVipShopSlot3);
        }

        private function initDictionary():void
        {
            shopItemList = getShopListBySid(GamePredef.VIP_SHOP_ID);
        }

        [Bindable(event="propertyChange")]
        public function get idVipShopSlot2():VipShopSlot
        {
            return (this._1344515516idVipShopSlot2);
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("shopSlot" + _local_4)].type = shopItemList[_local_3].type;
                this[("shopSlot" + _local_4)].slotData = shopItemList[_local_3].slotData;
                this[("shopSlot" + _local_4)].stackNum = shopItemList[_local_3].stackNum;
                this[("shopSlot" + _local_4)].giid = shopItemList[_local_3].giid;
                this[("shopSlot" + _local_4)].st = shopItemList[_local_3].st;
                this[("shopSlot" + _local_4)].visible = true;
                _local_4++;
            };
        }

        public function set linkTA(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1102666777linkTA;
            if (_local_2 !== _arg_1)
            {
                this._1102666777linkTA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "linkTA", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idReflashTile():Tile
        {
            return (this._1560582704idReflashTile);
        }

        private function setTab(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:int = 2;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("idTabCanvas" + _local_3)].selected = false;
                _local_3++;
            };
            this[("idTabCanvas" + _arg_1)].selected = true;
            if (_arg_1 == 1)
            {
                initDictionary();
                pageSelector.onPageChanged = onPageChanged;
                pageSelector.onPageCleared = clearPage;
                pageSelector.initPageSeletor(shopItemList.length, ITEM_COUNT_PER_PAGE);
            }
            else
            {
                if (((_arg_1 == 0) && (!(delayReflashShop()))))
                {
                    initReflashShop();
                };
            };
        }

        override public function initView():void
        {
            initDictionary();
            setShopSlot();
        }

        private function clearSelection():void
        {
            var _local_1:int;
            while (_local_1 < VIP_SHOP_SLOT_NUM)
            {
                this[("idVipShopSlot" + _local_1)].selected = false;
                _local_1++;
            };
        }

        public function __idVipShopSlot1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set idReflashTime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1560582673idReflashTime;
            if (_local_2 !== _arg_1)
            {
                this._1560582673idReflashTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idReflashTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get linkTA():LinkTextArea
        {
            return (this._1102666777linkTA);
        }

        public function __idTabCanvas0_click(_arg_1:MouseEvent):void
        {
            setTab(0);
        }

        [Bindable(event="propertyChange")]
        public function get idReflashTime():RoundedLabel
        {
            return (this._1560582673idReflashTime);
        }

        private function doBuy(result:Boolean):void
        {
            var num:* = undefined;
            var bagpanel:Object;
            var func:Function;
            if (result)
            {
                num = 1;
                bagpanel = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((bagpanel) && (bagpanel.goldSelected)))
                {
                    bagpanel.goldLockFlag = false;
                };
                if (_selectedVipSlot)
                {
                    if (((_selectedVipSlot.slotData.gt == 1) || ((bagpanel) && (bagpanel.goldSelected))))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                buyVipSlotSelected(num);
                            };
                        };
                        Alert.show(Language.VIPSHOPPANEL_U[19].toString().replace("{gold}", _selectedVipSlot.slotData.gold), "", (Alert.YES | Alert.NO), null, func);
                        return;
                    };
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            buyVipSlotSelected(num);
                        };
                    };
                    Alert.show(Language.VIPSHOPPANEL_U[20].toString().replace("{gold}", _selectedVipSlot.slotData.gold), "", (Alert.YES | Alert.NO), null, func);
                    return;
                };
            };
        }

        public function set idTabCanvas0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229570idTabCanvas0;
            if (_local_2 !== _arg_1)
            {
                this._277229570idTabCanvas0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas0():BasicGlowButton
        {
            return (this._277229570idTabCanvas0);
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas1():BasicGlowButton
        {
            return (this._277229569idTabCanvas1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

