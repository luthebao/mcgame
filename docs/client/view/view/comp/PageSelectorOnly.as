// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PageSelectorOnly

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextInput;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
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

    public class PageSelectorOnly extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _319324206prePage:FilterButton;
        private var _1424273442nextPage:FilterButton;
        private var _1275986905pageShower:TextInput;
        public var changeCall:Function;
        private var _curPage:int = 1;
        public var setChange:Boolean;
        private var _totalPage:int = 1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.verticalAlign = "middle";
                            this.horizontalGap = 4;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"prePage",
                                    "events":{"click":"__prePage_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"LastPage",
                                            "width":48,
                                            "height":20,
                                            "buttonMode":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextInput,
                                    "id":"pageShower",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"PageNoIndicator",
                                            "mouseEnabled":false,
                                            "mouseChildren":false,
                                            "width":45,
                                            "height":17,
                                            "editable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"nextPage",
                                    "events":{"click":"__nextPage_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"LastPage",
                                            "width":48,
                                            "height":20,
                                            "buttonMode":true
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PageSelectorOnly()
        {
            mx_internal::_document = this;
            this.addEventListener("creationComplete", ___PageSelectorOnly_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PageSelectorOnly._watcherSetupUtil = _arg_1;
        }


        public function ___PageSelectorOnly_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get pageShower():TextInput
        {
            return (this._1275986905pageShower);
        }

        public function __nextPage_click(_arg_1:MouseEvent):void
        {
            pageHandler(true);
        }

        private function updateView():void
        {
            if (!this.initialized)
            {
                this.callLater(updateView);
                return;
            };
            pageShower.text = ((_curPage + "/") + _totalPage);
            prePage.enabled = (_curPage > 1);
            nextPage.enabled = (_curPage < _totalPage);
        }

        override public function initialize():void
        {
            var target:PageSelectorOnly;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PageSelectorOnly_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PageSelectorOnlyWatcherSetupUtil");
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
        public function get prePage():FilterButton
        {
            return (this._319324206prePage);
        }

        public function __prePage_click(_arg_1:MouseEvent):void
        {
            pageHandler(false);
        }

        public function set curPage(_arg_1:int):void
        {
            if ((_arg_1 < 1))
            {
                _arg_1 = 1;
            };
            if (_curPage == _arg_1)
            {
                return;
            };
            _curPage = _arg_1;
            if (_curPage > _totalPage)
            {
                _curPage = _totalPage;
            };
            this.updateView();
            (((setChange) && (changeCall)) && (changeCall()));
        }

        [Bindable(event="propertyChange")]
        public function get nextPage():FilterButton
        {
            return (this._1424273442nextPage);
        }

        private function _PageSelectorOnly_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PAGE_SELECTOR[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                prePage.label = _arg_1;
            }, "prePage.label");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                prePage.filters = _arg_1;
            }, "prePage.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageShower.filters = _arg_1;
            }, "pageShower.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PAGE_SELECTOR[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextPage.label = _arg_1;
            }, "nextPage.label");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nextPage.filters = _arg_1;
            }, "nextPage.filters");
            result[4] = binding;
            return (result);
        }

        public function set prePage(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._319324206prePage;
            if (_local_2 !== _arg_1)
            {
                this._319324206prePage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prePage", _local_2, _arg_1));
            };
        }

        public function set totalPage(_arg_1:int):void
        {
            if ((_arg_1 < 1))
            {
                _arg_1 = 1;
            };
            if (_totalPage == _arg_1)
            {
                return;
            };
            _totalPage = _arg_1;
            if (_curPage > _totalPage)
            {
                _curPage = _totalPage;
            };
            this.updateView();
            (((setChange) && (changeCall)) && (changeCall()));
        }

        public function get curPage():int
        {
            return (_curPage);
        }

        public function set nextPage(_arg_1:FilterButton):void
        {
            var _local_2:Object = this._1424273442nextPage;
            if (_local_2 !== _arg_1)
            {
                this._1424273442nextPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPage", _local_2, _arg_1));
            };
        }

        public function get totalPage():int
        {
            return (_totalPage);
        }

        public function set pageShower(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1275986905pageShower;
            if (_local_2 !== _arg_1)
            {
                this._1275986905pageShower = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageShower", _local_2, _arg_1));
            };
        }

        private function pageHandler(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _curPage++;
            }
            else
            {
                _curPage--;
            };
            if (_curPage > _totalPage)
            {
                _curPage = _totalPage;
                return;
            };
            if (_curPage < 1)
            {
                _curPage = 1;
                return;
            };
            this.updateView();
            ((changeCall) && (changeCall()));
        }

        private function _PageSelectorOnly_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PAGE_SELECTOR[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.PAGE_SELECTOR[1];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }


    }
}//package com.qeedoo.ui.view.comp

