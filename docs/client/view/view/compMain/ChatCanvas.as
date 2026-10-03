// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.ChatCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.CheckBox;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicShadowButton;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.utils.ArrayQueue;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.TextUtil;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.utils.setTimeout;
    import flash.events.TimerEvent;
    import mx.controls.TextArea;
    import flash.utils.getDefinitionByName;
    import mx.events.ScrollEvent;
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

    public class ChatCanvas extends SimpleCanvas implements IMainUI, IBindingClient 
    {

        private static const HEIGHT_MAX:int = 500;
        private static const HEIGHT_MIN:int = 140;
        private static const HEIGHT_STEP:int = 20;
        private static const MAX_CHARACTER_NUM:int = 6000;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _241352512button2:Button;
        private var _3125c8:CheckBox;
        private var _2073259271channelListSettingCanvas:Canvas;
        private var _1378839131btnAll:BasicShadowButton;
        private var _3124c7:CheckBox;
        private var _2084478366btnEvent:BasicShadowButton;
        private var textOutput:LinkTextArea;
        private var _598321067btnSystem:BasicShadowButton;
        private var _lastHeadlineTimestamp:Number = 0;
        private var _2086299383btnGuild:BasicShadowButton;
        private var _3123c6:CheckBox;
        private var systemTipTimer:Timer;
        private var _2096841616btnScene:BasicShadowButton;
        private var _3119c2:CheckBox;
        private var _2071991108btnPersonal:BasicShadowButton;
        private var _206218969btnTeam:BasicShadowButton;
        private var _3122c5:CheckBox;
        private var _241352513button3:Button;
        private var _3118c1:CheckBox;
        private var _241352511button1:Button;
        private var _3121c4:CheckBox;
        private var _1025879296canvasOutputBack:SimpleCanvas;
        private var textOutput2:LinkTextArea;
        private var _3120c3:CheckBox;
        private var _1300329743allTextOutput:LinkTextArea;
        private var _scrollFlag:Boolean = true;
        private var _channelBtnChanged:Boolean;
        private var _2100905622btnWorld:BasicShadowButton;
        private var _lastPosition:uint = 0;
        private var _241352514button4:Button;
        private var _chosenChannelBtn:Button;
        private var _1115058732headline:LinkTextArea;
        public var _ChatCanvas_BasicTitleCanvas1:BasicTitleCanvas;
        private var _698057496btnWisper:BasicShadowButton;
        private var _565814782btnRumour:BasicShadowButton;
        private var _3126c9:CheckBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":440,
                    "height":240,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"canvasOutputBack",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "0";
                            this.top = "0";
                            this.left = "0";
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasChatOutput",
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"headline",
                                    "events":{"valueCommit":"__headline_valueCommit"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.borderStyle = "none";
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.color = 16774324;
                                        this.textIndent = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "editable":false,
                                            "enabled":true,
                                            "selectable":false,
                                            "height":50,
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"allTextOutput",
                                    "events":{"scroll":"__allTextOutput_scroll"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0.3;
                                        this.backgroundColor = 0;
                                        this.borderStyle = "none";
                                        this.left = "0";
                                        this.bottom = "20";
                                        this.top = "50";
                                        this.right = "0";
                                        this.color = 16774324;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "editable":false,
                                            "enabled":true,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnAll",
                                    "events":{"click":"__btnAll_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnWorld",
                                    "events":{"click":"__btnWorld_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "35";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnScene",
                                    "events":{"click":"__btnScene_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "70";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnGuild",
                                    "events":{"click":"__btnGuild_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "105";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnTeam",
                                    "events":{"click":"__btnTeam_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "140";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnWisper",
                                    "events":{"click":"__btnWisper_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "175";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnPersonal",
                                    "events":{"click":"__btnPersonal_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "210";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnSystem",
                                    "events":{"click":"__btnSystem_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "245";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnEvent",
                                    "events":{"click":"__btnEvent_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "280";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnRumour",
                                    "events":{"click":"__btnRumour_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.left = "175";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":21,
                                            "styleName":"BtnChatChannel",
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"button1",
                                    "events":{"mouseDown":"__button1_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.right = "66";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":18,
                                            "height":18,
                                            "styleName":"BtnChatClear"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"button2",
                                    "events":{"mouseDown":"__button2_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.right = "44";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":18,
                                            "height":18,
                                            "styleName":"BtnChatUp"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"button3",
                                    "events":{"mouseDown":"__button3_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.right = "22";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":18,
                                            "height":18,
                                            "styleName":"BtnChatDown"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"button4",
                                    "events":{"mouseDown":"__button4_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 5;
                                        this.bottom = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":18,
                                            "height":18,
                                            "styleName":"BtnChatLock"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"channelListSettingCanvas",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                            this.bottom = "20";
                            this.left = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"StandardContent",
                                "height":130,
                                "width":120,
                                "mouseEnabled":false,
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTitleCanvas,
                                    "id":"_ChatCanvas_BasicTitleCanvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"horizontalScrollPolicy":"off"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c1",
                                    "events":{"click":"__c1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c2",
                                    "events":{"click":"__c2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":49
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c3",
                                    "events":{"click":"__c3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":49
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c4",
                                    "events":{"click":"__c4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c5",
                                    "events":{"click":"__c5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c6",
                                    "events":{"click":"__c6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c7",
                                    "events":{"click":"__c7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":83
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c8",
                                    "events":{"click":"__c8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":83
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c9",
                                    "events":{"click":"__c9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":100,
                                            "visible":false
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var textAll:ArrayQueue = new ArrayQueue(20);
        private var textWorld:ArrayQueue = new ArrayQueue(20);
        private var textScene:ArrayQueue = new ArrayQueue(20);
        private var textGuild:ArrayQueue = new ArrayQueue(20);
        private var textTeam:ArrayQueue = new ArrayQueue(20);
        private var textWisper:ArrayQueue = new ArrayQueue(20);
        private var textPersonal:ArrayQueue = new ArrayQueue(40);
        private var textSystem:ArrayQueue = new ArrayQueue(20);
        private var textEvent:ArrayQueue = new ArrayQueue(20);
        private var textRumour:ArrayQueue = new ArrayQueue(20);
        private var _map:Object = {
            "All":textAll,
            "World":textWorld,
            "Scene":textScene,
            "Guild":textGuild,
            "Team":textTeam,
            "Wisper":textWisper,
            "Personal":textPersonal,
            "System":textSystem,
            "Event":textEvent,
            "Rumour":textRumour
        };
        private var _channelListSetting:Object = {};
        private var _core:Core = Core.getInstance();
        private var _allMessageText:String = new String();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ChatCanvas()
        {
            mx_internal::_document = this;
            this.width = 440;
            this.height = 240;
            this.cacheAsBitmap = true;
            this.x = 3;
            this.y = 128;
            this.addEventListener("creationComplete", ___ChatCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChatCanvas._watcherSetupUtil = _arg_1;
        }


        public function set canvasOutputBack(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1025879296canvasOutputBack;
            if (_local_2 !== _arg_1)
            {
                this._1025879296canvasOutputBack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvasOutputBack", _local_2, _arg_1));
            };
        }

        private function clearAllChannels():void
        {
            textAll.clear();
            textWorld.clear();
            textScene.clear();
            textGuild.clear();
            textTeam.clear();
            textWisper.clear();
            textPersonal.clear();
            textSystem.clear();
            textEvent.clear();
        }

        public function __button1_mouseDown(_arg_1:MouseEvent):void
        {
            clearChannel();
        }

        public function set channelListSettingCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2073259271channelListSettingCanvas;
            if (_local_2 !== _arg_1)
            {
                this._2073259271channelListSettingCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "channelListSettingCanvas", _local_2, _arg_1));
            };
        }

        public function onCreateChatPanel(_arg_1:Object):void
        {
            ChatPanelUtil.createCP(_arg_1);
        }

        public function __c1_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "World");
        }

        public function __btnSystem_click(_arg_1:MouseEvent):void
        {
            switchChannel("System");
            updateChannel();
        }

        public function __c9_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Rumour");
        }

        public function __btnGuild_click(_arg_1:MouseEvent):void
        {
            switchChannel("Guild");
            updateChannel();
        }

        public function set allTextOutput(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1300329743allTextOutput;
            if (_local_2 !== _arg_1)
            {
                this._1300329743allTextOutput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allTextOutput", _local_2, _arg_1));
            };
        }

        public function __btnRumour_click(_arg_1:MouseEvent):void
        {
            switchChannel("Rumour");
            updateChannel();
        }

        [Bindable(event="propertyChange")]
        public function get c1():CheckBox
        {
            return (this._3118c1);
        }

        [Bindable(event="propertyChange")]
        public function get c2():CheckBox
        {
            return (this._3119c2);
        }

        public function set btnWisper(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._698057496btnWisper;
            if (_local_2 !== _arg_1)
            {
                this._698057496btnWisper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnWisper", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get c4():CheckBox
        {
            return (this._3121c4);
        }

        [Bindable(event="propertyChange")]
        public function get c5():CheckBox
        {
            return (this._3122c5);
        }

        [Bindable(event="propertyChange")]
        public function get c7():CheckBox
        {
            return (this._3124c7);
        }

        [Bindable(event="propertyChange")]
        public function get c3():CheckBox
        {
            return (this._3120c3);
        }

        [Bindable(event="propertyChange")]
        public function get c6():CheckBox
        {
            return (this._3123c6);
        }

        [Bindable(event="propertyChange")]
        public function get c8():CheckBox
        {
            return (this._3125c8);
        }

        [Bindable(event="propertyChange")]
        public function get c9():CheckBox
        {
            return (this._3126c9);
        }

        public function __button4_mouseDown(_arg_1:MouseEvent):void
        {
            switchScroll();
        }

        public function __btnAll_click(_arg_1:MouseEvent):void
        {
            clickBtnAll();
        }

        public function showSystemMsg(_arg_1:String):void
        {
            var _local_2:* = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + Language.CHATCANVAS_S[0]) + TextUtil.decode(_arg_1)) + "</font><br/>");
            textSystem.push(_local_2);
            ((getInterfaceData("System")) && (textAll.push(_local_2)));
            updateChannel();
        }

        private function switchSettingVisible():void
        {
            channelListSettingCanvas.visible = (!(channelListSettingCanvas.visible));
        }

        public function __c6_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Personal");
        }

        public function set c2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3119c2;
            if (_local_2 !== _arg_1)
            {
                this._3119c2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c2", _local_2, _arg_1));
            };
        }

        public function ___ChatCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function onWisper(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_core.isBlack(_arg_1.sourceName))
            {
                return;
            };
            _arg_1.channelId = -1;
            _arg_1.type = GamePredef.MSG_TYPE_WISPER;
            var _local_2:* = (TextUtil.decodeChatMsg(_arg_1) + "<br>");
            textWisper.push(_local_2);
            ((getInterfaceData("Wisper")) && (textAll.push(_local_2)));
            updateChannel();
            if (((!(_arg_1.targetId == -1)) && (_arg_1.sourceId == _core.player.id)))
            {
                _core.view.getUI(ViewManager.PANEL_IM).addConnectionAC({
                    "name":_arg_1.targetName,
                    "id":_arg_1.targetId
                });
            };
        }

        public function set c1(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3118c1;
            if (_local_2 !== _arg_1)
            {
                this._3118c1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c1", _local_2, _arg_1));
            };
        }

        public function set c5(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3122c5;
            if (_local_2 !== _arg_1)
            {
                this._3122c5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c5", _local_2, _arg_1));
            };
        }

        public function set c6(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3123c6;
            if (_local_2 !== _arg_1)
            {
                this._3123c6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c6", _local_2, _arg_1));
            };
        }

        public function set c3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3120c3;
            if (_local_2 !== _arg_1)
            {
                this._3120c3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c3", _local_2, _arg_1));
            };
        }

        public function set c4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3121c4;
            if (_local_2 !== _arg_1)
            {
                this._3121c4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c4", _local_2, _arg_1));
            };
        }

        public function set c7(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3124c7;
            if (_local_2 !== _arg_1)
            {
                this._3124c7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c7", _local_2, _arg_1));
            };
        }

        public function set c8(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3125c8;
            if (_local_2 !== _arg_1)
            {
                this._3125c8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c8", _local_2, _arg_1));
            };
        }

        public function __btnPersonal_click(_arg_1:MouseEvent):void
        {
            switchChannel("Personal");
            updateChannel();
        }

        public function __btnWorld_click(_arg_1:MouseEvent):void
        {
            switchChannel("World");
            updateChannel();
        }

        public function set button2(_arg_1:Button):void
        {
            var _local_2:Object = this._241352512button2;
            if (_local_2 !== _arg_1)
            {
                this._241352512button2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button2", _local_2, _arg_1));
            };
        }

        public function set button3(_arg_1:Button):void
        {
            var _local_2:Object = this._241352513button3;
            if (_local_2 !== _arg_1)
            {
                this._241352513button3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button3", _local_2, _arg_1));
            };
        }

        public function set button4(_arg_1:Button):void
        {
            var _local_2:Object = this._241352514button4;
            if (_local_2 !== _arg_1)
            {
                this._241352514button4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button4", _local_2, _arg_1));
            };
        }

        public function set button1(_arg_1:Button):void
        {
            var _local_2:Object = this._241352511button1;
            if (_local_2 !== _arg_1)
            {
                this._241352511button1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnWorld():BasicShadowButton
        {
            return (this._2100905622btnWorld);
        }

        public function __c3_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Guild");
        }

        public function showRedMsg(_arg_1:String):void
        {
            var _local_2:String;
            if ((((_arg_1) && (_arg_1)) && (_arg_1.length > 1)))
            {
                _local_2 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[8]) + Language.CHATCANVAS_S[2]) + TextUtil.decode(_arg_1)) + "</font><br/>");
                textEvent.push(_local_2);
                ((getInterfaceData("Event")) && (textAll.push(_local_2)));
                updateChannel();
            };
        }

        private function initTextField():void
        {
            textOutput = allTextOutput;
            textOutput2 = headline;
            allTextOutput.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            allTextOutput.addEventListener(FlexEvent.VALUE_COMMIT, onValueCommit);
            headline.field.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            var _local_1:Object = new Object();
            _local_1.fontWeight = "bold";
            headline.styleSheet.setStyle("div", _local_1);
        }

        public function set c9(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3126c9;
            if (_local_2 !== _arg_1)
            {
                this._3126c9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c9", _local_2, _arg_1));
            };
        }

        private function onValueCommit(_arg_1:Event):void
        {
            var _local_2:LinkTextArea = (_arg_1.target as LinkTextArea);
            if (_scrollFlag)
            {
                if (_local_2.text == null)
                {
                    return;
                };
                maxScroll(_local_2);
            }
            else
            {
                _local_2.verticalScrollPosition = _lastPosition;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnPersonal():BasicShadowButton
        {
            return (this._2071991108btnPersonal);
        }

        public function __btnTeam_click(_arg_1:MouseEvent):void
        {
            switchChannel("Team");
            updateChannel();
        }

        public function showHelpMsg(_arg_1:String):void
        {
            var _local_2:* = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[9]) + Language.CHATCANVAS_S[3]) + TextUtil.decode(_arg_1)) + "</font><br/>");
            textSystem.push(_local_2);
            ((getInterfaceData("System")) && (textAll.push(_local_2)));
            updateChannel();
        }

        public function update():void
        {
        }

        private function getInterfaceData(_arg_1:String):Boolean
        {
            return ((_channelListSetting[_arg_1]) || (_channelListSetting[_arg_1] == undefined));
        }

        public function __button2_mouseDown(_arg_1:MouseEvent):void
        {
            expandOutputArea();
        }

        [Bindable(event="propertyChange")]
        public function get btnTeam():BasicShadowButton
        {
            return (this._206218969btnTeam);
        }

        public function __c8_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Event");
        }

        private function _ChatCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAll.label = _arg_1;
            }, "btnAll.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAll.toolTip = _arg_1;
            }, "btnAll.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnWorld.label = _arg_1;
            }, "btnWorld.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnScene.label = _arg_1;
            }, "btnScene.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnGuild.label = _arg_1;
            }, "btnGuild.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnTeam.label = _arg_1;
            }, "btnTeam.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnWisper.label = _arg_1;
            }, "btnWisper.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPersonal.label = _arg_1;
            }, "btnPersonal.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSystem.label = _arg_1;
            }, "btnSystem.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnEvent.label = _arg_1;
            }, "btnEvent.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnRumour.label = _arg_1;
            }, "btnRumour.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button1.toolTip = _arg_1;
            }, "button1.toolTip");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button2.toolTip = _arg_1;
            }, "button2.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button3.toolTip = _arg_1;
            }, "button3.toolTip");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                button4.toolTip = _arg_1;
            }, "button4.toolTip");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVA_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChatCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_ChatCanvas_BasicTitleCanvas1.text");
            result[15] = binding;
            binding = new Binding(this, function ():Function
            {
                return (switchSettingVisible);
            }, function (_arg_1:Function):void
            {
                _ChatCanvas_BasicTitleCanvas1.closeFunc = _arg_1;
            }, "_ChatCanvas_BasicTitleCanvas1.closeFunc");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c1.label = _arg_1;
            }, "c1.label");
            result[17] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("World"));
            }, function (_arg_1:Boolean):void
            {
                c1.selected = _arg_1;
            }, "c1.selected");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c2.label = _arg_1;
            }, "c2.label");
            result[19] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Scene"));
            }, function (_arg_1:Boolean):void
            {
                c2.selected = _arg_1;
            }, "c2.selected");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c3.label = _arg_1;
            }, "c3.label");
            result[21] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Guild"));
            }, function (_arg_1:Boolean):void
            {
                c3.selected = _arg_1;
            }, "c3.selected");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c4.label = _arg_1;
            }, "c4.label");
            result[23] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Team"));
            }, function (_arg_1:Boolean):void
            {
                c4.selected = _arg_1;
            }, "c4.selected");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c5.label = _arg_1;
            }, "c5.label");
            result[25] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Wisper"));
            }, function (_arg_1:Boolean):void
            {
                c5.selected = _arg_1;
            }, "c5.selected");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c6.label = _arg_1;
            }, "c6.label");
            result[27] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Personal"));
            }, function (_arg_1:Boolean):void
            {
                c6.selected = _arg_1;
            }, "c6.selected");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c7.label = _arg_1;
            }, "c7.label");
            result[29] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("System"));
            }, function (_arg_1:Boolean):void
            {
                c7.selected = _arg_1;
            }, "c7.selected");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c8.label = _arg_1;
            }, "c8.label");
            result[31] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Event"));
            }, function (_arg_1:Boolean):void
            {
                c8.selected = _arg_1;
            }, "c8.selected");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHATCANVAS_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c9.label = _arg_1;
            }, "c9.label");
            result[33] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("Rumour"));
            }, function (_arg_1:Boolean):void
            {
                c9.selected = _arg_1;
            }, "c9.selected");
            result[34] = binding;
            return (result);
        }

        public function showGMChatMsg(_arg_1:String, _arg_2:String, _arg_3:Number):void
        {
            var _local_4:* = ChatPanelUtil.gmPanelManagerObj[_arg_2];
            if (ChatPanelUtil.gmChatData[_arg_2] == undefined)
            {
                ChatPanelUtil.gmChatData[_arg_2] = "";
            };
            ChatPanelUtil.gmChatData[_arg_2] = (ChatPanelUtil.gmChatData[_arg_2] + (((("<font color='#ff0000'>GM " + ToolKit.getTimeStrNow()) + "</font><br>") + _arg_1) + "<br>"));
            if (_local_4 != undefined)
            {
                _local_4.showOutput();
                ChatPanelUtil.gmPanelStatusObj[_arg_2] = "read";
            }
            else
            {
                ChatPanelUtil.gmPanelStatusObj[_arg_2] = "unread";
                _core.addWarn({
                    "warnType":GamePredef.WARN_TYPE_CHATGM,
                    "gmName":_arg_2
                });
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnGuild():BasicShadowButton
        {
            return (this._2086299383btnGuild);
        }

        [Bindable(event="propertyChange")]
        public function get canvasOutputBack():SimpleCanvas
        {
            return (this._1025879296canvasOutputBack);
        }

        [Bindable(event="propertyChange")]
        public function get channelListSettingCanvas():Canvas
        {
            return (this._2073259271channelListSettingCanvas);
        }

        public function showBlueMsg(_arg_1:String):void
        {
            var _local_2:* = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[7]) + Language.CHATCANVAS_S[1]) + TextUtil.decode(_arg_1)) + "</font><br/>");
            textPersonal.push(_local_2);
            ((getInterfaceData("Personal")) && (textAll.push(_local_2)));
            updateChannel();
        }

        public function onP2pWisper(_arg_1:String, _arg_2:Number, _arg_3:String, _arg_4:Boolean=true):void
        {
            var _local_6:String;
            var _local_7:String;
            if (_core.isBlack(_arg_3))
            {
                return;
            };
            var _local_5:* = ChatPanelUtil.panelManagerObj[_arg_2];
            if (ChatPanelUtil.chatData[_arg_2] == undefined)
            {
                ChatPanelUtil.chatData[_arg_2] = "";
            };
            ChatPanelUtil.chatData[_arg_2] = (ChatPanelUtil.chatData[_arg_2] + TextUtil.decode(_arg_1));
            if (_local_5 != undefined)
            {
                _local_5.showOutput();
                ChatPanelUtil.panelStatusObj[_arg_2] = "read";
            }
            else
            {
                ChatPanelUtil.panelStatusObj[_arg_2] = "unread";
                _core.addWarn({
                    "warnType":GamePredef.WARN_TYPE_P2PWISPER,
                    "speaker":_arg_2,
                    "speakerName":_arg_3
                });
            };
            if (((_arg_4) && (_core.view.getUI(ViewManager.PANEL_CHATCONFIG).isAutoReply())))
            {
                return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get allTextOutput():LinkTextArea
        {
            return (this._1300329743allTextOutput);
        }

        public function init():void
        {
            initTextField();
            setTimeout(systemTip, 10000);
            allTextOutput.field.mouseEnabled = false;
            headline.field.mouseEnabled = false;
            clearAllChannels();
            switchChannel("All");
        }

        [Bindable(event="propertyChange")]
        public function get btnWisper():BasicShadowButton
        {
            return (this._698057496btnWisper);
        }

        public function __c5_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Wisper");
        }

        public function set btnScene(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._2096841616btnScene;
            if (_local_2 !== _arg_1)
            {
                this._2096841616btnScene = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnScene", _local_2, _arg_1));
            };
        }

        private function switchScroll():void
        {
            _scrollFlag = (!(_scrollFlag));
            button4.selected = (!(_scrollFlag));
        }

        private function switchChannel(_arg_1:String):void
        {
            var _local_2:Button = this[("btn" + _arg_1)];
            if (_chosenChannelBtn == _local_2)
            {
                _channelBtnChanged = false;
            }
            else
            {
                if (_chosenChannelBtn)
                {
                    _chosenChannelBtn.selected = false;
                    _chosenChannelBtn.setStyle("color", "#39c0ff");
                    _chosenChannelBtn.setStyle("textRollOverColor", "#39c0ff");
                };
                _local_2.selected = true;
                _local_2.setStyle("color", "#cc7171");
                _local_2.setStyle("textRollOverColor", "#cc7171");
                _chosenChannelBtn = _local_2;
                _channelBtnChanged = true;
            };
        }

        public function set btnWorld(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._2100905622btnWorld;
            if (_local_2 !== _arg_1)
            {
                this._2100905622btnWorld = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnWorld", _local_2, _arg_1));
            };
        }

        private function reduceOutputArea():void
        {
            if (height > HEIGHT_MIN)
            {
                height = (height - HEIGHT_STEP);
            };
        }

        public function set btnEvent(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._2084478366btnEvent;
            if (_local_2 !== _arg_1)
            {
                this._2084478366btnEvent = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnEvent", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get button1():Button
        {
            return (this._241352511button1);
        }

        [Bindable(event="propertyChange")]
        public function get button2():Button
        {
            return (this._241352512button2);
        }

        [Bindable(event="propertyChange")]
        public function get button3():Button
        {
            return (this._241352513button3);
        }

        private function _ChatCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHATCANVAS_S[11];
            _local_1 = Language.CHATCANVAS_S[20];
            _local_1 = Language.CHATCANVAS_S[12];
            _local_1 = Language.CHATCANVAS_S[13];
            _local_1 = Language.CHATCANVAS_S[14];
            _local_1 = Language.CHATCANVAS_S[15];
            _local_1 = Language.CHATCANVAS_S[16];
            _local_1 = Language.CHATCANVAS_S[17];
            _local_1 = Language.CHATCANVAS_S[18];
            _local_1 = Language.CHATCANVAS_S[19];
            _local_1 = Language.CHATCANVAS_S[21];
            _local_1 = Language.CHATCANVAS_S[5];
            _local_1 = Language.CHATCANVAS_S[6];
            _local_1 = Language.CHATCANVAS_S[7];
            _local_1 = Language.CHATCANVAS_S[10];
            _local_1 = Language.AUTOBATTLECANVA_S[0];
            _local_1 = switchSettingVisible;
            _local_1 = Language.CHATCANVAS_S[12];
            _local_1 = getInterfaceData("World");
            _local_1 = Language.CHATCANVAS_S[13];
            _local_1 = getInterfaceData("Scene");
            _local_1 = Language.CHATCANVAS_S[14];
            _local_1 = getInterfaceData("Guild");
            _local_1 = Language.CHATCANVAS_S[15];
            _local_1 = getInterfaceData("Team");
            _local_1 = Language.CHATCANVAS_S[16];
            _local_1 = getInterfaceData("Wisper");
            _local_1 = Language.CHATCANVAS_S[17];
            _local_1 = getInterfaceData("Personal");
            _local_1 = Language.CHATCANVAS_S[18];
            _local_1 = getInterfaceData("System");
            _local_1 = Language.CHATCANVAS_S[19];
            _local_1 = getInterfaceData("Event");
            _local_1 = Language.CHATCANVAS_S[21];
            _local_1 = getInterfaceData("Rumour");
        }

        public function set btnAll(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._1378839131btnAll;
            if (_local_2 !== _arg_1)
            {
                this._1378839131btnAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAll", _local_2, _arg_1));
            };
        }

        private function clickBtnAll():void
        {
            if (!btnAll.selected)
            {
                switchChannel("All");
                updateChannel();
            }
            else
            {
                switchSettingVisible();
            };
        }

        public function reset():void
        {
            allTextOutput.htmlText = "";
            headline.htmlText = "";
            clearChannel();
            if (systemTipTimer)
            {
                systemTipTimer.removeEventListener(TimerEvent.TIMER, systemTipHandler);
                systemTipTimer.stop();
            };
        }

        private function maxScroll(_arg_1:TextArea):void
        {
            if (_arg_1.verticalScrollPosition > (_arg_1.maxVerticalScrollPosition - 80))
            {
                _arg_1.verticalScrollPosition = _arg_1.maxVerticalScrollPosition;
                _lastPosition = _arg_1.maxVerticalScrollPosition;
            }
            else
            {
                _arg_1.verticalScrollPosition = _lastPosition;
            };
        }

        public function set btnSystem(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._598321067btnSystem;
            if (_local_2 !== _arg_1)
            {
                this._598321067btnSystem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnSystem", _local_2, _arg_1));
            };
        }

        public function onClearSay():void
        {
            headline.htmlText = "";
        }

        public function __c2_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Scene");
        }

        public function checkPoint(_arg_1:int, _arg_2:int):Boolean
        {
            return ((textOutput.checkPoint(_arg_1, _arg_2)) || (textOutput2.checkPoint(_arg_1, _arg_2)));
        }

        private function expandOutputArea():void
        {
            if (height < HEIGHT_MAX)
            {
                height = (height + HEIGHT_STEP);
            };
        }

        [Bindable(event="propertyChange")]
        public function get button4():Button
        {
            return (this._241352514button4);
        }

        public function __btnEvent_click(_arg_1:MouseEvent):void
        {
            switchChannel("Event");
            updateChannel();
        }

        public function __button3_mouseDown(_arg_1:MouseEvent):void
        {
            reduceOutputArea();
        }

        override public function initialize():void
        {
            var target:ChatCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChatCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_ChatCanvasWatcherSetupUtil");
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

        public function onSay(_arg_1:Object):void
        {
            var _local_7:Object;
            var _local_8:String;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = "";
            if (_arg_1.cname != null)
            {
                _local_2 = _arg_1.cname;
            }
            else
            {
                _local_2 = _arg_1.name;
            };
            if (_core.isBlack(_local_2))
            {
                return;
            };
            var _local_3:Object = {};
            _local_3.channelId = _arg_1.channelId;
            _local_3.type = GamePredef.MSG_TYPE_NORMAL;
            _local_3.targetId = NaN;
            _local_3.text = _arg_1.msg;
            _local_3.sourceName = _arg_1.name;
            _local_3.sourceIdType = _arg_1.type;
            _local_3.sourceId = _arg_1.id;
            if (!_arg_1.pmLevel)
            {
                _arg_1.pmLevel = 0;
            };
            _local_3.pmLevel = _arg_1.pmLevel;
            switch (_arg_1.channelId)
            {
                case GamePredef.MSG_CHANNEL_LOCAL:
                    _local_7 = _core.getGameObject(_arg_1.type, _arg_1.id);
                    if (((!(_local_7.view == null)) && (!(GamePredef.GLOBAL_SETTING.hc))))
                    {
                        _local_7.view.onSay(_arg_1.msg);
                    };
                    break;
            };
            var _local_4:* = "";
            if (_arg_1.name == "系统")
            {
                _local_4 = ((((((((((((((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[_arg_1.channelId]) + "'>") + GamePredef.PM_CHAT_FLAG[_arg_1.pmLevel]) + "<a href='event:L_C|") + _arg_1.channelId) + "'>[") + GamePredef.MSG_CHANNEL[_arg_1.channelId].label) + "]</a>") + "<font color='") + GamePredef.MSG_EVENTTEXT_COLOR[3]) + "'>[") + _arg_1.name) + "]</font>:") + TextUtil.decode(_arg_1.msg)) + "</font><br/>");
            }
            else
            {
                _local_4 = (TextUtil.decodeChatMsg(_local_3) + "<br/>");
            };
            var _local_5:* = ((Number(_arg_1.channelId)) || (0));
            if (((_local_5 < 4) || (_local_5 == 9)))
            {
                (((_local_5 == 0) && (_local_8 = "Scene")) && (textScene.push(_local_4)));
                (((_local_5 == 1) && (_local_8 = "World")) && (textWorld.push(_local_4)));
                (((_local_5 == 2) && (_local_8 = "Guild")) && (textGuild.push(_local_4)));
                (((_local_5 == 3) && (_local_8 = "Team")) && (textTeam.push(_local_4)));
                (((_local_5 == 9) && (_local_8 = "Rumour")) && (textRumour.push(_local_4)));
                ((getInterfaceData(_local_8)) && (textAll.push(_local_4)));
                updateChannel();
            }
            else
            {
                if (_local_5 == GamePredef.MSG_CHANNEL_HEADLINE)
                {
                    if (GamePredef.MSG_CHANNEL[4].selected)
                    {
                        headline.htmlText = ("<br/><br/>" + _local_4);
                    };
                    _lastHeadlineTimestamp = new Date().valueOf();
                };
            };
            var _local_6:* = new Date().valueOf();
            if ((_local_6 - _lastHeadlineTimestamp) >= 1800000)
            {
                headline.htmlText = "";
            };
        }

        public function set btnPersonal(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._2071991108btnPersonal;
            if (_local_2 !== _arg_1)
            {
                this._2071991108btnPersonal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPersonal", _local_2, _arg_1));
            };
        }

        public function __c7_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "System");
        }

        [Bindable(event="propertyChange")]
        public function get btnEvent():BasicShadowButton
        {
            return (this._2084478366btnEvent);
        }

        [Bindable(event="propertyChange")]
        public function get btnScene():BasicShadowButton
        {
            return (this._2096841616btnScene);
        }

        public function onFaultChatGM(_arg_1:String, _arg_2:String):void
        {
            var _local_3:* = ChatPanelUtil.gmPanelManagerObj[_arg_2];
            if (ChatPanelUtil.gmChatData[_arg_2] == undefined)
            {
                ChatPanelUtil.gmChatData[_arg_2] = "";
            };
            ChatPanelUtil.gmChatData[_arg_2] = (ChatPanelUtil.gmChatData[_arg_2] + (((("<font color='#ff0000'>" + Language.CHATGMPANEL_U[4]) + " ") + _arg_1) + "</font><br>"));
            if (_local_3 != undefined)
            {
                _local_3.showOutput();
                ChatPanelUtil.gmPanelStatusObj[_arg_2] = "read";
            }
            else
            {
                ChatPanelUtil.gmPanelStatusObj[_arg_2] = "unread";
                _core.addWarn({
                    "warnType":GamePredef.WARN_TYPE_CHATGM,
                    "gmName":_arg_2
                });
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAll():BasicShadowButton
        {
            return (this._1378839131btnAll);
        }

        [Bindable(event="propertyChange")]
        public function get btnSystem():BasicShadowButton
        {
            return (this._598321067btnSystem);
        }

        public function set headline(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1115058732headline;
            if (_local_2 !== _arg_1)
            {
                this._1115058732headline = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headline", _local_2, _arg_1));
            };
        }

        public function set btnTeam(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._206218969btnTeam;
            if (_local_2 !== _arg_1)
            {
                this._206218969btnTeam = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnTeam", _local_2, _arg_1));
            };
        }

        public function __btnWisper_click(_arg_1:MouseEvent):void
        {
            switchChannel("Wisper");
            updateChannel();
        }

        private function systemTipHandler(_arg_1:TimerEvent):void
        {
            if (_core.player.level <= 10)
            {
                showHelpMsg(GamePredef.SYSTEM_TIP[1][_core.basic.rand3(0, (GamePredef.SYSTEM_TIP[1].length - 1))]);
            }
            else
            {
                if (((_core.player.level > 10) && (_core.player.level <= 30)))
                {
                    showHelpMsg(GamePredef.SYSTEM_TIP[2][_core.basic.rand3(0, (GamePredef.SYSTEM_TIP[2].length - 1))]);
                }
                else
                {
                    if (_core.player.level > 30)
                    {
                        showHelpMsg(GamePredef.SYSTEM_TIP[3][_core.basic.rand3(0, (GamePredef.SYSTEM_TIP[3].length - 1))]);
                    }
                    else
                    {
                        systemTip();
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get headline():LinkTextArea
        {
            return (this._1115058732headline);
        }

        public function initView():void
        {
        }

        public function __allTextOutput_scroll(_arg_1:ScrollEvent):void
        {
            if (allTextOutput.verticalScrollPosition != 0)
            {
                _lastPosition = allTextOutput.verticalScrollPosition;
            };
        }

        public function __c4_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "Team");
        }

        public function showGMMsg(_arg_1:String):void
        {
            var _local_2:* = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[0]) + "'><a href='event:GM' >[GM]:</a>") + TextUtil.decode(_arg_1)) + "</font><br/>");
            textWisper.push(_local_2);
            ((getInterfaceData("Wisper")) && (textAll.push(_local_2)));
            updateChannel();
        }

        public function set btnGuild(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._2086299383btnGuild;
            if (_local_2 !== _arg_1)
            {
                this._2086299383btnGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGuild", _local_2, _arg_1));
            };
        }

        private function updataInterface(_arg_1:Event, _arg_2:String):void
        {
            var _local_3:Boolean = (_arg_1.target as CheckBox).selected;
            _channelListSetting[_arg_2] = _local_3;
        }

        public function clearChannel():void
        {
            var _local_1:*;
            for (_local_1 in _map)
            {
                if (this[("btn" + _local_1)].selected)
                {
                    ArrayQueue(_map[_local_1]).clear();
                    break;
                };
            };
            allTextOutput.htmlText = "";
            headline.htmlText = "";
            textOutput.htmlText = "";
        }

        public function __btnScene_click(_arg_1:MouseEvent):void
        {
            switchChannel("Scene");
            updateChannel();
        }

        public function updateChannel():void
        {
            var _local_2:*;
            var _local_1:ArrayQueue = textAll;
            for (_local_2 in _map)
            {
                if (this[("btn" + _local_2)].selected)
                {
                    _local_1 = (_map[_local_2] as ArrayQueue);
                    break;
                };
            };
            if (((_channelBtnChanged) || (_local_1.dataUpdated)))
            {
                allTextOutput.htmlText = _local_1.join();
            };
        }

        private function systemTip():void
        {
            if (systemTipTimer)
            {
                systemTipTimer.removeEventListener(TimerEvent.TIMER, systemTipHandler);
                systemTipTimer.stop();
            };
            if ((((_core) && (_core.player)) && (_core.player.level <= 30)))
            {
                systemTipTimer = new Timer(300000);
                systemTipTimer.addEventListener(TimerEvent.TIMER, systemTipHandler);
                systemTipTimer.start();
            }
            else
            {
                if ((((_core) && (_core.player)) && (_core.player.level > 30)))
                {
                    systemTipTimer = new Timer(((30 * 60) * 1000));
                    systemTipTimer.addEventListener(TimerEvent.TIMER, systemTipHandler);
                    systemTipTimer.start();
                }
                else
                {
                    setTimeout(systemTip, 30000);
                };
            };
        }

        public function set btnRumour(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._565814782btnRumour;
            if (_local_2 !== _arg_1)
            {
                this._565814782btnRumour = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnRumour", _local_2, _arg_1));
            };
        }

        public function __headline_valueCommit(_arg_1:FlexEvent):void
        {
            headline.verticalScrollPosition = headline.maxVerticalScrollPosition;
        }

        [Bindable(event="propertyChange")]
        public function get btnRumour():BasicShadowButton
        {
            return (this._565814782btnRumour);
        }


    }
}//package com.qeedoo.ui.view.compMain

