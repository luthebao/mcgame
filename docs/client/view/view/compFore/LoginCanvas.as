// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compFore.LoginCanvas

package com.qeedoo.ui.view.compFore
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.effects.Fade;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import flash.net.URLLoader;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.Event;
    import mx.managers.ToolTipManager;
    import mx.core.Application;
    import flash.net.SharedObject;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import com.qeedoo.ui.view.compMain.WaitingPanel;
    import com.adobe.crypto.MD5;
    import flash.utils.setTimeout;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Version;
    import flash.utils.getDefinitionByName;
    import flash.utils.clearTimeout;
    import flash.events.TimerEvent;
    import mx.controls.Alert;
    import mx.binding.BindingManager;
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

    public class LoginCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const LOGIN_DELAY:Number = 3000;
        private var _1282133823fadeIn:Fade;
        private var _93647166bgImg:Image;
        private var _2090736237btnLogin:BasicDelayButton;
        private var _1378823016btnReg:BasicGlowButton;
        private var _1024969555cbSavePass:CheckBox;
        private var _153616736httpCheck:CheckBox;
        private var _181384528canvasLogined:Canvas;
        public var _LoginCanvas_BasicTxtButton1:BasicTxtButton;
        public var _LoginCanvas_BasicGlowButton1:BasicGlowButton;
        public var _LoginCanvas_BasicGlowButton2:BasicGlowButton;
        public var _LoginCanvas_BasicGlowButton3:BasicGlowButton;
        public var _LoginCanvas_BasicTxtButton2:BasicTxtButton;
        public var _LoginCanvas_BasicTxtButton3:BasicTxtButton;
        public var _LoginCanvas_RoundedLabel2:RoundedLabel;
        private var _1391914402bgIcon:Image;
        private var _1706834683inputPass:TextInput;
        private var _1707000501inputUser:TextInput;
        private var _1025029337cbSaveName:CheckBox;
        private var _3641990warn:RoundedLabel;
        private var _forceHandler:uint;
        private var _1890311951canvasLogin:Canvas;
        private var _642554749systemInfo:LinkTextArea;
        private var _lastLogin:Number;
        public var _LoginCanvas_Image3:Image;
        private var _732738989sysInfoCanvas:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":900,
                    "height":570,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"bgImg",
                        "events":{"complete":"__bgImg_complete"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"warn",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "y":440
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"bgIcon",
                        "stylesFactory":function ():void
                        {
                            this.right = "15";
                            this.bottom = "70";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":60,
                                "height":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvasLogined",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":true,
                                "width":205,
                                "height":110,
                                "styleName":"ButtonWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_LoginCanvas_BasicGlowButton1",
                                    "events":{"click":"___LoginCanvas_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":120,
                                            "y":20,
                                            "styleName":"LoginButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_LoginCanvas_BasicGlowButton2",
                                    "events":{"click":"___LoginCanvas_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":80,
                                            "y":65,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvasLogin",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "styleName":"CanvasLogined",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "tabChildren":true,
                                "x":300,
                                "width":287,
                                "height":130,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":3,
                                            "styleName":"CanvasLoginTitle",
                                            "width":81,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_LoginCanvas_BasicGlowButton3",
                                    "events":{"click":"___LoginCanvas_BasicGlowButton3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":185,
                                            "y":95,
                                            "width":83,
                                            "height":27,
                                            "styleName":"LoginButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "id":"btnLogin",
                                    "events":{"click":"__btnLogin_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":5000,
                                            "x":20,
                                            "y":95,
                                            "styleName":"LoginButton",
                                            "width":64,
                                            "height":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnReg",
                                    "events":{"click":"__btnReg_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "enabled":true,
                                            "x":103,
                                            "y":95,
                                            "styleName":"LoginButton",
                                            "width":64,
                                            "height":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"inputUser",
                                    "events":{"keyDown":"__inputUser_keyDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.cornerRadius = 0;
                                        this.borderStyle = "none";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":110,
                                            "styleName":"LoginInputBox",
                                            "maxChars":50,
                                            "x":65,
                                            "y":37,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"inputPass",
                                    "events":{"keyDown":"__inputPass_keyDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.cornerRadius = 0;
                                        this.borderStyle = "none";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":110,
                                            "styleName":"LoginInputBox",
                                            "displayAsPassword":true,
                                            "maxChars":20,
                                            "x":65,
                                            "y":67,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"cbSaveName",
                                    "events":{"change":"__cbSaveName_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":185,
                                            "y":40,
                                            "label":"",
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"cbSavePass",
                                    "events":{"change":"__cbSavePass_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "visible":false,
                                            "x":183,
                                            "y":93,
                                            "label":"",
                                            "width":15
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_LoginCanvas_BasicTxtButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":40,
                                            "width":40,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_LoginCanvas_BasicTxtButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":20,
                                            "y":70,
                                            "width":40,
                                            "height":18
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicTxtButton,
                                    "id":"_LoginCanvas_BasicTxtButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 0;
                                        this.paddingRight = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":205,
                                            "y":40,
                                            "width":70,
                                            "height":18
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"sysInfoCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":184.5,
                                "y":90,
                                "width":531,
                                "height":270,
                                "styleName":"PanelAnnouncement",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"systemInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.top = "25";
                                        this.bottom = "15";
                                        this.backgroundAlpha = 0;
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":28,
                                            "width":475,
                                            "text":"",
                                            "selectable":false,
                                            "editable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"_LoginCanvas_Image3",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":10});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_LoginCanvas_RoundedLabel2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":719,
                                "y":542,
                                "width":171
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"httpCheck",
                        "events":{"change":"__httpCheck_change"},
                        "stylesFactory":function ():void
                        {
                            this.color = 11149892;
                            this.fontSize = 15;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":9.95,
                                "y":538
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LoginCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.verticalCenter = "0";
                this.horizontalCenter = "0";
                this.borderThickness = 2;
            };
            this.width = 900;
            this.height = 570;
            _LoginCanvas_Fade1_i();
            this.addEventListener("show", ___LoginCanvas_Canvas1_show);
            this.addEventListener("hide", ___LoginCanvas_Canvas1_hide);
            this.addEventListener("creationComplete", ___LoginCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LoginCanvas._watcherSetupUtil = _arg_1;
        }


        public function __btnReg_click(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(GamePredef.SERVER_ADD_REG), "_blank");
        }

        public function ___LoginCanvas_Canvas1_hide(_arg_1:FlexEvent):void
        {
            onHide();
        }

        public function set systemInfo(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._642554749systemInfo;
            if (_local_2 !== _arg_1)
            {
                this._642554749systemInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "systemInfo", _local_2, _arg_1));
            };
        }

        private function loadSystemInfo():void
        {
            var _local_1:URLLoader = new URLLoader();
            _local_1.addEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
            _local_1.addEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            _local_1.addEventListener(Event.COMPLETE, loadCompleteHandler);
            _local_1.load(new URLRequest(GamePredef.PATH_INFO));
        }

        private function loadCompleteHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
            _arg_1.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            _arg_1.currentTarget.removeEventListener(Event.COMPLETE, loadCompleteHandler);
            systemInfo.htmlText = (("<font color='#FFFFFF'>" + _arg_1.currentTarget.data) + "</font>");
        }

        public function set warn(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3641990warn;
            if (_local_2 !== _arg_1)
            {
                this._3641990warn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "warn", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            loadInfo();
            onShow();
            systemInfo.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            ToolTipManager.enabled = true;
            if (canvasLogin.visible)
            {
                if (cbSaveName.selected)
                {
                    Application.application.focusManager.setFocus(inputPass);
                }
                else
                {
                    Application.application.focusManager.setFocus(inputUser);
                };
            };
        }

        private function savePassInfo(_arg_1:SharedObject):void
        {
            _arg_1.data.savePassInfo = true;
            _arg_1.data.pass = inputPass.text;
        }

        public function __btnLogin_click(_arg_1:MouseEvent):void
        {
            login();
        }

        public function connectForClassify():void
        {
            var _local_1:String;
        }

        [Bindable(event="propertyChange")]
        public function get cbSaveName():CheckBox
        {
            return (this._1025029337cbSaveName);
        }

        private function loadErrorHandler(_arg_1:IOErrorEvent):void
        {
            _arg_1.currentTarget.removeEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
            _arg_1.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            _arg_1.currentTarget.removeEventListener(Event.COMPLETE, loadCompleteHandler);
            systemInfo.text = Language.LOGINCANVAS_S[3];
        }

        private function selectNetEnv(_arg_1:Event):void
        {
            sysInfoCanvas.visible = false;
            _core.view.show(ViewManager.POPU_NET_SELECT);
        }

        public function __inputUser_keyDown(_arg_1:KeyboardEvent):void
        {
            if (((_arg_1.keyCode == Keyboard.TAB) || (_arg_1.keyCode == Keyboard.ENTER)))
            {
                inputPass.setFocus();
            };
        }

        private function savePassHandler():void
        {
            var _local_1:SharedObject = SharedObject.getLocal("loginPassInfo");
            if (cbSavePass.selected)
            {
                savePassInfo(_local_1);
            }
            else
            {
                _local_1.clear();
            };
        }

        private function forceLogin():void
        {
            var _local_1:WaitingPanel = WaitingPanel(_core.view.getUI(ViewManager.POPU_WAIT));
            if (_local_1)
            {
                _local_1.showText("Người chơi đã offline, vui lòng làm mới trình duyệt để đăng nhập.");
                _local_1.showTime(20);
            };
            _core.ipWarnFlag = false;
            _core.global.showAlert = false;
            _core.global.connect(GamePredef.SERVER_ADD_GLOBAL, ["F", _core.user, _core.pass, _core.time, _core.by_session, MD5.hash((GamePredef.msg_button + GamePredef.msg_chanel))]);
            _core.delPass = null;
            clearForce();
            _forceHandler = setTimeout(loginLater, 19800);
        }

        public function set btnReg(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1378823016btnReg;
            if (_local_2 !== _arg_1)
            {
                this._1378823016btnReg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReg", _local_2, _arg_1));
            };
        }

        private function saveUserHandler():void
        {
            var _local_1:SharedObject = SharedObject.getLocal("loginUserInfo");
            if (cbSaveName.selected)
            {
                saveUserInfo(_local_1);
            }
            else
            {
                _local_1.clear();
            };
        }

        [Bindable(event="propertyChange")]
        public function get bgImg():Image
        {
            return (this._93647166bgImg);
        }

        private function configConnectMethod():void
        {
            var _local_1:String;
            switch (GamePredef.CONNECT_METHOD)
            {
                case GamePredef.CONNECT_BY_DOMAIN:
                    break;
                case GamePredef.CONNECT_BY_CNC:
                    _local_1 = GamePredef.SP_CNC;
                    break;
                case GamePredef.CONNECT_BY_CH_TELCOM:
                    _local_1 = GamePredef.SP_TEL;
                    break;
            };
            if (_local_1 == null)
            {
                if (GamePredef.SERVER_ISACTING == false)
                {
                    GamePredef.SERVER_ADD_GLOBAL = (GamePredef.SERVER_PROTOCAL_LOGIC + GamePredef.SERVER_ADD_GLO);
                    trace(GamePredef.SERVER_ADD_GLOBAL);
                }
                else
                {
                    GamePredef.SERVER_ADD_GLOBAL = (GamePredef.SERVER_PROTOCAL_LOGIC2 + GamePredef.SERVER_ADD_GLO);
                    trace(GamePredef.SERVER_ADD_GLOBAL);
                };
                return;
            };
            var _local_2:String = GamePredef.ipList[_local_1];
            if (_local_2 == null)
            {
                return;
            };
            if (GamePredef.SERVER_ISACTING == false)
            {
                GamePredef.SERVER_ADD_GLOBAL = (((GamePredef.SERVER_PROTOCAL_LOGIC + _local_2) + ":") + GamePredef.SERVER_PORT_AND_PATH);
                trace(GamePredef.SERVER_ADD_GLOBAL);
            }
            else
            {
                GamePredef.SERVER_ADD_GLOBAL = (((GamePredef.SERVER_PROTOCAL_LOGIC2 + _local_2) + ":") + GamePredef.SERVER_PORT_AND_PATH);
                trace(GamePredef.SERVER_ADD_GLOBAL);
            };
        }

        public function ___LoginCanvas_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            logined();
        }

        public function set cbSaveName(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1025029337cbSaveName;
            if (_local_2 !== _arg_1)
            {
                this._1025029337cbSaveName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbSaveName", _local_2, _arg_1));
            };
        }

        public function __httpCheck_change(_arg_1:Event):void
        {
            useRtmpt();
        }

        private function _LoginCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                warn.text = _arg_1;
            }, "warn.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (bgImg);
            }, function (_arg_1:Object):void
            {
                fadeIn.target = _arg_1;
            }, "fadeIn.target");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicGlowButton1.label = _arg_1;
            }, "_LoginCanvas_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicGlowButton2.label = _arg_1;
            }, "_LoginCanvas_BasicGlowButton2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicGlowButton3.label = _arg_1;
            }, "_LoginCanvas_BasicGlowButton3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_S[8].toString();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicGlowButton3.toolTip = _arg_1;
            }, "_LoginCanvas_BasicGlowButton3.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLogin.label = _arg_1;
            }, "btnLogin.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnReg.label = _arg_1;
            }, "btnReg.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cbSaveName.toolTip = _arg_1;
            }, "cbSaveName.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cbSavePass.toolTip = _arg_1;
            }, "cbSavePass.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicTxtButton1.label = _arg_1;
            }, "_LoginCanvas_BasicTxtButton1.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicTxtButton2.label = _arg_1;
            }, "_LoginCanvas_BasicTxtButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_BasicTxtButton3.label = _arg_1;
            }, "_LoginCanvas_BasicTxtButton3.label");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.IMG_LOGO);
            }, function (_arg_1:Object):void
            {
                _LoginCanvas_Image3.source = _arg_1;
            }, "_LoginCanvas_Image3.source");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Version.VERSION;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LoginCanvas_RoundedLabel2.text = _arg_1;
            }, "_LoginCanvas_RoundedLabel2.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                httpCheck.label = _arg_1;
            }, "httpCheck.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOGINCANVAS_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                httpCheck.toolTip = _arg_1;
            }, "httpCheck.toolTip");
            result[16] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get sysInfoCanvas():Canvas
        {
            return (this._732738989sysInfoCanvas);
        }

        private function loadPingInfo():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get canvasLogined():Canvas
        {
            return (this._181384528canvasLogined);
        }

        public function set cbSavePass(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1024969555cbSavePass;
            if (_local_2 !== _arg_1)
            {
                this._1024969555cbSavePass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbSavePass", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bgIcon():Image
        {
            return (this._1391914402bgIcon);
        }

        [Bindable(event="propertyChange")]
        public function get httpCheck():CheckBox
        {
            return (this._153616736httpCheck);
        }

        public function set inputUser(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1707000501inputUser;
            if (_local_2 !== _arg_1)
            {
                this._1707000501inputUser = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputUser", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLogin():BasicDelayButton
        {
            return (this._2090736237btnLogin);
        }

        private function useRtmpt():void
        {
        }

        private function login():void
        {
            var _local_3:SharedObject;
            _core.ipWarnFlag = false;
            configConnectMethod();
            clearForce();
            var _local_1:Number = new Date().getTime();
            if ((_local_1 - _lastLogin) < LOGIN_DELAY)
            {
                return;
            };
            _lastLogin = _local_1;
            if (_core.remote.nc.connected)
            {
                _core.remote.close();
            };
            var _local_2:Object = _core.view.getUI(ViewManager.POPU_WAIT);
            if (_local_2)
            {
                _local_2.showText(Language.LOGINCANVAS_S[1]);
                _local_2.addTimeOutListener(loginTimeOut, 100);
            };
            _core.user = inputUser.text;
            _core.pass = MD5.hash(inputPass.text);
            connect();
            _core.delPass = null;
            if (cbSaveName.selected)
            {
                _local_3 = SharedObject.getLocal("loginUserInfo");
                saveUserInfo(_local_3);
            };
            if (cbSavePass.selected)
            {
                _local_3 = SharedObject.getLocal("loginPassInfo");
                savePassInfo(_local_3);
            };
        }

        private function _LoginCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.LOGINCANVAS_S[5];
            _local_1 = bgImg;
            _local_1 = Language.LOGINCANVAS_U[3];
            _local_1 = Language.LOGINCANVAS_U[2];
            _local_1 = Language.LOGINCANVAS_U[2];
            _local_1 = Language.LOGINCANVAS_S[8].toString();
            _local_1 = Language.LOGINCANVAS_U[0];
            _local_1 = Language.LOGINCANVAS_U[1];
            _local_1 = Language.LOGINCANVAS_S[6];
            _local_1 = Language.LOGINCANVAS_S[7];
            _local_1 = Language.LOGINCANVAS_U[5];
            _local_1 = Language.LOGINCANVAS_U[6];
            _local_1 = Language.LOGINCANVAS_U[7];
            _local_1 = ResManager.IMG_LOGO;
            _local_1 = Version.VERSION;
            _local_1 = Language.LOGINCANVAS_S[9];
            _local_1 = Language.LOGINCANVAS_S[10];
        }

        public function ___LoginCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __inputPass_keyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.TAB)
            {
                inputUser.setFocus();
            };
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                login();
            };
        }

        public function set fadeIn(_arg_1:Fade):void
        {
            var _local_2:Object = this._1282133823fadeIn;
            if (_local_2 !== _arg_1)
            {
                this._1282133823fadeIn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeIn", _local_2, _arg_1));
            };
        }

        public function onShow():void
        {
            bgImg.source = ResManager.hash(GamePredef.DEFAULT_IMG_LOGIN1);
            bgIcon.source = ResManager.getIconUrl(4130220003343);
            if (_core.urlLogin)
            {
                canvasLogin.visible = false;
                canvasLogined.visible = true;
                warn.visible = false;
            }
            else
            {
                canvasLogin.visible = true;
                canvasLogined.visible = true;
                canvasLogined.visible = false;
                warn.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get systemInfo():LinkTextArea
        {
            return (this._642554749systemInfo);
        }

        [Bindable(event="propertyChange")]
        public function get warn():RoundedLabel
        {
            return (this._3641990warn);
        }

        public function ___LoginCanvas_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            forceLoginClick();
        }

        override public function initialize():void
        {
            var target:LoginCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LoginCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compFore_LoginCanvasWatcherSetupUtil");
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

        public function clearForce():void
        {
            if (_forceHandler > 0)
            {
                clearTimeout(_forceHandler);
                _forceHandler = 0;
            };
        }

        private function loginTimeOut(event:Event):void
        {
            event.target.removeEventListener(TimerEvent.TIMER, loginTimeOut, false);
            event.stopImmediatePropagation();
            Core.getInstance().view.hide(ViewManager.POPU_WAIT);
            var handler:* = function ():*
            {
                if (GamePredef.DOMAIN_IN_LIST == true)
                {
                    Core.getInstance().view.getUI(ViewManager.FORE_L_R).sysInfoCanvas.visible = false;
                    Core.getInstance().remote.nc.client.onLogout;
                    Core.getInstance().view.show(ViewManager.POPU_NET_SELECT);
                };
            };
            Alert.show(Language.LOGINTIMEOUT_S[0], "", Alert.YES, null, handler);
        }

        public function set canvasLogined(_arg_1:Canvas):void
        {
            var _local_2:Object = this._181384528canvasLogined;
            if (_local_2 !== _arg_1)
            {
                this._181384528canvasLogined = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvasLogined", _local_2, _arg_1));
            };
        }

        private function loadProgressHandler(_arg_1:ProgressEvent):void
        {
            systemInfo.text = (((Language.LOGINCANVAS_S[2] + _arg_1.bytesLoaded) + "/") + _arg_1.bytesTotal);
        }

        public function __cbSavePass_change(_arg_1:Event):void
        {
            savePassHandler();
        }

        private function loginLater():void
        {
            if (_core.ready)
            {
                return;
            };
            _core.global.showAlert = true;
            _core.global.close();
            _core.global.connect(GamePredef.SERVER_ADD_GLOBAL, ["G", _core.user, _core.pass, _core.time, _core.by_session, MD5.hash((GamePredef.msg_button + GamePredef.msg_chanel))]);
            _core.delPass = null;
        }

        [Bindable(event="propertyChange")]
        public function get cbSavePass():CheckBox
        {
            return (this._1024969555cbSavePass);
        }

        [Bindable(event="propertyChange")]
        public function get btnReg():BasicGlowButton
        {
            return (this._1378823016btnReg);
        }

        public function set bgImg(_arg_1:Image):void
        {
            var _local_2:Object = this._93647166bgImg;
            if (_local_2 !== _arg_1)
            {
                this._93647166bgImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImg", _local_2, _arg_1));
            };
        }

        private function saveUserInfo(_arg_1:SharedObject):void
        {
            _arg_1.data.saveUserInfo = true;
            _arg_1.data.user = inputUser.text;
        }

        private function loadInfo():void
        {
            var _local_1:SharedObject = SharedObject.getLocal("loginUserInfo");
            if (_local_1.data.saveUserInfo == true)
            {
                cbSaveName.selected = true;
                inputUser.text = _local_1.data.user;
            };
            _local_1 = SharedObject.getLocal("loginPassInfo");
            if (_local_1.data.savePassInfo == true)
            {
                cbSavePass.selected = true;
                inputPass.text = _local_1.data.pass;
            };
            loadSystemInfo();
        }

        public function set bgIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1391914402bgIcon;
            if (_local_2 !== _arg_1)
            {
                this._1391914402bgIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgIcon", _local_2, _arg_1));
            };
        }

        private function onHide():void
        {
            if (_core.view.getUI(ViewManager.POPU_WAIT))
            {
                _core.view.getUI(ViewManager.POPU_WAIT).removeTimeOutListener(loginTimeOut);
            };
            bgImg.source = (bgIcon.source = null);
        }

        public function ___LoginCanvas_Canvas1_show(_arg_1:FlexEvent):void
        {
            onShow();
        }

        public function logined():void
        {
            configConnectMethod();
            var _local_1:Number = new Date().getTime();
            if ((_local_1 - _lastLogin) < LOGIN_DELAY)
            {
                return;
            };
            _lastLogin = _local_1;
            if (_core.remote.nc.connected)
            {
                _core.remote.close();
            };
            var _local_2:Object = _core.view.getUI(ViewManager.POPU_WAIT);
            if (_local_2)
            {
                _local_2.showText(Language.LOGINCANVAS_S[0]);
            };
            connect();
            _core.delPass = null;
        }

        public function ___LoginCanvas_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            forceLoginClick();
        }

        [Bindable(event="propertyChange")]
        public function get inputUser():TextInput
        {
            return (this._1707000501inputUser);
        }

        public function set httpCheck(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._153616736httpCheck;
            if (_local_2 !== _arg_1)
            {
                this._153616736httpCheck = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "httpCheck", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fadeIn():Fade
        {
            return (this._1282133823fadeIn);
        }

        private function _LoginCanvas_Fade1_i():Fade
        {
            var _local_1:Fade = new Fade();
            fadeIn = _local_1;
            _local_1.alphaFrom = 0;
            _local_1.alphaTo = 1;
            BindingManager.executeBindings(this, "fadeIn", fadeIn);
            return (_local_1);
        }

        private function syncAccountHandler():void
        {
        }

        public function set sysInfoCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._732738989sysInfoCanvas;
            if (_local_2 !== _arg_1)
            {
                this._732738989sysInfoCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sysInfoCanvas", _local_2, _arg_1));
            };
        }

        public function set canvasLogin(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1890311951canvasLogin;
            if (_local_2 !== _arg_1)
            {
                this._1890311951canvasLogin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvasLogin", _local_2, _arg_1));
            };
        }

        public function __cbSaveName_change(_arg_1:Event):void
        {
            saveUserHandler();
        }

        public function connect():void
        {
            var _local_1:String;
            _local_1 = GamePredef.SERVER_ADD_GLOBAL;
            if (((GamePredef.SERVER_ADD_PROXY) && (GamePredef.SERVER_USE_PROXYSERVER)))
            {
                _local_1 = GamePredef.SERVER_ADD_GLOBAL;
                if (GamePredef.SERVER_ISACTING == false)
                {
                    _local_1 = (((GamePredef.SERVER_PROTOCAL_LOGIC + GamePredef.SERVER_ADD_PROXY) + "/?") + GamePredef.SERVER_ADD_GLOBAL);
                }
                else
                {
                    _local_1 = (((GamePredef.SERVER_PROTOCAL_LOGIC2 + GamePredef.SERVER_ADD_PROXY) + "/?") + GamePredef.SERVER_ADD_GLOBAL);
                };
            };
            trace(_local_1);
            _core.global.connect(_local_1, ["G", _core.user, _core.pass, _core.time, _core.by_session, MD5.hash((GamePredef.msg_button + GamePredef.msg_chanel))]);
        }

        public function set btnLogin(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._2090736237btnLogin;
            if (_local_2 !== _arg_1)
            {
                this._2090736237btnLogin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLogin", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvasLogin():Canvas
        {
            return (this._1890311951canvasLogin);
        }

        private function forceLoginClick():void
        {
            if (!_core.urlLogin)
            {
                _core.user = inputUser.text;
                _core.pass = MD5.hash(inputPass.text);
            };
            forceLogin();
        }

        public function __bgImg_complete(_arg_1:Event):void
        {
            fadeIn.stop();
            fadeIn.play();
        }

        [Bindable(event="propertyChange")]
        public function get inputPass():TextInput
        {
            return (this._1706834683inputPass);
        }

        public function set inputPass(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1706834683inputPass;
            if (_local_2 !== _arg_1)
            {
                this._1706834683inputPass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputPass", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compFore

