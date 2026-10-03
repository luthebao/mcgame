// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChatPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.LinkEventUtil;
    import flash.events.TextEvent;
    import com.qeedoo.game.config.Language;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.utils.TextUtil;
    import flash.utils.setTimeout;
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

    public class ChatPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1436024058textEditor:TextArea;
        public var _ChatPanel_BasicTxtButton1:BasicTxtButton;
        public var _ChatPanel_BasicTxtButton2:BasicTxtButton;
        public var _ChatPanel_BasicTxtButton3:BasicTxtButton;
        private var _313422957userClass:BoxLabel;
        private var _1738339470textOutput:LinkTextArea;
        public var userData:Object;
        public var _ChatPanel_BasicGlowButton2:BasicGlowButton;
        public var _ChatPanel_BasicGlowButton1:BasicGlowButton;
        public var _ChatPanel_BasicGlowButton3:BasicGlowButton;
        private var chatData:Object;
        public var _ChatPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _104387img:Image;
        private var _266666762userName:BoxLabel;
        private var _321545849userLevel:BoxLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":280,
                    "height":396,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ChatPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatPanel_BasicGlowButton1",
                        "events":{"click":"___ChatPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":210,
                                "styleName":"BtnNormalRed",
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":22,
                                "y":41,
                                "width":47,
                                "height":44.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ChatPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":79,
                                "y":34,
                                "width":38,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ChatPanel_BasicTxtButton2",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":79,
                                "y":54,
                                "width":38,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ChatPanel_BasicTxtButton3",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":79,
                                "y":74,
                                "width":38,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"userName",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":119,
                                "y":34.3,
                                "width":88
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"userLevel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":119,
                                "y":74,
                                "width":88
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"userClass",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":119,
                                "y":54,
                                "width":88
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.bottom = "147";
                            this.top = "107";
                            this.left = "20";
                            this.right = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"textOutput",
                                    "events":{"mouseMove":"__textOutput_mouseMove"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.top = "8";
                                        this.bottom = "8";
                                        this.left = "8";
                                        this.right = "8";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectable":true,
                                            "editable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"textEditor",
                        "events":{
                            "keyDown":"__textEditor_keyDown",
                            "mouseMove":"__textEditor_mouseMove"
                        },
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "width":237,
                                "height":75,
                                "x":22,
                                "y":274,
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatPanel_BasicGlowButton2",
                        "events":{"click":"___ChatPanel_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":142.55,
                                "y":353.5,
                                "styleName":"BtnStdRed",
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatPanel_BasicGlowButton3",
                        "events":{"click":"___ChatPanel_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":212,
                                "y":353.5,
                                "styleName":"BtnStdRed",
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{
                            "click":"___ChatPanel_Button1_click",
                            "mouseDown":"___ChatPanel_Button1_mouseDown"
                        },
                        "stylesFactory":function ():void
                        {
                            this.right = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":5,
                                "styleName":"BtnPanelMinimize"
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

        public function ChatPanel()
        {
            mx_internal::_document = this;
            this.width = 280;
            this.height = 396;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___ChatPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChatPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get textEditor():TextArea
        {
            return (this._1436024058textEditor);
        }

        public function __textOutput_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
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

        public function ___ChatPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            textSend();
        }

        private function textOutputChangeHandler():void
        {
            textOutput.verticalScrollPosition = GamePredef.UINT_MAX;
        }

        public function set textOutput(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1738339470textOutput;
            if (_local_2 !== _arg_1)
            {
                this._1738339470textOutput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textOutput", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get userName():BoxLabel
        {
            return (this._266666762userName);
        }

        [Bindable(event="propertyChange")]
        public function get textOutput():LinkTextArea
        {
            return (this._1738339470textOutput);
        }

        override public function initialize():void
        {
            var target:ChatPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChatPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChatPanelWatcherSetupUtil");
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

        private function showPanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CHATMANAGER);
            _local_1.visible = (!(_local_1.visible));
        }

        public function setTop():void
        {
            parent.setChildIndex(this, (parent.numChildren - 1));
        }

        private function clearInputArea():void
        {
            textEditor.text = "";
        }

        private function onChatPanelLink(_arg_1:TextEvent):void
        {
            if (LinkTextArea.checkSearchable(_arg_1.text))
            {
                LinkEventUtil.linkHandler(_arg_1, stage);
            };
        }

        private function _ChatPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHATPANEL_U[2];
            _local_1 = Language.CHATPANEL_S[1];
            _local_1 = Language.CHATPANEL_U[0];
            _local_1 = Language.CHATPANEL_U[3];
            _local_1 = Language.CHATPANEL_U[4];
            _local_1 = Language.CHATPANEL_U[5];
            _local_1 = onChatPanelLink;
            _local_1 = Language.CHATPANEL_U[1];
            _local_1 = Language.INPUTPANEL_U[0];
        }

        public function __textEditor_keyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                textSend();
            };
        }

        public function ___ChatPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            showPanel();
        }

        public function ___ChatPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        [Bindable(event="propertyChange")]
        public function get userClass():BoxLabel
        {
            return (this._313422957userClass);
        }

        override public function initView():void
        {
            if (userData != null)
            {
                if (!userData.iconCode)
                {
                    img.visible = false;
                }
                else
                {
                    img.source = ResManager.getIconUrl(userData.iconCode);
                };
                userName.text = userData.name;
                if (userData.exp)
                {
                    userLevel.text = _core.basic.expToLevel(userData.exp).toString();
                };
                userClass.text = _core.getClassName(userData.classId);
            };
            chatData = ChatPanelUtil.chatData;
            textSend();
            _core.view.getUI(ViewManager.PANEL_CHATMANAGER).initView();
            _core.view.getUI(ViewManager.MAIN_WARN).delP2pWarn(userData.id);
        }

        private function textSend():void
        {
            var _local_1:String;
            var _local_2:String;
            if (((!(textEditor.text == "")) && (userData)))
            {
                if (((textEditor.text.length < GamePredef.CHAT_STR_MAX) && (!(_core.haveSpecialStr_vn(textEditor.text)))))
                {
                    if (_core.player.checkChatTime())
                    {
                        _local_1 = _core.getHtmlStr(textEditor.text);
                        _local_2 = ((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _core.player.id) + "|") + _core.player.name) + "|0|0|0]") + "<font color='#00ff00'>[") + ToolKit.getTimeStrNow()) + "]:</font><p><br>") + TextUtil.encode(_local_1)) + "<p><br>");
                        chatData[userData.id] = (chatData[userData.id] + TextUtil.decode(_local_2));
                        _core.player.p2pWisper(_local_2, _core.player.id, userData.id);
                    }
                    else
                    {
                        chatData[userData.id] = (chatData[userData.id] + (GamePredef.CHAT_TOOFAST + "<br>"));
                    };
                }
                else
                {
                    chatData[userData.id] = (chatData[userData.id] + Language.CHATPANEL_S[0]);
                    return;
                };
            };
            showOutput();
            callLater(clearInputArea);
            callLater(textEditor.setFocus);
        }

        public function showOutput():void
        {
            textOutput.htmlText = chatData[userData.id];
            setTimeout(textOutputChangeHandler, 100);
            ChatPanelUtil.panelStatusObj[userData.id] = "read";
        }

        private function _ChatPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ChatPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicGlowButton1.toolTip = _arg_1;
            }, "_ChatPanel_BasicGlowButton1.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicGlowButton1.label = _arg_1;
            }, "_ChatPanel_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicTxtButton1.label = _arg_1;
            }, "_ChatPanel_BasicTxtButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicTxtButton2.label = _arg_1;
            }, "_ChatPanel_BasicTxtButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicTxtButton3.label = _arg_1;
            }, "_ChatPanel_BasicTxtButton3.label");
            result[5] = binding;
            binding = new Binding(this, function ():Function
            {
                return (onChatPanelLink);
            }, function (_arg_1:Function):void
            {
                textOutput.onLink = _arg_1;
            }, "textOutput.onLink");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicGlowButton2.label = _arg_1;
            }, "_ChatPanel_BasicGlowButton2.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatPanel_BasicGlowButton3.label = _arg_1;
            }, "_ChatPanel_BasicGlowButton3.label");
            result[8] = binding;
            return (result);
        }

        public function set userClass(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._313422957userClass;
            if (_local_2 !== _arg_1)
            {
                this._313422957userClass = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userClass", _local_2, _arg_1));
            };
        }

        public function ___ChatPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            delete ChatPanelUtil.panelManagerObj[userData.id];
        }

        private function minButtonClickHandler():void
        {
            _core.addWarn({
                "warnType":GamePredef.WARN_TYPE_MIN,
                "speaker":userData.id,
                "speakerName":userData.name
            });
            hide();
        }

        public function __textEditor_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set userLevel(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._321545849userLevel;
            if (_local_2 !== _arg_1)
            {
                this._321545849userLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userLevel", _local_2, _arg_1));
            };
        }

        public function set userName(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._266666762userName;
            if (_local_2 !== _arg_1)
            {
                this._266666762userName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userName", _local_2, _arg_1));
            };
        }

        public function ___ChatPanel_Button1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get userLevel():BoxLabel
        {
            return (this._321545849userLevel);
        }

        public function set textEditor(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1436024058textEditor;
            if (_local_2 !== _arg_1)
            {
                this._1436024058textEditor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textEditor", _local_2, _arg_1));
            };
        }

        public function ___ChatPanel_Button1_click(_arg_1:MouseEvent):void
        {
            minButtonClickHandler();
        }


    }
}//package com.qeedoo.ui.view.compDragable

