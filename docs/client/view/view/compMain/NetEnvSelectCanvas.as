// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.NetEnvSelectCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.RadioButtonGroup;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import mx.controls.RadioButton;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.system.Core;
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

    public class NetEnvSelectCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _390366281envSelect:RadioButtonGroup;
        public var _NetEnvSelectCanvas_RoundedButton1:RoundedButton;
        public var _NetEnvSelectCanvas_RoundedButton2:RoundedButton;
        private var _296980185useProxy:RadioButton;
        private var _3005871auto:RadioButton;
        private var _98648cnc:RadioButton;
        private var _94641558chtel:RadioButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "events":{"creationComplete":"___NetEnvSelectCanvas_Canvas2_creationComplete"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "-8";
                            this.backgroundAlpha = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":220,
                                "height":202,
                                "styleName":"CanvasChooseChannel",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedButton,
                                    "id":"_NetEnvSelectCanvas_RoundedButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":1,
                                            "width":150,
                                            "styleName":"StripeButton",
                                            "enabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{
                                        "mouseDown":"___NetEnvSelectCanvas_Button1_mouseDown",
                                        "click":"___NetEnvSelectCanvas_Button1_click"
                                    },
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "4";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":17,
                                            "styleName":"BtnPanelClose"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"auto",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":54,
                                            "groupName":"envSelect"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"cnc",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":82,
                                            "groupName":"envSelect"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"chtel",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":25.8,
                                            "y":110,
                                            "groupName":"envSelect"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"useProxy",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":135,
                                            "label":"以上都不行,就试试这个",
                                            "groupName":"envSelect",
                                            "value":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedButton,
                                    "id":"_NetEnvSelectCanvas_RoundedButton2",
                                    "events":{"click":"___NetEnvSelectCanvas_RoundedButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":157,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function NetEnvSelectCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
            };
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.cacheAsBitmap = true;
            _NetEnvSelectCanvas_RadioButtonGroup1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NetEnvSelectCanvas._watcherSetupUtil = _arg_1;
        }


        private function hide():void
        {
            this.visible = false;
        }

        public function ___NetEnvSelectCanvas_RoundedButton2_click(_arg_1:MouseEvent):void
        {
            saveHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get envSelect():RadioButtonGroup
        {
            return (this._390366281envSelect);
        }

        public function ___NetEnvSelectCanvas_Button1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function saveHandler(_arg_1:Event):void
        {
            if (envSelect.selection == null)
            {
                GamePredef.CONNECT_METHOD = GamePredef.CONNECT_BY_DOMAIN;
                GamePredef.SERVER_USE_PROXYSERVER = false;
            }
            else
            {
                if (10 == int(envSelect.selection.value))
                {
                    GamePredef.CONNECT_METHOD = GamePredef.CONNECT_BY_DOMAIN;
                    GamePredef.SERVER_USE_PROXYSERVER = true;
                }
                else
                {
                    GamePredef.CONNECT_METHOD = int(envSelect.selection.value);
                    GamePredef.SERVER_USE_PROXYSERVER = false;
                };
            };
            close(_arg_1);
        }

        override public function initialize():void
        {
            var target:NetEnvSelectCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NetEnvSelectCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_NetEnvSelectCanvasWatcherSetupUtil");
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

        public function set envSelect(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._390366281envSelect;
            if (_local_2 !== _arg_1)
            {
                this._390366281envSelect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "envSelect", _local_2, _arg_1));
            };
        }

        public function set useProxy(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._296980185useProxy;
            if (_local_2 !== _arg_1)
            {
                this._296980185useProxy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useProxy", _local_2, _arg_1));
            };
        }

        private function init(_arg_1:Event):void
        {
            if (GamePredef.SERVER_ADD_PROXY)
            {
                useProxy.visible = true;
            };
            if (((GamePredef.SERVER_ADD_PROXY) && (GamePredef.SERVER_USE_PROXYSERVER)))
            {
                envSelect.selection = useProxy;
            }
            else
            {
                switch (GamePredef.CONNECT_METHOD)
                {
                    case GamePredef.CONNECT_BY_CH_TELCOM:
                        envSelect.selection = chtel;
                        return;
                    case GamePredef.CONNECT_BY_CNC:
                        envSelect.selection = cnc;
                        return;
                    case GamePredef.CONNECT_BY_DOMAIN:
                        envSelect.selection = auto;
                        return;
                };
            };
        }

        public function ___NetEnvSelectCanvas_Canvas2_creationComplete(_arg_1:FlexEvent):void
        {
            init(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get chtel():RadioButton
        {
            return (this._94641558chtel);
        }

        public function set auto(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._3005871auto;
            if (_local_2 !== _arg_1)
            {
                this._3005871auto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "auto", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cnc():RadioButton
        {
            return (this._98648cnc);
        }

        [Bindable(event="propertyChange")]
        public function get useProxy():RadioButton
        {
            return (this._296980185useProxy);
        }

        private function _NetEnvSelectCanvas_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            envSelect = _local_1;
            _local_1.initialized(this, "envSelect");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get auto():RadioButton
        {
            return (this._3005871auto);
        }

        public function set cnc(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._98648cnc;
            if (_local_2 !== _arg_1)
            {
                this._98648cnc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cnc", _local_2, _arg_1));
            };
        }

        public function set chtel(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._94641558chtel;
            if (_local_2 !== _arg_1)
            {
                this._94641558chtel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chtel", _local_2, _arg_1));
            };
        }

        private function _NetEnvSelectCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NETENVSELECTCANVAS_S[3];
            _local_1 = Language.NETENVSELECTCANVAS_S[0];
            _local_1 = GamePredef.CONNECT_BY_DOMAIN;
            _local_1 = Language.NETENVSELECTCANVAS_S[1];
            _local_1 = GamePredef.CONNECT_BY_CNC;
            _local_1 = Language.NETENVSELECTCANVAS_S[2];
            _local_1 = GamePredef.CONNECT_BY_CH_TELCOM;
            _local_1 = Language.NETENVSELECTCANVAS_U[0];
        }

        private function close(_arg_1:Event):void
        {
            hide();
            Core.getInstance().view.getUI(ViewManager.FORE_L_R).sysInfoCanvas.visible = true;
        }

        private function _NetEnvSelectCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NETENVSELECTCANVAS_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NetEnvSelectCanvas_RoundedButton1.label = _arg_1;
            }, "_NetEnvSelectCanvas_RoundedButton1.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NETENVSELECTCANVAS_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                auto.label = _arg_1;
            }, "auto.label");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (GamePredef.CONNECT_BY_DOMAIN);
            }, function (_arg_1:Object):void
            {
                auto.value = _arg_1;
            }, "auto.value");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NETENVSELECTCANVAS_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cnc.label = _arg_1;
            }, "cnc.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (GamePredef.CONNECT_BY_CNC);
            }, function (_arg_1:Object):void
            {
                cnc.value = _arg_1;
            }, "cnc.value");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NETENVSELECTCANVAS_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                chtel.label = _arg_1;
            }, "chtel.label");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (GamePredef.CONNECT_BY_CH_TELCOM);
            }, function (_arg_1:Object):void
            {
                chtel.value = _arg_1;
            }, "chtel.value");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NETENVSELECTCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NetEnvSelectCanvas_RoundedButton2.label = _arg_1;
            }, "_NetEnvSelectCanvas_RoundedButton2.label");
            result[7] = binding;
            return (result);
        }

        public function ___NetEnvSelectCanvas_Button1_click(_arg_1:MouseEvent):void
        {
            close(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compMain

