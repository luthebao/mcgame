// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SendVDAYWishPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.TextInput;
    import mx.controls.TextArea;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
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

    public class SendVDAYWishPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1559213128RL_rname:RoundedLabel;
        private var _94069048btnOK:BasicGlowButton;
        private var _2677TI:TextInput;
        private var _1090966664RL_rname0:RoundedLabel;
        private var _2669TA:TextArea;
        private var _401559445numStepper:NumericStepper;
        private var _117924854btnCancel:BasicGlowButton;
        private var _915424585BTCanva:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":306,
                    "height":266,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"BTCanva"
                    }), new UIComponentDescriptor({
                        "type":TextInput,
                        "id":"TI",
                        "stylesFactory":function ():void
                        {
                            this.top = "42";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":110,
                                "x":120
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"RL_rname",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.top = "42";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"RL_rname0",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "201";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "text":"使用表白卡:",
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"TA",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "77";
                            this.left = "20";
                            this.right = "20";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "maxChars":40,
                                "height":108
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":NumericStepper,
                        "id":"numStepper",
                        "events":{"mouseDown":"__numStepper_mouseDown"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "41.4";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "value":1,
                                "maximum":120,
                                "minimum":1,
                                "width":76
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnOK",
                        "events":{"click":"__btnOK_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "-35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":50,
                                "height":25
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnCancel",
                        "events":{"click":"__btnCancel_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CrystalYellowButton",
                                "width":50,
                                "height":25
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

        public function SendVDAYWishPanel()
        {
            mx_internal::_document = this;
            this.width = 306;
            this.height = 266;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SendVDAYWishPanel._watcherSetupUtil = _arg_1;
        }


        public function set btnOK(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94069048btnOK;
            if (_local_2 !== _arg_1)
            {
                this._94069048btnOK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOK", _local_2, _arg_1));
            };
        }

        public function set BTCanva(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._915424585BTCanva;
            if (_local_2 !== _arg_1)
            {
                this._915424585BTCanva = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "BTCanva", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:SendVDAYWishPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SendVDAYWishPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SendVDAYWishPanelWatcherSetupUtil");
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

        public function __btnCancel_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get btnOK():BasicGlowButton
        {
            return (this._94069048btnOK);
        }

        private function _SendVDAYWishPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SHOWLOVEPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL_rname.text = _arg_1;
            }, "RL_rname.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnOK.label = _arg_1;
            }, "btnOK.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnCancel.label = _arg_1;
            }, "btnCancel.label");
            result[2] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get RL_rname():RoundedLabel
        {
            return (this._1559213128RL_rname);
        }

        [Bindable(event="propertyChange")]
        public function get BTCanva():BasicTitleCanvas
        {
            return (this._915424585BTCanva);
        }

        private function sendWish():void
        {
            var wish:Object;
            if (TI.text.length < 1)
            {
                Alert.show(Language.VDAYPANEL_U[12]);
                return;
            };
            wish = new Object();
            wish.words = TA.text;
            wish.tname = TI.text;
            wish.name = _core.player.name;
            wish.gender = _core.player.gender;
            wish.cid = _core.cid;
            wish.times = numStepper.value;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("proposalToSomeOne", new Responder(onAddQxWish), wish);
                    hide();
                };
            };
            Alert.show(Language.VDAYPANEL_U[11].toString().replace("{num}", wish.times), "", (Alert.YES | Alert.NO), null, func);
        }

        public function onAddQxWish(_arg_1:Object):void
        {
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

        private function _SendVDAYWishPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SHOWLOVEPANEL_U[5];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[1];
        }

        public function __btnOK_click(_arg_1:MouseEvent):void
        {
            sendWish();
        }

        public function set TA(_arg_1:TextArea):void
        {
            var _local_2:Object = this._2669TA;
            if (_local_2 !== _arg_1)
            {
                this._2669TA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TA", _local_2, _arg_1));
            };
        }

        public function set TI(_arg_1:TextInput):void
        {
            var _local_2:Object = this._2677TI;
            if (_local_2 !== _arg_1)
            {
                this._2677TI = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TI", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get numStepper():NumericStepper
        {
            return (this._401559445numStepper);
        }

        public function set btnCancel(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._117924854btnCancel;
            if (_local_2 !== _arg_1)
            {
                this._117924854btnCancel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnCancel", _local_2, _arg_1));
            };
        }

        public function set RL_rname0(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1090966664RL_rname0;
            if (_local_2 !== _arg_1)
            {
                this._1090966664RL_rname0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL_rname0", _local_2, _arg_1));
            };
        }

        public function __numStepper_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get TA():TextArea
        {
            return (this._2669TA);
        }

        [Bindable(event="propertyChange")]
        public function get TI():TextInput
        {
            return (this._2677TI);
        }

        [Bindable(event="propertyChange")]
        public function get btnCancel():BasicGlowButton
        {
            return (this._117924854btnCancel);
        }

        [Bindable(event="propertyChange")]
        public function get RL_rname0():RoundedLabel
        {
            return (this._1090966664RL_rname0);
        }

        public function set RL_rname(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1559213128RL_rname;
            if (_local_2 !== _arg_1)
            {
                this._1559213128RL_rname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL_rname", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

