// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.LotteryItemSlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
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

    public class LotteryItemSlot extends Canvas implements IBindingClient 
    {

        public static const JiangPinGe1:Class = LotteryItemSlot_JiangPinGe1;
        public static const JiangPinGe2:Class = LotteryItemSlot_JiangPinGe2;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1258775035awardSlot:ItemSlot;
        private var _214688399imgBackGround:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"imgBackGround",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":65,
                                "height":67
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"awardSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":17,
                                "movable":false
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LotteryItemSlot()
        {
            mx_internal::_document = this;
            this.addEventListener("creationComplete", ___LotteryItemSlot_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LotteryItemSlot._watcherSetupUtil = _arg_1;
        }


        private function initV():void
        {
        }

        private function _LotteryItemSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (JiangPinGe1);
            }, function (_arg_1:Object):void
            {
                imgBackGround.source = _arg_1;
            }, "imgBackGround.source");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                awardSlot.slotType = _arg_1;
            }, "awardSlot.slotType");
            result[1] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:LotteryItemSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LotteryItemSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_LotteryItemSlotWatcherSetupUtil");
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

        private function _LotteryItemSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = JiangPinGe1;
            _local_1 = Slot.SLOT_TREASURE;
        }

        public function ___LotteryItemSlot_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initV();
        }

        public function set imgBackGround(_arg_1:Image):void
        {
            var _local_2:Object = this._214688399imgBackGround;
            if (_local_2 !== _arg_1)
            {
                this._214688399imgBackGround = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgBackGround", _local_2, _arg_1));
            };
        }

        public function change(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                imgBackGround.source = JiangPinGe2;
            }
            else
            {
                imgBackGround.source = JiangPinGe1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get imgBackGround():Image
        {
            return (this._214688399imgBackGround);
        }

        public function set awardSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1258775035awardSlot;
            if (_local_2 !== _arg_1)
            {
                this._1258775035awardSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardSlot():ItemSlot
        {
            return (this._1258775035awardSlot);
        }


    }
}//package com.qeedoo.ui.view.comp

