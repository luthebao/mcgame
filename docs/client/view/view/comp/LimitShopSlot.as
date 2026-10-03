// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LimitShopSlot

package com.qeedoo.ui.view.comp
{
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ShopSlotVO;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
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

    public class LimitShopSlot extends SimpleCanvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1607243192endTime:RoundedLabel;
        private var _114226sts:Canvas;
        private var _3059661cost:Currency;
        private var _95173395is_Stack:Boolean = false;
        private var _345321964shopSlot:Slot;
        private var _2129294769startTime:RoundedLabel;
        private var _530283547is_soldout:Boolean = false;
        public var _LimitShopSlot_RoundedLabel1:RoundedLabel;
        public var _LimitShopSlot_BasicGlowButton1:BasicGlowButton;
        private var _714930330isBinded:RoundedLabel;
        private var _539157401limitNuImage:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":248,
                    "height":75,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Slot,
                        "id":"shopSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":6,
                                "y":5,
                                "movable":false,
                                "width":34,
                                "height":34,
                                "styleName":"TransparentSlot"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_LimitShopSlot_RoundedLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":42,
                                "y":5,
                                "width":190,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"cost",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":11,
                                "y":44,
                                "width":82,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"isBinded",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":16,
                                "width":70,
                                "y":5,
                                "x":174
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"startTime",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":42,
                                "y":18,
                                "height":18,
                                "width":202
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"endTime",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":42,
                                "y":31,
                                "height":18,
                                "width":202
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_LimitShopSlot_BasicGlowButton1",
                        "events":{"click":"___LimitShopSlot_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "60";
                            this.bottom = "3";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":60,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"sts",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":192,
                                "y":52,
                                "width":53,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"limitNuImage",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 11;
                            this.color = 16761125;
                            this.fontFamily = "Arial";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":46,
                                "width":82,
                                "height":16
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

        public function LimitShopSlot()
        {
            mx_internal::_document = this;
            this.width = 248;
            this.height = 75;
            this.enabled = false;
            this.styleName = "RoundedGradientBorder";
            this.addEventListener("creationComplete", ___LimitShopSlot_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LimitShopSlot._watcherSetupUtil = _arg_1;
        }


        public function set giid(_arg_1:Number):void
        {
            shopSlotVO.giid = _arg_1;
        }

        public function set _endTime(_arg_1:Date):void
        {
            endTime.text = Language.SYSTEMSHOPPANEL_U[22].replace("{year}", _arg_1.getFullYear()).replace("{month}", (_arg_1.getMonth() + 1)).replace("{day}", _arg_1.getDate()).replace("{hour}", _arg_1.getHours()).replace("{minute}", _arg_1.getMinutes());
        }

        [Bindable(event="propertyChange")]
        private function get is_Stack():Boolean
        {
            return (this._95173395is_Stack);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot():Slot
        {
            return (this._345321964shopSlot);
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

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:Event;
            if (enabled)
            {
                _local_2 = new Event(Slot.EVENT_SLOT_DCLICK);
                dispatchEvent(_local_2);
            };
        }

        public function set limitNuImage(_arg_1:Label):void
        {
            var _local_2:Object = this._539157401limitNuImage;
            if (_local_2 !== _arg_1)
            {
                this._539157401limitNuImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitNuImage", _local_2, _arg_1));
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

        [Bindable(event="propertyChange")]
        public function get sts():Canvas
        {
            return (this._114226sts);
        }

        public function get type():int
        {
            return (shopSlotVO.type);
        }

        public function ___LimitShopSlot_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get endTime():RoundedLabel
        {
            return (this._1607243192endTime);
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

        [Bindable(event="propertyChange")]
        public function get startTime():RoundedLabel
        {
            return (this._2129294769startTime);
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

        [Bindable(event="propertyChange")]
        public function get isBinded():RoundedLabel
        {
            return (this._714930330isBinded);
        }

        private function _LimitShopSlot_bindingsSetup():Array
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
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                shopSlot.slotType = _arg_1;
            }, "shopSlot.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (((shopSlotVO.itemName + "(") + ((shopSlotVO.slotData.remain + "/") + shopSlotVO.slotData.num)) + "个)");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LimitShopSlot_RoundedLabel1.text = _arg_1;
            }, "_LimitShopSlot_RoundedLabel1.text");
            result[5] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.itemColor);
            }, function (_arg_1:uint):void
            {
                _LimitShopSlot_RoundedLabel1.setStyle("color", _arg_1);
            }, "_LimitShopSlot_RoundedLabel1.color");
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
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                isBinded.text = _arg_1;
            }, "isBinded.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LimitShopSlot_BasicGlowButton1.label = _arg_1;
            }, "_LimitShopSlot_BasicGlowButton1.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (("每个ID限购" + shopSlotVO.limitNu) + "个");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                limitNuImage.text = _arg_1;
            }, "limitNuImage.text");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (shopSlotVO.limitNu);
            }, function (_arg_1:Boolean):void
            {
                limitNuImage.visible = _arg_1;
            }, "limitNuImage.visible");
            result[13] = binding;
            return (result);
        }

        public function set stackMax(_arg_1:int):void
        {
            shopSlotVO.stackMax = _arg_1;
        }

        public function set type(_arg_1:int):void
        {
            shopSlotVO.type = _arg_1;
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
            var target:LimitShopSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LimitShopSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_LimitShopSlotWatcherSetupUtil");
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
        public function get limitNuImage():Label
        {
            return (this._539157401limitNuImage);
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

        public function set startTime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2129294769startTime;
            if (_local_2 !== _arg_1)
            {
                this._2129294769startTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startTime", _local_2, _arg_1));
            };
        }

        public function set slotData(_arg_1:Object):void
        {
            shopSlotVO.slotData = _arg_1;
            if (_arg_1)
            {
                shopSlotVO.type = _arg_1.tid;
                shopSlotVO.giid = _arg_1.itemId;
                shopSlotVO.limitNu = _arg_1.limitNu;
                shopSlotVO.flag = _arg_1.flag;
                isBinded.visible = Boolean(Number(_arg_1.bind));
                is_Stack = ((_arg_1.remain) && (!(_arg_1.remain == -1)));
                is_soldout = (_arg_1.remain == 0);
                if (12 == _arg_1.tid)
                {
                };
                if (_arg_1.gold > 0)
                {
                    shopSlotVO.moneyType = Currency.TYPE_GOLD;
                    shopSlotVO.itemCost = _arg_1.gold;
                }
                else
                {
                    if (_arg_1.money > 0)
                    {
                        shopSlotVO.moneyType = Currency.TYPE_MONEYALL;
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
                getItemInfo(_arg_1.tid, _arg_1.itemId);
                enabled = true;
                doubleClickEnabled = true;
            };
        }

        public function set _startTime(_arg_1:Date):void
        {
            startTime.text = Language.SYSTEMSHOPPANEL_U[23].replace("{year}", _arg_1.getFullYear()).replace("{month}", (_arg_1.getMonth() + 1)).replace("{day}", _arg_1.getDate()).replace("{hour}", _arg_1.getHours()).replace("{minute}", _arg_1.getMinutes());
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

        private function _LimitShopSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = shopSlotVO.slotData;
            _local_1 = (!(is_soldout));
            _local_1 = shopSlotVO.type;
            _local_1 = shopSlotVO.giid;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = (((shopSlotVO.itemName + "(") + ((shopSlotVO.slotData.remain + "/") + shopSlotVO.slotData.num)) + "个)");
            _local_1 = shopSlotVO.itemColor;
            _local_1 = (cost.value > 0);
            _local_1 = shopSlotVO.itemCost;
            _local_1 = shopSlotVO.moneyType;
            _local_1 = Language.SYSTEMSHOPPANEL_U[21];
            _local_1 = Language.SYSTEMSHOPPANEL_U[13];
            _local_1 = (("每个ID限购" + shopSlotVO.limitNu) + "个");
            _local_1 = shopSlotVO.limitNu;
        }

        public function set endTime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1607243192endTime;
            if (_local_2 !== _arg_1)
            {
                this._1607243192endTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endTime", _local_2, _arg_1));
            };
        }

        public function set stackNum(_arg_1:int):void
        {
            shopSlotVO.stackNum = _arg_1;
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
            };
        }

        public function get slotData():Object
        {
            return (shopSlot.slotData);
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

        public function get stackMax():int
        {
            return (shopSlotVO.stackMax);
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

        public function set isBinded(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._714930330isBinded;
            if (_local_2 !== _arg_1)
            {
                this._714930330isBinded = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isBinded", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cost():Currency
        {
            return (this._3059661cost);
        }

        public function initView():void
        {
        }

        private function doBuyHandler():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP);
            _local_1._selectedLimitSlot = this;
            _local_1.buyLimit();
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
                        shopSlotVO.itemCost = Number(_local_3.gold);
                        shopSlotVO.moneyType = Currency.TYPE_GOLD;
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
                            if (_local_3.price > 0)
                            {
                                shopSlotVO.itemCost = Number(_local_3.price);
                                shopSlotVO.moneyType = Currency.TYPE_EXPOINT;
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
                shopSlot.addEventListener(Slot.EVENT_SLOT_DCLICK, dClickHandler);
            }
            else
            {
                this.visible = false;
            };
        }

        public function get index():int
        {
            return (shopSlotVO.index);
        }

        public function get stackNum():int
        {
            return (shopSlotVO.stackNum);
        }

        [Bindable(event="propertyChange")]
        private function get is_soldout():Boolean
        {
            return (this._530283547is_soldout);
        }

        public function ___LimitShopSlot_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            doBuyHandler();
        }


    }
}//package com.qeedoo.ui.view.comp

