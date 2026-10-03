// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipItem

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import com.qeedoo.game.data.DataManager;
    import mx.containers.VBox;
    import mx.controls.Image;
    import mx.states.RemoveChild;
    import mx.controls.Label;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.states.State;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import flash.display.DisplayObject;
    import mx.binding.BindingManager;
    import mx.events.ResizeEvent;
    import com.qeedoo.ui.resource.ResManager;
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

    public class TipItem extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _439241862reqClass:Text;
        private var _148001439useType:Text;
        private var dm:DataManager;
        private var _3582325vBox:VBox;
        private var _1638753418iconImg:Image;
        private var _1611566147customize:Text;
        public var _TipItem_RemoveChild1:RemoveChild;
        public var _TipItem_Label1:Label;
        public var _TipItem_Label2:Label;
        public var _TipItem_Text1:Text;
        public var _TipItem_Text2:Text;
        public var _TipItem_Text7:Text;
        private var _549739330canSell:Label;
        private var _3769vo:ToolTipVO;
        public var _TipItem_Button1:Button;
        private var _431118970reqLevel:Text;
        private var _747928928propJewel:Text;
        private var _1095316408currencyPrice:Currency;
        private var _core:Core;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vBox",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":57,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipItem_Label1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":5,
                                                        "text":"完美的什么装备名字[金]"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipItem_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0x3CFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":39,
                                                        "text":"已绑定"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"iconImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":5,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipItem_Text1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备描述"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipItem_Text2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"物品类型: 武器"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"useType",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"使用对象: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"等级需求: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqClass",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"职业需求: 工程师 艺术家"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"propJewel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"宝石属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipItem_Text7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备描述2"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"customize",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "text":"自定义字段，如“当前剩余使用次数: 10”",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"currencyPrice",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"canSell",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xC8C8C8;
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_TipItem_Button1",
                        "events":{"click":"___TipItem_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipItem()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.currentState = "common";
            this.states = [_TipItem_State1_c(), _TipItem_State2_c()];
            this.addEventListener("resize", ___TipItem_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipItem._watcherSetupUtil = _arg_1;
        }


        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            vo = new ToolTipVO();
            setCommon(_arg_1);
            if ((((((_arg_1.tempBagFlag) || (_arg_1.slotType == Slot.SLOT_TREASURE)) || (_arg_1.slotType == Slot.SLOT_LOTTO)) || (_arg_1.slotType == Slot.SLOT_TEMP_SLOT)) || (_arg_1.slotType == Slot.SLOT_TEMPORARY_BAG)))
            {
                setTreasure(_arg_1);
            };
            if (_arg_1.type == BasicToolTip.TYPE_INST)
            {
                setTemp(_arg_1);
            };
        }

        public function set customize(_arg_1:Text):void
        {
            var _local_2:Object = this._1611566147customize;
            if (_local_2 !== _arg_1)
            {
                this._1611566147customize = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "customize", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        public function set canSell(_arg_1:Label):void
        {
            var _local_2:Object = this._549739330canSell;
            if (_local_2 !== _arg_1)
            {
                this._549739330canSell = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSell", _local_2, _arg_1));
            };
        }

        public function set reqClass(_arg_1:Text):void
        {
            var _local_2:Object = this._439241862reqClass;
            if (_local_2 !== _arg_1)
            {
                this._439241862reqClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqClass", _local_2, _arg_1));
            };
        }

        private function getItemTypeName(_arg_1:int):String
        {
            var _local_2:String = GamePredef.ITEM_TYPE_NAME[_arg_1];
            var _local_3:String = GamePredef.ITEM_TYPE_NAME[GamePredef.ITEM_TYPE_OTHER];
            return ((null == _local_2) ? _local_3 : _local_2);
        }

        public function set reqLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        private function _TipItem_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "simplify";
            _local_1.overrides = [_TipItem_RemoveChild1_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get reqLevel():Text
        {
            return (this._431118970reqLevel);
        }

        override public function initialize():void
        {
            var target:TipItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipItemWatcherSetupUtil");
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
        public function get reqClass():Text
        {
            return (this._439241862reqClass);
        }

        [Bindable(event="propertyChange")]
        public function get propJewel():Text
        {
            return (this._747928928propJewel);
        }

        private function setTreasure(value:Object):void
        {
            var color:int;
            var cb:Function;
            vo.costVisible = (value.temp.tradable > 0);
            if (ToolKit.isBigOrEqual(value.temp.color, 0))
            {
                color = value.temp.color;
            }
            else
            {
                if (value.slotData)
                {
                    if (value.slotData.q)
                    {
                        color = _core.basic.getColorByQuality(value.slotData.q);
                    }
                    else
                    {
                        if (value.slotData.quality)
                        {
                            color = _core.basic.getColorByQuality(value.slotData.quality);
                        };
                    };
                }
                else
                {
                    color = 0;
                };
            };
            vo.name = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[color]) + "'>") + vo.name) + ((ToolKit.isOriginalMaterial(value.temp)) ? (("[" + GamePredef.POSTFIX_MATERIAL_NAME[color]) + "]") : ((ToolKit.isLifeMaterial(value.temp)) ? (("[" + Language.TIPITEM_S[29].toString().replace("{itemLevel}", value.temp.itemLevel)) + "]") : ""))) + "</font>");
            if (((value.slotData) && ((value.slotData.b) || (value.slotData.b == 0))))
            {
                vo.bind = ((value.slotData.b > 0) ? Language.TIPITEM_S[22] : Language.TIPITEM_S[23]);
            };
            if (((value.slotData) && (value.slotData.st == 3)))
            {
                cb = function (_arg_1:int):void
                {
                    var _local_2:String;
                    if (_arg_1 >= 0)
                    {
                        _local_2 = Language.TIPITEM_S[28];
                        _local_2 = _local_2.replace("{amount}", value.slotData.amount);
                        _local_2 = _local_2.replace("{remain}", _arg_1);
                        _local_2 = BasicToolTip.COLOR_YELLOW.replace("{str}", _local_2);
                        vo.customize = _local_2;
                        customize.visible = true;
                    };
                };
                _core.remote.call("getRemainShopConfig", new Responder(cb), value.slotData.id);
            };
        }

        [Bindable(event="propertyChange")]
        public function get currencyPrice():Currency
        {
            return (this._1095316408currencyPrice);
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        public function set iconImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1638753418iconImg;
            if (_local_2 !== _arg_1)
            {
                this._1638753418iconImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canSell():Label
        {
            return (this._549739330canSell);
        }

        [Bindable(event="propertyChange")]
        public function get customize():Text
        {
            return (this._1611566147customize);
        }

        private function _TipItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (currencyPrice);
            }, function (_arg_1:DisplayObject):void
            {
                _TipItem_RemoveChild1.target = _arg_1;
            }, "_TipItem_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipItem_Label1.htmlText = _arg_1;
            }, "_TipItem_Label1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipItem_Label2.htmlText = _arg_1;
            }, "_TipItem_Label2.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.urlIcon);
            }, function (_arg_1:Object):void
            {
                iconImg.source = _arg_1;
            }, "iconImg.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipItem_Text1.htmlText = _arg_1;
            }, "_TipItem_Text1.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.type;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipItem_Text2.htmlText = _arg_1;
            }, "_TipItem_Text2.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.useType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useType.htmlText = _arg_1;
            }, "useType.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevel.htmlText = _arg_1;
            }, "reqLevel.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqClass;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqClass.htmlText = _arg_1;
            }, "reqClass.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propJewel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propJewel.htmlText = _arg_1;
            }, "propJewel.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.info;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipItem_Text7.htmlText = _arg_1;
            }, "_TipItem_Text7.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.customize;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                customize.htmlText = _arg_1;
            }, "customize.htmlText");
            result[11] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.currency);
            }, function (_arg_1:Number):void
            {
                currencyPrice.value = _arg_1;
            }, "currencyPrice.value");
            result[12] = binding;
            binding = new Binding(this, function ():uint
            {
                return (vo.currencyType);
            }, function (_arg_1:uint):void
            {
                currencyPrice.type = _arg_1;
            }, "currencyPrice.type");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                currencyPrice.visible = _arg_1;
            }, "currencyPrice.visible");
            result[14] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                currencyPrice.includeInLayout = _arg_1;
            }, "currencyPrice.includeInLayout");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.priceType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currencyPrice.priceType = _arg_1;
            }, "currencyPrice.priceType");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.costVisible));
            }, function (_arg_1:Boolean):void
            {
                canSell.visible = _arg_1;
            }, "canSell.visible");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.costVisible));
            }, function (_arg_1:Boolean):void
            {
                canSell.includeInLayout = _arg_1;
            }, "canSell.includeInLayout");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPITEM_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                canSell.text = _arg_1;
            }, "canSell.text");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipItem_Button1.visible = _arg_1;
            }, "_TipItem_Button1.visible");
            result[20] = binding;
            return (result);
        }

        public function set propJewel(_arg_1:Text):void
        {
            var _local_2:Object = this._747928928propJewel;
            if (_local_2 !== _arg_1)
            {
                this._747928928propJewel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propJewel", _local_2, _arg_1));
            };
        }

        public function set useType(_arg_1:Text):void
        {
            var _local_2:Object = this._148001439useType;
            if (_local_2 !== _arg_1)
            {
                this._148001439useType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useType", _local_2, _arg_1));
            };
        }

        private function _TipItem_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "common";
            return (_local_1);
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_2:Date;
            var _local_3:String;
            if (ToolKit.isBigThan(_arg_1.inst.t, 0))
            {
                _local_2 = new Date(Number(_arg_1.inst.t));
                _local_3 = Language.TIPITEM_S[24].toString();
                _local_3 = _local_3.replace("{fullYear}", _local_2.fullYear);
                _local_3 = _local_3.replace("{lastMonth}", ToolKit.add(_local_2.month, 1));
                _local_3 = _local_3.replace("{lastDate}", _local_2.date);
                _local_3 = _local_3.replace("{lastHour}", _local_2.hours);
                _local_3 = _local_3.replace("{lastMinutes}", _local_2.minutes);
                vo.info = (vo.info + _local_3);
            };
            vo.costVisible = (_arg_1.temp.tradable > 0);
            if (vo.costVisible)
            {
                if (_arg_1.temp.price > 0)
                {
                    vo.priceType = Language.TIPITEM_S[27];
                    vo.currency = int((_arg_1.temp.price / 4));
                    if (_arg_1.inst.binded > 0)
                    {
                        vo.currencyType = Currency.TYPE_MONEY_BIND;
                    }
                    else
                    {
                        vo.currencyType = Currency.TYPE_MONEY;
                    };
                };
                if (_arg_1.temp.gold > 0)
                {
                    vo.priceType = Language.TIPITEM_S[27];
                    vo.currency = 1;
                    if (_arg_1.inst.binded > 0)
                    {
                        vo.currencyType = Currency.TYPE_MONEY_BIND;
                    }
                    else
                    {
                        vo.currencyType = Currency.TYPE_MONEY;
                    };
                };
            };
            vo.name = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.inst.color]) + "'>") + vo.name) + ((ToolKit.isOriginalMaterial(_arg_1.temp)) ? (("[" + GamePredef.POSTFIX_MATERIAL_NAME[_arg_1.inst.color]) + "]") : ((ToolKit.isLifeMaterial(_arg_1.temp)) ? (("[" + Language.TIPITEM_S[29].toString().replace("{itemLevel}", _arg_1.temp.itemLevel)) + "]") : ""))) + "</font>");
            vo.bind = ((_arg_1.inst.binded > 0) ? Language.TIPITEM_S[22] : Language.TIPITEM_S[23]);
        }

        private function _TipItem_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipItem_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_TipItem_RemoveChild1", _TipItem_RemoveChild1);
            return (_local_1);
        }

        public function ___TipItem_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = currencyPrice;
            _local_1 = vo.name;
            _local_1 = vo.bind;
            _local_1 = vo.urlIcon;
            _local_1 = vo.description;
            _local_1 = vo.type;
            _local_1 = vo.useType;
            _local_1 = vo.reqLevel;
            _local_1 = vo.reqClass;
            _local_1 = vo.propJewel;
            _local_1 = vo.info;
            _local_1 = vo.customize;
            _local_1 = vo.currency;
            _local_1 = vo.currencyType;
            _local_1 = vo.costVisible;
            _local_1 = vo.costVisible;
            _local_1 = vo.priceType;
            _local_1 = (!(vo.costVisible));
            _local_1 = (!(vo.costVisible));
            _local_1 = Language.TIPITEM_S[25];
            _local_1 = vo.btnVisible;
        }

        private function setCommon(value:Object):void
        {
            var lastDate:Date;
            var endableTimeString:String;
            var minute:int;
            var hour:int;
            var day:int;
            var month:int;
            var year:int;
            var i:int;
            var tempObj:Object;
            var classAry:Array;
            var classNumAll:int;
            var p:int;
            var classAry2:Array;
            var classNumAll2:int;
            var q:int;
            var cb:Function;
            vo.btnVisible = value.btnVisible;
            vo.name = value.temp.name;
            if (ToolKit.isBigOrEqual(value.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[value.temp.color]) + "'>") + value.temp.name) + "</font>");
            };
            vo.urlIcon = ResManager.getIconUrl(value.temp.iconCode);
            ResManager.setColorCode(iconImg, value.temp.colorCode);
            vo.description = value.temp.description;
            vo.info = value.temp.info;
            if (((value.tempBagOt) && (ToolKit.isBigThan(value.tempBagOt, 0))))
            {
                lastDate = new Date(Number(value.tempBagOt));
                endableTimeString = Language.TIPITEM_S[24].toString();
                endableTimeString = endableTimeString.replace("{fullYear}", lastDate.fullYear);
                endableTimeString = endableTimeString.replace("{lastMonth}", ToolKit.add(lastDate.month, 1));
                endableTimeString = endableTimeString.replace("{lastDate}", lastDate.date);
                endableTimeString = endableTimeString.replace("{lastHour}", lastDate.hours);
                endableTimeString = endableTimeString.replace("{lastMinutes}", lastDate.minutes);
                vo.info = (vo.info + endableTimeString);
            }
            else
            {
                if (((ToolKit.isBigThan(value.temp.t, 0)) && (ToolKit.isSmallOrEqual(value.temp.t, 100000000000))))
                {
                    if (vo.info.length > 0)
                    {
                        vo.info = (vo.info + "<br>");
                    };
                    vo.info = (vo.info + Language.TIPITEM_S[0]);
                    minute = (value.temp.t % 60);
                    hour = int((Math.floor((value.temp.t / 60)) % 24));
                    day = int((Math.floor((value.temp.t / 1440)) % 31));
                    month = int((Math.floor((value.temp.t / 44640)) % 365));
                    year = int(Math.floor((value.temp.t / 16293600)));
                    if (ToolKit.isBigThan(year, 0))
                    {
                        vo.info = (vo.info + Language.TIPITEM_S[1].toString().replace("{year}", year));
                    };
                    if (ToolKit.isBigThan(month, 0))
                    {
                        vo.info = (vo.info + Language.TIPITEM_S[2].toString().replace("{month}", month));
                    };
                    if (ToolKit.isBigThan(day, 0))
                    {
                        vo.info = (vo.info + Language.TIPITEM_S[3].toString().replace("{day}", day));
                    };
                    if (ToolKit.isBigThan(hour, 0))
                    {
                        vo.info = (vo.info + Language.TIPITEM_S[4].toString().replace("{hour}", hour));
                    };
                    if (ToolKit.isBigThan(minute, 0))
                    {
                        vo.info = (vo.info + Language.TIPITEM_S[5].toString().replace("{minute}", minute));
                    };
                };
            };
            vo.costVisible = true;
            vo.type = (Language.TIPITEM_S[6] + getItemTypeName(value.temp.type));
            vo.bind = GamePredef.PROP_BINDTYPE[value.temp.bindType];
            if (value.cost > 0)
            {
                vo.currency = value.cost;
                vo.currencyType = value.costType;
            }
            else
            {
                if (value.temp.price > 0)
                {
                    vo.priceType = Language.TIPITEM_S[26];
                    vo.currency = value.temp.price;
                    vo.currencyType = Currency.TYPE_MONEYALL;
                };
                if (value.temp.gold > 0)
                {
                    vo.priceType = Language.TIPITEM_S[26];
                    vo.currency = value.temp.gold;
                    vo.currencyType = Currency.TYPE_GOLDALL;
                };
            };
            if (((ToolKit.isEqual(value.temp.type, GamePredef.ITEM_TYPE_CREBOOK)) || (ToolKit.isEqual(value.temp.type, GamePredef.ITEM_TYPE_FAIRY_SKILL_ITEM))))
            {
                propJewel.includeInLayout = false;
                propJewel.visible = false;
            }
            else
            {
                if (value.temp.propType > 0)
                {
                    propJewel.includeInLayout = true;
                    propJewel.visible = true;
                    if (ToolKit.isEqual(value.temp.type, GamePredef.ITEM_TYPE_PETFUNC))
                    {
                        if (ToolKit.isEqual(value.temp.propType, GamePredef.ITEM_TYPE_PETFUNC_TYPE[3]))
                        {
                            vo.propJewel = (((Language.TIPITEM_S[7] + FONT_COLOR_PRE_PROP) + (value.temp.proplNum / 100)) + FONT_COLOR_SUF_PROP);
                        }
                        else
                        {
                            if (ToolKit.isEqual(value.temp.propType, GamePredef.ITEM_TYPE_PETFUNC_TYPE[2]))
                            {
                                switch (Number(value.temp.proplNum))
                                {
                                    case GamePredef.ITEM_TYPE_XSD_TYPE[1]:
                                        vo.propJewel = Language.TIPITEM_S[8];
                                        break;
                                    case GamePredef.ITEM_TYPE_XSD_TYPE[2]:
                                        vo.propJewel = Language.TIPITEM_S[9];
                                        break;
                                    case GamePredef.ITEM_TYPE_XSD_TYPE[3]:
                                        vo.propJewel = Language.TIPITEM_S[10];
                                        break;
                                    case GamePredef.ITEM_TYPE_XSD_TYPE[4]:
                                        vo.propJewel = Language.TIPITEM_S[11];
                                        break;
                                    case GamePredef.ITEM_TYPE_XSD_TYPE[5]:
                                        vo.propJewel = Language.TIPITEM_S[12];
                                        break;
                                };
                            };
                        };
                    }
                    else
                    {
                        if (ToolKit.isEqual(value.temp.type, GamePredef.ITEM_TYPE_TEMP_BAG))
                        {
                            vo.propJewel = ((Language.TIPITEM_S[30] + ": ") + value.temp.proplNum);
                        }
                        else
                        {
                            vo.propJewel = ((((GamePredef.JEWEL_PROP_NAME[value.temp.propType] + ": ") + FONT_COLOR_PRE_PROP) + value.temp.proplNum) + FONT_COLOR_SUF_PROP);
                        };
                    };
                }
                else
                {
                    if (value.temp.kind == GamePredef.ITEM_KIND_FEATHER)
                    {
                        propJewel.includeInLayout = true;
                        propJewel.visible = true;
                        vo.propJewel = "";
                        i = 1;
                        while (i <= 3)
                        {
                            if (value.temp[("i" + i)] > 0)
                            {
                                if (value.temp.type == GamePredef.ITEM_TYPE_FEATHER_MIX)
                                {
                                    tempObj = _core.data.gameData[GamePredef.TBL_ITEM_TEMPLATE][value.temp[("i" + i)]];
                                    if (tempObj)
                                    {
                                        vo.propJewel = (vo.propJewel + (((tempObj.name + ": ") + Language.TIPITEM_S[31].replace("{num}", value.temp[("n" + i)])) + "\n"));
                                    };
                                }
                                else
                                {
                                    vo.propJewel = (vo.propJewel + (((GamePredef.FEATHER_PROP_NAME[value.temp[("i" + i)]] + ": ") + FONT_COLOR_PRE_PROP) + value.temp[("n" + i)]));
                                    if (value.temp.type == GamePredef.ITEM_TYPE_FEATHER_D)
                                    {
                                        vo.propJewel = (vo.propJewel + "%");
                                    };
                                    vo.propJewel = (vo.propJewel + (FONT_COLOR_SUF_PROP + "\n"));
                                };
                            };
                            i = (i + 1);
                        };
                        vo.propJewel.substr(0, (vo.propJewel.length - 2));
                    };
                };
            };
            switch (Number(value.temp.useType))
            {
                case 1:
                    vo.useType = Language.TIPITEM_S[13];
                    if (value.temp.reqLevel)
                    {
                        vo.reqLevel = Language.TIPITEM_S[14].toString().replace("{reqLevel}", value.temp.reqLevel);
                        if (ToolKit.isSmallThan(_core.player.level, value.temp.reqLevel))
                        {
                            vo.reqLevel = ((FONT_COLOR_RED_PROP + vo.reqLevel) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    if (value.temp.reqClass)
                    {
                        vo.reqClass = Language.TIPITEM_S[15];
                        classAry = value.temp.reqClass.split("|");
                        classNumAll = 0;
                        for each (p in classAry)
                        {
                            if ((((p) && (p >= 1)) && (p <= 6)))
                            {
                                vo.reqClass = (vo.reqClass + (dm.getGameDataList(GamePredef.TBL_CLASS)[p].name + " "));
                                classNumAll = (classNumAll + p);
                            };
                        };
                        if (classNumAll == 21)
                        {
                            vo.reqClass = Language.TIPITEM_S[16];
                        };
                        if (String(value.temp.reqClass).indexOf((("|" + _core.player.classId) + "|")) < 0)
                        {
                            vo.reqClass = ((FONT_COLOR_RED_PROP + vo.reqClass) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    reqClass.includeInLayout = true;
                    useType.visible = true;
                    reqLevel.visible = true;
                    reqClass.visible = true;
                    break;
                case 2:
                    vo.useType = Language.TIPITEM_S[17];
                    if (value.temp.reqLevel)
                    {
                        vo.reqLevel = Language.TIPITEM_S[14].toString().replace("{reqLevel}", value.temp.reqLevel);
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    reqClass.includeInLayout = false;
                    useType.visible = true;
                    reqLevel.visible = true;
                    reqClass.visible = true;
                    break;
                case 3:
                    vo.useType = Language.TIPITEM_S[18];
                    if (value.temp.reqLevel)
                    {
                        vo.reqLevel = Language.TIPITEM_S[14].toString().replace("{reqLevel}", value.temp.reqLevel);
                        if (ToolKit.isSmallThan(_core.player.level, value.temp.reqLevel))
                        {
                            vo.reqLevel = ((FONT_COLOR_RED_PROP + vo.reqLevel) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    reqClass.includeInLayout = false;
                    useType.visible = true;
                    reqLevel.visible = true;
                    reqClass.visible = false;
                    break;
                case 4:
                    useType.includeInLayout = false;
                    reqLevel.includeInLayout = false;
                    reqClass.includeInLayout = false;
                    useType.visible = false;
                    reqLevel.visible = false;
                    reqClass.visible = false;
                    break;
            };
            if (ToolKit.isEqual(value.temp.type, GamePredef.ITEM_TYPE_CREBOOK))
            {
                vo.useType = Language.TIPITEM_S[19];
                classAry2 = value.temp.reqClass.split("|");
                classNumAll2 = 0;
                for each (q in classAry2)
                {
                    if ((((q) && (q >= 1)) && (q <= 6)))
                    {
                        vo.useType = (vo.useType + (" " + GamePredef.CREATURE_CLASS_NAME[q]));
                        classNumAll2 = (classNumAll2 + q);
                    };
                };
                if (classNumAll2 == 21)
                {
                    vo.useType = Language.TIPITEM_S[20];
                };
                vo.useType = (vo.useType + Language.TIPITEM_S[21].toString().replace("{CREATURE_QLEVEL}", GamePredef.CREATURE_QLEVEL[value.temp.proplNum]));
                useType.includeInLayout = true;
                reqLevel.includeInLayout = false;
                reqClass.includeInLayout = false;
                useType.visible = true;
                reqLevel.visible = false;
                reqClass.visible = false;
            };
            if (ToolKit.isEqual(value.temp.type, GamePredef.ITEM_TYPE_FAIRY_SKILL_ITEM))
            {
                vo.useType = Language.TIPITEM_S[32];
                vo.reqLevel = Language.TIPITEM_S[33].toString().replace("{reqLevel}", value.temp.reqLevel);
                useType.includeInLayout = true;
                reqLevel.includeInLayout = true;
                reqClass.includeInLayout = false;
                useType.visible = true;
                reqLevel.visible = true;
                reqClass.visible = false;
            };
            if ((((value.inst) && (value.inst.f)) && (String(value.inst.f).indexOf("tipFormat") >= 0)))
            {
                cb = function (_arg_1:*):void
                {
                    var _local_2:String = _arg_1.tipFormat;
                    var _local_3:Array = _local_2.split("|");
                    var _local_4:* = "";
                    var _local_5:int;
                    while (_local_5 < _local_3.length)
                    {
                        _local_4 = (_local_4 + _arg_1[_local_3[_local_5]]);
                        _local_5++;
                    };
                    vo.customize = _local_4;
                    customize.visible = true;
                };
                _core.remote.call("getItemInst_f", new Responder(cb), value.inst.id);
            };
        }

        public function set currencyPrice(_arg_1:Currency):void
        {
            var _local_2:Object = this._1095316408currencyPrice;
            if (_local_2 !== _arg_1)
            {
                this._1095316408currencyPrice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currencyPrice", _local_2, _arg_1));
            };
        }

        public function set vBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._3582325vBox;
            if (_local_2 !== _arg_1)
            {
                this._3582325vBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vBox", _local_2, _arg_1));
            };
        }

        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        public function currencyHide(_arg_1:String):void
        {
            if (_arg_1 == "temp")
            {
                currentState = "simplify";
            };
            if (_arg_1 == "inst")
            {
                if ((((!(vo.currency)) || (vo.currency < 500)) || (canSell.visible)))
                {
                    currentState = "simplify";
                }
                else
                {
                    currentState = "common";
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get vBox():VBox
        {
            return (this._3582325vBox);
        }

        public function ___TipItem_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get useType():Text
        {
            return (this._148001439useType);
        }


    }
}//package com.qeedoo.ui.view.comp

