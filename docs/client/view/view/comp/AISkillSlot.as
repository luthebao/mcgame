// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AISkillSlot

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
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

    public class AISkillSlot extends ItemSlot implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _337548032_defaultLabelVisible:Boolean = false;
        private var _1523114770_defaultLabel:String = "";
        public var _AISkillSlot_Label1:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":ItemSlot,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_AISkillSlot_Label1",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                            this.color = 0xFFFFFF;
                            this.fontSize = 14;
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AISkillSlot()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AISkillSlot._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        private function get _defaultLabelVisible():Boolean
        {
            return (this._337548032_defaultLabelVisible);
        }

        override public function set giid(_arg_1:Number):void
        {
            super.giid = _arg_1;
            if (_arg_1 > 0)
            {
                _defaultLabelVisible = false;
            };
        }

        private function set _defaultLabelVisible(_arg_1:Boolean):void
        {
            var _local_2:Object = this._337548032_defaultLabelVisible;
            if (_local_2 !== _arg_1)
            {
                this._337548032_defaultLabelVisible = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_defaultLabelVisible", _local_2, _arg_1));
            };
        }

        override public function clean():void
        {
            super.clean();
            if (_defaultLabel)
            {
                _defaultLabelVisible = true;
            };
        }

        private function _AISkillSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _defaultLabel;
            _local_1 = _defaultLabelVisible;
        }

        override public function initialize():void
        {
            var target:AISkillSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AISkillSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_AISkillSlotWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        private function get _defaultLabel():String
        {
            return (this._1523114770_defaultLabel);
        }

        public function set frontLabel(_arg_1:String):void
        {
            _defaultLabel = _arg_1;
            if (this.giid < 0)
            {
                _defaultLabelVisible = true;
            };
        }

        private function set _defaultLabel(_arg_1:String):void
        {
            var _local_2:Object = this._1523114770_defaultLabel;
            if (_local_2 !== _arg_1)
            {
                this._1523114770_defaultLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_defaultLabel", _local_2, _arg_1));
            };
        }

        private function _AISkillSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _defaultLabel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AISkillSlot_Label1.text = _arg_1;
            }, "_AISkillSlot_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_defaultLabelVisible);
            }, function (_arg_1:Boolean):void
            {
                _AISkillSlot_Label1.visible = _arg_1;
            }, "_AISkillSlot_Label1.visible");
            result[1] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

