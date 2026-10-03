// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionScoreAward

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.DataGrid;
    import mx.controls.Alert;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.binding.BindingManager;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
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

    public class CrossContentionScoreAward extends DragableCanvas implements IBindingClient 
    {

        public static const WIN_SCORE:int = 3;
        public static const LOSS_SCORE:int = 1;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _CrossContentionScoreAward_LinkButton1:LinkButton;
        private var _1287834292panelTitle:BasicTitleCanvas;
        public var _CrossContentionScoreAward_DataGridColumn1:DataGridColumn;
        public var _CrossContentionScoreAward_DataGridColumn2:DataGridColumn;
        public var _CrossContentionScoreAward_DataGridColumn3:DataGridColumn;
        public var _CrossContentionScoreAward_DataGridColumn4:DataGridColumn;
        public var areaId:int = 0;
        private var _62409574ContentionSingleState:DataGrid;
        private var _helpAlert:Alert;
        public var mapId:int = 0;
        public var _CrossContentionScoreAward_Label1:Label;
        private var _3237038info:Label;
        public var isBoss:Boolean = false;
        private var _2132384574btnPointsAward:BasicDelayButton;
        private var _109412162tInfo:Canvas;

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
                                                        "columns":[_CrossContentionScoreAward_DataGridColumn1_i(), _CrossContentionScoreAward_DataGridColumn2_i(), _CrossContentionScoreAward_DataGridColumn3_i(), _CrossContentionScoreAward_DataGridColumn4_i()]
                                                    });
                                                }
                                            })]});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossContentionScoreAward_Label1",
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
                        "id":"_CrossContentionScoreAward_LinkButton1",
                        "events":{"click":"___CrossContentionScoreAward_LinkButton1_click"},
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

        public function CrossContentionScoreAward()
        {
            mx_internal::_document = this;
            this.width = 625;
            this.height = 500;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionScoreAward_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionScoreAward._watcherSetupUtil = _arg_1;
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

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get ContentionSingleState():DataGrid
        {
            return (this._62409574ContentionSingleState);
        }

        override public function initialize():void
        {
            var target:CrossContentionScoreAward;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionScoreAward_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionScoreAwardWatcherSetupUtil");
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
            getScoreAward();
        }

        public function ___CrossContentionScoreAward_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
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

        public function ___CrossContentionScoreAward_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        private function _CrossContentionScoreAward_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionScoreAward_DataGridColumn1 = _local_1;
            _local_1.width = 165;
            _local_1.dataField = "aname";
            BindingManager.executeBindings(this, "_CrossContentionScoreAward_DataGridColumn1", _CrossContentionScoreAward_DataGridColumn1);
            return (_local_1);
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

        [Bindable(event="propertyChange")]
        public function get info():Label
        {
            return (this._3237038info);
        }

        private function _CrossContentionScoreAward_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionScoreAward_DataGridColumn3 = _local_1;
            _local_1.width = 135;
            _local_1.dataField = "lossNum";
            BindingManager.executeBindings(this, "_CrossContentionScoreAward_DataGridColumn3", _CrossContentionScoreAward_DataGridColumn3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[135].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[135].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get btnPointsAward():BasicDelayButton
        {
            return (this._2132384574btnPointsAward);
        }

        public function open(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:int;
            var _local_5:int;
            if (!_arg_1)
            {
                return;
            };
            info.visible = true;
            tInfo.visible = false;
            visible = true;
            myStateList.removeAll();
            for (_local_2 in _arg_1)
            {
                _local_3 = GamePredef.CROSS_CONTENTION_MAP[_local_2].name;
                _local_4 = 0;
                _local_5 = 0;
                if (_arg_1[_local_2])
                {
                    _local_4 = _arg_1[_local_2].win;
                    _local_5 = _arg_1[_local_2].loss;
                };
                info.visible = false;
                tInfo.visible = true;
                myStateList.addItem({
                    "aname":_local_3,
                    "winNum":_local_4,
                    "lossNum":_local_5,
                    "score":((_local_4 * WIN_SCORE) + (_local_5 * LOSS_SCORE))
                });
            };
        }

        private function _CrossContentionScoreAward_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (myStateList);
            }, function (_arg_1:Object):void
            {
                ContentionSingleState.dataProvider = _arg_1;
            }, "ContentionSingleState.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionScoreAward_DataGridColumn1.headerText = _arg_1;
            }, "_CrossContentionScoreAward_DataGridColumn1.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[98];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionScoreAward_DataGridColumn2.headerText = _arg_1;
            }, "_CrossContentionScoreAward_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[99];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionScoreAward_DataGridColumn3.headerText = _arg_1;
            }, "_CrossContentionScoreAward_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[100];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionScoreAward_DataGridColumn4.headerText = _arg_1;
            }, "_CrossContentionScoreAward_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[111];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionScoreAward_Label1.text = _arg_1;
            }, "_CrossContentionScoreAward_Label1.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[109];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                info.text = _arg_1;
            }, "info.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPointsAward.label = _arg_1;
            }, "btnPointsAward.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionScoreAward_LinkButton1.label = _arg_1;
            }, "_CrossContentionScoreAward_LinkButton1.label");
            result[9] = binding;
            return (result);
        }

        public function onGetScoreAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[101]);
            }
            else
            {
                if (_arg_1.data)
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[_arg_1.data]);
                }
                else
                {
                    _core.sysMidNote(Language.CROSS_CONTENTION_PANEL_U[102]);
                };
            };
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

        private function _CrossContentionScoreAward_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[96];
            _local_1 = myStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[97];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[98];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[99];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[100];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[111];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[109];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[86];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[46];
        }

        private function getScoreAward():void
        {
            _core.remote.call("crossContentionGetScoreAward", new Responder(onGetScoreAward));
        }

        [Bindable(event="propertyChange")]
        public function get tInfo():Canvas
        {
            return (this._109412162tInfo);
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

        private function _CrossContentionScoreAward_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionScoreAward_DataGridColumn2 = _local_1;
            _local_1.width = 135;
            _local_1.dataField = "winNum";
            BindingManager.executeBindings(this, "_CrossContentionScoreAward_DataGridColumn2", _CrossContentionScoreAward_DataGridColumn2);
            return (_local_1);
        }

        private function _CrossContentionScoreAward_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionScoreAward_DataGridColumn4 = _local_1;
            _local_1.width = 135;
            _local_1.dataField = "score";
            BindingManager.executeBindings(this, "_CrossContentionScoreAward_DataGridColumn4", _CrossContentionScoreAward_DataGridColumn4);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

