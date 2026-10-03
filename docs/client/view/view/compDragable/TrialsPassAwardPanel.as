// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TrialsPassAwardPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererItemArray;
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

    public class TrialsPassAwardPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _isAward:Boolean;
        private var _1104960551flopRankGrid:DataGrid;
        private var _isAwardGold:Boolean;
        public var _TrialsPassAwardPanel_DataGridColumn1:DataGridColumn;
        public var _TrialsPassAwardPanel_DataGridColumn2:DataGridColumn;
        public var _TrialsPassAwardPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1405038220award1:BasicGlowButton;
        private var _93223517award:BasicGlowButton;
        public var _TrialsPassAwardPanel_Label1:Label;
        private var _passFloor:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":363,
                    "height":367,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TrialsPassAwardPanel_BasicTitleCanvas1",
                        "events":{"creationComplete":"___TrialsPassAwardPanel_BasicTitleCanvas1_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "39";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "label":"Hornor",
                                "width":348,
                                "height":294,
                                "x":7.5,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"flopRankGrid",
                                    "stylesFactory":function ():void
                                    {
                                        this.paddingTop = 1;
                                        this.paddingBottom = 1;
                                        this.left = "10";
                                        this.top = "10";
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "resizableColumns":false,
                                            "variableRowHeight":true,
                                            "draggableColumns":false,
                                            "height":283,
                                            "columns":[_TrialsPassAwardPanel_DataGridColumn1_i(), _TrialsPassAwardPanel_DataGridColumn2_i()]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_TrialsPassAwardPanel_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 16187149;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":341,
                                "width":205
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"award1",
                        "events":{"click":"__award1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":216,
                                "y":339,
                                "width":70,
                                "height":21,
                                "styleName":"BtnStdRed",
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"award",
                        "events":{"click":"__award_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":283,
                                "y":339,
                                "width":59,
                                "height":21,
                                "styleName":"BtnStdRed"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _floorAwardArr:Array = [{
            "id":1,
            "name":"1-1",
            "award":[{
                "tid":29,
                "iid":4730,
                "n":1
            }, {
                "tid":29,
                "iid":4724,
                "n":3
            }, {
                "tid":29,
                "iid":4674,
                "n":1
            }, {
                "tid":29,
                "iid":4673,
                "n":1
            }, {
                "tid":29,
                "iid":4740,
                "n":1
            }]
        }, {
            "id":1,
            "name":"1-2",
            "award":[{
                "tid":29,
                "iid":4731,
                "n":1
            }, {
                "tid":29,
                "iid":4591,
                "n":1
            }, {
                "tid":29,
                "iid":4674,
                "n":2
            }, {
                "tid":29,
                "iid":4741,
                "n":1
            }]
        }, {
            "id":1,
            "name":"1-3",
            "award":[{
                "tid":29,
                "iid":4732,
                "n":1
            }, {
                "tid":29,
                "iid":4591,
                "n":1
            }, {
                "tid":29,
                "iid":4724,
                "n":2
            }, {
                "tid":29,
                "iid":4674,
                "n":4
            }, {
                "tid":29,
                "iid":4742,
                "n":1
            }]
        }, {
            "id":1,
            "name":"1-4",
            "award":[{
                "tid":29,
                "iid":4733,
                "n":1
            }, {
                "tid":29,
                "iid":4591,
                "n":1
            }, {
                "tid":29,
                "iid":4724,
                "n":4
            }, {
                "tid":29,
                "iid":4674,
                "n":5
            }, {
                "tid":29,
                "iid":4743,
                "n":1
            }]
        }, {
            "id":1,
            "name":"1-5",
            "award":[{
                "tid":29,
                "iid":4734,
                "n":1
            }, {
                "tid":29,
                "iid":4591,
                "n":2
            }, {
                "tid":29,
                "iid":4724,
                "n":2
            }, {
                "tid":29,
                "iid":4674,
                "n":6
            }, {
                "tid":29,
                "iid":4744,
                "n":1
            }]
        }];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TrialsPassAwardPanel()
        {
            mx_internal::_document = this;
            this.width = 363;
            this.height = 367;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TrialsPassAwardPanel._watcherSetupUtil = _arg_1;
        }


        private function _TrialsPassAwardPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _TrialsPassAwardPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_TrialsPassAwardPanel_DataGridColumn1", _TrialsPassAwardPanel_DataGridColumn1);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:TrialsPassAwardPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TrialsPassAwardPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TrialsPassAwardPanelWatcherSetupUtil");
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

        private function trialsAwardTakeByGold():void
        {
            _core.remote.call("trialsAwardTakeByGold", null);
        }

        private function init():void
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Number = 0;
            while (_local_2 < _floorAwardArr.length)
            {
                _local_3 = new Object();
                _local_3["id"] = _floorAwardArr[_local_2].id;
                _local_3["name"] = _floorAwardArr[_local_2].name;
                _local_3.array = new Array();
                _local_4 = 0;
                while (_local_4 < _floorAwardArr[_local_2].award.length)
                {
                    _local_5 = _floorAwardArr[_local_2].award[_local_4];
                    if (_local_5)
                    {
                        _local_6 = new Object();
                        _local_6.stackNum = _local_5.n;
                        _local_6.itemType = _local_5.tid;
                        _local_6.itemId = _local_5.iid;
                        _local_6.movable = false;
                        _local_6.slotType = Slot.SLOT_TEMP_SLOT;
                        _local_7 = _core.data.gameData[_local_5.tid][_local_5];
                        _local_6.quality = 0;
                        _local_6.slotData = _local_7;
                        _local_3.array.push(_local_6);
                    };
                    _local_4++;
                };
                _local_1.addItem(_local_3);
                _local_2++;
            };
            flopRankGrid.dataProvider = _local_1;
        }

        private function _TrialsPassAwardPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_AWARD_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassAwardPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TrialsPassAwardPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_AWARD_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassAwardPanel_DataGridColumn1.headerText = _arg_1;
            }, "_TrialsPassAwardPanel_DataGridColumn1.headerText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_AWARD_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassAwardPanel_DataGridColumn2.headerText = _arg_1;
            }, "_TrialsPassAwardPanel_DataGridColumn2.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_AWARD_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrialsPassAwardPanel_Label1.text = _arg_1;
            }, "_TrialsPassAwardPanel_Label1.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_AWARD_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award1.label = _arg_1;
            }, "award1.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRIALS_AWARD_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award.label = _arg_1;
            }, "award.label");
            result[5] = binding;
            return (result);
        }

        public function trialsAwardPanelVisible(_arg_1:Number, _arg_2:Boolean, _arg_3:Boolean):void
        {
            _passFloor = _arg_1;
            _isAward = _arg_2;
            _isAwardGold = _arg_3;
            initView();
            visible = true;
        }

        public function set flopRankGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1104960551flopRankGrid;
            if (_local_2 !== _arg_1)
            {
                this._1104960551flopRankGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "flopRankGrid", _local_2, _arg_1));
            };
        }

        public function set award(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._93223517award;
            if (_local_2 !== _arg_1)
            {
                this._93223517award = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award", _local_2, _arg_1));
            };
        }

        public function __award_click(_arg_1:MouseEvent):void
        {
            trialsAwardTake();
        }

        private function _TrialsPassAwardPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _TrialsPassAwardPanel_DataGridColumn2 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 250;
            _local_1.itemRenderer = _TrialsPassAwardPanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_TrialsPassAwardPanel_DataGridColumn2", _TrialsPassAwardPanel_DataGridColumn2);
            return (_local_1);
        }

        public function ___TrialsPassAwardPanel_BasicTitleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (((initialized) && (!(_passFloor))))
            {
                award.enabled = false;
                award1.enabled = false;
                award.label = Language.TRIALS_AWARD_PANEL[7];
                award1.label = Language.TRIALS_AWARD_PANEL[8];
            }
            else
            {
                if (initialized)
                {
                    award.enabled = false;
                    award1.enabled = false;
                    award.label = Language.TRIALS_AWARD_PANEL[6];
                    award1.label = Language.TRIALS_AWARD_PANEL[6];
                    if (!_isAward)
                    {
                        award.enabled = true;
                        award.label = Language.TRIALS_AWARD_PANEL[7];
                    };
                    if (!_isAwardGold)
                    {
                        award1.enabled = true;
                        award1.label = Language.TRIALS_AWARD_PANEL[8];
                    };
                };
            };
        }

        private function _TrialsPassAwardPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get flopRankGrid():DataGrid
        {
            return (this._1104960551flopRankGrid);
        }

        public function __award1_click(_arg_1:MouseEvent):void
        {
            trialsAwardTakeByGold();
        }

        private function _TrialsPassAwardPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TRIALS_AWARD_PANEL[0];
            _local_1 = Language.TRIALS_AWARD_PANEL[1];
            _local_1 = Language.TRIALS_AWARD_PANEL[2];
            _local_1 = Language.TRIALS_AWARD_PANEL[5];
            _local_1 = Language.TRIALS_AWARD_PANEL[4];
            _local_1 = Language.TRIALS_AWARD_PANEL[3];
        }

        private function trialsAwardTake():void
        {
            _core.remote.call("trialsAwardTake", null);
        }

        public function set award1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1405038220award1;
            if (_local_2 !== _arg_1)
            {
                this._1405038220award1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get award1():BasicGlowButton
        {
            return (this._1405038220award1);
        }

        [Bindable(event="propertyChange")]
        public function get award():BasicGlowButton
        {
            return (this._93223517award);
        }


    }
}//package com.qeedoo.ui.view.compDragable

