// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ReplayListDetail

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class ReplayListDetail extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2927678_bid:String = "";
        private var _3237038info:BasicTxtButton;
        public var _ReplayListDetail_BasicGlowButton1:BasicGlowButton;
        public var _ReplayListDetail_BasicGlowButton2:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":320,
                    "height":30,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"info",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":5,
                                "width":230
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ReplayListDetail_BasicGlowButton1",
                        "events":{"click":"___ReplayListDetail_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":240,
                                "y":4,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ReplayListDetail_BasicGlowButton2",
                        "events":{"click":"___ReplayListDetail_BasicGlowButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":280,
                                "y":4,
                                "styleName":"BtnStdRed"
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

        public function ReplayListDetail()
        {
            mx_internal::_document = this;
            this.width = 320;
            this.height = 30;
            this.styleName = "CanvasAchDetailFinished";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ReplayListDetail._watcherSetupUtil = _arg_1;
        }


        private function _ReplayListDetail_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAZENDA_LOG_PANEL_U[4];
            _local_1 = (!(_bid == ""));
            _local_1 = Language.FAZENDA_LOG_PANEL_U[5];
            _local_1 = (!(_bid == ""));
        }

        [Bindable(event="propertyChange")]
        private function get _bid():String
        {
            return (this._2927678_bid);
        }

        private function set _bid(_arg_1:String):void
        {
            var _local_2:Object = this._2927678_bid;
            if (_local_2 !== _arg_1)
            {
                this._2927678_bid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_bid", _local_2, _arg_1));
            };
        }

        public function clear():void
        {
            _bid = "";
            info.text = "";
            this.visible = false;
        }

        public function set replay(_arg_1:Object):void
        {
            var _local_2:String = _arg_1.timestamp.substr(0, 16);
            var _local_3:String = _arg_1.name;
            info.label = ((_local_2 + ": ") + _local_3);
            _bid = _arg_1.battleId;
        }

        override public function initialize():void
        {
            var target:ReplayListDetail;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ReplayListDetail_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ReplayListDetailWatcherSetupUtil");
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

        public function ___ReplayListDetail_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            play();
        }

        public function ___ReplayListDetail_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            moreAction();
        }

        public function set info(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        private function _ReplayListDetail_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDA_LOG_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ReplayListDetail_BasicGlowButton1.label = _arg_1;
            }, "_ReplayListDetail_BasicGlowButton1.label");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_bid == ""));
            }, function (_arg_1:Boolean):void
            {
                _ReplayListDetail_BasicGlowButton1.visible = _arg_1;
            }, "_ReplayListDetail_BasicGlowButton1.visible");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDA_LOG_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ReplayListDetail_BasicGlowButton2.label = _arg_1;
            }, "_ReplayListDetail_BasicGlowButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(_bid == ""));
            }, function (_arg_1:Boolean):void
            {
                _ReplayListDetail_BasicGlowButton2.visible = _arg_1;
            }, "_ReplayListDetail_BasicGlowButton2.visible");
            result[3] = binding;
            return (result);
        }

        private function moreAction():void
        {
            _core.view.getUI(ViewManager.POP_FAZENDA_LOG).moreAction(_bid);
        }

        private function play():void
        {
            if (_bid != "")
            {
                _core.remote.call("replayPetFight", null, _bid);
            };
        }

        [Bindable(event="propertyChange")]
        public function get info():BasicTxtButton
        {
            return (this._3237038info);
        }


    }
}//package com.qeedoo.ui.view.comp

