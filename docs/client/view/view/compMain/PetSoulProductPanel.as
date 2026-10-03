// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.PetSoulProductPanel

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import flash.display.MovieClip;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.LinkButton;
    import flash.display.Sprite;
    import mx.controls.Alert;
    import mx.controls.Menu;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import mx.managers.PopUpManager;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.PetSoulCanvas;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.MenuEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.CustomMenuItemRenderer;
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

    public class PetSoulProductPanel extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PetSoulProductPanel_Label10:Label;
        private var _389876312label_color:Label;
        private var count:int = 0;
        private var loader:MovieClip;
        private var _3034453btn1:BasicGlowButton;
        private var _1739836639soulChip:LinkButton;
        private var _3034455btn3:BasicGlowButton;
        private var _3034457btn5:BasicGlowButton;
        public var firstFlag:Boolean = true;
        public var blackImg:Sprite;
        public var _PetSoulProductPanel_LinkButton2:LinkButton;
        public var _alert:Alert;
        private var menu:Menu;
        private var _896512616soulBg:Image;
        private var _2022083798soulExp:Label;
        private var _3034454btn2:BasicGlowButton;
        private var _3034456btn4:BasicGlowButton;
        private var _3034458btn6:BasicGlowButton;
        public var _PetSoulProductPanel_Label6:Label;
        public var _PetSoulProductPanel_Label7:Label;
        public var _PetSoulProductPanel_Label9:Label;
        public var _PetSoulProductPanel_Label8:Label;
        private var _1234425131soulCanvas:Canvas;
        private var _1010174295optBtn:BasicGlowButton;
        private var maxIndex:uint = 2;
        private var _2082343164btnClose:Button;
        private var _3360ii:Canvas;
        private var _1887424675soulPoint:Label;
        public var _PetSoulProductPanel_DelayButton2:DelayButton;
        public var _PetSoulProductPanel_DelayButton3:DelayButton;
        public var _PetSoulProductPanel_DelayButton1:DelayButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"ii",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"soulCanvas",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "width":900,
                                            "height":570,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"soulBg",
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
                                                "type":Label,
                                                "id":"soulExp",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "y":12,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"soulChip",
                                                "events":{"click":"__soulChip_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16775802;
                                                    this.textDecoration = "underline";
                                                    this.fontSize = 12;
                                                    this.fontWeight = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":170,
                                                        "y":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___PetSoulProductPanel_Button1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "180";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "width":48,
                                                        "height":48,
                                                        "styleName":"BtnCardAct"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"soulPoint",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "150";
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":30,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_PetSoulProductPanel_LinkButton2",
                                                "events":{"click":"___PetSoulProductPanel_LinkButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "30";
                                                    this.color = 16775802;
                                                    this.textDecoration = "underline";
                                                    this.fontSize = 12;
                                                    this.fontWeight = "normal";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":12});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "95";
                                                    this.bottom = "190";
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"Phân giải nhanh"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"label_color",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "65";
                                                    this.bottom = "190";
                                                    this.color = 0xFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"Lục"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.bottom = "190";
                                                    this.color = 16775802;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"text":"trở xuống"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"optBtn",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "50";
                                                    this.bottom = "190";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":16,
                                                        "height":18,
                                                        "styleName":"soulOperationBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_PetSoulProductPanel_DelayButton1",
                                                "events":{"click":"___PetSoulProductPanel_DelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "250";
                                                    this.bottom = "150";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "width":86,
                                                        "height":30,
                                                        "styleName":"soulKeyBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_PetSoulProductPanel_DelayButton2",
                                                "events":{"click":"___PetSoulProductPanel_DelayButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "140";
                                                    this.bottom = "150";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "width":86,
                                                        "height":30,
                                                        "styleName":"soulKeyBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_PetSoulProductPanel_DelayButton3",
                                                "events":{"click":"___PetSoulProductPanel_DelayButton3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "30";
                                                    this.bottom = "150";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":3000,
                                                        "width":86,
                                                        "height":30,
                                                        "styleName":"soulKeyBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn1",
                                                "events":{"click":"__btn1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "60";
                                                    this.bottom = "31";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":90,
                                                        "height":90,
                                                        "styleName":"soulGreenBtn"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetSoulProductPanel_Label6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "60";
                                                    this.bottom = "15";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn2",
                                                "events":{"click":"__btn2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "198";
                                                    this.bottom = "31";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":90,
                                                        "height":90,
                                                        "styleName":"soulBlueBtn",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetSoulProductPanel_Label7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "198";
                                                    this.bottom = "15";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn3",
                                                "events":{"click":"__btn3_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "335";
                                                    this.bottom = "31";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":90,
                                                        "height":90,
                                                        "styleName":"soulPurpleBtn",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetSoulProductPanel_Label8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "335";
                                                    this.bottom = "15";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn4",
                                                "events":{"click":"__btn4_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "471";
                                                    this.bottom = "31";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":90,
                                                        "height":90,
                                                        "styleName":"soulOrangeBtn",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetSoulProductPanel_Label9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "471";
                                                    this.bottom = "15";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn5",
                                                "events":{"click":"__btn5_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "205";
                                                    this.bottom = "31";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":90,
                                                        "height":90,
                                                        "styleName":"soulRedBtn",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_PetSoulProductPanel_Label10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "205";
                                                    this.bottom = "15";
                                                    this.color = 0xFFFFFF;
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn6",
                                                "events":{"click":"__btn6_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "550";
                                                    this.bottom = "113";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"styleName":"soulKeyBtn"});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "events":{"click":"___PetSoulProductPanel_BasicGlowButton8_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "30";
                                                    this.bottom = "30";
                                                    this.paddingLeft = 1;
                                                    this.paddingRight = 1;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":78,
                                                        "height":78,
                                                        "styleName":"soulBackBtn"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnClose",
                                    "events":{
                                        "mouseDown":"__btnClose_mouseDown",
                                        "click":"__btnClose_click"
                                    },
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "12";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":9,
                                            "styleName":"BtnPanelClose"
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        private var soulDict:Dictionary = new Dictionary();
        private var soulArr:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetSoulProductPanel()
        {
            mx_internal::_document = this;
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.addEventListener("creationComplete", ___PetSoulProductPanel_Canvas1_creationComplete);
            this.addEventListener("show", ___PetSoulProductPanel_Canvas1_show);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetSoulProductPanel._watcherSetupUtil = _arg_1;
        }


        public function __btn5_click(_arg_1:MouseEvent):void
        {
            preySoul(false, 5);
        }

        public function set btnClose(_arg_1:Button):void
        {
            var _local_2:Object = this._2082343164btnClose;
            if (_local_2 !== _arg_1)
            {
                this._2082343164btnClose = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnClose", _local_2, _arg_1));
            };
        }

        public function __soulChip_click(_arg_1:MouseEvent):void
        {
            goToExchangePanel();
        }

        [Bindable(event="propertyChange")]
        public function get btnClose():Button
        {
            return (this._2082343164btnClose);
        }

        private function init():void
        {
            waitForRes();
        }

        public function delTempSoul(_arg_1:int):void
        {
            if (!soulDict[_arg_1])
            {
                return;
            };
            if (((soulDict[_arg_1].canvas) && (soulDict[_arg_1].canvas.soul)))
            {
                soulDict[_arg_1].canvas.soul.unShow();
            };
            this.removeChild(soulDict[_arg_1].canvas);
            soulArr.splice(soulArr.indexOf(soulDict[_arg_1]), 1);
            delete soulDict[_arg_1];
            var _local_2:int;
            while (_local_2 < soulArr.length)
            {
                if (_local_2 < 7)
                {
                    soulArr[_local_2].canvas.y = (soulCanvas.y + 55);
                    soulArr[_local_2].canvas.x = ((soulCanvas.x + 70) + (_local_2 * 115));
                }
                else
                {
                    soulArr[_local_2].canvas.y = (soulCanvas.y + 165);
                    soulArr[_local_2].canvas.x = ((soulCanvas.x + 70) + ((_local_2 - 7) * 115));
                };
                _local_2++;
            };
            count = soulArr.length;
        }

        [Bindable(event="propertyChange")]
        public function get ii():Canvas
        {
            return (this._3360ii);
        }

        private function _PetSoulProductPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_SOUL_S[42];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.PET_SOUL_S[39];
            _local_1 = Language.PET_SOUL_S[49];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.PET_SOUL_S[16];
            _local_1 = Language.PET_SOUL_S[15];
            _local_1 = Language.PET_SOUL_S[17];
            _local_1 = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[0]);
            _local_1 = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[1]);
            _local_1 = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[2]);
            _local_1 = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[3]);
            _local_1 = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[4]);
            _local_1 = Language.PET_SOUL_S[45];
            _local_1 = Language.PET_SOUL_S[46].replace("{num}", GamePredef.SOUL_CRSTAL_COST[5]);
        }

        [Bindable(event="propertyChange")]
        public function get soulExp():Label
        {
            return (this._2022083798soulExp);
        }

        public function ___PetSoulProductPanel_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set soulBg(_arg_1:Image):void
        {
            var _local_2:Object = this._896512616soulBg;
            if (_local_2 !== _arg_1)
            {
                this._896512616soulBg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulBg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get soulCanvas():Canvas
        {
            return (this._1234425131soulCanvas);
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            preySoul(false, 2);
        }

        public function set ii(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3360ii;
            if (_local_2 !== _arg_1)
            {
                this._3360ii = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ii", _local_2, _arg_1));
            };
        }

        public function __btn6_click(_arg_1:MouseEvent):void
        {
            preySoul(false, 5, true);
        }

        public function ___PetSoulProductPanel_BasicGlowButton8_click(_arg_1:MouseEvent):void
        {
            backToSoulBagPanel();
        }

        private function preySoul(key:Boolean, index:int, moneyFlag:Boolean=false):void
        {
            var func:Function;
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            if (((_core.player.soulPnt < GamePredef.SOUL_CRSTAL_COST[(index - 1)]) && (!(moneyFlag))))
            {
                _alert = Alert.show(Language.PET_SOUL_S[22], "", Alert.YES, null, null);
                return;
            };
            if (key)
            {
                if (((_core.player.pmLevel) && (_core.player.pmLevel > 0)))
                {
                    _core.remote.call("preySoul", null, index, key, moneyFlag);
                }
                else
                {
                    _alert = Alert.show(Language.PET_SOUL_S[44], "", Alert.YES, null, null);
                };
            }
            else
            {
                if (moneyFlag)
                {
                    if (count >= 14)
                    {
                        _alert = Alert.show(Language.PET_SOUL_S[10], "", Alert.YES, null, null);
                        return;
                    };
                    if (((_core.player.pmLevel) && (_core.player.pmLevel > 0)))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("preySoul", null, index, key, moneyFlag);
                            };
                        };
                        _alert = Alert.show(Language.PET_SOUL_S[47], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        _alert = Alert.show(Language.PET_SOUL_S[52], "", Alert.YES, null, null);
                    };
                }
                else
                {
                    _core.remote.call("preySoul", null, index, key, moneyFlag);
                };
            };
        }

        public function set optBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1010174295optBtn;
            if (_local_2 !== _arg_1)
            {
                this._1010174295optBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "optBtn", _local_2, _arg_1));
            };
        }

        public function __btnClose_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get btn1():BasicGlowButton
        {
            return (this._3034453btn1);
        }

        [Bindable(event="propertyChange")]
        public function get btn3():BasicGlowButton
        {
            return (this._3034455btn3);
        }

        [Bindable(event="propertyChange")]
        public function get btn5():BasicGlowButton
        {
            return (this._3034457btn5);
        }

        [Bindable(event="propertyChange")]
        public function get btn6():BasicGlowButton
        {
            return (this._3034458btn6);
        }

        public function set soulExp(_arg_1:Label):void
        {
            var _local_2:Object = this._2022083798soulExp;
            if (_local_2 !== _arg_1)
            {
                this._2022083798soulExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulExp", _local_2, _arg_1));
            };
        }

        public function ___PetSoulProductPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            preySoul(true, 1);
        }

        public function reset():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 14)
            {
                delTempSoul(_local_1);
                _local_1++;
            };
        }

        public function changeBtnState(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            var _local_2:int = 2;
            while (_local_2 <= 5)
            {
                this[("btn" + _local_2)].enabled = false;
                _local_2++;
            };
            this[("btn" + _arg_1)].enabled = true;
            _core.player.crystalSid = _arg_1;
        }

        public function changeSoulPanelInfo(_arg_1:int, _arg_2:int):void
        {
            soulExp.text = (Language.PET_SOUL_S[11] + _arg_1);
            soulChip.label = (Language.PET_SOUL_S[12] + _arg_2);
        }

        public function __btnClose_click(_arg_1:MouseEvent):void
        {
            this.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get btn4():BasicGlowButton
        {
            return (this._3034456btn4);
        }

        [Bindable(event="propertyChange")]
        public function get soulPoint():Label
        {
            return (this._1887424675soulPoint);
        }

        private function transformAllExpInPanel():void
        {
            var _local_1:int = 1;
            if (label_color.text == "Lam")
            {
                _local_1 = 3;
                if (((_core.player.pmLevel) && (_core.player.pmLevel >= 5)))
                {
                    _core.remote.call("transformExpInPanel", null, _local_1, true);
                }
                else
                {
                    Alert.show(Language.PET_SOUL_S[56], "", Alert.YES, null, null);
                };
            }
            else
            {
                if (label_color.text == "Lục")
                {
                    _local_1 = 2;
                };
                if (((_core.player.pmLevel) && (_core.player.pmLevel > 0)))
                {
                    _core.remote.call("transformExpInPanel", null, _local_1, true);
                }
                else
                {
                    Alert.show(Language.PET_SOUL_S[44], "", Alert.YES, null, null);
                };
            };
        }

        public function ___PetSoulProductPanel_Canvas1_show(_arg_1:FlexEvent):void
        {
            onShow();
        }

        public function onShow():void
        {
            var _local_1:*;
            if (!blackImg)
            {
                blackImg = new Image();
                blackImg.x = 0;
                blackImg.y = 0;
                blackImg.width = stage.stageWidth;
                blackImg.height = stage.stageHeight;
                blackImg.graphics.clear();
                blackImg.graphics.beginFill(0);
                blackImg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                ii.addChild(blackImg);
                ii.setChildIndex(blackImg, 0);
            };
            if (stage.stageHeight > 570)
            {
                soulCanvas.x = 75;
                soulCanvas.y = 47;
            }
            else
            {
                soulCanvas.x = 0;
                soulCanvas.y = 0;
            };
            if (_core.player.soulTempBag)
            {
                for (_local_1 in _core.player.soulTempBag)
                {
                    if (_core.player.soulTempBag[_local_1])
                    {
                        addTempSoul(_local_1, _core.player.soulTempBag[_local_1]);
                    };
                };
            };
            soulExp.text = (Language.PET_SOUL_S[11] + _core.player.soulExp);
            soulChip.label = (Language.PET_SOUL_S[12] + _core.player.soulChip);
            soulPoint.text = (Language.PET_SOUL_S[13] + _core.player.soulPnt);
            if (_core.player.crystalSid)
            {
                this[("btn" + _core.player.crystalSid)].enabled = true;
            };
            optBtn.addEventListener(MouseEvent.CLICK, showOperation);
        }

        public function ___PetSoulProductPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            showRule();
        }

        public function __btn3_click(_arg_1:MouseEvent):void
        {
            preySoul(false, 3);
        }

        [Bindable(event="propertyChange")]
        public function get btn2():BasicGlowButton
        {
            return (this._3034454btn2);
        }

        [Bindable(event="propertyChange")]
        public function get label_color():Label
        {
            return (this._389876312label_color);
        }

        public function changePointInfo(_arg_1:int):void
        {
            soulPoint.text = (Language.PET_SOUL_S[13] + _arg_1);
        }

        override public function initialize():void
        {
            var target:PetSoulProductPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetSoulProductPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_PetSoulProductPanelWatcherSetupUtil");
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

        public function ___PetSoulProductPanel_Button1_click(_arg_1:MouseEvent):void
        {
            showCARDGAME();
        }

        public function showRule():void
        {
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            _alert = Alert.show(Language.PET_SOUL_S[48], "", Alert.YES, null, null);
        }

        public function ___PetSoulProductPanel_DelayButton2_click(_arg_1:MouseEvent):void
        {
            putToAllSoulBag();
        }

        [Bindable(event="propertyChange")]
        public function get soulBg():Image
        {
            return (this._896512616soulBg);
        }

        public function addTempSoul(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Object;
            if (soulDict[_arg_1])
            {
                return;
            };
            if (_arg_2 < 0)
            {
                return;
            };
            var _local_3:PetSoulCanvas = new PetSoulCanvas();
            _local_4 = new Object();
            _local_4.soulId = _arg_2;
            _local_4.index = _arg_1;
            _local_3.setData(_local_4);
            if (count < 7)
            {
                _local_3.y = (soulCanvas.y + 55);
                _local_3.x = ((soulCanvas.x + 70) + (count * 115));
            }
            else
            {
                _local_3.y = (soulCanvas.y + 165);
                _local_3.x = ((soulCanvas.x + 70) + ((count - 7) * 115));
            };
            count++;
            _local_4 = new Object();
            _local_4.canvas = _local_3;
            soulDict[_arg_1] = _local_4;
            soulArr.push(_local_4);
            this.addChild(_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get optBtn():BasicGlowButton
        {
            return (this._1010174295optBtn);
        }

        public function set btn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function set btn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034455btn3;
            if (_local_2 !== _arg_1)
            {
                this._3034455btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local_2, _arg_1));
            };
        }

        public function set btn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        public function set btn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034456btn4;
            if (_local_2 !== _arg_1)
            {
                this._3034456btn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn4", _local_2, _arg_1));
            };
        }

        public function set label_color(_arg_1:Label):void
        {
            var _local_2:Object = this._389876312label_color;
            if (_local_2 !== _arg_1)
            {
                this._389876312label_color = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label_color", _local_2, _arg_1));
            };
        }

        public function set btn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034458btn6;
            if (_local_2 !== _arg_1)
            {
                this._3034458btn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn6", _local_2, _arg_1));
            };
        }

        private function putToAllSoulBag():void
        {
            if (((_core.player.pmLevel) && (_core.player.pmLevel > 0)))
            {
                _core.remote.call("putSoulToBag", null, -1, true);
            }
            else
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.PET_SOUL_S[44], "", Alert.YES, null, null);
            };
        }

        public function __btn4_click(_arg_1:MouseEvent):void
        {
            preySoul(false, 4);
        }

        public function set soulCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1234425131soulCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1234425131soulCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulCanvas", _local_2, _arg_1));
            };
        }

        public function set btn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034457btn5;
            if (_local_2 !== _arg_1)
            {
                this._3034457btn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn5", _local_2, _arg_1));
            };
        }

        public function set soulChip(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._1739836639soulChip;
            if (_local_2 !== _arg_1)
            {
                this._1739836639soulChip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulChip", _local_2, _arg_1));
            };
        }

        private function backToSoulBagPanel():void
        {
            this.visible = false;
            _core.view.show(ViewManager.PANEL_PET_SOUL);
        }

        public function set soulPoint(_arg_1:Label):void
        {
            var _local_2:Object = this._1887424675soulPoint;
            if (_local_2 !== _arg_1)
            {
                this._1887424675soulPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulPoint", _local_2, _arg_1));
            };
        }

        private function _PetSoulProductPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulChip.toolTip = _arg_1;
            }, "soulChip.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulChip.setStyle("overSkin", _arg_1);
            }, "soulChip.overSkin");
            result[1] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulChip.setStyle("upSkin", _arg_1);
            }, "soulChip.upSkin");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                soulChip.setStyle("downSkin", _arg_1);
            }, "soulChip.downSkin");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                soulPoint.toolTip = _arg_1;
            }, "soulPoint.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_LinkButton2.label = _arg_1;
            }, "_PetSoulProductPanel_LinkButton2.label");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetSoulProductPanel_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_PetSoulProductPanel_LinkButton2.overSkin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetSoulProductPanel_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_PetSoulProductPanel_LinkButton2.upSkin");
            result[7] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _PetSoulProductPanel_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_PetSoulProductPanel_LinkButton2.downSkin");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_DelayButton1.label = _arg_1;
            }, "_PetSoulProductPanel_DelayButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_DelayButton2.label = _arg_1;
            }, "_PetSoulProductPanel_DelayButton2.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_DelayButton3.label = _arg_1;
            }, "_PetSoulProductPanel_DelayButton3.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[0]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_Label6.text = _arg_1;
            }, "_PetSoulProductPanel_Label6.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[1]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_Label7.text = _arg_1;
            }, "_PetSoulProductPanel_Label7.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[2]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_Label8.text = _arg_1;
            }, "_PetSoulProductPanel_Label8.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[3]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_Label9.text = _arg_1;
            }, "_PetSoulProductPanel_Label9.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[30].replace("{num}", GamePredef.SOUL_CRSTAL_COST[4]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetSoulProductPanel_Label10.text = _arg_1;
            }, "_PetSoulProductPanel_Label10.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn6.label = _arg_1;
            }, "btn6.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[46].replace("{num}", GamePredef.SOUL_CRSTAL_COST[5]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn6.toolTip = _arg_1;
            }, "btn6.toolTip");
            result[18] = binding;
            return (result);
        }

        public function goToExchangePanel():void
        {
            _core.view.show(ViewManager.PANEL_SOUL_EXCHANGE);
        }

        [Bindable(event="propertyChange")]
        public function get soulChip():LinkButton
        {
            return (this._1739836639soulChip);
        }

        public function ___PetSoulProductPanel_DelayButton3_click(_arg_1:MouseEvent):void
        {
            transformAllExpInPanel();
        }

        private function menuHandler(_arg_1:MenuEvent):void
        {
            if (_arg_1.item.label == "Trắng")
            {
                label_color.text = _arg_1.item.label;
                label_color.setStyle("color", 0xFFFFFF);
            }
            else
            {
                if (_arg_1.item.label == "Lục")
                {
                    label_color.text = _arg_1.item.label;
                    label_color.setStyle("color", 0xFF00);
                }
                else
                {
                    if (_arg_1.item.label == "Lam")
                    {
                        if (((_core.player.pmLevel) && (_core.player.pmLevel >= 5)))
                        {
                            label_color.text = _arg_1.item.label;
                            label_color.setStyle("color", 6591981);
                        }
                        else
                        {
                            Alert.show(Language.PET_SOUL_S[56], "", Alert.YES, null, null);
                            return;
                        };
                    };
                };
            };
        }

        private function waitForRes():void
        {
            soulBg.source = ResManager.hash(GamePredef.PET_SOUL_BG);
        }

        public function showOperation(_arg_1:MouseEvent):void
        {
            var _local_2:Array = [{
                "label":"Trắng",
                "textColor":"0xFFFFFF"
            }, {
                "label":"Lục",
                "textColor":"0x00FF00"
            }, {
                "label":"Lam",
                "textColor":"0x6495ED"
            }];
            menu = Menu.createMenu(this, _local_2, false);
            menu.width = 60;
            menu.rowHeight = 20;
            menu.addEventListener(MenuEvent.ITEM_CLICK, menuHandler);
            menu.itemRenderer = new ClassFactory(CustomMenuItemRenderer);
            menu.show(_arg_1.stageX, _arg_1.stageY);
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            preySoul(false, 1);
        }

        public function showCARDGAME():void
        {
            this.visible = false;
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CARDGAME);
            if (_local_1)
            {
                _local_1.initPanel();
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

