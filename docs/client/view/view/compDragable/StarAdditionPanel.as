// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.StarAdditionPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.RadioButton;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.ItemSlotStars;
    import mx.controls.RadioButtonGroup;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.ui.view.comp.Slot;
    import mx.binding.BindingManager;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.NumericStepperEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class StarAdditionPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ITEM_STAR_ADD:int = 3315;
        public var _StarAdditionPanel_RadioButton10:RadioButton;
        public var _StarAdditionPanel_RadioButton11:RadioButton;
        public var _StarAdditionPanel_RadioButton12:RadioButton;
        private var _1279380421rl_rate:RoundedLabel;
        private var selectType:int;
        public var _StarAdditionPanel_IntroText1:IntroText;
        private var _3242771item:ItemSlotStars;
        private var _1001881211rl_money:RoundedLabel;
        private var _5318500radiogroup:RadioButtonGroup;
        public var _StarAdditionPanel_RadioButton1:RadioButton;
        public var _StarAdditionPanel_RadioButton2:RadioButton;
        public var _StarAdditionPanel_RadioButton3:RadioButton;
        public var _StarAdditionPanel_RadioButton4:RadioButton;
        public var _StarAdditionPanel_RadioButton5:RadioButton;
        public var _StarAdditionPanel_RadioButton6:RadioButton;
        public var _StarAdditionPanel_RadioButton7:RadioButton;
        public var _StarAdditionPanel_RadioButton8:RadioButton;
        public var _StarAdditionPanel_RadioButton9:RadioButton;
        private var _1474851885_index:int;
        private var _1278967158rl_desc:RoundedLabel;
        private var _97884btn:BasicGlowButton;
        private var starsData:Object;
        public var _StarAdditionPanel_BasicGlowButton1:BasicGlowButton;
        private var _1278876365rl_addi:RoundedLabel;
        private var _3525ns:NumericStepper;
        private var _928564223rl_num:RoundedLabel;
        public var _StarAdditionPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1000667455rl_level:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":340,
                    "height":410,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_StarAdditionPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                            this.left = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":95,
                                "height":260,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":1,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton2",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":2,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton3",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "50";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":3,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton4",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "70";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":4,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton5",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "90";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":5,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton6",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "110";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":6,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton7",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "130";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":7,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton8",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "150";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":8,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton9",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "170";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":9,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton10",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "190";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":10,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton11",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "210";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":11,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RadioButton,
                                    "id":"_StarAdditionPanel_RadioButton12",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "230";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "value":12,
                                            "groupName":"radiogroup",
                                            "height":20
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.top = "39";
                            this.bottom = "110";
                            this.left = "113";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_level",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "10";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_addi",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "36";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl_desc",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "62";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_StarAdditionPanel_BasicGlowButton1",
                                    "events":{"click":"___StarAdditionPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.top = "110";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.right = "10";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":163,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ItemSlotStars,
                                                "id":"item",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "10";
                                                    this.horizontalCenter = "0";
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rl_rate",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":52,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rl_money",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":78,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"rl_num",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":104,
                                                        "text":""
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"ns",
                                                "events":{"change":"__ns_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":62,
                                                        "y":102,
                                                        "maximum":9999
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"btn",
                                                "events":{"click":"__btn_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "0";
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":60
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"_StarAdditionPanel_IntroText1",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":83});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StarAdditionPanel()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 340;
            this.height = 410;
            _StarAdditionPanel_RadioButtonGroup1_i();
            this.addEventListener("creationComplete", ___StarAdditionPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StarAdditionPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get rl_num():RoundedLabel
        {
            return (this._928564223rl_num);
        }

        public function set rl_num(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._928564223rl_num;
            if (_local_2 !== _arg_1)
            {
                this._928564223rl_num = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_num", _local_2, _arg_1));
            };
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            starAddition();
        }

        public function __radiogroup_change(_arg_1:Event):void
        {
            selectStar(_arg_1);
        }

        private function updateView():void
        {
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Number;
            var _local_1:int;
            var _local_2:Number = 1;
            var _local_3:* = "";
            starsData = _core.player.starsData;
            if (starsData[selectType])
            {
                _local_5 = GameData.d[GamePredef.TBL_STARS_TEMPLATE][starsData[selectType].tid];
                _local_2 = starsData[selectType].addition;
                _local_6 = _core.getStarColor(_local_2);
                rl_addi.setStyle("color", GamePredef.CODE_ITEM_COLOR[_local_6]);
                if (_local_5)
                {
                    _local_1 = _local_5.level;
                    _local_7 = (_local_5.addValue * _local_2);
                    _local_7 = Number(_local_7.toFixed(2));
                    if (_local_7 == int(_local_7))
                    {
                        _local_7 = int(_local_7);
                    };
                    _local_3 = Language.CHARACTORPANEL_U[57].toString().replace("{prop}", GamePredef.STAR_PROP_DIC[selectType]).replace("{value}", _local_7);
                }
                else
                {
                    _local_3 = Language.CHARACTORPANEL_U[57].toString().replace("{prop}", GamePredef.STAR_PROP_DIC[selectType]).replace("{value}", 0);
                };
            }
            else
            {
                _local_3 = Language.CHARACTORPANEL_U[57].toString().replace("{prop}", GamePredef.STAR_PROP_DIC[selectType]).replace("{value}", 0);
                rl_addi.setStyle("color", "#ffffff");
            };
            if (((selectType == 8) || (selectType == 11)))
            {
                _local_3 = (_local_3 + "%");
            };
            var _local_4:String = _local_2.toFixed(2);
            rl_level.text = ((Language.STAR_ADD_PANEL_U[13] + "：") + _local_1);
            rl_addi.text = ((Language.STAR_ADD_PANEL_U[14] + "：") + _local_4);
            rl_desc.text = ((Language.STAR_ADD_PANEL_U[15] + "：") + _local_3);
        }

        public function init():void
        {
            item.addEventListener(GameEvent.SLOT_GIID_CHANGE, slotGiidChange);
        }

        [Bindable(event="propertyChange")]
        public function get item():ItemSlotStars
        {
            return (this._3242771item);
        }

        public function set rl_money(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1001881211rl_money;
            if (_local_2 !== _arg_1)
            {
                this._1001881211rl_money = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_money", _local_2, _arg_1));
            };
        }

        public function set item(_arg_1:ItemSlotStars):void
        {
            var _local_2:Object = this._3242771item;
            if (_local_2 !== _arg_1)
            {
                this._3242771item = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item", _local_2, _arg_1));
            };
        }

        public function slotGiidChange(_arg_1:Event):void
        {
            if (((item.slotData) && (item.slotData.tid == ITEM_STAR_ADD)))
            {
                btn.enabled = true;
                ns.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get rl_level():RoundedLabel
        {
            return (this._1000667455rl_level);
        }

        private function _StarAdditionPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.STAR_ADD_PANEL_U[0];
            _local_1 = _index;
            _local_1 = Language.STAR_ADD_PANEL_U[1];
            _local_1 = Language.STAR_ADD_PANEL_U[2];
            _local_1 = Language.STAR_ADD_PANEL_U[3];
            _local_1 = Language.STAR_ADD_PANEL_U[4];
            _local_1 = Language.STAR_ADD_PANEL_U[5];
            _local_1 = Language.STAR_ADD_PANEL_U[6];
            _local_1 = Language.STAR_ADD_PANEL_U[7];
            _local_1 = Language.STAR_ADD_PANEL_U[8];
            _local_1 = Language.STAR_ADD_PANEL_U[9];
            _local_1 = Language.STAR_ADD_PANEL_U[10];
            _local_1 = Language.STAR_ADD_PANEL_U[11];
            _local_1 = Language.STAR_ADD_PANEL_U[12];
            _local_1 = Language.STAR_ADD_PANEL_U[13];
            _local_1 = Language.STAR_ADD_PANEL_U[14];
            _local_1 = Language.STAR_ADD_PANEL_U[15];
            _local_1 = Language.STAR_ADD_PANEL_U[19];
            _local_1 = Slot.SLOT_STARS_ADD;
            _local_1 = Language.STAR_ADD_PANEL_U[17];
            _local_1 = Language.STAR_SPEED_UP_PANEL_U[5];
        }

        private function updateRate(_arg_1:Boolean):void
        {
            var _local_3:Number;
            var _local_4:int;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:int;
            if (((_arg_1) && (!(item.slotData))))
            {
                _core.sysMidNote(Language.STAR_ADD_PANEL_S[6]);
                ns.value = 0;
            };
            if (ns.value == 0)
            {
                rl_rate.text = (Language.STAR_ADD_PANEL_U[16] + ":");
                return;
            };
            var _local_2:Object = starsData[selectType];
            if (_local_2)
            {
                _local_7 = _core.getStarColor(_local_2.addition);
                _local_6 = _local_2.addition;
                _local_5 = ((GamePredef.STAR_ADDITION_BASIC_SUCCESS[_local_7] * ns.value) + GamePredef.STAR_ADDITION_ADD_SUCCESS[_local_7]);
                if (_core.MC_BIRTH_FLAG[14])
                {
                    _local_5 = ((GamePredef.MC_BIRTH_CONFIG[14][_local_7] * ns.value) + GamePredef.STAR_ADDITION_ADD_SUCCESS[_local_7]);
                };
                if (_local_5 > 1)
                {
                    _local_5 = 1;
                };
            }
            else
            {
                _local_6 = 1;
                _local_5 = ((GamePredef.STAR_ADDITION_BASIC_SUCCESS[_local_7] * ns.value) + GamePredef.STAR_ADDITION_ADD_SUCCESS[_local_7]);
                if (_core.MC_BIRTH_FLAG[14])
                {
                    _local_5 = ((GamePredef.MC_BIRTH_CONFIG[14][_local_7] * ns.value) + GamePredef.STAR_ADDITION_ADD_SUCCESS[_local_7]);
                };
                if (_local_5 > 1)
                {
                    _local_5 = 1;
                };
            };
            _local_3 = Number((_local_5 * 100).toFixed(2));
            _local_4 = Math.round((((GamePredef.STAR_ADDITION_BASIC_MONEY[selectType] * 20) * _local_5) * _local_6));
            rl_rate.text = (((Language.STAR_ADD_PANEL_U[16] + ":") + _local_3) + "%");
            rl_money.text = (Language.STAR_ADD_PANEL_U[18] + Math.round(_local_4));
        }

        public function ___StarAdditionPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        [Bindable(event="propertyChange")]
        public function get btn():BasicGlowButton
        {
            return (this._97884btn);
        }

        private function _StarAdditionPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup = _local_1;
            _local_1.addEventListener("change", __radiogroup_change);
            BindingManager.executeBindings(this, "radiogroup", radiogroup);
            _local_1.initialized(this, "radiogroup");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup():RadioButtonGroup
        {
            return (this._5318500radiogroup);
        }

        private function selectStar(_arg_1:Event):void
        {
            selectType = _arg_1.target.selectedValue;
            updateView();
            updateRate(false);
        }

        public function ___StarAdditionPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function starAddition():void
        {
            if (selectType <= 0)
            {
                Alert.show(Language.STAR_ADD_PANEL_S[3]);
                return;
            };
            if (ns.value <= 0)
            {
                Alert.show(Language.STAR_ADD_PANEL_S[4]);
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.addStarAddition(selectType, ns.value, item.slotData.id);
                };
            };
            if (starsData[selectType])
            {
                _core.remote.addStarAddition(selectType, ns.value, item.slotData.id);
            }
            else
            {
                Alert.show(Language.STAR_ADD_PANEL_S[5], null, (Alert.YES | Alert.NO), null, func);
            };
        }

        [Bindable(event="propertyChange")]
        public function get rl_desc():RoundedLabel
        {
            return (this._1278967158rl_desc);
        }

        [Bindable(event="propertyChange")]
        public function get rl_money():RoundedLabel
        {
            return (this._1001881211rl_money);
        }

        public function set rl_level(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1000667455rl_level;
            if (_local_2 !== _arg_1)
            {
                this._1000667455rl_level = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_level", _local_2, _arg_1));
            };
        }

        private function buy():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP);
            _local_1.buyStarAddItem();
        }

        public function __ns_change(_arg_1:NumericStepperEvent):void
        {
            updateRate(true);
        }

        override public function initialize():void
        {
            var target:StarAdditionPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StarAdditionPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_StarAdditionPanelWatcherSetupUtil");
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

        public function set rl_addi(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1278876365rl_addi;
            if (_local_2 !== _arg_1)
            {
                this._1278876365rl_addi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_addi", _local_2, _arg_1));
            };
        }

        public function set ns(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._3525ns;
            if (_local_2 !== _arg_1)
            {
                this._3525ns = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ns", _local_2, _arg_1));
            };
        }

        private function set _index(_arg_1:int):void
        {
            var _local_2:Object = this._1474851885_index;
            if (_local_2 !== _arg_1)
            {
                this._1474851885_index = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_index", _local_2, _arg_1));
            };
        }

        public function set rl_rate(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1279380421rl_rate;
            if (_local_2 !== _arg_1)
            {
                this._1279380421rl_rate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_rate", _local_2, _arg_1));
            };
        }

        public function set btn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ns():NumericStepper
        {
            return (this._3525ns);
        }

        public function set radiogroup(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._5318500radiogroup;
            if (_local_2 !== _arg_1)
            {
                this._5318500radiogroup = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rl_addi():RoundedLabel
        {
            return (this._1278876365rl_addi);
        }

        [Bindable(event="propertyChange")]
        private function get _index():int
        {
            return (this._1474851885_index);
        }

        [Bindable(event="propertyChange")]
        public function get rl_rate():RoundedLabel
        {
            return (this._1279380421rl_rate);
        }

        public function updateStackNum(_arg_1:int):void
        {
            item.stackNum = (item.stackNum - _arg_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:Object;
            super.visible = _arg_1;
            if (_arg_1)
            {
                starsData = _core.player.starsData;
                item.clean();
                for each (_local_2 in _dm.sList)
                {
                    if (((ToolKit.isBigThan(_local_2.sid, GamePredef.SLOT_SID_BAG[0])) && (ToolKit.isSmallOrEqual(_local_2.sid, GamePredef.SLOT_SID_BAG[_core.player.bagSlotNum]))))
                    {
                        _local_3 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_2.tid];
                        if (((_local_3) && (_local_3.type == GamePredef.ITEM_TYPE_STAR_ADD)))
                        {
                            item.slotData = _local_2;
                            item.type = _local_2.type;
                            item.giid = _local_2.itemId;
                            item.stackNum = _local_2.stackNum;
                            break;
                        };
                    };
                };
                if (!item.slotData)
                {
                    item.type = GamePredef.TBL_ITEM_TEMPLATE;
                    item.giid = ITEM_STAR_ADD;
                    item.stackNum = 0;
                    btn.enabled = false;
                    ns.enabled = false;
                }
                else
                {
                    btn.enabled = true;
                    ns.enabled = true;
                };
                if (selectType > 0)
                {
                    updateView();
                    ((item.slotData) && (updateRate(true)));
                };
            };
        }

        public function setTypeAndUpdateView(_arg_1:int):void
        {
            if (_arg_1 > 0)
            {
                selectType = _arg_1;
                updateRate(false);
                updateView();
            };
        }

        private function _StarAdditionPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_StarAdditionPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_index);
            }, function (_arg_1:Object):void
            {
                radiogroup.selectedValue = _arg_1;
            }, "radiogroup.selectedValue");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton1.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton2.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton3.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton4.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton5.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton6.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton7.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton7.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton8.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton8.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton9.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton9.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton10.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton10.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton11.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton11.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_RadioButton12.label = _arg_1;
            }, "_StarAdditionPanel_RadioButton12.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_level.text = _arg_1;
            }, "rl_level.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_addi.text = _arg_1;
            }, "rl_addi.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rl_desc.text = _arg_1;
            }, "rl_desc.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_BasicGlowButton1.label = _arg_1;
            }, "_StarAdditionPanel_BasicGlowButton1.label");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_STARS_ADD);
            }, function (_arg_1:int):void
            {
                item.slotType = _arg_1;
            }, "item.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_ADD_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn.label = _arg_1;
            }, "btn.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_SPEED_UP_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarAdditionPanel_IntroText1.htmlText = _arg_1;
            }, "_StarAdditionPanel_IntroText1.htmlText");
            result[20] = binding;
            return (result);
        }

        public function set rl_desc(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1278967158rl_desc;
            if (_local_2 !== _arg_1)
            {
                this._1278967158rl_desc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl_desc", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

