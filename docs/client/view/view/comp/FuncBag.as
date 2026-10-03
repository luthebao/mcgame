// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FuncBag

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Tile;
    import mx.containers.ViewStack;
    import mx.containers.HBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import com.qeedoo.ui.view.compDragable.NumPanel;
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

    public class FuncBag extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _downSlotType:Number = 0;
        private var downSlotLabel:String = "downSlot";
        private var _selectedSlot:ShopSlot;
        private var _row:Number = 3;
        public var DClickCallBack:Function;
        private var _133022078firstTile:Tile;
        public var _FuncBag_SimpleCanvas2:SimpleCanvas;
        private var upSlotLabel:String = "upSlot";
        private var shopSlotLabel:String = "shopSlot";
        private var _1437268089downTabBtn0:BasicGlowButton;
        private var _2143325187itemTileD:Tile;
        private var _1554086441tabDown:ViewStack;
        private var _933746814tabBtnUp:HBox;
        private var filterField:String;
        private var _792846463_heightUp:Number = 110;
        private var _2114215424shopTileD:Tile;
        private var _1716743160_heightDown:Number = 124;
        private var _607339634pageSelector:PageSelector;
        private var _upSlotType:Number = 0;
        private var upBtnLabel:String = "upTabBtn";
        private var downBtnLabel:String = "downTabBtn";
        private var _col:Number = 3;
        private var _1647659402pageSelectorD:PageSelector;
        private var filterValueArr:Array;
        private var _1462071097_width:Number = 240;
        private var filterValue:Number;
        private var _316973001tabBtnDown:HBox;
        private var _sysShopAllItems:Object;
        private var _1437268088downTabBtn1:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":240,
                    "height":290,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "id":"tabBtnUp",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":4
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"_FuncBag_SimpleCanvas2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":21,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "3";
                                        this.bottom = "3";
                                        this.left = "4.5";
                                        this.right = "4.5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"firstTile",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                    this.horizontalGap = 3;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "direction":"horizontal",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "styleName":"TileSlot"
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "2";
                                        this.horizontalCenter = "0";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"tabBtnDown",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"downTabBtn0",
                                    "events":{"click":"__downTabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"downTabBtn1",
                                    "events":{"click":"__downTabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tabDown",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "creationPolicy":"all",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "3";
                                                    this.bottom = "3";
                                                    this.left = "4.5";
                                                    this.right = "4.5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"itemTileD",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 4;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "height":80,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot"
                                                                });
                                                            }
                                                        })]});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "events":{"creationComplete":"___FuncBag_SimpleCanvas4_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "3";
                                                    this.bottom = "3";
                                                    this.left = "1.5";
                                                    this.right = "1.5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"shopTileD",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 4;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "height":80,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot"
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
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSelectorD",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        private var _sysShopId:Array = [35, 36, 41, 65, 66, 67, 70, 79, 81, 88, 89];
        private var privateAddSlots:Object = {};
        private var _upItemList:Array = [];
        private var _downItemList:Array = [];
        private var _shopItemList:Object = {};
        public var pFuncPanel:Object = {};
        private var _cond:Object = {};
        private var labelArr:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FuncBag()
        {
            mx_internal::_document = this;
            this.width = 240;
            this.height = 290;
            this.addEventListener("creationComplete", ___FuncBag_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FuncBag._watcherSetupUtil = _arg_1;
        }


        public function set firstTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._133022078firstTile;
            if (_local_2 !== _arg_1)
            {
                this._133022078firstTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstTile", _local_2, _arg_1));
            };
        }

        public function set tabBtnUp(_arg_1:HBox):void
        {
            var _local_2:Object = this._933746814tabBtnUp;
            if (_local_2 !== _arg_1)
            {
                this._933746814tabBtnUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnUp", _local_2, _arg_1));
            };
        }

        public function set itemTileD(_arg_1:Tile):void
        {
            var _local_2:Object = this._2143325187itemTileD;
            if (_local_2 !== _arg_1)
            {
                this._2143325187itemTileD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemTileD", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopTileD():Tile
        {
            return (this._2114215424shopTileD);
        }

        [Bindable(event="propertyChange")]
        private function get _heightDown():Number
        {
            return (this._1716743160_heightDown);
        }

        private function set _heightUp(_arg_1:Number):void
        {
            var _local_2:Object = this._792846463_heightUp;
            if (_local_2 !== _arg_1)
            {
                this._792846463_heightUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_heightUp", _local_2, _arg_1));
            };
        }

        public function set upType(_arg_1:Number):void
        {
            _upSlotType = _arg_1;
        }

        public function set downTabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1437268089downTabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1437268089downTabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "downTabBtn0", _local_2, _arg_1));
            };
        }

        public function set shopTileD(_arg_1:Tile):void
        {
            var _local_2:Object = this._2114215424shopTileD;
            if (_local_2 !== _arg_1)
            {
                this._2114215424shopTileD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopTileD", _local_2, _arg_1));
            };
        }

        private function _FuncBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Number
            {
                return (this._width);
            }, function (_arg_1:Number):void
            {
                _FuncBag_SimpleCanvas2.width = _arg_1;
            }, "_FuncBag_SimpleCanvas2.width");
            result[0] = binding;
            binding = new Binding(this, function ():Number
            {
                return (this._heightUp);
            }, function (_arg_1:Number):void
            {
                _FuncBag_SimpleCanvas2.height = _arg_1;
            }, "_FuncBag_SimpleCanvas2.height");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[185];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                downTabBtn0.label = _arg_1;
            }, "downTabBtn0.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[186];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                downTabBtn1.label = _arg_1;
            }, "downTabBtn1.label");
            result[3] = binding;
            binding = new Binding(this, function ():Number
            {
                return (this._width);
            }, function (_arg_1:Number):void
            {
                tabDown.width = _arg_1;
            }, "tabDown.width");
            result[4] = binding;
            binding = new Binding(this, function ():Number
            {
                return (this._heightDown);
            }, function (_arg_1:Number):void
            {
                tabDown.height = _arg_1;
            }, "tabDown.height");
            result[5] = binding;
            return (result);
        }

        public function set downTabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1437268088downTabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1437268088downTabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "downTabBtn1", _local_2, _arg_1));
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

        private function set _heightDown(_arg_1:Number):void
        {
            var _local_2:Object = this._1716743160_heightDown;
            if (_local_2 !== _arg_1)
            {
                this._1716743160_heightDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_heightDown", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemTileD():Tile
        {
            return (this._2143325187itemTileD);
        }

        private function getPetList(limit:Object):Array
        {
            var pet:* = undefined;
            var canPut:Boolean;
            var temp:Object;
            var pColor:int;
            var _petList:Object = _core.player.petList;
            var sortList:Array = [];
            var petColor:int = limit.color;
            var classIds:int = limit.classIds;
            if (_petList)
            {
                for each (pet in _petList)
                {
                    if (pet)
                    {
                        canPut = true;
                        temp = _core.getTemplateData(GamePredef.TBL_CREATURE, pet.tid, false);
                        pColor = _core.basic.colorByGrowRate(pet.growRate);
                        if (limit.color)
                        {
                            if (pColor != limit.color)
                            {
                                canPut = false;
                            };
                        };
                        if (limit.classIds)
                        {
                            if (limit.classIds[temp.classIds])
                            {
                                canPut = ((limit.color) ? canPut : true);
                            }
                            else
                            {
                                canPut = false;
                            };
                        };
                        if (canPut)
                        {
                            sortList.push({
                                "type":GamePredef.TBL_PET,
                                "slotData":pet,
                                "stackNum":1,
                                "giid":pet.id,
                                "color":pColor
                            });
                        };
                    };
                };
            };
            var petSort:Function = function (_arg_1:*, _arg_2:*):Number
            {
                if (_arg_1.slotData.tid != _arg_2.slotData.tid)
                {
                    return (_arg_2.slotData.tid - _arg_1.slotData.tid);
                };
                if (_arg_1.slotData.growRate != _arg_2.slotData.growRate)
                {
                    return (_arg_2.slotData.growRate - _arg_1.slotData.growRate);
                };
                return (0);
            };
            sortList.sort(petSort);
            return (sortList);
        }

        public function ___FuncBag_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __downTabBtn1_click(_arg_1:MouseEvent):void
        {
            tabDownClick(1);
        }

        private function initSystemShopList():void
        {
            var _local_1:String;
            var _local_2:Object;
            var _local_3:String;
            _sysShopAllItems = {};
            for (_local_1 in _sysShopId)
            {
                _local_2 = _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_sysShopId[_local_1]];
                for (_local_3 in _local_2)
                {
                    _sysShopAllItems[_local_3] = _local_2[_local_3];
                };
            };
        }

        private function onDownPageCleared():void
        {
            var _local_1:int = 1;
            while (_local_1 <= (_row * _col))
            {
                privateAddSlots[(downSlotLabel + _local_1)].clean();
                _local_1++;
            };
        }

        private function showDownSlots():void
        {
            if (_cond["down"])
            {
                if (_cond["down"].pets)
                {
                    _downItemList = getPetList(_cond["down"]);
                }
                else
                {
                    _downItemList = getItemList(_cond["down"]);
                };
                pageSelectorD.onPageChanged = onDownPageChanged;
                pageSelectorD.onPageCleared = onDownPageCleared;
                pageSelectorD.initPageSeletor(_downItemList.length, (_col * _row));
            };
        }

        private function buySelected(_arg_1:int):void
        {
            _core.remote.buySystemItemClient(_selectedSlot.slotData.id, _arg_1);
        }

        private function initAllSlots():void
        {
            var _local_2:ItemSlot;
            var _local_3:ItemSlot;
            var _local_1:int = 1;
            while (_local_1 <= (_row * _col))
            {
                _local_2 = new ItemSlot();
                _local_2.id = (upSlotLabel + _local_1);
                _local_2.slotType = _upSlotType;
                _local_2.acceptable = false;
                _local_2.addEventListener(Slot.EVENT_SLOT_DCLICK, normalSlotDClick);
                firstTile.addChild(_local_2);
                privateAddSlots[_local_2.id] = _local_2;
                _local_3 = new ItemSlot();
                _local_3.id = (downSlotLabel + _local_1);
                _local_3.slotType = _downSlotType;
                _local_3.acceptable = false;
                _local_3.addEventListener(Slot.EVENT_SLOT_DCLICK, normalSlotDClick);
                itemTileD.addChild(_local_3);
                privateAddSlots[_local_3.id] = _local_3;
                _local_1++;
            };
        }

        public function set condition(_arg_1:Object):void
        {
            _cond = _arg_1;
            if (initialized)
            {
                showItems();
            };
        }

        private function refreshFuncBag(_arg_1:GameDataEvent):void
        {
            if (!visible)
            {
                return;
            };
            if (((_arg_1.data) && (_arg_1.data.numOnly)))
            {
                updateStackNum(_arg_1.data.insId, _arg_1.data.stackNum);
            }
            else
            {
                showUpSlots();
                if (tabDown.selectedIndex == 0)
                {
                    showDownSlots();
                };
            };
        }

        public function set upTabButtons(_arg_1:Object):void
        {
            labelArr = _arg_1.l;
            filterField = _arg_1.p;
            filterValueArr = _arg_1.v;
        }

        private function onDownPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                privateAddSlots[(downSlotLabel + _local_4)].type = _downItemList[_local_3].type;
                privateAddSlots[(downSlotLabel + _local_4)].slotData = _downItemList[_local_3].slotData;
                privateAddSlots[(downSlotLabel + _local_4)].stackNum = _downItemList[_local_3].stackNum;
                privateAddSlots[(downSlotLabel + _local_4)].giid = _downItemList[_local_3].giid;
                privateAddSlots[(downSlotLabel + _local_4)].update();
                _local_4++;
            };
        }

        private function _FuncBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = this._width;
            _local_1 = this._heightUp;
            _local_1 = Language.EQUIPTFUNCPANEL_U[185];
            _local_1 = Language.EQUIPTFUNCPANEL_U[186];
            _local_1 = this._width;
            _local_1 = this._heightDown;
        }

        private function onShopPageCleared():void
        {
            var _local_1:int = 1;
            while (_local_1 <= Math.floor(((_row * _col) / 3)))
            {
                privateAddSlots[(shopSlotLabel + _local_1)].visible = false;
                _local_1++;
            };
        }

        private function showShopSlots():void
        {
            _shopItemList = getShopItemList();
            pageSelectorD.onPageChanged = onShopPageChanged;
            pageSelectorD.onPageCleared = onShopPageCleared;
            pageSelectorD.initPageSeletor(_shopItemList.length, Math.floor(((_col * _row) / 3)));
        }

        private function onShopPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 + _arg_1) - 1);
                privateAddSlots[(shopSlotLabel + _local_4)].type = _shopItemList[_local_3].type;
                privateAddSlots[(shopSlotLabel + _local_4)].slotData = _shopItemList[_local_3].slotData;
                privateAddSlots[(shopSlotLabel + _local_4)].stackNum = _shopItemList[_local_3].stackNum;
                privateAddSlots[(shopSlotLabel + _local_4)].giid = _shopItemList[_local_3].giid;
                privateAddSlots[(shopSlotLabel + _local_4)].visible = true;
                _local_4++;
            };
        }

        private function normalSlotDClick(_arg_1:GameEvent):void
        {
            DClickCallBack(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectorD():PageSelector
        {
            return (this._1647659402pageSelectorD);
        }

        [Bindable(event="propertyChange")]
        private function get _heightUp():Number
        {
            return (this._792846463_heightUp);
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        private function buy():void
        {
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

        public function ___FuncBag_SimpleCanvas4_creationComplete(_arg_1:FlexEvent):void
        {
            initShopSlots();
            initSystemShopList();
        }

        [Bindable(event="propertyChange")]
        public function get downTabBtn0():BasicGlowButton
        {
            return (this._1437268089downTabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get downTabBtn1():BasicGlowButton
        {
            return (this._1437268088downTabBtn1);
        }

        override public function initialize():void
        {
            var target:FuncBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FuncBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FuncBagWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get tabBtnUp():HBox
        {
            return (this._933746814tabBtnUp);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        public function set tabBtnDown(_arg_1:HBox):void
        {
            var _local_2:Object = this._316973001tabBtnDown;
            if (_local_2 !== _arg_1)
            {
                this._316973001tabBtnDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnDown", _local_2, _arg_1));
            };
        }

        private function initUpTabButton():void
        {
            var _local_2:BasicGlowButton;
            var _local_1:int;
            while (_local_1 < labelArr.length)
            {
                _local_2 = new BasicGlowButton();
                _local_2.id = (upBtnLabel + _local_1);
                _local_2.styleName = "HorizontalTab";
                _local_2.selected = (_local_1 == 0);
                _local_2.label = labelArr[_local_1];
                _local_2.width = (_local_2.label.length * 9);
                _local_2.addEventListener(MouseEvent.CLICK, tabUpBtnClick);
                tabBtnUp.addChild(_local_2);
                privateAddSlots[_local_2.id] = _local_2;
                _local_1++;
            };
        }

        private function showUpSlots():void
        {
            var _local_1:Array;
            var _local_2:Object;
            if (_cond["up"])
            {
                if (_cond["up"].pets)
                {
                    _upItemList = getPetList(_cond["up"]);
                }
                else
                {
                    _upItemList = getItemList(_cond["up"]);
                };
                _local_1 = [];
                for each (_local_2 in _upItemList)
                {
                    if (!((filterValue >= 0) && (!(ToolKit.isEqual(_local_2[filterField], filterValue)))))
                    {
                        _local_1.push(_local_2);
                    };
                };
                _upItemList = _local_1;
                pageSelector.onPageChanged = onUpPageChanged;
                pageSelector.onPageCleared = onUpPageCleared;
                pageSelector.initPageSeletor(_upItemList.length, (_col * _row));
            };
        }

        private function set _width(_arg_1:Number):void
        {
            var _local_2:Object = this._1462071097_width;
            if (_local_2 !== _arg_1)
            {
                this._1462071097_width = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_width", _local_2, _arg_1));
            };
        }

        public function set tabDown(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1554086441tabDown;
            if (_local_2 !== _arg_1)
            {
                this._1554086441tabDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabDown", _local_2, _arg_1));
            };
        }

        private function initShopSlots():void
        {
            var _local_2:ShopSlot;
            var _local_1:int = 1;
            while (_local_1 <= Math.floor(((_row * _col) / 3)))
            {
                _local_2 = new ShopSlot();
                _local_2.id = (shopSlotLabel + _local_1);
                _local_2.width = 112;
                _local_2.addEventListener(MouseEvent.CLICK, shopClickHandler);
                _local_2.addEventListener(MouseEvent.DOUBLE_CLICK, shopDClickHandler);
                shopTileD.addChild(_local_2);
                privateAddSlots[_local_2.id] = _local_2;
                _local_1++;
            };
        }

        private function shopClickHandler(_arg_1:Event):void
        {
            clearSelection();
            var _local_2:ShopSlot = ShopSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            _selectedSlot = _local_2;
        }

        private function clearSelection():void
        {
            var _local_1:int = 1;
            while (_local_1 <= Math.floor(((_row * _col) / 3)))
            {
                privateAddSlots[(shopSlotLabel + _local_1)].selected = false;
                _local_1++;
            };
        }

        private function updateStackNum(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:int = 1;
            while (_local_3 <= (_col * _row))
            {
                if (ToolKit.isEqual(privateAddSlots[(upSlotLabel + _local_3)].giid, _arg_1))
                {
                    privateAddSlots[(upSlotLabel + _local_3)].stackNum = _arg_2;
                    privateAddSlots[(upSlotLabel + _local_3)].update();
                    return;
                };
                if (ToolKit.isEqual(privateAddSlots[(downSlotLabel + _local_3)].giid, _arg_1))
                {
                    privateAddSlots[(downSlotLabel + _local_3)].stackNum = _arg_2;
                    privateAddSlots[(downSlotLabel + _local_3)].update();
                };
                _local_3++;
            };
        }

        private function showItems():void
        {
            showUpSlots();
            showDownSlots();
        }

        private function tabUpBtnClick(_arg_1:MouseEvent):void
        {
            var _local_2:String = _arg_1.currentTarget.id;
            var _local_3:Number = Number(_local_2.substr(upBtnLabel.length));
            _arg_1.currentTarget.selected = true;
            filterValue = filterValueArr[_local_3];
            var _local_4:int;
            while (_local_4 < labelArr.length)
            {
                if (_local_4 != _local_3)
                {
                    privateAddSlots[(upBtnLabel + _local_4)].selected = false;
                };
                _local_4++;
            };
            showUpSlots();
        }

        private function getItemList(_arg_1:Object):Array
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:Boolean;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:String;
            var _local_11:Object;
            var _local_2:Array = [];
            if ((((((_arg_1) && (!(_arg_1.nth))) && (_arg_1.itemType)) && (_dm.bagSlotIndex)) && (_dm.bagSlotIndex[_arg_1.itemType])))
            {
                _local_3 = _dm.bagSlotIndex[_arg_1.itemType];
                for (_local_4 in _local_3)
                {
                    _local_5 = _core.getTemplateData((_arg_1.itemType - -1), Number(_local_4), false);
                    if (((_local_3[_local_4]) && (_local_5)))
                    {
                        _local_6 = false;
                        if (((_arg_1.id) && (_arg_1.id[_local_4])))
                        {
                            _local_6 = true;
                        };
                        if (_arg_1.kind)
                        {
                            if (_arg_1.kind[_local_5.kind])
                            {
                                _local_6 = ((_arg_1.id) ? _local_6 : true);
                            }
                            else
                            {
                                _local_6 = false;
                            };
                        };
                        if (_arg_1.type)
                        {
                            if (_arg_1.type[_local_5.type])
                            {
                                _local_6 = (((_arg_1.id) || (_arg_1.kind)) ? _local_6 : true);
                            }
                            else
                            {
                                _local_6 = false;
                            };
                        };
                        if (_arg_1.propType)
                        {
                            if (_arg_1.propType[_local_5.propType])
                            {
                                _local_6 = ((((_arg_1.id) || (_arg_1.kind)) || (_arg_1.type)) ? _local_6 : true);
                            }
                            else
                            {
                                _local_6 = false;
                            };
                        };
                        if (_local_6)
                        {
                            _local_7 = _local_3[_local_4];
                            for (_local_10 in _local_7)
                            {
                                _local_8 = _dm.sList[_local_7[_local_10]];
                                if ((((_local_8) && (_dm.isBagSlot(Number(_local_8.sid)))) && (_local_8.stackNum > 0)))
                                {
                                    _local_11 = {};
                                    _local_9 = _dm.getGameData(_local_8.type, _local_8.itemId);
                                    if (_local_9)
                                    {
                                        _local_11.color = _local_9.color;
                                    }
                                    else
                                    {
                                        _local_11.color = 0;
                                    };
                                    _local_11.slotData = _local_8;
                                    _local_11.type = _local_8.type;
                                    _local_11.giid = _local_8.itemId;
                                    _local_11.stackNum = _local_8.stackNum;
                                    _local_2.push(_local_11);
                                };
                            };
                        };
                    };
                };
                _local_2.sortOn(_arg_1.sortField, _arg_1.sortParam);
            };
            return (_local_2);
        }

        private function shopDClickHandler(_arg_1:Event):void
        {
            var _local_2:ShopSlot = ShopSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _local_2.selected = true;
            buy();
        }

        public function set sysShopId(_arg_1:Array):void
        {
            _sysShopId = _arg_1;
        }

        private function initView():void
        {
            _width = ((((_col * 34) + ((_col - 1) * 3)) + 9) + 12);
            firstTile.height = ((((_row * 34) + ((_row - 1) * 4)) + 6) + 6);
            _heightUp = (firstTile.height + 30);
            tabBtnDown.y = (_heightUp + 30);
            tabDown.y = (tabBtnDown.y + 17);
            itemTileD.height = firstTile.height;
            shopTileD.height = (((_row * 41) + ((_row - 1) * 4)) + 5);
            _heightDown = (itemTileD.height + 44);
            pageSelectorD.y = ((tabDown.y + tabDown.height) - 26);
            this.width = _width;
            this.height = (((((21 + _heightUp) + 9) + 17) + _heightDown) + 9);
            initUpTabButton();
            initAllSlots();
            showItems();
            _core.data.addEventListener(GamePredef.EVENT_REFRESH_FUNCSLOTS, refreshFuncBag);
        }

        [Bindable(event="propertyChange")]
        private function get _width():Number
        {
            return (this._1462071097_width);
        }

        [Bindable(event="propertyChange")]
        public function get tabDown():ViewStack
        {
            return (this._1554086441tabDown);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnDown():HBox
        {
            return (this._316973001tabBtnDown);
        }

        private function getShopItemList():Array
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Boolean;
            var _local_8:Object;
            var _local_9:String;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Boolean;
            var _local_13:Object;
            var _local_1:Array = [];
            var _local_2:Object = (((_cond.down) && (!(_cond.down.nth))) ? _cond.down : _cond.up);
            if (_cond.npcShop)
            {
                _local_3 = _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_cond.npcShop];
                for (_local_4 in _local_3)
                {
                    _local_5 = _local_3[_local_4];
                    _local_6 = _core.getTemplateData(_local_5.type, _local_5.itemId, false);
                    if (_local_6)
                    {
                        _local_7 = false;
                        if (((_local_2.id) && (_local_2.id[_local_6.id])))
                        {
                            _local_7 = true;
                        };
                        if (_local_2.kind)
                        {
                            if (_local_2.kind[_local_6.kind])
                            {
                                _local_7 = ((_local_2.id) ? _local_7 : true);
                            }
                            else
                            {
                                _local_7 = false;
                            };
                        };
                        if (_local_2.type)
                        {
                            if (_local_2.type[_local_6.type])
                            {
                                _local_7 = (((_local_2.id) || (_local_2.kind)) ? _local_7 : true);
                            }
                            else
                            {
                                _local_7 = false;
                            };
                        };
                        if (_local_7)
                        {
                            _local_8 = new Object();
                            _local_8.slotData = _local_5;
                            _local_8.type = _local_5.type;
                            _local_8.giid = _local_5.itemId;
                            _local_8.quality = _local_5.quality;
                            _local_8.st = _local_5.st;
                            if (_local_8.st != 3)
                            {
                                if (_local_8.st != Number(GamePredef.SHOP_SELL_TYPE_HIDE))
                                {
                                    _local_1.push(_local_8);
                                };
                            };
                        };
                    };
                };
            };
            if (_cond.sysShop)
            {
                for (_local_9 in _sysShopAllItems)
                {
                    _local_10 = _sysShopAllItems[_local_9];
                    _local_11 = _core.getTemplateData(_local_10.type, _local_10.itemId, false);
                    if (_local_11)
                    {
                        _local_12 = false;
                        if (((_local_2.id) && (_local_2.id[_local_11.id])))
                        {
                            _local_12 = true;
                        };
                        if (_local_2.kind)
                        {
                            if (_local_2.kind[_local_11.kind])
                            {
                                _local_12 = ((_local_2.id) ? _local_12 : true);
                            }
                            else
                            {
                                _local_12 = false;
                            };
                        };
                        if (_local_2.type)
                        {
                            if (_local_2.type[_local_11.type])
                            {
                                _local_12 = (((_local_2.id) || (_local_2.kind)) ? _local_12 : true);
                            }
                            else
                            {
                                _local_12 = false;
                            };
                        };
                        if (_local_2.propType)
                        {
                            if (_local_2.propType[_local_11.propType])
                            {
                                _local_12 = ((((_local_2.id) || (_local_2.kind)) || (_local_2.type)) ? _local_12 : true);
                            }
                            else
                            {
                                _local_12 = false;
                            };
                        };
                        if (_local_12)
                        {
                            _local_13 = new Object();
                            _local_13.slotData = _local_10;
                            _local_13.type = _local_10.type;
                            _local_13.giid = _local_10.itemId;
                            _local_13.quality = _local_10.quality;
                            _local_13.st = _local_10.st;
                            if (_local_13.st != 3)
                            {
                                if (_local_13.st != Number(GamePredef.SHOP_SELL_TYPE_HIDE))
                                {
                                    _local_1.push(_local_13);
                                };
                            };
                        };
                    };
                };
            };
            return (_local_1);
        }

        public function set rows(_arg_1:int):void
        {
            _row = _arg_1;
        }

        private function onUpPageCleared():void
        {
            var _local_1:int = 1;
            while (_local_1 <= (_row * _col))
            {
                privateAddSlots[(upSlotLabel + _local_1)].clean();
                _local_1++;
            };
        }

        private function onUpPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                privateAddSlots[(upSlotLabel + _local_4)].type = _upItemList[_local_3].type;
                privateAddSlots[(upSlotLabel + _local_4)].slotData = _upItemList[_local_3].slotData;
                privateAddSlots[(upSlotLabel + _local_4)].stackNum = _upItemList[_local_3].stackNum;
                privateAddSlots[(upSlotLabel + _local_4)].giid = _upItemList[_local_3].giid;
                _local_4++;
            };
        }

        public function set cols(_arg_1:int):void
        {
            _col = _arg_1;
        }

        public function __downTabBtn0_click(_arg_1:MouseEvent):void
        {
            tabDownClick(0);
        }

        private function tabDownClick(_arg_1:int):void
        {
            tabDown.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < tabDown.numChildren)
            {
                if (_local_2 == _arg_1)
                {
                    this[(downBtnLabel + _local_2)].selected = true;
                }
                else
                {
                    this[(downBtnLabel + _local_2)].selected = false;
                };
                _local_2++;
            };
            if (_arg_1 == 1)
            {
                showShopSlots();
            }
            else
            {
                showDownSlots();
            };
        }

        public function set pageSelectorD(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1647659402pageSelectorD;
            if (_local_2 !== _arg_1)
            {
                this._1647659402pageSelectorD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectorD", _local_2, _arg_1));
            };
        }

        public function set downType(_arg_1:Number):void
        {
            _downSlotType = _arg_1;
        }

        public function doBuy(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:NumPanel;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_2) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                };
                if (_selectedSlot)
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    _local_3.numStepper.enabled = true;
                    _local_3.parent = DragableCanvas(_core.view.getUI(ViewManager.PANEL_EQUIPTFUNC));
                    _local_3.showSelected(_selectedSlot, null, NumPanel.TYPE_BUY, buySelected);
                    _local_3.closeWith(DragableCanvas(_core.view.getUI(ViewManager.PANEL_EQUIPTFUNC)));
                    return;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

