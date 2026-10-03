// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DPassPanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.ToolTip;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import flash.geom.Point;
    import mx.managers.ToolTipManager;
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

    public class DPassPanel extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _DPassPanel_BasicGlowButton2:BasicGlowButton;
        private var _1415729736txtOldPass:TextInput;
        private var state:int;
        private var _345368897txtNewPass:TextInput;
        private var _685155285txtNewSecondPass:TextInput;
        public var _DPassPanel_BasicTxtButton1:BasicTxtButton;
        public var _DPassPanel_BasicTxtButton2:BasicTxtButton;
        public var _DPassPanel_BasicTxtButton3:BasicTxtButton;
        private var _tip:ToolTip = null;
        public var _DPassPanel_DescriptionLabel1:DescriptionLabel;
        public var _DPassPanel_IntroText1:IntroText;
        public var _DPassPanel_DescriptionLabel2:DescriptionLabel;
        public var _DPassPanel_DescriptionLabel3:DescriptionLabel;
        public var _DPassPanel_BasicGlowButton1:BasicGlowButton;
        public var _DPassPanel_BasicGlowButton3:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":260,
                    "height":380,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_DPassPanel_BasicGlowButton1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":1,
                                "width":170,
                                "styleName":"StripeButton",
                                "enabled":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{
                            "mouseDown":"___DPassPanel_Button1_mouseDown",
                            "click":"___DPassPanel_Button1_click"
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
                        "type":IntroText,
                        "id":"_DPassPanel_IntroText1",
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":234,
                                "height":156
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"txtOldPass",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":210,
                                "displayAsPassword":true,
                                "height":18,
                                "width":130,
                                "maxChars":6,
                                "restrict":"[0-9]"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"txtNewPass",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":249,
                                "displayAsPassword":true,
                                "height":18,
                                "width":130,
                                "maxChars":6,
                                "restrict":"[0-9]"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"txtNewSecondPass",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":291,
                                "displayAsPassword":true,
                                "height":18,
                                "width":130,
                                "maxChars":6,
                                "restrict":"[0-9]"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DescriptionLabel,
                        "id":"_DPassPanel_DescriptionLabel1",
                        "stylesFactory":function ():void
                        {
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":227});
                        }
                    }), new UIComponentDescriptor({
                        "type":DescriptionLabel,
                        "id":"_DPassPanel_DescriptionLabel2",
                        "stylesFactory":function ():void
                        {
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":268});
                        }
                    }), new UIComponentDescriptor({
                        "type":DescriptionLabel,
                        "id":"_DPassPanel_DescriptionLabel3",
                        "stylesFactory":function ():void
                        {
                            this.right = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":310});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_DPassPanel_BasicGlowButton2",
                        "events":{"click":"___DPassPanel_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "40";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalBlueButton",
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_DPassPanel_BasicGlowButton3",
                        "events":{"click":"___DPassPanel_BasicGlowButton3_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":40,
                                "styleName":"CrystalBlueButton",
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_DPassPanel_BasicTxtButton1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":30,
                                "y":210
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_DPassPanel_BasicTxtButton2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":30,
                                "y":249
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_DPassPanel_BasicTxtButton3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":30,
                                "y":291
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _rep:RegExp = /[0-9]{6,6}/;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DPassPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.top = "50";
                this.horizontalCenter = "50";
            };
            this.styleName = "CanvasChooseChannel";
            this.width = 260;
            this.height = 380;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DPassPanel._watcherSetupUtil = _arg_1;
        }


        public function set txtNewPass(_arg_1:TextInput):void
        {
            var _local_2:Object = this._345368897txtNewPass;
            if (_local_2 !== _arg_1)
            {
                this._345368897txtNewPass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtNewPass", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:DPassPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DPassPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DPassPanelWatcherSetupUtil");
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

        public function ___DPassPanel_Button1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function _DPassPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DPASSPANEL_U[6];
            _local_1 = ((_core.by_session != "renren") ? Language.DPASSPANEL_S[9] : (Language.DPASSPANEL_S[9] + Language.DPASSPANEL_S[10]));
            _local_1 = Language.DPASSPANEL_S[7];
            _local_1 = Language.DPASSPANEL_S[7];
            _local_1 = Language.DPASSPANEL_S[7];
            _local_1 = Language.DPASSPANEL_U[1];
            _local_1 = Language.DPASSPANEL_U[0];
            _local_1 = (((!(txtOldPass.text == "")) && (!(txtNewPass.text == ""))) && (!(txtNewSecondPass.text == "")));
            _local_1 = Language.DPASSPANEL_U[7];
            _local_1 = Language.DPASSPANEL_U[8];
            _local_1 = Language.DPASSPANEL_U[9];
        }

        private function hidTip(_arg_1:Object):void
        {
            _tip.visible = false;
        }

        public function ___DPassPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            sendPwdAgain();
        }

        public function set txtOldPass(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1415729736txtOldPass;
            if (_local_2 !== _arg_1)
            {
                this._1415729736txtOldPass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtOldPass", _local_2, _arg_1));
            };
        }

        public function set txtNewSecondPass(_arg_1:TextInput):void
        {
            var _local_2:Object = this._685155285txtNewSecondPass;
            if (_local_2 !== _arg_1)
            {
                this._685155285txtNewSecondPass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtNewSecondPass", _local_2, _arg_1));
            };
        }

        public function ___DPassPanel_Button1_click(_arg_1:MouseEvent):void
        {
            hidePwdAgainCanvas();
        }

        public function showPwdAgainCanvas(_arg_1:Boolean=true):void
        {
            clear();
            var _local_2:Object = _core.view.getUI(ViewManager.FORE_C_C);
            show();
        }

        public function hidePwdAgainCanvas():void
        {
            this.hide();
            clear();
        }

        [Bindable(event="propertyChange")]
        public function get txtNewPass():TextInput
        {
            return (this._345368897txtNewPass);
        }

        public function hide():void
        {
            visible = false;
        }

        private function _DPassPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_BasicGlowButton1.label = _arg_1;
            }, "_DPassPanel_BasicGlowButton1.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((_core.by_session != "renren") ? Language.DPASSPANEL_S[9] : (Language.DPASSPANEL_S[9] + Language.DPASSPANEL_S[10]));
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_IntroText1.htmlText = _arg_1;
            }, "_DPassPanel_IntroText1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_DescriptionLabel1.text = _arg_1;
            }, "_DPassPanel_DescriptionLabel1.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_DescriptionLabel2.text = _arg_1;
            }, "_DPassPanel_DescriptionLabel2.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_DescriptionLabel3.text = _arg_1;
            }, "_DPassPanel_DescriptionLabel3.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_BasicGlowButton2.label = _arg_1;
            }, "_DPassPanel_BasicGlowButton2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_BasicGlowButton3.label = _arg_1;
            }, "_DPassPanel_BasicGlowButton3.label");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (((!(txtOldPass.text == "")) && (!(txtNewPass.text == ""))) && (!(txtNewSecondPass.text == "")));
            }, function (_arg_1:Boolean):void
            {
                _DPassPanel_BasicGlowButton3.enabled = _arg_1;
            }, "_DPassPanel_BasicGlowButton3.enabled");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_BasicTxtButton1.text = _arg_1;
            }, "_DPassPanel_BasicTxtButton1.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_BasicTxtButton2.text = _arg_1;
            }, "_DPassPanel_BasicTxtButton2.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DPASSPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DPassPanel_BasicTxtButton3.text = _arg_1;
            }, "_DPassPanel_BasicTxtButton3.text");
            result[10] = binding;
            return (result);
        }

        private function onSetDeletePass(_arg_1:String):void
        {
            if (_arg_1 == "")
            {
                Alert.show(Language.DPASSPANEL_S[8]);
                this.visible = false;
            }
            else
            {
                Alert.show(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtOldPass():TextInput
        {
            return (this._1415729736txtOldPass);
        }

        public function sendPwdAgain():void
        {
            if (!_rep.test(txtOldPass.text))
            {
                Alert.show(Language.DPASSPANEL_S[5], "");
                return;
            };
            if (!_rep.test(txtNewPass.text))
            {
                Alert.show(Language.DPASSPANEL_S[6], "");
                return;
            };
            if (txtNewPass.text != txtNewSecondPass.text)
            {
                Alert.show(Language.DPASSPANEL_S[0], "");
                return;
            };
            _core.remote.call("setDeletePass", new Responder(onSetDeletePass), MD5.hash(txtNewPass.text.toString()), MD5.hash(txtOldPass.text.toString()));
            _core.delPass = null;
        }

        [Bindable(event="propertyChange")]
        public function get txtNewSecondPass():TextInput
        {
            return (this._685155285txtNewSecondPass);
        }

        private function showTip(_arg_1:Object):void
        {
            var _local_2:String = Language.DPASSPANEL_S[7];
            var _local_3:Point = _arg_1.target.localToGlobal(new Point(((_arg_1.target.x + _arg_1.target.width) + 5), _arg_1.target.y));
            if (_tip == null)
            {
                _tip = (ToolTipManager.createToolTip(_local_2, _local_3.x, _local_3.y) as ToolTip);
            }
            else
            {
                _tip.move(_local_3.x, _local_3.y);
                _tip.visible = true;
            };
        }

        public function ___DPassPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            hidePwdAgainCanvas();
        }

        private function clear(_arg_1:MouseEvent=null):void
        {
            txtOldPass.text = "";
            txtNewPass.text = "";
            txtNewSecondPass.text = "";
        }

        public function create():void
        {
            this.visible = true;
        }

        public function show():void
        {
            visible = true;
            txtOldPass.text = "";
            txtNewPass.text = "";
            txtNewSecondPass.text = "";
        }


    }
}//package com.qeedoo.ui.view.compDragable

