// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MonthWelfareAlertPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.HtmlTextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
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

    public class MonthWelfareAlertPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _iid:Number;
        private var _3237038info:HtmlTextArea;
        public var _MonthWelfareAlertPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _97926buy:BasicGlowButton;
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
                        "id":"_MonthWelfareAlertPanel_BasicTitleCanvas1"
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
                                    "id":"buy",
                                    "events":{"click":"__buy_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":94,
                                            "y":59,
                                            "width":115,
                                            "height":27,
                                            "styleName":"HorizontalTab"
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

        public function MonthWelfareAlertPanel()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 128;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MonthWelfareAlertPanel._watcherSetupUtil = _arg_1;
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

        public function buyMonthWelfareItem():void
        {
            _core.remote.call("buyMonthWelfareItem", null, _iid);
            this.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get buy():BasicGlowButton
        {
            return (this._97926buy);
        }

        override public function initialize():void
        {
            var target:MonthWelfareAlertPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MonthWelfareAlertPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MonthWelfareAlertPanelWatcherSetupUtil");
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

        private function _MonthWelfareAlertPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MONTH_WELFARE_PANEL[0];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.MONTH_WELFARE_PANEL[6];
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

        public function set info(_arg_1:HtmlTextArea):void
        {
            var _local_2:Object = this._3237038info;
            if (_local_2 !== _arg_1)
            {
                this._3237038info = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "info", _local_2, _arg_1));
            };
        }

        public function set str(_arg_1:String):void
        {
            _str = _arg_1;
            if (initialized)
            {
                info.htmlText = _str;
            };
        }

        private function _MonthWelfareAlertPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MONTH_WELFARE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MonthWelfareAlertPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MonthWelfareAlertPanel_BasicTitleCanvas1.text");
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
                var _local_1:* = Language.MONTH_WELFARE_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buy.label = _arg_1;
            }, "buy.label");
            result[2] = binding;
            return (result);
        }

        public function __buy_click(_arg_1:MouseEvent):void
        {
            buyMonthWelfareItem();
        }

        [Bindable(event="propertyChange")]
        public function get info():HtmlTextArea
        {
            return (this._3237038info);
        }

        public function set buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._97926buy;
            if (_local_2 !== _arg_1)
            {
                this._97926buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buy", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

