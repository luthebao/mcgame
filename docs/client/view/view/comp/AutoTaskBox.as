// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AutoTaskBox

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import flash.utils.Timer;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.Label;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.view.compDragable.BagPanel;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.DropdownEvent;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
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

    public class AutoTaskBox extends Canvas implements IBindingClient 
    {

        private static var timer:Timer;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _97823bt1:Button;
        public var _AutoTaskBox_Label1:Label;
        public var state:int = 0;
        private var registed:Boolean = false;
        public var tid:int = 0;
        private var _97822bt0:Button;
        public var _AutoTaskBox_Label3:Label;
        public var _diffCombox:Array;
        private var _97825bt3:Button;
        private var _3560141time:Label;
        private var _97824bt2:Button;
        private var _99457dif:ComboBox;
        private var _91052262_left:String = "59:59";
        private var _410330704taskName:Label;
        private var leftTime:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":222,
                    "height":97,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_AutoTaskBox_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"taskName",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_AutoTaskBox_Label3",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":113,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ComboBox,
                        "id":"dif",
                        "events":{"close":"__dif_close"},
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "y":5,
                                "labelField":"label",
                                "width":65,
                                "editable":false,
                                "rowCount":7
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.backgroundColor = 1190715;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":55,
                                "y":33,
                                "width":100,
                                "height":27,
                                "styleName":"RoundedGradientBorder"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"time",
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
                                "x":55,
                                "y":30,
                                "width":100,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"bt0",
                        "events":{"click":"__bt0_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":66,
                                "height":28,
                                "enabled":true,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"bt1",
                        "events":{"click":"__bt1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "-40";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":66,
                                "height":28,
                                "enabled":true,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"bt2",
                        "events":{"click":"__bt2_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "40";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":66,
                                "height":28,
                                "enabled":true,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"bt3",
                        "events":{"click":"__bt3_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "6";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "width":66,
                                "height":28,
                                "enabled":true,
                                "styleName":"BtnStdRed"
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

        public function AutoTaskBox()
        {
            mx_internal::_document = this;
            this.width = 222;
            this.height = 97;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.styleName = "RoundedGradientBorder";
            this.addEventListener("creationComplete", ___AutoTaskBox_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AutoTaskBox._watcherSetupUtil = _arg_1;
        }


        private function _AutoTaskBox_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TASKSWEEPPANEL_U[39];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TASKSWEEPPANEL_U[40];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = _left;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TASKSWEEPPANEL_U[41];
            _local_1 = Language.TASKSWEEPPANEL_U[42];
            _local_1 = Language.TASKSWEEPPANEL_U[43];
            _local_1 = Language.TASKSWEEPPANEL_U[51];
        }

        private function stopAuto2(_arg_1:CloseEvent):void
        {
            var _local_2:int;
            if (_arg_1.detail == Alert.YES)
            {
                _local_2 = getTid();
                _core.remote.call("autoTaskCancel", null, _local_2);
            };
        }

        public function set dif(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._99457dif;
            if (_local_2 !== _arg_1)
            {
                this._99457dif = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dif", _local_2, _arg_1));
            };
        }

        public function ___AutoTaskBox_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __bt3_click(_arg_1:MouseEvent):void
        {
            getAward();
        }

        private function refreshTimeTxt():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            if (leftTime >= 3600)
            {
                _local_1 = int(Math.floor((leftTime / 3600)));
                _local_2 = int((Math.floor((leftTime / 60)) % 60));
                _local_3 = (leftTime % 60);
            }
            else
            {
                if (leftTime >= 60)
                {
                    _local_1 = 0;
                    _local_2 = int(Math.floor((leftTime / 60)));
                    _local_3 = (leftTime % 60);
                }
                else
                {
                    if (leftTime > 0)
                    {
                        _local_1 = 0;
                        _local_2 = 0;
                        _local_3 = leftTime;
                    }
                    else
                    {
                        _local_1 = 0;
                        _local_2 = 0;
                        _local_3 = 0;
                    };
                };
            };
            var _local_4:* = "00";
            var _local_5:* = "00";
            var _local_6:* = "00";
            if (_local_1 > 0)
            {
                _local_4 = String(_local_1);
            };
            if (_local_2 >= 0)
            {
                if (_local_2 <= 9)
                {
                    _local_5 = ("0" + _local_2);
                }
                else
                {
                    _local_5 = String(_local_2);
                };
            };
            if (_local_3 >= 0)
            {
                if (_local_3 <= 9)
                {
                    _local_6 = ("0" + _local_3);
                }
                else
                {
                    _local_6 = String(_local_3);
                };
            };
            if (_local_1 == 0)
            {
                if (((_local_3 == 0) && (_local_2 == 0)))
                {
                    _left = "00:00";
                }
                else
                {
                    _left = ((_local_5 + ":") + _local_6);
                };
            }
            else
            {
                _left = ((((_local_4 + ":") + _local_5) + ":") + _local_6);
            };
        }

        override public function initialize():void
        {
            var target:AutoTaskBox;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AutoTaskBox_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_AutoTaskBoxWatcherSetupUtil");
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
        public function get dif():ComboBox
        {
            return (this._99457dif);
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

        private function init():void
        {
            _diffCombox = [{
                "label":Language.TASKSWEEPPANEL_U[44],
                "data":1
            }, {
                "label":Language.TASKSWEEPPANEL_U[45],
                "data":2
            }, {
                "label":Language.TASKSWEEPPANEL_U[46],
                "data":3
            }];
            this.dif.dataProvider = _diffCombox;
        }

        public function __bt1_click(_arg_1:MouseEvent):void
        {
            stopAuto();
        }

        private function startAuto2(_arg_1:CloseEvent):void
        {
            var _local_2:int;
            if (_arg_1.detail == Alert.YES)
            {
                _local_2 = getTid();
                _core.remote.call("autoTaskStart", null, _local_2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get bt0():Button
        {
            return (this._97822bt0);
        }

        [Bindable(event="propertyChange")]
        public function get bt1():Button
        {
            return (this._97823bt1);
        }

        private function getAward():void
        {
            var _local_1:int = getTid();
            _core.remote.call("autoTaskGetAward", null, _local_1);
        }

        public function setData(_arg_1:Object, _arg_2:Object, _arg_3:Number):void
        {
            var _local_6:int;
            taskName.text = _arg_1["label"];
            tid = _arg_1["data"];
            dif.selectedIndex = 0;
            var _local_4:int;
            if (((((tid == 4) || (tid == 7)) || (tid == 10)) || (tid == 13)))
            {
                _local_4 = 2;
            };
            var _local_5:int;
            _local_5 = _local_4;
            while (_local_5 >= 0)
            {
                _local_6 = (tid + _local_5);
                if (((_arg_2["data"]) && (int(_arg_2["data"]["id"]) == _local_6)))
                {
                    state = 1;
                    bt1.visible = true;
                    bt2.visible = true;
                    dif.selectedIndex = _local_5;
                    break;
                };
                if (((_arg_2["queue"]) && (_arg_2["queue"][_local_6])))
                {
                    state = 2;
                    bt1.visible = true;
                    bt2.visible = true;
                    dif.selectedIndex = _local_5;
                    break;
                };
                if (((_arg_2["finish"]) && (_arg_2["finish"][_local_6])))
                {
                    state = 3;
                    bt3.visible = true;
                    dif.selectedIndex = _local_5;
                    break;
                };
                state = 0;
                _local_5--;
            };
            if (state == 0)
            {
                bt0.visible = true;
                dif.selectedIndex = 0;
            };
            refreshTime(_arg_2, _arg_3);
            if ((((((tid == 4) || (tid == 7)) || (tid == 10)) || (tid == 13)) && (state == 0)))
            {
                dif.enabled = true;
            }
            else
            {
                dif.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get bt2():Button
        {
            return (this._97824bt2);
        }

        [Bindable(event="propertyChange")]
        public function get bt3():Button
        {
            return (this._97825bt3);
        }

        private function startAuto():void
        {
            var _local_1:int = GamePredef.TASK[getTid()].money;
            var _local_2:String = Language.TASKSWEEPPANEL_U[54].toString().replace("{num}", _local_1);
            Alert.show(_local_2, "", (Alert.YES | Alert.NO), null, startAuto2);
        }

        private function closeHandler(_arg_1:Event):void
        {
            if (state != 0)
            {
                return;
            };
            refreshTime({}, 0);
        }

        private function _AutoTaskBox_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoTaskBox_Label1.text = _arg_1;
            }, "_AutoTaskBox_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _AutoTaskBox_Label1.filters = _arg_1;
            }, "_AutoTaskBox_Label1.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                taskName.filters = _arg_1;
            }, "taskName.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoTaskBox_Label3.text = _arg_1;
            }, "_AutoTaskBox_Label3.text");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _AutoTaskBox_Label3.filters = _arg_1;
            }, "_AutoTaskBox_Label3.filters");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _left;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                time.text = _arg_1;
            }, "time.text");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                time.filters = _arg_1;
            }, "time.filters");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt0.label = _arg_1;
            }, "bt0.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt1.label = _arg_1;
            }, "bt1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt2.label = _arg_1;
            }, "bt2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt3.label = _arg_1;
            }, "bt3.label");
            result[10] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get taskName():Label
        {
            return (this._410330704taskName);
        }

        public function set bt0(_arg_1:Button):void
        {
            var _local_2:Object = this._97822bt0;
            if (_local_2 !== _arg_1)
            {
                this._97822bt0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt0", _local_2, _arg_1));
            };
        }

        public function set bt1(_arg_1:Button):void
        {
            var _local_2:Object = this._97823bt1;
            if (_local_2 !== _arg_1)
            {
                this._97823bt1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt1", _local_2, _arg_1));
            };
        }

        public function set bt3(_arg_1:Button):void
        {
            var _local_2:Object = this._97825bt3;
            if (_local_2 !== _arg_1)
            {
                this._97825bt3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt3", _local_2, _arg_1));
            };
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            if (state != 1)
            {
                return;
            };
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

        public function __bt0_click(_arg_1:MouseEvent):void
        {
            startAuto();
        }

        private function refreshTime(_arg_1:Object, _arg_2:Number):void
        {
            var _local_4:Object;
            var _local_5:Number;
            var _local_3:Number = 0;
            if (state == 0)
            {
                _local_3 = ((GamePredef.TASK[getTid()].time * GamePredef.TASK[getTid()].battleCount) / 1000);
            }
            else
            {
                if (state == 1)
                {
                    _local_4 = _arg_1["data"];
                    _local_5 = _arg_1["data"]["st"];
                    _local_3 = (((GamePredef.TASK[getTid()].time * GamePredef.TASK[getTid()].battleCount) - (_arg_2 - _local_5)) / 1000);
                    leftTime = _local_3;
                    if (!timer)
                    {
                        timer = new Timer(1000);
                    };
                    if (!registed)
                    {
                        registed = true;
                        timer.addEventListener(TimerEvent.TIMER, timerHandler);
                    };
                    if (!timer.running)
                    {
                        timer.start();
                    };
                }
                else
                {
                    if (state == 2)
                    {
                        _left = Language.TASKSWEEPPANEL_U[49];
                        return;
                    };
                    if (state == 3)
                    {
                        _left = Language.TASKSWEEPPANEL_U[50];
                        return;
                    };
                };
            };
            refreshTimeTxt();
        }

        public function clean():void
        {
            taskName.text = "";
            dif.enabled = false;
            _left = "00:00";
            leftTime = 0;
            bt0.visible = false;
            bt1.visible = false;
            bt2.visible = false;
            bt3.visible = false;
            if (timer)
            {
                timer.stop();
            };
        }

        public function set bt2(_arg_1:Button):void
        {
            var _local_2:Object = this._97824bt2;
            if (_local_2 !== _arg_1)
            {
                this._97824bt2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bt2", _local_2, _arg_1));
            };
        }

        public function __bt2_click(_arg_1:MouseEvent):void
        {
            completeNow();
        }

        private function stopAuto():void
        {
            var _local_1:String = Language.TASKSWEEPPANEL_U[52];
            Alert.show(_local_1, "", (Alert.YES | Alert.NO), null, stopAuto2);
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

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            var _local_2:BagPanel;
            var _local_3:Boolean;
            if (_arg_1)
            {
                _local_2 = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                _local_3 = _local_2.goldLockFlag;
                if (((!(_local_3 == false)) && (_local_2)))
                {
                    _local_2.goldLockFlag = false;
                };
            };
        }

        public function getTid():int
        {
            return (tid + dif.selectedIndex);
        }

        public function __dif_close(_arg_1:DropdownEvent):void
        {
            closeHandler(_arg_1);
        }

        private function completeNow():void
        {
            var _local_1:int = getTid();
            _core.remote.call("autoTaskCompleteByGold", new Responder(completeNow2), _local_1, true);
        }

        private function completeByTime():void
        {
            var _local_1:int = getTid();
            _core.remote.call("autoTaskComplete", null, _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get time():Label
        {
            return (this._3560141time);
        }

        [Bindable(event="propertyChange")]
        private function get _left():String
        {
            return (this._91052262_left);
        }

        public function set taskName(_arg_1:Label):void
        {
            var _local_2:Object = this._410330704taskName;
            if (_local_2 !== _arg_1)
            {
                this._410330704taskName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskName", _local_2, _arg_1));
            };
        }

        private function completeNow2(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:String = Language.TASKSWEEPPANEL_U[53].toString().replace("{num}", _arg_1);
            Alert.show(_local_2, "", (Alert.YES | Alert.NO), null, completeNow3);
        }

        private function completeNow3(event:CloseEvent):void
        {
            var bagPanel:BagPanel;
            var goldLockFlag:Boolean;
            var ttid:int;
            var gfunc:Function;
            if (event.detail == Alert.YES)
            {
                bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                goldLockFlag = bagPanel.goldLockFlag;
                if (((goldLockFlag) || (!(bagPanel))))
                {
                    _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                    gfunc = function (_arg_1:String):void
                    {
                        _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                    };
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                    return;
                };
                ttid = getTid();
                _core.remote.call("autoTaskCompleteByGold", null, ttid, false);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

