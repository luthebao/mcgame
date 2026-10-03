// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GrouponPanel_inlineComponent3

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.VBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class GrouponPanel_inlineComponent3 extends VBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _GrouponPanel_inlineComponent3_Label1:Label;
        public var _GrouponPanel_inlineComponent3_Label3:Label;
        public var _GrouponPanel_inlineComponent3_Label2:Label;
        private var _88844982outerDocument:GrouponPanel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":VBox,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_GrouponPanel_inlineComponent3_Label1",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"percentWidth":100});
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "propertiesFactory":function ():Object
                        {
                            return ({"percentWidth":100});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_GrouponPanel_inlineComponent3_Label2",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"percentWidth":100});
                        }
                    }), new UIComponentDescriptor({
                        "type":HRule,
                        "propertiesFactory":function ():Object
                        {
                            return ({"percentWidth":100});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_GrouponPanel_inlineComponent3_Label3",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"percentWidth":100});
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GrouponPanel_inlineComponent3()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GrouponPanel_inlineComponent3._watcherSetupUtil = _arg_1;
        }


        private function _GrouponPanel_inlineComponent3_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = data.rebate0;
            _local_1 = data.rebate1;
            _local_1 = data.rebate2;
        }

        override public function initialize():void
        {
            var target:GrouponPanel_inlineComponent3;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GrouponPanel_inlineComponent3_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GrouponPanel_inlineComponent3WatcherSetupUtil");
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

        private function _GrouponPanel_inlineComponent3_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = data.rebate0;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_inlineComponent3_Label1.text = _arg_1;
            }, "_GrouponPanel_inlineComponent3_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = data.rebate1;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_inlineComponent3_Label2.text = _arg_1;
            }, "_GrouponPanel_inlineComponent3_Label2.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = data.rebate2;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponPanel_inlineComponent3_Label3.text = _arg_1;
            }, "_GrouponPanel_inlineComponent3_Label3.text");
            result[2] = binding;
            return (result);
        }

        public function set outerDocument(_arg_1:GrouponPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get outerDocument():GrouponPanel
        {
            return (this._88844982outerDocument);
        }


    }
}//package com.qeedoo.ui.view.compDragable

