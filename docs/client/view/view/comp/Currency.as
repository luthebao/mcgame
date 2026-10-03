// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.Currency

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextInput;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.skins.halo.HaloBorder;
    import mx.events.FlexEvent;
    import flash.events.Event;
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

    public class Currency extends SimpleCanvas implements IBindingClient 
    {

        public static const TYPE_MONEY:uint = 0;
        public static const TYPE_GOLD:uint = 1;
        public static const TYPE_MONEY_BIND:uint = 2;
        public static const TYPE_GOLD_BIND:uint = 3;
        public static const TYPE_HONOR:uint = 4;
        public static const TYPE_POINT:uint = 5;
        public static const TYPE_EXP:uint = 6;
        public static const TYPE_MONEYALL:uint = 7;
        public static const TYPE_GOLDALL:uint = 8;
        public static const TYPE_EXPBATTLE:uint = 9;
        public static const TYPE_ACTPOINT:uint = 10;
        public static const TYPE_CHIVAL:uint = 11;
        public static const TYPE_EXPOINT:uint = 12;
        public static const TYPE_BTPOINT:uint = 13;
        public static const TYPE_DOGMEDAL:uint = 14;
        public static const TYPE_ACHILLESMEDAL:uint = 15;
        public static const TYPE_NEWYEARPNT:uint = 16;
        public static const TYPE_LUNAYEARPNT:uint = 17;
        public static const TYPE_VALENTINEPNT:uint = 18;
        public static const TYPE_LANTERNPNT:uint = 19;
        public static const TYPE_LABORPNT:uint = 20;
        public static const TYPE_FISHINGPNT:uint = 21;
        public static const TYPE_QIXIPNT:uint = 22;
        public static const TYPE_SUMMERPNT:uint = 23;
        public static const TYPE_ANNUAL_THIRD:uint = 25;
        public static const TYPE_PET_ARENA:uint = 26;
        public static const TYPE_NORMAL_CONTRIB:uint = 28;
        public static const TYPE_DONATE_CONTRIB:uint = 29;
        public static const TYPE_XMASPNT:uint = 30;
        public static const TYPE_GROUPPVPPNT:uint = 34;
        public static const TYPE_NATIONALDAY:uint = 37;
        public static const TYPE_PET_CHIP:uint = 38;
        public static const TYPE_WORLD_CUP:uint = 41;
        public static const TYPE_GOLD_WORLD_CUP:uint = 42;
        public static const TYPE_SUMMER_GAME:uint = 43;
        public static const TYPE_DOUBLE_11:uint = 58;
        public static const TYPE_EXPLORER_POINT:uint = 59;
        public static const TYPE_SHOWTIME_POINT:uint = 60;
        public static const TYPE_ANNI_POINT:uint = 49;
        public static const TYPE_GOLD_POINT:uint = 61;
        public static const TYPE_ANNI_CONSUME:uint = 62;
        public static const TYPE_MC_BEANS:uint = 64;
        public static const TYPE_PET_ARENA_ACTIVITY:uint = 65;
        public static const TYPE_SHOWTIME_POINT2:uint = 69;
        public static const TYPE_DMBKYSQJ:uint = 70;
        public static const TYPE_DMBKSBJL:uint = 71;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1088739897currencyInput:TextInput;
        private var _2125731805priceType:String = "";
        private var _1065511464textAlign:String = "left";
        private var _3575610type:uint = 0;
        private var _111972721value:Number = 0;
        public var minValue:Number = 0;
        private var _623225833inputEnabled:Boolean = false;
        public var _Currency_TextInput2:TextInput;
        public var _Currency_Image1:Image;
        private var _291785097showBorder:Boolean = false;
        public var maxValue:Number = 1.79769313486232E308;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":131,
                    "height":20,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"_Currency_Image1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":16,
                                "height":16,
                                "y":1,
                                "x":-5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"currencyInput",
                        "events":{"change":"__currencyInput_change"},
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                            this.left = "12";
                            this.disabledColor = 0xFFFFFF;
                            this.color = 0xFFFFFF;
                            this.fontSize = 10;
                            this.fontFamily = "Arial";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "restrict":"0-9",
                                "maxChars":10,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"_Currency_TextInput2",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":62,
                                "y":1,
                                "height":18,
                                "width":66,
                                "visible":false
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

        public function Currency()
        {
            mx_internal::_document = this;
            this.width = 131;
            this.height = 20;
            this.addEventListener("creationComplete", ___Currency_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            Currency._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get showBorder():Boolean
        {
            return (this._291785097showBorder);
        }

        override public function initialize():void
        {
            var target:Currency;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _Currency_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CurrencyWatcherSetupUtil");
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

        public function set showBorder(_arg_1:Boolean):void
        {
            var _local_2:Object = this._291785097showBorder;
            if (_local_2 !== _arg_1)
            {
                this._291785097showBorder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBorder", _local_2, _arg_1));
            };
        }

        private function imgSrc(_arg_1:int):Class
        {
            switch (_arg_1)
            {
                case TYPE_MONEY:
                    return (ResManager.ICON_CURRENCY_MONEY);
                case TYPE_GOLD:
                case TYPE_GOLD_POINT:
                    return (ResManager.ICON_CURRENCY_GOLD);
                case TYPE_MONEY_BIND:
                    return (ResManager.ICON_CURRENCY_MONEY_BIND);
                case TYPE_GOLD_BIND:
                    return (ResManager.ICON_CURRENCY_GOLD_BIND);
                case TYPE_HONOR:
                    return (ResManager.ICON_CURRENCY_HONOR);
                case TYPE_POINT:
                    return (ResManager.ICON_CURRENCY_SKILL);
                case TYPE_EXP:
                    return (ResManager.ICON_CURRENCY_EXP);
                case TYPE_MONEYALL:
                    return (ResManager.ICON_CURRENCY_MONEY_ALL);
                case TYPE_GOLDALL:
                    return (ResManager.ICON_CURRENCY_GOLD_ALL);
                case TYPE_EXPBATTLE:
                    return (ResManager.ICON_CURRENCY_EXPBATTLE);
                case TYPE_ACTPOINT:
                    return (ResManager.ICON_CURRENCY_ACTPOINT);
                case TYPE_EXPOINT:
                    return (ResManager.ICON_CURRENCY_EXPOINT);
                case TYPE_DOGMEDAL:
                case TYPE_ANNI_CONSUME:
                case TYPE_MC_BEANS:
                    return (ResManager.ICON_CURRENCY_DOGMEDAL);
                case TYPE_PET_ARENA_ACTIVITY:
                case TYPE_BTPOINT:
                case TYPE_PET_ARENA:
                    return (ResManager.ICON_CURRENCY_BTPOINT);
                case TYPE_ACHILLESMEDAL:
                    return (ResManager.ICON_CURRENCY_ACHILLESMEDAL);
                case TYPE_NEWYEARPNT:
                case TYPE_LUNAYEARPNT:
                case TYPE_VALENTINEPNT:
                case TYPE_LANTERNPNT:
                case TYPE_LABORPNT:
                case TYPE_FISHINGPNT:
                case TYPE_QIXIPNT:
                case TYPE_SUMMERPNT:
                case TYPE_ANNUAL_THIRD:
                case TYPE_NORMAL_CONTRIB:
                case TYPE_DONATE_CONTRIB:
                case TYPE_XMASPNT:
                case TYPE_SUMMER_GAME:
                case TYPE_NATIONALDAY:
                case TYPE_PET_CHIP:
                case TYPE_DOUBLE_11:
                case TYPE_ANNI_POINT:
                    return (ResManager.ICON_CURRENCY_FESTIVALPOINT);
                case TYPE_GROUPPVPPNT:
                    return (ResManager.ICON_PVP_DOGMEDAL);
                case TYPE_WORLD_CUP:
                    return (ResManager.ICON_WORLD_CUP);
                case TYPE_GOLD_WORLD_CUP:
                    return (ResManager.ICON_WORLD_CUP_GOLD);
            };
            return (ResManager.ICON_CURRENCY_MONEY);
        }

        [Bindable(event="propertyChange")]
        public function get priceType():String
        {
            return (this._2125731805priceType);
        }

        [Bindable(event="propertyChange")]
        public function get inputEnabled():Boolean
        {
            return (this._623225833inputEnabled);
        }

        private function _Currency_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((showBorder) ? "solid" : "none");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                this.setStyle("borderStyle", _arg_1);
            }, "this.borderStyle");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((genToolTip(type) + ":") + value.toString());
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                this.toolTip = _arg_1;
            }, "this.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (imgSrc(type));
            }, function (_arg_1:Object):void
            {
                _Currency_Image1.source = _arg_1;
            }, "_Currency_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (inputEnabled);
            }, function (_arg_1:Boolean):void
            {
                currencyInput.enabled = _arg_1;
            }, "currencyInput.enabled");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                currencyInput.filters = _arg_1;
            }, "currencyInput.filters");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = textAlign;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currencyInput.setStyle("textAlign", _arg_1);
            }, "currencyInput.textAlign");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = value.toString();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currencyInput.text = _arg_1;
            }, "currencyInput.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = priceType.toString();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _Currency_TextInput2.text = _arg_1;
            }, "_Currency_TextInput2.text");
            result[7] = binding;
            return (result);
        }

        public function set inputEnabled(_arg_1:Boolean):void
        {
            var _local_2:Object = this._623225833inputEnabled;
            if (_local_2 !== _arg_1)
            {
                this._623225833inputEnabled = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputEnabled", _local_2, _arg_1));
            };
        }

        public function set textAlign(_arg_1:String):void
        {
            var _local_2:Object = this._1065511464textAlign;
            if (_local_2 !== _arg_1)
            {
                this._1065511464textAlign = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textAlign", _local_2, _arg_1));
            };
        }

        private function setBorder():void
        {
            if (!inputEnabled)
            {
                currencyInput.setStyle("borderSkin", HaloBorder);
                currencyInput.setStyle("backgroundAlpha", 0);
                currencyInput.setStyle("textIndent", 0);
                currencyInput.validateNow();
            };
        }

        [Bindable(event="propertyChange")]
        public function get currencyInput():TextInput
        {
            return (this._1088739897currencyInput);
        }

        [Bindable(event="propertyChange")]
        public function get type():uint
        {
            return (this._3575610type);
        }

        public function ___Currency_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            setBorder();
        }

        public function set priceType(_arg_1:String):void
        {
            var _local_2:Object = this._2125731805priceType;
            if (_local_2 !== _arg_1)
            {
                this._2125731805priceType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "priceType", _local_2, _arg_1));
            };
        }

        public function __currencyInput_change(_arg_1:Event):void
        {
            onChange(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get textAlign():String
        {
            return (this._1065511464textAlign);
        }

        public function set value(_arg_1:Number):void
        {
            var _local_2:Object = this._111972721value;
            if (_local_2 !== _arg_1)
            {
                this._111972721value = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "value", _local_2, _arg_1));
            };
        }

        private function _Currency_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ((showBorder) ? "solid" : "none");
            _local_1 = ((genToolTip(type) + ":") + value.toString());
            _local_1 = imgSrc(type);
            _local_1 = inputEnabled;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = textAlign;
            _local_1 = value.toString();
            _local_1 = priceType.toString();
        }

        private function onChange(_arg_1:Event):void
        {
            value = Math.round(Number(currencyInput.text));
            if (value > maxValue)
            {
                value = maxValue;
            };
            if (value < minValue)
            {
                value = minValue;
            };
            dispatchEvent(_arg_1.clone());
        }

        [Bindable(event="propertyChange")]
        public function get value():Number
        {
            return (this._111972721value);
        }

        public function set currencyInput(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1088739897currencyInput;
            if (_local_2 !== _arg_1)
            {
                this._1088739897currencyInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currencyInput", _local_2, _arg_1));
            };
        }

        public function genToolTip(_arg_1:uint):String
        {
            return (GamePredef.CURRENCY_TIP[_arg_1]);
        }

        public function set type(_arg_1:uint):void
        {
            var _local_2:Object = this._3575610type;
            if (_local_2 !== _arg_1)
            {
                this._3575610type = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "type", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

