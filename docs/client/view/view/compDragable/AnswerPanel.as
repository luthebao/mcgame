// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AnswerPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.CheckBox;
    import flash.utils.Timer;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.net.Responder;
    import flash.events.Event;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class AnswerPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var answerData:Object;
        public var _AnswerPanel_BoxLabel2:BoxLabel;
        private var _110364486times:int = 0;
        public var _AnswerPanel_BoxLabel1:BoxLabel;
        private var _3237038info:Label;
        public var _AnswerPanel_BasicTxtButton1:BasicTxtButton;
        public var _AnswerPanel_BasicTxtButton2:BasicTxtButton;
        public var _AnswerPanel_BasicTxtButton3:BasicTxtButton;
        private var firstTimeFlag:Boolean = true;
        private var _3526471sela:LinkButton;
        private var _321971910answerTitle:IntroText;
        private var _3526473selc:LinkButton;
        private var _3526474seld:LinkButton;
        private var _3526472selb:LinkButton;
        private var _2033767917refreshButton:BasicGlowButton;
        public var _AnswerPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _94627080check:CheckBox;
        private var _3560141time:Label;
        private var _332375386moneyNum:int = 0;
        private var ansTimer:Timer;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":295,
                    "height":376,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AnswerPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":IntroText,
                        "id":"answerTitle",
                        "events":{"mouseDown":"__answerTitle_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "height":90
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":140,
                                "height":125,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"sela",
                                    "events":{"click":"__sela_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":14});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"selb",
                                    "events":{"click":"__selb_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":42});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"selc",
                                    "events":{"click":"__selc_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":70});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"seld",
                                    "events":{"click":"__seld_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":98});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"time",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 14363149;
                                        this.fontSize = 20;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":11
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"_AnswerPanel_BoxLabel1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":115,
                                "y":300,
                                "width":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"check",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":169,
                                "y":300,
                                "width":102.850006,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"info",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":275});
                        }
                    }), new UIComponentDescriptor({
                        "type":BoxLabel,
                        "id":"_AnswerPanel_BoxLabel2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":115,
                                "y":330,
                                "width":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_AnswerPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":300,
                                "width":105,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_AnswerPanel_BasicTxtButton2",
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 0;
                            this.paddingRight = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":188,
                                "y":300,
                                "width":90,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_AnswerPanel_BasicTxtButton3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":8,
                                "y":330,
                                "width":105,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"refreshButton",
                        "events":{"click":"__refreshButton_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":188,
                                "styleName":"BtnStdRed",
                                "y":328,
                                "width":65
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

        public function AnswerPanel()
        {
            mx_internal::_document = this;
            this.width = 295;
            this.height = 376;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AnswerPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get answerTitle():IntroText
        {
            return (this._321971910answerTitle);
        }

        public function __selc_click(_arg_1:MouseEvent):void
        {
            selAnswer("C");
        }

        public function set selb(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526472selb;
            if (_local_2 !== _arg_1)
            {
                this._3526472selb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selb", _local_2, _arg_1));
            };
        }

        public function set refreshButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2033767917refreshButton;
            if (_local_2 !== _arg_1)
            {
                this._2033767917refreshButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshButton", _local_2, _arg_1));
            };
        }

        private function set times(_arg_1:int):void
        {
            var _local_2:Object = this._110364486times;
            if (_local_2 !== _arg_1)
            {
                this._110364486times = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "times", _local_2, _arg_1));
            };
        }

        private function updateView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            viewClear();
            if (answerData)
            {
                info.text = Language.ANSWERPANEL_S[2];
                refreshButton.enabled = true;
                ansTimer = new Timer(1000, 15);
                ansTimer.addEventListener(TimerEvent.TIMER, timeReduce);
                ansTimer.addEventListener(TimerEvent.TIMER_COMPLETE, timeOver);
                ansTimer.start();
                answerTitle.text = answerData.t;
                sela.label = answerData.a;
                selb.label = answerData.b;
                selc.label = answerData.c;
                seld.label = answerData.d;
                answerTitle.visible = true;
                sela.visible = true;
                selb.visible = true;
                selc.visible = true;
                seld.visible = true;
                time.text = "15";
                time.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get check():CheckBox
        {
            return (this._94627080check);
        }

        private function timeReduce(_arg_1:TimerEvent):void
        {
            time.text = (15 - ansTimer.currentCount).toString();
        }

        public function onGetAnswer(_arg_1:Object):void
        {
            visible = true;
            if (_arg_1)
            {
                if (_arg_1.f == 1)
                {
                    answerData = _arg_1.d;
                    times = _arg_1.n;
                    updateView();
                }
                else
                {
                    if (_arg_1.f == 2)
                    {
                        answerData = null;
                        times = _arg_1.n;
                        viewClear();
                        info.text = Language.ANSWERPANEL_S[0];
                        refreshButton.enabled = true;
                    }
                    else
                    {
                        if (_arg_1.f == 3)
                        {
                            answerData = null;
                            times = _arg_1.n;
                            viewClear();
                            info.text = Language.ANSWERPANEL_S[1];
                            refreshButton.enabled = false;
                        };
                    };
                };
                if ((times + 1) <= 20)
                {
                    moneyNum = 0;
                }
                else
                {
                    moneyNum = Math.round(((GamePredef.BASIC_GET_MONEY[_core.player.level] * GamePredef.ANSWER_MONEY_NUM) * Math.ceil((((times + 1) - 20) / 10))));
                };
            };
        }

        private function onSelAnswer(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 1:
                    viewClear();
                    info.text = Language.ANSWERPANEL_S[6];
                    return;
                case 2:
                    viewClear();
                    info.text = Language.ANSWERPANEL_S[7];
                    return;
                case 3:
                    viewClear();
                    info.text = Language.ANSWERPANEL_S[8];
                    return;
                case 4:
                    viewClear();
                    info.text = Language.ANSWERPANEL_S[9];
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get refreshButton():BasicGlowButton
        {
            return (this._2033767917refreshButton);
        }

        public function set sela(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526471sela;
            if (_local_2 !== _arg_1)
            {
                this._3526471sela = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sela", _local_2, _arg_1));
            };
        }

        public function set seld(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526474seld;
            if (_local_2 !== _arg_1)
            {
                this._3526474seld = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "seld", _local_2, _arg_1));
            };
        }

        public function set selc(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._3526473selc;
            if (_local_2 !== _arg_1)
            {
                this._3526473selc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get moneyNum():int
        {
            return (this._332375386moneyNum);
        }

        private function viewClear():void
        {
            if (ansTimer)
            {
                ansTimer.stop();
                ansTimer.removeEventListener(TimerEvent.TIMER, timeReduce);
                ansTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, timeOver);
            };
            answerTitle.visible = false;
            sela.visible = false;
            selb.visible = false;
            selc.visible = false;
            seld.visible = false;
            time.visible = false;
        }

        override public function initialize():void
        {
            var target:AnswerPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AnswerPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AnswerPanelWatcherSetupUtil");
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
        public function get info():Label
        {
            return (this._3237038info);
        }

        private function selAnswer(_arg_1:String):void
        {
            if (((times <= GamePredef.MAX_ANSWER) && (answerData)))
            {
                _core.remote.call("selAnswer", new Responder(onSelAnswer), _arg_1);
            };
        }

        public function __seld_click(_arg_1:MouseEvent):void
        {
            selAnswer("D");
        }

        public function set time(_arg_1:Label):void
        {
            var _local_2:Object = this._3560141time;
            if (_local_2 !== _arg_1)
            {
                this._3560141time = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "time", _local_2, _arg_1));
            };
        }

        public function set check(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._94627080check;
            if (_local_2 !== _arg_1)
            {
                this._94627080check = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "check", _local_2, _arg_1));
            };
        }

        private function set moneyNum(_arg_1:int):void
        {
            var _local_2:Object = this._332375386moneyNum;
            if (_local_2 !== _arg_1)
            {
                this._332375386moneyNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyNum", _local_2, _arg_1));
            };
        }

        private function timeOver(_arg_1:Event):void
        {
            info.text = Language.ANSWERPANEL_S[10];
            viewClear();
            answerData = null;
            ansTimer.removeEventListener(TimerEvent.TIMER, timeReduce);
            ansTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, timeOver);
        }

        [Bindable(event="propertyChange")]
        private function get times():int
        {
            return (this._110364486times);
        }

        [Bindable(event="propertyChange")]
        public function get sela():LinkButton
        {
            return (this._3526471sela);
        }

        [Bindable(event="propertyChange")]
        public function get selb():LinkButton
        {
            return (this._3526472selb);
        }

        [Bindable(event="propertyChange")]
        public function get time():Label
        {
            return (this._3560141time);
        }

        public function reset():void
        {
            firstTimeFlag = true;
        }

        [Bindable(event="propertyChange")]
        public function get selc():LinkButton
        {
            return (this._3526473selc);
        }

        public function __selb_click(_arg_1:MouseEvent):void
        {
            selAnswer("B");
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            updateView();
        }

        public function __refreshButton_click(_arg_1:MouseEvent):void
        {
            refresh();
        }

        private function _AnswerPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANSWERPANEL_U[1];
            _local_1 = moneyNum.toString();
            _local_1 = times.toString();
            _local_1 = Language.ANSWERPANEL_U[2];
            _local_1 = Language.ANSWERPANEL_U[3];
            _local_1 = Language.ANSWERPANEL_U[4];
            _local_1 = Language.ANSWERPANEL_U[0];
        }

        public function __answerTitle_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function refresh():void
        {
            var _local_1:* = "";
            if (times >= GamePredef.MAX_ANSWER)
            {
                return;
            };
            if (_core.player.money >= moneyNum)
            {
                if (times >= GamePredef.FREE_ANSWER)
                {
                    if (check.selected)
                    {
                        _core.remote.getAnswerByMoney();
                    }
                    else
                    {
                        _local_1 = Language.ANSWERPANEL_S[3];
                        _local_1 = _local_1.replace("{moneyNum}", moneyNum);
                        Alert.show(_local_1, "", 3, this, getAnswerByMoney);
                    };
                }
                else
                {
                    _core.remote.getAnswer();
                };
            }
            else
            {
                _core.sysMsg(Language.ANSWERPANEL_S[5]);
            };
        }

        private function getAnswerByMoney(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                _core.remote.getAnswerByMoney();
            };
        }

        private function _AnswerPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANSWERPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnswerPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AnswerPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = moneyNum.toString();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnswerPanel_BoxLabel1.text = _arg_1;
            }, "_AnswerPanel_BoxLabel1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = times.toString();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnswerPanel_BoxLabel2.text = _arg_1;
            }, "_AnswerPanel_BoxLabel2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANSWERPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnswerPanel_BasicTxtButton1.label = _arg_1;
            }, "_AnswerPanel_BasicTxtButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANSWERPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnswerPanel_BasicTxtButton2.label = _arg_1;
            }, "_AnswerPanel_BasicTxtButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANSWERPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnswerPanel_BasicTxtButton3.label = _arg_1;
            }, "_AnswerPanel_BasicTxtButton3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANSWERPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshButton.label = _arg_1;
            }, "refreshButton.label");
            result[6] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get seld():LinkButton
        {
            return (this._3526474seld);
        }

        public function set info(_arg_1:Label):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
                firstTimeFlag = false;
            };
            if (!_arg_1)
            {
                viewClear();
            };
        }

        public function __sela_click(_arg_1:MouseEvent):void
        {
            selAnswer("A");
        }

        public function set answerTitle(_arg_1:IntroText):void
        {
            var _local_2:Object = this._321971910answerTitle;
            if (_local_2 !== _arg_1)
            {
                this._321971910answerTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "answerTitle", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

