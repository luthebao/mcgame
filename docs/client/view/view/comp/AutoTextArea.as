// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AutoTextArea

package com.qeedoo.ui.view.comp
{
    import mx.controls.TextArea;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
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

    public class AutoTextArea extends TextArea implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AutoTextArea()
        {
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.wordWrap = false;
            this.selectable = false;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.editable = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AutoTextArea._watcherSetupUtil = _arg_1;
        }


        override public function initialize():void
        {
            var target:AutoTextArea;
            var watcherSetupUtilClass:Object;
            var bindings:Array = _AutoTextArea_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_AutoTextAreaWatcherSetupUtil");
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

        override protected function commitProperties():void
        {
            super.commitProperties();
            this.width = (this.textWidth + 8);
            this.height = (this.textHeight + 6);
        }

        private function _AutoTextArea_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        private function _AutoTextArea_bindingsSetup():Array
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

