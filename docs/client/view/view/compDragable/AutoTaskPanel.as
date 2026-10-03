// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AutoTaskPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.AutoTaskBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import mx.containers.Tile;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import com.qeedoo.game.object.Charactor;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.utils.getDefinitionByName;
    import mx.core.IUITextField;
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

    public class AutoTaskPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3647t3:AutoTaskBox;
        private var _3552645task:BasicTitleCanvas;
        private var _3650t6:AutoTaskBox;
        private var everyBattleTime:Number = 180000;
        private var taskConfig:Object;
        private var totalTime:Number;
        private var _878428813tileContainer:ViewStack;
        private var _finishFlag:Boolean = false;
        private var _3646t2:AutoTaskBox;
        private var _110363460tile2:Tile;
        public var _AutoTaskPanel_Label1:Label;
        private var _100361836intro:IntroText;
        private var ct:Number = 0;
        public var _AutoTaskPanel_Label3:Label;
        public var sweepFlag:Boolean = false;
        private var _3645t1:AutoTaskBox;
        private var _sweepAlert:Alert;
        private var _3649t5:AutoTaskBox;
        private var _info:String;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _time:Number = 0;
        private var _110363459tile1:Tile;
        private var _2116189043itemNum:Label;
        private var _1307590523todayNum:Label;
        private var _3644t0:AutoTaskBox;
        private var _3648t4:AutoTaskBox;
        private var _run:String = ".";
        public var _taskType:Number = 1;
        private var _haveBattle:int = 0;
        private var _3651t7:AutoTaskBox;
        private var _91052262_left:String = "59:59";
        private var _warMapMax:uint = 1;
        private var _selected:Boolean = false;
        private var AUTO_TASK_ADD_ITEM:int = 3630;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":720,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"task"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.top = "39";
                            this.bottom = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":700,
                                "styleName":"txtArea",
                                "creationPolicy":"all",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"intro",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":245,
                                            "width":680,
                                            "height":132
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":0,
                                            "percentWidth":100,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"tileContainer",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":10,
                                                        "percentWidth":100,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "selectedIndex":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"tile1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 4;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10,
                                                                    "width":682,
                                                                    "height":202,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileBagItem",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t0"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t1"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t2"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t3"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t4"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t5"
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"tile2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 4;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10,
                                                                    "width":682,
                                                                    "height":202,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileBagItem",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t6"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTaskBox,
                                                                        "id":"t7"
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelectorOnly,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":218,
                                                        "changeCall":updatePage
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_AutoTaskPanel_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":440,
                                                        "y":218
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"todayNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":525,
                                                        "y":218
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_AutoTaskPanel_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":540,
                                                        "y":218
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"itemNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":650,
                                                        "y":218
                                                    });
                                                }
                                            })]
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
        private var _timer:Timer = new Timer(1000);
        private var _319812849_taskName:String = Language.TASKSWEEPPANEL_U[0];
        private var autoData:Object = {};
        public var _taskCombox:Array = new Array({
            "label":"Mê Huyễn Động",
            "data":1
        }, {
            "label":"Kho Báu Đại Mạc",
            "data":2
        }, {
            "label":"Lục Tiên Cảnh",
            "data":3
        }, {
            "label":"Liệt Diễm Thâm Uyên",
            "data":4
        }, {
            "label":"Lang Huyệt Động",
            "data":7
        }, {
            "label":"Quỷ Hút Máu",
            "data":10
        }, {
            "label":"Thế Giới Số",
            "data":13
        }, {
            "label":"PB Thám Hiểm",
            "data":16
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AutoTaskPanel()
        {
            mx_internal::_document = this;
            this.width = 720;
            this.height = 450;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___AutoTaskPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AutoTaskPanel._watcherSetupUtil = _arg_1;
        }


        public function ___AutoTaskPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set task(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._3552645task;
            if (_local_2 !== _arg_1)
            {
                this._3552645task = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "task", _local_2, _arg_1));
            };
        }

        public function initTaskSweepPanel(_arg_1:Object):void
        {
            if (!_finishFlag)
            {
            };
            if (_arg_1)
            {
                this.visible = false;
            };
        }

        public function set todayNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1307590523todayNum;
            if (_local_2 !== _arg_1)
            {
                this._1307590523todayNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "todayNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _taskName():String
        {
            return (this._319812849_taskName);
        }

        public function init():void
        {
            intro.htmlText = Language.TASKSWEEPPANEL_U[21];
            this.task.closeFunc = closePanel;
            updatePage();
        }

        public function onTaskSweepCancel(_arg_1:Object):void
        {
        }

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        private function _secToTime(_arg_1:Number):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            if (_arg_1)
            {
                _local_2 = 0;
                _local_3 = 0;
                _local_4 = 0;
                _local_5 = "00";
                _local_6 = "00";
                _local_7 = "00";
                if (_arg_1 >= 3600)
                {
                    _local_2 = int(Math.floor((_arg_1 / 3600)));
                    _local_3 = int((Math.floor((_arg_1 / 60)) % 60));
                    _local_4 = (_arg_1 % 60);
                }
                else
                {
                    if (_arg_1 >= 60)
                    {
                        _local_2 = 0;
                        _local_3 = int(Math.floor((_arg_1 / 60)));
                        _local_4 = (_arg_1 % 60);
                    }
                    else
                    {
                        if (_arg_1 > 0)
                        {
                            _local_2 = 0;
                            _local_3 = 0;
                            _local_4 = _arg_1;
                        }
                        else
                        {
                            _local_2 = 0;
                            _local_3 = 0;
                            _local_4 = 0;
                        };
                    };
                };
                if (_local_2 > 0)
                {
                    if (_local_2 <= 9)
                    {
                        _local_5 = String(_local_2);
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
                if (_local_4 >= 0)
                {
                    if (_local_4 <= 9)
                    {
                        _local_7 = ("0" + _local_4);
                    }
                    else
                    {
                        _local_7 = String(_local_4);
                    };
                };
                if (_local_2 == 0)
                {
                    if (((_local_4 == 0) && (_local_3 == 0)))
                    {
                        _left = "00:00";
                    }
                    else
                    {
                        _left = ((_local_6 + ":") + _local_7);
                    };
                }
                else
                {
                    _left = ((((_local_5 + ":") + _local_6) + ":") + _local_7);
                };
            }
            else
            {
                _left = "00:00";
            };
        }

        public function refreshData():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < _taskCombox.length)
            {
                _local_2 = _taskCombox[_local_1];
                this[("t" + _local_1)].clean();
                _local_1++;
            };
            _local_1 = 0;
            while (_local_1 < _taskCombox.length)
            {
                _local_2 = _taskCombox[_local_1];
                this[("t" + _local_1)].setData(_local_2, autoData, ct);
                _local_1++;
            };
        }

        public function closeSure():void
        {
            this.task.parentDocument.hide();
        }

        public function onGetAutoTaskData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = _arg_1["todayNum"];
            var _local_3:int = _arg_1["useNum"];
            autoData = _arg_1["data"];
            ct = _arg_1["ct"];
            todayNum.text = (_local_2 - _local_3).toString();
            itemNum.text = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, AUTO_TASK_ADD_ITEM).num;
            refreshData();
            visible = true;
        }

        private function set _taskName(_arg_1:String):void
        {
            var _local_2:Object = this._319812849_taskName;
            if (_local_2 !== _arg_1)
            {
                this._319812849_taskName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_taskName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t1():AutoTaskBox
        {
            return (this._3645t1);
        }

        [Bindable(event="propertyChange")]
        public function get t3():AutoTaskBox
        {
            return (this._3647t3);
        }

        private function _AutoTaskPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _taskName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                task.text = _arg_1;
            }, "task.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoTaskPanel_Label1.text = _arg_1;
            }, "_AutoTaskPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _AutoTaskPanel_Label1.filters = _arg_1;
            }, "_AutoTaskPanel_Label1.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                todayNum.filters = _arg_1;
            }, "todayNum.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AutoTaskPanel_Label3.text = _arg_1;
            }, "_AutoTaskPanel_Label3.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _AutoTaskPanel_Label3.filters = _arg_1;
            }, "_AutoTaskPanel_Label3.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                itemNum.filters = _arg_1;
            }, "itemNum.filters");
            result[6] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get t0():AutoTaskBox
        {
            return (this._3644t0);
        }

        [Bindable(event="propertyChange")]
        public function get tile2():Tile
        {
            return (this._110363460tile2);
        }

        [Bindable(event="propertyChange")]
        public function get t4():AutoTaskBox
        {
            return (this._3648t4);
        }

        [Bindable(event="propertyChange")]
        public function get t5():AutoTaskBox
        {
            return (this._3649t5);
        }

        [Bindable(event="propertyChange")]
        public function get t6():AutoTaskBox
        {
            return (this._3650t6);
        }

        [Bindable(event="propertyChange")]
        public function get t2():AutoTaskBox
        {
            return (this._3646t2);
        }

        [Bindable(event="propertyChange")]
        public function get t7():AutoTaskBox
        {
            return (this._3651t7);
        }

        public function onEndBattle(_arg_1:Object):void
        {
            if (_arg_1)
            {
            };
        }

        private function introContent1():void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_1:Charactor = _core.getCharactor(_core.cid);
            var _local_2:* = 1;
            while (_local_2 <= _haveBattle)
            {
                _local_3 = 0;
                if (((GamePredef.EXP_SWEEP[taskConfig.id]) && (GamePredef.EXP_SWEEP[taskConfig.id][_local_2])))
                {
                    _local_3 = Math.round((GamePredef.BASIC_GET_EXP[_local_1.level] * GamePredef.EXP_SWEEP[taskConfig.id][_local_2]));
                }
                else
                {
                    if ((((taskConfig.id) && (getTaskType(taskConfig.id) == 3)) && (taskConfig.exp)))
                    {
                        _local_3 = Math.round(taskConfig.exp);
                    };
                };
                _local_4 = 0;
                if (((GamePredef.MONEY_SWEEP[taskConfig.id]) && (GamePredef.MONEY_SWEEP[taskConfig.id][_local_2])))
                {
                    _local_4 = Math.round((GamePredef.BASIC_GET_MONEY[_local_1.level] * GamePredef.MONEY_SWEEP[taskConfig.id][_local_2]));
                };
                if ((((_info) && (_local_3)) && (!(_local_3 == 0))))
                {
                    _info = ((_info + "&#13;") + Language.TASKSWEEPPANEL_U[18].toString().replace("{num}", _local_2).replace("{exp}", _local_3));
                }
                else
                {
                    _info = Language.TASKSWEEPPANEL_U[18].toString().replace("{num}", _local_2).replace("{exp}", _local_3);
                };
                if ((((_info) && (_local_4)) && (!(_local_4 == 0))))
                {
                    _info = _info.replace("{moneyBind}", _local_4);
                }
                else
                {
                    _info = _info.replace("&#13;<font color='#00EEEE'>获得银票:<font color='#FFFFFF'>{moneyBind}</font></font>", "");
                };
                _info = (_info + "&#13;----------------");
                _local_2++;
            };
            intro.htmlText = _info;
        }

        [Bindable(event="propertyChange")]
        public function get tile1():Tile
        {
            return (this._110363459tile1);
        }

        [Bindable(event="propertyChange")]
        public function get intro():IntroText
        {
            return (this._100361836intro);
        }

        [Bindable(event="propertyChange")]
        public function get itemNum():Label
        {
            return (this._2116189043itemNum);
        }

        private function turnSweep(type:Number):void
        {
            var obj:Object;
            var str:String;
            var c:AutoTaskBox;
            var tid:int;
            var config:Object;
            obj = {};
            var totalMoney:Number = 0;
            var num:int;
            var i:int;
            while (i < 6)
            {
                c = this[("t" + i)];
                tid = c.tid;
                config = GamePredef.TASK[tid];
                totalMoney = (totalMoney + config["money"]);
                num = (num + 1);
                obj[num] = tid;
                i = (i + 1);
            };
            if (num == 0)
            {
                return;
            };
            var handler:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (!sweepFlag)
                    {
                        _core.remote.call("autoTaskSweepSure", new Responder(onTaskSweepSure), obj, _selected);
                    }
                    else
                    {
                        _core.remote.call("autoTaskSweepCancel", null);
                        if (type == 2)
                        {
                            closeSure();
                        };
                    };
                };
            };
            if (_sweepAlert)
            {
                PopUpManager.removePopUp(_sweepAlert);
                _sweepAlert = null;
            };
            if (!sweepFlag)
            {
                str = str.replace("{money}", totalMoney).replace("{num}", num);
            };
            _sweepAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        public function set t1(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3645t1;
            if (_local_2 !== _arg_1)
            {
                this._3645t1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1", _local_2, _arg_1));
            };
        }

        public function onTaskSweepSure(_arg_1:Object):void
        {
        }

        public function replaceIndex(_arg_1:int, _arg_2:String, _arg_3:int):void
        {
        }

        public function set t0(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3644t0;
            if (_local_2 !== _arg_1)
            {
                this._3644t0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t0", _local_2, _arg_1));
            };
        }

        public function set t5(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3649t5;
            if (_local_2 !== _arg_1)
            {
                this._3649t5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t5", _local_2, _arg_1));
            };
        }

        public function set t7(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3651t7;
            if (_local_2 !== _arg_1)
            {
                this._3651t7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        private function getMedalInfo(_arg_1:int):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Number;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            if (_arg_1)
            {
                _local_2 = GameData.d[GamePredef.TBL_MEDAL][_arg_1];
                if (_local_2)
                {
                    _local_3 = Language.TASKSWEEPPANEL_U[11];
                    _local_4 = _local_2.q;
                    _local_5 = getColorBy(_local_4, _local_2.ti);
                    _local_6 = "";
                    if (ToolKit.isBigOrEqual(_local_5, 0))
                    {
                        _local_7 = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_5]) + "'>") + _local_2.name) + _local_6) + "</font>");
                        _local_3 = _local_3.replace("{itemName}", _local_7).replace("{num}", 1);
                        _info = ((_info + "&#13;") + _local_3);
                    };
                };
            };
        }

        override public function initialize():void
        {
            var target:AutoTaskPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AutoTaskPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AutoTaskPanelWatcherSetupUtil");
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

        public function set tile1(_arg_1:Tile):void
        {
            var _local_2:Object = this._110363459tile1;
            if (_local_2 !== _arg_1)
            {
                this._110363459tile1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tile1", _local_2, _arg_1));
            };
        }

        public function onTaskSweepLeftTimeCheck(_arg_1:Object):void
        {
            var _local_2:*;
            if (((_arg_1) && (_arg_1.gold)))
            {
                if (sweepFlag)
                {
                    _local_2 = Language.TASKSWEEPPANEL_U[26];
                    _local_2 = _local_2.replace("{gold}", _arg_1.gold).replace("{taskName}", taskConfig.taskName);
                    turnSweepRight(_local_2);
                };
            };
        }

        public function set t6(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3650t6;
            if (_local_2 !== _arg_1)
            {
                this._3650t6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get task():BasicTitleCanvas
        {
            return (this._3552645task);
        }

        public function set t2(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3646t2;
            if (_local_2 !== _arg_1)
            {
                this._3646t2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2", _local_2, _arg_1));
            };
        }

        public function set t3(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3647t3;
            if (_local_2 !== _arg_1)
            {
                this._3647t3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t3", _local_2, _arg_1));
            };
        }

        public function set t4(_arg_1:AutoTaskBox):void
        {
            var _local_2:Object = this._3648t4;
            if (_local_2 !== _arg_1)
            {
                this._3648t4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t4", _local_2, _arg_1));
            };
        }

        private function _AutoTaskPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _taskName;
            _local_1 = Language.TASKSWEEPPANEL_U[47];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TASKSWEEPPANEL_U[48];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        private function doTask():void
        {
            if (!_haveBattle)
            {
                _haveBattle = 0;
            };
            if (((_timer) && (_timer.running)))
            {
                if (_info == "")
                {
                    intro.htmlText = ((((_info + Language.TASKSWEEPPANEL_U[17].toString().replace("{num}", (_haveBattle + 1))) + "<font color='#FA5B05'>") + _run) + "</font>");
                }
                else
                {
                    intro.htmlText = (((((_info + "&#13;") + Language.TASKSWEEPPANEL_U[17].toString().replace("{num}", (_haveBattle + 1))) + "<font color='#FA5B05'>") + _run) + "</font>");
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get todayNum():Label
        {
            return (this._1307590523todayNum);
        }

        public function set tile2(_arg_1:Tile):void
        {
            var _local_2:Object = this._110363460tile2;
            if (_local_2 !== _arg_1)
            {
                this._110363460tile2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tile2", _local_2, _arg_1));
            };
        }

        public function clickTaskSweep():void
        {
            _core.remote.call("getAutoTaskData", new Responder(onGetAutoTaskData));
        }

        public function onStart(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = _arg_1["todayNum"];
            var _local_3:int = _arg_1["useNum"];
            autoData = _arg_1["data"];
            ct = _arg_1["ct"];
            todayNum.text = (_local_2 - _local_3).toString();
            itemNum.text = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, AUTO_TASK_ADD_ITEM).num;
            refreshData();
        }

        [Bindable(event="propertyChange")]
        public function get tileContainer():ViewStack
        {
            return (this._878428813tileContainer);
        }

        public function getTaskType(_arg_1:int):int
        {
            var _local_2:*;
            for (_local_2 in GamePredef.TASK_CLASSIFICATION)
            {
                if (((_arg_1 >= GamePredef.TASK_CLASSIFICATION[_local_2].b) && (_arg_1 <= GamePredef.TASK_CLASSIFICATION[_local_2].e)))
                {
                    return (_local_2);
                };
            };
            return (0);
        }

        private function getItemInfo(_arg_1:int):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:int;
            var _local_7:String;
            var _local_8:String;
            if (_arg_1)
            {
                _local_2 = GameData.d[GamePredef.TBL_PLAN][_arg_1];
                if (_local_2)
                {
                    _local_3 = Language.TASKSWEEPPANEL_U[11];
                    _local_4 = GameData.d[_local_2.ti][_local_2.ii];
                    _local_5 = _local_2.q;
                    if (((_local_4) && (!(ToolKit.isEqual(_local_4.kind, GamePredef.ITEM_KIND_MATERIAL)))))
                    {
                        _local_5 = 0;
                    };
                    if (((_local_4) && (ToolKit.isBigOrEqual(_local_4.color, 0))))
                    {
                        _local_5 = (_local_4.color * 5);
                    };
                    _local_6 = int(int((_local_2.q / 2)));
                    _local_7 = "";
                    if (ToolKit.isBigOrEqual(_local_6, 0))
                    {
                        _local_8 = ((((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_6]) + "'>") + _local_4.name) + _local_7) + "</font>");
                        _local_3 = _local_3.replace("{itemName}", _local_8).replace("{num}", _local_2.n);
                        _info = ((_info + "&#13;") + _local_3);
                    };
                };
            };
        }

        public function set intro(_arg_1:IntroText):void
        {
            var _local_2:Object = this._100361836intro;
            if (_local_2 !== _arg_1)
            {
                this._100361836intro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "intro", _local_2, _arg_1));
            };
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

        private function getColorBy(_arg_1:int, _arg_2:int):int
        {
            if (((((_arg_2 == 28) || (_arg_2 == 29)) || (_arg_2 == 18)) || (_arg_2 == 19)))
            {
                if (_arg_1 > 15)
                {
                    return (4);
                };
                if (_arg_1 > 10)
                {
                    return (3);
                };
                if (_arg_1 > 5)
                {
                    return (2);
                };
                if (_arg_1 > 0)
                {
                    return (1);
                };
                return (0);
            };
            return (0);
        }

        public function set itemNum(_arg_1:Label):void
        {
            var _local_2:Object = this._2116189043itemNum;
            if (_local_2 !== _arg_1)
            {
                this._2116189043itemNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum", _local_2, _arg_1));
            };
        }

        private function turnSweepRight(str1:String):void
        {
            var time1:* = undefined;
            var handler:Function;
            var str:String;
            var tf:IUITextField;
            var gold:* = undefined;
            if (((sweepFlag) && ((!(str1)) || (str1 == ""))))
            {
                time1 = new Date().getTime();
                if ((time1 - _time) > 1000)
                {
                    _core.remote.call("taskSweepLeftTimeCheck", new Responder(onTaskSweepLeftTimeCheck), null);
                    _time = time1;
                };
                return;
            };
            if ((((taskConfig) && (taskConfig.taskName)) && (taskConfig.id)))
            {
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        if (!sweepFlag)
                        {
                            _core.remote.call("taskFinishByGold", null, taskConfig.id, 2, taskConfig.battleCount, taskConfig.taskIndex, _selected);
                        }
                        else
                        {
                            _core.remote.call("taskFinishByGold", null, taskConfig.id, 1, taskConfig.battleCount, taskConfig.taskIndex);
                        };
                    };
                };
                if (_sweepAlert)
                {
                    PopUpManager.removePopUp(_sweepAlert);
                    _sweepAlert = null;
                };
                if (!sweepFlag)
                {
                    str = Language.TASKSWEEPPANEL_U[26];
                    str = str.replace("{gold}", taskConfig.gold).replace("{taskName}", taskConfig.taskName);
                    if ((((taskConfig) && (getTaskType(taskConfig.id))) && (getTaskType(taskConfig.id) == 3)))
                    {
                        gold = Math.ceil((((taskConfig.time * taskConfig.battleCount) / 60000) * 0.5));
                        if (gold < 1)
                        {
                            gold = 1;
                        };
                        str = Language.TASKSWEEPPANEL_U[26].toString().replace("{gold}", gold).replace("{taskName}", taskConfig.taskName);
                    };
                }
                else
                {
                    str = str1;
                };
                _sweepAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
                tf = _sweepAlert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = str;
                tf.filters = GamePredef.FILTER_TEXT1;
            };
        }

        public function closePanel():void
        {
            if (sweepFlag)
            {
                turnSweep(2);
            }
            else
            {
                closeSure();
            };
        }

        public function set tileContainer(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._878428813tileContainer;
            if (_local_2 !== _arg_1)
            {
                this._878428813tileContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileContainer", _local_2, _arg_1));
            };
        }

        private function updatePage():void
        {
            pageSelector.totalPage = 2;
            tileContainer.selectedIndex = (pageSelector.curPage - 1);
        }

        [Bindable(event="propertyChange")]
        private function get _left():String
        {
            return (this._91052262_left);
        }


    }
}//package com.qeedoo.ui.view.compDragable

