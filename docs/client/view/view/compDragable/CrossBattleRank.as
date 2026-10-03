// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossBattleRank

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.PageableDataGrid;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import mx.events.ListEvent;
    import mx.binding.BindingManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class CrossBattleRank extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _pageSize:Number = 10;
        public var _CrossBattleRank_DataGridColumn1:DataGridColumn;
        public var _CrossBattleRank_DataGridColumn2:DataGridColumn;
        public var _CrossBattleRank_DataGridColumn3:DataGridColumn;
        public var _CrossBattleRank_DataGridColumn4:DataGridColumn;
        public var _CrossBattleRank_DataGridColumn5:DataGridColumn;
        private var _updateReady:Boolean = false;
        private var _858962330pageCtrl:PageSelector;
        private var _763223204rankCanvas:Canvas;
        private var _255677842rankGrid:PageableDataGrid;
        private var _allowUpdateRecord:Boolean = false;
        private var _110371416title:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":400,
                    "height":300,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"rankCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "width":390,
                                "height":263,
                                "x":5,
                                "y":32,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":PageableDataGrid,
                                    "id":"rankGrid",
                                    "events":{"itemClick":"__rankGrid_itemClick"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "sortableColumns":false,
                                            "resizableColumns":false,
                                            "draggableColumns":false,
                                            "width":370,
                                            "height":200,
                                            "columns":[_CrossBattleRank_DataGridColumn1_i(), _CrossBattleRank_DataGridColumn2_i(), _CrossBattleRank_DataGridColumn3_i(), _CrossBattleRank_DataGridColumn4_i(), _CrossBattleRank_DataGridColumn5_i()]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelector,
                                    "id":"pageCtrl",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "onPageChanged":pageRefresh,
                                            "x":122,
                                            "y":237
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
        private var _rankListAC:ArrayCollection = new ArrayCollection();
        public var forUpdateArr:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossBattleRank()
        {
            mx_internal::_document = this;
            this.width = 400;
            this.height = 300;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossBattleRank_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossBattleRank._watcherSetupUtil = _arg_1;
        }


        private function showMenu(_arg_1:ListEvent):void
        {
            var _local_2:Object = _arg_1.itemRenderer.data;
            var _local_3:Number = _local_2.cid;
            var _local_4:String = _local_2.name;
            var _local_5:Array = [{
                "label":GamePredef.MENU_INFO,
                "cid":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_P2PWISPER,
                "cid":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_ASSASI,
                "cid":_local_3,
                "name":_local_4
            }];
            var _local_6:Menu = CustomMenu.createMenu(null, _local_5);
            _local_6.show((stage.mouseX + 25), ((stage.mouseY > 390) ? 390 : stage.mouseY));
            _local_6.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        private function _CrossBattleRank_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossBattleRank_DataGridColumn4 = _local_1;
            _local_1.width = 86;
            _local_1.dataField = "total";
            BindingManager.executeBindings(this, "_CrossBattleRank_DataGridColumn4", _CrossBattleRank_DataGridColumn4);
            return (_local_1);
        }

        private function _CrossBattleRank_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossBattleRank_DataGridColumn2 = _local_1;
            _local_1.width = 60;
            _local_1.dataField = "level";
            BindingManager.executeBindings(this, "_CrossBattleRank_DataGridColumn2", _CrossBattleRank_DataGridColumn2);
            return (_local_1);
        }

        private function updateOneRecord(_arg_1:Object):void
        {
            var _local_2:Array = _rankListAC.source;
            var _local_3:* = 0;
            while (_local_3 < _local_2.length)
            {
                if (_arg_1.cid == _local_2[_local_3].cid)
                {
                    _local_2[_local_3] = _arg_1;
                    return;
                };
                _local_3++;
            };
            _local_2.push(_arg_1);
        }

        override public function initialize():void
        {
            var target:CrossBattleRank;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossBattleRank_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossBattleRankWatcherSetupUtil");
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
        public function get rankGrid():PageableDataGrid
        {
            return (this._255677842rankGrid);
        }

        private function _CrossBattleRank_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_BATTLE_RANK_U[0];
            _local_1 = pageCtrl;
            _local_1 = Language.CROSS_BATTLE_RANK_U[1];
            _local_1 = Language.CROSS_BATTLE_RANK_U[2];
            _local_1 = Language.CROSS_BATTLE_RANK_U[3];
            _local_1 = Language.CROSS_BATTLE_RANK_U[4];
            _local_1 = Language.CROSS_BATTLE_RANK_U[5];
            _local_1 = _pageSize;
        }

        private function updateView():void
        {
            var _local_1:Array = [];
            var _local_2:Array = _rankListAC.source;
            _local_2.sort(rankSortFunc);
            if (_local_2.length > 30)
            {
                _local_1 = _local_2.slice(0, 30);
            }
            else
            {
                _local_1 = _local_2;
            };
            _rankListAC = new ArrayCollection(_local_1);
            rankGrid.dataAll = _rankListAC;
            pageCtrl.resetPageSeletor(_rankListAC.length, _pageSize);
            pageRefresh((pageCtrl.pageNo * pageCtrl.pageSize), pageCtrl.pageSize);
        }

        private function init():void
        {
            if (!_allowUpdateRecord)
            {
                getRankList();
            };
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (_arg_1.label == GamePredef.MENU_P2PWISPER)
            {
                ChatPanelUtil.createChatPanel(_arg_1.item.cid);
            }
            else
            {
                if (_arg_1.label == GamePredef.MENU_INFO)
                {
                    _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_arg_1.item.cid);
                }
                else
                {
                    if (_arg_1.label == GamePredef.MENU_ASSASI)
                    {
                        _core.remote.assassinate(_arg_1.item.cid);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageCtrl():PageSelector
        {
            return (this._858962330pageCtrl);
        }

        public function __rankGrid_itemClick(_arg_1:ListEvent):void
        {
            showMenu(_arg_1);
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function resetRank():void
        {
            if (_allowUpdateRecord)
            {
                _rankListAC = new ArrayCollection();
                updateView();
                getRankList();
            };
        }

        public function set pageCtrl(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._858962330pageCtrl;
            if (_local_2 !== _arg_1)
            {
                this._858962330pageCtrl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageCtrl", _local_2, _arg_1));
            };
        }

        public function addUpdateRecord(_arg_1:Object):void
        {
            if (_allowUpdateRecord)
            {
                forUpdateArr.push(_arg_1);
            };
            if (_updateReady)
            {
                updateRankList();
            };
        }

        private function _CrossBattleRank_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossBattleRank_DataGridColumn3 = _local_1;
            _local_1.width = 60;
            _local_1.dataField = "serverId";
            BindingManager.executeBindings(this, "_CrossBattleRank_DataGridColumn3", _CrossBattleRank_DataGridColumn3);
            return (_local_1);
        }

        private function _CrossBattleRank_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossBattleRank_DataGridColumn5 = _local_1;
            _local_1.width = 86;
            _local_1.dataField = "assasi";
            BindingManager.executeBindings(this, "_CrossBattleRank_DataGridColumn5", _CrossBattleRank_DataGridColumn5);
            return (_local_1);
        }

        private function _CrossBattleRank_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossBattleRank_DataGridColumn1 = _local_1;
            _local_1.width = 100;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_CrossBattleRank_DataGridColumn1", _CrossBattleRank_DataGridColumn1);
            return (_local_1);
        }

        public function ___CrossBattleRank_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function pageRefresh(_arg_1:int, _arg_2:int):void
        {
            if (_rankListAC)
            {
                rankGrid.dataProvider = ToolKit.getPageCollection(_rankListAC, _arg_1, _arg_2);
            };
        }

        private function rankSortFunc(_arg_1:Object, _arg_2:Object):Number
        {
            if (_arg_1.total != _arg_2.total)
            {
                return (ToolKit.minus(_arg_2.total, _arg_1.total));
            };
            if (_arg_1.assasi != _arg_2.assasi)
            {
                return (ToolKit.minus(_arg_2.assasi, _arg_1.assasi));
            };
            if (_arg_1.level != _arg_2.level)
            {
                return (ToolKit.minus(_arg_1.level, _arg_2.level));
            };
            if (_arg_1.cid != _arg_2.cid)
            {
                return (ToolKit.minus(_arg_1.cid, _arg_2.cid));
            };
            return (0);
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
        public function get rankCanvas():Canvas
        {
            return (this._763223204rankCanvas);
        }

        private function updateRankList():void
        {
            var _local_1:Object;
            if (forUpdateArr.length > 0)
            {
                _local_1 = forUpdateArr.pop();
                while (_local_1)
                {
                    updateOneRecord(_local_1);
                    _local_1 = forUpdateArr.pop();
                };
            };
            if (visible)
            {
                updateView();
            };
        }

        private function _CrossBattleRank_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_BATTLE_RANK_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():PageSelector
            {
                return (pageCtrl);
            }, function (_arg_1:PageSelector):void
            {
                rankGrid.pageSelector = _arg_1;
            }, "rankGrid.pageSelector");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_BATTLE_RANK_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossBattleRank_DataGridColumn1.headerText = _arg_1;
            }, "_CrossBattleRank_DataGridColumn1.headerText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_BATTLE_RANK_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossBattleRank_DataGridColumn2.headerText = _arg_1;
            }, "_CrossBattleRank_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_BATTLE_RANK_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossBattleRank_DataGridColumn3.headerText = _arg_1;
            }, "_CrossBattleRank_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_BATTLE_RANK_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossBattleRank_DataGridColumn4.headerText = _arg_1;
            }, "_CrossBattleRank_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_BATTLE_RANK_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossBattleRank_DataGridColumn5.headerText = _arg_1;
            }, "_CrossBattleRank_DataGridColumn5.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (_pageSize);
            }, function (_arg_1:int):void
            {
                pageCtrl.pageSize = _arg_1;
            }, "pageCtrl.pageSize");
            result[7] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        public function set rankGrid(_arg_1:PageableDataGrid):void
        {
            var _local_2:Object = this._255677842rankGrid;
            if (_local_2 !== _arg_1)
            {
                this._255677842rankGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankGrid", _local_2, _arg_1));
            };
        }

        public function getRankList():void
        {
            _allowUpdateRecord = true;
            var onGetRankList:Function = function (_arg_1:Object):void
            {
                var _local_3:*;
                var _local_2:Array = [];
                for (_local_3 in _arg_1)
                {
                    _local_2.push(_arg_1[_local_3]);
                };
                _rankListAC = new ArrayCollection(_local_2);
                updateView();
                _updateReady = true;
            };
            _core.remote.call("getCrossBattleRank", new Responder(onGetRankList));
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                updateView();
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

