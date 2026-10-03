// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DecorateDisplay

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.core.UIComponent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.event.DecoEvent;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.utils.JSONUtil;
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

    public class DecorateDisplay extends Canvas implements IBindingClient 
    {

        private static const PAGE_NUM:int = 4;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _490725074decoItem2:DecorateItem;
        public var position:Number;
        private var _607339634pageSelector:PageSelectorOnly;
        public var decoCall:Function;
        private var _curPage:int = 1;
        private var _490725075decoItem3:DecorateItem;
        public var decoAll:Array;
        private var _490725072decoItem0:DecorateItem;
        private var _1870010120titleTxt:Label;
        private var _490725073decoItem1:DecorateItem;
        private var _totalPage:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":185,
                    "height":320,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"StandardTitle",
                                "mouseEnabled":false,
                                "y":4,
                                "width":160,
                                "height":15,
                                "mouseChildren":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"titleTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.textAlign = "center";
                                        this.horizontalCenter = "0";
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DecorateItem,
                        "id":"decoItem0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":28
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DecorateItem,
                        "id":"decoItem1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":91
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DecorateItem,
                        "id":"decoItem2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":154
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DecorateItem,
                        "id":"decoItem3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":217
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "changeCall":updatePage
                            });
                        }
                    })]
                });
            }
        });
        public var decoArray:Array = new Array();
        public var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DecorateDisplay()
        {
            mx_internal::_document = this;
            this.width = 185;
            this.height = 320;
            this.styleName = "CanvasBorder";
            this.addEventListener("creationComplete", ___DecorateDisplay_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DecorateDisplay._watcherSetupUtil = _arg_1;
        }


        public function updateView():void
        {
            var _local_1:Number = activeShowNumByPosition(this.position);
            var _local_2:Number = ((position) ? decoArray.length : decoAll.length);
            titleTxt.text = (((((Language.DECORATE_PANEL[12] + "(") + _local_1) + "/") + _local_2) + ")");
            _totalPage = (pageSelector.totalPage = Math.ceil((_local_2 / PAGE_NUM)));
            _curPage = pageSelector.curPage;
            var _local_3:Number = ((_curPage - 1) * 4);
            var _local_4:Number = 0;
            var _local_5:int;
            while (_local_5 < PAGE_NUM)
            {
                if (this.position == 0)
                {
                    if ((_local_3 + _local_5) >= decoAll.length)
                    {
                        (this[("decoItem" + _local_5)] as UIComponent).visible = false;
                    }
                    else
                    {
                        _local_4 = decoAll[(_local_3 + _local_5)].id;
                        (this[("decoItem" + _local_5)] as DecorateItem).updateView(_local_4);
                        if (!(this[("decoItem" + _local_5)] as UIComponent).visible)
                        {
                            (this[("decoItem" + _local_5)] as UIComponent).visible = true;
                        };
                    };
                }
                else
                {
                    if ((_local_3 + _local_5) >= decoArray.length)
                    {
                        (this[("decoItem" + _local_5)] as UIComponent).visible = false;
                    }
                    else
                    {
                        _local_4 = decoArray[(_local_3 + _local_5)].id;
                        (this[("decoItem" + _local_5)] as DecorateItem).updateView(_local_4);
                        if (!(this[("decoItem" + _local_5)] as UIComponent).visible)
                        {
                            (this[("decoItem" + _local_5)] as UIComponent).visible = true;
                        };
                    };
                };
                _local_5++;
            };
        }

        override public function initialize():void
        {
            var target:DecorateDisplay;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DecorateDisplay_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DecorateDisplayWatcherSetupUtil");
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
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
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

        public function set decoItem0(_arg_1:DecorateItem):void
        {
            var _local_2:Object = this._490725072decoItem0;
            if (_local_2 !== _arg_1)
            {
                this._490725072decoItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoItem0", _local_2, _arg_1));
            };
        }

        private function _DecorateDisplay_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function set decoItem2(_arg_1:DecorateItem):void
        {
            var _local_2:Object = this._490725074decoItem2;
            if (_local_2 !== _arg_1)
            {
                this._490725074decoItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoItem2", _local_2, _arg_1));
            };
        }

        private function _DecorateDisplay_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                titleTxt.filters = _arg_1;
            }, "titleTxt.filters");
            result[0] = binding;
            return (result);
        }

        public function ___DecorateDisplay_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            onComplete();
        }

        public function set decoItem1(_arg_1:DecorateItem):void
        {
            var _local_2:Object = this._490725073decoItem1;
            if (_local_2 !== _arg_1)
            {
                this._490725073decoItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoItem1", _local_2, _arg_1));
            };
        }

        private function onComplete():void
        {
            var _local_1:Object;
            decoAll = (GameData.d[GamePredef.TBL_DECO_SHOW] as Array).slice(1);
            trace("魂器display创建完毕--------------");
            if (!position)
            {
                decoAll.sortOn("position");
            }
            else
            {
                for each (_local_1 in decoAll)
                {
                    if (_local_1["position"] == position)
                    {
                        decoArray.push(_local_1);
                    };
                };
            };
            (this[("decoItem" + 0)] as DecorateItem).selected = true;
            addEventListener(DecoEvent.DECO_CLICK, decoHandler);
            trace(("hasEvENTlISTENER:>>>" + this.hasEventListener(DecoEvent.DECO_CLICK)));
        }

        public function set decoItem3(_arg_1:DecorateItem):void
        {
            var _local_2:Object = this._490725075decoItem3;
            if (_local_2 !== _arg_1)
            {
                this._490725075decoItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoItem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get decoItem0():DecorateItem
        {
            return (this._490725072decoItem0);
        }

        [Bindable(event="propertyChange")]
        public function get decoItem1():DecorateItem
        {
            return (this._490725073decoItem1);
        }

        [Bindable(event="propertyChange")]
        public function get decoItem2():DecorateItem
        {
            return (this._490725074decoItem2);
        }

        private function decoHandler(_arg_1:DecoEvent):void
        {
            trace("接受到decoitem的点击事件！------------");
            if (!(_arg_1.target is DecorateItem))
            {
                return;
            };
            var _local_2:DecorateItem = (_arg_1.target as DecorateItem);
            if (!_local_2.decoId)
            {
                return;
            };
            var _local_3:int;
            while (_local_3 < PAGE_NUM)
            {
                (this[("decoItem" + _local_3)] as DecorateItem).selected = false;
                _local_3++;
            };
            trace("让选中的decoitem显示光环------------");
            _local_2.selected = true;
            ((decoCall) && (decoCall(_local_2.decoId)));
        }

        [Bindable(event="propertyChange")]
        public function get decoItem3():DecorateItem
        {
            return (this._490725075decoItem3);
        }

        private function activeShowNumByPosition(_arg_1:Number):Number
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_2:Number = 0;
            switch (_arg_1)
            {
                case 0:
                    for (_local_4 in _core.player.decoInfo)
                    {
                        _local_3 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_core.player.decoInfo[_local_4].activeFlag));
                        for (_local_5 in _local_3["s"])
                        {
                            _local_2++;
                        };
                    };
                    break;
                case 1:
                    _local_3 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_core.player.decoInfo[_arg_1].activeFlag));
                    for (_local_5 in _local_3["s"])
                    {
                        _local_2++;
                    };
                    break;
                case 2:
                    _local_3 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_core.player.decoInfo[_arg_1].activeFlag));
                    for (_local_5 in _local_3["s"])
                    {
                        _local_2++;
                    };
                    break;
                case 3:
                    _local_3 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_core.player.decoInfo[_arg_1].activeFlag));
                    for (_local_5 in _local_3["s"])
                    {
                        _local_2++;
                    };
                    break;
                case 4:
                    _local_3 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_core.player.decoInfo[_arg_1].activeFlag));
                    for (_local_5 in _local_3["s"])
                    {
                        _local_2++;
                    };
                    break;
            };
            return (_local_2);
        }

        public function set titleTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1870010120titleTxt;
            if (_local_2 !== _arg_1)
            {
                this._1870010120titleTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleTxt", _local_2, _arg_1));
            };
        }

        public function updatePage():void
        {
            trace("**********更新页面*******");
            this.updateView();
        }

        [Bindable(event="propertyChange")]
        public function get titleTxt():Label
        {
            return (this._1870010120titleTxt);
        }


    }
}//package com.qeedoo.ui.view.compDragable

