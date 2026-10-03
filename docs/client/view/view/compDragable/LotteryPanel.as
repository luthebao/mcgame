// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.LotteryPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LotteryItemSlot;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.RoundCanvas;
    import flash.utils.Timer;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.TimerEvent;
    import flash.net.Responder;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import flash.events.Event;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.utils.TextUtil;
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

    public class LotteryPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1087607829slot1_10:LotteryItemSlot;
        private var _2113294106slot1_2:LotteryItemSlot;
        private var _1185932956normalRemainCount:RoundedLabel;
        private var _3773vs:ViewStack;
        private var _2113293145slot2_2:LotteryItemSlot;
        private var _177071555linkVip:LinkTextArea;
        private var _2113294104slot1_4:LotteryItemSlot;
        private var _695530881linkNormal:LinkTextArea;
        private var isDeleay1:Boolean = false;
        private var _2113293143slot2_4:LotteryItemSlot;
        private var _click:Number = 0;
        private var runNum1:int = 3;
        private var runNum2:int = 3;
        private var _2113294102slot1_6:LotteryItemSlot;
        private var _2113294099slot1_9:LotteryItemSlot;
        private var _2113293139slot2_8:LotteryItemSlot;
        private var _1087578037slot2_11:LotteryItemSlot;
        private var _2113293141slot2_6:LotteryItemSlot;
        public var _LotteryPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _277229570idTabCanvas0:BasicGlowButton;
        private var rungroup:int = 0;
        private var _2113294100slot1_8:LotteryItemSlot;
        private var ITEM_TYPE:Number = 29;
        private var _783159742lotteryButtonVip:Button;
        private var _2113294107slot1_1:LotteryItemSlot;
        private var _935514565chanceCount:int = 0;
        private var _1087607828slot1_11:LotteryItemSlot;
        private var _783179834lotteryButtonAll:DelayButton;
        private var _2113293146slot2_1:LotteryItemSlot;
        private var _1332272550vipRemainCount:RoundedLabel;
        private var TICKET_ID:Number = 3736;
        private var _277229568idTabCanvas2:BasicGlowButton;
        private var _1255688139normalTile:RoundCanvas;
        private var isDeleay:Boolean = false;
        private var _2113294105slot1_3:LotteryItemSlot;
        private var doCount:int = 0;
        private var timer:Timer;
        private var isStart:Boolean = false;
        private var _2113293144slot2_3:LotteryItemSlot;
        private var _1422638188vipLottery:Canvas;
        public var _LotteryPanel_RoundedLabel2:RoundedLabel;
        public var _LotteryPanel_RoundedLabel3:RoundedLabel;
        public var _LotteryPanel_RoundedLabel5:RoundedLabel;
        public var _LotteryPanel_RoundedLabel6:RoundedLabel;
        private var _2113294103slot1_5:LotteryItemSlot;
        private var currentPix1:int = -1;
        private var index1:Number = 0;
        private var index2:Number = 0;
        private var _2113293142slot2_5:LotteryItemSlot;
        private var _1072846686lotteryButtonNormal:Button;
        private var _277229569idTabCanvas1:BasicGlowButton;
        private var currentPix2:int = -1;
        private var timer1:Timer;
        private var _2113294101slot1_7:LotteryItemSlot;
        private var _463353963vipTile:RoundCanvas;
        private var _2113294108slot1_0:LotteryItemSlot;
        private var isStart1:Boolean = false;
        private var rungroup1:int = 0;
        private var _1087578038slot2_10:LotteryItemSlot;
        private var _1665552286normalLottery:Canvas;
        private var _2113293138slot2_9:LotteryItemSlot;
        private var _2113293140slot2_7:LotteryItemSlot;
        private var _2113293147slot2_0:LotteryItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":530,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_LotteryPanel_BasicTitleCanvas1"
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
                                                "id":"idTabCanvas0",
                                                "events":{"click":"__idTabCanvas0_click"},
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
                                                "id":"idTabCanvas1",
                                                "events":{"click":"__idTabCanvas1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "styleName":"HorizontalTab"
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
                                            })]
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
                                                "id":"normalLottery",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":690,
                                                        "height":465,
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
                                                                        "id":"normalTile",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.top = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":430,
                                                                                "percentHeight":100,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_0"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_1"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_2"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_3"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_4"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_5"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_6"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_7"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_8"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_9"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_10"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot1_11"
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"lotteryButtonNormal",
                                                                        "events":{"click":"__lotteryButtonNormal_click"},
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
                                                                        "id":"normalRemainCount",
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
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_LotteryPanel_RoundedLabel2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "-152";
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
                                                                        "id":"_LotteryPanel_RoundedLabel3",
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
                                                                        "id":"linkNormal",
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
                                                "id":"vipLottery",
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
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_10"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LotteryItemSlot,
                                                                                    "id":"slot2_11"
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"lotteryButtonVip",
                                                                        "events":{"click":"__lotteryButtonVip_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnLottery",
                                                                                "x":160,
                                                                                "y":145
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"lotteryButtonAll",
                                                                        "events":{"click":"__lotteryButtonAll_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":360,
                                                                                "y":400,
                                                                                "clickDelay":3000,
                                                                                "styleName":"CrystalYellowButton"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedLabel,
                                                                        "id":"vipRemainCount",
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
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_LotteryPanel_RoundedLabel5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "-110";
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
                                                                        "id":"_LotteryPanel_RoundedLabel6",
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
                                            })]});
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        public var highestAwardArrVIP:Array = new Array();
        public var highestAwardArrNormal:Array = new Array();
        private var _core:Core = Core.getInstance();
        private var lotteryAward:Object = new Object();
        private var _arr1:Array = new Array();
        private var _arr2:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LotteryPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 530;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___LotteryPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LotteryPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get idTabCanvas2():BasicGlowButton
        {
            return (this._277229568idTabCanvas2);
        }

        [Bindable(event="propertyChange")]
        public function get idTabCanvas0():BasicGlowButton
        {
            return (this._277229570idTabCanvas0);
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

        public function set slot1_5(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294103slot1_5;
            if (_local_2 !== _arg_1)
            {
                this._2113294103slot1_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_5", _local_2, _arg_1));
            };
        }

        protected function start1(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:int;
            if (!_arg_1)
            {
                lotteryButtonNormal.enabled = true;
                return;
            };
            var _local_2:Number = _arg_1.val;
            chanceCount = _arg_1.ticketnum;
            normalRemainCount.text = (Language.LOTTERYPANEL_U[8] + chanceCount);
            for (_local_3 in _arr1)
            {
                if (ToolKit.isEqual(_arr1[_local_3], _local_2))
                {
                    _local_2 = _local_3;
                    break;
                };
            };
            if (_local_2 >= 0)
            {
                _local_4 = 0;
                while (_local_4 < 12)
                {
                    this[("slot1_" + _local_4)].change(false);
                    _local_4++;
                };
                isDeleay = false;
                rungroup = 0;
                doCount++;
                currentPix1 = _local_2;
                runNum1 = (Math.round((Math.random() * 2)) + 2);
                if (((timer) && (timer.running)))
                {
                    timer.removeEventListener(TimerEvent.TIMER, onTimer1);
                    timer.stop();
                    timer = null;
                };
                timer = new Timer(100);
                timer.addEventListener(TimerEvent.TIMER, onTimer1);
                timer.start();
            };
        }

        protected function start2(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:int;
            if (!_arg_1)
            {
                lotteryButtonVip.enabled = true;
                return;
            };
            var _local_2:Number = _arg_1.val;
            chanceCount = _arg_1.ticketnum;
            vipRemainCount.text = (Language.LOTTERYPANEL_U[8] + chanceCount);
            for (_local_3 in _arr2)
            {
                if (ToolKit.isEqual(_arr2[_local_3], _local_2))
                {
                    _local_2 = _local_3;
                    break;
                };
            };
            if (_local_2 >= 0)
            {
                _local_4 = 0;
                while (_local_4 < 12)
                {
                    this[("slot2_" + _local_4)].change(false);
                    _local_4++;
                };
                isDeleay1 = false;
                rungroup1 = 0;
                doCount++;
                currentPix2 = _local_2;
                runNum2 = (Math.round((Math.random() * 2)) + 2);
                if (((timer1) && (timer1.running)))
                {
                    timer1.removeEventListener(TimerEvent.TIMER, onTimer2);
                    timer1.stop();
                    timer1 = null;
                };
                timer1 = new Timer(100);
                timer1.addEventListener(TimerEvent.TIMER, onTimer2);
                timer1.start();
            };
        }

        protected function start3(_arg_1:Object):void
        {
            var _local_4:*;
            var _local_2:int;
            while (_local_2 < 12)
            {
                this[("slot2_" + _local_2)].change(false);
                _local_2++;
            };
            if (!_arg_1)
            {
                lotteryButtonAll.enabled = true;
                return;
            };
            var _local_3:Number = _arg_1.val;
            chanceCount = _arg_1.ticketnum;
            vipRemainCount.text = (Language.LOTTERYPANEL_U[8] + chanceCount);
            normalRemainCount.text = (Language.LOTTERYPANEL_U[8] + chanceCount);
            lotteryButtonAll.enabled = true;
            for (_local_4 in _arr2)
            {
                if (ToolKit.isEqual(_arr2[_local_4], _local_3))
                {
                    _local_3 = _local_4;
                    break;
                };
            };
            this[("slot2_" + _local_3)].change(true);
        }

        public function set slot1_9(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294099slot1_9;
            if (_local_2 !== _arg_1)
            {
                this._2113294099slot1_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get normalTile():RoundCanvas
        {
            return (this._1255688139normalTile);
        }

        [Bindable(event="propertyChange")]
        private function get chanceCount():int
        {
            return (this._935514565chanceCount);
        }

        [Bindable(event="propertyChange")]
        public function get lotteryButtonVip():Button
        {
            return (this._783159742lotteryButtonVip);
        }

        protected function onTimer1(_arg_1:TimerEvent):void
        {
            if (index1 < 0)
            {
                index1 = 11;
                rungroup++;
            };
            isStart = true;
            if (isDeleay)
            {
                timer.delay = (timer.delay + 50);
            }
            else
            {
                if (((rungroup > runNum1) && (currentPix1 == index1)))
                {
                    isDeleay = true;
                };
            };
            this[("slot1_" + index1)].change(true);
            if (timer.delay > 400)
            {
                if (index1 == currentPix1)
                {
                    if (((timer) && (timer.running)))
                    {
                        timer.stop();
                        timer.removeEventListener(TimerEvent.TIMER, onTimer1);
                        timer = null;
                    };
                    lotteryButtonNormal.enabled = true;
                    this[("slot1_" + ((index1 + 1) % 12))].change(false);
                    this[("slot1_" + index1)].change(true);
                    _core.remote.call("lotteryResultBoast", null, 1);
                    isStart = false;
                    lotteryButtonNormal.enabled = true;
                    index1 = 0;
                    isStart = false;
                    isDeleay = false;
                    rungroup = 0;
                    doCount = 0;
                    currentPix1 = -1;
                    return;
                };
            };
            this[("slot1_" + ((index1 + 1) % 12))].change(false);
            if (isStart)
            {
                this[("slot1_" + index1)].change(true);
            };
            index1--;
        }

        protected function onTimer2(_arg_1:TimerEvent):void
        {
            if (index2 < 0)
            {
                index2 = 11;
                rungroup1++;
            };
            isStart1 = true;
            if (isDeleay1)
            {
                timer1.delay = (timer1.delay + 50);
            }
            else
            {
                if (((rungroup1 > runNum2) && (currentPix2 == index2)))
                {
                    isDeleay1 = true;
                };
            };
            this[("slot2_" + index2)].change(true);
            if (timer1.delay > 400)
            {
                if (index2 == currentPix2)
                {
                    if (((timer1) && (timer1.running)))
                    {
                        timer1.stop();
                        timer1.removeEventListener(TimerEvent.TIMER, onTimer2);
                        timer1 = null;
                    };
                    this[("slot2_" + ((index2 + 1) % 12))].change(false);
                    this[("slot2_" + index2)].change(true);
                    _core.remote.call("lotteryResultBoast", null, 2);
                    isStart1 = false;
                    lotteryButtonVip.enabled = true;
                    index2 = 0;
                    isStart1 = false;
                    isDeleay1 = false;
                    rungroup1 = 0;
                    doCount = 0;
                    currentPix2 = -1;
                    return;
                };
            };
            this[("slot2_" + ((index2 + 1) % 12))].change(false);
            if (isStart1)
            {
                this[("slot2_" + index2)].change(true);
            };
            index2--;
        }

        [Bindable(event="propertyChange")]
        public function get slot2_10():LotteryItemSlot
        {
            return (this._1087578038slot2_10);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_11():LotteryItemSlot
        {
            return (this._1087578037slot2_11);
        }

        [Bindable(event="propertyChange")]
        public function get normalLottery():Canvas
        {
            return (this._1665552286normalLottery);
        }

        public function onVipClick():void
        {
            var _local_1:*;
            if (((!(_core.player.pmLevel)) || (ToolKit.isSmallOrEqual(_core.player.pmLevel, 0))))
            {
                _core.sysMidNote(Language.LOTTERYPANEL_U[6]);
                return;
            };
            if (ToolKit.isSmallOrEqual(ToolKit.minus(new Date().time, _click), 1500))
            {
                return;
            };
            _click = new Date().time;
            chanceCount = _core.getItemNum(ITEM_TYPE, TICKET_ID).num;
            if (chanceCount >= 10)
            {
                lotteryButtonVip.enabled = false;
                _local_1 = {
                    "type":1,
                    "num":chanceCount
                };
                _core.remote.call("lotteryByClient", new Responder(start2), _local_1);
            }
            else
            {
                lotteryButtonVip.enabled = true;
                _core.sysMidNote(Language.LOTTERYPANEL_U[1]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get vipTile():RoundCanvas
        {
            return (this._463353963vipTile);
        }

        public function __idTabCanvas2_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_LOTTERY_BAG);
        }

        public function set normalTile(_arg_1:RoundCanvas):void
        {
            var _local_2:Object = this._1255688139normalTile;
            if (_local_2 !== _arg_1)
            {
                this._1255688139normalTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "normalTile", _local_2, _arg_1));
            };
        }

        private function set chanceCount(_arg_1:int):void
        {
            var _local_2:Object = this._935514565chanceCount;
            if (_local_2 !== _arg_1)
            {
                this._935514565chanceCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chanceCount", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vipLottery():Canvas
        {
            return (this._1422638188vipLottery);
        }

        public function cleanTimer(_arg_1:Number):void
        {
        }

        public function set lotteryButtonVip(_arg_1:Button):void
        {
            var _local_2:Object = this._783159742lotteryButtonVip;
            if (_local_2 !== _arg_1)
            {
                this._783159742lotteryButtonVip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lotteryButtonVip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get normalRemainCount():RoundedLabel
        {
            return (this._1185932956normalRemainCount);
        }

        public function set slot2_11(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._1087578037slot2_11;
            if (_local_2 !== _arg_1)
            {
                this._1087578037slot2_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lotteryButtonNormal():Button
        {
            return (this._1072846686lotteryButtonNormal);
        }

        public function set slot2_10(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._1087578038slot2_10;
            if (_local_2 !== _arg_1)
            {
                this._1087578038slot2_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_10", _local_2, _arg_1));
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
        public function get slot2_2():LotteryItemSlot
        {
            return (this._2113293145slot2_2);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_3():LotteryItemSlot
        {
            return (this._2113293144slot2_3);
        }

        [Bindable(event="propertyChange")]
        public function get slot2_4():LotteryItemSlot
        {
            return (this._2113293143slot2_4);
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
        public function get slot2_9():LotteryItemSlot
        {
            return (this._2113293138slot2_9);
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

        public function set normalLottery(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1665552286normalLottery;
            if (_local_2 !== _arg_1)
            {
                this._1665552286normalLottery = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "normalLottery", _local_2, _arg_1));
            };
        }

        private function toShowPanel(_arg_1:Event):void
        {
            removeEventListener(FlexEvent.CREATION_COMPLETE, toShowPanel);
            _core.remote.call("getLotteryData", new Responder(onGetLotteryData), null);
            showPanel();
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

        public function set vipLottery(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1422638188vipLottery;
            if (_local_2 !== _arg_1)
            {
                this._1422638188vipLottery = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipLottery", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1_0():LotteryItemSlot
        {
            return (this._2113294108slot1_0);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_1():LotteryItemSlot
        {
            return (this._2113294107slot1_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_3():LotteryItemSlot
        {
            return (this._2113294105slot1_3);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_5():LotteryItemSlot
        {
            return (this._2113294103slot1_5);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_7():LotteryItemSlot
        {
            return (this._2113294101slot1_7);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_8():LotteryItemSlot
        {
            return (this._2113294100slot1_8);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_4():LotteryItemSlot
        {
            return (this._2113294104slot1_4);
        }

        public function ___LotteryPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get slot1_9():LotteryItemSlot
        {
            return (this._2113294099slot1_9);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_2():LotteryItemSlot
        {
            return (this._2113294106slot1_2);
        }

        public function set linkNormal(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._695530881linkNormal;
            if (_local_2 !== _arg_1)
            {
                this._695530881linkNormal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "linkNormal", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            _core.remote.call("getLotteryData", new Responder(onGetLotteryData), null);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_6():LotteryItemSlot
        {
            return (this._2113294102slot1_6);
        }

        public function onGetLotteryData(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:*;
            var _local_4:*;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:Number;
            if (_arg_1)
            {
                this.visible = true;
                chanceCount = _arg_1.chanceCount;
                normalRemainCount.text = (Language.LOTTERYPANEL_U[8] + chanceCount);
                vipRemainCount.text = (Language.LOTTERYPANEL_U[8] + chanceCount);
                lotteryAward = new Object();
                lotteryAward = _arg_1.lotteryAward;
                highestAwardArrVIP = new Array();
                highestAwardArrVIP = _arg_1.highestAwardArrLotteryVip;
                highestAwardArrNormal = new Array();
                highestAwardArrNormal = _arg_1.highestAwardArrLotteryNormal;
                _local_2 = 1;
                while (_local_2 <= 2)
                {
                    if (_local_2 == 1)
                    {
                        _arr1 = new Array();
                    }
                    else
                    {
                        _arr2 = new Array();
                    };
                    _local_5 = 0;
                    while (_local_5 < 12)
                    {
                        _local_6 = _core.data.gameData[GamePredef.TBL_PLAN][lotteryAward[(_local_2 - 1)][_local_5]];
                        if (_local_6)
                        {
                            if (_local_2 == 1)
                            {
                                _arr1.push(lotteryAward[(_local_2 - 1)][_local_5]);
                            }
                            else
                            {
                                _arr2.push(lotteryAward[(_local_2 - 1)][_local_5]);
                            };
                            this[((("slot" + _local_2) + "_") + _local_5)]["awardSlot"].type = _local_6.ti;
                            this[((("slot" + _local_2) + "_") + _local_5)]["awardSlot"].giid = _local_6.ii;
                            this[((("slot" + _local_2) + "_") + _local_5)]["awardSlot"].stackNum = _local_6.n;
                            this[((("slot" + _local_2) + "_") + _local_5)]["awardSlot"].slotData = _local_6;
                            _local_7 = _core.data.getGameData(_local_6.ti, _local_6.ii);
                            if (_local_7)
                            {
                                if (_local_7.color)
                                {
                                    this[((("slot" + _local_2) + "_") + _local_5)]["awardSlot"].setStyleName(_local_7.color);
                                }
                                else
                                {
                                    if (_local_6.ti == GamePredef.TBL_CREATURE)
                                    {
                                        this[((("slot" + _local_2) + "_") + _local_5)]["awardSlot"].setStyleName(_core.basic.colorByGrowRate(_local_6.q));
                                    };
                                };
                            };
                        };
                        _local_5++;
                    };
                    _local_2++;
                };
                if (linkNormal)
                {
                    linkNormal.htmlText = "";
                };
                if (linkVip)
                {
                    linkVip.htmlText = "";
                };
                _local_3 = ((highestAwardArrVIP) ? highestAwardArrVIP.length : 0);
                if (ToolKit.isBigThan(_local_3, 0))
                {
                    _local_8 = ToolKit.minus(_local_3, 1);
                    while (_local_8 >= 0)
                    {
                        _local_9 = highestAwardArrVIP[_local_8];
                        superLotteryShow(_local_9, 2);
                        _local_8--;
                    };
                };
                _local_4 = ((highestAwardArrNormal) ? highestAwardArrNormal.length : 0);
                if (ToolKit.isBigThan(_local_4, 0))
                {
                    _local_10 = ToolKit.minus(_local_4, 1);
                    while (_local_10 >= 0)
                    {
                        _local_9 = highestAwardArrNormal[_local_10];
                        superLotteryShow(_local_9, 1);
                        _local_10--;
                    };
                };
            };
        }

        public function __lotteryButtonVip_click(_arg_1:MouseEvent):void
        {
            onVipClick();
        }

        public function __idTabCanvas1_click(_arg_1:MouseEvent):void
        {
            setTab(1);
        }

        public function set normalRemainCount(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1185932956normalRemainCount;
            if (_local_2 !== _arg_1)
            {
                this._1185932956normalRemainCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "normalRemainCount", _local_2, _arg_1));
            };
        }

        private function _LotteryPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_LotteryPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas0.label = _arg_1;
            }, "idTabCanvas0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas1.label = _arg_1;
            }, "idTabCanvas1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                idTabCanvas2.label = _arg_1;
            }, "idTabCanvas2.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(3130090000055)));
            }, function (_arg_1:Object):void
            {
                normalTile.setStyle("backgroundImage", _arg_1);
            }, "normalTile.backgroundImage");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.LOTTERYPANEL_U[8] + chanceCount);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                normalRemainCount.text = _arg_1;
            }, "normalRemainCount.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryPanel_RoundedLabel2.text = _arg_1;
            }, "_LotteryPanel_RoundedLabel2.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryPanel_RoundedLabel3.text = _arg_1;
            }, "_LotteryPanel_RoundedLabel3.text");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.hash(ResManager.getIconUrlNoHash(3130090000055)));
            }, function (_arg_1:Object):void
            {
                vipTile.setStyle("backgroundImage", _arg_1);
            }, "vipTile.backgroundImage");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                lotteryButtonAll.filters = _arg_1;
            }, "lotteryButtonAll.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lotteryButtonAll.label = _arg_1;
            }, "lotteryButtonAll.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.LOTTERYPANEL_U[8] + chanceCount);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vipRemainCount.text = _arg_1;
            }, "vipRemainCount.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.LOTTERYPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryPanel_RoundedLabel5.text = _arg_1;
            }, "_LotteryPanel_RoundedLabel5.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.VIPSHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LotteryPanel_RoundedLabel6.text = _arg_1;
            }, "_LotteryPanel_RoundedLabel6.text");
            result[13] = binding;
            return (result);
        }

        public function set lotteryButtonNormal(_arg_1:Button):void
        {
            var _local_2:Object = this._1072846686lotteryButtonNormal;
            if (_local_2 !== _arg_1)
            {
                this._1072846686lotteryButtonNormal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lotteryButtonNormal", _local_2, _arg_1));
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

        public function set vipRemainCount(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1332272550vipRemainCount;
            if (_local_2 !== _arg_1)
            {
                this._1332272550vipRemainCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vipRemainCount", _local_2, _arg_1));
            };
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

        public function set slot2_5(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293142slot2_5;
            if (_local_2 !== _arg_1)
            {
                this._2113293142slot2_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_5", _local_2, _arg_1));
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

        public function set slot2_7(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113293140slot2_7;
            if (_local_2 !== _arg_1)
            {
                this._2113293140slot2_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2_7", _local_2, _arg_1));
            };
        }

        public function superLotteryShow(_arg_1:Object, _arg_2:int):void
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
            if (((_arg_1.p) && (_arg_1.p > 10)))
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
                _local_3 = Language.NOTICE_INFO[70];
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
                if (_arg_2 == 1)
                {
                    if (linkNormal)
                    {
                        linkNormal.htmlText = (linkNormal.htmlText + _local_5);
                    };
                }
                else
                {
                    if (_arg_2 == 2)
                    {
                        if (linkVip)
                        {
                            linkVip.htmlText = (linkVip.htmlText + _local_5);
                        };
                    };
                };
            };
        }

        public function onAllClick():void
        {
            var _local_1:*;
            if (((!(_core.player.pmLevel)) || (ToolKit.isSmallOrEqual(_core.player.pmLevel, 0))))
            {
                _core.sysMidNote(Language.LOTTERYPANEL_U[6]);
                return;
            };
            if (ToolKit.isSmallOrEqual(ToolKit.minus(new Date().time, _click), 1500))
            {
                return;
            };
            _click = new Date().time;
            if (((timer1) && (timer1.running)))
            {
                _core.sysMidNote(Language.LOTTERYPANEL_U[7]);
                return;
            };
            chanceCount = _core.getItemNum(ITEM_TYPE, TICKET_ID).num;
            if (chanceCount >= 10)
            {
                _local_1 = {
                    "type":2,
                    "num":chanceCount
                };
                _core.remote.call("lotteryByClient", new Responder(start3), _local_1);
            }
            else
            {
                _core.sysMidNote(Language.LOTTERYPANEL_U[1]);
            };
            lotteryButtonAll.enabled = false;
        }

        public function superLotteryMidSay(_arg_1:Object):void
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
            _local_2 = Language.LOTTERYPANEL_U[2];
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

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        private function _LotteryPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.LOTTERYPANEL_U[0];
            _local_1 = Language.LOTTERYPANEL_U[0];
            _local_1 = Language.LOTTERYPANEL_U[3];
            _local_1 = Language.LOTTERYPANEL_U[4];
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(3130090000055));
            _local_1 = (Language.LOTTERYPANEL_U[8] + chanceCount);
            _local_1 = Language.LOTTERYPANEL_U[9];
            _local_1 = Language.VIPSHOPPANEL_U[3];
            _local_1 = ResManager.hash(ResManager.getIconUrlNoHash(3130090000055));
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.LOTTERYPANEL_U[5];
            _local_1 = (Language.LOTTERYPANEL_U[8] + chanceCount);
            _local_1 = Language.LOTTERYPANEL_U[10];
            _local_1 = Language.VIPSHOPPANEL_U[3];
        }

        [Bindable(event="propertyChange")]
        public function get linkNormal():LinkTextArea
        {
            return (this._695530881linkNormal);
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

        public function onNormalClick():void
        {
            var _local_1:*;
            if (ToolKit.isSmallOrEqual(ToolKit.minus(new Date().time, _click), 1500))
            {
                return;
            };
            _click = new Date().time;
            chanceCount = _core.getItemNum(ITEM_TYPE, TICKET_ID).num;
            if (chanceCount > 0)
            {
                lotteryButtonNormal.enabled = false;
                _local_1 = {
                    "type":0,
                    "num":chanceCount
                };
                _core.remote.call("lotteryByClient", new Responder(start1), _local_1);
            }
            else
            {
                _core.sysMidNote(Language.LOTTERYPANEL_U[1]);
                lotteryButtonNormal.enabled = true;
            };
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
                _local_2 = Language.NOTICE_INFO[70].toString().replace("※", "");
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
            var target:LotteryPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LotteryPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_LotteryPanelWatcherSetupUtil");
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

        public function showLotteryBlueMsg(_arg_1:String):void
        {
            if (linkNormal != null)
            {
                linkNormal.htmlText = _arg_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get vipRemainCount():RoundedLabel
        {
            return (this._1332272550vipRemainCount);
        }

        public function __lotteryButtonAll_click(_arg_1:MouseEvent):void
        {
            onAllClick();
        }

        [Bindable(event="propertyChange")]
        public function get linkVip():LinkTextArea
        {
            return (this._177071555linkVip);
        }

        [Bindable(event="propertyChange")]
        public function get lotteryButtonAll():DelayButton
        {
            return (this._783179834lotteryButtonAll);
        }

        public function set slot1_0(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294108slot1_0;
            if (_local_2 !== _arg_1)
            {
                this._2113294108slot1_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_0", _local_2, _arg_1));
            };
        }

        public function set slot1_1(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294107slot1_1;
            if (_local_2 !== _arg_1)
            {
                this._2113294107slot1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_1", _local_2, _arg_1));
            };
        }

        public function __lotteryButtonNormal_click(_arg_1:MouseEvent):void
        {
            onNormalClick();
        }

        public function set slot1_3(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294105slot1_3;
            if (_local_2 !== _arg_1)
            {
                this._2113294105slot1_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_3", _local_2, _arg_1));
            };
        }

        public function set lotteryButtonAll(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._783179834lotteryButtonAll;
            if (_local_2 !== _arg_1)
            {
                this._783179834lotteryButtonAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lotteryButtonAll", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
        }

        public function set slot1_4(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294104slot1_4;
            if (_local_2 !== _arg_1)
            {
                this._2113294104slot1_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_4", _local_2, _arg_1));
            };
        }

        public function setTab(_arg_1:int):void
        {
            chanceCount = _core.getItemNum(ITEM_TYPE, TICKET_ID).num;
            cleanTimer(_arg_1);
            vs.selectedIndex = _arg_1;
            var _local_2:int = 2;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("idTabCanvas" + _local_3)].selected = false;
                _local_3++;
            };
            this[("idTabCanvas" + _arg_1)].selected = true;
            if (_arg_1 == 0)
            {
                vs.selectedChild = normalLottery;
            }
            else
            {
                if (_arg_1 == 1)
                {
                    vs.selectedChild = vipLottery;
                };
            };
        }

        public function set slot1_2(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294106slot1_2;
            if (_local_2 !== _arg_1)
            {
                this._2113294106slot1_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_2", _local_2, _arg_1));
            };
        }

        public function set slot1_11(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._1087607828slot1_11;
            if (_local_2 !== _arg_1)
            {
                this._1087607828slot1_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_11", _local_2, _arg_1));
            };
        }

        public function set slot1_6(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294102slot1_6;
            if (_local_2 !== _arg_1)
            {
                this._2113294102slot1_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_6", _local_2, _arg_1));
            };
        }

        public function set slot1_10(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._1087607829slot1_10;
            if (_local_2 !== _arg_1)
            {
                this._1087607829slot1_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_10", _local_2, _arg_1));
            };
        }

        public function __idTabCanvas0_click(_arg_1:MouseEvent):void
        {
            setTab(0);
        }

        public function set slot1_7(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294101slot1_7;
            if (_local_2 !== _arg_1)
            {
                this._2113294101slot1_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_7", _local_2, _arg_1));
            };
        }

        public function set slot1_8(_arg_1:LotteryItemSlot):void
        {
            var _local_2:Object = this._2113294100slot1_8;
            if (_local_2 !== _arg_1)
            {
                this._2113294100slot1_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1_8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1_10():LotteryItemSlot
        {
            return (this._1087607829slot1_10);
        }

        [Bindable(event="propertyChange")]
        public function get slot1_11():LotteryItemSlot
        {
            return (this._1087607828slot1_11);
        }

        public function set idTabCanvas0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._277229570idTabCanvas0;
            if (_local_2 !== _arg_1)
            {
                this._277229570idTabCanvas0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTabCanvas0", _local_2, _arg_1));
            };
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

