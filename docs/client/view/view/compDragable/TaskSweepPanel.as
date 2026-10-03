// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TaskSweepPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.Alert;
    import mx.controls.CheckBox;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.events.TimerEvent;
    import mx.events.NumericStepperEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.DropdownEvent;
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

    public class TaskSweepPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _97823bt1:Button;
        private var _1094713483reqTime:Label;
        private var _3552645task:BasicTitleCanvas;
        private var everyBattleTime:Number = 180000;
        private var taskConfig:Object;
        private var totalTime:Number;
        private var _finishFlag:Boolean = false;
        private var _344437713bagLeft:Label;
        private var _401559445numStepper:NumericStepper;
        private var _3560141time:Label;
        private var _100361836intro:IntroText;
        public var sweepFlag:Boolean = false;
        private var _sweepAlert:Alert;
        private var _1254200744useSweepItem:CheckBox;
        private var _info:String;
        private var _97822bt0:Button;
        private var _time:Number = 0;
        public var _taskType:Number = 1;
        private var _775306441battleCount:Label;
        private var _run:String = ".";
        private var _1159596620taskNameInfor:ComboBox;
        private var _haveBattle:int = 0;
        private var _410330704taskName:Label;
        private var _warMapMax:uint = 1;
        private var _91052262_left:String = "59:59";
        private var _2087634463bagLeft0:Label;
        private var _selected:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":346,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"task",
                        "events":{"creationComplete":"__task_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "y":39,
                                "width":459,
                                "height":285,
                                "styleName":"txtArea",
                                "creationPolicy":"all",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"reqTime",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":17
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"battleCount",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"taskName",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":132
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"bt0",
                                    "events":{"click":"__bt0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":287,
                                            "y":247,
                                            "width":66,
                                            "height":28,
                                            "enabled":true,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"time",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontFamily = "Arial";
                                        this.fontSize = 50;
                                        this.color = 3934994;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":281.5,
                                            "y":35,
                                            "width":187.5,
                                            "height":57
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"taskNameInfor",
                                    "events":{"close":"__taskNameInfor_close"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":323,
                                            "labelField":"label",
                                            "width":117,
                                            "editable":false,
                                            "y":129,
                                            "rowCount":7,
                                            "enabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"intro",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "width":242,
                                            "height":265
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"bagLeft",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":196
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"bagLeft0",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":164
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"bt1",
                                    "events":{"click":"__bt1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":356,
                                            "y":247,
                                            "height":28,
                                            "enabled":true,
                                            "styleName":"BtnStdRed",
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CheckBox,
                                    "id":"useSweepItem",
                                    "events":{"click":"__useSweepItem_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingLeft = 1;
                                        this.paddingRight = 1;
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":260,
                                            "y":222
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"numStepper",
                                    "events":{"change":"__numStepper_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":45,
                                            "x":345,
                                            "y":98,
                                            "value":1,
                                            "minimum":1,
                                            "visible":false
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
        private var _1595506734_taskCombox:Array = new Array({
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
            "label":"Liệt Diễm Thâm Uyên",
            "data":5
        }, {
            "label":"Liệt Diễm Thâm Uyên",
            "data":6
        }, {
            "label":"Trở Về Lang Huyệt",
            "data":7
        }, {
            "label":"Trở Về Lang Huyệt",
            "data":8
        }, {
            "label":"Trở Về Lang Huyệt",
            "data":9
        }, {
            "label":"Quỷ Hút Máu",
            "data":10
        }, {
            "label":"Quỷ Hút Máu (Thường)",
            "data":11
        }, {
            "label":"Quỷ Hút Máu (Khó)",
            "data":12
        });
        public var _taskCombox1:Array = new Array({
            "label":"N.vụ Tu Hành",
            "data":51
        }, {
            "label":"NV Thần Tu",
            "data":52
        });
        public var _taskCombox2:Array = new Array({
            "label":"Bạch Dương",
            "data":101
        }, {
            "label":"Kim Ngưu",
            "data":102
        }, {
            "label":"Song Tử",
            "data":103
        }, {
            "label":"Cự Giải",
            "data":104
        }, {
            "label":"Sư Tử",
            "data":105
        }, {
            "label":"Xử Nữ",
            "data":106
        }, {
            "label":"Thiên Bình",
            "data":107
        }, {
            "label":"Hổ Cáp",
            "data":108
        }, {
            "label":"Nhân Mã",
            "data":109
        }, {
            "label":"Ma Kết",
            "data":110
        }, {
            "label":"Bảo Bình",
            "data":111
        }, {
            "label":"Song Ngư",
            "data":112
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TaskSweepPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 346;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___TaskSweepPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TaskSweepPanel._watcherSetupUtil = _arg_1;
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
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:String;
            var _local_5:Number;
            if (!_finishFlag)
            {
                _core.remote.call("getTaskBattleTime", new Responder(onGetTaskBattleTime), null);
            };
            if (_arg_1)
            {
                _info = "";
                _haveBattle = 0;
                intro.htmlText = Language.TASKSWEEPPANEL_U[21];
                if (_arg_1.taskId)
                {
                    _taskType = getTaskType(_arg_1.taskId);
                }
                else
                {
                    if (_arg_1.taskType)
                    {
                        _taskType = _arg_1.taskType;
                    }
                    else
                    {
                        if (_arg_1.id)
                        {
                            _taskType = getTaskType(_arg_1.id);
                        };
                    };
                };
                if (((_timer) && (_timer.running)))
                {
                    _timer.removeEventListener(TimerEvent.TIMER, minusTime);
                    _timer.stop();
                };
                this.taskConfig = _arg_1;
                _local_2 = Math.floor((_arg_1.battleCount * (_arg_1.time / 60000)));
                totalTime = ((_arg_1.battleCount * _arg_1.time) / 1000);
                if (((_arg_1.st) && (!(_arg_1.st == 0))))
                {
                    this.taskNameInfor.enabled = false;
                    totalTime = Math.round((((_arg_1.battleCount * _arg_1.time) - _arg_1.st) / 1000));
                    if (totalTime < 0)
                    {
                        totalTime = 2;
                    };
                    _haveBattle = Math.floor((_arg_1.st / _arg_1.time));
                    if (totalTime == 2)
                    {
                        _haveBattle = (int(_arg_1.battleCount) - int(1));
                    };
                    if (_haveBattle > 0)
                    {
                        introContent1();
                    };
                }
                else
                {
                    this.taskNameInfor.enabled = true;
                    if (((_taskType) && (_taskType == 3)))
                    {
                        this.taskNameInfor.enabled = false;
                    };
                };
                _local_2 = Math.floor((totalTime / 60));
                _local_3 = 0;
                _local_4 = "00";
                _local_5 = 0;
                if (_local_2 >= 60)
                {
                    _local_3 = Math.floor((_local_2 / 60));
                    _local_2 = (_local_2 % 60);
                    _local_5 = Math.abs((totalTime % 60));
                }
                else
                {
                    if (_local_2 >= 0)
                    {
                        _local_5 = Math.abs((totalTime % 60));
                    };
                };
                if (_local_5)
                {
                    if (_local_5 >= 10)
                    {
                        _local_4 = String(_local_5);
                    }
                    else
                    {
                        if (_local_5 >= 0)
                        {
                            _local_4 = ("0" + String(_local_5));
                        };
                    };
                };
                if (_local_3 == 0)
                {
                    this.time.setStyle("fontSize", "50");
                    this.time.x = 281.5;
                    if (_local_2 <= 9)
                    {
                        _left = ((("0" + _local_2) + ":") + _local_4);
                    }
                    else
                    {
                        _left = ((_local_2 + ":") + _local_4);
                    };
                }
                else
                {
                    this.time.setStyle("fontSize", "47");
                    this.time.x = 270.5;
                    if (_local_2 <= 9)
                    {
                        _left = ((((_local_3 + ":0") + _local_2) + ":") + _local_4);
                    }
                    else
                    {
                        _left = ((((_local_3 + ":") + _local_2) + ":") + _local_4);
                    };
                };
                if (((getTaskType(_arg_1.taskId) == 1) || (getTaskType(_arg_1.id) == 1)))
                {
                    this.reqTime.text = Language.TASKSWEEPPANEL_U[1];
                    this.battleCount.text = ((((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/") + this.taskConfig.battleCount);
                    this.taskName.text = (Language.TASKSWEEPPANEL_U[3] + ": ");
                    this.taskNameInfor.text = this.taskConfig.taskName;
                    this.bagLeft.text = Language.TASKSWEEPPANEL_U[4];
                    this.bagLeft0.text = ((Language.TASKSWEEPPANEL_U[24] + ": ") + this.taskConfig.needBagNum);
                    this.bt0.label = Language.TASKSWEEPPANEL_U[5];
                    if (this.task)
                    {
                        this.task.text = Language.TASKSWEEPPANEL_U[0].toString();
                        _taskName = Language.TASKSWEEPPANEL_U[0].toString();
                    };
                    this.useSweepItem.visible = true;
                    this.numStepper.visible = false;
                }
                else
                {
                    if (((getTaskType(_arg_1.taskId) == 2) || (getTaskType(_arg_1.id) == 2)))
                    {
                        if (_arg_1.id == 51)
                        {
                            intro.htmlText = Language.TASKSWEEPPANEL_U[32];
                        }
                        else
                        {
                            if (_arg_1.id == 52)
                            {
                                intro.htmlText = Language.TASKSWEEPPANEL_U[55];
                            };
                        };
                        this.reqTime.text = Language.TASKSWEEPPANEL_U[1];
                        this.battleCount.text = ((((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/") + this.taskConfig.battleCount);
                        this.taskName.text = (Language.TASKSWEEPPANEL_U[3].toString().replace(Language.TASKSWEEPPANEL_U[35], Language.TASKSWEEPPANEL_U[36]) + ": ");
                        this.taskNameInfor.text = this.taskConfig.taskName;
                        this.bagLeft.text = Language.TASKSWEEPPANEL_U[4];
                        this.bagLeft0.text = (Language.TASKSWEEPPANEL_U[24] + Language.TASKSWEEPPANEL_U[38]);
                        this.bt0.label = Language.TASKSWEEPPANEL_U[5];
                        if (this.task)
                        {
                            this.task.text = Language.TASKSWEEPPANEL_U[0].toString().replace(Language.TASKSWEEPPANEL_U[35], Language.TASKSWEEPPANEL_U[36]);
                            _taskName = Language.TASKSWEEPPANEL_U[0].toString().replace(Language.TASKSWEEPPANEL_U[35], Language.TASKSWEEPPANEL_U[36]);
                        };
                        this.useSweepItem.visible = false;
                        this.numStepper.visible = false;
                    }
                    else
                    {
                        if (((getTaskType(_arg_1.taskId) == 3) || (getTaskType(_arg_1.id) == 3)))
                        {
                            intro.htmlText = Language.TASKSWEEPPANEL_U[33];
                            this.reqTime.text = Language.TASKSWEEPPANEL_U[1];
                            this.battleCount.text = (((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/");
                            this.taskName.text = (Language.TASKSWEEPPANEL_U[3].toString().replace(Language.TASKSWEEPPANEL_U[35], Language.TASKSWEEPPANEL_U[37]) + ": ");
                            this.taskNameInfor.text = this.taskConfig.taskName;
                            this.bagLeft.text = Language.TASKSWEEPPANEL_U[4];
                            this.bagLeft0.text = ((Language.TASKSWEEPPANEL_U[24] + ": ") + this.taskConfig.needBagNum);
                            this.bt0.label = Language.TASKSWEEPPANEL_U[5];
                            if (this.task)
                            {
                                this.task.text = Language.TASKSWEEPPANEL_U[0].toString().replace(Language.TASKSWEEPPANEL_U[35], Language.TASKSWEEPPANEL_U[37]);
                                _taskName = Language.TASKSWEEPPANEL_U[0].toString().replace(Language.TASKSWEEPPANEL_U[35], Language.TASKSWEEPPANEL_U[37]);
                            };
                            this.useSweepItem.visible = false;
                            if (_arg_1.smax)
                            {
                                _warMapMax = _arg_1.smax;
                                this.numStepper.maximum = Number((_arg_1.smax - _arg_1.snum));
                            }
                            else
                            {
                                this.numStepper.maximum = 5;
                            };
                            this.numStepper.value = 1;
                            if (((_arg_1.st) && (!(_arg_1.st == 0))))
                            {
                                this.numStepper.visible = false;
                            }
                            else
                            {
                                this.numStepper.visible = true;
                            };
                        };
                    };
                };
                this.bt0.enabled = true;
                this.bt1.enabled = true;
                this.visible = true;
                if (((_arg_1.st) && (!(_arg_1.st == 0))))
                {
                    if (((_arg_1.typeflag) && (_arg_1.typeflag == 2)))
                    {
                        return;
                    };
                    if (_arg_1.id)
                    {
                        _arg_1.taskId = _arg_1.id;
                    };
                    onTaskSweepSure(_arg_1);
                };
            }
            else
            {
                this.taskConfig = {};
                this.reqTime.text = Language.TASKSWEEPPANEL_U[1];
                this.battleCount.text = Language.TASKSWEEPPANEL_U[2];
                this.taskName.text = Language.TASKSWEEPPANEL_U[3];
                this.bagLeft.text = Language.TASKSWEEPPANEL_U[4];
                this.bt0.label = Language.TASKSWEEPPANEL_U[5];
                this.bt0.enabled = false;
                this.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        private function get _taskName():String
        {
            return (this._319812849_taskName);
        }

        public function init():void
        {
            this.task.closeFunc = closePanel;
        }

        public function set reqTime(_arg_1:Label):void
        {
            var _local_2:Object = this._1094713483reqTime;
            if (_local_2 !== _arg_1)
            {
                this._1094713483reqTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bt1():Button
        {
            return (this._97823bt1);
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

        public function __numStepper_change(_arg_1:NumericStepperEvent):void
        {
            changeValue();
        }

        [Bindable(event="propertyChange")]
        public function get bt0():Button
        {
            return (this._97822bt0);
        }

        public function closeSure():void
        {
            this.taskNameInfor.close();
            this.task.parentDocument.hide();
        }

        [Bindable(event="propertyChange")]
        public function get _taskCombox():Array
        {
            return (this._1595506734_taskCombox);
        }

        [Bindable(event="propertyChange")]
        public function get bagLeft():Label
        {
            return (this._344437713bagLeft);
        }

        private function closeHandler(_arg_1:Event):void
        {
            taskConfig = GamePredef.TASK[Number(ComboBox(_arg_1.target).selectedItem.data)];
            taskConfig.st = 0;
            taskConfig.canSelect = true;
            initTaskSweepPanel(taskConfig);
        }

        private function chageSelected():void
        {
            _selected = this.useSweepItem.selected;
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
        public function get battleCount():Label
        {
            return (this._775306441battleCount);
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

        public function __bt0_click(_arg_1:MouseEvent):void
        {
            turnSweep(1);
        }

        public function ___TaskSweepPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            beginInit();
        }

        public function onEndBattle(_arg_1:Object):void
        {
            var _local_2:Charactor;
            if (_arg_1)
            {
                if (_arg_1.flag)
                {
                    sweepFlag = false;
                    if (((_timer) && (_timer.running)))
                    {
                        _timer.removeEventListener(TimerEvent.TIMER, minusTime);
                        _timer.stop();
                    };
                    if (_arg_1.type == 3)
                    {
                        _info = "";
                        _haveBattle = taskConfig.battleCount;
                        introContent1();
                    };
                    if (_arg_1.type == 4)
                    {
                        _info = "";
                        _haveBattle = taskConfig.battleCount;
                        introContent1();
                    };
                    _arg_1.succ = 1;
                    showResult(_arg_1);
                    this.bt0.enabled = true;
                    this.bt1.enabled = true;
                    if (getTaskType(_arg_1.taskId) == 1)
                    {
                        this.taskNameInfor.enabled = true;
                    }
                    else
                    {
                        this.taskNameInfor.enabled = false;
                    };
                    this.bt0.label = Language.TASKSWEEPPANEL_U[5];
                    this.visible = true;
                    _local_2 = _core.getCharactor(_core.cid);
                    if (_local_2)
                    {
                        _local_2.taskSweep = false;
                    };
                    if (((getTaskType(_arg_1.id) == 3) || (getTaskType(_arg_1.taskId) == 3)))
                    {
                        this.battleCount.text = (((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/");
                        this.numStepper.visible = true;
                    };
                    if (getTaskType(_arg_1.id) == 2)
                    {
                        _core.remote.call("getLoopQuestStartTime", null, null);
                    };
                }
                else
                {
                    totalTime = _arg_1.leftTime;
                };
            };
        }

        private function beginInit():void
        {
            var _local_2:*;
            var _local_1:Array = new Array();
            if (GamePredef.TASK)
            {
                for (_local_2 in GamePredef.TASK)
                {
                    if (((((GamePredef.TASK[_local_2]) && (GamePredef.TASK[_local_2].taskName)) && (GamePredef.TASK[_local_2].id)) && (ToolKit.isSmallOrEqual(GamePredef.TASK[_local_2].id, 50))))
                    {
                        _local_1.push({
                            "label":GamePredef.TASK[_local_2].taskName,
                            "data":GamePredef.TASK[_local_2].id
                        });
                    };
                };
            };
            if (((_local_1) && (_local_1.length > _taskCombox.length)))
            {
                _taskCombox = _local_1;
                if (this.taskNameInfor)
                {
                    this.taskNameInfor.dataProvider = _taskCombox;
                };
            };
        }

        public function set _taskCombox(_arg_1:Array):void
        {
            var _local_2:Object = this._1595506734_taskCombox;
            if (_local_2 !== _arg_1)
            {
                this._1595506734_taskCombox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_taskCombox", _local_2, _arg_1));
            };
        }

        public function set bagLeft(_arg_1:Label):void
        {
            var _local_2:Object = this._344437713bagLeft;
            if (_local_2 !== _arg_1)
            {
                this._344437713bagLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagLeft", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get useSweepItem():CheckBox
        {
            return (this._1254200744useSweepItem);
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
                    _info = _info.replace("&#13;<font color='#00EEEE'>Ngân phiếu nhận:<font color='#FFFFFF'>{moneyBind}</font></font>", "");
                };
                _info = (_info + "&#13;----------------");
                _local_2++;
            };
            intro.htmlText = _info;
            this.battleCount.text = ((((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/") + taskConfig.battleCount);
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

        public function set taskNameInfor(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._1159596620taskNameInfor;
            if (_local_2 !== _arg_1)
            {
                this._1159596620taskNameInfor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "taskNameInfor", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numStepper():NumericStepper
        {
            return (this._401559445numStepper);
        }

        public function minusTime(_arg_1:Event):void
        {
            if (((totalTime) && (totalTime >= 0)))
            {
                totalTime--;
                if (_run == "...")
                {
                    _run = "";
                };
                _run = (_run + ".");
                _secToTime(totalTime);
                if ((((((taskConfig.battleCount * (taskConfig.time / 1000)) - totalTime) % (taskConfig.time / 1000)) == 0) && (!((taskConfig.battleCount * (taskConfig.time / 1000)) == totalTime))))
                {
                    _haveBattle = (((taskConfig.battleCount * (taskConfig.time / 1000)) - totalTime) / (taskConfig.time / 1000));
                    introContent();
                    _run = ".";
                };
                if (totalTime == 0)
                {
                    _core.remote.call("taskSweepEnd", null, taskConfig.id, taskConfig.taskIndex);
                    return;
                };
                doTask();
            }
            else
            {
                if (((_timer) && (_timer.running)))
                {
                    _timer.removeEventListener(TimerEvent.TIMER, minusTime);
                    _timer.stop();
                };
            };
        }

        private function introContent():void
        {
            var _local_1:Charactor = _core.getCharactor(_core.cid);
            var _local_2:Number = 0;
            if (((GamePredef.EXP_SWEEP[taskConfig.id]) && (GamePredef.EXP_SWEEP[taskConfig.id][_haveBattle])))
            {
                _local_2 = Math.round((GamePredef.BASIC_GET_EXP[_local_1.level] * GamePredef.EXP_SWEEP[taskConfig.id][_haveBattle]));
            }
            else
            {
                if ((((taskConfig.id) && (getTaskType(taskConfig.id) == 3)) && (taskConfig.exp)))
                {
                    _local_2 = Math.round(taskConfig.exp);
                };
            };
            var _local_3:Number = 0;
            if (((GamePredef.MONEY_SWEEP[taskConfig.id]) && (GamePredef.MONEY_SWEEP[taskConfig.id][_haveBattle])))
            {
                _local_3 = Math.round((GamePredef.BASIC_GET_MONEY[_local_1.level] * GamePredef.MONEY_SWEEP[taskConfig.id][_haveBattle]));
            };
            if ((((_info) && (_local_2)) && (!(_local_2 == 0))))
            {
                _info = ((_info + "&#13;") + Language.TASKSWEEPPANEL_U[18].toString().replace("{num}", _haveBattle).replace("{exp}", _local_2));
            }
            else
            {
                _info = Language.TASKSWEEPPANEL_U[18].toString().replace("{num}", _haveBattle).replace("{exp}", _local_2);
            };
            if ((((_info) && (_local_3)) && (!(_local_3 == 0))))
            {
                _info = _info.replace("{moneyBind}", _local_3);
            }
            else
            {
                _info = _info.replace("&#13;<font color='#00EEEE'>Ngân phiếu nhận:<font color='#FFFFFF'>{moneyBind}</font></font>", "");
            };
            _info = (_info + "&#13;----------------");
            intro.htmlText = _info;
            this.battleCount.text = ((((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/") + taskConfig.battleCount);
        }

        public function set battleCount(_arg_1:Label):void
        {
            var _local_2:Object = this._775306441battleCount;
            if (_local_2 !== _arg_1)
            {
                this._775306441battleCount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleCount", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get intro():IntroText
        {
            return (this._100361836intro);
        }

        private function turnSweep(type:Number):void
        {
            var handler:Function;
            var str:String;
            if ((((taskConfig) && (taskConfig.taskName)) && (taskConfig.id)))
            {
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        if (!sweepFlag)
                        {
                            _core.remote.call("taskSweepSure", new Responder(onTaskSweepSure), taskConfig.id, _selected, taskConfig.battleCount, taskConfig.taskIndex);
                        }
                        else
                        {
                            _core.remote.call("taskSweepCancel", null, taskConfig.id);
                            if (type == 2)
                            {
                                closeSure();
                            };
                        };
                    };
                    if (_arg_1.detail == Alert.NO)
                    {
                    };
                };
                if (_sweepAlert)
                {
                    PopUpManager.removePopUp(_sweepAlert);
                    _sweepAlert = null;
                };
                if (!sweepFlag)
                {
                    str = Language.TASKSWEEPPANEL_U[6];
                    str = str.replace("{money}", taskConfig.money).replace("{taskName}", taskConfig.taskName);
                    if (((getTaskType(taskConfig.id)) && (getTaskType(taskConfig.id) == 3)))
                    {
                        str = Language.TASKSWEEPPANEL_U[31];
                        str = str.replace("{taskName}", taskConfig.taskName);
                    };
                }
                else
                {
                    str = Language.TASKSWEEPPANEL_U[7];
                    str = str.replace("{taskName}", taskConfig.taskName);
                };
                _sweepAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            };
        }

        public function showResult(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:*;
            if (_arg_1)
            {
                if (!taskConfig)
                {
                    taskConfig = GamePredef.TASK[_arg_1.taskId];
                    if (_arg_1.st)
                    {
                        taskConfig.st = _arg_1.st;
                    }
                    else
                    {
                        taskConfig.st = 0;
                    };
                    if (((_arg_1.type) && (_arg_1.type == 2)))
                    {
                        taskConfig.typeflag = 2;
                        if (_arg_1.num)
                        {
                            taskConfig.num = _arg_1.num;
                        };
                    };
                    initTaskSweepPanel(taskConfig);
                    if (((_arg_1.type) && (_arg_1.type == 1)))
                    {
                        _left = "00:00";
                    };
                };
                if (_arg_1.succ)
                {
                    if (_arg_1.succ == 1)
                    {
                        _info = ((_info + "&#13;") + Language.TASKSWEEPPANEL_U[19].toString().replace("{taskName}", taskConfig.taskName));
                    }
                    else
                    {
                        _info = ((_info + "&#13;") + Language.TASKSWEEPPANEL_U[20].toString().replace("{taskName}", taskConfig.taskName));
                    };
                };
                if (_arg_1.expAdd)
                {
                    _local_2 = Language.TASKSWEEPPANEL_U[13];
                    _local_2 = _local_2.replace("{expAdd}", Math.round(_arg_1.expAdd));
                    _info = ((_info + "&#13;") + _local_2);
                };
                if (_arg_1.moneyAdd)
                {
                    _local_3 = Language.TASKSWEEPPANEL_U[14];
                    _local_3 = _local_3.replace("{moneyAdd}", Math.round(_arg_1.moneyAdd));
                    _info = ((_info + "&#13;") + _local_3);
                };
                if (_arg_1.act)
                {
                    _local_4 = Language.TASKSWEEPPANEL_U[15];
                    _local_4 = _local_4.replace("{num}", _arg_1.act);
                    _info = ((_info + "&#13;") + _local_4);
                };
                if (_arg_1.act1)
                {
                    _local_4 = Language.TASKSWEEPPANEL_U[15];
                    _local_4 = _local_4.replace("{num}", _arg_1.act1);
                    _info = ((_info + "&#13;") + _local_4);
                };
                if (_arg_1.eItem)
                {
                    if (_arg_1.eItem)
                    {
                        for (_local_5 in _arg_1.eItem)
                        {
                            if (_arg_1.eItem[_local_5])
                            {
                                getItemInfo(_arg_1.eItem[_local_5]);
                            };
                        };
                    };
                };
                if (((_arg_1.type) && ((_arg_1.type == 1) || (_arg_1.type == 3))))
                {
                    if (_arg_1.item1)
                    {
                        for (_local_5 in _arg_1.item1)
                        {
                            if (_arg_1.item1[_local_5])
                            {
                                getItemInfo(_arg_1.item1[_local_5]);
                            };
                        };
                    };
                    if (_arg_1.item2)
                    {
                        for (_local_5 in _arg_1.item2)
                        {
                            if (_arg_1.item2[_local_5])
                            {
                                getItemInfo(_arg_1.item2[_local_5]);
                            };
                        };
                    };
                    if (_arg_1.item3)
                    {
                        getItemInfo(_arg_1.item3);
                    };
                    if (_arg_1.medal)
                    {
                        getMedalInfo(_arg_1.medal);
                    };
                };
            };
            intro.htmlText = _info;
            _info = "";
            _haveBattle = 0;
        }

        public function onTaskSweepSure(_arg_1:Object):void
        {
            var _local_2:Charactor;
            if (((_arg_1) && (_arg_1.taskId)))
            {
                if ((((_arg_1.taskId) && (getTaskType(_arg_1.taskId) == 2)) || ((_arg_1.id) && (getTaskType(_arg_1.id) == 2))))
                {
                    _core.remote.call("getLoopQuestStartTime", null, null);
                };
                this.numStepper.visible = false;
                if ((((_arg_1.st) && (_arg_1.st == 0)) || (!(_arg_1.st))))
                {
                    totalTime = ((this.taskConfig.battleCount * this.taskConfig.time) / 1000);
                    this.battleCount.text = ((Language.TASKSWEEPPANEL_U[2] + ": 0/") + this.taskConfig.battleCount);
                };
                if (((_timer) && (_timer.running)))
                {
                    _timer.removeEventListener(TimerEvent.TIMER, minusTime);
                    _timer.stop();
                };
                _timer.addEventListener(TimerEvent.TIMER, minusTime);
                _timer.start();
                sweepFlag = true;
                this.bt0.enabled = true;
                this.bt1.enabled = true;
                if (((_arg_1.id) && (_arg_1.taskName)))
                {
                    replaceIndex(_arg_1.id, _arg_1.taskName, getTaskType(_arg_1.taskId));
                };
                this.taskNameInfor.enabled = false;
                this.bt0.label = Language.TASKSWEEPPANEL_U[8];
                _local_2 = _core.getCharactor(_core.cid);
                if (_local_2)
                {
                    _local_2.taskSweep = true;
                };
            };
        }

        public function replaceIndex(_arg_1:int, _arg_2:String, _arg_3:int):void
        {
            var _local_5:*;
            var _local_4:Array = new Array();
            if (_arg_3 == 1)
            {
                _local_5 = 0;
                while (_local_5 < _taskCombox.length)
                {
                    if ((((_taskCombox[_local_5]) && (_taskCombox[_local_5].data)) && (_taskCombox[_local_5].data == _arg_1)))
                    {
                        _local_4.push(_taskCombox[_local_5]);
                    };
                    _local_5++;
                };
                _local_5 = 0;
                while (_local_5 < _taskCombox.length)
                {
                    if ((((_taskCombox[_local_5]) && (_taskCombox[_local_5].data)) && (!(_taskCombox[_local_5].data == _arg_1))))
                    {
                        _local_4.push(_taskCombox[_local_5]);
                    };
                    _local_5++;
                };
                if (_local_4.length == _taskCombox.length)
                {
                    _taskCombox = _local_4;
                    this.taskNameInfor.dataProvider = _taskCombox;
                };
            }
            else
            {
                if (_arg_3 == 2)
                {
                    _local_5 = 0;
                    while (_local_5 < _taskCombox1.length)
                    {
                        if ((((_taskCombox1[_local_5]) && (_taskCombox1[_local_5].data)) && (_taskCombox1[_local_5].data == _arg_1)))
                        {
                            _local_4.push(_taskCombox1[_local_5]);
                        };
                        _local_5++;
                    };
                    _local_5 = 0;
                    while (_local_5 < _taskCombox1.length)
                    {
                        if ((((_taskCombox1[_local_5]) && (_taskCombox1[_local_5].data)) && (!(_taskCombox1[_local_5].data == _arg_1))))
                        {
                            _local_4.push(_taskCombox1[_local_5]);
                        };
                        _local_5++;
                    };
                    if (_local_4.length == _taskCombox1.length)
                    {
                        _taskCombox1 = _local_4;
                        this.taskNameInfor.dataProvider = _taskCombox1;
                    };
                }
                else
                {
                    if (_arg_3 == 3)
                    {
                        _local_5 = 0;
                        while (_local_5 < _taskCombox2.length)
                        {
                            if ((((_taskCombox2[_local_5]) && (_taskCombox2[_local_5].data)) && (_taskCombox2[_local_5].data == _arg_1)))
                            {
                                _local_4.push(_taskCombox2[_local_5]);
                            };
                            _local_5++;
                        };
                        _local_5 = 0;
                        while (_local_5 < _taskCombox2.length)
                        {
                            if ((((_taskCombox2[_local_5]) && (_taskCombox2[_local_5].data)) && (!(_taskCombox2[_local_5].data == _arg_1))))
                            {
                                _local_4.push(_taskCombox2[_local_5]);
                            };
                            _local_5++;
                        };
                        if (_local_4.length == _taskCombox2.length)
                        {
                            _taskCombox2 = _local_4;
                            this.taskNameInfor.dataProvider = _taskCombox2;
                        };
                    };
                };
            };
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
            var target:TaskSweepPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TaskSweepPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TaskSweepPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get reqTime():Label
        {
            return (this._1094713483reqTime);
        }

        [Bindable(event="propertyChange")]
        public function get task():BasicTitleCanvas
        {
            return (this._3552645task);
        }

        public function __bt1_click(_arg_1:MouseEvent):void
        {
            turnSweepRight("");
        }

        private function changeValue():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:String;
            var _local_4:Number;
            if (((this.numStepper.value) && (this.numStepper.value > 0)))
            {
                this.taskConfig.battleCount = Number(this.numStepper.value);
                _local_1 = Math.floor((taskConfig.battleCount * (taskConfig.time / 60000)));
                totalTime = ((taskConfig.battleCount * taskConfig.time) / 1000);
                if (((taskConfig.st) && (!(taskConfig.st == 0))))
                {
                    totalTime = Math.round((((taskConfig.battleCount * taskConfig.time) - taskConfig.st) / 1000));
                    if (totalTime < 0)
                    {
                        totalTime = 2;
                    };
                    _haveBattle = Math.floor((taskConfig.st / taskConfig.time));
                    if (totalTime == 2)
                    {
                        _haveBattle = (int(taskConfig.battleCount) - int(1));
                    };
                    if (_haveBattle > 0)
                    {
                    };
                };
                _local_1 = Math.floor((totalTime / 60));
                _local_2 = 0;
                _local_3 = "00";
                _local_4 = 0;
                if (_local_1 >= 60)
                {
                    _local_2 = Math.floor((_local_1 / 60));
                    _local_1 = (_local_1 % 60);
                    _local_4 = Math.abs((totalTime % 60));
                }
                else
                {
                    if (_local_1 >= 0)
                    {
                        _local_4 = Math.abs((totalTime % 60));
                    };
                };
                if (_local_4)
                {
                    if (_local_4 >= 10)
                    {
                        _local_3 = String(_local_4);
                    }
                    else
                    {
                        if (_local_4 >= 0)
                        {
                            _local_3 = ("0" + String(_local_4));
                        };
                    };
                };
                if (_local_2 == 0)
                {
                    this.time.setStyle("fontSize", "50");
                    this.time.x = 281.5;
                    if (_local_1 <= 9)
                    {
                        _left = ((("0" + _local_1) + ":") + _local_3);
                    }
                    else
                    {
                        _left = ((_local_1 + ":") + _local_3);
                    };
                }
                else
                {
                    this.time.setStyle("fontSize", "47");
                    this.time.x = 270.5;
                    if (_local_1 <= 9)
                    {
                        _left = ((((_local_2 + ":0") + _local_1) + ":") + _local_3);
                    }
                    else
                    {
                        _left = ((((_local_2 + ":") + _local_1) + ":") + _local_3);
                    };
                };
            };
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

        private function _TaskSweepPanel_bindingsSetup():Array
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
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                reqTime.filters = _arg_1;
            }, "reqTime.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                battleCount.filters = _arg_1;
            }, "battleCount.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                taskName.filters = _arg_1;
            }, "taskName.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt0.label = _arg_1;
            }, "bt0.label");
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
                bagLeft.filters = _arg_1;
            }, "bagLeft.filters");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                bagLeft0.filters = _arg_1;
            }, "bagLeft0.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bt1.label = _arg_1;
            }, "bt1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useSweepItem.label = _arg_1;
            }, "useSweepItem.label");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                useSweepItem.filters = _arg_1;
            }, "useSweepItem.filters");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TASKSWEEPPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useSweepItem.toolTip = _arg_1;
            }, "useSweepItem.toolTip");
            result[11] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get taskName():Label
        {
            return (this._410330704taskName);
        }

        [Bindable(event="propertyChange")]
        public function get taskNameInfor():ComboBox
        {
            return (this._1159596620taskNameInfor);
        }

        public function clickTaskSweep(_arg_1:Number):void
        {
            if (_arg_1 == 1)
            {
                _core.remote.call("initTaskSweepPanelByClient", null, 1616, 0, 1, _arg_1);
            };
        }

        public function __useSweepItem_click(_arg_1:MouseEvent):void
        {
            chageSelected();
        }

        public function set bagLeft0(_arg_1:Label):void
        {
            var _local_2:Object = this._2087634463bagLeft0;
            if (_local_2 !== _arg_1)
            {
                this._2087634463bagLeft0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bagLeft0", _local_2, _arg_1));
            };
        }

        public function set useSweepItem(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._1254200744useSweepItem;
            if (_local_2 !== _arg_1)
            {
                this._1254200744useSweepItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useSweepItem", _local_2, _arg_1));
            };
        }

        public function __taskNameInfor_close(_arg_1:DropdownEvent):void
        {
            closeHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get time():Label
        {
            return (this._3560141time);
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

        public function set numStepper(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._401559445numStepper;
            if (_local_2 !== _arg_1)
            {
                this._401559445numStepper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numStepper", _local_2, _arg_1));
            };
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

        public function __task_creationComplete(_arg_1:FlexEvent):void
        {
            init();
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

        private function onGetTaskBattleTime(_arg_1:Object):void
        {
            _finishFlag = true;
        }

        public function onTaskSweepCancel(_arg_1:Object):void
        {
            sweepFlag = false;
            if (((_timer) && (_timer.running)))
            {
                _timer.removeEventListener(TimerEvent.TIMER, minusTime);
                _timer.stop();
            };
            _arg_1.succ = 2;
            showResult(_arg_1);
            this.bt0.enabled = true;
            this.bt0.label = Language.TASKSWEEPPANEL_U[5];
            this.bt1.enabled = true;
            if (getTaskType(_arg_1.taskId) == 1)
            {
                this.taskNameInfor.enabled = true;
            }
            else
            {
                this.taskNameInfor.enabled = false;
            };
            this.visible = true;
            var _local_2:Charactor = _core.getCharactor(_core.cid);
            if (((getTaskType(_arg_1.id) == 3) || (getTaskType(_arg_1.taskId) == 3)))
            {
                this.battleCount.text = (((Language.TASKSWEEPPANEL_U[2] + ": ") + _haveBattle) + "/");
                this.numStepper.visible = true;
            };
            if (_local_2)
            {
                _local_2.taskSweep = false;
            };
        }

        private function _TaskSweepPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _taskName;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TASKSWEEPPANEL_U[5];
            _local_1 = _left;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TASKSWEEPPANEL_U[25];
            _local_1 = Language.TASKSWEEPPANEL_U[27];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.TASKSWEEPPANEL_U[28];
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

        [Bindable(event="propertyChange")]
        private function get _left():String
        {
            return (this._91052262_left);
        }

        [Bindable(event="propertyChange")]
        public function get bagLeft0():Label
        {
            return (this._2087634463bagLeft0);
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


    }
}//package com.qeedoo.ui.view.compDragable

