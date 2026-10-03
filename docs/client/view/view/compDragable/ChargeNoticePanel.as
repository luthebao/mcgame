// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChargeNoticePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
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

    public class ChargeNoticePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _ChargeNoticePanel_Label1:Label;
        private var _206544419btn_buy:BasicGlowButton;
        public var _ChargeNoticePanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":102,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ChargeNoticePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":72,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_ChargeNoticePanel_Label1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"DescriptionText",
                                            "x":21,
                                            "y":18,
                                            "width":157
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_buy",
                                    "events":{"click":"__btn_buy_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":44,
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

        public function ChargeNoticePanel()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.height = 102;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChargeNoticePanel._watcherSetupUtil = _arg_1;
        }


        public function initChargePanel():void
        {
            initView();
            visible = true;
        }

        override public function initialize():void
        {
            var target:ChargeNoticePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChargeNoticePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChargeNoticePanelWatcherSetupUtil");
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

        public function __btn_buy_click(_arg_1:MouseEvent):void
        {
            _core.deal();
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
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

        private function _ChargeNoticePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARGE_NOTICE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChargeNoticePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ChargeNoticePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARGE_NOTICE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChargeNoticePanel_Label1.text = _arg_1;
            }, "_ChargeNoticePanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARGE_NOTICE_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_buy.label = _arg_1;
            }, "btn_buy.label");
            result[2] = binding;
            return (result);
        }

        private function _ChargeNoticePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHARGE_NOTICE_PANEL[2];
            _local_1 = Language.CHARGE_NOTICE_PANEL[0];
            _local_1 = Language.CHARGE_NOTICE_PANEL[1];
        }


    }
}//package com.qeedoo.ui.view.compDragable

