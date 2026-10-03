// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TXKCEXPPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.NumericStepperEvent;
    import mx.controls.Alert;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.CloseEvent;
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

    public class TXKCEXPPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1015250370levelUpDesc2:Label;
        private var _3525ns:NumericStepper;
        public var _TXKCEXPPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _729542621btn_confirm:BasicGlowButton;
        private var _1833865328levelUpDesc:Label;
        private var _921340501btn_close:BasicGlowButton;
        public var exeFunc:Function;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":292,
                    "height":170,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TXKCEXPPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.top = "44";
                            this.left = "5";
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"DescriptionText",
                                "text":"Chọn mua exp, 300 Vàng=500 EXP"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.top = "77";
                            this.left = "7";
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"DescriptionText",
                                "text":"EXP:"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"ns",
                        "events":{"change":"__ns_change"},
                        "stylesFactory":function ():void
                        {
                            this.top = "77";
                            this.left = "47.8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "minimum":500,
                                "maximum":35000,
                                "value":500,
                                "stepSize":500,
                                "width":96.2
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"levelUpDesc",
                        "stylesFactory":function ():void
                        {
                            this.top = "71";
                            this.left = "157";
                            this.fontSize = 14;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"DescriptionText",
                                "text":"Tăng 1 cấp"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"levelUpDesc2",
                        "stylesFactory":function ():void
                        {
                            this.top = "93";
                            this.left = "157";
                            this.fontSize = 14;
                            this.color = 0xFF0000;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"DescriptionText",
                                "text":"tiêu 300 vàng"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn_close",
                        "events":{"click":"__btn_close_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "168";
                            this.top = "130";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "width":100,
                                "height":26,
                                "label":"Hủy bỏ"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn_confirm",
                        "events":{"click":"__btn_confirm_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.top = "130";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "width":100,
                                "height":26,
                                "label":"Xác nhận"
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

        public function TXKCEXPPanel()
        {
            mx_internal::_document = this;
            this.width = 292;
            this.height = 170;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TXKCEXPPanel._watcherSetupUtil = _arg_1;
        }


        protected function ns_changeHandler(_arg_1:NumericStepperEvent):void
        {
            var _local_2:String;
            if (_arg_1.value > 0)
            {
                _local_2 = String(Math.floor((_arg_1.value / 500)));
                levelUpDesc.text = Language.TXKC_PANEL[16].replace("{num}", _local_2);
                levelUpDesc2.text = Language.TXKC_PANEL[17].replace("{num}", (int(_local_2) * 300));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levelUpDesc2():Label
        {
            return (this._1015250370levelUpDesc2);
        }

        protected function btn_confirm_clickHandler(_arg_1:MouseEvent):void
        {
            if ((ns.value % 500) != 0)
            {
                return;
            };
            var _local_2:String = String(Math.floor((ns.value / 500)));
            var _local_3:String = Language.TXKC_PANEL[18].replace("{num}", (int(_local_2) * 300)).replace("{num2}", ns.value).replace("{num3}", _local_2);
            Alert.show(_local_3, "!!", (Alert.YES | Alert.NO), null, _buyExp);
        }

        private function _TXKCEXPPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TXKC_PANEL[15];
        }

        public function __ns_change(_arg_1:NumericStepperEvent):void
        {
            ns_changeHandler(_arg_1);
        }

        public function set levelUpDesc2(_arg_1:Label):void
        {
            var _local_2:Object = this._1015250370levelUpDesc2;
            if (_local_2 !== _arg_1)
            {
                this._1015250370levelUpDesc2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelUpDesc2", _local_2, _arg_1));
            };
        }

        protected function btn_close_clickHandler(_arg_1:MouseEvent):void
        {
            this.hide();
        }

        public function __btn_confirm_click(_arg_1:MouseEvent):void
        {
            btn_confirm_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btn_close():BasicGlowButton
        {
            return (this._921340501btn_close);
        }

        private function _buyExp(_arg_1:CloseEvent):void
        {
            var _local_2:int;
            if (_arg_1.detail == Alert.YES)
            {
                if (exeFunc)
                {
                    _local_2 = int(Math.floor((ns.value / 500)));
                    exeFunc(_local_2);
                    this.hide();
                };
            };
        }

        override public function initialize():void
        {
            var target:TXKCEXPPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TXKCEXPPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TXKCEXPPanelWatcherSetupUtil");
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

        public function set levelUpDesc(_arg_1:Label):void
        {
            var _local_2:Object = this._1833865328levelUpDesc;
            if (_local_2 !== _arg_1)
            {
                this._1833865328levelUpDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelUpDesc", _local_2, _arg_1));
            };
        }

        private function _TXKCEXPPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TXKC_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TXKCEXPPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TXKCEXPPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            return (result);
        }

        public function set ns(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._3525ns;
            if (_local_2 !== _arg_1)
            {
                this._3525ns = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns():NumericStepper
        {
            return (this._3525ns);
        }

        [Bindable(event="propertyChange")]
        public function get levelUpDesc():Label
        {
            return (this._1833865328levelUpDesc);
        }

        public function set btn_close(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._921340501btn_close;
            if (_local_2 !== _arg_1)
            {
                this._921340501btn_close = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_close", _local_2, _arg_1));
            };
        }

        public function set btn_confirm(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._729542621btn_confirm;
            if (_local_2 !== _arg_1)
            {
                this._729542621btn_confirm = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_confirm", _local_2, _arg_1));
            };
        }

        public function __btn_close_click(_arg_1:MouseEvent):void
        {
            btn_close_clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btn_confirm():BasicGlowButton
        {
            return (this._729542621btn_confirm);
        }


    }
}//package com.qeedoo.ui.view.compDragable

