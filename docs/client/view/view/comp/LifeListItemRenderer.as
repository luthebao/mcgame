// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LifeListItemRenderer

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class LifeListItemRenderer extends HBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _LifeListItemRenderer_Label1:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":18,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_LifeListItemRenderer_Label1",
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":18});
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LifeListItemRenderer()
        {
            mx_internal::_document = this;
            this.height = 18;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LifeListItemRenderer._watcherSetupUtil = _arg_1;
        }


        private function _LifeListItemRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = data.name;
            _local_1 = ((data.isLearned) ? 0xFF00 : 0xFF0000);
        }

        override public function initialize():void
        {
            var target:LifeListItemRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LifeListItemRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_LifeListItemRendererWatcherSetupUtil");
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

        private function _LifeListItemRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = data.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _LifeListItemRenderer_Label1.text = _arg_1;
            }, "_LifeListItemRenderer_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():uint
            {
                return ((data.isLearned) ? 0xFF00 : 0xFF0000);
            }, function (_arg_1:uint):void
            {
                _LifeListItemRenderer_Label1.setStyle("color", _arg_1);
            }, "_LifeListItemRenderer_Label1.color");
            result[1] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

