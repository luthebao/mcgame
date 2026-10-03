// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FlowerAndEggHBox

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.view.compDragable.InputPanel;
    import com.qeedoo.game.view.ViewManager;
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

    public class FlowerAndEggHBox extends HBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _150170562btnDelPop:Button;
        private var _63121260btnAddPop:Button;
        private var _obj:Object = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnAddPop",
                        "events":{"click":"__btnAddPop_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnFlower"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnDelPop",
                        "events":{"click":"__btnDelPop_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnEgg"});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FlowerAndEggHBox()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.horizontalGap = 0;
            };
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FlowerAndEggHBox._watcherSetupUtil = _arg_1;
        }


        override public function set data(_arg_1:Object):void
        {
            _obj = _arg_1;
        }

        private function useFlower(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_core.hasFlowerNum() >= _arg_1)
            {
                _core.remote.addPopNum(_obj.name, _arg_1);
            }
            else
            {
                _core.sysMidNote(Language.CHARACTORINFOPANEL_S[16]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAddPop():Button
        {
            return (this._63121260btnAddPop);
        }

        [Bindable(event="propertyChange")]
        public function get btnDelPop():Button
        {
            return (this._150170562btnDelPop);
        }

        public function set btnDelPop(_arg_1:Button):void
        {
            var _local_2:Object = this._150170562btnDelPop;
            if (_local_2 !== _arg_1)
            {
                this._150170562btnDelPop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnDelPop", _local_2, _arg_1));
            };
        }

        private function _FlowerAndEggHBox_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHARACTORINFOPANEL_S[33];
            _local_1 = Language.CHARACTORINFOPANEL_S[34];
        }

        override public function initialize():void
        {
            var target:FlowerAndEggHBox;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FlowerAndEggHBox_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FlowerAndEggHBoxWatcherSetupUtil");
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

        public function __btnAddPop_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _FlowerAndEggHBox_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAddPop.toolTip = _arg_1;
            }, "btnAddPop.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARACTORINFOPANEL_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnDelPop.toolTip = _arg_1;
            }, "btnDelPop.toolTip");
            result[1] = binding;
            return (result);
        }

        public function set btnAddPop(_arg_1:Button):void
        {
            var _local_2:Object = this._63121260btnAddPop;
            if (_local_2 !== _arg_1)
            {
                this._63121260btnAddPop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAddPop", _local_2, _arg_1));
            };
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:InputPanel;
            var _local_5:InputPanel;
            switch (_arg_1.target.id)
            {
                case "btnAddPop":
                    _local_2 = _core.hasFlowerNum();
                    if (_local_2 > 0)
                    {
                        _local_4 = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
                        _local_4.showInputNum(Language.CHARACTORINFOPANEL_S[9], "", useFlower, 1, 1, _local_2);
                    }
                    else
                    {
                        _core.sysMidNote(Language.CHARACTORINFOPANEL_S[10]);
                    };
                    return;
                case "btnDelPop":
                    _local_3 = _core.hasEggNum();
                    if (_local_3 > 0)
                    {
                        _local_5 = InputPanel(_core.view.getUI(ViewManager.PANEL_INPUT));
                        _local_5.showInputNum(Language.ENEMYHBOX_S[9], "", useEgg, 1, 1, _local_3);
                    }
                    else
                    {
                        _core.sysMidNote(Language.ENEMYHBOX_S[8]);
                    };
                    return;
            };
        }

        public function __btnDelPop_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function useEgg(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_core.hasEggNum() >= _arg_1)
            {
                _core.remote.delPopNum(_obj.name, _arg_1);
            }
            else
            {
                _core.sysMidNote(Language.ENEMYHBOX_S[7]);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

