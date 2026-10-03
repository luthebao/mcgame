// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipTitle

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
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.events.PropertyChangeEvent;
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

    public class TipTitle extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _309147635propTxt:Text;
        private var _1499853000descriTxt:Text;
        private var _3582325vBox:VBox;
        public var _TipTitle_RoundedLabel1:RoundedLabel;
        private var _3769vo:ToolTipVO;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_TipTitle_RoundedLabel1",
                        "stylesFactory":function ():void
                        {
                            this.top = "5";
                            this.left = "5";
                            this.fontSize = 16;
                            this.color = 0xFF00;
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TipTitle_Button1_click"},
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
                                    "type":Text,
                                    "id":"descriTxt",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":240});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"propTxt",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":240});
                                    }
                                })]});
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipTitle()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipTitle_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipTitle._watcherSetupUtil = _arg_1;
        }


        public function ___TipTitle_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get descriTxt():Text
        {
            return (this._1499853000descriTxt);
        }

        private function _TipTitle_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipTitle_RoundedLabel1.htmlText = _arg_1;
            }, "_TipTitle_RoundedLabel1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                descriTxt.htmlText = _arg_1;
            }, "descriTxt.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPTITLE_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                descriTxt.text = _arg_1;
            }, "descriTxt.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propAdded;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propTxt.htmlText = _arg_1;
            }, "propTxt.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPTITLE_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propTxt.text = _arg_1;
            }, "propTxt.text");
            result[4] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get propTxt():Text
        {
            return (this._309147635propTxt);
        }

        override public function initialize():void
        {
            var target:TipTitle;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipTitle_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipTitleWatcherSetupUtil");
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

        public function set propTxt(_arg_1:Text):void
        {
            var _local_2:Object = this._309147635propTxt;
            if (_local_2 !== _arg_1)
            {
                this._309147635propTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propTxt", _local_2, _arg_1));
            };
        }

        public function set descriTxt(_arg_1:Text):void
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

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        public function ___TipTitle_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        private function _TipTitle_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.name;
            _local_1 = vo.description;
            _local_1 = Language.TIPTITLE_S[0];
            _local_1 = vo.propAdded;
            _local_1 = Language.TIPTITLE_S[1];
        }

        public function set object(_arg_1:Object):void
        {
            vo = new ToolTipVO();
            vo.name = _arg_1.temp.name;
            vo.description = (((('<font color="#EEEE00">' + Language.TIPTITLE_S[0]) + "</font><br/>") + _arg_1.temp.description) + "<br/><br/>");
            if (((_arg_1.temp.propAdded) && (_arg_1.temp.propAdded.length > 0)))
            {
                vo.propAdded = ((('<font color="#EEEE00">' + Language.TIPTITLE_S[1]) + "</font><br/>") + _arg_1.temp.propAdded);
            }
            else
            {
                vo.propAdded = ((('<font color="#EEEE00">' + Language.TIPTITLE_S[1]) + "</font><br/>") + Language.TIPTITLE_S[2]);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

