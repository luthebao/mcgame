// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RoundTextArea

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextArea;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class RoundTextArea extends TextArea implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RoundTextArea()
        {
            super();
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.color = 16776365;
                this.backgroundAlpha = 0;
                this.borderStyle = "none";
            };
            this.editable = false;
            this.selectable = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RoundTextArea._watcherSetupUtil = _arg_1;
        }


        private function _RoundTextArea_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        override public function initialize():void
        {
            var target:RoundTextArea;
            var watcherSetupUtilClass:Object;
            var bindings:Array = _RoundTextArea_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RoundTextAreaWatcherSetupUtil");
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

        private function _RoundTextArea_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                this.filters = _arg_1;
            }, "this.filters");
            result[0] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

