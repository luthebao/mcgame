// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.WorldCupShopSlot

package com.qeedoo.ui.view.comp
{
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Alert;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ShopSlotVO;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.managers.PopUpManager;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.ui.resource.ResManager;
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

    public class WorldCupShopSlot extends SimpleCanvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _102976443limit:RoundedLabel;
        private var _1177514720itemText:RoundedLabel;
        private var _3059661cost:Label;
        private var _95173395is_Stack:Boolean = false;
        private var _345321964shopSlot:ItemSlot;
        internal var _alert:Alert;
        private var _530283547is_soldout:Boolean = false;
        private var typeStr:String;
        private var _1180476246isGold:Boolean = false;
        private var eachNum:Number;
        private var _104387img:Image;
        private var numStr:String;
        private var eachType:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":150,
                    "height":70,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"shopSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":9,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"itemText",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":43,
                                "y":9,
                                "width":86,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"limit",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":43,
                                "y":25,
                                "text":"",
                                "width":104,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":45,
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"cost",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":36.5,
                                "y":47,
                                "height":20,
                                "width":66
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "events":{"click":"___WorldCupShopSlot_DelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":3000,
                                "x":98,
                                "y":44,
                                "label":"兑换",
                                "styleName":"BtnNormalRed"
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

        public function WorldCupShopSlot()
        {
            mx_internal::_document = this;
            this.width = 150;
            this.height = 70;
            this.enabled = false;
            this.styleName = "CanvasShopSlot";
            this.addEventListener("creationComplete", ___WorldCupShopSlot_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WorldCupShopSlot._watcherSetupUtil = _arg_1;
        }


        public function set giid(_arg_1:Number):void
        {
            shopSlotVO.giid = _arg_1;
        }

        public function ___WorldCupShopSlot_DelayButton1_click(_arg_1:MouseEvent):void
        {
            buyWorldCupItem();
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

        private function buyWorldCupItem():void
        {
            var handler:Function;
            if (((isGold) && (_core.player.worldCupGoldPoint < shopSlotVO.itemCost)))
            {
                _core.sysMsg("足球币不足");
                return;
            };
            if (((!(isGold)) && (_core.player.worldCupPoint < shopSlotVO.itemCost)))
            {
                _core.sysMsg("世界杯积分不足");
                return;
            };
            var object:* = _core.view.getUI(ViewManager.PANEL_WORLD_CUP);
            var _now:Number = new Date().getTime();
            if (((!(object)) || (ToolKit.isSmallThan(_now, ToolKit.add(object._checkTime, (2.7 * 1000))))))
            {
                return;
            };
            object._checkTime = _now;
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyWorldCupItem", null, shopSlotVO.slotData.id, shopSlotVO.type, shopSlotVO.giid);
                };
            };
            _alert = Alert.show("确定要购买该道具", null, (Alert.YES | Alert.NO), null, handler);
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

        private function set isGold(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1180476246isGold;
            if (_local_2 !== _arg_1)
            {
                this._1180476246isGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isGold", _local_2, _arg_1));
            };
        }

        public function get slotType():int
        {
            return (shopSlot.slotType);
        }

        private function _WorldCupShopSlot_bindingsSetup():Array
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
            binding = new Binding(this, function ():String
            {
                var _local_1:* = shopSlotVO.itemCost;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cost.text = _arg_1;
            }, "cost.text");
            result[9] = binding;
            return (result);
        }

        public function set type(_arg_1:int):void
        {
            shopSlotVO.type = _arg_1;
        }

        public function set limit(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._102976443limit;
            if (_local_2 !== _arg_1)
            {
                this._102976443limit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limit", _local_2, _arg_1));
            };
        }

        public function set stackMax(_arg_1:int):void
        {
            shopSlotVO.stackMax = _arg_1;
        }

        public function setLimit(_arg_1:Number):void
        {
            limit.text = (((("剩余:(" + ToolKit.minus(shopSlotVO.stackMax, _arg_1)) + "/") + shopSlotVO.stackMax) + ")");
        }

        public function get giid():Number
        {
            return (shopSlotVO.giid);
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:WorldCupShopSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WorldCupShopSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_WorldCupShopSlotWatcherSetupUtil");
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

        public function restore():void
        {
            shopSlot.restore();
        }

        public function set cost(_arg_1:Label):void
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
            shopSlotVO.slotData = _arg_1;
            if (_arg_1)
            {
                shopSlotVO.type = _arg_1.type;
                shopSlotVO.giid = _arg_1.itemId;
                shopSlotVO.stackNum = _arg_1.currentAmount;
                shopSlotVO.stackMax = _arg_1.amount;
                shopSlotVO.itemCost = _arg_1.pNum1;
                if (Number(_arg_1.pType1) == 29)
                {
                    img.source = ResManager.ICON_WORLD_CUP;
                    isGold = false;
                }
                else
                {
                    img.source = ResManager.ICON_WORLD_CUP_GOLD;
                    isGold = true;
                };
            };
            getItemInfo(_arg_1.type, _arg_1.itemId);
            enabled = true;
            visible = true;
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

        [Bindable(event="propertyChange")]
        private function get isGold():Boolean
        {
            return (this._1180476246isGold);
        }

        [Bindable(event="propertyChange")]
        public function get limit():RoundedLabel
        {
            return (this._102976443limit);
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

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function get slotData():Object
        {
            return ((shopSlot) ? shopSlot.slotData : shopSlotVO.slotData);
        }

        public function update():void
        {
            shopSlot.update();
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

        [Bindable(event="propertyChange")]
        public function get cost():Label
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
            };
        }

        public function get index():int
        {
            return (shopSlotVO.index);
        }

        [Bindable(event="propertyChange")]
        private function get shopSlotVO():ShopSlotVO
        {
            return (this._1141922867shopSlotVO);
        }

        public function get stackNum():int
        {
            return (shopSlotVO.stackNum);
        }

        private function _WorldCupShopSlot_bindingExprs():void
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
            _local_1 = shopSlotVO.itemCost;
        }

        [Bindable(event="propertyChange")]
        public function get itemText():RoundedLabel
        {
            return (this._1177514720itemText);
        }

        public function get stackMax():int
        {
            return (shopSlotVO.stackMax);
        }

        public function ___WorldCupShopSlot_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        private function get is_soldout():Boolean
        {
            return (this._530283547is_soldout);
        }


    }
}//package com.qeedoo.ui.view.comp

