// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.UserSystemSetPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import flash.net.SharedObject;
    import mx.controls.RadioButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.NumericStepper;
    import mx.controls.RadioButtonGroup;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.controls.HRule;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.NumericStepperEvent;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.core.Application;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.data.GameData;
    import flash.utils.setTimeout;
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

    public class UserSystemSetPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _96709c13:CheckBox;
        private var sharedObject:SharedObject;
        private var _2217378HIGH:RadioButton;
        private var _3118c1:CheckBox;
        private var _206185977btnSave:BasicGlowButton;
        private var _75572LOW:RadioButton;
        private var _94069080btnOk:BasicGlowButton;
        private var _96710c14:CheckBox;
        private var _3121c4:CheckBox;
        private var _1034378039numStp:NumericStepper;
        private var _3125c8:CheckBox;
        private var _517675181gameQuality:RadioButtonGroup;
        private var _96707c11:CheckBox;
        public var _UserSystemSetPanel_BasicGlowButton5:BasicGlowButton;
        public var _UserSystemSetPanel_BasicGlowButton6:BasicGlowButton;
        public var _UserSystemSetPanel_BasicGlowButton7:BasicGlowButton;
        private var _3117c0:CheckBox;
        private var _3120c3:CheckBox;
        private var _3124c7:CheckBox;
        private var _core:Core;
        private var _551252652btnReturn:BasicGlowButton;
        private var _388320006btnLogout:BasicGlowButton;
        private var _2024701067MEDIUM:RadioButton;
        private var _96708c12:CheckBox;
        private var _3123c6:CheckBox;
        private var _disableFlag:Boolean = false;
        public var _UserSystemSetPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _inited:Boolean = false;
        private var _3119c2:CheckBox;
        private var _96706c10:CheckBox;
        private var _3530948sjan:CheckBox;
        public var _UserSystemSetPanel_RoundedLabel1:RoundedLabel;
        private var _3122c5:CheckBox;
        private var _3126c9:CheckBox;
        private var _1432417404changefr:CheckBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":420,
                    "height":302,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_UserSystemSetPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnSave",
                        "events":{"click":"__btnSave_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":321,
                                "y":220,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnOk",
                        "events":{"click":"__btnOk_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":321,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnLogout",
                        "events":{"click":"__btnLogout_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":321,
                                "y":40,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnReturn",
                        "events":{"click":"__btnReturn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":321,
                                "y":75,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_UserSystemSetPanel_BasicGlowButton5",
                        "events":{"click":"___UserSystemSetPanel_BasicGlowButton5_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":321,
                                "y":145,
                                "styleName":"BtnStdRed",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_UserSystemSetPanel_BasicGlowButton6",
                        "events":{"click":"___UserSystemSetPanel_BasicGlowButton6_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":321,
                                "y":110,
                                "styleName":"BtnStdGreen",
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":40,
                                "width":252.5,
                                "height":209,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c1",
                                    "events":{"click":"__c1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10
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
                                            "y":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c3",
                                    "events":{"click":"__c3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":27
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c4",
                                    "events":{"click":"__c4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":44
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c11",
                                    "events":{"click":"__c11_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c5",
                                    "events":{"click":"__c5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":10
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
                                            "y":44
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c8",
                                    "events":{"click":"__c8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":61
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c0",
                                    "events":{"click":"__c0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":61
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c6",
                                    "events":{"click":"__c6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c9",
                                    "events":{"click":"__c9_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":95
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HRule,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":123,
                                            "width":232.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"numStp",
                                    "events":{
                                        "click":"__numStp_click",
                                        "change":"__numStp_change"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":116,
                                            "maximum":100,
                                            "enabled":false,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_UserSystemSetPanel_RoundedLabel1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":117,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"changefr",
                                    "events":{"change":"__changefr_change"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF0000;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":95,
                                            "enabled":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"sjan",
                                    "events":{"click":"__sjan_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":129
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"HIGH",
                                    "events":{"click":"__HIGH_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":147,
                                            "groupName":"gameQuality",
                                            "value":"HIGH"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"MEDIUM",
                                    "events":{"click":"__MEDIUM_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":167,
                                            "groupName":"gameQuality",
                                            "value":"MEDIUM"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"LOW",
                                    "events":{"click":"__LOW_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":187,
                                            "groupName":"gameQuality",
                                            "value":"LOW"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c14",
                                    "events":{"click":"__c14_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":125
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c10",
                                    "events":{"click":"__c10_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":147
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c12",
                                    "events":{"click":"__c12_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":167
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"c13",
                                    "events":{"click":"__c13_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":142,
                                            "y":187,
                                            "width":147.2
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_UserSystemSetPanel_BasicGlowButton7",
                        "events":{"click":"___UserSystemSetPanel_BasicGlowButton7_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "styleName":"BtnStdBlue",
                                "width":79
                            });
                        }
                    })]
                });
            }
        });
        private var _changeObj:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function UserSystemSetPanel()
        {
            mx_internal::_document = this;
            this.width = 420;
            this.height = 302;
            this.styleName = "StandardContent";
            _UserSystemSetPanel_RadioButtonGroup1_i();
            this.addEventListener("initialize", ___UserSystemSetPanel_DragableCanvas1_initialize);
            this.addEventListener("creationComplete", ___UserSystemSetPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            UserSystemSetPanel._watcherSetupUtil = _arg_1;
        }


        public function ___UserSystemSetPanel_BasicGlowButton6_click(_arg_1:MouseEvent):void
        {
            chatConfig();
        }

        public function __numStp_change(_arg_1:NumericStepperEvent):void
        {
            updataInterface2();
        }

        public function set changefr(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1432417404changefr;
            if (_local_2 !== _arg_1)
            {
                this._1432417404changefr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changefr", _local_2, _arg_1));
            };
        }

        public function getDressHideCB():Boolean
        {
            return (c9.selected);
        }

        public function set btnLogout(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._388320006btnLogout;
            if (_local_2 !== _arg_1)
            {
                this._388320006btnLogout = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLogout", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLogout():BasicGlowButton
        {
            return (this._388320006btnLogout);
        }

        private function init():void
        {
            sharedObject = SharedObject.getLocal("gameQualitySet");
            if (!(((sharedObject) && (sharedObject.data)) && (sharedObject.data.quality)))
            {
                sharedObject.data.quality = "HIGH";
            };
            gameQuality.selectedValue = sharedObject.data.quality;
            _inited = true;
            if (_disableFlag)
            {
                disableUI();
            }
            else
            {
                enableUI();
            };
        }

        private function saveSetting():void
        {
            _core.remote.call("us", new Responder(onUs), _changeObj);
            _changeObj = {};
        }

        public function __c1_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "am");
        }

        private function resetSetting(_arg_1:CloseEvent):void
        {
            _core.remote.resetSetting();
            var _local_2:int;
            while (_local_2 < 15)
            {
                this[("c" + _local_2)].selected = true;
                _local_2++;
            };
        }

        public function __c5_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "ac");
        }

        public function __MEDIUM_click(_arg_1:MouseEvent):void
        {
            setQuality("MEDIUM");
        }

        public function __c9_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "dressHide");
        }

        public function __btnOk_click(_arg_1:MouseEvent):void
        {
            saveSetting();
            hide();
        }

        public function ___UserSystemSetPanel_DragableCanvas1_initialize(_arg_1:FlexEvent):void
        {
            setInitialize();
        }

        [Bindable(event="propertyChange")]
        public function get c1():CheckBox
        {
            return (this._3118c1);
        }

        public function __btnLogout_click(_arg_1:MouseEvent):void
        {
            logout();
        }

        private function transport():void
        {
            _core.view.hide(ViewManager.POPU_WAIT);
            if (_core.state == GamePredef.ST_CORE_NORMAL)
            {
                _core.remote.toMovable();
            }
            else
            {
                _core.sysMidNote(Language.USERSYSTEMSETPANEL_S[17]);
            };
        }

        private function alertTransport():void
        {
            if (_core.state == GamePredef.ST_CORE_NORMAL)
            {
                Alert.show(Language.USERSYSTEMSETPANEL_S[15], "", (Alert.YES | Alert.NO), null, startTransport);
            };
        }

        [Bindable(event="propertyChange")]
        public function get c2():CheckBox
        {
            return (this._3119c2);
        }

        public function ___UserSystemSetPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_BATTLESET);
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
        public function get c6():CheckBox
        {
            return (this._3123c6);
        }

        public function __sjan_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "sjan");
        }

        private function setQuality(_arg_1:String):void
        {
            Application.application.stage.quality = _arg_1;
            sharedObject.data.quality = _arg_1;
        }

        private function onChangeFrameRate():void
        {
            if (changefr.selected)
            {
                _core.setFrameRate(GamePredef.GLOBAL_FRAME_RATE_20);
            }
            else
            {
                _core.setFrameRate(GamePredef.GLOBAL_FRAME_RATE_24);
            };
        }

        [Bindable(event="propertyChange")]
        public function get c3():CheckBox
        {
            return (this._3120c3);
        }

        [Bindable(event="propertyChange")]
        public function get LOW():RadioButton
        {
            return (this._75572LOW);
        }

        public function __c11_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "ag");
        }

        private function bossKeySetting():void
        {
            _core.view.show(ViewManager.PANEL_BOSSKEY);
        }

        public function set HIGH(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._2217378HIGH;
            if (_local_2 !== _arg_1)
            {
                this._2217378HIGH = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HIGH", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get c0():CheckBox
        {
            return (this._3117c0);
        }

        public function __btnReturn_click(_arg_1:MouseEvent):void
        {
            returnToCharList();
        }

        [Bindable(event="propertyChange")]
        public function get c7():CheckBox
        {
            return (this._3124c7);
        }

        public function __c6_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "hm");
        }

        private function _UserSystemSetPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            gameQuality = _local_1;
            _local_1.initialized(this, "gameQuality");
            return (_local_1);
        }

        private function _returnToCharList():void
        {
            _core.data.reset();
            _core.returnToCharList();
        }

        public function __c2_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "battleStExpan");
        }

        private function alertCloseGuide():void
        {
        }

        public function set c0(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3117c0;
            if (_local_2 !== _arg_1)
            {
                this._3117c0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c0", _local_2, _arg_1));
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

        public function set c2(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3119c2;
            if (_local_2 !== _arg_1)
            {
                this._3119c2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c2", _local_2, _arg_1));
            };
        }

        public function enableUI():void
        {
            if (this._inited)
            {
                this.btnReturn.enabled = true;
                this.btnOk.enabled = true;
                this.btnSave.enabled = true;
            }
            else
            {
                _disableFlag = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnOk():BasicGlowButton
        {
            return (this._94069080btnOk);
        }

        public function set LOW(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._75572LOW;
            if (_local_2 !== _arg_1)
            {
                this._75572LOW = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "LOW", _local_2, _arg_1));
            };
        }

        private function alertResetGuide():void
        {
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

        public function __c12_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "hpmf");
        }

        [Bindable(event="propertyChange")]
        public function get c8():CheckBox
        {
            return (this._3125c8);
        }

        private function onLogoutWarn(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _logout();
            };
        }

        public function set btnReturn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._551252652btnReturn;
            if (_local_2 !== _arg_1)
            {
                this._551252652btnReturn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReturn", _local_2, _arg_1));
            };
        }

        public function __numStp_click(_arg_1:MouseEvent):void
        {
            updataInterface2();
        }

        [Bindable(event="propertyChange")]
        public function get MEDIUM():RadioButton
        {
            return (this._2024701067MEDIUM);
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

        public function set c3(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3120c3;
            if (_local_2 !== _arg_1)
            {
                this._3120c3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c3", _local_2, _arg_1));
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

        public function set c4(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3121c4;
            if (_local_2 !== _arg_1)
            {
                this._3121c4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c4", _local_2, _arg_1));
            };
        }

        public function disableUI():void
        {
            if (this._inited)
            {
                this.btnReturn.enabled = false;
                this.btnOk.enabled = false;
                this.btnSave.enabled = false;
            }
            else
            {
                _disableFlag = true;
            };
        }

        private function alertResetSetting():void
        {
            Alert.show(Language.USERSYSTEMSETPANEL_S[0], "", (Alert.YES | Alert.NO), null, resetSetting);
        }

        [Bindable(event="propertyChange")]
        public function get changefr():CheckBox
        {
            return (this._1432417404changefr);
        }

        public function set c10(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._96706c10;
            if (_local_2 !== _arg_1)
            {
                this._96706c10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c10", _local_2, _arg_1));
            };
        }

        public function set c11(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._96707c11;
            if (_local_2 !== _arg_1)
            {
                this._96707c11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c11", _local_2, _arg_1));
            };
        }

        public function set gameQuality(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._517675181gameQuality;
            if (_local_2 !== _arg_1)
            {
                this._517675181gameQuality = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gameQuality", _local_2, _arg_1));
            };
        }

        public function set c12(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._96708c12;
            if (_local_2 !== _arg_1)
            {
                this._96708c12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c12", _local_2, _arg_1));
            };
        }

        private function logout():void
        {
            if (_core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).warnState)
            {
                Alert.show(Language.TEMPORARYBAGWARNCANVAS_U[2], "", (Alert.YES | Alert.NO), null, onLogoutWarn);
            }
            else
            {
                _logout();
            };
        }

        public function __HIGH_click(_arg_1:MouseEvent):void
        {
            setQuality("HIGH");
        }

        public function set c14(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._96710c14;
            if (_local_2 !== _arg_1)
            {
                this._96710c14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c14", _local_2, _arg_1));
            };
        }

        public function setDressHideCB(_arg_1:*):void
        {
            if (c9)
            {
                c9.selected = _arg_1;
            };
        }

        public function set sjan(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._3530948sjan;
            if (_local_2 !== _arg_1)
            {
                this._3530948sjan = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sjan", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:UserSystemSetPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _UserSystemSetPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_UserSystemSetPanelWatcherSetupUtil");
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

        public function set c13(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._96709c13;
            if (_local_2 !== _arg_1)
            {
                this._96709c13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "c13", _local_2, _arg_1));
            };
        }

        private function setInitialize():void
        {
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

        public function __c3_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "hc");
        }

        public function __c7_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "achat");
        }

        [Bindable(event="propertyChange")]
        public function get HIGH():RadioButton
        {
            return (this._2217378HIGH);
        }

        private function onReturnToCharListWarn(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _returnToCharList();
            };
        }

        private function _logout():void
        {
            _core.data.reset();
            _core.logout();
        }

        public function set numStp(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._1034378039numStp;
            if (_local_2 !== _arg_1)
            {
                this._1034378039numStp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numStp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnReturn():BasicGlowButton
        {
            return (this._551252652btnReturn);
        }

        public function getDressHideData():Boolean
        {
            if (GamePredef.GLOBAL_SETTING["dressHide"] == -1)
            {
                return (false);
            };
            return (Boolean(Number(GamePredef.GLOBAL_SETTING["dressHide"])));
        }

        public function __c13_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "nlws");
        }

        public function set btnOk(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94069080btnOk;
            if (_local_2 !== _arg_1)
            {
                this._94069080btnOk = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOk", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gameQuality():RadioButtonGroup
        {
            return (this._517675181gameQuality);
        }

        private function showPwdAgainCanvas():void
        {
            _core.view.getUI(ViewManager.D_PASS_PANEL).showPwdAgainCanvas();
        }

        private function chatConfig():void
        {
            _core.view.show(ViewManager.PANEL_CHATCONFIG);
        }

        public function ___UserSystemSetPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            alertTransport();
        }

        private function updataInterface2():void
        {
            _changeObj["maxView"] = numStp.value;
        }

        [Bindable(event="propertyChange")]
        public function get c11():CheckBox
        {
            return (this._96707c11);
        }

        [Bindable(event="propertyChange")]
        public function get c12():CheckBox
        {
            return (this._96708c12);
        }

        [Bindable(event="propertyChange")]
        public function get c13():CheckBox
        {
            return (this._96709c13);
        }

        [Bindable(event="propertyChange")]
        public function get c10():CheckBox
        {
            return (this._96706c10);
        }

        private function getInterfaceData(_arg_1:String):Boolean
        {
            return (Boolean(Number(GamePredef.GLOBAL_SETTING[_arg_1])));
        }

        public function ___UserSystemSetPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _UserSystemSetPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _UserSystemSetPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_UserSystemSetPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSave.label = _arg_1;
            }, "btnSave.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnOk.label = _arg_1;
            }, "btnOk.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLogout.label = _arg_1;
            }, "btnLogout.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnReturn.label = _arg_1;
            }, "btnReturn.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _UserSystemSetPanel_BasicGlowButton5.toolTip = _arg_1;
            }, "_UserSystemSetPanel_BasicGlowButton5.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _UserSystemSetPanel_BasicGlowButton5.label = _arg_1;
            }, "_UserSystemSetPanel_BasicGlowButton5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _UserSystemSetPanel_BasicGlowButton6.label = _arg_1;
            }, "_UserSystemSetPanel_BasicGlowButton6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c1.label = _arg_1;
            }, "c1.label");
            result[8] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("am"));
            }, function (_arg_1:Boolean):void
            {
                c1.selected = _arg_1;
            }, "c1.selected");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c2.label = _arg_1;
            }, "c2.label");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("battleStExpan"));
            }, function (_arg_1:Boolean):void
            {
                c2.selected = _arg_1;
            }, "c2.selected");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c3.label = _arg_1;
            }, "c3.label");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("hc"));
            }, function (_arg_1:Boolean):void
            {
                c3.selected = _arg_1;
            }, "c3.selected");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c4.label = _arg_1;
            }, "c4.label");
            result[14] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("hn"));
            }, function (_arg_1:Boolean):void
            {
                c4.selected = _arg_1;
            }, "c4.selected");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c11.label = _arg_1;
            }, "c11.label");
            result[16] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("ag"));
            }, function (_arg_1:Boolean):void
            {
                c11.selected = _arg_1;
            }, "c11.selected");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c5.label = _arg_1;
            }, "c5.label");
            result[18] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("ac"));
            }, function (_arg_1:Boolean):void
            {
                c5.selected = _arg_1;
            }, "c5.selected");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c7.label = _arg_1;
            }, "c7.label");
            result[20] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("achat"));
            }, function (_arg_1:Boolean):void
            {
                c7.selected = _arg_1;
            }, "c7.selected");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c8.label = _arg_1;
            }, "c8.label");
            result[22] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("at"));
            }, function (_arg_1:Boolean):void
            {
                c8.selected = _arg_1;
            }, "c8.selected");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c0.label = _arg_1;
            }, "c0.label");
            result[24] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("he"));
            }, function (_arg_1:Boolean):void
            {
                c0.selected = _arg_1;
            }, "c0.selected");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c6.label = _arg_1;
            }, "c6.label");
            result[26] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("hm"));
            }, function (_arg_1:Boolean):void
            {
                c6.selected = _arg_1;
            }, "c6.selected");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c9.label = _arg_1;
            }, "c9.label");
            result[28] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getDressHideData());
            }, function (_arg_1:Boolean):void
            {
                c9.selected = _arg_1;
            }, "c9.selected");
            result[29] = binding;
            binding = new Binding(this, function ():Number
            {
                return (GamePredef.GLOBAL_SETTING.maxView);
            }, function (_arg_1:Number):void
            {
                numStp.value = _arg_1;
            }, "numStp.value");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _UserSystemSetPanel_RoundedLabel1.text = _arg_1;
            }, "_UserSystemSetPanel_RoundedLabel1.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changefr.label = _arg_1;
            }, "changefr.label");
            result[32] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("cf"));
            }, function (_arg_1:Boolean):void
            {
                changefr.selected = _arg_1;
            }, "changefr.selected");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changefr.toolTip = _arg_1;
            }, "changefr.toolTip");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sjan.label = _arg_1;
            }, "sjan.label");
            result[35] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("sjan"));
            }, function (_arg_1:Boolean):void
            {
                sjan.selected = _arg_1;
            }, "sjan.selected");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                HIGH.label = _arg_1;
            }, "HIGH.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                MEDIUM.label = _arg_1;
            }, "MEDIUM.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                LOW.label = _arg_1;
            }, "LOW.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c14.label = _arg_1;
            }, "c14.label");
            result[40] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("bfr"));
            }, function (_arg_1:Boolean):void
            {
                c14.selected = _arg_1;
            }, "c14.selected");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c10.label = _arg_1;
            }, "c10.label");
            result[42] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("flyEffect"));
            }, function (_arg_1:Boolean):void
            {
                c10.selected = _arg_1;
            }, "c10.selected");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c12.label = _arg_1;
            }, "c12.label");
            result[44] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("hpmf"));
            }, function (_arg_1:Boolean):void
            {
                c12.selected = _arg_1;
            }, "c12.selected");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                c13.label = _arg_1;
            }, "c13.label");
            result[46] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (getInterfaceData("nlws"));
            }, function (_arg_1:Boolean):void
            {
                c13.selected = _arg_1;
            }, "c13.selected");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.USERSYSTEMSETPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _UserSystemSetPanel_BasicGlowButton7.label = _arg_1;
            }, "_UserSystemSetPanel_BasicGlowButton7.label");
            result[48] = binding;
            return (result);
        }

        override public function initView():void
        {
            _core = Core.getInstance();
        }

        [Bindable(event="propertyChange")]
        public function get numStp():NumericStepper
        {
            return (this._1034378039numStp);
        }

        public function __c4_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "hn");
        }

        [Bindable(event="propertyChange")]
        public function get sjan():CheckBox
        {
            return (this._3530948sjan);
        }

        private function onUs(_arg_1:Object):void
        {
            if (_arg_1)
            {
                GamePredef.GLOBAL_SETTING.maxView = numStp.value;
            };
        }

        [Bindable(event="propertyChange")]
        public function get c9():CheckBox
        {
            return (this._3126c9);
        }

        public function __btnSave_click(_arg_1:MouseEvent):void
        {
            saveSetting();
        }

        public function __LOW_click(_arg_1:MouseEvent):void
        {
            setQuality("LOW");
        }

        public function __c8_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "at");
        }

        private function startTransport(_arg_1:CloseEvent):void
        {
            var _local_2:Boolean;
            var _local_3:*;
            var _local_4:*;
            var _local_5:Array;
            if (_arg_1.detail == Alert.YES)
            {
                _local_2 = false;
                if (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
                {
                    if (_core.player.posMapId)
                    {
                        _local_3 = GameData.d[GamePredef.TBL_MAP][_core.player.posMapId];
                        if ((((_local_3) && (_local_3.safeX)) && (_local_3.safeY)))
                        {
                            _local_4 = _core.player.normalView.hitTestLayer;
                            _local_5 = _core.move.getRoute(_core.player.posX, _core.player.posY, _local_3.safeX, _local_3.safeY, _local_4);
                            if (((!(_local_5)) || (_local_5.length <= 1)))
                            {
                                if ((((_local_5.length == 1) && (_local_5[0][0] == _core.player.posX)) && (_local_5[0][1] == _core.player.posY)))
                                {
                                    _local_2 = true;
                                };
                            };
                        };
                    };
                };
                if (_local_2)
                {
                    transport();
                }
                else
                {
                    _core.view.getUI(ViewManager.POPU_WAIT).showText(Language.USERSYSTEMSETPANEL_S[16]);
                    _core.view.getUI(ViewManager.POPU_WAIT).showTime(20);
                    setTimeout(transport, 20000);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get c14():CheckBox
        {
            return (this._96710c14);
        }

        public function set MEDIUM(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._2024701067MEDIUM;
            if (_local_2 !== _arg_1)
            {
                this._2024701067MEDIUM = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MEDIUM", _local_2, _arg_1));
            };
        }

        public function __c10_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "flyEffect");
        }

        public function set btnSave(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._206185977btnSave;
            if (_local_2 !== _arg_1)
            {
                this._206185977btnSave = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnSave", _local_2, _arg_1));
            };
        }

        private function updataInterface(_arg_1:Event, _arg_2:String):void
        {
            var _local_3:Boolean = (_arg_1.target as CheckBox).selected;
            _changeObj[_arg_2] = _local_3;
            _core.updateSetting(_arg_2, _local_3);
        }

        private function _UserSystemSetPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.USERSYSTEMSETPANEL_U[8];
            _local_1 = Language.USERSYSTEMSETPANEL_U[0];
            _local_1 = Language.USERSYSTEMSETPANEL_U[1];
            _local_1 = Language.USERSYSTEMSETPANEL_U[2];
            _local_1 = Language.USERSYSTEMSETPANEL_U[3];
            _local_1 = Language.USERSYSTEMSETPANEL_S[19];
            _local_1 = Language.USERSYSTEMSETPANEL_U[4];
            _local_1 = Language.USERSYSTEMSETPANEL_U[9];
            _local_1 = Language.USERSYSTEMSETPANEL_S[3];
            _local_1 = getInterfaceData("am");
            _local_1 = Language.USERSYSTEMSETPANEL_S[4];
            _local_1 = getInterfaceData("battleStExpan");
            _local_1 = Language.USERSYSTEMSETPANEL_S[5];
            _local_1 = getInterfaceData("hc");
            _local_1 = Language.USERSYSTEMSETPANEL_S[6];
            _local_1 = getInterfaceData("hn");
            _local_1 = Language.USERSYSTEMSETPANEL_S[7];
            _local_1 = getInterfaceData("ag");
            _local_1 = Language.USERSYSTEMSETPANEL_S[8];
            _local_1 = getInterfaceData("ac");
            _local_1 = Language.USERSYSTEMSETPANEL_S[9];
            _local_1 = getInterfaceData("achat");
            _local_1 = Language.USERSYSTEMSETPANEL_S[10];
            _local_1 = getInterfaceData("at");
            _local_1 = Language.USERSYSTEMSETPANEL_S[11];
            _local_1 = getInterfaceData("he");
            _local_1 = Language.USERSYSTEMSETPANEL_S[12];
            _local_1 = getInterfaceData("hm");
            _local_1 = Language.USERSYSTEMSETPANEL_S[25];
            _local_1 = getDressHideData();
            _local_1 = GamePredef.GLOBAL_SETTING.maxView;
            _local_1 = Language.USERSYSTEMSETPANEL_S[13];
            _local_1 = Language.USERSYSTEMSETPANEL_S[14];
            _local_1 = getInterfaceData("cf");
            _local_1 = Language.USERSYSTEMSETPANEL_S[20];
            _local_1 = Language.USERSYSTEMSETPANEL_S[21];
            _local_1 = getInterfaceData("sjan");
            _local_1 = Language.USERSYSTEMSETPANEL_S[22];
            _local_1 = Language.USERSYSTEMSETPANEL_S[23];
            _local_1 = Language.USERSYSTEMSETPANEL_S[24];
            _local_1 = Language.USERSYSTEMSETPANEL_S[29];
            _local_1 = getInterfaceData("bfr");
            _local_1 = Language.USERSYSTEMSETPANEL_S[26];
            _local_1 = getInterfaceData("flyEffect");
            _local_1 = Language.USERSYSTEMSETPANEL_S[27];
            _local_1 = getInterfaceData("hpmf");
            _local_1 = Language.USERSYSTEMSETPANEL_S[28];
            _local_1 = getInterfaceData("nlws");
            _local_1 = Language.USERSYSTEMSETPANEL_U[7];
        }

        public function __c0_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "he");
        }

        [Bindable(event="propertyChange")]
        public function get btnSave():BasicGlowButton
        {
            return (this._206185977btnSave);
        }

        public function __changefr_change(_arg_1:Event):void
        {
            updataInterface(_arg_1, "cf");
            onChangeFrameRate();
        }

        public function __c14_click(_arg_1:MouseEvent):void
        {
            updataInterface(_arg_1, "bfr");
        }

        private function returnToCharList():void
        {
            if (_core.view.getUI(ViewManager.MAIN_TEMP_BAG_WARN).warnState)
            {
                Alert.show(Language.TEMPORARYBAGWARNCANVAS_U[3], "", (Alert.YES | Alert.NO), null, onReturnToCharListWarn);
            }
            else
            {
                _returnToCharList();
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

