// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NpcShopPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.binding.utils.ChangeWatcher;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.event.DressEvent;
    import flash.events.MouseEvent;
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

    public class NpcShopPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const TP:String = "totalPage";
        private const PAGE_NUM:int = 6;
        private const CP:String = "curPage";
        private var _913513446itemDisplay5:NpcShopItemDisplay;
        private var _watcher:ChangeWatcher;
        private var _913513445itemDisplay4:NpcShopItemDisplay;
        private var _1870028133titleBar:BasicTitleCanvas;
        private var _1473774508hintText:Label;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _1124544653zhishiLink:LinkButton;
        private var _pageDict:Object;
        private var _itemDict:Object;
        private var _shopId:String;
        private var _575402001currency:Label;
        private var _803559802pageTab:HButtonTab;
        private var _913513441itemDisplay0:NpcShopItemDisplay;
        private var _913513442itemDisplay1:NpcShopItemDisplay;
        private var _913513443itemDisplay2:NpcShopItemDisplay;
        private var _913513444itemDisplay3:NpcShopItemDisplay;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":525,
                    "height":410,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"titleBar"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "events":{"tabChanged":"__pageTab_tabChanged"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":41,
                                "tabWidth":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "styleName":"CanvasBorder",
                                "width":495,
                                "height":330,
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "styleName":"InputContent",
                                            "width":475,
                                            "height":30,
                                            "mouseEnabled":false,
                                            "mouseChildren":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"currency",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.color = 0xFFFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"x":10});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"hintText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFF00;
                                                    this.textAlign = "right";
                                                    this.verticalCenter = "0";
                                                    this.right = "5";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"zhishiLink",
                                    "events":{"click":"__zhishiLink_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.textDecoration = "underline";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":15,
                                            "x":150,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NpcShopItemDisplay,
                                    "id":"itemDisplay0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":45,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NpcShopItemDisplay,
                                    "id":"itemDisplay1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":250,
                                            "y":45,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NpcShopItemDisplay,
                                    "id":"itemDisplay2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":130,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NpcShopItemDisplay,
                                    "id":"itemDisplay3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":250,
                                            "y":130,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NpcShopItemDisplay,
                                    "id":"itemDisplay4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":215,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NpcShopItemDisplay,
                                    "id":"itemDisplay5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":250,
                                            "y":215,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelectorOnly,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.bottom = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"changeCall":pageHandler});
                                    }
                                })]
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

        public function NpcShopPanel()
        {
            mx_internal::_document = this;
            this.width = 525;
            this.height = 410;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NpcShopPanel._watcherSetupUtil = _arg_1;
        }


        private function updateCurrency(_arg_1:Event=null):void
        {
            var _local_2:Object = ViewManager.NPCSHOP_CONFIG[_shopId];
            if (_shopId == "4")
            {
                currency.text = "";
                return;
            };
            currency.text = ((_local_2) ? (_local_2.score + ((_core.player.hasOwnProperty(_local_2.prop)) ? _core.player[_local_2.prop] : 0)) : "");
        }

        [Bindable(event="propertyChange")]
        public function get zhishiLink():LinkButton
        {
            return (this._1124544653zhishiLink);
        }

        public function set pageTab(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._803559802pageTab;
            if (_local_2 !== _arg_1)
            {
                this._803559802pageTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTab", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:String):void
        {
            var _local_4:Object;
            var _local_5:String;
            var _local_6:Array;
            _core.remote.call("updateLimit", new Responder(onUpdateLimit));
            _itemDict = {};
            _shopId = _arg_1;
            var _local_2:Object = DataManager.getInstance().gameDataIndex;
            var _local_3:Object = _local_2[GamePredef.TBL_CREDIT][_shopId];
            for each (_local_4 in _local_3)
            {
                if (_local_4.isSell != 0)
                {
                    _local_5 = _local_4.tab;
                    _itemDict[_local_5] = ((_itemDict[_local_5]) || ([]));
                    _local_4["position"] = Number(_local_4["position"]);
                    _itemDict[_local_5].push(_local_4);
                };
            };
            _pageDict = {};
            for (_local_5 in _itemDict)
            {
                _local_6 = _itemDict[_local_5];
                ((_local_6) && (_local_6.sortOn("position", Array.NUMERIC)));
                _pageDict[_local_5] = {};
                _pageDict[_local_5][CP] = 1;
                _pageDict[_local_5][TP] = Math.ceil((_local_6.length / PAGE_NUM));
            };
            this.updateShop();
        }

        private function helpInfo():void
        {
            var _local_1:String = Language.PRS_PANEL[44].toString();
            Alert.show(_local_1);
        }

        override public function initialize():void
        {
            var target:NpcShopPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NpcShopPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NpcShopPanelWatcherSetupUtil");
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
        public function get currency():Label
        {
            return (this._575402001currency);
        }

        private function onUpdateLimit(_arg_1:Object=null):void
        {
            if (_arg_1)
            {
                _core.player.creditDayDict = _arg_1.dayDict;
                _core.player.creditWeekDict = _arg_1.weekDict;
                _core.player.creditMonthDict = _arg_1.monthDict;
                _core.player.creditTotalDict = _arg_1.totalDict;
            };
            this.updatePage();
            this.show();
        }

        public function __pageTab_tabChanged(_arg_1:DressEvent):void
        {
            tabHandler(_arg_1);
        }

        public function __zhishiLink_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        public function set currency(_arg_1:Label):void
        {
            var _local_2:Object = this._575402001currency;
            if (_local_2 !== _arg_1)
            {
                this._575402001currency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currency", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set hintText(_arg_1:Label):void
        {
            var _local_2:Object = this._1473774508hintText;
            if (_local_2 !== _arg_1)
            {
                this._1473774508hintText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hintText", _local_2, _arg_1));
            };
        }

        private function _NpcShopPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PRS_PANEL[42];
        }

        private function pageHandler():void
        {
            if (!this.initialized)
            {
                return;
            };
            var _local_1:int = (pageTab.selectedIndex + 1);
            if (((!(_pageDict)) || (!(_pageDict[_local_1]))))
            {
                return;
            };
            _pageDict[_local_1][TP] = pageSelector.totalPage;
            _pageDict[_local_1][CP] = pageSelector.curPage;
            this.updatePage();
        }

        public function set itemDisplay0(_arg_1:NpcShopItemDisplay):void
        {
            var _local_2:Object = this._913513441itemDisplay0;
            if (_local_2 !== _arg_1)
            {
                this._913513441itemDisplay0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDisplay0", _local_2, _arg_1));
            };
        }

        public function set titleBar(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1870028133titleBar;
            if (_local_2 !== _arg_1)
            {
                this._1870028133titleBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleBar", _local_2, _arg_1));
            };
        }

        public function set itemDisplay2(_arg_1:NpcShopItemDisplay):void
        {
            var _local_2:Object = this._913513443itemDisplay2;
            if (_local_2 !== _arg_1)
            {
                this._913513443itemDisplay2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDisplay2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemDisplay5():NpcShopItemDisplay
        {
            return (this._913513446itemDisplay5);
        }

        public function set itemDisplay1(_arg_1:NpcShopItemDisplay):void
        {
            var _local_2:Object = this._913513442itemDisplay1;
            if (_local_2 !== _arg_1)
            {
                this._913513442itemDisplay1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDisplay1", _local_2, _arg_1));
            };
        }

        public function set itemDisplay3(_arg_1:NpcShopItemDisplay):void
        {
            var _local_2:Object = this._913513444itemDisplay3;
            if (_local_2 !== _arg_1)
            {
                this._913513444itemDisplay3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDisplay3", _local_2, _arg_1));
            };
        }

        public function set itemDisplay4(_arg_1:NpcShopItemDisplay):void
        {
            var _local_2:Object = this._913513445itemDisplay4;
            if (_local_2 !== _arg_1)
            {
                this._913513445itemDisplay4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDisplay4", _local_2, _arg_1));
            };
        }

        public function set itemDisplay5(_arg_1:NpcShopItemDisplay):void
        {
            var _local_2:Object = this._913513446itemDisplay5;
            if (_local_2 !== _arg_1)
            {
                this._913513446itemDisplay5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemDisplay5", _local_2, _arg_1));
            };
        }

        public function set zhishiLink(_arg_1:LinkButton):void
        {
            var _local_2:Object = this._1124544653zhishiLink;
            if (_local_2 !== _arg_1)
            {
                this._1124544653zhishiLink = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "zhishiLink", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hintText():Label
        {
            return (this._1473774508hintText);
        }

        private function _NpcShopPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                currency.filters = _arg_1;
            }, "currency.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                hintText.filters = _arg_1;
            }, "hintText.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PRS_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                zhishiLink.label = _arg_1;
            }, "zhishiLink.label");
            result[3] = binding;
            return (result);
        }

        private function updateShop():void
        {
            if (!this.initialized)
            {
                this.callLater(updateShop);
                return;
            };
            pageTab.selectedIndex = 0;
            var _local_1:int = (pageTab.selectedIndex + 1);
            if (((_pageDict) && (_pageDict[_local_1])))
            {
                pageSelector.totalPage = _pageDict[_local_1][TP];
                pageSelector.curPage = _pageDict[_local_1][CP];
            };
            var _local_2:Object = ViewManager.NPCSHOP_CONFIG[_shopId];
            if (!_local_2)
            {
                return;
            };
            titleBar.text = _local_2.name;
            pageTab.dataArray = _local_2.data;
            hintText.text = _local_2.hint;
            if (_shopId == "1")
            {
                zhishiLink.visible = true;
            }
            else
            {
                zhishiLink.visible = false;
            };
            if (_watcher)
            {
                _watcher.unwatch();
                _watcher = null;
            };
            _watcher = ChangeWatcher.watch(_core.player, _local_2.prop, updateCurrency);
            this.updateCurrency();
        }

        [Bindable(event="propertyChange")]
        public function get itemDisplay1():NpcShopItemDisplay
        {
            return (this._913513442itemDisplay1);
        }

        [Bindable(event="propertyChange")]
        public function get itemDisplay2():NpcShopItemDisplay
        {
            return (this._913513443itemDisplay2);
        }

        [Bindable(event="propertyChange")]
        public function get itemDisplay3():NpcShopItemDisplay
        {
            return (this._913513444itemDisplay3);
        }

        [Bindable(event="propertyChange")]
        public function get itemDisplay4():NpcShopItemDisplay
        {
            return (this._913513445itemDisplay4);
        }

        [Bindable(event="propertyChange")]
        public function get itemDisplay0():NpcShopItemDisplay
        {
            return (this._913513441itemDisplay0);
        }

        [Bindable(event="propertyChange")]
        public function get titleBar():BasicTitleCanvas
        {
            return (this._1870028133titleBar);
        }

        private function tabHandler(_arg_1:Event):void
        {
            if (!this.initialized)
            {
                return;
            };
            var _local_2:int = (pageTab.selectedIndex + 1);
            if (((!(_pageDict)) || (!(_pageDict[_local_2]))))
            {
                return;
            };
            pageSelector.totalPage = _pageDict[_local_2][TP];
            pageSelector.curPage = _pageDict[_local_2][CP];
            this.updatePage();
        }

        private function updatePage():void
        {
            var _local_7:int;
            var _local_8:Object;
            var _local_9:NpcShopItemDisplay;
            var _local_10:String;
            if (!this.initialized)
            {
                this.callLater(updatePage);
                return;
            };
            var _local_1:int = (pageTab.selectedIndex + 1);
            if (((!(_itemDict)) || (!(_itemDict[_local_1]))))
            {
                return;
            };
            if (((!(_pageDict)) || (!(_pageDict[_local_1]))))
            {
                return;
            };
            var _local_2:Array = _itemDict[_local_1];
            var _local_3:Object = _pageDict[_local_1];
            var _local_4:int = ((_local_3[CP] - 1) * PAGE_NUM);
            var _local_5:int = (_local_4 + PAGE_NUM);
            var _local_6:int = _local_4;
            while (_local_6 < _local_5)
            {
                _local_7 = (_local_6 - _local_4);
                _local_8 = _local_2[_local_6];
                _local_9 = this[("itemDisplay" + _local_7)];
                _local_10 = ((_local_8) ? _local_8.id : null);
                _local_9.updateView(_local_10);
                _local_6++;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

