// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WaWaChangePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.NumericStepper;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
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

    public class WaWaChangePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _WaWaChangePanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _WaWaChangePanel_Label1:Label;
        private var _alert:Alert;
        private var _point:Number;
        private var _206544419btn_buy:BasicGlowButton;
        private var _401559445numStepper:NumericStepper;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":128,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WaWaChangePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":96,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_WaWaChangePanel_Label1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"DescriptionText",
                                            "x":15,
                                            "y":23,
                                            "width":88
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"numStepper",
                                    "events":{"mouseDown":"__numStepper_mouseDown"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":98,
                                            "y":23,
                                            "value":1,
                                            "maximum":9999999,
                                            "minimum":1,
                                            "width":87
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_buy",
                                    "events":{"click":"__btn_buy_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":72,
                                            "y":62,
                                            "width":60,
                                            "height":20,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                })]
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

        public function WaWaChangePanel()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.height = 128;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WaWaChangePanel._watcherSetupUtil = _arg_1;
        }


        public function __btn_buy_click(_arg_1:MouseEvent):void
        {
            changeWorldCupPoint();
        }

        override public function initialize():void
        {
            var target:WaWaChangePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WaWaChangePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WaWaChangePanelWatcherSetupUtil");
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

        private function _WaWaChangePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_CHANGE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaChangePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_WaWaChangePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_CHANGE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WaWaChangePanel_Label1.text = _arg_1;
            }, "_WaWaChangePanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAWA_GAME_CHANGE_PANEL[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_buy.label = _arg_1;
            }, "btn_buy.label");
            result[2] = binding;
            return (result);
        }

        private function changeWorldCupPoint():void
        {
            var num:Number;
            var handler:Function;
            num = numStepper.value;
            var allPoint:Number = (_point * num);
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyWaWaGameCoin", null, false, num);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.WAWA_GAME_CHANGE_PANEL[3].replace("{point}", allPoint).replace("{num}", num);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = str;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
        }

        private function _WaWaChangePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WAWA_GAME_CHANGE_PANEL[0];
            _local_1 = Language.WAWA_GAME_CHANGE_PANEL[2];
            _local_1 = Language.WAWA_GAME_CHANGE_PANEL[4];
        }

        public function initWorldCupChangePanel(_arg_1:Number):void
        {
            initView();
            visible = true;
            _point = _arg_1;
        }

        public function set numStepper(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._401559445numStepper;
            if (_local_2 !== _arg_1)
            {
                this._401559445numStepper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numStepper", _local_2, _arg_1));
            };
        }

        public function set btn_buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._206544419btn_buy;
            if (_local_2 !== _arg_1)
            {
                this._206544419btn_buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_buy", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_buy():BasicGlowButton
        {
            return (this._206544419btn_buy);
        }

        [Bindable(event="propertyChange")]
        public function get numStepper():NumericStepper
        {
            return (this._401559445numStepper);
        }

        public function __numStepper_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }


    }
}//package com.qeedoo.ui.view.compDragable

