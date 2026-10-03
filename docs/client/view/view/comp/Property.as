// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.Property

package com.qeedoo.ui.view.comp
{
    import mx.controls.ProgressBar;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.styles.CSSStyleDeclaration;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.core.mx_internal;
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

    public class Property extends ProgressBar implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1480355228_color:int = 0xFFFFFF;
        private var _max:Number;
        private var _value:Number;

        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function Property()
        {
            super();
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.fontWeight = "normal";
                this.fontSize = 10;
            };
            this.labelPlacement = "center";
            this.mode = "manual";
            this.label = "";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            Property._watcherSetupUtil = _arg_1;
        }


        private function _Property_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():uint
            {
                return (_color);
            }, function (_arg_1:uint):void
            {
                this.setStyle("color", _arg_1);
            }, "this.color");
            result[0] = binding;
            return (result);
        }

        public function set v(_arg_1:Number):void
        {
            _value = _arg_1;
            setProgress(_value, _max);
        }

        public function set color(_arg_1:Number):void
        {
            _color = _arg_1;
        }

        private function set _color(_arg_1:int):void
        {
            var _local_2:Object = this._1480355228_color;
            if (_local_2 !== _arg_1)
            {
                this._1480355228_color = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_color", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:Property;
            var watcherSetupUtilClass:Object;
            var bindings:Array = _Property_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PropertyWatcherSetupUtil");
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

        public function set m(_arg_1:Number):void
        {
            _max = _arg_1;
            setProgress(_value, _max);
        }

        private function _Property_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _color;
        }

        [Bindable(event="propertyChange")]
        private function get _color():int
        {
            return (this._1480355228_color);
        }


    }
}//package com.qeedoo.ui.view.comp

