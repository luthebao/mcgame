// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererChannel

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.Event;
    import flash.events.MouseEvent;
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

    public class RendererChannel extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _index:int;
        private var _2092246416_channelLabel:String = "";
        private var _1282089978_selected:Boolean;
        private var _316196445_styleName:String;
        private var _94627080check:CheckBox;
        public var _RendererChannel_BasicShadowButton1:BasicShadowButton;
        private var _567262731_selectable:Boolean = true;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":18,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"check",
                        "events":{"click":"__check_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":14,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicShadowButton,
                        "id":"_RendererChannel_BasicShadowButton1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":14,
                                "y":0,
                                "width":33,
                                "height":18
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RendererChannel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0;
            };
            this.width = 50;
            this.height = 18;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RendererChannel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        private function get _selected():Boolean
        {
            return (this._1282089978_selected);
        }

        [Bindable(event="propertyChange")]
        private function get _selectable():Boolean
        {
            return (this._567262731_selectable);
        }

        [Bindable(event="propertyChange")]
        public function get check():CheckBox
        {
            return (this._94627080check);
        }

        private function set _styleName(_arg_1:String):void
        {
            var _local_2:Object = this._316196445_styleName;
            if (_local_2 !== _arg_1)
            {
                this._316196445_styleName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_styleName", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:RendererChannel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RendererChannel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RendererChannelWatcherSetupUtil");
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

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            _styleName = _arg_1.styleName;
            _channelLabel = _arg_1.label;
            _index = _arg_1.index;
            _selected = _arg_1.selected;
            _selectable = _arg_1.selectable;
        }

        private function set _channelLabel(_arg_1:String):void
        {
            var _local_2:Object = this._2092246416_channelLabel;
            if (_local_2 !== _arg_1)
            {
                this._2092246416_channelLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_channelLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get _styleName():String
        {
            return (this._316196445_styleName);
        }

        public function set check(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._94627080check;
            if (_local_2 !== _arg_1)
            {
                this._94627080check = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "check", _local_2, _arg_1));
            };
        }

        private function selectHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            data.selected = check.selected;
            _selected = check.selected;
            _core.updateSettingNow(("c" + _index), Number(_selected));
        }

        private function set _selectable(_arg_1:Boolean):void
        {
            var _local_2:Object = this._567262731_selectable;
            if (_local_2 !== _arg_1)
            {
                this._567262731_selectable = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selectable", _local_2, _arg_1));
            };
        }

        public function __check_click(_arg_1:MouseEvent):void
        {
            selectHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get _channelLabel():String
        {
            return (this._2092246416_channelLabel);
        }

        private function set _selected(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1282089978_selected;
            if (_local_2 !== _arg_1)
            {
                this._1282089978_selected = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selected", _local_2, _arg_1));
            };
        }

        private function _RendererChannel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _selected;
            _local_1 = _selectable;
            _local_1 = _styleName;
            _local_1 = _channelLabel;
        }

        private function _RendererChannel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Boolean
            {
                return (_selected);
            }, function (_arg_1:Boolean):void
            {
                check.selected = _arg_1;
            }, "check.selected");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_selectable);
            }, function (_arg_1:Boolean):void
            {
                check.visible = _arg_1;
            }, "check.visible");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (_styleName);
            }, function (_arg_1:Object):void
            {
                _RendererChannel_BasicShadowButton1.styleName = _arg_1;
            }, "_RendererChannel_BasicShadowButton1.styleName");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _channelLabel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RendererChannel_BasicShadowButton1.label = _arg_1;
            }, "_RendererChannel_BasicShadowButton1.label");
            result[3] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

