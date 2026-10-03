// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PointSlot

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.FlexEvent;
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

    public class PointSlot extends RendererItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _106845584point:Label;
        public var pointValue:int = 0;
        private var _1564196393pointIcon:Image;
        public var pointType:String = "";

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":RendererItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"pointIcon",
                        "stylesFactory":function ():void
                        {
                            this.verticalAlign = "middle";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":30,
                                "height":30,
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"point",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.textAlign = "right";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":32,
                                "y":20,
                                "text":"a"
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PointSlot()
        {
            mx_internal::_document = this;
            this.scaleX = 1;
            this.scaleY = 1;
            this.addEventListener("creationComplete", ___PointSlot_RendererItemSlot1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PointSlot._watcherSetupUtil = _arg_1;
        }


        private function initV(_arg_1:int, _arg_2:String=""):void
        {
            if (_arg_1 > 0)
            {
                point.text = ("" + _arg_1);
                if (_arg_2 == "managePlan")
                {
                    pointIcon.toolTip = ((Language.WELFAREPANEL_U[39] + ":") + _arg_1);
                }
                else
                {
                    pointIcon.toolTip = ((Language.SYSTEMSHOPPANEL_U[59] + ":") + _arg_1);
                };
            };
        }

        private function _PointSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.ICON_CURRENCY_EXPOINT;
        }

        public function ___PointSlot_RendererItemSlot1_creationComplete(_arg_1:FlexEvent):void
        {
            initV(pointValue, pointType);
        }

        override public function initialize():void
        {
            var target:PointSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PointSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PointSlotWatcherSetupUtil");
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

        public function set pointIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1564196393pointIcon;
            if (_local_2 !== _arg_1)
            {
                this._1564196393pointIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointIcon", _local_2, _arg_1));
            };
        }

        private function _PointSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_CURRENCY_EXPOINT);
            }, function (_arg_1:Object):void
            {
                pointIcon.source = _arg_1;
            }, "pointIcon.source");
            result[0] = binding;
            return (result);
        }

        public function set point(_arg_1:Label):void
        {
            var _local_2:Object = this._106845584point;
            if (_local_2 !== _arg_1)
            {
                this._106845584point = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "point", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get point():Label
        {
            return (this._106845584point);
        }

        [Bindable(event="propertyChange")]
        public function get pointIcon():Image
        {
            return (this._1564196393pointIcon);
        }


    }
}//package com.qeedoo.ui.view.comp

