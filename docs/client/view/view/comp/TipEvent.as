// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipEvent

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.containers.VBox;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import mx.events.ResizeEvent;
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

    public class TipEvent extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1313937309timeTxt:Text;
        private var _1499853000descriTxt:LinkText;
        private var _3582325vBox:VBox;
        private var _1512935670reqLevelTxt:Text;
        private var _176891356lineTxt:Text;
        public var _TipEvent_RoundedLabel1:RoundedLabel;
        private var _1039292465npcTxt:LinkText;
        private var _3769vo:ToolTipVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipEvent_RoundedLabel1",
                        "stylesFactory":function ():void
                        {
                            this.top = "5";
                            this.left = "5";
                            this.fontSize = 16;
                            this.color = 0xFF00;
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TipEvent_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "5";
                            this.top = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"vBox",
                        "stylesFactory":function ():void
                        {
                            this.left = "0";
                            this.top = "25";
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":LinkText,
                                    "id":"npcTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":240});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"timeTxt"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"lineTxt"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqLevelTxt"
                                }), new UIComponentDescriptor({
                                    "type":LinkText,
                                    "id":"descriTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 16773307;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":310});
                                    }
                                })]});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipEvent()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipEvent_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipEvent._watcherSetupUtil = _arg_1;
        }


        public function set object(_arg_1:Object):void
        {
            var _local_2:String;
            vo = new ToolTipVO();
            vo.name = _arg_1.temp.name;
            vBox.removeAllChildren();
            if (_arg_1.temp.npc != "-1")
            {
                vBox.addChild(npcTxt);
                vo.activeNPC = Language.TIPEVENT_S[1].toString().replace("{npc}", _arg_1.temp.npc);
            };
            if (_arg_1.temp.time != "")
            {
                vBox.addChild(timeTxt);
                vo.activeTime = Language.TIPEVENT_S[2].toString().replace("{time}", _arg_1.temp.time);
            };
            if (_arg_1.temp.line != "")
            {
                vBox.addChild(lineTxt);
                vo.activeLine = Language.TIPEVENT_S[3].toString().replace("{line}", _arg_1.temp.line);
            };
            if (_arg_1.temp.level > 0)
            {
                vBox.addChild(reqLevelTxt);
                if (_arg_1.temp.level > _core.player.level)
                {
                    _local_2 = (('<font color="#FF0000">' + _arg_1.temp.level) + "</font>");
                }
                else
                {
                    _local_2 = (('<font color="#00FF00">' + _arg_1.temp.level) + "</font>");
                };
                vo.reqLevel = Language.TIPEVENT_S[4].toString().replace("{level}", _local_2);
            };
            if (_arg_1.temp.description != "")
            {
                vBox.addChild(descriTxt);
                vo.description = _arg_1.temp.description;
            };
        }

        public function set timeTxt(_arg_1:Text):void
        {
            var _local_2:Object = this._1313937309timeTxt;
            if (_local_2 !== _arg_1)
            {
                this._1313937309timeTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeTxt", _local_2, _arg_1));
            };
        }

        public function ___TipEvent_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get descriTxt():LinkText
        {
            return (this._1499853000descriTxt);
        }

        [Bindable(event="propertyChange")]
        public function get npcTxt():LinkText
        {
            return (this._1039292465npcTxt);
        }

        [Bindable(event="propertyChange")]
        public function get reqLevelTxt():Text
        {
            return (this._1512935670reqLevelTxt);
        }

        private function _TipEvent_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipEvent_RoundedLabel1.htmlText = _arg_1;
            }, "_TipEvent_RoundedLabel1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.activeNPC;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                npcTxt.htmlText = _arg_1;
            }, "npcTxt.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEVENT_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                npcTxt.text = _arg_1;
            }, "npcTxt.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.activeTime;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                timeTxt.htmlText = _arg_1;
            }, "timeTxt.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEVENT_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                timeTxt.text = _arg_1;
            }, "timeTxt.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.activeLine;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lineTxt.htmlText = _arg_1;
            }, "lineTxt.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEVENT_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lineTxt.text = _arg_1;
            }, "lineTxt.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevelTxt.htmlText = _arg_1;
            }, "reqLevelTxt.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEVENT_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevelTxt.text = _arg_1;
            }, "reqLevelTxt.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                descriTxt.htmlText = _arg_1;
            }, "descriTxt.htmlText");
            result[9] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:TipEvent;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipEvent_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipEventWatcherSetupUtil");
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

        public function set reqLevelTxt(_arg_1:Text):void
        {
            var _local_2:Object = this._1512935670reqLevelTxt;
            if (_local_2 !== _arg_1)
            {
                this._1512935670reqLevelTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevelTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lineTxt():Text
        {
            return (this._176891356lineTxt);
        }

        public function set npcTxt(_arg_1:LinkText):void
        {
            var _local_2:Object = this._1039292465npcTxt;
            if (_local_2 !== _arg_1)
            {
                this._1039292465npcTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npcTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeTxt():Text
        {
            return (this._1313937309timeTxt);
        }

        public function set lineTxt(_arg_1:Text):void
        {
            var _local_2:Object = this._176891356lineTxt;
            if (_local_2 !== _arg_1)
            {
                this._176891356lineTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lineTxt", _local_2, _arg_1));
            };
        }

        public function set descriTxt(_arg_1:LinkText):void
        {
            var _local_2:Object = this._1499853000descriTxt;
            if (_local_2 !== _arg_1)
            {
                this._1499853000descriTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descriTxt", _local_2, _arg_1));
            };
        }

        public function set vBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._3582325vBox;
            if (_local_2 !== _arg_1)
            {
                this._3582325vBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vBox", _local_2, _arg_1));
            };
        }

        private function set vo(_arg_1:ToolTipVO):void
        {
            var _local_2:Object = this._3769vo;
            if (_local_2 !== _arg_1)
            {
                this._3769vo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vBox():VBox
        {
            return (this._3582325vBox);
        }

        public function ___TipEvent_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        private function _TipEvent_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.name;
            _local_1 = vo.activeNPC;
            _local_1 = Language.TIPEVENT_S[1];
            _local_1 = vo.activeTime;
            _local_1 = Language.TIPEVENT_S[2];
            _local_1 = vo.activeLine;
            _local_1 = Language.TIPEVENT_S[3];
            _local_1 = vo.reqLevel;
            _local_1 = Language.TIPEVENT_S[4];
            _local_1 = vo.description;
        }


    }
}//package com.qeedoo.ui.view.comp

