// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MarriageFeedHBox

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
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

    public class MarriageFeedHBox extends HBox implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _113000rlb:RoundedLabel;
        private var _1080508585btn_refuse:Button;
        private var _1569156021btn_accept:Button;
        private var _obj:Object = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":HBox,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"rlb"
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn_accept",
                        "events":{"click":"__btn_accept_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnAcceptMarriage"});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn_refuse",
                        "events":{"click":"__btn_refuse_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({"styleName":"BtnRefuseMarriage"});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MarriageFeedHBox()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.horizontalGap = 0;
            };
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MarriageFeedHBox._watcherSetupUtil = _arg_1;
        }


        public function __btn_refuse_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btn_accept():Button
        {
            return (this._1569156021btn_accept);
        }

        private function _MarriageFeedHBox_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MARRIAGE_PANEL_U[31];
            _local_1 = Language.MARRIAGE_PANEL_U[32];
        }

        override public function initialize():void
        {
            var target:MarriageFeedHBox;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MarriageFeedHBox_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MarriageFeedHBoxWatcherSetupUtil");
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
            _obj = _arg_1;
            if (_obj.flag == 0)
            {
                ((this.contains(rlb)) && (this.removeChild(rlb)));
                ((!(this.contains(btn_accept))) && (this.addChild(btn_accept)));
                ((!(this.contains(btn_refuse))) && (this.addChild(btn_refuse)));
            }
            else
            {
                ((this.contains(btn_accept)) && (this.removeChild(btn_accept)));
                ((this.contains(btn_refuse)) && (this.removeChild(btn_refuse)));
                ((!(this.contains(rlb))) && (this.addChild(rlb)));
                if (_obj.flag == 1)
                {
                    rlb.text = Language.MARRIAGE_PANEL_U[33];
                }
                else
                {
                    rlb.text = Language.MARRIAGE_PANEL_U[34];
                };
            };
        }

        public function set btn_accept(_arg_1:Button):void
        {
            var _local_2:Object = this._1569156021btn_accept;
            if (_local_2 !== _arg_1)
            {
                this._1569156021btn_accept = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_accept", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_refuse():Button
        {
            return (this._1080508585btn_refuse);
        }

        [Bindable(event="propertyChange")]
        public function get rlb():RoundedLabel
        {
            return (this._113000rlb);
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            var _local_2:int;
            if (_arg_1.target.id == "btn_accept")
            {
                _local_2 = 1;
            }
            else
            {
                if (_arg_1.target.id == "btn_refuse")
                {
                    _local_2 = 2;
                };
            };
            _core.remote.marriageReqFeedback(_obj.id, _local_2);
        }

        public function set rlb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._113000rlb;
            if (_local_2 !== _arg_1)
            {
                this._113000rlb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rlb", _local_2, _arg_1));
            };
        }

        public function __btn_accept_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set btn_refuse(_arg_1:Button):void
        {
            var _local_2:Object = this._1080508585btn_refuse;
            if (_local_2 !== _arg_1)
            {
                this._1080508585btn_refuse = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_refuse", _local_2, _arg_1));
            };
        }

        private function _MarriageFeedHBox_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_accept.toolTip = _arg_1;
            }, "btn_accept.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_refuse.toolTip = _arg_1;
            }, "btn_refuse.toolTip");
            result[1] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.comp

