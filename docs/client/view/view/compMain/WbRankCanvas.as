// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.WbRankCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.RendererItemArray;
    import mx.containers.ViewStack;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.binding.BindingManager;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.MouseEvent;
    import mx.collections.ArrayCollection;
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

    public class WbRankCanvas extends SimpleCanvas implements IMainUI, IBindingClient 
    {

        public static var WB_BOSS_HP:Number = 0x77359400;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _9769532classRank:DataGrid;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _763223204rankCanvas:Canvas;
        private var _858834321globalRank:DataGrid;
        public var _WbRankCanvas_Canvas2:Canvas;
        public var _WbRankCanvas_Canvas3:Canvas;
        private var _1060104200myRank:Label;
        private var _124012844btnChange:Button;
        public var _WbRankCanvas_DataGridColumn1:DataGridColumn;
        public var _WbRankCanvas_DataGridColumn2:DataGridColumn;
        public var _WbRankCanvas_DataGridColumn3:DataGridColumn;
        public var _WbRankCanvas_DataGridColumn4:DataGridColumn;
        public var _WbRankCanvas_DataGridColumn5:DataGridColumn;
        public var _WbRankCanvas_DataGridColumn6:DataGridColumn;
        private var _1060382757myHurt:Label;
        private var _1108083282wbAward:RendererItemArray;
        private var _795053673wbRank:ViewStack;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":300,
                    "width":270,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"rankCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "x":12,
                                "y":0,
                                "width":260,
                                "height":300,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":22,
                                            "y":6,
                                            "percentWidth":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"bangBtn0",
                                                "events":{"click":"__bangBtn0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":20,
                                                        "width":80,
                                                        "styleName":"HorizontalTab",
                                                        "selected":true,
                                                        "labelPlacement":"bottom"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"bangBtn1",
                                                "events":{"click":"__bangBtn1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"wbRank",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":26,
                                            "height":205,
                                            "width":250,
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_WbRankCanvas_Canvas2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":1,
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":249,
                                                        "height":205,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"classRank",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_WbRankCanvas_DataGridColumn1_i(), _WbRankCanvas_DataGridColumn2_i(), _WbRankCanvas_DataGridColumn3_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_WbRankCanvas_Canvas3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"globalRank",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_WbRankCanvas_DataGridColumn4_i(), _WbRankCanvas_DataGridColumn5_i(), _WbRankCanvas_DataGridColumn6_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myHurt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16501317;
                                        this.horizontalCenter = "true";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":202,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"myRank",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16501317;
                                        this.horizontalCenter = "true";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":217,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RendererItemArray,
                                    "id":"wbAward",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "33";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":234});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnChange",
                        "events":{"click":"__btnChange_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":126,
                                "width":12,
                                "height":25,
                                "styleName":"BtnHideButtons",
                                "visible":true
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

        public function WbRankCanvas()
        {
            mx_internal::_document = this;
            this.clipContent = false;
            this.cacheAsBitmap = true;
            this.height = 300;
            this.width = 270;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WbRankCanvas._watcherSetupUtil = _arg_1;
        }


        private function _WbRankCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_Canvas2.label = _arg_1;
            }, "_WbRankCanvas_Canvas2.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_DataGridColumn1.headerText = _arg_1;
            }, "_WbRankCanvas_DataGridColumn1.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_DataGridColumn2.headerText = _arg_1;
            }, "_WbRankCanvas_DataGridColumn2.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_DataGridColumn3.headerText = _arg_1;
            }, "_WbRankCanvas_DataGridColumn3.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_Canvas3.label = _arg_1;
            }, "_WbRankCanvas_Canvas3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_DataGridColumn4.headerText = _arg_1;
            }, "_WbRankCanvas_DataGridColumn4.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_DataGridColumn5.headerText = _arg_1;
            }, "_WbRankCanvas_DataGridColumn5.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WB_RANK_CANVAS_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbRankCanvas_DataGridColumn6.headerText = _arg_1;
            }, "_WbRankCanvas_DataGridColumn6.headerText");
            result[9] = binding;
            return (result);
        }

        private function _WbRankCanvas_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WbRankCanvas_DataGridColumn2 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_WbRankCanvas_DataGridColumn2", _WbRankCanvas_DataGridColumn2);
            return (_local_1);
        }

        private function _WbRankCanvas_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WbRankCanvas_DataGridColumn4 = _local_1;
            _local_1.dataField = "index";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_WbRankCanvas_DataGridColumn4", _WbRankCanvas_DataGridColumn4);
            return (_local_1);
        }

        private function _WbRankCanvas_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WbRankCanvas_DataGridColumn6 = _local_1;
            _local_1.dataField = "score";
            _local_1.width = 107;
            BindingManager.executeBindings(this, "_WbRankCanvas_DataGridColumn6", _WbRankCanvas_DataGridColumn6);
            return (_local_1);
        }

        public function set globalRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._858834321globalRank;
            if (_local_2 !== _arg_1)
            {
                this._858834321globalRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "globalRank", _local_2, _arg_1));
            };
        }

        public function set classRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._9769532classRank;
            if (_local_2 !== _arg_1)
            {
                this._9769532classRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classRank", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:WbRankCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WbRankCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_WbRankCanvasWatcherSetupUtil");
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
        public function get globalRank():DataGrid
        {
            return (this._858834321globalRank);
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            bangSele(0);
        }

        public function clearRank():void
        {
            globalRank.dataProvider = null;
            classRank.dataProvider = null;
        }

        public function set myRank(_arg_1:Label):void
        {
            var _local_2:Object = this._1060104200myRank;
            if (_local_2 !== _arg_1)
            {
                this._1060104200myRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wbRank():ViewStack
        {
            return (this._795053673wbRank);
        }

        public function init():void
        {
        }

        private function bangSele(_arg_1:int):void
        {
            wbRank.selectedIndex = _arg_1;
            if (_arg_1 == 0)
            {
                this.bangBtn0.selected = true;
                this.bangBtn1.selected = false;
            }
            else
            {
                this.bangBtn0.selected = false;
                this.bangBtn1.selected = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get rankCanvas():Canvas
        {
            return (this._763223204rankCanvas);
        }

        public function set wbAward(_arg_1:RendererItemArray):void
        {
            var _local_2:Object = this._1108083282wbAward;
            if (_local_2 !== _arg_1)
            {
                this._1108083282wbAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wbAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        public function set wbRank(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._795053673wbRank;
            if (_local_2 !== _arg_1)
            {
                this._795053673wbRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wbRank", _local_2, _arg_1));
            };
        }

        public function changeFun():void
        {
            if (rankCanvas.visible)
            {
                rankCanvas.visible = false;
                btnChange.x = 250;
                btnChange.styleName = "BtnShowButtons";
            }
            else
            {
                rankCanvas.visible = true;
                btnChange.x = 0;
                btnChange.styleName = "BtnHideButtons";
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        public function set myHurt(_arg_1:Label):void
        {
            var _local_2:Object = this._1060382757myHurt;
            if (_local_2 !== _arg_1)
            {
                this._1060382757myHurt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myHurt", _local_2, _arg_1));
            };
        }

        public function onUpdateWbRank(_arg_1:Object, _arg_2:Object, _arg_3:Number, _arg_4:Object=null):void
        {
            var _local_5:ArrayCollection;
            var _local_6:Object;
            var _local_7:*;
            var _local_8:ArrayCollection;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Number;
            var _local_12:Array;
            var _local_13:int;
            if (WbAutoBattleCanva.WB_BOSS_HP)
            {
                WB_BOSS_HP = WbAutoBattleCanva.WB_BOSS_HP;
            };
            this.globalRank.dataProvider = null;
            this.classRank.dataProvider = null;
            if (((((_arg_1) && (_arg_1.globalRank)) && (!(_arg_1.globalRank.length == 0))) && (_arg_2)))
            {
                _local_5 = new ArrayCollection();
                _local_6 = _arg_1.globalRank;
                for (_local_7 in _local_6)
                {
                    _local_10 = new Object();
                    _local_10.index = (_local_7 + 1);
                    _local_10.name = _local_6[_local_7].name;
                    _local_10.score = (((_local_6[_local_7].score + "(") + ((_local_6[_local_7].score * 100) / WB_BOSS_HP)) + "%)");
                    _local_11 = ((_local_6[_local_7].score * 100) / WB_BOSS_HP);
                    if (_local_11 < 0.001)
                    {
                        _local_10.score = (_local_6[_local_7].score + "( <= 0.001%)");
                    }
                    else
                    {
                        _local_10.score = (((_local_6[_local_7].score + "(") + _local_11.toFixed(3)) + "%)");
                    };
                    _local_5.addItem(_local_10);
                };
                _local_8 = new ArrayCollection();
                _local_9 = _arg_2.classRank;
                for (_local_7 in _local_9)
                {
                    _local_10 = new Object();
                    _local_10.index = (_local_7 + 1);
                    _local_10.name = _local_9[_local_7].name;
                    _local_11 = ((_local_9[_local_7].score * 100) / WB_BOSS_HP);
                    if (_local_11 < 0.001)
                    {
                        _local_10.score = (_local_9[_local_7].score + "( <= 0.001%)");
                    }
                    else
                    {
                        _local_10.score = (((_local_9[_local_7].score + "(") + _local_11.toFixed(3)) + "%)");
                    };
                    _local_8.addItem(_local_10);
                };
                this.globalRank.dataProvider = _local_5;
                this.classRank.dataProvider = _local_8;
                myRank.text = Language.WB_RANK_CANVAS_U[5].replace("{rank2}", ((Number(_arg_2.myRank) != -1) ? (Number(_arg_2.myRank) + 1) : ""));
            }
            else
            {
                myRank.text = Language.WB_RANK_CANVAS_U[5].replace("{rank2}", "");
            };
            if (!_arg_3)
            {
                _arg_3 = 0;
            };
            myHurt.text = (Language.WB_RANK_CANVAS_U[6] + _arg_3);
            if (_arg_4 != null)
            {
                _local_10 = {"array":[]};
                _local_12 = new Array();
                _local_13 = 0;
                for (_local_7 in _arg_4)
                {
                    var _local_16:* = _local_13++;
                    _local_12[_local_16] = _arg_4[_local_7];
                };
                _local_10.array = _local_12;
                wbAward.data = _local_10;
            };
        }

        private function _WbRankCanvas_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WbRankCanvas_DataGridColumn3 = _local_1;
            _local_1.dataField = "score";
            _local_1.width = 107;
            BindingManager.executeBindings(this, "_WbRankCanvas_DataGridColumn3", _WbRankCanvas_DataGridColumn3);
            return (_local_1);
        }

        private function _WbRankCanvas_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WbRankCanvas_DataGridColumn5 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_WbRankCanvas_DataGridColumn5", _WbRankCanvas_DataGridColumn5);
            return (_local_1);
        }

        private function _WbRankCanvas_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WbRankCanvas_DataGridColumn1 = _local_1;
            _local_1.dataField = "index";
            _local_1.width = 35;
            BindingManager.executeBindings(this, "_WbRankCanvas_DataGridColumn1", _WbRankCanvas_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnChange():Button
        {
            return (this._124012844btnChange);
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

        [Bindable(event="propertyChange")]
        public function get wbAward():RendererItemArray
        {
            return (this._1108083282wbAward);
        }

        [Bindable(event="propertyChange")]
        public function get classRank():DataGrid
        {
            return (this._9769532classRank);
        }

        public function initView():void
        {
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            bangSele(1);
        }

        public function update():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get myHurt():Label
        {
            return (this._1060382757myHurt);
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        public function set btnChange(_arg_1:Button):void
        {
            var _local_2:Object = this._124012844btnChange;
            if (_local_2 !== _arg_1)
            {
                this._124012844btnChange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnChange", _local_2, _arg_1));
            };
        }

        private function _WbRankCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WB_RANK_CANVAS_U[0];
            _local_1 = Language.WB_RANK_CANVAS_U[1];
            _local_1 = Language.WB_RANK_CANVAS_U[0];
            _local_1 = Language.WB_RANK_CANVAS_U[2];
            _local_1 = Language.WB_RANK_CANVAS_U[3];
            _local_1 = Language.WB_RANK_CANVAS_U[4];
            _local_1 = Language.WB_RANK_CANVAS_U[1];
            _local_1 = Language.WB_RANK_CANVAS_U[2];
            _local_1 = Language.WB_RANK_CANVAS_U[3];
            _local_1 = Language.WB_RANK_CANVAS_U[4];
        }

        public function initAwardList(_arg_1:Object):void
        {
        }

        public function __btnChange_click(_arg_1:MouseEvent):void
        {
            changeFun();
        }

        [Bindable(event="propertyChange")]
        public function get myRank():Label
        {
            return (this._1060104200myRank);
        }


    }
}//package com.qeedoo.ui.view.compMain

