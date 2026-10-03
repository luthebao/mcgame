// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RuneBagComb

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
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

    public class RuneBagComb extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1361678900chaBag:RuneBag;
        private var _803559802pageTab:HButtonTab;
        private var _991704471petBag:RuneBag;
        public var _RuneBagComb_ViewStack1:ViewStack;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":210,
                    "height":340,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTab",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":1,
                                "selectedIndex":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"_RuneBagComb_ViewStack1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":195,
                                "height":320,
                                "y":20,
                                "x":7.5,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RuneBag,
                                    "id":"chaBag"
                                }), new UIComponentDescriptor({
                                    "type":RuneBag,
                                    "id":"petBag"
                                })]
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RuneBagComb()
        {
            mx_internal::_document = this;
            this.width = 210;
            this.height = 340;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RuneBagComb._watcherSetupUtil = _arg_1;
        }


        private function _RuneBagComb_bindingsSetup():Array
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
                return (Language.DECORATE_PANEL[33]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                _RuneBagComb_ViewStack1.selectedIndex = _arg_1;
            }, "_RuneBagComb_ViewStack1.selectedIndex");
            result[2] = binding;
            binding = new Binding(this, function ():uint
            {
                return (RuneBag.RUNE_CHAR_BAG);
            }, function (_arg_1:uint):void
            {
                chaBag.runeBagType = _arg_1;
            }, "chaBag.runeBagType");
            result[3] = binding;
            binding = new Binding(this, function ():uint
            {
                return (RuneBag.RUNE_PET_BAG);
            }, function (_arg_1:uint):void
            {
                petBag.runeBagType = _arg_1;
            }, "petBag.runeBagType");
            result[4] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        private function _RuneBagComb_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[33];
            _local_1 = pageTab.selectedIndex;
            _local_1 = RuneBag.RUNE_CHAR_BAG;
            _local_1 = RuneBag.RUNE_PET_BAG;
        }

        public function update():void
        {
            chaBag.update();
            petBag.update();
        }

        override public function initialize():void
        {
            var target:RuneBagComb;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RuneBagComb_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RuneBagCombWatcherSetupUtil");
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
        public function get chaBag():RuneBag
        {
            return (this._1361678900chaBag);
        }

        public function set petBag(_arg_1:RuneBag):void
        {
            var _local_2:Object = this._991704471petBag;
            if (_local_2 !== _arg_1)
            {
                this._991704471petBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petBag", _local_2, _arg_1));
            };
        }

        public function set chaBag(_arg_1:RuneBag):void
        {
            var _local_2:Object = this._1361678900chaBag;
            if (_local_2 !== _arg_1)
            {
                this._1361678900chaBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chaBag", _local_2, _arg_1));
            };
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
        public function get petBag():RuneBag
        {
            return (this._991704471petBag);
        }


    }
}//package com.qeedoo.ui.view.comp

