// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SpeakText

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
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

    public class SpeakText extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _951530617content:HtmlTextArea;
        private var _1191676748selfHead:Image;
        private var _resCode:Number = 0;
        private var _boosResCode:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":454,
                    "height":160,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"selfHead",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "useHandCursor":false,
                                "buttonMode":true,
                                "width":49,
                                "x":5,
                                "height":47,
                                "y":10
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HtmlTextArea,
                        "id":"content",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                            this.backgroundAlpha = 0;
                            this.color = 0xFFFFFF;
                            this.left = "62";
                            this.right = "10";
                            this.top = "10";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "editable":false,
                                "selectable":false
                            });
                        }
                    })]
                });
            }
        });
        private var _timer:Timer = new Timer(1500);
        private var _speakContent:Array = new Array();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SpeakText()
        {
            mx_internal::_document = this;
            this.styleName = "txtArea";
            this.width = 454;
            this.height = 160;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SpeakText._watcherSetupUtil = _arg_1;
        }


        public function set content(_arg_1:HtmlTextArea):void
        {
            var _local_2:Object = this._951530617content;
            if (_local_2 !== _arg_1)
            {
                this._951530617content = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "content", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selfHead():Image
        {
            return (this._1191676748selfHead);
        }

        private function _SpeakText_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                content.filters = _arg_1;
            }, "content.filters");
            result[0] = binding;
            return (result);
        }

        public function speak(_arg_1:String, _arg_2:Number, _arg_3:Number):void
        {
            _speakContent = _arg_1.split("|");
            if (_speakContent.length > 0)
            {
                if (((_speakContent.length == 1) && (_speakContent[0] == "")))
                {
                    return;
                };
                _resCode = _arg_2;
                _boosResCode = _arg_3;
                _timer.addEventListener(TimerEvent.TIMER, _speak);
                _timer.start();
            };
        }

        public function _speak(_arg_1:Event):void
        {
            if (!this.visible)
            {
                this.visible = true;
            };
            var _local_2:String = _speakContent.shift();
            if (_speakContent.length == 0)
            {
                _timer.removeEventListener(TimerEvent.TIMER, _speak);
                _timer.stop();
                if (this.visible)
                {
                    this.visible = false;
                };
            };
            var _local_3:Array = _local_2.split("-");
            if (_local_3.length == 2)
            {
                if (Number(_local_3[0]) == 1)
                {
                    selfHead.source = ResManager.getIconUrl(_resCode);
                }
                else
                {
                    selfHead.source = ResManager.getIconUrl(_boosResCode);
                };
                this.htmlText = _local_3[1];
            }
            else
            {
                _timer.removeEventListener(TimerEvent.TIMER, _speak);
                _timer.stop();
                if (this.visible)
                {
                    this.visible = false;
                };
            };
        }

        override public function initialize():void
        {
            var target:SpeakText;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SpeakText_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_SpeakTextWatcherSetupUtil");
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

        public function set text(_arg_1:String):void
        {
            content.text = _arg_1;
        }

        public function set selfHead(_arg_1:Image):void
        {
            var _local_2:Object = this._1191676748selfHead;
            if (_local_2 !== _arg_1)
            {
                this._1191676748selfHead = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfHead", _local_2, _arg_1));
            };
        }

        public function get text():String
        {
            return (content.text);
        }

        public function set htmlText(_arg_1:String):void
        {
            content.htmlText = _arg_1;
        }

        private function _SpeakText_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get content():HtmlTextArea
        {
            return (this._951530617content);
        }

        public function get htmlText():String
        {
            return (content.htmlText);
        }


    }
}//package com.qeedoo.ui.view.comp

