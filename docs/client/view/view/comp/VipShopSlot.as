// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.VipShopSlot

package com.qeedoo.ui.view.comp
{
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ShopSlotVO;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class VipShopSlot extends SimpleCanvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _VipShopSlot_RoundedLabel1:RoundedLabel;
        private var _3059661cost:Currency;
        private var _95173395is_Stack:Boolean = false;
        public var _VipShopSlot_BasicGlowButton1:BasicGlowButton;
        private var _345321964shopSlot:Slot;
        private var _278927462soldOutFlag:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":170,
                    "height":75,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Slot,
                        "id":"shopSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":8,
                                "movable":false,
                                "width":34,
                                "height":34,
                                "styleName":"TransparentSlot"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_VipShopSlot_RoundedLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":18,
                                "width":132,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"cost",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":50,
                                "width":82,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_VipShopSlot_BasicGlowButton1",
                        "events":{"click":"___VipShopSlot_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "23";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":60,
                                "height":25
                            });
                        }
                    })]
                });
            }
        });
        private var _1141922867shopSlotVO:ShopSlotVO = new ShopSlotVO();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function VipShopSlot()
        {
            mx_internal::_document = this;
            this.width = 170;
            this.height = 75;
            this.enabled = false;
            this.styleName = "RoundedGradientBorder";
            this.addEventListener("creationComplete", ___VipShopSlot_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            VipShopSlot._watcherSetupUtil = _arg_1;
        }


        private function _VipShopSlot_bindingsSetup():Array
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
                return (!(soldOutFlag));
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
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                shopSlot.slotType = _arg_1;
            }, "shopSlot.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = shopSlotVO.itemName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopSlot_RoundedLabel1.text = _arg_1;
            }, "_VipShopSlot_RoundedLabel1.text");
            result[5] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.itemColor);
            }, function (_arg_1:uint):void
            {
                _VipShopSlot_RoundedLabel1.setStyle("color", _arg_1);
            }, "_VipShopSlot_RoundedLabel1.color");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (cost.value > 0);
            }, function (_arg_1:Boolean):void
            {
                cost.visible = _arg_1;
            }, "cost.visible");
            result[7] = binding;
            binding = new Binding(this, function ():Number
            {
                return (shopSlotVO.itemCost);
            }, function (_arg_1:Number):void
            {
                cost.value = _arg_1;
            }, "cost.value");
            result[8] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.moneyType);
            }, function (_arg_1:uint):void
            {
                cost.type = _arg_1;
            }, "cost.type");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _VipShopSlot_BasicGlowButton1.label = _arg_1;
            }, "_VipShopSlot_BasicGlowButton1.label");
            result[10] = binding;
            return (result);
        }

        public function set slotData(_arg_1:Object):void
        {
            shopSlotVO.slotData = _arg_1;
            if (_arg_1)
            {
                shopSlotVO.type = _arg_1.type;
                shopSlotVO.giid = _arg_1.itemId;
                soldOutFlag = ((_arg_1.flag) ? true : false);
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
                getItemInfo(shopSlotVO.type, shopSlotVO.giid);
                enabled = true;
                doubleClickEnabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        private function get is_Stack():Boolean
        {
            return (this._95173395is_Stack);
        }

        public function restore():void
        {
            shopSlot.restore();
        }

        override public function initialize():void
        {
            var target:VipShopSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _VipShopSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_VipShopSlotWatcherSetupUtil");
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

        public function ___VipShopSlot_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            doBuyHandler();
        }

        public function get selected():Boolean
        {
            return ((filters) && (filters.length > 0));
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

        [Bindable(event="propertyChange")]
        public function get shopSlot():Slot
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

        private function set is_Stack(_arg_1:Boolean):void
        {
            var _local_2:Object = this._95173395is_Stack;
            if (_local_2 !== _arg_1)
            {
                this._95173395is_Stack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "is_Stack", _local_2, _arg_1));
            };
        }

        public function set shopSlot(_arg_1:Slot):void
        {
            var _local_2:Object = this._345321964shopSlot;
            if (_local_2 !== _arg_1)
            {
                this._345321964shopSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot", _local_2, _arg_1));
            };
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

        public function set stackNum(_arg_1:int):void
        {
            shopSlotVO.stackNum = _arg_1;
        }

        public function get type():int
        {
            return (shopSlotVO.type);
        }

        private function _VipShopSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = shopSlotVO.slotData;
            _local_1 = (!(soldOutFlag));
            _local_1 = shopSlotVO.type;
            _local_1 = shopSlotVO.giid;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = shopSlotVO.itemName;
            _local_1 = shopSlotVO.itemColor;
            _local_1 = (cost.value > 0);
            _local_1 = shopSlotVO.itemCost;
            _local_1 = shopSlotVO.moneyType;
            _local_1 = Language.SYSTEMSHOPPANEL_U[13];
        }

        public function get slotData():Object
        {
            return (shopSlot.slotData);
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

        public function get stackMax():int
        {
            return (shopSlotVO.stackMax);
        }

        [Bindable(event="propertyChange")]
        public function get cost():Currency
        {
            return (this._3059661cost);
        }

        private function set soldOutFlag(_arg_1:Boolean):void
        {
            var _local_2:Object = this._278927462soldOutFlag;
            if (_local_2 !== _arg_1)
            {
                this._278927462soldOutFlag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soldOutFlag", _local_2, _arg_1));
            };
        }

        public function initView():void
        {
        }

        public function reset():void
        {
            shopSlot.reset();
        }

        private function getItemInfo(_arg_1:int, _arg_2:Number):void
        {
            var _local_4:int;
            if (((_arg_2 <= 0) || (_arg_1 <= 0)))
            {
                return;
            };
            var _local_3:Object = GameData.d[_arg_1][_arg_2];
            if (_local_3 != null)
            {
                _local_4 = int(Math.ceil((shopSlotVO.slotData.q / 5)));
                if (ToolKit.isEqual(_arg_1, GamePredef.TBL_CREATURE))
                {
                    _local_4 = int(_core.basic.colorByGrowRate((shopSlotVO.slotData.q / 10)));
                };
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
                if (shopSlotVO.itemCost <= 0)
                {
                    if (_local_3.gold > 0)
                    {
                        if (_local_3.gt == 1)
                        {
                            shopSlotVO.moneyType = Currency.TYPE_GOLD;
                        }
                        else
                        {
                            shopSlotVO.moneyType = Currency.TYPE_GOLDALL;
                        };
                        shopSlotVO.itemCost = Number(_local_3.gold);
                    }
                    else
                    {
                        if (_local_3.point)
                        {
                            shopSlotVO.itemCost = Number(_local_3.point);
                            shopSlotVO.moneyType = Currency.TYPE_EXPOINT;
                        };
                    };
                };
                shopSlot.addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
            }
            else
            {
                this.visible = false;
            };
        }

        public function update():void
        {
            shopSlot.update();
        }

        public function get index():int
        {
            return (shopSlotVO.index);
        }

        public function ___VipShopSlot_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function get slotType():int
        {
            return (shopSlot.slotType);
        }

        public function get stackNum():int
        {
            return (shopSlotVO.stackNum);
        }

        [Bindable(event="propertyChange")]
        private function get soldOutFlag():Boolean
        {
            return (this._278927462soldOutFlag);
        }

        [Bindable(event="propertyChange")]
        private function get shopSlotVO():ShopSlotVO
        {
            return (this._1141922867shopSlotVO);
        }

        private function doBuyHandler():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_VIP_SHOP);
            _local_1._selectedVipSlot = this;
            _local_1.buyFromVipShop();
        }

        public function set stackMax(_arg_1:int):void
        {
            shopSlotVO.stackMax = _arg_1;
        }

        public function set giid(_arg_1:Number):void
        {
            shopSlotVO.giid = _arg_1;
        }

        public function set type(_arg_1:int):void
        {
            shopSlotVO.type = _arg_1;
        }

        public function get giid():Number
        {
            return (shopSlotVO.giid);
        }


    }
}//package com.qeedoo.ui.view.comp

