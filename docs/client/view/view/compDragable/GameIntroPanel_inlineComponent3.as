// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GameIntroPanel_inlineComponent3

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
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

    public class GameIntroPanel_inlineComponent3 extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _GameIntroPanel_inlineComponent3_LinkTextArea1:LinkTextArea;
        private var _88844982outerDocument:GameIntroPanel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":LinkTextArea,
                        "id":"_GameIntroPanel_inlineComponent3_LinkTextArea1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.borderStyle = "none";
                            this.backgroundAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":70.8,
                                "editable":false,
                                "height":20,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off"
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GameIntroPanel_inlineComponent3()
        {
            mx_internal::_document = this;
            this.percentWidth = 100;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GameIntroPanel_inlineComponent3._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get outerDocument():GameIntroPanel
        {
            return (this._88844982outerDocument);
        }

        public function set outerDocument(_arg_1:GameIntroPanel):void
        {
            var _local_2:Object = this._88844982outerDocument;
            if (_local_2 !== _arg_1)
            {
                this._88844982outerDocument = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:GameIntroPanel_inlineComponent3;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GameIntroPanel_inlineComponent3_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GameIntroPanel_inlineComponent3WatcherSetupUtil");
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

        private function _GameIntroPanel_inlineComponent3_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = data.map;
        }

        private function _GameIntroPanel_inlineComponent3_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = data.map;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_inlineComponent3_LinkTextArea1.htmlText = _arg_1;
            }, "_GameIntroPanel_inlineComponent3_LinkTextArea1.htmlText");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

