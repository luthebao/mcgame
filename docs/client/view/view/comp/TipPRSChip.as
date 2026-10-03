// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipPRSChip

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import mx.events.ResizeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
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

    public class TipPRSChip extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1311986764tipIcon:Image;
        private var _2014185703tipLabel:Label;
        private var _1311839802tipName:Label;
        private var _obj:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"tipIcon",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":32,
                                            "height":32
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"tipName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"tipLabel",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "mouseEnabled":false,
                                "y":40,
                                "x":10
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipPRSChip()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipPRSChip_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipPRSChip._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get tipName():Label
        {
            return (this._1311839802tipName);
        }

        override public function initialize():void
        {
            var target:TipPRSChip;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipPRSChip_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipPRSChipWatcherSetupUtil");
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

        private function _TipPRSChip_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tipName.filters = _arg_1;
            }, "tipName.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                tipLabel.filters = _arg_1;
            }, "tipLabel.filters");
            result[1] = binding;
            return (result);
        }

        public function set tipName(_arg_1:Label):void
        {
            var _local_2:Object = this._1311839802tipName;
            if (_local_2 !== _arg_1)
            {
                this._1311839802tipName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName", _local_2, _arg_1));
            };
        }

        private function _TipPRSChip_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        public function ___TipPRSChip_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function setTemp(_arg_1:Object):void
        {
            var _local_2:Object;
            _local_2 = _arg_1.temp;
            tipIcon.source = ResManager.getIconUrl(Number(_local_2["iconCode"]));
            tipName.text = _local_2["name"];
            tipLabel.text = Language.PRS_PANEL[34];
        }

        [Bindable(event="propertyChange")]
        public function get tipLabel():Label
        {
            return (this._2014185703tipLabel);
        }

        public function set tipIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1311986764tipIcon;
            if (_local_2 !== _arg_1)
            {
                this._1311986764tipIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipIcon", _local_2, _arg_1));
            };
        }

        public function set tipLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._2014185703tipLabel;
            if (_local_2 !== _arg_1)
            {
                this._2014185703tipLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipIcon():Image
        {
            return (this._1311986764tipIcon);
        }

        public function set object(_arg_1:Object):void
        {
            _obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setTemp(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.comp

