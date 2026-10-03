// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionTimeAward

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.LinkButton;
    import mx.controls.DataGrid;
    import mx.controls.Label;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.managers.PopUpManager;
    import flash.net.Responder;
    import mx.events.FlexEvent;
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

    public class CrossContentionTimeAward extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1287834292panelTitle:BasicTitleCanvas;
        public var _CrossContentionTimeAward_LinkButton1:LinkButton;
        public var areaId:int = 0;
        private var _62409574ContentionSingleState:DataGrid;
        public var _CrossContentionTimeAward_Label1:Label;
        public var _CrossContentionTimeAward_DataGridColumn2:DataGridColumn;
        public var _CrossContentionTimeAward_DataGridColumn3:DataGridColumn;
        public var _CrossContentionTimeAward_DataGridColumn4:DataGridColumn;
        public var _CrossContentionTimeAward_DataGridColumn5:DataGridColumn;
        public var _CrossContentionTimeAward_DataGridColumn6:DataGridColumn;
        private var _3237038info:Label;
        private var _helpAlert:Alert;
        public var mapId:int = 0;
        public var isBoss:Boolean = false;
        private var _2132384574btnPointsAward:BasicDelayButton;
        private var _109412162tInfo:Canvas;
        public var _CrossContentionTimeAward_Label2:Label;

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
                            this.top = "40";
                            this.bottom = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionTimeAward_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.textAlign = "center";
                                        this.fontSize = 16;
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "height":21,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"tInfo",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"ContentionSingleState",
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
                                                        "selectable":false,
                                                        "height":350,
                                                        "width":570,
                                                        "headerHeight":25,
                                                        "columns":[_CrossContentionTimeAward_DataGridColumn1_c(), _CrossContentionTimeAward_DataGridColumn2_i(), _CrossContentionTimeAward_DataGridColumn3_i(), _CrossContentionTimeAward_DataGridColumn4_i(), _CrossContentionTimeAward_DataGridColumn5_i(), _CrossContentionTimeAward_DataGridColumn6_i()]
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionTimeAward_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "5";
                                        this.bottom = "5";
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
                        "id":"_CrossContentionTimeAward_LinkButton1",
                        "events":{"click":"___CrossContentionTimeAward_LinkButton1_click"},
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

        public function CrossContentionTimeAward()
        {
            mx_internal::_document = this;
            this.width = 625;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionTimeAward_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionTimeAward._watcherSetupUtil = _arg_1;
        }


        private function _CrossContentionTimeAward_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTimeAward_DataGridColumn5 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num4";
            _local_1.setStyle("color", 8421631);
            BindingManager.executeBindings(this, "_CrossContentionTimeAward_DataGridColumn5", _CrossContentionTimeAward_DataGridColumn5);
            return (_local_1);
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

        private function _CrossContentionTimeAward_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[110];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[104];
            _local_1 = myStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[68];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[69];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[70];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[71];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[72];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[126];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[108];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[86];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[46];
        }

        override public function initialize():void
        {
            var target:CrossContentionTimeAward;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionTimeAward_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionTimeAwardWatcherSetupUtil");
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

        public function __btnPointsAward_click(_arg_1:MouseEvent):void
        {
            getTimeAward();
        }

        [Bindable(event="propertyChange")]
        public function get ContentionSingleState():DataGrid
        {
            return (this._62409574ContentionSingleState);
        }

        private function init():void
        {
        }

        public function set ContentionSingleState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._62409574ContentionSingleState;
            if (_local_2 !== _arg_1)
            {
                this._62409574ContentionSingleState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionSingleState", _local_2, _arg_1));
            };
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

        public function ___CrossContentionTimeAward_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        private function _CrossContentionTimeAward_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTimeAward_DataGridColumn4 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num3";
            _local_1.setStyle("color", 0xFF);
            BindingManager.executeBindings(this, "_CrossContentionTimeAward_DataGridColumn4", _CrossContentionTimeAward_DataGridColumn4);
            return (_local_1);
        }

        private function _CrossContentionTimeAward_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTimeAward_DataGridColumn6 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num5";
            _local_1.setStyle("color", 16744512);
            BindingManager.executeBindings(this, "_CrossContentionTimeAward_DataGridColumn6", _CrossContentionTimeAward_DataGridColumn6);
            return (_local_1);
        }

        private function _CrossContentionTimeAward_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[110];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[104];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_Label1.text = _arg_1;
            }, "_CrossContentionTimeAward_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (myStateList);
            }, function (_arg_1:Object):void
            {
                ContentionSingleState.dataProvider = _arg_1;
            }, "ContentionSingleState.dataProvider");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_DataGridColumn2.headerText = _arg_1;
            }, "_CrossContentionTimeAward_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_DataGridColumn3.headerText = _arg_1;
            }, "_CrossContentionTimeAward_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_DataGridColumn4.headerText = _arg_1;
            }, "_CrossContentionTimeAward_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_DataGridColumn5.headerText = _arg_1;
            }, "_CrossContentionTimeAward_DataGridColumn5.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_DataGridColumn6.headerText = _arg_1;
            }, "_CrossContentionTimeAward_DataGridColumn6.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[126];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_Label2.text = _arg_1;
            }, "_CrossContentionTimeAward_Label2.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[108];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.text = _arg_1;
            }, "info.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPointsAward.label = _arg_1;
            }, "btnPointsAward.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTimeAward_LinkButton1.label = _arg_1;
            }, "_CrossContentionTimeAward_LinkButton1.label");
            result[11] = binding;
            return (result);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[134].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[134].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        [Bindable(event="propertyChange")]
        public function get btnPointsAward():BasicDelayButton
        {
            return (this._2132384574btnPointsAward);
        }

        private function _CrossContentionTimeAward_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTimeAward_DataGridColumn2 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num1";
            _local_1.setStyle("color", 0xFFFFFF);
            BindingManager.executeBindings(this, "_CrossContentionTimeAward_DataGridColumn2", _CrossContentionTimeAward_DataGridColumn2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tInfo():Canvas
        {
            return (this._109412162tInfo);
        }

        public function open(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:Number;
            if (!_arg_1)
            {
                return;
            };
            info.visible = true;
            tInfo.visible = false;
            visible = true;
            myStateList.removeAll();
            var _local_2:Array = [0, 0, 0, 0, 0, 0];
            for (_local_3 in _arg_1.time)
            {
                _local_4 = _arg_1.time[_local_3];
                if (_local_4)
                {
                    _local_2[_local_3] = (_local_4 + _local_2[_local_3]);
                };
            };
            info.visible = false;
            tInfo.visible = true;
            myStateList.addItem({
                "aname":Language.CROSS_CONTENTION_PANEL_U[107],
                "num1":Math.floor((_local_2[1] / 60000)),
                "num2":Math.floor((_local_2[2] / 60000)),
                "num3":Math.floor((_local_2[3] / 60000)),
                "num4":Math.floor((_local_2[4] / 60000)),
                "num5":Math.floor((_local_2[5] / 60000))
            });
        }

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        public function onGetTimeAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[127]);
            }
            else
            {
                if (_arg_1.data)
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[_arg_1.data]);
                }
                else
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[128]);
                };
            };
        }

        private function getTimeAward():void
        {
            _core.remote.call("crossContentionGetTimeAward", new Responder(onGetTimeAward));
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

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        public function ___CrossContentionTimeAward_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _CrossContentionTimeAward_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.width = 110;
            _local_1.dataField = "aname";
            return (_local_1);
        }

        private function _CrossContentionTimeAward_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTimeAward_DataGridColumn3 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "num2";
            _local_1.setStyle("color", 0x8000);
            BindingManager.executeBindings(this, "_CrossContentionTimeAward_DataGridColumn3", _CrossContentionTimeAward_DataGridColumn3);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

