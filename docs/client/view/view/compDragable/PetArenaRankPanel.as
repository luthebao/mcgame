// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PetArenaRankPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Button;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
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

    public class PetArenaRankPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _PetArenaRankPanel_DataGrid1:DataGrid;
        public var _PetArenaRankPanel_DataGrid2:DataGrid;
        public var _PetArenaRankPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _PetArenaRankPanel_Button1:Button;
        private var lastRefreshTime:Number = 0;
        public var _PetArenaRankPanel_DataGridColumn1:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn2:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn3:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn4:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn5:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn7:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn6:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn8:DataGridColumn;
        public var _PetArenaRankPanel_DataGridColumn9:DataGridColumn;
        public var _PetArenaRankPanel_BasicTxtButton1:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":650,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_PetArenaRankPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":40,
                                "width":300,
                                "height":250,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"_PetArenaRankPanel_DataGrid1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "sortableColumns":false,
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "doubleClickEnabled":false,
                                            "columns":[_PetArenaRankPanel_DataGridColumn1_i(), _PetArenaRankPanel_DataGridColumn2_i(), _PetArenaRankPanel_DataGridColumn3_i(), _PetArenaRankPanel_DataGridColumn4_i()]
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
                                "x":310,
                                "y":40,
                                "width":330,
                                "height":250,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"_PetArenaRankPanel_DataGrid2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "sortableColumns":false,
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "doubleClickEnabled":false,
                                            "columns":[_PetArenaRankPanel_DataGridColumn5_i(), _PetArenaRankPanel_DataGridColumn6_i(), _PetArenaRankPanel_DataGridColumn7_i(), _PetArenaRankPanel_DataGridColumn8_i(), _PetArenaRankPanel_DataGridColumn9_i()]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_PetArenaRankPanel_Button1",
                        "events":{"click":"___PetArenaRankPanel_Button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":79,
                                "y":339,
                                "width":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"_PetArenaRankPanel_BasicTxtButton1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":340});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1530121735rankDataProvider:ArrayCollection = new ArrayCollection();
        private var _1109307497comboDataProvider:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetArenaRankPanel()
        {
            mx_internal::_document = this;
            this.width = 650;
            this.height = 400;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___PetArenaRankPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetArenaRankPanel._watcherSetupUtil = _arg_1;
        }


        private function _PetArenaRankPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "rank";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn1", _PetArenaRankPanel_DataGridColumn1);
            return (_local_1);
        }

        private function _PetArenaRankPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn3", _PetArenaRankPanel_DataGridColumn3);
            return (_local_1);
        }

        private function _PetArenaRankPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "id";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn5", _PetArenaRankPanel_DataGridColumn5);
            return (_local_1);
        }

        private function _PetArenaRankPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn7", _PetArenaRankPanel_DataGridColumn7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get rankDataProvider():ArrayCollection
        {
            return (this._1530121735rankDataProvider);
        }

        private function _PetArenaRankPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "combo";
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn9", _PetArenaRankPanel_DataGridColumn9);
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:PetArenaRankPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetArenaRankPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_PetArenaRankPanelWatcherSetupUtil");
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

        private function set rankDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1530121735rankDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1530121735rankDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankDataProvider", _local_2, _arg_1));
            };
        }

        private function _PetArenaRankPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_PetArenaRankPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (rankDataProvider);
            }, function (_arg_1:Object):void
            {
                _PetArenaRankPanel_DataGrid1.dataProvider = _arg_1;
            }, "_PetArenaRankPanel_DataGrid1.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn1.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn1.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn2.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn3.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn4.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (comboDataProvider);
            }, function (_arg_1:Object):void
            {
                _PetArenaRankPanel_DataGrid2.dataProvider = _arg_1;
            }, "_PetArenaRankPanel_DataGrid2.dataProvider");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn5.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn5.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn6.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn6.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn7.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn7.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn8.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn8.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_DataGridColumn9.headerText = _arg_1;
            }, "_PetArenaRankPanel_DataGridColumn9.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_Button1.label = _arg_1;
            }, "_PetArenaRankPanel_Button1.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_ARENA_RANK_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetArenaRankPanel_BasicTxtButton1.label = _arg_1;
            }, "_PetArenaRankPanel_BasicTxtButton1.label");
            result[13] = binding;
            return (result);
        }

        private function init():void
        {
        }

        private function _PetArenaRankPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_ARENA_RANK_U[0];
            _local_1 = rankDataProvider;
            _local_1 = Language.PET_ARENA_RANK_U[3];
            _local_1 = Language.PET_ARENA_RANK_U[1];
            _local_1 = Language.PET_ARENA_RANK_U[2];
            _local_1 = Language.PET_ARENA_RANK_U[4];
            _local_1 = comboDataProvider;
            _local_1 = Language.PET_ARENA_RANK_U[3];
            _local_1 = Language.PET_ARENA_RANK_U[1];
            _local_1 = Language.PET_ARENA_RANK_U[2];
            _local_1 = Language.PET_ARENA_RANK_U[4];
            _local_1 = Language.PET_ARENA_RANK_U[5];
            _local_1 = Language.PET_ARENA_RANK_U[7];
            _local_1 = Language.PET_ARENA_RANK_U[6];
        }

        private function _PetArenaRankPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "tName";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn6", _PetArenaRankPanel_DataGridColumn6);
            return (_local_1);
        }

        private function _PetArenaRankPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn8", _PetArenaRankPanel_DataGridColumn8);
            return (_local_1);
        }

        public function reset():void
        {
            rankDataProvider = new ArrayCollection();
            comboDataProvider = new ArrayCollection();
            lastRefreshTime = 0;
        }

        private function _PetArenaRankPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn4", _PetArenaRankPanel_DataGridColumn4);
            return (_local_1);
        }

        private function _PetArenaRankPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _PetArenaRankPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "tName";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_PetArenaRankPanel_DataGridColumn2", _PetArenaRankPanel_DataGridColumn2);
            return (_local_1);
        }

        public function ___PetArenaRankPanel_Button1_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_PET_ARENA_PREV_RANK);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Number;
            if (_arg_1)
            {
                _local_2 = new Date().getTime();
                if (_local_2 > (lastRefreshTime + 60000))
                {
                    _core.remote.call("getPetArenaRank", null);
                };
            };
            super.visible = _arg_1;
        }

        private function set comboDataProvider(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1109307497comboDataProvider;
            if (_local_2 !== _arg_1)
            {
                this._1109307497comboDataProvider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "comboDataProvider", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get comboDataProvider():ArrayCollection
        {
            return (this._1109307497comboDataProvider);
        }

        public function onPetArenaRank(_arg_1:Object):void
        {
            var _local_4:String;
            var _local_5:int;
            var _local_2:Array = _arg_1.r;
            var _local_3:Array = _arg_1.c;
            for (_local_4 in _local_2)
            {
                _local_2[_local_4].rank = (_local_2[_local_4].rank + 1);
            };
            _local_5 = 0;
            while (_local_5 < _local_3.length)
            {
                _local_3[_local_5].id = (_local_5 + 1);
                _local_5++;
            };
            rankDataProvider.source = _local_2;
            comboDataProvider.source = _local_3;
        }

        public function ___PetArenaRankPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.compDragable

