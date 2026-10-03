// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.SystemBarCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.EmotionCanvas;
    import mx.containers.Canvas;
    import mx.effects.WipeDown;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicShadowButton;
    import mx.effects.WipeUp;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.LinkTextInput;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.ToolTipEvent;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.setTimeout;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.ui.view.compDragable.CharactorPanel;
    import com.qeedoo.game.config.ItemConfig;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.utils.ArrayUtil;
    import flash.ui.Keyboard;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.view.compDragable.PetManagerPanel;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererChannel;
    import mx.events.ListEvent;
    import mx.binding.Binding;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
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

    public class SystemBarCanvas extends SimpleCanvas implements IMainUI, IBindingClient 
    {

        private static const BRINK_DELAY:int = 500;
        private static const WORLD_DELAY:int = (5 * 60000);//300000
        private static const RUMOUR_DELAY:int = (5 * 60000);//300000
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _205715410btnChar:Button;
        private var _selectedBtn:Button;
        private var _1378838516btnBag:Button;
        private var _3240em:EmotionCanvas;
        private var _2092676Can4:Canvas;
        private var _1378839414btnAch:Button;
        private var _2095530982btnQuest:Button;
        private var _94068864btnIM:Button;
        private var _1058484855wipeDown:WipeDown;
        public var _SystemBarCanvas_Button1:Button;
        public var _SystemBarCanvas_BasicGlowButton1:BasicGlowButton;
        private var _2086216067btnGroup:Button;
        private var _2097083733btnSkill:Button;
        private var _2086299383btnGuild:Button;
        private var _8943439mainChat:ChatCanvas;
        private var _450562297btnChannel:BasicShadowButton;
        private var isRumourFree:Boolean = true;
        private var _2082933021btnDaily:Button;
        private var filterNum:int = 0;
        private var _787692222wipeUp:WipeUp;
        private var inputIndex:Number = 0;
        private var brinkTimer:Timer;
        private var _btnLabel:String = "";
        private var _912622042hidebtn:Button;
        private var _is_World_Free:Boolean = true;
        private var _1058056547textInput:LinkTextInput;
        private var _last_Time:Number = 0;
        private var _94069079btnPK:Button;
        private var _1378824925btnPet:Button;
        private var lastRumourTime:Number = 0;
        private var _2092680Can8:Canvas;
        private var _288475836sysBtnBar:SimpleCanvas;
        private var _273901633channelList:List;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ChatCanvas,
                        "id":"mainChat",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "38";
                            this.left = "1";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":439});
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":440,
                                "height":38,
                                "styleName":"ChatBar",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_SystemBarCanvas_Button1",
                                    "events":{"click":"___SystemBarCanvas_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":24,
                                            "height":23,
                                            "styleName":"BtnChatUserEm",
                                            "x":408,
                                            "y":8
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkTextInput,
                                    "id":"textInput",
                                    "events":{
                                        "valueCommit":"__textInput_valueCommit",
                                        "enter":"__textInput_enter",
                                        "keyDown":"__textInput_keyDown",
                                        "rollOver":"__textInput_rollOver"
                                    },
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "9";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":55,
                                            "width":296,
                                            "height":21,
                                            "maxChars":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicShadowButton,
                                    "id":"btnChannel",
                                    "events":{
                                        "click":"__btnChannel_click",
                                        "creationComplete":"__btnChannel_creationComplete"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnChatDQ",
                                            "x":8,
                                            "y":8,
                                            "width":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_SystemBarCanvas_BasicGlowButton1",
                                    "events":{"click":"___SystemBarCanvas_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":359,
                                            "width":45,
                                            "y":8,
                                            "styleName":"ChatButton",
                                            "height":22
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":List,
                        "id":"channelList",
                        "events":{"itemClick":"__channelList_itemClick"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                            this.left = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"ListChannel",
                                "visible":false,
                                "width":51,
                                "height":105,
                                "itemRenderer":_SystemBarCanvas_ClassFactory1_c(),
                                "selectable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"sysBtnBar",
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                            this.bottom = "-8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":462,
                                "height":56,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnDaily",
                                    "events":{
                                        "toolTipShown":"__btnDaily_toolTipShown",
                                        "click":"__btnDaily_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":-46,
                                            "height":45,
                                            "width":40,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarRichang"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnAch",
                                    "events":{
                                        "toolTipShown":"__btnAch_toolTipShown",
                                        "click":"__btnAch_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":-1,
                                            "height":45,
                                            "width":40,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarAch"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnPK",
                                    "events":{
                                        "toolTipShown":"__btnPK_toolTipShown",
                                        "click":"__btnPK_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":45,
                                            "height":45,
                                            "width":40,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarPK"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnChar",
                                    "events":{
                                        "toolTipShown":"__btnChar_toolTipShown",
                                        "click":"__btnChar_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":87,
                                            "width":40,
                                            "height":45,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarPlayer"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnBag",
                                    "events":{
                                        "toolTipShown":"__btnBag_toolTipShown",
                                        "click":"__btnBag_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":132,
                                            "width":40,
                                            "height":45,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarBag"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnPet",
                                    "events":{
                                        "toolTipShown":"__btnPet_toolTipShown",
                                        "click":"__btnPet_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":176,
                                            "width":40,
                                            "height":45,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarPet",
                                            "y":1
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"Can4",
                                    "events":{
                                        "toolTipShown":"__Can4_toolTipShown",
                                        "click":"__Can4_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":220,
                                            "y":0,
                                            "width":46,
                                            "height":51.5,
                                            "styleName":"BtnBarTeamBig",
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnGroup",
                                    "events":{
                                        "toolTipShown":"__btnGroup_toolTipShown",
                                        "click":"__btnGroup_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":223,
                                            "y":0,
                                            "width":40,
                                            "height":44.8,
                                            "styleName":"BtnBarTeam",
                                            "buttonMode":true,
                                            "useHandCursor":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnSkill",
                                    "events":{
                                        "toolTipShown":"__btnSkill_toolTipShown",
                                        "click":"__btnSkill_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":269,
                                            "width":40,
                                            "height":45,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarSkill"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnIM",
                                    "events":{
                                        "toolTipShown":"__btnIM_toolTipShown",
                                        "click":"__btnIM_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":313,
                                            "width":40,
                                            "height":45,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarIm"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"Can8",
                                    "events":{
                                        "toolTipShown":"__Can8_toolTipShown",
                                        "click":"__Can8_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":380,
                                            "y":23,
                                            "width":51,
                                            "height":59.6,
                                            "styleName":"BtnBarQuestBig",
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnQuest",
                                    "events":{
                                        "toolTipShown":"__btnQuest_toolTipShown",
                                        "click":"__btnQuest_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":375,
                                            "y":23,
                                            "width":51,
                                            "height":59.6,
                                            "styleName":"BtnBarQuest",
                                            "buttonMode":true,
                                            "useHandCursor":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnGuild",
                                    "events":{
                                        "toolTipShown":"__btnGuild_toolTipShown",
                                        "click":"__btnGuild_click"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":400,
                                            "width":40,
                                            "height":45,
                                            "buttonMode":true,
                                            "useHandCursor":true,
                                            "styleName":"BtnBarGuild"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"hidebtn",
                        "events":{"click":"__hidebtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":12,
                                "height":36,
                                "styleName":"BtnHideButtons"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":EmotionCanvas,
                        "id":"em",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":244,
                                "y":-105,
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _vm:ViewManager = ViewManager.getInstance();
        private var _core:Core = Core.getInstance();
        private var _654601787inputTempArray:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SystemBarCanvas()
        {
            mx_internal::_document = this;
            this.percentWidth = 100;
            this.height = 50;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.cacheAsBitmap = false;
            _SystemBarCanvas_WipeDown1_i();
            _SystemBarCanvas_WipeUp1_i();
            this.addEventListener("creationComplete", ___SystemBarCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SystemBarCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get btnBag():Button
        {
            return (this._1378838516btnBag);
        }

        public function set btnChannel(_arg_1:BasicShadowButton):void
        {
            var _local_2:Object = this._450562297btnChannel;
            if (_local_2 !== _arg_1)
            {
                this._450562297btnChannel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnChannel", _local_2, _arg_1));
            };
        }

        public function openandhide():void
        {
            if (sysBtnBar.visible)
            {
                _core.hidesysbar = true;
                sysBtnBar.visible = false;
                hidebtn.styleName = "BtnShowButtons";
            }
            else
            {
                _core.hidesysbar = false;
                sysBtnBar.visible = true;
                hidebtn.styleName = "BtnHideButtons";
            };
        }

        public function set btnBag(_arg_1:Button):void
        {
            var _local_2:Object = this._1378838516btnBag;
            if (_local_2 !== _arg_1)
            {
                this._1378838516btnBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnBag", _local_2, _arg_1));
            };
        }

        public function __btnChar_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function __textInput_keyDown(_arg_1:KeyboardEvent):void
        {
            textInputKeydownHandler(_arg_1);
        }

        public function __btnGuild_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_GUILD);
            stopBrink(_arg_1);
        }

        public function __btnIM_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function __btnChannel_click(_arg_1:MouseEvent):void
        {
            channelList.visible = (!(channelList.visible));
        }

        public function selectLocalChannel():void
        {
            btnChannel.styleName = "BtnChatDQ";
            btnChannel.label = Language.SYSTEMBARCANVAS_U[0];
            btnChannel.data = GamePredef.MSG_CHANNEL[0];
        }

        public function setStyleNormal():void
        {
            Can8.visible = false;
            btnQuest.visible = true;
        }

        public function setTeamButtonNormal():void
        {
            Can4.visible = false;
            btnGroup.visible = true;
        }

        public function __textInput_rollOver(_arg_1:MouseEvent):void
        {
            textInput.getFocus();
        }

        public function addLink(_arg_1:String):void
        {
            setTimeout(textInput.setFocus, 5);
            textInput.htmlText = (textInput.htmlText + TextUtil.decode(_arg_1));
            textInput.htmlText = (textInput.htmlText + "<font> </font>");
            setTimeout(textInput.setSelection, 10, GamePredef.MSG_CHAT_INPUT_MAX, GamePredef.MSG_CHAT_INPUT_MAX);
        }

        private function setCharactorStyleName():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CHARACTOR);
            (_local_1 as CharactorPanel).setAddStyleName();
        }

        private function setChannel(_arg_1:Object):void
        {
            switch (_arg_1.index)
            {
                case 0:
                    btnChannel.styleName = "BtnChatDQ";
                    btnChannel.label = Language.SYSTEMBARCANVAS_U[0];
                    break;
                case 1:
                    checkGlobal((_core.hasSpeakerNum() > 0));
                    channelList.visible = false;
                    return;
                case 2:
                    btnChannel.styleName = "BtnChatGH";
                    btnChannel.label = Language.SYSTEMBARCANVAS_U[2];
                    break;
                case 3:
                    btnChannel.styleName = "BtnChatDW";
                    btnChannel.label = Language.SYSTEMBARCANVAS_U[3];
                    break;
                case 9:
                    checkRumour((_core.hasSpeakerNum() > 0));
                    channelList.visible = false;
                    return;
                case GamePredef.MSG_CHANNEL_HEADLINE:
                    checkHeadline((_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_HEADLINE_SPEAKER) > 0));
                    channelList.visible = false;
                    return;
            };
            btnChannel.label = btnChannel.label;
            btnChannel.data = _arg_1;
            channelList.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get channelList():List
        {
            return (this._273901633channelList);
        }

        public function set btnDaily(_arg_1:Button):void
        {
            var _local_2:Object = this._2082933021btnDaily;
            if (_local_2 !== _arg_1)
            {
                this._2082933021btnDaily = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnDaily", _local_2, _arg_1));
            };
        }

        public function set btnPet(_arg_1:Button):void
        {
            var _local_2:Object = this._1378824925btnPet;
            if (_local_2 !== _arg_1)
            {
                this._1378824925btnPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPet", _local_2, _arg_1));
            };
        }

        public function __btnGroup_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get inputTempArray():Array
        {
            return (this._654601787inputTempArray);
        }

        private function sendEm(_arg_1:GameEvent):void
        {
            _core.player.say(_arg_1.data, 0);
        }

        public function __btnBag_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function selectChannel(_arg_1:int):void
        {
            setChannel(ArrayUtil.getElement(GamePredef.MSG_CHANNEL, "index", _arg_1));
        }

        public function updateFreeTimeState():void
        {
            var _local_1:Number = getFreeTime();
            if (_local_1 > WORLD_DELAY)
            {
                _is_World_Free = true;
            }
            else
            {
                _is_World_Free = false;
            };
        }

        private function set inputTempArray(_arg_1:Array):void
        {
            var _local_2:Object = this._654601787inputTempArray;
            if (_local_2 !== _arg_1)
            {
                this._654601787inputTempArray = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inputTempArray", _local_2, _arg_1));
            };
        }

        public function set channelList(_arg_1:List):void
        {
            var _local_2:Object = this._273901633channelList;
            if (_local_2 !== _arg_1)
            {
                this._273901633channelList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "channelList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnIM():Button
        {
            return (this._94068864btnIM);
        }

        [Bindable(event="propertyChange")]
        public function get Can8():Canvas
        {
            return (this._2092680Can8);
        }

        [Bindable(event="propertyChange")]
        public function get btnAch():Button
        {
            return (this._1378839414btnAch);
        }

        [Bindable(event="propertyChange")]
        public function get Can4():Canvas
        {
            return (this._2092676Can4);
        }

        private function textInputKeydownHandler(_arg_1:KeyboardEvent):void
        {
            if (((_arg_1.ctrlKey) && (_arg_1.keyCode == 38)))
            {
                inputIndex = (inputIndex + 1);
                if (inputIndex > (inputTempArray.length - 1))
                {
                    inputIndex = (inputTempArray.length - 1);
                };
                textInput.htmlText = inputTempArray[inputIndex];
            }
            else
            {
                if (((_arg_1.ctrlKey) && (_arg_1.keyCode == 40)))
                {
                    inputIndex = (inputIndex - 1);
                    if (inputIndex < 0)
                    {
                        inputIndex = 0;
                    };
                    textInput.htmlText = inputTempArray[inputIndex];
                }
                else
                {
                    if (_arg_1.keyCode == Keyboard.BACKSPACE)
                    {
                        if (((!(textInput.text)) || (textInput.text.length <= 0)))
                        {
                            textInput.htmlText = "";
                        };
                    };
                };
            };
        }

        public function set sysBtnBar(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._288475836sysBtnBar;
            if (_local_2 !== _arg_1)
            {
                this._288475836sysBtnBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sysBtnBar", _local_2, _arg_1));
            };
        }

        public function set wipeUp(_arg_1:WipeUp):void
        {
            var _local_2:Object = this._787692222wipeUp;
            if (_local_2 !== _arg_1)
            {
                this._787692222wipeUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wipeUp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get textInput():LinkTextInput
        {
            return (this._1058056547textInput);
        }

        public function __btnAch_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get em():EmotionCanvas
        {
            return (this._3240em);
        }

        public function __btnPet_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function setSysBtnBarState(_arg_1:Boolean):void
        {
            if (this.sysBtnBar)
            {
                this.sysBtnBar.visible = _arg_1;
            };
        }

        public function set btnSkill(_arg_1:Button):void
        {
            var _local_2:Object = this._2097083733btnSkill;
            if (_local_2 !== _arg_1)
            {
                this._2097083733btnSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnSkill", _local_2, _arg_1));
            };
        }

        private function stopBrink(_arg_1:Event):void
        {
            if (((_selectedBtn) && (_selectedBtn == _arg_1.currentTarget)))
            {
                brinkTimer.stop();
                _selectedBtn.filters = [];
            };
        }

        public function ___SystemBarCanvas_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            send();
        }

        [Bindable(event="propertyChange")]
        public function get mainChat():ChatCanvas
        {
            return (this._8943439mainChat);
        }

        public function __btnPK_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function __btnPK_click(_arg_1:MouseEvent):void
        {
            selectTarget(_arg_1, GamePredef.ACTION_PK);
        }

        public function set btnPK(_arg_1:Button):void
        {
            var _local_2:Object = this._94069079btnPK;
            if (_local_2 !== _arg_1)
            {
                this._94069079btnPK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPK", _local_2, _arg_1));
            };
        }

        public function __btnQuest_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function update():void
        {
        }

        private function checkGlobal(_arg_1:Boolean):void
        {
            var _local_2:Boolean;
            var _local_3:String;
            var _local_4:Object;
            updateFreeTimeState();
            if (_arg_1)
            {
                btnChannel.styleName = "BtnChatSJ";
                btnChannel.label = Language.SYSTEMBARCANVAS_U[1];
                btnChannel.data = GamePredef.MSG_CHANNEL[1];
                if (_is_World_Free)
                {
                    _core.sysMidNote(Language.SYSTEMBARCANVAS_S[1]);
                }
                else
                {
                    _core.sysMidNote(Language.SYSTEMBARCANVAS_S[15]);
                };
            }
            else
            {
                _local_2 = true;
                if (_core.player.level < GamePredef.WORLD_SAY_LEVAL_FREE)
                {
                    _local_3 = Language.SYSTEMBARCANVAS_S[17].toString().replace("{level}", GamePredef.WORLD_SAY_LEVAL_FREE);
                    _core.sysMidNote(_local_3);
                    _is_World_Free = false;
                    _local_2 = false;
                };
                if (_is_World_Free)
                {
                    btnChannel.styleName = "BtnChatSJ";
                    btnChannel.label = Language.SYSTEMBARCANVAS_U[1];
                    btnChannel.data = GamePredef.MSG_CHANNEL[1];
                    _core.sysMidNote(Language.SYSTEMBARCANVAS_S[1]);
                }
                else
                {
                    if (_local_2)
                    {
                        _core.sysMidNote(getFreeTimeString(1));
                    };
                    channelList.selectedIndex = 0;
                    _local_4 = _core.view.getUI(ViewManager.MAIN_CONSUMP);
                    _local_4.msg = Language.SYSTEMBARCANVAS_S[3];
                    _local_4.x = 200;
                    _local_4.y = 380;
                    _local_4.itemData = {
                        "id":719,
                        "type":29
                    };
                    _local_4.shopNum = 1;
                    _local_4.numAble = true;
                };
            };
        }

        public function getFreeTime():Number
        {
            var _local_1:Number = new Date().valueOf();
            return (_local_1 - _last_Time);
        }

        private function sendMsg():void
        {
            var _local_2:Object;
            if (btnChannel.styleName == "BtnChatSJ")
            {
                updateFreeTimeState();
                if (((_core.hasSpeakerNum() < 1) && (!(_is_World_Free))))
                {
                    _core.sysMidNote(getFreeTimeString(1));
                    btnChannel.styleName = "BtnChatDQ";
                    btnChannel.label = Language.SYSTEMBARCANVAS_U[0];
                    btnChannel.data = GamePredef.MSG_CHANNEL[0];
                    return;
                };
                _last_Time = new Date().valueOf();
            }
            else
            {
                if (btnChannel.styleName == "BtnChatYY")
                {
                    updateRumourFreeTimeState();
                    if (((_core.hasSpeakerNum() < 1) && (!(isRumourFree))))
                    {
                        _core.sysMidNote(getFreeTimeString(9));
                        btnChannel.styleName = "BtnChatDQ";
                        btnChannel.label = Language.SYSTEMBARCANVAS_U[0];
                        btnChannel.data = GamePredef.MSG_CHANNEL[0];
                        return;
                    };
                    lastRumourTime = new Date().valueOf();
                };
            };
            var _local_1:String = _core.replaceBadWord(textInput.htmlText);
            if (textInput.text != "")
            {
                _local_2 = TextUtil.encodeChatMsg(btnChannel.data.index, _local_1);
                _local_2.sourceIdType = GamePredef.TBL_CHARACTOR;
                if (_local_2.type == GamePredef.MSG_TYPE_WISPER)
                {
                    _core.player.wisper(_local_2.text, _local_2.targetName);
                    inputTempArrayPush(textInput.htmlText);
                }
                else
                {
                    if (_local_2.type == GamePredef.MSG_TYPE_NORMAL)
                    {
                        _core.player.say(_local_2.text, btnChannel.data.index);
                        inputTempArrayPush(textInput.htmlText);
                    };
                };
            };
            callLater(clearInput);
        }

        public function __textInput_enter(_arg_1:FlexEvent):void
        {
            send();
        }

        private function addView():void
        {
            _core.view.addUI(ViewManager.MAIN_CHAT, mainChat, true);
            _core.view.addUI(ViewManager.MAIN_SYS_BTN_BAR, sysBtnBar, true);
        }

        public function __Can4_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        private function brinkBtn(_arg_1:TimerEvent):void
        {
            if (_selectedBtn)
            {
                if (_selectedBtn.filters.length > 0)
                {
                    _selectedBtn.filters = [];
                }
                else
                {
                    _selectedBtn.filters = [GamePredef.FILTER_CHAR_SELECTED];
                };
            };
        }

        public function __btnDaily_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function __Can8_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_QUESTMANAGER);
            stopBrink(_arg_1);
            setStyleNormal();
        }

        [Bindable(event="propertyChange")]
        public function get btnGuild():Button
        {
            return (this._2086299383btnGuild);
        }

        public function __btnChar_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_CHARACTOR);
            stopBrink(_arg_1);
            setCharactorStyleName();
        }

        private function _SystemBarCanvas_WipeUp1_i():WipeUp
        {
            var _local_1:WipeUp = new WipeUp();
            wipeUp = _local_1;
            _local_1.duration = 300;
            return (_local_1);
        }

        public function set btnIM(_arg_1:Button):void
        {
            var _local_2:Object = this._94068864btnIM;
            if (_local_2 !== _arg_1)
            {
                this._94068864btnIM = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnIM", _local_2, _arg_1));
            };
        }

        public function __hidebtn_click(_arg_1:MouseEvent):void
        {
            openandhide();
        }

        public function ___SystemBarCanvas_Button1_click(_arg_1:MouseEvent):void
        {
            em.changeVisible();
        }

        [Bindable(event="propertyChange")]
        public function get btnChannel():BasicShadowButton
        {
            return (this._450562297btnChannel);
        }

        public function set Can4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2092676Can4;
            if (_local_2 !== _arg_1)
            {
                this._2092676Can4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Can4", _local_2, _arg_1));
            };
        }

        private function checkHeadline(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                btnChannel.styleName = "BtnChatHeadline";
                btnChannel.label = Language.SYSTEMBARCANVAS_U[5];
                btnChannel.data = GamePredef.MSG_CHANNEL[4];
                _core.sysMidNote(Language.SYSTEMBARCANVAS_S[19]);
            }
            else
            {
                channelList.selectedIndex = 0;
                _local_2 = _core.view.getUI(ViewManager.MAIN_CONSUMP);
                _local_2.msg = Language.SYSTEMBARCANVAS_S[20];
                _local_2.x = 200;
                _local_2.y = 380;
                _local_2.itemData = {
                    "id":ItemConfig.ITEM_HEADLINE_SPEAKER,
                    "type":GamePredef.TBL_ITEM_TEMPLATE
                };
                _local_2.shopNum = 1;
                _local_2.numAble = true;
            };
        }

        public function set btnGroup(_arg_1:Button):void
        {
            var _local_2:Object = this._2086216067btnGroup;
            if (_local_2 !== _arg_1)
            {
                this._2086216067btnGroup = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGroup", _local_2, _arg_1));
            };
        }

        private function init():void
        {
            textInput.maxChars = GamePredef.MSG_CHAT_INPUT_MAX;
            em.addEventListener(GameEvent.PLAYER_SEND_EMOTION, sendEm);
            brinkTimer = new Timer(BRINK_DELAY);
            brinkTimer.addEventListener(TimerEvent.TIMER, brinkBtn);
            addView();
        }

        public function set wipeDown(_arg_1:WipeDown):void
        {
            var _local_2:Object = this._1058484855wipeDown;
            if (_local_2 !== _arg_1)
            {
                this._1058484855wipeDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wipeDown", _local_2, _arg_1));
            };
        }

        public function wisperChat(_arg_1:String):void
        {
            setTimeout(textInput.setFocus, 5);
            textInput.text = (("/w " + _arg_1) + " ");
            setTimeout(textInput.setSelection, 10, textInput.length, textInput.length);
        }

        public function set Can8(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2092680Can8;
            if (_local_2 !== _arg_1)
            {
                this._2092680Can8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Can8", _local_2, _arg_1));
            };
        }

        private function _SystemBarCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SYSTEMBARCANVAS_S[4];
            _local_1 = Language.SYSTEMBARCANVAS_U[0];
            _local_1 = Language.SYSTEMBARCANVAS_U[4];
            _local_1 = wipeUp;
            _local_1 = wipeDown;
            _local_1 = GamePredef.MSG_CHANNEL;
            _local_1 = Language.SYSTEMBARCANVAS_S[23];
            _local_1 = Language.SYSTEMBARCANVAS_S[22];
            _local_1 = Language.SYSTEMBARCANVAS_S[5];
            _local_1 = Language.SYSTEMBARCANVAS_S[6];
            _local_1 = Language.SYSTEMBARCANVAS_S[7];
            _local_1 = Language.SYSTEMBARCANVAS_S[8];
            _local_1 = Language.SYSTEMBARCANVAS_S[9];
            _local_1 = Language.SYSTEMBARCANVAS_S[9];
            _local_1 = Language.SYSTEMBARCANVAS_S[10];
            _local_1 = Language.SYSTEMBARCANVAS_S[11];
            _local_1 = Language.SYSTEMBARCANVAS_S[12];
            _local_1 = Language.SYSTEMBARCANVAS_S[12];
            _local_1 = Language.SYSTEMBARCANVAS_S[13];
        }

        [Bindable(event="propertyChange")]
        public function get btnDaily():Button
        {
            return (this._2082933021btnDaily);
        }

        private function setPetStyleName():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
            (_local_1 as PetManagerPanel).setAddStyleName();
        }

        public function set btnAch(_arg_1:Button):void
        {
            var _local_2:Object = this._1378839414btnAch;
            if (_local_2 !== _arg_1)
            {
                this._1378839414btnAch = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAch", _local_2, _arg_1));
            };
        }

        public function setTaskButtonBig():void
        {
            Can8.visible = true;
            btnQuest.visible = false;
        }

        public function __btnIM_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_IM);
            stopBrink(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnPet():Button
        {
            return (this._1378824925btnPet);
        }

        private function checkBlank():void
        {
            if ((((textInput) && (textInput.text)) && (textInput.text.length <= 0)))
            {
                textInput.htmlText = "";
            };
        }

        public function setInputFocus():void
        {
            textInput.setFocus();
        }

        public function set textInput(_arg_1:LinkTextInput):void
        {
            var _local_2:Object = this._1058056547textInput;
            if (_local_2 !== _arg_1)
            {
                this._1058056547textInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textInput", _local_2, _arg_1));
            };
        }

        private function _SystemBarCanvas_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererChannel;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get sysBtnBar():SimpleCanvas
        {
            return (this._288475836sysBtnBar);
        }

        private function channelClickHandler(_arg_1:ListEvent):void
        {
            var _local_2:Object = _arg_1.itemRenderer.data;
            setChannel(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get wipeUp():WipeUp
        {
            return (this._787692222wipeUp);
        }

        public function __btnPet_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_PETMANAGER);
            stopBrink(_arg_1);
            setPetStyleName();
        }

        private function _SystemBarCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemBarCanvas_Button1.toolTip = _arg_1;
            }, "_SystemBarCanvas_Button1.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnChannel.label = _arg_1;
            }, "btnChannel.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemBarCanvas_BasicGlowButton1.label = _arg_1;
            }, "_SystemBarCanvas_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():*
            {
                return (wipeUp);
            }, function (_arg_1:*):void
            {
                channelList.setStyle("showEffect", _arg_1);
            }, "channelList.showEffect");
            result[3] = binding;
            binding = new Binding(this, function ():*
            {
                return (wipeDown);
            }, function (_arg_1:*):void
            {
                channelList.setStyle("hideEffect", _arg_1);
            }, "channelList.hideEffect");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (GamePredef.MSG_CHANNEL);
            }, function (_arg_1:Object):void
            {
                channelList.dataProvider = _arg_1;
            }, "channelList.dataProvider");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnDaily.toolTip = _arg_1;
            }, "btnDaily.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAch.toolTip = _arg_1;
            }, "btnAch.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPK.toolTip = _arg_1;
            }, "btnPK.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnChar.toolTip = _arg_1;
            }, "btnChar.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnBag.toolTip = _arg_1;
            }, "btnBag.toolTip");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPet.toolTip = _arg_1;
            }, "btnPet.toolTip");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                Can4.toolTip = _arg_1;
            }, "Can4.toolTip");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnGroup.toolTip = _arg_1;
            }, "btnGroup.toolTip");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSkill.toolTip = _arg_1;
            }, "btnSkill.toolTip");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnIM.toolTip = _arg_1;
            }, "btnIM.toolTip");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                Can8.toolTip = _arg_1;
            }, "Can8.toolTip");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnQuest.toolTip = _arg_1;
            }, "btnQuest.toolTip");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMBARCANVAS_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnGuild.toolTip = _arg_1;
            }, "btnGuild.toolTip");
            result[18] = binding;
            return (result);
        }

        public function set em(_arg_1:EmotionCanvas):void
        {
            var _local_2:Object = this._3240em;
            if (_local_2 !== _arg_1)
            {
                this._3240em = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "em", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnSkill():Button
        {
            return (this._2097083733btnSkill);
        }

        public function __btnGuild_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function setTeamButtonBig():void
        {
            Can4.visible = true;
            btnGroup.visible = false;
        }

        public function set mainChat(_arg_1:ChatCanvas):void
        {
            var _local_2:Object = this._8943439mainChat;
            if (_local_2 !== _arg_1)
            {
                this._8943439mainChat = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainChat", _local_2, _arg_1));
            };
        }

        public function __Can8_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function enableUI():void
        {
            this.Can4.enabled = true;
            this.btnGroup.enabled = true;
            this.btnIM.enabled = true;
            this.btnGuild.enabled = true;
            this.btnQuest.enabled = true;
            this.btnChannel.enabled = true;
            this.btnPK.styleName = "BtnBarPK";
            this.btnPK.toolTip = Language.SYSTEMBARCANVAS_S[5];
        }

        private function clickGroupHandler(_arg_1:Event):void
        {
            _vm.changeVisible(ViewManager.PANEL_GROUP);
            stopBrink(_arg_1);
            if (_arg_1.currentTarget.id == "Can4")
            {
                _vm.getUI(ViewManager.PANEL_GROUP).setTab(1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnPK():Button
        {
            return (this._94069079btnPK);
        }

        public function __btnAch_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_ACHIEVE);
            stopBrink(_arg_1);
        }

        public function disableUI():void
        {
            this.Can4.enabled = true;
            this.btnGroup.enabled = true;
            this.btnIM.enabled = false;
            this.btnGuild.enabled = false;
            setStyleNormal();
            this.btnQuest.enabled = false;
            selectChannel(0);
            this.btnChannel.enabled = false;
        }

        private function clearInput():void
        {
            textInput.htmlText = "";
        }

        [Bindable(event="propertyChange")]
        public function get btnGroup():Button
        {
            return (this._2086216067btnGroup);
        }

        public function __btnBag_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_BAG);
            stopBrink(_arg_1);
        }

        public function __textInput_valueCommit(_arg_1:FlexEvent):void
        {
            checkBlank();
        }

        private function send():void
        {
            var handler:Function;
            if (((null == textInput.text) || (textInput.text.length <= 0)))
            {
                textInput.htmlText = "";
                return;
            };
            if (((btnChannel.styleName == "BtnChatHeadline") && (textInput.text.length >= 50)))
            {
                _core.sysMidNote(Language.SYSTEMBARCANVAS_S[0]);
                return;
            };
            if (textInput.text.length >= 100)
            {
                _core.sysMidNote(Language.SYSTEMBARCANVAS_S[0]);
                return;
            };
            if (btnChannel.styleName == "BtnChatHeadline")
            {
                if (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_HEADLINE_SPEAKER) <= 0)
                {
                    _core.sysMidNote(Language.CALLBACK_S[188]);
                    return;
                };
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        sendMsg();
                    };
                };
                Alert.show(Language.SYSTEMBARCANVAS_S[18], "", (Alert.YES | Alert.NO), null, handler);
            }
            else
            {
                sendMsg();
            };
        }

        [Bindable(event="propertyChange")]
        public function get wipeDown():WipeDown
        {
            return (this._1058484855wipeDown);
        }

        public function brink(_arg_1:int):void
        {
            _selectedBtn = this[("btn" + _arg_1)];
            brinkTimer.start();
        }

        override public function initialize():void
        {
            var target:SystemBarCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SystemBarCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_SystemBarCanvasWatcherSetupUtil");
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

        private function btnTooltipShow(_arg_1:ToolTipEvent):void
        {
            _arg_1.toolTip.y = (GamePredef.APP_HEIGHT - 80);
        }

        private function checkRumour(_arg_1:Boolean):void
        {
            var _local_2:Boolean;
            var _local_3:String;
            var _local_4:Object;
            updateRumourFreeTimeState();
            if (_arg_1)
            {
                btnChannel.styleName = "BtnChatYY";
                btnChannel.label = Language.SYSTEMBARCANVAS_U[7];
                btnChannel.data = GamePredef.MSG_CHANNEL[4];
                if (isRumourFree)
                {
                    _core.sysMidNote(Language.SYSTEMBARCANVAS_S[24]);
                }
                else
                {
                    _core.sysMidNote(Language.SYSTEMBARCANVAS_S[26]);
                };
            }
            else
            {
                _local_2 = false;
                if (_core.player.level < GamePredef.RUMOUR_SAY_LEVAL_FREE)
                {
                    _local_3 = Language.SYSTEMBARCANVAS_S[27].toString().replace("{level}", GamePredef.RUMOUR_SAY_LEVAL_FREE);
                    _core.sysMidNote(_local_3);
                    isRumourFree = false;
                    _local_2 = true;
                };
                if (isRumourFree)
                {
                    btnChannel.styleName = "BtnChatYY";
                    btnChannel.label = Language.SYSTEMBARCANVAS_U[7];
                    btnChannel.data = GamePredef.MSG_CHANNEL[4];
                    _core.sysMidNote(Language.SYSTEMBARCANVAS_S[24]);
                }
                else
                {
                    if (!_local_2)
                    {
                        _core.sysMidNote(getFreeTimeString(9));
                    };
                    channelList.selectedIndex = 0;
                    _local_4 = _core.view.getUI(ViewManager.MAIN_CONSUMP);
                    _local_4.msg = Language.SYSTEMBARCANVAS_S[28];
                    _local_4.x = 200;
                    _local_4.y = 380;
                    _local_4.itemData = {
                        "id":719,
                        "type":29
                    };
                    _local_4.shopNum = 1;
                    _local_4.numAble = true;
                    _local_4.additionalData = {"channelIndex":9};
                };
            };
        }

        public function set btnChar(_arg_1:Button):void
        {
            var _local_2:Object = this._205715410btnChar;
            if (_local_2 !== _arg_1)
            {
                this._205715410btnChar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnChar", _local_2, _arg_1));
            };
        }

        private function selectTarget(_arg_1:Event, _arg_2:int):void
        {
            if (_core.state == GamePredef.ST_BATTLE)
            {
                return;
            };
            if (((_core.player.inGroup) && (!(_core.player.isLeader))))
            {
                if (!_core.player.groupAfk)
                {
                    _core.sysMidNote(Language.NPCVIEW_S[0]);
                };
                return;
            };
            _arg_1.stopImmediatePropagation();
            _core.view.showSelect();
            _core.view.actionState = _arg_2;
        }

        public function __btnChannel_creationComplete(_arg_1:FlexEvent):void
        {
            btnChannel.data = new Object();
            btnChannel.data.index = 0;
        }

        public function __btnGroup_click(_arg_1:MouseEvent):void
        {
            clickGroupHandler(_arg_1);
            stopBrink(_arg_1);
        }

        public function set hidebtn(_arg_1:Button):void
        {
            var _local_2:Object = this._912622042hidebtn;
            if (_local_2 !== _arg_1)
            {
                this._912622042hidebtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hidebtn", _local_2, _arg_1));
            };
        }

        public function __btnSkill_toolTipShown(_arg_1:ToolTipEvent):void
        {
            btnTooltipShow(_arg_1);
        }

        public function __btnDaily_click(_arg_1:MouseEvent):void
        {
            _vm.show(ViewManager.DAILY_ACTIVITY);
        }

        public function getFreeTimeString(_arg_1:int):String
        {
            var _local_2:Number = new Date().valueOf();
            var _local_3:Number = 0;
            switch (_arg_1)
            {
                case 1:
                    _local_3 = ((WORLD_DELAY - (_local_2 - _last_Time)) * 0.001);
                    break;
                case 9:
                    _local_3 = ((RUMOUR_DELAY - (_local_2 - lastRumourTime)) * 0.001);
                    break;
            };
            var _local_4:int = int(_local_3);
            var _local_5:* = "";
            _local_5 = Language.SYSTEMBARCANVAS_S[2];
            _local_5 = _local_5.replace("{delay}", _local_4.toString());
            return (_local_5);
        }

        public function updateRumourFreeTimeState():void
        {
            var _local_1:Number = new Date().valueOf();
            if ((_local_1 - lastRumourTime) > RUMOUR_DELAY)
            {
                isRumourFree = true;
            }
            else
            {
                isRumourFree = false;
            };
        }

        public function __btnQuest_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_QUESTMANAGER);
            stopBrink(_arg_1);
        }

        private function _SystemBarCanvas_WipeDown1_i():WipeDown
        {
            var _local_1:WipeDown = new WipeDown();
            wipeDown = _local_1;
            _local_1.duration = 300;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnChar():Button
        {
            return (this._205715410btnChar);
        }

        public function set btnQuest(_arg_1:Button):void
        {
            var _local_2:Object = this._2095530982btnQuest;
            if (_local_2 !== _arg_1)
            {
                this._2095530982btnQuest = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnQuest", _local_2, _arg_1));
            };
        }

        public function initView():void
        {
            channelList.dataProvider = GamePredef.MSG_CHANNEL;
        }

        public function __channelList_itemClick(_arg_1:ListEvent):void
        {
            channelClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get hidebtn():Button
        {
            return (this._912622042hidebtn);
        }

        [Bindable(event="propertyChange")]
        public function get btnQuest():Button
        {
            return (this._2095530982btnQuest);
        }

        public function set btnGuild(_arg_1:Button):void
        {
            var _local_2:Object = this._2086299383btnGuild;
            if (_local_2 !== _arg_1)
            {
                this._2086299383btnGuild = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnGuild", _local_2, _arg_1));
            };
        }

        public function ___SystemBarCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __Can4_click(_arg_1:MouseEvent):void
        {
            clickGroupHandler(_arg_1);
            stopBrink(_arg_1);
            setTeamButtonNormal();
        }

        private function inputTempArrayPush(_arg_1:String):void
        {
            if (inputTempArray.indexOf(_arg_1) == -1)
            {
                if (inputTempArray.length < 10)
                {
                    inputTempArray.push(_arg_1);
                }
                else
                {
                    inputTempArray.shift();
                    inputTempArray.push(_arg_1);
                };
                inputIndex = (inputTempArray.length - 1);
            };
        }

        public function __btnSkill_click(_arg_1:MouseEvent):void
        {
            _vm.changeVisible(ViewManager.PANEL_SKILLMANAGER);
            stopBrink(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compMain

