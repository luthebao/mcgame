// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WingAdvancedPanel_inlineComponent2

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
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

    public class WingAdvancedPanel_inlineComponent2 extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _WingAdvancedPanel_inlineComponent2_CheckBox1:CheckBox;
        private var _88844982outerDocument:WingAdvancedPanel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":40,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"_WingAdvancedPanel_inlineComponent2_CheckBox1",
                        "events":{"click":"___WingAdvancedPanel_inlineComponent2_CheckBox1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WingAdvancedPanel_inlineComponent2()
        {
            mx_internal::_document = this;
            this.width = 40;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WingAdvancedPanel_inlineComponent2._watcherSetupUtil = _arg_1;
        }


        private function _WingAdvancedPanel_inlineComponent2_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = data.selected;
        }

        private function _WingAdvancedPanel_inlineComponent2_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Boolean
            {
                return (data.selected);
            }, function (_arg_1:Boolean):void
            {
                _WingAdvancedPanel_inlineComponent2_CheckBox1.selected = _arg_1;
            }, "_WingAdvancedPanel_inlineComponent2_CheckBox1.selected");
            result[0] = binding;
            return (result);
        }

        public function ___WingAdvancedPanel_inlineComponent2_CheckBox1_click(_arg_1:MouseEvent):void
        {
            parentDocument.onCheckClick(data);
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():WingAdvancedPanel
        {
            return (this._88844982outerDocument);
        }

        override public function initialize():void
        {
            var target:WingAdvancedPanel_inlineComponent2;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WingAdvancedPanel_inlineComponent2_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WingAdvancedPanel_inlineComponent2WatcherSetupUtil");
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

        public function set outerDocument(_arg_1:WingAdvancedPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

