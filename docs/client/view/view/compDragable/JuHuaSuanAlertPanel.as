// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.JuHuaSuanAlertPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.HtmlTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
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

    public class JuHuaSuanAlertPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _iid:Number;
        private var _1320896211one_buy:BasicGlowButton;
        private var _911839512all_buy:BasicGlowButton;
        private var _3237038info:HtmlTextArea;
        public var _JuHuaSuanAlertPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _str:String;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":128,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_JuHuaSuanAlertPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":96,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":HtmlTextArea,
                                    "id":"info",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.left = "10";
                                        this.right = "10";
                                        this.top = "10";
                                        this.bottom = "24";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "editable":false,
                                            "selectable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"one_buy",
                                    "events":{"click":"__one_buy_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":54,
                                            "y":71,
                                            "width":80,
                                            "height":20,
                                            "styleName":"HorizontalTab"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"all_buy",
                                    "events":{"click":"__all_buy_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":172,
                                            "y":71,
                                            "width":80,
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

        public function JuHuaSuanAlertPanel()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 128;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            JuHuaSuanAlertPanel._watcherSetupUtil = _arg_1;
        }


        public function showPanel():*
        {
            initView();
            visible = true;
        }

        public function set iid(_arg_1:Number):void
        {
            _iid = _arg_1;
        }

        public function buyJuHuaSuanAll():void
        {
            _core.remote.call("buyJuHuaSuanAll", null);
            this.visible = false;
        }

        override public function initialize():void
        {
            var target:JuHuaSuanAlertPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _JuHuaSuanAlertPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_JuHuaSuanAlertPanelWatcherSetupUtil");
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

        public function set one_buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1320896211one_buy;
            if (_local_2 !== _arg_1)
            {
                this._1320896211one_buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "one_buy", _local_2, _arg_1));
            };
        }

        public function buyJuHuaSuanOne():void
        {
            _core.remote.call("buyJuHuaSuanOne", null, _iid);
            this.visible = false;
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            this.iid = _iid;
            this.str = _str;
        }

        public function __all_buy_click(_arg_1:MouseEvent):void
        {
            buyJuHuaSuanAll();
        }

        public function set info(_arg_1:HtmlTextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function __one_buy_click(_arg_1:MouseEvent):void
        {
            buyJuHuaSuanOne();
        }

        [Bindable(event="propertyChange")]
        public function get all_buy():BasicGlowButton
        {
            return (this._911839512all_buy);
        }

        public function set str(_arg_1:String):void
        {
            _str = _arg_1;
            if (initialized)
            {
                info.htmlText = _str;
            };
        }

        [Bindable(event="propertyChange")]
        public function get info():HtmlTextArea
        {
            return (this._3237038info);
        }

        [Bindable(event="propertyChange")]
        public function get one_buy():BasicGlowButton
        {
            return (this._1320896211one_buy);
        }

        private function _JuHuaSuanAlertPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.JUHUASUAN_ALERT_PANEL[0];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.JUHUASUAN_ALERT_PANEL[1];
            _local_1 = Language.JUHUASUAN_ALERT_PANEL[2];
        }

        private function _JuHuaSuanAlertPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JUHUASUAN_ALERT_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _JuHuaSuanAlertPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_JuHuaSuanAlertPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                info.filters = _arg_1;
            }, "info.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JUHUASUAN_ALERT_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                one_buy.label = _arg_1;
            }, "one_buy.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.JUHUASUAN_ALERT_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                all_buy.label = _arg_1;
            }, "all_buy.label");
            result[3] = binding;
            return (result);
        }

        public function set all_buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._911839512all_buy;
            if (_local_2 !== _arg_1)
            {
                this._911839512all_buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "all_buy", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

