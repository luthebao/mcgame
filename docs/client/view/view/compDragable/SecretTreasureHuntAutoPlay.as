// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SecretTreasureHuntAutoPlay

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import flash.utils.Timer;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.controls.NumericStepper;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TimerEvent;
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

    public class SecretTreasureHuntAutoPlay extends DragableCanvas implements IBindingClient 
    {

        private static var timer:Timer;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var autoStr:String = "";
        private var _1491390272myLotto:LinkTextArea;
        private var AutoPlay:Boolean = false;
        public var _SecretTreasureHuntAutoPlay_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2077607820timeLeft:Label;
        private var _646331561autoNum:NumericStepper;
        private var _647821723AutoLabel:Label;
        private var _530498876twoCanvas:Canvas;
        private var _91052262_left:String = "02:00";
        private var leftTime:Number = 120;
        private var loadCid:Number = 0;
        private var _1126312798oneCanvas:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":260,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SecretTreasureHuntAutoPlay_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"oneCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":240,
                                "height":116,
                                "y":44,
                                "x":10,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "text":"Auto："
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"autoNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "right";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":8,
                                            "minimum":1,
                                            "maximum":10000,
                                            "stepSize":1,
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":144,
                                            "y":10,
                                            "text":"Lần"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___SecretTreasureHuntAutoPlay_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":76.5,
                                            "y":84,
                                            "label":"Bắt đầu",
                                            "width":87,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"twoCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":240,
                                "height":116,
                                "y":44,
                                "x":10,
                                "styleName":"RoundedGradientBorder",
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 1190715;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":50,
                                            "width":100,
                                            "height":27,
                                            "styleName":"RoundedGradientBorder"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"timeLeft",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontFamily = "Arial";
                                        this.textAlign = "center";
                                        this.fontSize = 24;
                                        this.color = 0xFF6600;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":47,
                                            "width":100,
                                            "height":30
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___SecretTreasureHuntAutoPlay_Button2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":28,
                                            "y":85,
                                            "label":"Dừng",
                                            "width":79,
                                            "styleName":"BtnStdGreen",
                                            "height":21
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicDelayButton,
                                    "events":{"click":"___SecretTreasureHuntAutoPlay_BasicDelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "clickDelay":2000,
                                            "x":139,
                                            "y":85,
                                            "label":"Nhanh",
                                            "width":77,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"AutoLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":74.5,
                                            "y":10,
                                            "width":109
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":240,
                                "height":212,
                                "y":168,
                                "x":10,
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkTextArea,
                                    "id":"myLotto",
                                    "events":{"valueCommit":"__myLotto_valueCommit"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "5";
                                        this.top = "5";
                                        this.right = "5";
                                        this.bottom = "0";
                                        this.color = 0xFFD700;
                                        this.fontSize = 14;
                                        this.backgroundAlpha = 0;
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectable":false,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"auto"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var strArr:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SecretTreasureHuntAutoPlay()
        {
            mx_internal::_document = this;
            this.width = 260;
            this.height = 400;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SecretTreasureHuntAutoPlay._watcherSetupUtil = _arg_1;
        }


        public function set myLotto(_arg_1:LinkTextArea):void
        {
            var _local_2:Object = this._1491390272myLotto;
            if (_local_2 !== _arg_1)
            {
                this._1491390272myLotto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLotto", _local_2, _arg_1));
            };
        }

        public function showPanel():*
        {
            initView();
            visible = true;
            if (loadCid == 0)
            {
                loadCid = _core.cid;
            };
            if (loadCid != _core.cid)
            {
                loadCid = _core.cid;
                oneCanvas.visible = true;
                twoCanvas.visible = false;
            };
        }

        private function refreshTimeTxt():void
        {
            var _local_1:int;
            var _local_2:int;
            if (leftTime >= 60)
            {
                _local_1 = int(Math.floor((leftTime / 60)));
                _local_2 = (leftTime % 60);
            }
            else
            {
                if (leftTime > 0)
                {
                    _local_1 = 0;
                    _local_2 = leftTime;
                }
                else
                {
                    _local_1 = 0;
                    _local_2 = 0;
                };
            };
            var _local_3:* = "00";
            var _local_4:* = "00";
            if (_local_1 >= 0)
            {
                if (_local_1 <= 9)
                {
                    _local_3 = ("0" + _local_1);
                }
                else
                {
                    _local_3 = String(_local_1);
                };
            };
            if (_local_2 >= 0)
            {
                if (_local_2 <= 9)
                {
                    _local_4 = ("0" + _local_2);
                }
                else
                {
                    _local_4 = String(_local_2);
                };
            };
            _left = ((_local_3 + ":") + _local_4);
        }

        private function stopAutoPlayFunc():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
            oneCanvas.visible = true;
            twoCanvas.visible = false;
            strArr = [];
            _core.remote.call("stopAutoPlaySecretTreasureHunt", null);
        }

        public function set timeLeft(_arg_1:Label):void
        {
            var _local_2:Object = this._2077607820timeLeft;
            if (_local_2 !== _arg_1)
            {
                this._2077607820timeLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLeft", _local_2, _arg_1));
            };
        }

        public function set _AutoPlay(_arg_1:Boolean):void
        {
            AutoPlay = _arg_1;
            if (AutoPlay)
            {
                oneCanvas.visible = false;
                twoCanvas.visible = true;
            }
            else
            {
                oneCanvas.visible = true;
                twoCanvas.visible = false;
            };
        }

        public function set _autoStr(_arg_1:String):void
        {
            autoStr = _arg_1;
            AutoLabel.htmlText = autoStr;
        }

        public function set twoCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._530498876twoCanvas;
            if (_local_2 !== _arg_1)
            {
                this._530498876twoCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "twoCanvas", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:SecretTreasureHuntAutoPlay;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SecretTreasureHuntAutoPlay_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SecretTreasureHuntAutoPlayWatcherSetupUtil");
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

        private function lijiFinishFunc():void
        {
            _core.remote.call("getSecretTreasureHuntLiJiGold", null);
        }

        public function ___SecretTreasureHuntAutoPlay_Button1_click(_arg_1:MouseEvent):void
        {
            autoPlayFunc();
        }

        public function set _strShow(_arg_1:String):void
        {
            if (strArr.length >= 25)
            {
                strArr.splice(0, 1);
            };
            strArr.push(_arg_1);
            refreshText();
        }

        public function set _leftTime(_arg_1:Number):void
        {
            leftTime = _arg_1;
            refreshTime();
        }

        private function refreshText():void
        {
            var _local_1:* = "";
            var _local_2:int;
            while (_local_2 < strArr.length)
            {
                _local_1 = (_local_1 + strArr[_local_2]);
                _local_2++;
            };
            myLotto.htmlText = _local_1;
        }

        public function __myLotto_valueCommit(_arg_1:FlexEvent):void
        {
            myLotto.verticalScrollPosition = myLotto.maxVerticalScrollPosition;
        }

        private function _SecretTreasureHuntAutoPlay_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SEC_TREA_HUNT[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SecretTreasureHuntAutoPlay_BasicTitleCanvas1.text = _arg_1;
            }, "_SecretTreasureHuntAutoPlay_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _left;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                timeLeft.text = _arg_1;
            }, "timeLeft.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                timeLeft.filters = _arg_1;
            }, "timeLeft.filters");
            result[2] = binding;
            return (result);
        }

        public function set autoNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._646331561autoNum;
            if (_local_2 !== _arg_1)
            {
                this._646331561autoNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get oneCanvas():Canvas
        {
            return (this._1126312798oneCanvas);
        }

        public function set oneCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1126312798oneCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1126312798oneCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oneCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myLotto():LinkTextArea
        {
            return (this._1491390272myLotto);
        }

        [Bindable(event="propertyChange")]
        public function get twoCanvas():Canvas
        {
            return (this._530498876twoCanvas);
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            if (leftTime <= 0)
            {
                completeByTime();
                if (timer)
                {
                    timer.stop();
                };
                return;
            };
            leftTime--;
            refreshTimeTxt();
        }

        private function refreshTime():void
        {
            if (!timer)
            {
                timer = new Timer(1000);
            };
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            if (!timer.running)
            {
                timer.start();
            };
            refreshTimeTxt();
        }

        public function onLijiFinishFunc(goldNum:Number):void
        {
            var view:Object = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
            if (view)
            {
                if (view.getMoving())
                {
                    return;
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("AutoPlaySecretTreasureHuntLiJi", null);
                };
            };
            var tempStr:String = (("Xác nhận dùng" + goldNum) + " vàng để hoàn thành nhanh?");
            Alert.show(tempStr, "", (Alert.YES | Alert.NO), null, func);
        }

        private function set _left(_arg_1:String):void
        {
            var _local_2:Object = this._91052262_left;
            if (_local_2 !== _arg_1)
            {
                this._91052262_left = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_left", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get autoNum():NumericStepper
        {
            return (this._646331561autoNum);
        }

        public function set AutoLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._647821723AutoLabel;
            if (_local_2 !== _arg_1)
            {
                this._647821723AutoLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "AutoLabel", _local_2, _arg_1));
            };
        }

        private function completeByTime():void
        {
            _core.remote.call("autoSecretTeasureHuntComplete", null);
        }

        public function ___SecretTreasureHuntAutoPlay_Button2_click(_arg_1:MouseEvent):void
        {
            stopAutoPlayFunc();
        }

        private function _SecretTreasureHuntAutoPlay_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SEC_TREA_HUNT[0];
            _local_1 = _left;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get AutoLabel():Label
        {
            return (this._647821723AutoLabel);
        }

        [Bindable(event="propertyChange")]
        private function get _left():String
        {
            return (this._91052262_left);
        }

        private function autoPlayFunc():void
        {
            var _local_1:Object;
            _local_1 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
            if (_local_1)
            {
                if (!_local_1.getCanplay())
                {
                    _core.sysMidNote("Phải ở trạng thái bình thường mới bắt đầu tầm bảo");
                    return;
                };
            };
            if (autoNum.value <= 0)
            {
                return;
            };
            if ((autoNum.value - Math.floor(autoNum.value)) != 0)
            {
                return;
            };
            _local_1 = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
            var _local_2:int = _local_1.getPTSZNum();
            if (autoNum.value > _local_2)
            {
                _core.sysMidNote(Language.SEC_TREA_HUNT[15]);
                return;
            };
            _local_1.setAllAutoNum(autoNum.value);
            AutoLabel.htmlText = ((("Đang tự động tầm bảo " + autoNum.value) + "/") + autoNum.value);
            oneCanvas.visible = false;
            twoCanvas.visible = true;
            leftTime = 120;
            strArr = [];
            refreshText();
            refreshTime();
            _core.remote.call("autoPlaySecretTreasureHunt", null, autoNum.value);
        }

        public function ___SecretTreasureHuntAutoPlay_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            lijiFinishFunc();
        }

        [Bindable(event="propertyChange")]
        public function get timeLeft():Label
        {
            return (this._2077607820timeLeft);
        }


    }
}//package com.qeedoo.ui.view.compDragable

