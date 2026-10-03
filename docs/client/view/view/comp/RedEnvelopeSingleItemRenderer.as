// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RedEnvelopeSingleItemRenderer

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
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

    public class RedEnvelopeSingleItemRenderer extends Canvas implements IBindingClient 
    {

        public static const NEW_ICON:Class = RedEnvelopeSingleItemRenderer_NEW_ICON;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1303557306goldLable:RoundedLabel;
        private var _94802286cname:String;
        private var _3178592gold:String;
        private var _1059212552cnameLable:RoundedLabel;
        private var _3141bg:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":237,
                    "height":47,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"bg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":3,
                                "y":3,
                                "width":231,
                                "height":41
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"cnameLable",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":3,
                                "y":15,
                                "width":110
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"goldLable",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":115,
                                "y":15,
                                "width":110
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

        public function RedEnvelopeSingleItemRenderer()
        {
            mx_internal::_document = this;
            this.width = 237;
            this.height = 47;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RedEnvelopeSingleItemRenderer._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get goldLable():RoundedLabel
        {
            return (this._1303557306goldLable);
        }

        private function set gold(_arg_1:String):void
        {
            var _local_2:Object = this._3178592gold;
            if (_local_2 !== _arg_1)
            {
                this._3178592gold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold", _local_2, _arg_1));
            };
        }

        public function set bg(_arg_1:Image):void
        {
            var _local_2:Object = this._3141bg;
            if (_local_2 !== _arg_1)
            {
                this._3141bg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bg", _local_2, _arg_1));
            };
        }

        public function set goldLable(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1303557306goldLable;
            if (_local_2 !== _arg_1)
            {
                this._1303557306goldLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldLable", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:RedEnvelopeSingleItemRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RedEnvelopeSingleItemRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RedEnvelopeSingleItemRendererWatcherSetupUtil");
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

        private function _RedEnvelopeSingleItemRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = NEW_ICON;
            _local_1 = cname;
            _local_1 = (gold + " 金票");
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            if (_arg_1)
            {
                cname = _arg_1.cname;
                gold = _arg_1.cash;
            };
        }

        private function set cname(_arg_1:String):void
        {
            var _local_2:Object = this._94802286cname;
            if (_local_2 !== _arg_1)
            {
                this._94802286cname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bg():Image
        {
            return (this._3141bg);
        }

        [Bindable(event="propertyChange")]
        private function get cname():String
        {
            return (this._94802286cname);
        }

        [Bindable(event="propertyChange")]
        private function get gold():String
        {
            return (this._3178592gold);
        }

        private function _RedEnvelopeSingleItemRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (NEW_ICON);
            }, function (_arg_1:Object):void
            {
                bg.source = _arg_1;
            }, "bg.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = cname;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cnameLable.text = _arg_1;
            }, "cnameLable.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (gold + " 金票");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                goldLable.text = _arg_1;
            }, "goldLable.text");
            result[2] = binding;
            return (result);
        }

        public function set cnameLable(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1059212552cnameLable;
            if (_local_2 !== _arg_1)
            {
                this._1059212552cnameLable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cnameLable", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cnameLable():RoundedLabel
        {
            return (this._1059212552cnameLable);
        }


    }
}//package com.qeedoo.ui.view.comp

