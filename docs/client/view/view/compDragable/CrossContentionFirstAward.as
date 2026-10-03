// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionFirstAward

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.DataGrid;
    import mx.controls.Alert;
    import mx.controls.Label;
    import mx.controls.LinkButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import mx.binding.BindingManager;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.managers.PopUpManager;
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

    public class CrossContentionFirstAward extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _132537978firstData:DataGrid;
        public var areaId:int = 0;
        private var _helpAlert:Alert;
        public var mapId:int = 0;
        private var _3237038info:Label;
        public var _CrossContentionFirstAward_LinkButton1:LinkButton;
        public var _CrossContentionFirstAward_DataGridColumn1:DataGridColumn;
        public var _CrossContentionFirstAward_DataGridColumn2:DataGridColumn;
        public var _CrossContentionFirstAward_DataGridColumn3:DataGridColumn;
        public var _CrossContentionFirstAward_DataGridColumn4:DataGridColumn;
        public var _CrossContentionFirstAward_DataGridColumn5:DataGridColumn;
        public var _CrossContentionFirstAward_DataGridColumn6:DataGridColumn;
        public var isBoss:Boolean = false;
        private var _2132384574btnPointsAward:BasicDelayButton;
        public var _CrossContentionFirstAward_Label1:Label;
        public var _CrossContentionFirstAward_Label2:Label;
        public var _CrossContentionFirstAward_Label3:Label;
        public var _CrossContentionFirstAward_Label4:Label;
        private var _109412162tInfo:Canvas;
        private var _255229216totleScore:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":625,
                    "height":500,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "50";
                            this.bottom = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"tInfo",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_CrossContentionFirstAward_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.top = "5";
                                                    this.fontSize = 16;
                                                    this.color = 0xFFFF00;
                                                    this.fontWeight = "bold";
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"firstData",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.top = "40";
                                                    this.textAlign = "center";
                                                    this.fontSize = 16;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "sortableColumns":false,
                                                        "selectable":false,
                                                        "height":350,
                                                        "width":570,
                                                        "headerHeight":25,
                                                        "columns":[_CrossContentionFirstAward_DataGridColumn1_i(), _CrossContentionFirstAward_DataGridColumn2_i(), _CrossContentionFirstAward_DataGridColumn3_i(), _CrossContentionFirstAward_DataGridColumn4_i(), _CrossContentionFirstAward_DataGridColumn5_i(), _CrossContentionFirstAward_DataGridColumn6_i()]
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionFirstAward_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "470";
                                        this.fontSize = 14;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":75});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionFirstAward_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "530";
                                        this.fontSize = 14;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                        this.bottom = "10";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionFirstAward_Label4",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "5";
                                        this.bottom = "10";
                                        this.fontWeight = "bold";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.verticalCenter = "0";
                                        this.textAlign = "center";
                                        this.color = 0xFFFF00;
                                        this.fontSize = 20;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"percentWidth":100});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"btnPointsAward",
                        "events":{"click":"__btnPointsAward_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "8";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnStdRed"});
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_CrossContentionFirstAward_LinkButton1",
                        "events":{"click":"___CrossContentionFirstAward_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "20";
                            this.bottom = "5";
                            this.color = 0xFFE600;
                            this.textDecoration = "underline";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":78});
                        }
                    })]
                });
            }
        });
        public var mapData:Object = new Object();
        private var _core:Core = Core.getInstance();
        private var myStateList:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionFirstAward()
        {
            mx_internal::_document = this;
            this.width = 625;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionFirstAward_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionFirstAward._watcherSetupUtil = _arg_1;
        }


        public function set firstData(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._132537978firstData;
            if (_local_2 !== _arg_1)
            {
                this._132537978firstData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstData", _local_2, _arg_1));
            };
        }

        private function getFirstAward():void
        {
            _core.remote.call("crossContentionGetFirstOccupyAward", new Responder(onGetFirstOccupyAward));
        }

        public function set tInfo(_arg_1:Canvas):void
        {
            var _local_2:Object = this._109412162tInfo;
            if (_local_2 !== _arg_1)
            {
                this._109412162tInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tInfo", _local_2, _arg_1));
            };
        }

        private function _CrossContentionFirstAward_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionFirstAward_DataGridColumn2 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num1";
            _local_1.setStyle("color", 0xFFFFFF);
            BindingManager.executeBindings(this, "_CrossContentionFirstAward_DataGridColumn2", _CrossContentionFirstAward_DataGridColumn2);
            return (_local_1);
        }

        public function onGetFirstOccupyAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[87]);
            }
            else
            {
                if (_arg_1.data)
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[_arg_1.data]);
                }
                else
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[88]);
                };
            };
        }

        private function _CrossContentionFirstAward_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionFirstAward_DataGridColumn4 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num3";
            _local_1.setStyle("color", 0xFF);
            BindingManager.executeBindings(this, "_CrossContentionFirstAward_DataGridColumn4", _CrossContentionFirstAward_DataGridColumn4);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:CrossContentionFirstAward;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionFirstAward_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionFirstAwardWatcherSetupUtil");
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

        private function _CrossContentionFirstAward_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionFirstAward_DataGridColumn6 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num5";
            _local_1.setStyle("color", 16744512);
            BindingManager.executeBindings(this, "_CrossContentionFirstAward_DataGridColumn6", _CrossContentionFirstAward_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get totleScore():int
        {
            return (this._255229216totleScore);
        }

        [Bindable(event="propertyChange")]
        public function get tInfo():Canvas
        {
            return (this._109412162tInfo);
        }

        public function __btnPointsAward_click(_arg_1:MouseEvent):void
        {
            getFirstAward();
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        public function ___CrossContentionFirstAward_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get btnPointsAward():BasicDelayButton
        {
            return (this._2132384574btnPointsAward);
        }

        private function set totleScore(_arg_1:int):void
        {
            var _local_2:Object = this._255229216totleScore;
            if (_local_2 !== _arg_1)
            {
                this._255229216totleScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totleScore", _local_2, _arg_1));
            };
        }

        public function open(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:String;
            var _local_10:Array;
            var _local_11:int;
            info.visible = true;
            tInfo.visible = false;
            visible = true;
            if (!_arg_1)
            {
                return;
            };
            myStateList.removeAll();
            var _local_2:Object = {};
            for (_local_3 in _arg_1)
            {
                _local_5 = CrossContentionTotalPanel._crossContentionGetPridMid(Number(_local_3));
                if (!_local_2[_local_5])
                {
                    _local_2[_local_5] = {};
                };
                for (_local_6 in _arg_1[_local_3])
                {
                    _local_7 = _arg_1[_local_3][_local_6];
                    if (((_local_6) && (_local_7)))
                    {
                        if (!_local_2[_local_5][_local_6])
                        {
                            _local_2[_local_5][_local_6] = 0;
                        };
                        _local_2[_local_5][_local_6] = (_local_2[_local_5][_local_6] + _local_7);
                    };
                };
            };
            totleScore = 0;
            for (_local_4 in _local_2)
            {
                _local_8 = _local_2[_local_4];
                _local_9 = GamePredef.CROSS_CONTENTION_MAP[_local_4].name;
                _local_10 = [0, 0, 0, 0, 0, 0];
                if (_local_8[1])
                {
                    _local_10[1] = _local_8[1];
                };
                if (_local_8[2])
                {
                    _local_10[2] = _local_8[2];
                };
                if (_local_8[3])
                {
                    _local_10[3] = _local_8[3];
                };
                if (_local_8[4])
                {
                    _local_10[4] = _local_8[4];
                };
                if (_local_8[5])
                {
                    _local_10[5] = _local_8[5];
                };
                _local_11 = ((((_local_10[1] + _local_10[2]) + _local_10[3]) + _local_10[4]) + _local_10[5]);
                info.visible = false;
                tInfo.visible = true;
                myStateList.addItem({
                    "aname":_local_9,
                    "num1":(_local_10[1] / GamePredef.CROSS_CONTENTION_P_DATA[1].score),
                    "num2":(_local_10[2] / GamePredef.CROSS_CONTENTION_P_DATA[2].score),
                    "num3":(_local_10[3] / GamePredef.CROSS_CONTENTION_P_DATA[3].score),
                    "num4":(_local_10[4] / GamePredef.CROSS_CONTENTION_P_DATA[4].score),
                    "num5":(_local_10[5] / GamePredef.CROSS_CONTENTION_P_DATA[5].score),
                    "totle":_local_11
                });
                totleScore = (totleScore + _local_11);
            };
            totleScore;
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[133].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[133].toString(), Alert.YES, null, null);
        }

        public function set btnPointsAward(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._2132384574btnPointsAward;
            if (_local_2 !== _arg_1)
            {
                this._2132384574btnPointsAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPointsAward", _local_2, _arg_1));
            };
        }

        private function _CrossContentionFirstAward_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionFirstAward_DataGridColumn1 = _local_1;
            _local_1.width = 110;
            _local_1.dataField = "aname";
            _local_1.setStyle("color", 0xFFFFFF);
            BindingManager.executeBindings(this, "_CrossContentionFirstAward_DataGridColumn1", _CrossContentionFirstAward_DataGridColumn1);
            return (_local_1);
        }

        private function _CrossContentionFirstAward_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionFirstAward_DataGridColumn3 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num2";
            _local_1.setStyle("color", 0x8000);
            BindingManager.executeBindings(this, "_CrossContentionFirstAward_DataGridColumn3", _CrossContentionFirstAward_DataGridColumn3);
            return (_local_1);
        }

        private function _CrossContentionFirstAward_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionFirstAward_DataGridColumn5 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num4";
            _local_1.setStyle("color", 8421631);
            BindingManager.executeBindings(this, "_CrossContentionFirstAward_DataGridColumn5", _CrossContentionFirstAward_DataGridColumn5);
            return (_local_1);
        }

        public function ___CrossContentionFirstAward_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
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

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        private function _CrossContentionFirstAward_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[82];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[83];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_Label1.text = _arg_1;
            }, "_CrossContentionFirstAward_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (myStateList);
            }, function (_arg_1:Object):void
            {
                firstData.dataProvider = _arg_1;
            }, "firstData.dataProvider");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[105];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_DataGridColumn1.headerText = _arg_1;
            }, "_CrossContentionFirstAward_DataGridColumn1.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_DataGridColumn2.headerText = _arg_1;
            }, "_CrossContentionFirstAward_DataGridColumn2.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_DataGridColumn3.headerText = _arg_1;
            }, "_CrossContentionFirstAward_DataGridColumn3.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_DataGridColumn4.headerText = _arg_1;
            }, "_CrossContentionFirstAward_DataGridColumn4.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_DataGridColumn5.headerText = _arg_1;
            }, "_CrossContentionFirstAward_DataGridColumn5.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_DataGridColumn6.headerText = _arg_1;
            }, "_CrossContentionFirstAward_DataGridColumn6.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.CROSS_CONTENTION_PANEL_U[84] + ":");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_Label2.text = _arg_1;
            }, "_CrossContentionFirstAward_Label2.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = totleScore;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_Label3.text = _arg_1;
            }, "_CrossContentionFirstAward_Label3.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[85];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_Label4.text = _arg_1;
            }, "_CrossContentionFirstAward_Label4.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[108];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.text = _arg_1;
            }, "info.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPointsAward.label = _arg_1;
            }, "btnPointsAward.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionFirstAward_LinkButton1.label = _arg_1;
            }, "_CrossContentionFirstAward_LinkButton1.label");
            result[14] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get firstData():DataGrid
        {
            return (this._132537978firstData);
        }

        private function _CrossContentionFirstAward_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[82];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[83];
            _local_1 = myStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[105];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[68];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[69];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[70];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[71];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[72];
            _local_1 = (Language.CROSS_CONTENTION_PANEL_U[84] + ":");
            _local_1 = totleScore;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[85];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[108];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[86];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[46];
        }


    }
}//package com.qeedoo.ui.view.compDragable

