// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.SkillCanvas

package com.qeedoo.ui.view.compBattle
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.effects.Fade;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import flash.events.TimerEvent;
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

    public class SkillCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1282133823fadeIn:Fade;
        public var _SkillCanvas_RoundedLabel1:RoundedLabel;
        private var _1091436750fadeOut:Fade;
        private var _91291148_text:String;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":227,
                    "height":76.2,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_SkillCanvas_RoundedLabel1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 28;
                            this.textAlign = "center";
                            this.fontWeight = "bold";
                            this.fontFamily = "黑体";
                            this.color = 16739179;
                            this.verticalCenter = "0";
                            this.horizontalCenter = "0";
                        }
                    })]
                });
            }
        });
        private var _timer:Timer = new Timer(1000, 1);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SkillCanvas()
        {
            mx_internal::_document = this;
            this.width = 227;
            this.height = 76.2;
            this.styleName = "CanvasSkill";
            this.alpha = 0.6;
            _SkillCanvas_Fade1_i();
            _SkillCanvas_Fade2_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SkillCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get fadeIn():Fade
        {
            return (this._1282133823fadeIn);
        }

        public function hide(_arg_1:TimerEvent=null):void
        {
            if (_arg_1)
            {
                _arg_1.currentTarget.removeEventListener(TimerEvent.TIMER, hide);
            };
            _timer.reset();
            _timer.stop();
            fadeIn.stop();
            fadeOut.stop();
            visible = false;
        }

        private function _SkillCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = fadeIn;
            _local_1 = fadeOut;
            _local_1 = _text;
        }

        override public function initialize():void
        {
            var target:SkillCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SkillCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_SkillCanvasWatcherSetupUtil");
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

        public function set fadeIn(_arg_1:Fade):void
        {
            var _local_2:Object = this._1282133823fadeIn;
            if (_local_2 !== _arg_1)
            {
                this._1282133823fadeIn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeIn", _local_2, _arg_1));
            };
        }

        private function set _text(_arg_1:String):void
        {
            var _local_2:Object = this._91291148_text;
            if (_local_2 !== _arg_1)
            {
                this._91291148_text = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_text", _local_2, _arg_1));
            };
        }

        public function set fadeOut(_arg_1:Fade):void
        {
            var _local_2:Object = this._1091436750fadeOut;
            if (_local_2 !== _arg_1)
            {
                this._1091436750fadeOut = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOut", _local_2, _arg_1));
            };
        }

        public function set text(_arg_1:String):void
        {
            _text = _arg_1;
            visible = true;
            _timer.reset();
            _timer.start();
        }

        private function _SkillCanvas_Fade2_i():Fade
        {
            var _local_1:Fade = new Fade();
            fadeOut = _local_1;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 0;
            _local_1.duration = 1000;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get _text():String
        {
            return (this._91291148_text);
        }

        public function flash(_arg_1:String):void
        {
            _text = _arg_1;
            visible = true;
            _timer.addEventListener(TimerEvent.TIMER, hide);
            _timer.reset();
            _timer.start();
        }

        [Bindable(event="propertyChange")]
        public function get fadeOut():Fade
        {
            return (this._1091436750fadeOut);
        }

        private function _SkillCanvas_Fade1_i():Fade
        {
            var _local_1:Fade = new Fade();
            fadeIn = _local_1;
            _local_1.alphaFrom = 0;
            _local_1.alphaTo = 1;
            _local_1.duration = 500;
            return (_local_1);
        }

        private function _SkillCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():*
            {
                return (fadeIn);
            }, function (_arg_1:*):void
            {
                this.setStyle("showEffect", _arg_1);
            }, "this.showEffect");
            result[0] = binding;
            binding = new Binding(this, function ():*
            {
                return (fadeOut);
            }, function (_arg_1:*):void
            {
                this.setStyle("hideEffect", _arg_1);
            }, "this.hideEffect");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _text;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillCanvas_RoundedLabel1.text = _arg_1;
            }, "_SkillCanvas_RoundedLabel1.text");
            result[2] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compBattle

