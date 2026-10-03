// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.GuardSlot

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.DragEvent;
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

    public class GuardSlot extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1659966524labelTitle:String = "";
        public var sid:Number = 9999;
        private var _20967714labelVisible:Boolean = false;
        private var _1959267317labelTal:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":ItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":35,
                    "height":35,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"labelTal",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":50,
                                "height":21,
                                "x":0,
                                "y":2
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

        public function GuardSlot()
        {
            mx_internal::_document = this;
            this.width = 35;
            this.height = 35;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuardSlot._watcherSetupUtil = _arg_1;
        }


        public function set labelVisible(_arg_1:Boolean):void
        {
            var _local_2:Object = this._20967714labelVisible;
            if (_local_2 !== _arg_1)
            {
                this._20967714labelVisible = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelVisible", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labelTitle():String
        {
            return (this._1659966524labelTitle);
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
            var _local_2:GuardSlot;
            var _local_3:Object;
            if (!acceptObj)
            {
                trace("普通拖放");
                super.dragDropHandler(_arg_1);
            };
            if (_arg_1.dragSource.hasFormat("slot"))
            {
                _local_2 = (_arg_1.dragSource.dataForFormat("slot") as GuardSlot);
                if (_local_2 == this)
                {
                    return;
                };
                switch (slotType)
                {
                    case SLOT_GUARD:
                        if (((ToolKit.isEqual(_local_2.type, GamePredef.TBL_PET)) && (_local_2.slotData)))
                        {
                            if (((_local_2.slotData.id) && (!(sid == 9999))))
                            {
                                _local_3 = _core.data.getGameData(_local_2.type, _local_2.giid);
                                if (!_local_3)
                                {
                                    return;
                                };
                                if (Number(_local_2.sid) != 9999)
                                {
                                    return;
                                };
                                _core.remote.call("movePetToPetGuardSid", null, _local_2.slotData.id, sid);
                            };
                        };
                        return;
                };
                return;
            };
        }

        public function set labelTitle(_arg_1:String):void
        {
            var _local_2:Object = this._1659966524labelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1659966524labelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labelTal():Label
        {
            return (this._1959267317labelTal);
        }

        override public function initialize():void
        {
            var target:GuardSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuardSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_GuardSlotWatcherSetupUtil");
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

        private function _GuardSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = SLOT_GUARD;
            _local_1 = labelTitle;
            _local_1 = labelVisible;
        }

        public function set labelTal(_arg_1:Label):void
        {
            var _local_2:Object = this._1959267317labelTal;
            if (_local_2 !== _arg_1)
            {
                this._1959267317labelTal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelTal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labelVisible():Boolean
        {
            return (this._20967714labelVisible);
        }

        private function _GuardSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (SLOT_GUARD);
            }, function (_arg_1:int):void
            {
                this.slotType = _arg_1;
            }, "this.slotType");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = labelTitle;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                labelTal.text = _arg_1;
            }, "labelTal.text");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (labelVisible);
            }, function (_arg_1:Boolean):void
            {
                labelTal.visible = _arg_1;
            }, "labelTal.visible");
            result[2] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

