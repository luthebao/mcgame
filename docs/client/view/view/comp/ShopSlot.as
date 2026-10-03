// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ShopSlot

package com.qeedoo.ui.view.comp
{
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ShopSlotVO;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class ShopSlot extends SimpleCanvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _114226sts:Canvas;
        private var _1177514720itemText:RoundedLabel;
        private var _3059661cost:Currency;
        private var _95173395is_Stack:Boolean = false;
        private var _345321964shopSlot:ItemSlot;
        private var _530283547is_soldout:Boolean = false;
        private var _94849541cost2:Currency;
        private var typeStr:String;
        private var eachNum:Number;
        private var numStr:String;
        private var eachType:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":120,
                    "height":41,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"shopSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":4,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"itemText",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":36,
                                "y":2,
                                "width":83,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"cost",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":37,
                                "y":21,
                                "width":82,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"cost2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":75,
                                "y":38,
                                "width":82,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"sts",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":67,
                                "y":21,
                                "width":53,
                                "height":20
                            });
                        }
                    })]
                });
            }
        });
        private var _1141922867shopSlotVO:ShopSlotVO = new ShopSlotVO();
        private var _core:Core = Core.getInstance();
        private var typeAR:Array = ["pType1", "pType2"];
        private var numAR:Array = ["pNum1", "pNum2"];
        private var view:Object = ViewManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ShopSlot()
        {
            mx_internal::_document = this;
            this.width = 120;
            this.height = 41;
            this.enabled = false;
            this.styleName = "CanvasShopSlot";
            this.addEventListener("creationComplete", ___ShopSlot_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ShopSlot._watcherSetupUtil = _arg_1;
        }


        public function set giid(_arg_1:Number):void
        {
            shopSlotVO.giid = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get cost2():Currency
        {
            return (this._94849541cost2);
        }

        public function set cost2(_arg_1:Currency):void
        {
            var _local_2:Object = this._94849541cost2;
            if (_local_2 !== _arg_1)
            {
                this._94849541cost2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cost2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get is_Stack():Boolean
        {
            return (this._95173395is_Stack);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot():ItemSlot
        {
            return (this._345321964shopSlot);
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:Event;
            if (enabled)
            {
                _local_2 = new Event(Slot.EVENT_SLOT_DCLICK);
                dispatchEvent(_local_2);
            };
        }

        public function set shopSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._345321964shopSlot;
            if (_local_2 !== _arg_1)
            {
                this._345321964shopSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot", _local_2, _arg_1));
            };
        }

        private function set is_Stack(_arg_1:Boolean):void
        {
            var _local_2:Object = this._95173395is_Stack;
            if (_local_2 !== _arg_1)
            {
                this._95173395is_Stack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "is_Stack", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sts():Canvas
        {
            return (this._114226sts);
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
            }
            else
            {
                filters = [];
            };
        }

        public function get type():int
        {
            return (shopSlotVO.type);
        }

        public function clean():void
        {
            shopSlot.clean();
            shopSlotVO.itemName = "";
            shopSlotVO.itemCost = -1;
            shopSlotVO.giid = -1;
            enabled = false;
            doubleClickEnabled = true;
        }

        public function reset():void
        {
            shopSlot.reset();
        }

        public function get slotType():int
        {
            return (shopSlot.slotType);
        }

        public function set sts(_arg_1:Canvas):void
        {
            var _local_2:Object = this._114226sts;
            if (_local_2 !== _arg_1)
            {
                this._114226sts = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sts", _local_2, _arg_1));
            };
        }

        public function set type(_arg_1:int):void
        {
            shopSlotVO.type = _arg_1;
        }

        public function set stackMax(_arg_1:int):void
        {
            shopSlotVO.stackMax = _arg_1;
        }

        public function get giid():Number
        {
            return (shopSlotVO.giid);
        }

        public function restore():void
        {
            shopSlot.restore();
        }

        override public function initialize():void
        {
            var target:ShopSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ShopSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ShopSlotWatcherSetupUtil");
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

        public function set cost(_arg_1:Currency):void
        {
            var _local_2:Object = this._3059661cost;
            if (_local_2 !== _arg_1)
            {
                this._3059661cost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cost", _local_2, _arg_1));
            };
        }

        public function get selected():Boolean
        {
            return ((filters) && (filters.length > 0));
        }

        public function set slotData(_arg_1:Object):void
        {
            var _local_2:*;
            shopSlotVO.slotData = _arg_1;
            if (_arg_1)
            {
                shopSlotVO.type = _arg_1.type;
                shopSlotVO.giid = _arg_1.itemId;
                shopSlotVO.stackNum = _arg_1.currentAmount;
                shopSlotVO.stackMax = _arg_1.amount;
                is_Stack = ((_arg_1.currentAmount) && (!(_arg_1.currentAmount == -1)));
                is_soldout = (_arg_1.currentAmount == 0);
                switch (_arg_1.shopType)
                {
                    case 2:
                        this.height = 60;
                        itemText.x = 42;
                        itemText.y = 13;
                        shopSlotVO.itemCost = -1;
                        shopSlotVO.itemCost2 = -1;
                        for (_local_2 in typeAR)
                        {
                            typeStr = typeAR[_local_2];
                            numStr = numAR[_local_2];
                            eachType = Number(_arg_1[typeStr]);
                            eachNum = Number(_arg_1[numStr]);
                            switch (eachType)
                            {
                                case GamePredef.CURRENCY_DOG_MEDAL:
                                    shopSlotVO.moneyType2 = Currency.TYPE_DOGMEDAL;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_BATTLE_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_BTPOINT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_ACHILLES_MEDAL:
                                    shopSlotVO.moneyType2 = Currency.TYPE_ACHILLESMEDAL;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_NEWYEAR_PONIT:
                                    shopSlotVO.moneyType = Currency.TYPE_NEWYEARPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_LUNAYEAR_PONIT:
                                    shopSlotVO.moneyType = Currency.TYPE_LUNAYEARPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_VALENTINE_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_VALENTINEPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_LANTERN_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_LANTERNPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_LABOR_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_LABORPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_FISHING_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_FISHINGPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_QIXI_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_QIXIPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_SUMMER_POINT:
                                    shopSlotVO.moneyType = Currency.TYPE_SUMMERPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_ANNUAL_THIRD:
                                    shopSlotVO.moneyType = Currency.TYPE_ANNUAL_THIRD;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_PET_ARENA:
                                    shopSlotVO.moneyType = Currency.TYPE_PET_ARENA;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_NORMAL_CONTRIB:
                                    shopSlotVO.moneyType = Currency.TYPE_NORMAL_CONTRIB;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_DONATE_CONTRIB:
                                    shopSlotVO.moneyType2 = Currency.TYPE_DONATE_CONTRIB;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_XMAX_POINT:
                                    shopSlotVO.moneyType2 = Currency.TYPE_XMASPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_GROUPPVP_MEDAL:
                                    shopSlotVO.moneyType2 = Currency.TYPE_GROUPPVPPNT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_NATIONALDAY_POINT:
                                    shopSlotVO.moneyType2 = Currency.TYPE_NATIONALDAY;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_PET_CHIP:
                                    shopSlotVO.moneyType = Currency.TYPE_PET_CHIP;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_WORLD_CUP:
                                    shopSlotVO.moneyType2 = Currency.TYPE_WORLD_CUP;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_GOLD_WORLD_CUP:
                                    shopSlotVO.moneyType = Currency.TYPE_GOLD_WORLD_CUP;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_SUMMER_GAME:
                                    shopSlotVO.moneyType = Currency.TYPE_SUMMER_GAME;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_DOUBLE_11:
                                    shopSlotVO.moneyType = Currency.TYPE_DOUBLE_11;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_SHOWTIME:
                                    shopSlotVO.moneyType = Currency.TYPE_SHOWTIME_POINT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_ANNIVERSARY:
                                    shopSlotVO.moneyType = Currency.TYPE_ANNI_POINT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_SHOP_GOLD:
                                    shopSlotVO.moneyType2 = Currency.TYPE_GOLD_POINT;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost2 = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_ANNI_CONSUME:
                                    shopSlotVO.moneyType = Currency.TYPE_ANNI_CONSUME;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_MC_BEANS:
                                    shopSlotVO.moneyType = Currency.TYPE_MC_BEANS;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_PET_ARENA_ACT:
                                    shopSlotVO.moneyType = Currency.TYPE_PET_ARENA_ACTIVITY;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_SHOWTIME2:
                                    shopSlotVO.moneyType = Currency.TYPE_SHOWTIME_POINT2;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_DMBKYSQJ:
                                    shopSlotVO.moneyType = Currency.TYPE_DMBKYSQJ;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                                case GamePredef.CURRENCY_DMBKSBJL:
                                    shopSlotVO.moneyType = Currency.TYPE_DMBKSBJL;
                                    if (ToolKit.isBigOrEqual(eachNum, 0))
                                    {
                                        shopSlotVO.itemCost = eachNum;
                                    };
                                    break;
                            };
                        };
                        cost.x = 10;
                        cost.y = 38;
                        cost.width = 64;
                        cost2.width = 45;
                        break;
                    default:
                        this.height = 41;
                        if (initialized)
                        {
                            itemText.x = 36;
                            itemText.y = 2;
                            cost.x = 37;
                            cost.y = 21;
                            cost2.value = -1;
                        };
                        if (_arg_1.gold > 0)
                        {
                            if (_arg_1.gt == 1)
                            {
                                shopSlotVO.moneyType = Currency.TYPE_GOLD;
                            }
                            else
                            {
                                shopSlotVO.moneyType = Currency.TYPE_GOLDALL;
                            };
                            shopSlotVO.itemCost = _arg_1.gold;
                        }
                        else
                        {
                            if (_arg_1.money > 0)
                            {
                                if (_arg_1.gt == 1)
                                {
                                    shopSlotVO.moneyType = Currency.TYPE_MONEY;
                                }
                                else
                                {
                                    shopSlotVO.moneyType = Currency.TYPE_MONEYALL;
                                };
                                shopSlotVO.itemCost = _arg_1.money;
                            }
                            else
                            {
                                if (_arg_1.point > 0)
                                {
                                    shopSlotVO.moneyType = Currency.TYPE_EXPOINT;
                                    shopSlotVO.itemCost = _arg_1.point;
                                }
                                else
                                {
                                    shopSlotVO.itemCost = -1;
                                };
                            };
                        };
                };
                getItemInfo(_arg_1.type, _arg_1.itemId);
                enabled = true;
                doubleClickEnabled = true;
            };
        }

        private function set shopSlotVO(_arg_1:ShopSlotVO):void
        {
            var _local_2:Object = this._1141922867shopSlotVO;
            if (_local_2 !== _arg_1)
            {
                this._1141922867shopSlotVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlotVO", _local_2, _arg_1));
            };
        }

        public function set index(_arg_1:int):void
        {
            shopSlotVO.index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        public function set stackNum(_arg_1:int):void
        {
            shopSlotVO.stackNum = _arg_1;
        }

        public function set itemText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1177514720itemText;
            if (_local_2 !== _arg_1)
            {
                this._1177514720itemText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText", _local_2, _arg_1));
            };
        }

        public function set st(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 1:
                    sts.styleName = "CanvasShopHot";
                    return;
                case 2:
                    sts.styleName = "CanvasShopSale";
                    return;
                case 3:
                    sts.styleName = "CanvasShopLimit";
                    return;
                case 4:
                    sts.styleName = "CanvasShopNew";
                    return;
                default:
                    sts.styleName = "";
            };
        }

        public function get slotData():Object
        {
            return ((shopSlot) ? shopSlot.slotData : shopSlotVO.slotData);
        }

        private function set is_soldout(_arg_1:Boolean):void
        {
            var _local_2:Object = this._530283547is_soldout;
            if (_local_2 !== _arg_1)
            {
                this._530283547is_soldout = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "is_soldout", _local_2, _arg_1));
            };
        }

        private function _ShopSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = shopSlotVO.slotData;
            _local_1 = (!(is_soldout));
            _local_1 = shopSlotVO.type;
            _local_1 = shopSlotVO.giid;
            _local_1 = shopSlotVO.stackMax;
            _local_1 = shopSlotVO.stackNum;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = shopSlotVO.itemName;
            _local_1 = shopSlotVO.itemColor;
            _local_1 = (cost.value >= 0);
            _local_1 = shopSlotVO.itemCost;
            _local_1 = shopSlotVO.moneyType;
            _local_1 = (cost2.value >= 0);
            _local_1 = shopSlotVO.itemCost2;
            _local_1 = shopSlotVO.moneyType2;
        }

        [Bindable(event="propertyChange")]
        private function get shopSlotVO():ShopSlotVO
        {
            return (this._1141922867shopSlotVO);
        }

        public function update():void
        {
            shopSlot.update();
        }

        [Bindable(event="propertyChange")]
        public function get cost():Currency
        {
            return (this._3059661cost);
        }

        public function initView():void
        {
        }

        private function getItemInfo(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int;
            if (((_arg_2 <= 0) || (_arg_1 <= 0)))
            {
                return;
            };
            var _local_3:Object = _core.getTemplateData(_arg_1, _arg_2);
            if (_local_3 != null)
            {
                _local_4 = int(Math.ceil((shopSlotVO.slotData.quality / 5)));
                if (ToolKit.isBigOrEqual(_local_3.color, 0))
                {
                    _local_4 = _local_3.color;
                };
                shopSlotVO.itemName = _local_3.name;
                if (ToolKit.isOriginalMaterial(_local_3))
                {
                    shopSlotVO.itemName = (shopSlotVO.itemName + (("[" + GamePredef.POSTFIX_MATERIAL_NAME[_local_4]) + "]"));
                };
                shopSlotVO.itemColor = GamePredef.CODE_ITEM_COLOR[_local_4];
                shopSlotVO.itemDescription = _local_3.description;
                if (((shopSlotVO.slotData.shopType == 1) && (shopSlotVO.itemCost <= 0)))
                {
                    if (_local_3.gold > 0)
                    {
                        shopSlotVO.itemCost = Number(_local_3.gold);
                        shopSlotVO.moneyType = Currency.TYPE_GOLDALL;
                    }
                    else
                    {
                        if (_local_3.honor > 0)
                        {
                            shopSlotVO.itemCost = Number(_local_3.honor);
                            shopSlotVO.moneyType = Currency.TYPE_HONOR;
                        }
                        else
                        {
                            if (_local_3.price)
                            {
                                shopSlotVO.itemCost = Number(_local_3.price);
                                shopSlotVO.moneyType = Currency.TYPE_MONEYALL;
                            }
                            else
                            {
                                if (_local_3.exPoint)
                                {
                                    shopSlotVO.itemCost = Number(_local_3.exPoint);
                                    shopSlotVO.moneyType = Currency.TYPE_EXPOINT;
                                };
                            };
                        };
                    };
                };
                ((shopSlot) && (shopSlot.addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler)));
            }
            else
            {
                trace("ShopSlot:getItemInfo-Calllater");
                callLater(getItemInfo, [_arg_1, _arg_2]);
            };
        }

        public function get index():int
        {
            return (shopSlotVO.index);
        }

        public function ___ShopSlot_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function get stackNum():int
        {
            return (shopSlotVO.stackNum);
        }

        [Bindable(event="propertyChange")]
        public function get itemText():RoundedLabel
        {
            return (this._1177514720itemText);
        }

        private function _ShopSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (shopSlotVO.slotData);
            }, function (_arg_1:Object):void
            {
                shopSlot.slotData = _arg_1;
            }, "shopSlot.slotData");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(is_soldout));
            }, function (_arg_1:Boolean):void
            {
                shopSlot.enabled = _arg_1;
            }, "shopSlot.enabled");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.type);
            }, function (_arg_1:int):void
            {
                shopSlot.type = _arg_1;
            }, "shopSlot.type");
            result[2] = binding;
            binding = new Binding(this, function ():Number
            {
                return (shopSlotVO.giid);
            }, function (_arg_1:Number):void
            {
                shopSlot.giid = _arg_1;
            }, "shopSlot.giid");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.stackMax);
            }, function (_arg_1:int):void
            {
                shopSlot.stackMax = _arg_1;
            }, "shopSlot.stackMax");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.stackNum);
            }, function (_arg_1:int):void
            {
                shopSlot.stackNum = _arg_1;
            }, "shopSlot.stackNum");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                shopSlot.slotType = _arg_1;
            }, "shopSlot.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = shopSlotVO.itemName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                itemText.text = _arg_1;
            }, "itemText.text");
            result[7] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.itemColor);
            }, function (_arg_1:uint):void
            {
                itemText.setStyle("color", _arg_1);
            }, "itemText.color");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (cost.value >= 0);
            }, function (_arg_1:Boolean):void
            {
                cost.visible = _arg_1;
            }, "cost.visible");
            result[9] = binding;
            binding = new Binding(this, function ():Number
            {
                return (shopSlotVO.itemCost);
            }, function (_arg_1:Number):void
            {
                cost.value = _arg_1;
            }, "cost.value");
            result[10] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.moneyType);
            }, function (_arg_1:uint):void
            {
                cost.type = _arg_1;
            }, "cost.type");
            result[11] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (cost2.value >= 0);
            }, function (_arg_1:Boolean):void
            {
                cost2.visible = _arg_1;
            }, "cost2.visible");
            result[12] = binding;
            binding = new Binding(this, function ():Number
            {
                return (shopSlotVO.itemCost2);
            }, function (_arg_1:Number):void
            {
                cost2.value = _arg_1;
            }, "cost2.value");
            result[13] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.moneyType2);
            }, function (_arg_1:uint):void
            {
                cost2.type = _arg_1;
            }, "cost2.type");
            result[14] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        private function get is_soldout():Boolean
        {
            return (this._530283547is_soldout);
        }

        public function get stackMax():int
        {
            return (shopSlotVO.stackMax);
        }


    }
}//package com.qeedoo.ui.view.comp

