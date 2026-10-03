// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcShowRankPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.DataGrid;
    import mx.collections.ArrayCollection;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.ListEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
    import flash.system.System;
    import mx.controls.dataGridClasses.DataGridColumn;
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

    public class NpcShowRankPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _2125211366dataGridRankList:DataGrid;
        private var _301114013rankItemList:ArrayCollection;
        public var rankDataList:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":460,
                    "height":380,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.right = "15";
                            this.top = "40";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":DataGrid,
                                    "id":"dataGridRankList",
                                    "events":{"itemClick":"__dataGridRankList_itemClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "resizableColumns":false,
                                            "draggableColumns":false
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var coumnNameArr:Array = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function NpcShowRankPanel()
        {
            mx_internal::_document = this;
            this.width = 460;
            this.height = 380;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NpcShowRankPanel._watcherSetupUtil = _arg_1;
        }


        private function set rankItemList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._301114013rankItemList;
            if (_local_2 !== _arg_1)
            {
                this._301114013rankItemList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankItemList", _local_2, _arg_1));
            };
        }

        public function set dataGridRankList(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._2125211366dataGridRankList;
            if (_local_2 !== _arg_1)
            {
                this._2125211366dataGridRankList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGridRankList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        override public function initialize():void
        {
            var target:NpcShowRankPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NpcShowRankPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NpcShowRankPanelWatcherSetupUtil");
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

        private function dataGridItemClick():void
        {
            menuPop([{"label":GamePredef.MENU_WISPER}, {"label":GamePredef.MENU_P2PWISPER}, {"label":GamePredef.MENU_INFO}, {"label":GamePredef.MENU_ADDF}, {"label":GamePredef.MENU_ADDB}, {"label":GamePredef.MENU_COPY}]);
        }

        public function updateRankView(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:*;
            if (_arg_1)
            {
                if (_arg_1.title)
                {
                    panelTitle.text = _arg_1.title;
                };
                if (_arg_1.format)
                {
                    initRankFormat(_arg_1.format);
                };
                rankItemList = new ArrayCollection();
                rankDataList = _arg_1.list;
                for each (_local_2 in rankDataList)
                {
                    _local_3 = new Object();
                    for (_local_4 in coumnNameArr)
                    {
                        _local_3[coumnNameArr[_local_4]] = _local_2[("data" + _local_4)];
                    };
                    if (_local_2.cid)
                    {
                        _local_3.cid = _local_2.cid;
                    };
                    rankItemList.addItem(_local_3);
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get rankItemList():ArrayCollection
        {
            return (this._301114013rankItemList);
        }

        private function _NpcShowRankPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NPC_SHOW_RANK_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (rankItemList);
            }, function (_arg_1:Object):void
            {
                dataGridRankList.dataProvider = _arg_1;
            }, "dataGridRankList.dataProvider");
            result[1] = binding;
            return (result);
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

        public function __dataGridRankList_itemClick(_arg_1:ListEvent):void
        {
            dataGridItemClick();
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:Core = Core.getInstance();
            var _local_3:* = dataGridRankList.selectedItem;
            var _local_4:* = "name";
            if (_arg_1.index == 0)
            {
                _local_2.view.getUI(ViewManager.MAIN_SYS).wisperChat(_local_3[_local_4]);
            }
            else
            {
                if (_arg_1.index == 1)
                {
                    ChatPanelUtil.createChatPanel(_local_3.cid);
                }
                else
                {
                    if (_arg_1.index == 2)
                    {
                        _local_2.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_local_3.cid);
                    }
                    else
                    {
                        if (_arg_1.index == 3)
                        {
                            _local_2.addFriend(_local_3[_local_4]);
                        }
                        else
                        {
                            if (_arg_1.index == 4)
                            {
                                _local_2.addBlack(_local_3[_local_4]);
                            }
                            else
                            {
                                if (_arg_1.index == 5)
                                {
                                    System.setClipboard(_local_3[_local_4]);
                                };
                            };
                        };
                    };
                };
            };
        }

        private function initRankFormat(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:DataGridColumn;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                if (_arg_1[_local_3])
                {
                    _local_4 = new DataGridColumn(_arg_1[_local_3].colName);
                    _local_4.headerText = _arg_1[_local_3].colName;
                    _local_4.dataField = _arg_1[_local_3].dataField;
                    coumnNameArr[_local_3] = _arg_1[_local_3].dataField;
                    _local_2.push(_local_4);
                };
            };
            dataGridRankList.columns = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get dataGridRankList():DataGrid
        {
            return (this._2125211366dataGridRankList);
        }

        private function _NpcShowRankPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NPC_SHOW_RANK_PANEL_U[0];
            _local_1 = rankItemList;
        }


    }
}//package com.qeedoo.ui.view.compDragable

