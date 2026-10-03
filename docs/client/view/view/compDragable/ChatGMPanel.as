// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChatGMPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.utils.setTimeout;
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

    public class ChatGMPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1436024058textEditor:TextArea;
        private var _1243080559gmName:BoxLabel;
        private var _1738339470textOutput:TextArea;
        public var _ChatGMPanel_BasicTxtButton1:BasicTxtButton;
        private var gmChatData:Object;
        public var _ChatGMPanel_BasicGlowButton1:BasicGlowButton;
        public var _ChatGMPanel_BasicGlowButton2:BasicGlowButton;
        public var _ChatGMPanel_BasicGlowButton3:BasicGlowButton;
        public var _ChatGMPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _name:String;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":280,
                    "height":396,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ChatGMPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatGMPanel_BasicGlowButton1",
                        "events":{"click":"___ChatGMPanel_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "20";
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "styleName":"BtnNormalRed",
                                "y":32.3,
                                "width":104
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_ChatGMPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":34,
                                "width":38,
                                "height":18,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"gmName",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "visible":false,
                                "x":60,
                                "y":34.3,
                                "width":88
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"textOutput",
                        "events":{"mouseMove":"__textOutput_mouseMove"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "147";
                            this.top = "60";
                            this.left = "20";
                            this.right = "20";
                            this.color = 0xFFFFFF;
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "editable":false
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
                            this.bottom = "50";
                            this.top = "260";
                            this.left = "20";
                            this.right = "20";
                            this.color = 0xFFFFFF;
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"CSSBorder"});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ChatGMPanel_BasicGlowButton2",
                        "events":{"click":"___ChatGMPanel_BasicGlowButton2_click"},
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
                        "id":"_ChatGMPanel_BasicGlowButton3",
                        "events":{"click":"___ChatGMPanel_BasicGlowButton3_click"},
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
                            "click":"___ChatGMPanel_Button1_click",
                            "mouseDown":"___ChatGMPanel_Button1_mouseDown"
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

        public function ChatGMPanel()
        {
            mx_internal::_document = this;
            this.width = 280;
            this.height = 396;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___ChatGMPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChatGMPanel._watcherSetupUtil = _arg_1;
        }


        public function ___ChatGMPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __textOutput_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get textEditor():TextArea
        {
            return (this._1436024058textEditor);
        }

        private function showPanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CHATMANAGER);
            _local_1.visible = (!(_local_1.visible));
        }

        [Bindable(event="propertyChange")]
        public function get gmName():BoxLabel
        {
            return (this._1243080559gmName);
        }

        private function textOutputChangeHandler():void
        {
            textOutput.verticalScrollPosition = GamePredef.UINT_MAX;
        }

        [Bindable(event="propertyChange")]
        public function get textOutput():TextArea
        {
            return (this._1738339470textOutput);
        }

        override public function initialize():void
        {
            var target:ChatGMPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChatGMPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChatGMPanelWatcherSetupUtil");
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

        public function setTop():void
        {
            parent.setChildIndex(this, (parent.numChildren - 1));
        }

        public function set textOutput(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1738339470textOutput;
            if (_local_2 !== _arg_1)
            {
                this._1738339470textOutput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textOutput", _local_2, _arg_1));
            };
        }

        public function ___ChatGMPanel_Button1_click(_arg_1:MouseEvent):void
        {
            minButtonClickHandler();
        }

        public function set gmName(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1243080559gmName;
            if (_local_2 !== _arg_1)
            {
                this._1243080559gmName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gmName", _local_2, _arg_1));
            };
        }

        public function ___ChatGMPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            textSend();
        }

        private function clearInputArea():void
        {
            textEditor.text = "";
        }

        public function __textEditor_keyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                textSend();
            };
        }

        private function _ChatGMPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHATGMPANEL_U[0];
            _local_1 = Language.CHATPANEL_S[1];
            _local_1 = Language.CHATPANEL_U[0];
            _local_1 = Language.CHATGMPANEL_U[1];
            _local_1 = Language.CHATPANEL_U[1];
            _local_1 = Language.INPUTPANEL_U[0];
        }

        override public function initView():void
        {
            gmChatData = ChatPanelUtil.gmChatData;
            textSend();
            _core.view.getUI(ViewManager.PANEL_CHATMANAGER).initView();
            _core.view.getUI(ViewManager.MAIN_WARN).delChatGMWarn(_name);
            gmName.text = _name;
        }

        private function textSend():void
        {
            var _local_1:String;
            if (textEditor.text != "")
            {
                if (textEditor.text.length < GamePredef.CHAT_STR_MAX)
                {
                    if (_core.player.checkChatTime())
                    {
                        _local_1 = textEditor.text;
                        gmChatData[_name] = (gmChatData[_name] + (((((("<font color='#00ff00'>" + _core.player.name) + " ") + ToolKit.getTimeStrNow()) + "</font>\n") + _local_1) + "\n"));
                        _core.player.chatGM(_local_1, _core.player.id, _name);
                    }
                    else
                    {
                        gmChatData[_name] = (gmChatData[_name] + (GamePredef.CHAT_TOOFAST + "<br>"));
                    };
                }
                else
                {
                    gmChatData[_name] = (gmChatData[_name] + Language.CHATPANEL_S[0]);
                    return;
                };
            };
            showOutput();
            callLater(clearInputArea);
            callLater(textEditor.setFocus);
        }

        public function showOutput():void
        {
            textOutput.htmlText = gmChatData[_name];
            setTimeout(textOutputChangeHandler, 100);
            ChatPanelUtil.gmPanelStatusObj[_name] = "read";
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            delete ChatPanelUtil.gmPanelManagerObj[_name];
        }

        public function ___ChatGMPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            showPanel();
        }

        private function minButtonClickHandler():void
        {
            _core.addWarn({
                "warnType":GamePredef.WARN_TYPE_CHATGM_MIN,
                "gmName":_name
            });
            hide();
        }

        public function ___ChatGMPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        public function ___ChatGMPanel_Button1_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function __textEditor_mouseMove(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function setGMName(_arg_1:String):void
        {
            _name = _arg_1;
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

        private function _ChatGMPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATGMPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatGMPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ChatGMPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatGMPanel_BasicGlowButton1.toolTip = _arg_1;
            }, "_ChatGMPanel_BasicGlowButton1.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatGMPanel_BasicGlowButton1.label = _arg_1;
            }, "_ChatGMPanel_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATGMPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatGMPanel_BasicTxtButton1.label = _arg_1;
            }, "_ChatGMPanel_BasicTxtButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatGMPanel_BasicGlowButton2.label = _arg_1;
            }, "_ChatGMPanel_BasicGlowButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatGMPanel_BasicGlowButton3.label = _arg_1;
            }, "_ChatGMPanel_BasicGlowButton3.label");
            result[5] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

