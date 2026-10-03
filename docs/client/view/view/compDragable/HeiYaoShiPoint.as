// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.HeiYaoShiPoint

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.LanguageUtil;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.system.Core;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
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

    public class HeiYaoShiPoint extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var pIndex:int = 1;
        public var pointId:* = 1;
        private var _1284520878_activated:Boolean;
        private var _1377687758button:Button;
        public var pStage:int = 0;
        private var _100313435image:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"button",
                        "events":{"click":"__button_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnHeiyaoshiPointNotActive",
                                "width":20,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"image",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "height":40,
                                "width":40
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function HeiYaoShiPoint()
        {
            mx_internal::_document = this;
            this.addEventListener("creationComplete", ___HeiYaoShiPoint_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            HeiYaoShiPoint._watcherSetupUtil = _arg_1;
        }


        public function get activated():Boolean
        {
            return (_activated);
        }

        private function updateTip():void
        {
            var _local_2:Object;
            if (!this.initialized)
            {
                return;
            };
            var _local_1:* = "";
            if (!_activated)
            {
                _local_2 = HeiYaoShiConfig.POINT_FIGURE[(pStage + pIndex)][pointId].price;
                if (_local_2 <= 0)
                {
                    _activated = true;
                }
                else
                {
                    if (pStage == 10)
                    {
                        _local_1 = LanguageUtil.replace(Language.HEIYAOSHI_PANEL[23], {"num":_local_2});
                    }
                    else
                    {
                        _local_1 = LanguageUtil.replace(Language.HEIYAOSHI_PANEL[5], {"num":_local_2});
                    };
                };
            };
            this.toolTip = _local_1;
        }

        [Bindable(event="propertyChange")]
        private function get _activated():Boolean
        {
            return (this._1284520878_activated);
        }

        private function lightPoint():void
        {
            Core.getInstance().remote.call("lightHeiyaoshiPoint", null, (pStage + pIndex), pointId);
        }

        public function __button_click(_arg_1:MouseEvent):void
        {
            lightPoint();
        }

        override public function initialize():void
        {
            var target:HeiYaoShiPoint;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _HeiYaoShiPoint_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_HeiYaoShiPointWatcherSetupUtil");
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

        private function _HeiYaoShiPoint_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = (!(_activated));
            _local_1 = (!(_activated));
            _local_1 = _activated;
            _local_1 = ResManager.getResUrl(2080130102070);
        }

        public function set button(_arg_1:Button):void
        {
            var _local_2:Object = this._1377687758button;
            if (_local_2 !== _arg_1)
            {
                this._1377687758button = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "button", _local_2, _arg_1));
            };
        }

        private function _HeiYaoShiPoint_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Boolean
            {
                return (!(_activated));
            }, function (_arg_1:Boolean):void
            {
                button.visible = _arg_1;
            }, "button.visible");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_activated));
            }, function (_arg_1:Boolean):void
            {
                button.enabled = _arg_1;
            }, "button.enabled");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_activated);
            }, function (_arg_1:Boolean):void
            {
                image.visible = _arg_1;
            }, "image.visible");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getResUrl(2080130102070));
            }, function (_arg_1:Object):void
            {
                image.source = _arg_1;
            }, "image.source");
            result[3] = binding;
            return (result);
        }

        public function ___HeiYaoShiPoint_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            updateTip();
        }

        public function set activated(_arg_1:Boolean):void
        {
            _activated = _arg_1;
            this.updateTip();
        }

        [Bindable(event="propertyChange")]
        public function get image():Image
        {
            return (this._100313435image);
        }

        private function set _activated(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1284520878_activated;
            if (_local_2 !== _arg_1)
            {
                this._1284520878_activated = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_activated", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get button():Button
        {
            return (this._1377687758button);
        }

        public function set image(_arg_1:Image):void
        {
            var _local_2:Object = this._100313435image;
            if (_local_2 !== _arg_1)
            {
                this._100313435image = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

