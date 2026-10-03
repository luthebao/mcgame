// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MarriageSeekingPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
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

    public class MarriageSeekingPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2041562624_marriageWords:String;
        private var _94069048btnOK:BasicGlowButton;
        public var _MarriageSeekingPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _113000rlb:RoundedLabel;
        private var _type:int;
        private var _1033818675ta_introduce:TextArea;
        private var _flag:int = 0;
        private var _117924854btnCancel:BasicGlowButton;
        private var _item:Object;
        private var _288628502ta_notice:TextArea;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":220,
                    "height":285,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MarriageSeekingPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"rlb",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "145";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "width":200
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"ta_introduce",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.bottom = "37";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "x":10,
                                "width":200,
                                "height":100,
                                "maxChars":0xFF,
                                "enabled":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnOK",
                        "events":{"click":"__btnOK_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "-30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnCancel",
                        "events":{"click":"__btnCancel_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "30";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"ta_notice",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CSSBorder",
                                "x":10,
                                "y":39,
                                "width":200,
                                "height":75,
                                "maxChars":0xFF,
                                "editable":false
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

        public function MarriageSeekingPanel()
        {
            mx_internal::_document = this;
            this.width = 220;
            this.height = 285;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MarriageSeekingPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        private function get _marriageWords():String
        {
            return (this._2041562624_marriageWords);
        }

        private function cancel():void
        {
            hide();
        }

        private function set _marriageWords(_arg_1:String):void
        {
            var _local_2:Object = this._2041562624_marriageWords;
            if (_local_2 !== _arg_1)
            {
                this._2041562624_marriageWords = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_marriageWords", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:MarriageSeekingPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MarriageSeekingPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MarriageSeekingPanelWatcherSetupUtil");
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

        public function set ta_introduce(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1033818675ta_introduce;
            if (_local_2 !== _arg_1)
            {
                this._1033818675ta_introduce = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ta_introduce", _local_2, _arg_1));
            };
        }

        public function __btnCancel_click(_arg_1:MouseEvent):void
        {
            cancel();
        }

        public function set item(_arg_1:Object):void
        {
            _item = _arg_1;
        }

        private function _MarriageSeekingPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MARRIAGE_PANEL_U[16];
            _local_1 = _marriageWords;
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[1];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get btnOK():BasicGlowButton
        {
            return (this._94069048btnOK);
        }

        [Bindable(event="propertyChange")]
        public function get ta_introduce():TextArea
        {
            return (this._1033818675ta_introduce);
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

        public function set ta_notice(_arg_1:TextArea):void
        {
            var _local_2:Object = this._288628502ta_notice;
            if (_local_2 !== _arg_1)
            {
                this._288628502ta_notice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ta_notice", _local_2, _arg_1));
            };
        }

        private function ok():void
        {
            var msg:String;
            if (_core.haveBadWord(ta_introduce.text))
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):*
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (_type == GamePredef.TYPE_MARRIAGE_SEEKING)
                    {
                        _core.remote.marriageSeeking(ta_introduce.text, _flag);
                    }
                    else
                    {
                        _core.remote.marriageRequest(_item.cid, _item.name, ta_introduce.text);
                    };
                };
                hide();
            };
            if (_type == GamePredef.TYPE_MARRIAGE_SEEKING)
            {
                msg = Language.MARRIAGE_PANEL_U[38];
            }
            else
            {
                msg = Language.MARRIAGE_PANEL_U[39].toString().replace("{name}", _item.name);
            };
            Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
        }

        public function __btnOK_click(_arg_1:MouseEvent):void
        {
            ok();
        }

        [Bindable(event="propertyChange")]
        public function get rlb():RoundedLabel
        {
            return (this._113000rlb);
        }

        [Bindable(event="propertyChange")]
        public function get ta_notice():TextArea
        {
            return (this._288628502ta_notice);
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

        public function set btnOK(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._94069048btnOK;
            if (_local_2 !== _arg_1)
            {
                this._94069048btnOK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnOK", _local_2, _arg_1));
            };
        }

        private function _MarriageSeekingPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MARRIAGE_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MarriageSeekingPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MarriageSeekingPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _marriageWords;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rlb.text = _arg_1;
            }, "rlb.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnOK.label = _arg_1;
            }, "btnOK.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnCancel.label = _arg_1;
            }, "btnCancel.label");
            result[3] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                ta_notice.filters = _arg_1;
            }, "ta_notice.filters");
            result[4] = binding;
            return (result);
        }

        public function set type(_arg_1:int):void
        {
            _type = _arg_1;
            if (_type == GamePredef.TYPE_MARRIAGE_SEEKING)
            {
                _marriageWords = Language.MARRIAGE_PANEL_U[17];
                ta_notice.text = Language.MARRIAGE_PANEL_U[40];
            }
            else
            {
                _marriageWords = Language.MARRIAGE_PANEL_U[18];
                ta_notice.text = Language.MARRIAGE_PANEL_U[41];
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnCancel():BasicGlowButton
        {
            return (this._117924854btnCancel);
        }


    }
}//package com.qeedoo.ui.view.compDragable

