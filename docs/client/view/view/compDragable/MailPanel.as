// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MailPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.Currency;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import mx.core.IUITextField;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.adobe.crypto.MD5;
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

    public class MailPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var mailData:Object;
        public var _MailPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1867885268subject:BoxLabel;
        public var _MailPanel_BasicTxtButton1:BasicTxtButton;
        public var _MailPanel_BasicTxtButton2:BasicTxtButton;
        public var _MailPanel_BasicTxtButton3:BasicTxtButton;
        private var _940964344codGold:Currency;
        private var _889333208codMoney:Currency;
        private var _1603303783takeButton:BasicGlowButton;
        public var _MailPanel_BasicGlowButton2:BasicGlowButton;
        public var _MailPanel_BasicGlowButton3:BasicGlowButton;
        private var _678360261presentMoney:Currency;
        public var _MailPanel_BasicGlowButton4:BasicGlowButton;
        private var _1225222213presentGold:Currency;
        private var _905962955sender:BoxLabel;
        private var _10286204mailText:IntroText;
        public var _MailPanel_Label1:Label;
        public var _MailPanel_Label2:Label;
        private var _3242771item:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":275,
                    "height":395,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MailPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"sender",
                        "stylesFactory":function ():void
                        {
                            this.left = "56";
                            this.top = "49.5";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":18});
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"subject",
                        "stylesFactory":function ():void
                        {
                            this.left = "56";
                            this.top = "70.5";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":18});
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"mailText",
                        "stylesFactory":function ():void
                        {
                            this.top = "98.5";
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":164.5});
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"item",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.top = "295";
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":32,
                                "height":32
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_MailPanel_Label1",
                        "stylesFactory":function ():void
                        {
                            this.left = "70";
                            this.top = "272";
                            this.color = 0xFFFFFF;
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_MailPanel_Label2",
                        "stylesFactory":function ():void
                        {
                            this.left = "140";
                            this.top = "272";
                            this.color = 0xFFFFFF;
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"presentMoney",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "inputEnabled":false,
                                "x":61,
                                "y":295,
                                "width":65.8
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"presentGold",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "inputEnabled":false,
                                "x":61,
                                "y":315,
                                "width":65.8
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"codMoney",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "inputEnabled":false,
                                "x":130.8,
                                "y":295,
                                "width":66
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"codGold",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "inputEnabled":false,
                                "x":130.8,
                                "y":315,
                                "width":66
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"takeButton",
                        "events":{"click":"__takeButton_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":196.8,
                                "y":297,
                                "styleName":"BtnStdRed",
                                "width":50.6,
                                "height":26
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MailPanel_BasicGlowButton2",
                        "events":{"click":"___MailPanel_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":340,
                                "x":61.8,
                                "styleName":"BtnStdRed",
                                "width":50.6,
                                "height":26
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MailPanel_BasicGlowButton3",
                        "events":{"click":"___MailPanel_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":123.6,
                                "y":340,
                                "styleName":"BtnStdRed",
                                "width":50.6,
                                "height":26
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MailPanel_BasicGlowButton4",
                        "events":{"click":"___MailPanel_BasicGlowButton4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":187.2,
                                "y":340,
                                "styleName":"BtnStdRed",
                                "width":50.6,
                                "height":26
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_MailPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":49.5,
                                "width":38,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_MailPanel_BasicTxtButton2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":70.5,
                                "width":38,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_MailPanel_BasicTxtButton3",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 1;
                            this.paddingRight = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":14,
                                "y":271,
                                "width":38,
                                "height":18
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

        public function MailPanel()
        {
            mx_internal::_document = this;
            this.width = 275;
            this.height = 395;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MailPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get mailText():IntroText
        {
            return (this._10286204mailText);
        }

        public function onSetReadDate(_arg_1:Object):void
        {
            if (_arg_1 != null)
            {
                _core.view.getUI(ViewManager.PANEL_MAILMANAGER).mailList[_arg_1.id]["readDate"] = _arg_1.newDate;
                _core.view.getUI(ViewManager.PANEL_MAILMANAGER).updateCurrentMail(_arg_1);
                if (mailData.id == _arg_1.id)
                {
                    mailData.readDate = _arg_1.newDate;
                };
            };
        }

        public function set mailText(_arg_1:IntroText):void
        {
            var _local_2:Object = this._10286204mailText;
            if (_local_2 !== _arg_1)
            {
                this._10286204mailText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mailText", _local_2, _arg_1));
            };
        }

        private function doTakeMail(result:Boolean):void
        {
            var msg:String;
            var onClose:Function;
            var htmlMsg:String;
            var _alert:* = undefined;
            var tf:IUITextField;
            if (result)
            {
                if (((codMoney.value <= _core.player.money) && (codGold.value <= _core.player.gold)))
                {
                    if ((((item.type == GamePredef.TBL_ITEM_INSTANCE) || (item.type == GamePredef.TBL_EQUIPT_INSTANCE)) || (item.type == GamePredef.TBL_ITEM_TEMPLATE)))
                    {
                        if (!_core.player.enoughBag(1))
                        {
                            Alert.show(Language.MAILPANEL_S[0], "", Alert.OK);
                            return;
                        };
                        msg = isCost();
                        if (msg != "")
                        {
                            onClose = function (_arg_1:CloseEvent):void
                            {
                                if (_arg_1.detail == Alert.YES)
                                {
                                    _core.remote.call("takeMail", new Responder(onTakeMail), mailData.id, _core.delPass);
                                };
                            };
                            htmlMsg = isCost(true);
                            msg = msg.replace(/<font(.*?)>/g, "");
                            msg = msg.replace(/<\/font>/g, "");
                            _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), this, onClose);
                            tf = _alert.mx_internal::alertForm.mx_internal::textField;
                            tf.htmlText = htmlMsg;
                        }
                        else
                        {
                            _core.remote.call("takeMail", new Responder(onTakeMail), mailData.id);
                        };
                    }
                    else
                    {
                        if (item.type == GamePredef.TBL_PET)
                        {
                            if (!_core.player.enoughPetSlot(1))
                            {
                                Alert.show(Language.MAILPANEL_S[101], "", Alert.OK);
                                return;
                            };
                            msg = isCost();
                            if (msg != "")
                            {
                                onClose = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.call("takeMail", new Responder(onTakeMail), mailData.id, _core.delPass);
                                    };
                                };
                                htmlMsg = isCost(true);
                                msg = msg.replace(/<font(.*?)>/g, "");
                                msg = msg.replace(/<\/font>/g, "");
                                _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), this, onClose);
                                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                                tf.htmlText = htmlMsg;
                            }
                            else
                            {
                                _core.remote.call("takeMail", new Responder(onTakeMail), mailData.id);
                            };
                        }
                        else
                        {
                            msg = isCost();
                            if (msg != "")
                            {
                                onClose = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.call("takeMail", new Responder(onTakeMail), mailData.id, _core.delPass);
                                    };
                                };
                                htmlMsg = isCost(true);
                                msg = msg.replace(/<font(.*?)>/g, "");
                                msg = msg.replace(/<\/font>/g, "");
                                _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), this, onClose);
                                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                                tf.htmlText = htmlMsg;
                            }
                            else
                            {
                                _core.remote.call("takeMail", new Responder(onTakeMail), mailData.id);
                            };
                        };
                    };
                }
                else
                {
                    Alert.show(Language.MAILPANEL_S[1], "", Alert.OK);
                };
            };
        }

        public function set presentMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._678360261presentMoney;
            if (_local_2 !== _arg_1)
            {
                this._678360261presentMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "presentMoney", _local_2, _arg_1));
            };
        }

        private function _MailPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MailPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_Label1.text = _arg_1;
            }, "_MailPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_Label2.text = _arg_1;
            }, "_MailPanel_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                presentMoney.type = _arg_1;
            }, "presentMoney.type");
            result[3] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                presentGold.type = _arg_1;
            }, "presentGold.type");
            result[4] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                codMoney.type = _arg_1;
            }, "codMoney.type");
            result[5] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                codGold.type = _arg_1;
            }, "codGold.type");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                takeButton.toolTip = _arg_1;
            }, "takeButton.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                takeButton.label = _arg_1;
            }, "takeButton.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicGlowButton2.label = _arg_1;
            }, "_MailPanel_BasicGlowButton2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicGlowButton3.label = _arg_1;
            }, "_MailPanel_BasicGlowButton3.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicGlowButton4.label = _arg_1;
            }, "_MailPanel_BasicGlowButton4.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicTxtButton1.label = _arg_1;
            }, "_MailPanel_BasicTxtButton1.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicTxtButton2.label = _arg_1;
            }, "_MailPanel_BasicTxtButton2.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAILPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MailPanel_BasicTxtButton3.label = _arg_1;
            }, "_MailPanel_BasicTxtButton3.label");
            result[14] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:MailPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MailPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MailPanelWatcherSetupUtil");
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
        public function get takeButton():BasicGlowButton
        {
            return (this._1603303783takeButton);
        }

        public function ___MailPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            delMail();
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlot
        {
            return (this._3242771item);
        }

        [Bindable(event="propertyChange")]
        public function get codMoney():Currency
        {
            return (this._889333208codMoney);
        }

        public function set item(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        private function isCost(_arg_1:Boolean=false):String
        {
            var _local_2:* = "";
            var _local_3:* = "";
            var _local_4:* = "";
            if (_arg_1)
            {
                _local_3 = "<font color='#FF0000'>";
                _local_4 = "</font>";
            };
            if (((codMoney.value > 0) || (codGold.value > 0)))
            {
                if (codGold.value > 0)
                {
                    if (codMoney.value > 0)
                    {
                        _local_2 = Language.MAIL_PANEL_U[1].replace("{lanCost}", ((_local_3 + Language.MAIL_PANEL_U[4]) + _local_4)).replace("{goldValue}", ((_local_3 + uint(codGold.value)) + _local_4)).replace("{silverValue}", ((_local_3 + uint(codMoney.value)) + _local_4)).replace("{sender}", sender.text);
                    }
                    else
                    {
                        _local_2 = Language.MAIL_PANEL_U[2].replace("{lanCost}", ((_local_3 + Language.MAIL_PANEL_U[4]) + _local_4)).replace("{goldValue}", ((_local_3 + uint(codGold.value)) + _local_4)).replace("{sender}", sender.text);
                    };
                }
                else
                {
                    if (codMoney.value > 0)
                    {
                        _local_2 = Language.MAIL_PANEL_U[3].replace("{lanCost}", ((_local_3 + Language.MAIL_PANEL_U[4]) + _local_4)).replace("{silverValue}", ((_local_3 + uint(codMoney.value)) + _local_4)).replace("{sender}", sender.text);
                    };
                };
            };
            return (_local_2);
        }

        public function set takeButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1603303783takeButton;
            if (_local_2 !== _arg_1)
            {
                this._1603303783takeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "takeButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sender():BoxLabel
        {
            return (this._905962955sender);
        }

        [Bindable(event="propertyChange")]
        public function get presentGold():Currency
        {
            return (this._1225222213presentGold);
        }

        public function __takeButton_click(_arg_1:MouseEvent):void
        {
            takeMail();
        }

        [Bindable(event="propertyChange")]
        public function get subject():BoxLabel
        {
            return (this._1867885268subject);
        }

        private function _MailPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAILPANEL_U[7];
            _local_1 = Language.MAILPANEL_S[2];
            _local_1 = Language.MAILPANEL_S[3];
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Language.MAILPANEL_S[4];
            _local_1 = Language.MAILPANEL_U[3];
            _local_1 = Language.MAILPANEL_U[0];
            _local_1 = Language.MAILPANEL_U[1];
            _local_1 = Language.MAILPANEL_U[2];
            _local_1 = Language.MAILPANEL_U[4];
            _local_1 = Language.MAILPANEL_U[5];
            _local_1 = Language.MAILPANEL_U[6];
        }

        public function showMail(_arg_1:Object):void
        {
            mailData = _arg_1;
            visible = true;
            initView();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (((mailData) && (mailData.receiverId == _core.player.id)))
            {
                mailClear();
                if (mailData.senderId == "0")
                {
                    sender.setStyle("color", 0xFF0000);
                };
                sender.text = mailData.sn;
                subject.text = mailData.subject;
                mailText.htmlText = mailData.text;
                mailText.content.selectable = true;
                presentMoney.value = mailData.money;
                presentGold.value = mailData.gold;
                codMoney.value = mailData.codMoney;
                codGold.value = mailData.codGold;
                codMoney.currencyInput.setStyle("color", "red");
                codMoney.currencyInput.setStyle("disabledColor", "red");
                codGold.currencyInput.setStyle("color", "red");
                codGold.currencyInput.setStyle("disabledColor", "red");
                if ((((!(mailData.codMoney == 0)) || (!(mailData.codGold == 0))) && (mailData.codFlag == 1)))
                {
                    _core.sysMidNote(Language.MAIL_PANEL_U[5]);
                };
                item.type = mailData.itemType;
                item.giid = mailData.itemId;
                item.stackNum = mailData.stackNum;
                if ((((((mailData.itemType > 0) && (mailData.itemId > 0)) && (mailData.stackNum > 0)) || (mailData.money > 0)) || (mailData.gold > 0)))
                {
                    takeButton.visible = true;
                }
                else
                {
                    takeButton.visible = false;
                };
                _core.view.getUI(ViewManager.MAIN_WARN).delMailWarn();
                setReadDate();
            };
        }

        private function mailClear():void
        {
            sender.text = "";
            subject.text = "";
            mailText.htmlText = "";
            presentMoney.value = 0;
            presentGold.value = 0;
            codMoney.value = 0;
            codGold.value = 0;
            item.clean();
            takeButton.visible = false;
        }

        public function set codMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._889333208codMoney;
            if (_local_2 !== _arg_1)
            {
                this._889333208codMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "codMoney", _local_2, _arg_1));
            };
        }

        public function set subject(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1867885268subject;
            if (_local_2 !== _arg_1)
            {
                this._1867885268subject = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "subject", _local_2, _arg_1));
            };
        }

        public function onTakeMail(_arg_1:Number):void
        {
            var _local_2:Object;
            if (_arg_1 > 0)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_MAILMANAGER).mailList[_arg_1];
                _local_2.money = 0;
                _local_2.gold = 0;
                _local_2.codMoney = 0;
                _local_2.codGold = 0;
                _local_2.itemType = -1;
                _local_2.itemId = -1;
                _local_2.stackNum = -1;
                _core.view.getUI(ViewManager.PANEL_MAILMANAGER).updateCurrentMail(_local_2);
                if (mailData.id == _arg_1)
                {
                    showMail(_local_2);
                };
            };
        }

        private function takeMail():void
        {
            var func:Function;
            if (_core.delPass)
            {
                _core.remote.call("unlockMoney", new Responder(doTakeMail), _core.delPass);
            }
            else
            {
                func = function (_arg_1:String):*
                {
                    _core.remote.call("unlockMoney", new Responder(doTakeMail), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.MAIL_PANEL_U[0], func);
            };
        }

        public function ___MailPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            reply();
        }

        public function ___MailPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function delMail():void
        {
            _core.view.getUI(ViewManager.PANEL_MAILMANAGER).delMail(mailData.id);
        }

        private function setReadDate():void
        {
            if (mailData.readDate == -1)
            {
                _core.remote.call("setReadDate", new Responder(onSetReadDate), mailData.id);
            };
        }

        [Bindable(event="propertyChange")]
        public function get presentMoney():Currency
        {
            return (this._678360261presentMoney);
        }

        private function reply():void
        {
            _core.view.getUI(ViewManager.PANEL_MAILMANAGER).initNewMail(mailData.sn);
        }

        public function set sender(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._905962955sender;
            if (_local_2 !== _arg_1)
            {
                this._905962955sender = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sender", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get codGold():Currency
        {
            return (this._940964344codGold);
        }

        public function set presentGold(_arg_1:Currency):void
        {
            var _local_2:Object = this._1225222213presentGold;
            if (_local_2 !== _arg_1)
            {
                this._1225222213presentGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "presentGold", _local_2, _arg_1));
            };
        }

        public function set codGold(_arg_1:Currency):void
        {
            var _local_2:Object = this._940964344codGold;
            if (_local_2 !== _arg_1)
            {
                this._940964344codGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "codGold", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

