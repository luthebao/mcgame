// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DoubleElevenPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.LotteryItemSlot;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Button;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.RoundCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
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

    public class DoubleElevenPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _935514565chanceCount:int = 0;
        private var _1628325440activityDesc:Canvas;
        private var _2113293147slot2_0:LotteryItemSlot;
        private var _306362288onceRemainCount2:RoundedLabel;
        private var _306362289onceRemainCount3:RoundedLabel;
        private var _1134689113keyNum:int = 0;
        private var _88560074onceLuckDraw:Canvas;
        private var _3773vs:ViewStack;
        private var _2113293146slot2_1:LotteryItemSlot;
        private var TICKET_ID:Number = 3736;
        private var _277229568idTabCanvas2:BasicGlowButton;
        private var isDeleay:Boolean = false;
        private var _2113293145slot2_2:LotteryItemSlot;
        private var doCount:int = 0;
        private var timer:Timer;
        private var _177071555linkVip:LinkTextArea;
        public var _DoubleElevenPanel_Text1:Text;
        private var isStart:Boolean = false;
        public var _DoubleElevenPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var currentPix:int = -1;
        private var _2113293144slot2_3:LotteryItemSlot;
        private var _slotNum:Number = 10;
        public var _DoubleElevenPanel_RoundedLabel4:RoundedLabel;
        public var _DoubleElevenPanel_RoundedLabel5:RoundedLabel;
        private var _2113293143slot2_4:LotteryItemSlot;
        private var _1256808642onceRemainCount:RoundedLabel;
        private var _522238492allPoints:int = 0;
        private var _click:Number = 0;
        private var _2113293142slot2_5:LotteryItemSlot;
        private var _277229567idTabCanvas3:BasicGlowButton;
        private var _277229569idTabCanvas1:BasicGlowButton;
        private var cid:int = 0;
        private var _2002514760luckDrawButtonOnce:Button;
        private var _2113293139slot2_8:LotteryItemSlot;
        private var _55433449leftTxt:Label;
        private var _2113293141slot2_6:LotteryItemSlot;
        private var index:Number = 0;
        private var _2142793722luckDrawButtonAll:DelayButton;
        private var _463353963vipTile:RoundCanvas;
        private var rungroup:int = 0;
        private var _2113293138slot2_9:LotteryItemSlot;
        private var ITEM_TYPE:Number = 29;
        private var _2048290139chanceLeft:int = 100;
        private var _2113293140slot2_7:LotteryItemSlot;
        private var runNum:int = 3;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":530,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_DoubleElevenPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 0;
                                        this.left = "45";
                                        this.top = "40";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HTabWrapper",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTabCanvas1",
                                                "events":{"click":"__idTabCanvas1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab",
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTabCanvas2",
                                                "events":{"click":"__idTabCanvas2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"idTabCanvas3",
                                                "events":{"click":"__idTabCanvas3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "id":"luckDrawButtonAll",
                                    "events":{"click":"__luckDrawButtonAll_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":370,
                                            "y":50,
                                            "clickDelay":3000,
                                            "styleName":"CrystalYellowButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"leftTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":435,
                                            "y":50
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "65";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"onceLuckDraw",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":465,
                                                        "width":690,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":450,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundCanvas,
                                                                        "id":"vipTile",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":430,
                                                                                "percentHeight":100,
                                                                                "y":10,
                                                                                "x":10,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_0"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_1"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_2"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_3"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_4"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_5"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_6"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_7"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_8"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_9"
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"luckDrawButtonOnce",
                                                                        "events":{"click":"__luckDrawButtonOnce_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnLottery",
                                                                                "x":160,
                                                                                "y":145
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"onceRemainCount",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "8";
                                                                            this.color = 0xFFFFFF;
                                                                            this.horizontalCenter = "0";
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"onceRemainCount2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":3,
                                                                                "x":280
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"onceRemainCount3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":24,
                                                                                "x":280
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_DoubleElevenPanel_RoundedLabel4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "0";
                                                                this.fontSize = 14;
                                                                this.textAlign = "center";
                                                                this.fontStyle = "normal";
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":280,
                                                                    "y":390
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":200,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"_DoubleElevenPanel_RoundedLabel5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "8";
                                                                            this.color = 0xFFFFFF;
                                                                            this.horizontalCenter = "0";
                                                                            this.fontSize = 14;
                                                                            this.textAlign = "center";
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkTextArea,
                                                                        "id":"linkVip",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0.3;
                                                                            this.backgroundColor = 0;
                                                                            this.borderStyle = "none";
                                                                            this.color = 16774324;
                                                                            this.bottom = "5";
                                                                            this.left = "2";
                                                                            this.right = "2";
                                                                            this.top = "30";
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
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"activityDesc",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":465,
                                                        "width":690,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":670,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Text,
                                                                        "id":"_DoubleElevenPanel_Text1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":400,
                                                                                "width":660
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]});
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        public var highestAwardArr:Array = new Array();
        private var _core:Core = Core.getInstance();
        private var luckDrawAward:Object = new Object();
        private var _arr:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DoubleElevenPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 530;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___DoubleElevenPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DoubleElevenPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get idTabCanvas2():BasicGlowButton
        {
            return (this._277229568idTabCanvas2);
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas3():BasicGlowButton
        {
            return (this._277229567idTabCanvas3);
        }

        public function showPanel():void
        {
            _core.remote.call("getFLottData", new Responder(onGetDoubleElevenData), (_core.player.id == this.cid));
        }

        public function set idTabCanvas3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229567idTabCanvas3;
            if (_local_2 !== _arg_1)
            {
                this._277229567idTabCanvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas3", _local_2, _arg_1));
            };
        }

        public function set luckDrawButtonAll(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2142793722luckDrawButtonAll;
            if (_local_2 !== _arg_1)
            {
                this._2142793722luckDrawButtonAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "luckDrawButtonAll", _local_2, _arg_1));
            };
        }

        protected function start2(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:int;
            if (!_arg_1)
            {
                luckDrawButtonOnce.enabled = true;
                return;
            };
            var _local_2:Number = _arg_1.val;
            chanceCount = _arg_1.ticketnum;
            onceRemainCount.text = (Language.LUCKDRAWPANEL_U[16] + chanceCount);
            for (_local_3 in _arr)
            {
                if (ToolKit.isEqual(_arr[_local_3], _local_2))
                {
                    _local_2 = _local_3;
                    break;
                };
            };
            if (_local_2 >= 0)
            {
                _local_4 = 0;
                while (_local_4 < _slotNum)
                {
                    this[("slot2_" + _local_4)].change(false);
                    _local_4++;
                };
                isDeleay = false;
                rungroup = 0;
                doCount++;
                currentPix = _local_2;
                runNum = (Math.round((Math.random() * 2)) + 2);
                if (((timer) && (timer.running)))
                {
                    timer.removeEventListener(TimerEvent.TIMER, onTimer2);
                    timer.stop();
                    timer = null;
                };
                timer = new Timer(100);
                timer.addEventListener(TimerEvent.TIMER, onTimer2);
                timer.start();
            };
        }

        public function set idTabCanvas2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229568idTabCanvas2;
            if (_local_2 !== _arg_1)
            {
                this._277229568idTabCanvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas2", _local_2, _arg_1));
            };
        }

        public function __luckDrawButtonAll_click(_arg_1:MouseEvent):void
        {
            toGetKey();
        }

        [Bindable(event="propertyChange")]
        public function get luckDrawButtonAll():DelayButton
        {
            return (this._2142793722luckDrawButtonAll);
        }

        public function __idTabCanvas1_click(_arg_1:MouseEvent):void
        {
            setTab(1);
        }

        [Bindable(event="propertyChange")]
        public function get onceLuckDraw():Canvas
        {
            return (this._88560074onceLuckDraw);
        }

        [Bindable(event="propertyChange")]
        public function get chanceCount():int
        {
            return (this._935514565chanceCount);
        }

        [Bindable(event="propertyChange")]
        public function get activityDesc():Canvas
        {
            return (this._1628325440activityDesc);
        }

        [Bindable(event="propertyChange")]
        public function get luckDrawButtonOnce():Button
        {
            return (this._2002514760luckDrawButtonOnce);
        }

        protected function onTimer2(_arg_1:TimerEvent):void
        {
            if (index < 0)
            {
                index = (_slotNum - 1);
                rungroup++;
            };
            isStart = true;
            if (isDeleay)
            {
                timer.delay = (timer.delay + 50);
            }
            else
            {
                if (((rungroup > runNum) && (currentPix == index)))
                {
                    isDeleay = true;
                };
            };
            this[("slot2_" + index)].change(true);
            if (timer.delay > 400)
            {
                if (index == currentPix)
                {
                    if (((timer) && (timer.running)))
                    {
                        timer.stop();
                        timer.removeEventListener(TimerEvent.TIMER, onTimer2);
                        timer = null;
                    };
                    this[("slot2_" + ((index + 1) % _slotNum))].change(false);
                    this[("slot2_" + index)].change(true);
                    _core.remote.call("lotteryResultBoast", null, 3);
                    isStart = false;
                    luckDrawButtonOnce.enabled = true;
                    index = 0;
                    isStart = false;
                    isDeleay = false;
                    rungroup = 0;
                    doCount = 0;
                    currentPix = -1;
                    return;
                };
            };
            this[("slot2_" + ((index + 1) % _slotNum))].change(false);
            if (isStart)
            {
                this[("slot2_" + index)].change(true);
            };
            index--;
        }

        public function superLuckDrawShow(_arg_1:Object, _arg_2:int):void
        {
            var _local_4:Object;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:String;
            if (!_arg_1)
            {
                return;
            };
            var _local_3:* = "";
            if ((((_arg_1.p) && (_arg_1.p > 10)) && (_arg_1.type == 3)))
            {
                _local_4 = _core.data.getGameData(_arg_1.ti, _arg_1.ii);
                if (!_local_4)
                {
                    return;
                };
                if (((!(_local_4.color)) || (_local_4.color < 0)))
                {
                    _local_4.color = 0;
                };
                _local_3 = Language.NOTICE_INFO[93];
                if (!_local_3)
                {
                    return;
                };
                _local_3 = _local_3.replace("{name}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.c) + "|") + _arg_1.name) + "|0|0|0]")));
                if (_arg_1.ti == GamePredef.TBL_EQUIPT_TEMPLATE)
                {
                    if (!_arg_1.cl)
                    {
                        if (_local_4.color > 0)
                        {
                            _arg_1.cl = _local_4.color;
                        }
                        else
                        {
                            _arg_1.cl = 0;
                        };
                    };
                    _local_6 = _core.data.gameData[_arg_1.ti][_arg_1.ii];
                    if (_local_6.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                    {
                        _local_7 = ((Number(_arg_1.q) * 10) + 6);
                        _local_3 = _local_3.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_4.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + _local_7) + "]")));
                    }
                    else
                    {
                        _local_3 = _local_3.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_4.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                    };
                }
                else
                {
                    if (_arg_1.ti == GamePredef.TBL_ITEM_TEMPLATE)
                    {
                        if (!_arg_1.cl)
                        {
                            if (_local_4.color > 0)
                            {
                                _arg_1.cl = _local_4.color;
                            }
                            else
                            {
                                _arg_1.cl = 0;
                            };
                        };
                        _local_3 = _local_3.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_4.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                    }
                    else
                    {
                        if (_arg_1.ti == GamePredef.TBL_CREATURE)
                        {
                            _local_8 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_arg_1.q)]) + "'>[") + _local_4.name) + "]</font>");
                            _local_3 = _local_3.replace("{item}", _local_8);
                        };
                    };
                };
                _local_3 = _local_3.replace("{num}", _arg_1.n);
                _local_5 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + "'>") + TextUtil.decode(_local_3)) + "</font><br/>");
                if (_arg_2 != 1)
                {
                    if (_arg_2 == 2)
                    {
                        if (linkVip)
                        {
                            linkVip.htmlText = (linkVip.htmlText + _local_5);
                        };
                    }
                    else
                    {
                        if (_arg_2 == 3)
                        {
                            if (linkVip)
                            {
                                linkVip.htmlText = (linkVip.htmlText + _local_5);
                            };
                        };
                    };
                };
            };
        }

        public function set slot2_3(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293144slot2_3;
            if (_local_2 !== _arg_1)
            {
                this._2113293144slot2_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_3", _local_2, _arg_1));
            };
        }

        public function set slot2_0(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293147slot2_0;
            if (_local_2 !== _arg_1)
            {
                this._2113293147slot2_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_0", _local_2, _arg_1));
            };
        }

        public function set slot2_4(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293143slot2_4;
            if (_local_2 !== _arg_1)
            {
                this._2113293143slot2_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_4", _local_2, _arg_1));
            };
        }

        public function onGetDoubleElevenData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:*;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Number;
            var _local_8:Object;
            if (_arg_1)
            {
                this.cid = _core.player.id;
                chanceLeft = int(_arg_1.lp);
                if (chanceLeft < 0)
                {
                    chanceLeft = 0;
                };
                if (((!(_arg_1.sp == null)) && (!(isNaN(_arg_1.sp)))))
                {
                    allPoints = int(_arg_1.sp);
                    onceRemainCount2.text = (Language.LUCKDRAWPANEL_U[19] + allPoints);
                };
                if (((!(_arg_1.sk == null)) && (!(isNaN(_arg_1.sk)))))
                {
                    keyNum = int(_arg_1.sk);
                    onceRemainCount3.text = (Language.LUCKDRAWPANEL_U[20] + keyNum);
                };
                leftTxt.text = Language.LUCKDRAWPANEL_U[18].toString().replace("{num}", chanceLeft);
                this.visible = true;
                chanceCount = _arg_1.chanceCount;
                onceRemainCount.text = (Language.LUCKDRAWPANEL_U[16] + chanceCount);
                luckDrawAward = new Object();
                luckDrawAward = _arg_1.lotteryAward;
                highestAwardArr = new Array();
                highestAwardArr = _arg_1.hAwardLott;
                _local_2 = 2;
                while (_local_2 <= 2)
                {
                    _arr = new Array();
                    _local_4 = 0;
                    while (_local_4 < 10)
                    {
                        _local_5 = _core.data.gameData[GamePredef.TBL_PLAN][luckDrawAward[(_local_2 - 2)][_local_4]];
                        if (_local_5)
                        {
                            _arr.push(luckDrawAward[(_local_2 - 2)][_local_4]);
                            this[((("slot" + _local_2) + "_") + _local_4)]["awardSlot"].type = _local_5.ti;
                            this[((("slot" + _local_2) + "_") + _local_4)]["awardSlot"].giid = _local_5.ii;
                            this[((("slot" + _local_2) + "_") + _local_4)]["awardSlot"].stackNum = _local_5.n;
                            this[((("slot" + _local_2) + "_") + _local_4)]["awardSlot"].slotData = _local_5;
                            _local_6 = _core.data.getGameData(_local_5.ti, _local_5.ii);
                            if (_local_6)
                            {
                                if (_local_6.color)
                                {
                                    this[((("slot" + _local_2) + "_") + _local_4)]["awardSlot"].setStyleName(_local_6.color);
                                }
                                else
                                {
                                    if (_local_5.ti == GamePredef.TBL_CREATURE)
                                    {
                                        this[((("slot" + _local_2) + "_") + _local_4)]["awardSlot"].setStyleName(_core.basic.colorByGrowRate(_local_5.q));
                                    };
                                };
                            };
                        };
                        _local_4++;
                    };
                    _local_2++;
                };
                if (linkVip)
                {
                    linkVip.htmlText = "";
                };
                _local_3 = ((highestAwardArr) ? highestAwardArr.length : 0);
                if (ToolKit.isBigThan(_local_3, 0))
                {
                    _local_7 = ToolKit.minus(_local_3, 1);
                    while (_local_7 >= 0)
                    {
                        _local_8 = highestAwardArr[_local_7];
                        superLuckDrawShow(_local_8, 3);
                        _local_7--;
                    };
                };
            };
        }

        private function _DoubleElevenPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.LUCKDRAWPANEL_U[21];
            _local_1 = Language.LUCKDRAWPANEL_U[3];
            _local_1 = Language.LUCKDRAWPANEL_U[4];
            _local_1 = Language.LUCKDRAWPANEL_U[11];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.LUCKDRAWPANEL_U[14];
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(3130090000055));
            _local_1 = (Language.LUCKDRAWPANEL_U[16] + chanceCount);
            _local_1 = (Language.LUCKDRAWPANEL_U[19] + allPoints);
            _local_1 = (Language.LUCKDRAWPANEL_U[20] + keyNum);
            _local_1 = Language.LUCKDRAWPANEL_U[15];
            _local_1 = Language.VIPSHOPPANEL_U[3];
            _local_1 = Language.LUCKDRAWPANEL_U[22];
        }

        public function set slot2_2(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293145slot2_2;
            if (_local_2 !== _arg_1)
            {
                this._2113293145slot2_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_2", _local_2, _arg_1));
            };
        }

        public function set slot2_6(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293141slot2_6;
            if (_local_2 !== _arg_1)
            {
                this._2113293141slot2_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_6", _local_2, _arg_1));
            };
        }

        public function set slot2_8(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293139slot2_8;
            if (_local_2 !== _arg_1)
            {
                this._2113293139slot2_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_8", _local_2, _arg_1));
            };
        }

        public function set slot2_1(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293146slot2_1;
            if (_local_2 !== _arg_1)
            {
                this._2113293146slot2_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_1", _local_2, _arg_1));
            };
        }

        public function set keyNum(_arg_1:int):void
        {
            var _local_2:Object = this._1134689113keyNum;
            if (_local_2 !== _arg_1)
            {
                this._1134689113keyNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "keyNum", _local_2, _arg_1));
            };
        }

        public function set onceRemainCount2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._306362288onceRemainCount2;
            if (_local_2 !== _arg_1)
            {
                this._306362288onceRemainCount2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "onceRemainCount2", _local_2, _arg_1));
            };
        }

        public function set slot2_7(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293140slot2_7;
            if (_local_2 !== _arg_1)
            {
                this._2113293140slot2_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_7", _local_2, _arg_1));
            };
        }

        public function onOnceClick():void
        {
            var _local_1:*;
            if (ToolKit.isSmallOrEqual(ToolKit.minus(new Date().time, _click), 1500))
            {
                return;
            };
            _click = new Date().time;
            if (chanceCount >= 1)
            {
                luckDrawButtonOnce.enabled = false;
                _local_1 = {
                    "type":0,
                    "num":1
                };
                _core.remote.call("fLotteryByClient", new Responder(start2), _local_1);
            }
            else
            {
                luckDrawButtonOnce.enabled = true;
                _core.sysMidNote(Language.LUCKDRAWPANEL_U[17]);
            };
        }

        public function set slot2_9(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293138slot2_9;
            if (_local_2 !== _arg_1)
            {
                this._2113293138slot2_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_9", _local_2, _arg_1));
            };
        }

        public function set onceLuckDraw(_arg_1:Canvas):void
        {
            var _local_2:Object = this._88560074onceLuckDraw;
            if (_local_2 !== _arg_1)
            {
                this._88560074onceLuckDraw = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "onceLuckDraw", _local_2, _arg_1));
            };
        }

        private function _DoubleElevenPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DoubleElevenPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_DoubleElevenPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas1.label = _arg_1;
            }, "idTabCanvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas2.label = _arg_1;
            }, "idTabCanvas2.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas3.label = _arg_1;
            }, "idTabCanvas3.label");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                luckDrawButtonAll.filters = _arg_1;
            }, "luckDrawButtonAll.filters");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                luckDrawButtonAll.label = _arg_1;
            }, "luckDrawButtonAll.label");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(3130090000055)));
            }, function (_arg_1:Object):void
            {
                vipTile.setStyle("backgroundImage", _arg_1);
            }, "vipTile.backgroundImage");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.LUCKDRAWPANEL_U[16] + chanceCount);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                onceRemainCount.text = _arg_1;
            }, "onceRemainCount.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.LUCKDRAWPANEL_U[19] + allPoints);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                onceRemainCount2.text = _arg_1;
            }, "onceRemainCount2.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.LUCKDRAWPANEL_U[20] + keyNum);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                onceRemainCount3.text = _arg_1;
            }, "onceRemainCount3.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DoubleElevenPanel_RoundedLabel4.text = _arg_1;
            }, "_DoubleElevenPanel_RoundedLabel4.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DoubleElevenPanel_RoundedLabel5.text = _arg_1;
            }, "_DoubleElevenPanel_RoundedLabel5.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LUCKDRAWPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DoubleElevenPanel_Text1.text = _arg_1;
            }, "_DoubleElevenPanel_Text1.text");
            result[12] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get chanceLeft():int
        {
            return (this._2048290139chanceLeft);
        }

        public function set slot2_5(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293142slot2_5;
            if (_local_2 !== _arg_1)
            {
                this._2113293142slot2_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_5", _local_2, _arg_1));
            };
        }

        public function set onceRemainCount3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._306362289onceRemainCount3;
            if (_local_2 !== _arg_1)
            {
                this._306362289onceRemainCount3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "onceRemainCount3", _local_2, _arg_1));
            };
        }

        public function set chanceCount(_arg_1:int):void
        {
            var _local_2:Object = this._935514565chanceCount;
            if (_local_2 !== _arg_1)
            {
                this._935514565chanceCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chanceCount", _local_2, _arg_1));
            };
        }

        public function ___DoubleElevenPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get vipTile():RoundCanvas
        {
            return (this._463353963vipTile);
        }

        public function set linkVip(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._177071555linkVip;
            if (_local_2 !== _arg_1)
            {
                this._177071555linkVip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "linkVip", _local_2, _arg_1));
            };
        }

        public function set activityDesc(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1628325440activityDesc;
            if (_local_2 !== _arg_1)
            {
                this._1628325440activityDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activityDesc", _local_2, _arg_1));
            };
        }

        public function toGetKey():void
        {
            _core.remote.call("getDialkey", new Responder(onGetKey));
        }

        public function superLotterySystemSay(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:String;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = "";
            if (((_arg_1.p) && (_arg_1.p > 10)))
            {
                _local_3 = _core.data.getGameData(_arg_1.ti, _arg_1.ii);
                if (!_local_3)
                {
                    return;
                };
                if (((!(_local_3.color)) || (_local_3.color < 0)))
                {
                    _local_3.color = 0;
                };
                _local_2 = Language.NOTICE_INFO[93].toString().replace("※", "");
                if (!_local_2)
                {
                    return;
                };
                _local_2 = _local_2.replace("{name}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.c) + "|") + _arg_1.name) + "|0|0|0]")));
                if (_arg_1.ti == GamePredef.TBL_EQUIPT_TEMPLATE)
                {
                    if (!_arg_1.cl)
                    {
                        if (_local_3.color > 0)
                        {
                            _arg_1.cl = _local_3.color;
                        }
                        else
                        {
                            _arg_1.cl = 0;
                        };
                    };
                    _local_5 = _core.data.gameData[_arg_1.ti][_arg_1.ii];
                    if (_local_5.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                    {
                        _local_6 = ((Number(_arg_1.q) * 10) + 6);
                        _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + _local_6) + "]")));
                    }
                    else
                    {
                        _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                    };
                }
                else
                {
                    if (_arg_1.ti == GamePredef.TBL_ITEM_TEMPLATE)
                    {
                        if (!_arg_1.cl)
                        {
                            if (_local_3.color > 0)
                            {
                                _arg_1.cl = _local_3.color;
                            }
                            else
                            {
                                _arg_1.cl = 0;
                            };
                        };
                        _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                    }
                    else
                    {
                        if (_arg_1.ti == GamePredef.TBL_CREATURE)
                        {
                            _local_7 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_arg_1.q)]) + "'>[") + _local_3.name) + "]</font>");
                            _local_2 = _local_2.replace("{item}", _local_7);
                        };
                    };
                };
                _local_2 = _local_2.replace("{num}", _arg_1.n);
                _local_4 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + "'>") + TextUtil.decode(_local_2)) + "</font>");
                _core.sysMsg(_local_4);
            };
        }

        override public function initialize():void
        {
            var target:DoubleElevenPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DoubleElevenPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DoubleElevenPanelWatcherSetupUtil");
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

        public function set onceRemainCount(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1256808642onceRemainCount;
            if (_local_2 !== _arg_1)
            {
                this._1256808642onceRemainCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "onceRemainCount", _local_2, _arg_1));
            };
        }

        public function __idTabCanvas2_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_LOTTERY_BAG);
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2_0():LotteryItemSlot
        {
            return (this._2113293147slot2_0);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_1():LotteryItemSlot
        {
            return (this._2113293146slot2_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_4():LotteryItemSlot
        {
            return (this._2113293143slot2_4);
        }

        public function __idTabCanvas3_click(_arg_1:MouseEvent):void
        {
            setTab(3);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_6():LotteryItemSlot
        {
            return (this._2113293141slot2_6);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_7():LotteryItemSlot
        {
            return (this._2113293140slot2_7);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_8():LotteryItemSlot
        {
            return (this._2113293139slot2_8);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_2():LotteryItemSlot
        {
            return (this._2113293145slot2_2);
        }

        public function set luckDrawButtonOnce(_arg_1:Button):void
        {
            var _local_2:Object = this._2002514760luckDrawButtonOnce;
            if (_local_2 !== _arg_1)
            {
                this._2002514760luckDrawButtonOnce = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "luckDrawButtonOnce", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2_9():LotteryItemSlot
        {
            return (this._2113293138slot2_9);
        }

        public function set chanceLeft(_arg_1:int):void
        {
            var _local_2:Object = this._2048290139chanceLeft;
            if (_local_2 !== _arg_1)
            {
                this._2048290139chanceLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chanceLeft", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2_5():LotteryItemSlot
        {
            return (this._2113293142slot2_5);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        [Bindable(event="propertyChange")]
        public function get linkVip():LinkTextArea
        {
            return (this._177071555linkVip);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_3():LotteryItemSlot
        {
            return (this._2113293144slot2_3);
        }

        [Bindable(event="propertyChange")]
        public function get onceRemainCount():RoundedLabel
        {
            return (this._1256808642onceRemainCount);
        }

        override public function initView():void
        {
        }

        public function set allPoints(_arg_1:int):void
        {
            var _local_2:Object = this._522238492allPoints;
            if (_local_2 !== _arg_1)
            {
                this._522238492allPoints = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allPoints", _local_2, _arg_1));
            };
        }

        public function setTab(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:int = 3;
            var _local_3:int = 1;
            while (_local_3 <= _local_2)
            {
                this[("idTabCanvas" + _local_3)].selected = false;
                _local_3++;
            };
            this[("idTabCanvas" + _arg_1)].selected = true;
            if (_arg_1 == 1)
            {
                vs.selectedChild = onceLuckDraw;
            };
            if (_arg_1 == 3)
            {
                vs.selectedChild = activityDesc;
            };
        }

        [Bindable(event="propertyChange")]
        public function get onceRemainCount2():RoundedLabel
        {
            return (this._306362288onceRemainCount2);
        }

        public function __luckDrawButtonOnce_click(_arg_1:MouseEvent):void
        {
            onOnceClick();
        }

        [Bindable(event="propertyChange")]
        public function get keyNum():int
        {
            return (this._1134689113keyNum);
        }

        public function superLuckDrawMidSay(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:String;
            if (!_arg_1)
            {
                return;
            };
            _local_2 = "";
            _local_3 = _core.data.getGameData(_arg_1.ti, _arg_1.ii);
            if (!_local_3)
            {
                return;
            };
            if (((!(_local_3.color)) || (_local_3.color < 0)))
            {
                _local_3.color = 0;
            };
            _local_2 = Language.LUCKDRAWPANEL_U[2];
            if (!_local_2)
            {
                return;
            };
            _local_2 = _local_2.replace("{name}", TextUtil.decode((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_CHARACTOR]) + "|") + _arg_1.c) + "|") + _arg_1.name) + "|0|0|0]")));
            if (_arg_1.ti == GamePredef.TBL_EQUIPT_TEMPLATE)
            {
                if (!_arg_1.cl)
                {
                    if (_local_3.color > 0)
                    {
                        _arg_1.cl = _local_3.color;
                    }
                    else
                    {
                        _arg_1.cl = 0;
                    };
                };
                _local_5 = _core.data.gameData[_arg_1.ti][_arg_1.ii];
                if (_local_5.kind == GamePredef.ITEM_KIND_MAGICWEAPON)
                {
                    _local_6 = ((Number(_arg_1.q) * 10) + 6);
                    _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + _local_6) + "]")));
                }
                else
                {
                    _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_EQUIPT_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                };
            }
            else
            {
                if (_arg_1.ti == GamePredef.TBL_ITEM_TEMPLATE)
                {
                    if (!_arg_1.cl)
                    {
                        if (_local_3.color > 0)
                        {
                            _arg_1.cl = _local_3.color;
                        }
                        else
                        {
                            _arg_1.cl = 0;
                        };
                    };
                    _local_2 = _local_2.replace("{item}", TextUtil.decode((((((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_ITEM_TEMPLATE]) + "|") + _arg_1.ii) + "|") + _local_3.name) + "|") + _arg_1.cl) + "|") + 0) + "|") + 0) + "]")));
                }
                else
                {
                    if (_arg_1.ti == GamePredef.TBL_CREATURE)
                    {
                        _local_7 = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.colorByGrowRate(_arg_1.q)]) + "'>[") + _local_3.name) + "]</font>");
                        _local_2 = _local_2.replace("{item}", _local_7);
                    };
                };
            };
            _local_2 = _local_2.replace("{num}", _arg_1.n);
            _local_4 = (((("<font color='" + GamePredef.MSG_CHANNEL_COLOR[6]) + "'>") + TextUtil.decode(_local_2)) + "</font><br/>");
            _core.sysMidNote(_local_4);
        }

        public function set vipTile(_arg_1:RoundCanvas):void
        {
            var _local_2:Object = this._463353963vipTile;
            if (_local_2 !== _arg_1)
            {
                this._463353963vipTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipTile", _local_2, _arg_1));
            };
        }

        public function onGetKey(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (1 == _arg_1.type)
            {
                chanceCount = _arg_1.ln;
                onceRemainCount.text = (Language.LUCKDRAWPANEL_U[16] + chanceCount);
            }
            else
            {
                if (2 == _arg_1.type)
                {
                };
            };
            chanceLeft = int(_arg_1.lp);
            if (chanceLeft < 0)
            {
                chanceLeft = 0;
            };
            if (_arg_1.sp)
            {
                allPoints = int(_arg_1.sp);
            };
            if (_arg_1.sk)
            {
                keyNum = int(_arg_1.sk);
            };
            leftTxt.text = Language.LUCKDRAWPANEL_U[18].toString().replace("{num}", chanceLeft);
            onceRemainCount2.text = (Language.LUCKDRAWPANEL_U[19] + allPoints);
            onceRemainCount3.text = (Language.LUCKDRAWPANEL_U[20] + keyNum);
        }

        [Bindable(event="propertyChange")]
        public function get leftTxt():Label
        {
            return (this._55433449leftTxt);
        }

        private function toShowPanel(_arg_1:Event):void
        {
            removeEventListener(FlexEvent.CREATION_COMPLETE, toShowPanel);
            _core.remote.call("getFLottData", new Responder(onGetDoubleElevenData), (_core.player.id == this.cid));
            showPanel();
        }

        [Bindable(event="propertyChange")]
        public function get allPoints():int
        {
            return (this._522238492allPoints);
        }

        public function set leftTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._55433449leftTxt;
            if (_local_2 !== _arg_1)
            {
                this._55433449leftTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get onceRemainCount3():RoundedLabel
        {
            return (this._306362289onceRemainCount3);
        }

        public function set idTabCanvas1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229569idTabCanvas1;
            if (_local_2 !== _arg_1)
            {
                this._277229569idTabCanvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas1():BasicGlowButton
        {
            return (this._277229569idTabCanvas1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

