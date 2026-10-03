// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PageSelector

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.TextInput;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
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

    public class PageSelector extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _currentPageNo:int = 0;
        private var _320271553btnLastPage:Button;
        private var _1090881890btnNextPage:Button;
        public var pageIndicatorPattern:String = "{0} / {1}";
        public var onPageCleared:Function = null;
        private var _1229795408txtPageIndicator:TextInput;
        private var _pageCount:int = 0;
        public var onPageChanged:Function = null;
        private var _itemCountPerPage:int = 5;
        private var _totalItemCount:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.verticalAlign = "middle";
                            this.horizontalGap = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnLastPage",
                                    "events":{"buttonDown":"__btnLastPage_buttonDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"LastPage",
                                            "autoRepeat":true,
                                            "width":45,
                                            "useHandCursor":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"txtPageIndicator",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"PageNoIndicator",
                                            "width":50,
                                            "height":16,
                                            "text":"0",
                                            "y":2.5,
                                            "editable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnNextPage",
                                    "events":{"buttonDown":"__btnNextPage_buttonDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"NextPage",
                                            "autoRepeat":true,
                                            "width":45,
                                            "useHandCursor":true,
                                            "y":0
                                        });
                                    }
                                })]});
                        }
                    })]});
            }
        });
        private var _369863342lastBtnLabel:String = Language.PAGE_SELECTOR[0];
        private var _1047590411nextBtnLabel:String = Language.PAGE_SELECTOR[1];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PageSelector()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PageSelector._watcherSetupUtil = _arg_1;
        }


        private function _PageSelector_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = lastBtnLabel;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = nextBtnLabel;
        }

        override public function initialize():void
        {
            var target:PageSelector;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PageSelector_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PageSelectorWatcherSetupUtil");
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

        public function refreshPage():void
        {
            var _local_1:int;
            if (onPageCleared != null)
            {
                onPageCleared();
            };
            if (((!(onPageChanged == null)) && (_totalItemCount >= 0)))
            {
                _local_1 = _itemCountPerPage;
                if (_totalItemCount == 0)
                {
                    _local_1 = 0;
                }
                else
                {
                    if (_currentPageNo == (_pageCount - 1))
                    {
                        _local_1 = (_totalItemCount % _itemCountPerPage);
                        if (_local_1 == 0)
                        {
                            _local_1 = _itemCountPerPage;
                        };
                    };
                };
                onPageChanged((_itemCountPerPage * _currentPageNo), _local_1);
            };
        }

        public function __btnLastPage_buttonDown(_arg_1:FlexEvent):void
        {
            pageNo--;
        }

        public function __btnNextPage_buttonDown(_arg_1:FlexEvent):void
        {
            pageNo++;
        }

        public function set btnLastPage(_arg_1:Button):void
        {
            var _local_2:Object = this._320271553btnLastPage;
            if (_local_2 !== _arg_1)
            {
                this._320271553btnLastPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLastPage", _local_2, _arg_1));
            };
        }

        public function set nextBtnLabel(_arg_1:String):void
        {
            var _local_2:Object = this._1047590411nextBtnLabel;
            if (_local_2 !== _arg_1)
            {
                this._1047590411nextBtnLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextBtnLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextBtnLabel():String
        {
            return (this._1047590411nextBtnLabel);
        }

        public function setMidTextStyle(_arg_1:String):void
        {
            txtPageIndicator.styleName = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get btnNextPage():Button
        {
            return (this._1090881890btnNextPage);
        }

        [Bindable(event="propertyChange")]
        public function get lastBtnLabel():String
        {
            return (this._369863342lastBtnLabel);
        }

        public function get pageNo():int
        {
            return (_currentPageNo);
        }

        private function limitPageBoundary(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_pageCount == 0)))
            {
                _arg_1 = 0;
            }
            else
            {
                if (_arg_1 >= _pageCount)
                {
                    _arg_1 = (_pageCount - 1);
                };
            };
            return (_arg_1);
        }

        public function set btnNextPage(_arg_1:Button):void
        {
            var _local_2:Object = this._1090881890btnNextPage;
            if (_local_2 !== _arg_1)
            {
                this._1090881890btnNextPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnNextPage", _local_2, _arg_1));
            };
        }

        public function get pageSize():int
        {
            return (_itemCountPerPage);
        }

        public function get pageCount():int
        {
            return (_pageCount);
        }

        public function setNextBtnStyle(_arg_1:String):void
        {
            btnNextPage.styleName = _arg_1;
        }

        public function resetPageSeletor(_arg_1:int, _arg_2:int):void
        {
            _totalItemCount = _arg_1;
            _itemCountPerPage = _arg_2;
            _pageCount = Math.ceil((_totalItemCount / _itemCountPerPage));
            if (pageNo == 0)
            {
                pageNo = 0;
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtPageIndicator():TextInput
        {
            return (this._1229795408txtPageIndicator);
        }

        public function set currentPage(_arg_1:int):void
        {
            _currentPageNo = limitPageBoundary(_arg_1);
            if (_totalItemCount == 0)
            {
                txtPageIndicator.text = pageIndicatorPattern.replace("{0}", "0").replace("{1}", "0");
            }
            else
            {
                if (_pageCount >= 100)
                {
                    pageIndicatorPattern = "{0}/{1}";
                }
                else
                {
                    pageIndicatorPattern = "{0} / {1}";
                };
                txtPageIndicator.text = pageIndicatorPattern.replace("{0}", (_currentPageNo + 1)).replace("{1}", _pageCount);
            };
            updateControlAvailability();
            if (onPageCleared)
            {
                onPageCleared();
            };
        }

        public function get totalItemCount():int
        {
            return (_totalItemCount);
        }

        [Bindable(event="propertyChange")]
        public function get btnLastPage():Button
        {
            return (this._320271553btnLastPage);
        }

        public function set lastBtnLabel(_arg_1:String):void
        {
            var _local_2:Object = this._369863342lastBtnLabel;
            if (_local_2 !== _arg_1)
            {
                this._369863342lastBtnLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastBtnLabel", _local_2, _arg_1));
            };
        }

        private function _PageSelector_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = lastBtnLabel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLastPage.label = _arg_1;
            }, "btnLastPage.label");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txtPageIndicator.filters = _arg_1;
            }, "txtPageIndicator.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = nextBtnLabel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnNextPage.label = _arg_1;
            }, "btnNextPage.label");
            result[2] = binding;
            return (result);
        }

        private function updateControlAvailability():void
        {
            var _local_1:* = (_pageCount > 0);
            btnLastPage.enabled = ((_local_1) && (_currentPageNo > 0));
            btnNextPage.enabled = ((_local_1) && (_currentPageNo < (_pageCount - 1)));
            txtPageIndicator.enabled = _local_1;
        }

        public function set pageSize(_arg_1:int):void
        {
            _itemCountPerPage = _arg_1;
        }

        public function set pageNo(_arg_1:int):void
        {
            currentPage = _arg_1;
            refreshPage();
        }

        public function get itemCountPerPage():int
        {
            return (_itemCountPerPage);
        }

        public function setLastBtnStyle(_arg_1:String):void
        {
            btnLastPage.styleName = _arg_1;
        }

        public function set txtPageIndicator(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1229795408txtPageIndicator;
            if (_local_2 !== _arg_1)
            {
                this._1229795408txtPageIndicator = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPageIndicator", _local_2, _arg_1));
            };
        }

        public function initPageSeletor(_arg_1:int, _arg_2:int):void
        {
            if (((_arg_1 < 0) || (_arg_2 < 1)))
            {
                throw (new Error("Illegal Arguments for PageSelector"));
            };
            _totalItemCount = _arg_1;
            _itemCountPerPage = _arg_2;
            _pageCount = Math.ceil((_totalItemCount / _itemCountPerPage));
            pageNo = 0;
        }


    }
}//package com.qeedoo.ui.view.comp

