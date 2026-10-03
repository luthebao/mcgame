// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GrouponSendPanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import mx.managers.PopUpManager;
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

    public class GrouponSendPanel extends Canvas implements IBindingClient 
    {

        private static var _instance:GrouponSendPanel;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1247465186sendType:Label;
        public var _GrouponSendPanel_DelayButton1:DelayButton;
        private var _1247263283sendName:TextInput;
        private var _1247092271sendHint:Label;
        public var _GrouponSendPanel_BasicGlowButton1:BasicGlowButton;
        private var _itemId:String;
        public var _GrouponSendPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":180,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GrouponSendPanel_BasicTitleCanvas1",
                        "propertiesFactory":function ():Object
                        {
                            return ({"closeFunc":closeHandler});
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalAlign = "center";
                            this.horizontalCenter = "0";
                            this.verticalGap = 20;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":45,
                                "mouseEnabled":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"sendHint",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalAlign = "middle";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"sendType",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"mouseEnabled":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"sendName",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":130});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 30;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mouseEnabled":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_GrouponSendPanel_DelayButton1",
                                                "events":{"click":"___GrouponSendPanel_DelayButton1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "clickDelay":2000,
                                                        "styleName":"CrystalYellowButton",
                                                        "width":80,
                                                        "height":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GrouponSendPanel_BasicGlowButton1",
                                                "events":{"click":"___GrouponSendPanel_BasicGlowButton1_click"},
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

        public function GrouponSendPanel()
        {
            mx_internal::_document = this;
            this.width = 250;
            this.height = 180;
            this.clipContent = false;
            this.styleName = "StandardContent";
        }

        public static function get instance():GrouponSendPanel
        {
            _instance = ((_instance) || (new (GrouponSendPanel)()));
            return (_instance);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GrouponSendPanel._watcherSetupUtil = _arg_1;
        }


        public function set sendType(_arg_1:Label):void
        {
            var _local_2:Object = this._1247465186sendType;
            if (_local_2 !== _arg_1)
            {
                this._1247465186sendType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sendType", _local_2, _arg_1));
            };
        }

        public function updateView(_arg_1:String):void
        {
            _itemId = _arg_1;
        }

        public function ___GrouponSendPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            sendName.text = "";
        }

        override public function initialize():void
        {
            var target:GrouponSendPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GrouponSendPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GrouponSendPanelWatcherSetupUtil");
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

        public function set sendHint(_arg_1:Label):void
        {
            var _local_2:Object = this._1247092271sendHint;
            if (_local_2 !== _arg_1)
            {
                this._1247092271sendHint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sendHint", _local_2, _arg_1));
            };
        }

        private function _GrouponSendPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponSendPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GrouponSendPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sendHint.text = _arg_1;
            }, "sendHint.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                sendHint.filters = _arg_1;
            }, "sendHint.filters");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sendType.text = _arg_1;
            }, "sendType.text");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                sendType.filters = _arg_1;
            }, "sendType.filters");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT]);
            }, function (_arg_1:Array):void
            {
                sendName.filters = _arg_1;
            }, "sendName.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponSendPanel_DelayButton1.label = _arg_1;
            }, "_GrouponSendPanel_DelayButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (sendName.text);
            }, function (_arg_1:Boolean):void
            {
                _GrouponSendPanel_DelayButton1.enabled = _arg_1;
            }, "_GrouponSendPanel_DelayButton1.enabled");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _GrouponSendPanel_DelayButton1.filters = _arg_1;
            }, "_GrouponSendPanel_DelayButton1.filters");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GROUPON_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GrouponSendPanel_BasicGlowButton1.label = _arg_1;
            }, "_GrouponSendPanel_BasicGlowButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                _GrouponSendPanel_BasicGlowButton1.filters = _arg_1;
            }, "_GrouponSendPanel_BasicGlowButton1.filters");
            result[10] = binding;
            return (result);
        }

        private function sendHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            _core.remote.call("sendGiftTo", null, sendName.text, _itemId);
        }

        public function ___GrouponSendPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            sendHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get sendHint():Label
        {
            return (this._1247092271sendHint);
        }

        private function closeHandler():void
        {
            PopUpManager.removePopUp(this);
        }

        public function set sendName(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1247263283sendName;
            if (_local_2 !== _arg_1)
            {
                this._1247263283sendName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sendName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sendType():Label
        {
            return (this._1247465186sendType);
        }

        [Bindable(event="propertyChange")]
        public function get sendName():TextInput
        {
            return (this._1247263283sendName);
        }

        private function _GrouponSendPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GROUPON_PANEL[37];
            _local_1 = Language.GROUPON_PANEL[27];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = Language.GROUPON_PANEL[28];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT];
            _local_1 = Language.GROUPON_PANEL[25];
            _local_1 = sendName.text;
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.GROUPON_PANEL[26];
            _local_1 = [GamePredef.FILTER_TITLE];
        }


    }
}//package com.qeedoo.ui.view.compDragable

