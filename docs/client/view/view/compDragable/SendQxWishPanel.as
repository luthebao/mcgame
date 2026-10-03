// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SendQxWishPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.TextInput;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.ColorPicker;
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
    import mx.events.ColorPickerEvent;
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

    public class SendQxWishPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const TYPE_MAKE_WISH:int = 1;
        private const TYPE_SHOW_LOVE:int = 0;
        private var _1559213128RL_rname:RoundedLabel;
        private var _type:int;
        private var _2677TI:TextInput;
        private var _2669TA:TextArea;
        private var _117924854btnCancel:BasicGlowButton;
        private var _1573025506RL_color:RoundedLabel;
        private var _915424585BTCanva:BasicTitleCanvas;
        private var _2157CP:ColorPicker;
        private var _94069048btnOK:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":200,
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
                                "maxChars":6,
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
                        "id":"RL_color",
                        "stylesFactory":function ():void
                        {
                            this.left = "20";
                            this.bottom = "110";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"TA",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "45";
                            this.left = "20";
                            this.right = "20";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "maxChars":40,
                                "height":55
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
                                "label":"",
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
                    }), new UIComponentDescriptor({
                        "type":ColorPicker,
                        "id":"CP",
                        "events":{"change":"__CP_change"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "108";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":120,
                                "showTextField":false,
                                "width":110,
                                "height":22,
                                "selectedColor":0xFFFFFF
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

        public function SendQxWishPanel()
        {
            mx_internal::_document = this;
            this.width = 250;
            this.height = 200;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SendQxWishPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get TA():TextArea
        {
            return (this._2669TA);
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

        [Bindable(event="propertyChange")]
        public function get btnCancel():BasicGlowButton
        {
            return (this._117924854btnCancel);
        }

        override public function initialize():void
        {
            var target:SendQxWishPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SendQxWishPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SendQxWishPanelWatcherSetupUtil");
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

        public function set BTCanva(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._915424585BTCanva;
            if (_local_2 !== _arg_1)
            {
                this._915424585BTCanva = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "BTCanva", _local_2, _arg_1));
            };
        }

        private function changeColor():void
        {
            TA.setStyle("color", CP.value);
        }

        [Bindable(event="propertyChange")]
        public function get RL_color():RoundedLabel
        {
            return (this._1573025506RL_color);
        }

        public function __btnCancel_click(_arg_1:MouseEvent):void
        {
            hide();
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

        private function _SendQxWishPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SHOWLOVEPANEL_U[5];
            _local_1 = Language.SHOWLOVEPANEL_U[6];
            _local_1 = Language.INPUTPANEL_U[1];
        }

        public function set RL_color(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1573025506RL_color;
            if (_local_2 !== _arg_1)
            {
                this._1573025506RL_color = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL_color", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get RL_rname():RoundedLabel
        {
            return (this._1559213128RL_rname);
        }

        [Bindable(event="propertyChange")]
        public function get btnOK():BasicGlowButton
        {
            return (this._94069048btnOK);
        }

        [Bindable(event="propertyChange")]
        public function get BTCanva():BasicTitleCanvas
        {
            return (this._915424585BTCanva);
        }

        private function sendWish():void
        {
            var wish:Object;
            if (((_type == TYPE_SHOW_LOVE) && (TI.text.length < 1)))
            {
                Alert.show(Language.SHOWLOVEPANEL_S[2]);
                return;
            };
            if (TA.text.length < 1)
            {
                Alert.show(Language.SHOWLOVEPANEL_S[3]);
                return;
            };
            wish = new Object();
            wish.words = TA.text;
            wish.type = _type;
            wish.sname = _core.player.name;
            wish.rname = TI.text;
            wish.color = CP.value;
            wish.flag = true;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addQxWish", new Responder(onAddQxWish), wish);
                    hide();
                };
            };
            var msg:String = "";
            if (_type == TYPE_MAKE_WISH)
            {
                msg = Language.SHOWLOVEPANEL_S[1];
            }
            else
            {
                msg = Language.SHOWLOVEPANEL_S[0];
            };
            Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
        }

        public function onAddQxWish(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _core.qxWishesArr.push(_arg_1);
            };
        }

        public function set CP(_arg_1:ColorPicker):void
        {
            var _local_2:Object = this._2157CP;
            if (_local_2 !== _arg_1)
            {
                this._2157CP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "CP", _local_2, _arg_1));
            };
        }

        public function __btnOK_click(_arg_1:MouseEvent):void
        {
            sendWish();
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

        public function __CP_change(_arg_1:ColorPickerEvent):void
        {
            changeColor();
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

        [Bindable(event="propertyChange")]
        public function get CP():ColorPicker
        {
            return (this._2157CP);
        }

        [Bindable(event="propertyChange")]
        public function get TI():TextInput
        {
            return (this._2677TI);
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

        public function set type(_arg_1:int):void
        {
            _type = _arg_1;
            if (_arg_1 == TYPE_SHOW_LOVE)
            {
                btnOK.label = Language.SHOWLOVEPANEL_U[3];
                TI.enabled = true;
                BTCanva.text = Language.SHOWLOVEPANEL_U[8];
                TI.visible = true;
                RL_rname.visible = true;
                height = 200;
            }
            else
            {
                btnOK.label = Language.SHOWLOVEPANEL_U[4];
                TI.enabled = false;
                BTCanva.text = Language.SHOWLOVEPANEL_U[7];
                TI.visible = false;
                RL_rname.visible = false;
                height = 180;
            };
        }

        private function _SendQxWishPanel_bindingsSetup():Array
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
                var _local_1:* = Language.SHOWLOVEPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL_color.text = _arg_1;
            }, "RL_color.text");
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


    }
}//package com.qeedoo.ui.view.compDragable

