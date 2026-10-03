// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.DisplaySlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
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

    public class DisplaySlot extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1086740055slotName:Label;
        private var _3533310slot:Slot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"slotName",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFFF00;
                            this.horizontalCenter = "0";
                        }
                    }), new UIComponentDescriptor({
                        "type":Slot,
                        "id":"slot",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"TransparentSlot",
                                "movable":false,
                                "acceptable":false,
                                "stackNum":1,
                                "y":20,
                                "width":34,
                                "height":34
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DisplaySlot()
        {
            mx_internal::_document = this;
            this.clipContent = false;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DisplaySlot._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get slot():Slot
        {
            return (this._3533310slot);
        }

        [Bindable(event="propertyChange")]
        public function get slotName():Label
        {
            return (this._1086740055slotName);
        }

        public function setData(_arg_1:Object=null):void
        {
            var _local_2:Object;
            if (!this.initialized)
            {
                this.callLater(setData, [_arg_1]);
                return;
            };
            if (!_arg_1)
            {
                slotName.text = "";
                slot.clean();
                return;
            };
            _local_2 = _arg_1.slotData;
            slot.slotData = _local_2;
            slot.type = _arg_1.type;
            slot.giid = _arg_1.giid;
            var _local_3:int = _local_2.color;
            if (((!(_local_3)) || (_local_3 < 0)))
            {
                _local_3 = 0;
            };
            slotName.htmlText = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_local_3]) + "'>") + _local_2.name) + "</font>");
        }

        override public function initialize():void
        {
            var target:DisplaySlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DisplaySlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_DisplaySlotWatcherSetupUtil");
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

        private function _DisplaySlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                slotName.filters = _arg_1;
            }, "slotName.filters");
            result[0] = binding;
            return (result);
        }

        public function set slotName(_arg_1:Label):void
        {
            var _local_2:Object = this._1086740055slotName;
            if (_local_2 !== _arg_1)
            {
                this._1086740055slotName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slotName", _local_2, _arg_1));
            };
        }

        public function set slot(_arg_1:Slot):void
        {
            var _local_2:Object = this._3533310slot;
            if (_local_2 !== _arg_1)
            {
                this._3533310slot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot", _local_2, _arg_1));
            };
        }

        private function _DisplaySlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }


    }
}//package com.qeedoo.ui.view.comp

