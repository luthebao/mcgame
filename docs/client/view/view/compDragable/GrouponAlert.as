// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GrouponAlert

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.managers.PopUpManager;
    import flash.display.DisplayObject;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
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

    public class GrouponAlert extends Canvas implements IBindingClient 
    {

        private static var _instance:GrouponAlert;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _922290793hintTxt:TextArea;
        private var _1092797764closeBtn:Button;
        public var _GrouponAlert_BasicGlowButton1:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":220,
                    "height":140,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"closeBtn",
                        "events":{"click":"__closeBtn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "12";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":10,
                                "styleName":"BtnPanelClose"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"hintTxt",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.horizontalCenter = "0";
                            this.color = 0xFFFFFF;
                            this.backgroundAlpha = 0;
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":200,
                                "y":40,
                                "mouseEnabled":false,
                                "selectable":false,
                                "mouseChildren":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_GrouponAlert_BasicGlowButton1",
                        "events":{"click":"___GrouponAlert_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":80,
                                "height":30
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GrouponAlert()
        {
            mx_internal::_document = this;
            this.width = 220;
            this.height = 140;
            this.styleName = "CanvasPopup";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GrouponAlert._watcherSetupUtil = _arg_1;
        }

        public static function show(_arg_1:String, _arg_2:DisplayObject):void
        {
            _instance = ((_instance) || (new (GrouponAlert)()));
            PopUpManager.removePopUp(_instance);
            PopUpManager.addPopUp(_instance, _arg_2);
            PopUpManager.centerPopUp(_instance);
            _instance.updateView(_arg_1);
        }


        [Bindable(event="propertyChange")]
        public function get closeBtn():Button
        {
            return (this._1092797764closeBtn);
        }

        public function set closeBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1092797764closeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1092797764closeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeBtn", _local_2, _arg_1));
            };
        }

        private function updateView(_arg_1:String):void
        {
            if (!hintTxt)
            {
                this.callLater(updateView, [_arg_1]);
                return;
            };
            hintTxt.text = _arg_1;
        }

        public function ___GrouponAlert_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            PopUpManager.removePopUp(this);
        }

        override public function initialize():void
        {
            var target:GrouponAlert;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GrouponAlert_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GrouponAlertWatcherSetupUtil");
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

        public function set hintTxt(_arg_1:TextArea):void
        {
            var _local_2:Object = this._922290793hintTxt;
            if (_local_2 !== _arg_1)
            {
                this._922290793hintTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hintTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hintTxt():TextArea
        {
            return (this._922290793hintTxt);
        }

        public function __closeBtn_click(_arg_1:MouseEvent):void
        {
            PopUpManager.removePopUp(this);
        }

        private function _GrouponAlert_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                closeBtn.filters = _arg_1;
            }, "closeBtn.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                hintTxt.filters = _arg_1;
            }, "hintTxt.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponAlert_BasicGlowButton1.label = _arg_1;
            }, "_GrouponAlert_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _GrouponAlert_BasicGlowButton1.filters = _arg_1;
            }, "_GrouponAlert_BasicGlowButton1.filters");
            result[3] = binding;
            return (result);
        }

        private function _GrouponAlert_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.GROUPON_PANEL[30];
            _local_1 = [GamePredef.FILTER_TITLE];
        }


    }
}//package com.qeedoo.ui.view.compDragable

