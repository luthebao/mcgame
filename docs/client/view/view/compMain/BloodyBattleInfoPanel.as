// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.BloodyBattleInfoPanel

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.DataGrid;
    import mx.controls.Button;
    import flash.utils.Timer;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.net.Responder;
    import flash.events.Event;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
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

    public class BloodyBattleInfoPanel extends Canvas implements IBindingClient 
    {

        private static const totolNum:int = 56;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1479413766lastCreNum:Label;
        private var _255818474rankList:DataGrid;
        private var _state:int;
        public var _BloodyBattleInfoPanel_Button1:Button;
        private var _1535831509openTiShi:Button;
        private var _1459413373lastTime:Label;
        private var _1702613338selfScore:Label;
        private var _763223204rankCanvas:Canvas;
        private var _timer:Timer;
        private var _1945394728infoLbl:Label;
        private var _lastTime:int;
        private var _2072063257closeTiShi:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":360,
                    "height":389,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"rankCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":300,
                                "height":378,
                                "styleName":"StandardContent",
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "x":50,
                                "y":2,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":276,
                                            "height":234,
                                            "styleName":"CanvasBorder",
                                            "x":13,
                                            "y":35,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"rankList",
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "width":374,
                                                        "height":274,
                                                        "x":9,
                                                        "y":7,
                                                        "columns":[_BloodyBattleInfoPanel_DataGridColumn1_c(), _BloodyBattleInfoPanel_DataGridColumn2_c(), _BloodyBattleInfoPanel_DataGridColumn3_c()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lastCreNum",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.bottom = "60";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":12});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"infoLbl",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                        this.bottom = "40";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":13});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lastTime",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.bottom = "20";
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"x":13});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":DelayButton,
                                    "events":{"click":"___BloodyBattleInfoPanel_DelayButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdGreen",
                                            "label":"卡号自救",
                                            "y":341,
                                            "x":214
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "text":"个人积分：",
                                            "y":277
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"selfScore",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":277,
                                            "text":"0"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_BloodyBattleInfoPanel_Button1",
                                    "events":{"click":"___BloodyBattleInfoPanel_Button1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":317,
                                            "x":214,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"openTiShi",
                        "events":{"click":"__openTiShi_click"},
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-7";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"EquipBagLeft",
                                "x":346,
                                "width":11,
                                "height":131,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"closeTiShi",
                        "events":{"click":"__closeTiShi_click"},
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-8";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"EquipBagRight",
                                "x":42,
                                "width":11,
                                "height":131,
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___BloodyBattleInfoPanel_Button4_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":2,
                                "x":-2,
                                "styleName":"BtnWbQuit",
                                "height":50,
                                "width":50
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

        public function BloodyBattleInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 360;
            this.height = 389;
            this.clipContent = false;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BloodyBattleInfoPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get lastTime():Label
        {
            return (this._1459413373lastTime);
        }

        [Bindable(event="propertyChange")]
        public function get lastCreNum():Label
        {
            return (this._1479413766lastCreNum);
        }

        public function ___BloodyBattleInfoPanel_Button1_click(_arg_1:MouseEvent):void
        {
            showBattle();
        }

        public function set lastTime(_arg_1:Label):void
        {
            var _local_2:Object = this._1459413373lastTime;
            if (_local_2 !== _arg_1)
            {
                this._1459413373lastTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastTime", _local_2, _arg_1));
            };
        }

        public function set lastCreNum(_arg_1:Label):void
        {
            var _local_2:Object = this._1479413766lastCreNum;
            if (_local_2 !== _arg_1)
            {
                this._1479413766lastCreNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastCreNum", _local_2, _arg_1));
            };
        }

        private function showBattle():void
        {
            _core.view.changeVisible(ViewManager.PANEL_BATTLESET);
            _core.view.getUI(ViewManager.PANEL_BATTLESET).updateView();
        }

        override public function initialize():void
        {
            var target:BloodyBattleInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BloodyBattleInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_BloodyBattleInfoPanelWatcherSetupUtil");
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

        public function __closeTiShi_click(_arg_1:MouseEvent):void
        {
            openCloseCanvas(1);
        }

        [Bindable(event="propertyChange")]
        public function get selfScore():Label
        {
            return (this._1702613338selfScore);
        }

        public function set openTiShi(_arg_1:Button):void
        {
            var _local_2:Object = this._1535831509openTiShi;
            if (_local_2 !== _arg_1)
            {
                this._1535831509openTiShi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openTiShi", _local_2, _arg_1));
            };
        }

        public function updateBloodyBattlePanel(_arg_1:Object):void
        {
            if (!initialized)
            {
                return;
            };
            _core.remote.call("getBBPersonalScore", new Responder(onGetPersonalScore), _core.cid);
            var _local_2:int = _arg_1["state"];
            _state = _local_2;
            var _local_3:Number = _arg_1["curHp"];
            var _local_4:Array = _arg_1["rank"];
            rankList.dataProvider = _local_4;
            _lastTime = int(_arg_1["lastTime"]);
            var _local_5:int = int(_arg_1["lastCreNum"]);
            if (((_local_2 == 3) || (_local_2 == 4)))
            {
                lastCreNum.text = ((("剩余怪物数量：" + _local_5) + "/") + totolNum);
            }
            else
            {
                if (_local_2 == 5)
                {
                    lastCreNum.text = ("BOSS剩余血量：" + Math.ceil(_local_3));
                }
                else
                {
                    if (_local_2 == 2)
                    {
                        lastCreNum.text = "";
                    };
                };
            };
            if (((_local_2 == 3) || (_local_2 == 4)))
            {
                infoLbl.text = "(击杀所有怪物可以进入下一阶段)";
            }
            else
            {
                if (_local_2 == 5)
                {
                    infoLbl.text = "(最后一击的玩家可获得额外奖励)";
                }
                else
                {
                    if (_local_2 == 2)
                    {
                        infoLbl.text = "目前为准备阶段，可自由组队";
                    };
                };
            };
            updateActTimer();
        }

        public function updateActLastTime(_arg_1:Event):*
        {
            _lastTime--;
            var _local_2:int = int((_lastTime / 3600));
            var _local_3:int = int(((_lastTime % 3600) / 60));
            var _local_4:int = ((_lastTime % 3600) % 60);
            lastTime.text = ((("活动剩余时间：" + "0") + _local_2) + ":");
            if (_local_3 < 10)
            {
                lastTime.text = (((lastTime.text + "0") + _local_3) + ":");
            }
            else
            {
                lastTime.text = ((lastTime.text + _local_3) + ":");
            };
            if (_local_4 < 10)
            {
                lastTime.text = ((lastTime.text + "0") + _local_4);
            }
            else
            {
                lastTime.text = (lastTime.text + _local_4);
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoLbl():Label
        {
            return (this._1945394728infoLbl);
        }

        private function _BloodyBattleInfoPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "排名";
            _local_1.dataField = "rank";
            return (_local_1);
        }

        private function _BloodyBattleInfoPanel_DataGridColumn3_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "积分";
            _local_1.dataField = "score";
            return (_local_1);
        }

        private function leaveBB():void
        {
            var func:Function;
            if (_core.player.isDead)
            {
                Alert.show("死亡状态无法退出");
                return;
            };
            if (_state != 2)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("bbLeaveScene", null);
                    };
                };
                Alert.show("现在已经过了准备阶段，退出场景后无法返回，你确定要退出吗？", "", (Alert.YES | Alert.CANCEL), null, func);
            }
            else
            {
                _core.remote.call("bbLeaveScene", null);
            };
        }

        private function _BloodyBattleInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MINIMAPCANVAS_U[18];
        }

        public function updateActTimer():*
        {
            var _local_1:int;
            if (!_timer)
            {
                _local_1 = (1 * 1000);
                _timer = new Timer(_local_1, 0);
                _timer.addEventListener(TimerEvent.TIMER, updateActLastTime);
                _timer.start();
            };
        }

        public function __openTiShi_click(_arg_1:MouseEvent):void
        {
            openCloseCanvas(0);
        }

        public function set rankCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._763223204rankCanvas;
            if (_local_2 !== _arg_1)
            {
                this._763223204rankCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankCanvas", _local_2, _arg_1));
            };
        }

        public function openCloseCanvas(_arg_1:int):void
        {
            if (_arg_1 == 0)
            {
                show();
                rankCanvas.visible = true;
                closeTiShi.visible = true;
                openTiShi.visible = false;
            }
            else
            {
                if (_arg_1 == 1)
                {
                    rankCanvas.visible = false;
                    closeTiShi.visible = false;
                    openTiShi.visible = true;
                };
            };
        }

        public function set closeTiShi(_arg_1:Button):void
        {
            var _local_2:Object = this._2072063257closeTiShi;
            if (_local_2 !== _arg_1)
            {
                this._2072063257closeTiShi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeTiShi", _local_2, _arg_1));
            };
        }

        public function ___BloodyBattleInfoPanel_Button4_click(_arg_1:MouseEvent):void
        {
            leaveBB();
        }

        public function set rankList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._255818474rankList;
            if (_local_2 !== _arg_1)
            {
                this._255818474rankList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get openTiShi():Button
        {
            return (this._1535831509openTiShi);
        }

        private function _BloodyBattleInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MINIMAPCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BloodyBattleInfoPanel_Button1.label = _arg_1;
            }, "_BloodyBattleInfoPanel_Button1.label");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get rankCanvas():Canvas
        {
            return (this._763223204rankCanvas);
        }

        public function set infoLbl(_arg_1:Label):void
        {
            var _local_2:Object = this._1945394728infoLbl;
            if (_local_2 !== _arg_1)
            {
                this._1945394728infoLbl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLbl", _local_2, _arg_1));
            };
        }

        public function ___BloodyBattleInfoPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            saveSelf();
        }

        [Bindable(event="propertyChange")]
        public function get closeTiShi():Button
        {
            return (this._2072063257closeTiShi);
        }

        private function saveSelf():void
        {
            _core.remote.call("bbTransToSafe", null);
        }

        [Bindable(event="propertyChange")]
        public function get rankList():DataGrid
        {
            return (this._255818474rankList);
        }

        public function set selfScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1702613338selfScore;
            if (_local_2 !== _arg_1)
            {
                this._1702613338selfScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfScore", _local_2, _arg_1));
            };
        }

        private function _BloodyBattleInfoPanel_DataGridColumn2_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "姓名";
            _local_1.width = 250;
            _local_1.dataField = "name";
            return (_local_1);
        }

        private function onGetPersonalScore(_arg_1:Number):void
        {
            if (_arg_1)
            {
                selfScore.text = String(_arg_1);
            };
        }

        public function show():void
        {
            visible = true;
            _core.remote.call("getBloodyBattleInfo", new Responder(updateBloodyBattlePanel));
        }


    }
}//package com.qeedoo.ui.view.compMain

