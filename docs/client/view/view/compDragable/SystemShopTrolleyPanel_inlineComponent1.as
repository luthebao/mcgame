// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SystemShopTrolleyPanel_inlineComponent1

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
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

    public class SystemShopTrolleyPanel_inlineComponent1 extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _SystemShopTrolleyPanel_inlineComponent1_LinkButton1:LinkButton;
        private var _88844982outerDocument:SystemShopTrolleyPanel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_SystemShopTrolleyPanel_inlineComponent1_LinkButton1",
                        "events":{"click":"___SystemShopTrolleyPanel_inlineComponent1_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF0000;
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SystemShopTrolleyPanel_inlineComponent1()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SystemShopTrolleyPanel_inlineComponent1._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get outerDocument():SystemShopTrolleyPanel
        {
            return (this._88844982outerDocument);
        }

        private function _SystemShopTrolleyPanel_inlineComponent1_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ((" " + "") + Language.GAMEPREDEF_S[122]);
        }

        override public function initialize():void
        {
            var target:SystemShopTrolleyPanel_inlineComponent1;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SystemShopTrolleyPanel_inlineComponent1_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SystemShopTrolleyPanel_inlineComponent1WatcherSetupUtil");
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

        public function set outerDocument(_arg_1:SystemShopTrolleyPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        public function ___SystemShopTrolleyPanel_inlineComponent1_LinkButton1_click(_arg_1:MouseEvent):void
        {
            parentDocument.removeGoods(data);
        }

        private function _SystemShopTrolleyPanel_inlineComponent1_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((" " + "") + Language.GAMEPREDEF_S[122]);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopTrolleyPanel_inlineComponent1_LinkButton1.label = _arg_1;
            }, "_SystemShopTrolleyPanel_inlineComponent1_LinkButton1.label");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

