// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.RecipeExchangePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.event.DressEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import mx.events.FlexEvent;
    import flash.events.Event;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.ui.utils.LanguageUtil;
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

    public class RecipeExchangePanel extends DragableCanvas implements IBindingClient 
    {

        private static const TYPE_RECIPE:int = 1;
        private static const TYPE_DRESS:int = 1;
        private static const TYPE_FLYER:int = 2;
        private static const PAGE_NUM:int = 5;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _dressArr:Array;
        private var _1978788499recipeItem4:RecipeItem;
        private var _1978788495recipeItem0:RecipeItem;
        private var _pageFlyer:int = 1;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _1978788498recipeItem3:RecipeItem;
        private var _flyerArr:Array;
        private var _1978788497recipeItem2:RecipeItem;
        private var _2128961247scoreText:Label;
        private var _803559802pageTab:HButtonTab;
        public var _RecipeExchangePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1978788496recipeItem1:RecipeItem;
        private var _pageDress:int = 1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_RecipeExchangePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "events":{"tabChanged":"__pageTab_tabChanged"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":41,
                                "selectedIndex":0,
                                "tabWidth":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "x":15,
                                "y":60,
                                "width":270,
                                "height":325,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"InputContent",
                                            "width":250,
                                            "height":30,
                                            "y":10,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"scoreText",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"x":7});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":45,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RecipeItem,
                                                "id":"recipeItem0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"visible":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeItem,
                                                "id":"recipeItem1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"visible":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeItem,
                                                "id":"recipeItem2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"visible":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeItem,
                                                "id":"recipeItem3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"visible":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeItem,
                                                "id":"recipeItem4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"visible":false});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":PageSelectorOnly,
                                    "id":"pageSelector",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "setChange":false,
                                            "changeCall":pageHandler
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RecipeExchangePanel()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 400;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___RecipeExchangePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RecipeExchangePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
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

        [Bindable(event="propertyChange")]
        public function get recipeItem0():RecipeItem
        {
            return (this._1978788495recipeItem0);
        }

        override public function initialize():void
        {
            var target:RecipeExchangePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RecipeExchangePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_RecipeExchangePanelWatcherSetupUtil");
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
        public function get recipeItem2():RecipeItem
        {
            return (this._1978788497recipeItem2);
        }

        [Bindable(event="propertyChange")]
        public function get recipeItem4():RecipeItem
        {
            return (this._1978788499recipeItem4);
        }

        public function __pageTab_tabChanged(_arg_1:DressEvent):void
        {
            tabChangeHandler(_arg_1);
        }

        private function updateView():void
        {
            var _local_2:Object;
            _dressArr = [];
            _flyerArr = [];
            var _local_1:Object = GameData.d[GamePredef.TBL_RECIPE];
            for each (_local_2 in _local_1)
            {
                if (_local_2.type == TYPE_RECIPE)
                {
                    if (_local_2.kind == TYPE_DRESS)
                    {
                        _dressArr.push(_local_2);
                    }
                    else
                    {
                        if (_local_2.kind == TYPE_FLYER)
                        {
                            _flyerArr.push(_local_2);
                        };
                    };
                };
            };
            _dressArr.sortOn("position", Array.NUMERIC);
            _flyerArr.sortOn("position", Array.NUMERIC);
            updateSelector();
            updatePage();
            changeHandler();
        }

        public function set recipeItem0(_arg_1:RecipeItem):void
        {
            var _local_2:Object = this._1978788495recipeItem0;
            if (_local_2 !== _arg_1)
            {
                this._1978788495recipeItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeItem0", _local_2, _arg_1));
            };
        }

        public function set recipeItem1(_arg_1:RecipeItem):void
        {
            var _local_2:Object = this._1978788496recipeItem1;
            if (_local_2 !== _arg_1)
            {
                this._1978788496recipeItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeItem1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeItem3():RecipeItem
        {
            return (this._1978788498recipeItem3);
        }

        public function set recipeItem2(_arg_1:RecipeItem):void
        {
            var _local_2:Object = this._1978788497recipeItem2;
            if (_local_2 !== _arg_1)
            {
                this._1978788497recipeItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeItem2", _local_2, _arg_1));
            };
        }

        private function _RecipeExchangePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DRESS_PANEL[21];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[40];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        private function cleanView():void
        {
            var _local_2:RecipeItem;
            _pageDress = 1;
            _pageFlyer = 1;
            _dressArr = null;
            _flyerArr = null;
            var _local_1:int;
            while (_local_1 < PAGE_NUM)
            {
                _local_2 = this[("recipeItem" + _local_1)];
                _local_2.clean();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeItem1():RecipeItem
        {
            return (this._1978788496recipeItem1);
        }

        public function set recipeItem4(_arg_1:RecipeItem):void
        {
            var _local_2:Object = this._1978788499recipeItem4;
            if (_local_2 !== _arg_1)
            {
                this._1978788499recipeItem4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeItem4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        private function onComplete():void
        {
            DressLogic.dressProxy.addEventListener(DressEvent.DRESS_CHANGE, changeHandler);
            this.updateView();
        }

        private function pageHandler():void
        {
            if (pageTab.selectedIndex == 0)
            {
                _pageDress = pageSelector.curPage;
            }
            else
            {
                _pageFlyer = pageSelector.curPage;
            };
            updatePage();
        }

        public function set recipeItem3(_arg_1:RecipeItem):void
        {
            var _local_2:Object = this._1978788498recipeItem3;
            if (_local_2 !== _arg_1)
            {
                this._1978788498recipeItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeItem3", _local_2, _arg_1));
            };
        }

        public function set scoreText(_arg_1:Label):void
        {
            var _local_2:Object = this._2128961247scoreText;
            if (_local_2 !== _arg_1)
            {
                this._2128961247scoreText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreText", _local_2, _arg_1));
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

        private function updateSelector():void
        {
            var _local_1:Array = ((pageTab.selectedIndex == 0) ? _dressArr : _flyerArr);
            var _local_2:int = ((_local_1) ? _local_1.length : 0);
            pageSelector.totalPage = Math.ceil((_local_2 / PAGE_NUM));
            if (pageTab.selectedIndex == 0)
            {
                _pageDress = pageSelector.curPage;
            }
            else
            {
                _pageFlyer = pageSelector.curPage;
            };
        }

        public function ___RecipeExchangePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onComplete();
        }

        [Bindable(event="propertyChange")]
        public function get scoreText():Label
        {
            return (this._2128961247scoreText);
        }

        private function _RecipeExchangePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RecipeExchangePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_RecipeExchangePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DRESS_PANEL[40]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                scoreText.filters = _arg_1;
            }, "scoreText.filters");
            result[3] = binding;
            return (result);
        }

        private function tabChangeHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            pageSelector.curPage = ((pageTab.selectedIndex == 0) ? _pageDress : _pageFlyer);
            this.updateSelector();
            this.updatePage();
        }

        private function updatePage():void
        {
            var _local_5:int;
            var _local_6:RecipeItem;
            var _local_7:Object;
            var _local_1:Array = ((pageTab.selectedIndex == 0) ? _dressArr : _flyerArr);
            if (((!(_local_1)) || (_local_1.length <= 0)))
            {
                this.cleanView();
                return;
            };
            var _local_2:int = ((pageSelector.curPage - 1) * PAGE_NUM);
            var _local_3:int = (_local_2 + PAGE_NUM);
            var _local_4:int = _local_2;
            while (_local_4 < _local_3)
            {
                _local_5 = (_local_4 - _local_2);
                _local_6 = this[("recipeItem" + _local_5)];
                _local_7 = _local_1[_local_4];
                _local_6.visible = true;
                if (!_local_7)
                {
                    _local_6.clean();
                }
                else
                {
                    _local_6.updateView(_local_7.id);
                };
                _local_4++;
            };
        }

        private function changeHandler(_arg_1:Event=null):void
        {
            var _local_3:Object;
            var _local_2:int;
            if (_core.player.dressInfo)
            {
                _local_3 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_3) && (_local_3.hasOwnProperty("score"))))
                {
                    _local_2 = ((Number(_local_3.score) > 0) ? Number(_local_3.score) : 0);
                };
            };
            scoreText.text = LanguageUtil.replace(Language.DRESS_PANEL[41], {"score":_local_2});
        }


    }
}//package com.qeedoo.ui.view.compDragable

