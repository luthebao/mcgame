// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipAchieve

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.AchieveVO;
    import mx.controls.Text;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.getDefinitionByName;
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

    public class TipAchieve extends BasicToolTip implements IBindingClient 
    {

        public static var ACH_NAME_STR:String = "<font color='{color}'>【{name}】</font>";
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1330657564txtAchieveAward:BasicTxtButton;
        private var _92633567achVo:AchieveVO;
        public var _TipAchieve_Text2:Text;
        private var _859630293imageAch:Image;
        private var _1621552033txtAchName:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":224,
                    "height":88,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "stylesFactory":function ():void
                        {
                            this.paddingLeft = 8;
                            this.verticalGap = 15;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":10,
                                "width":212,
                                "height":75,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"txtAchName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectable":false,
                                            "text":"【成就名称】",
                                            "width":157,
                                            "height":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipAchieve_Text2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "selectable":false,
                                            "text":"成就描述",
                                            "width":199,
                                            "height":38
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___TipAchieve_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":0,
                                "styleName":"BtnToolTipClose",
                                "width":15,
                                "height":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imageAch",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":42,
                                "height":42,
                                "x":165,
                                "y":3
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"txtAchieveAward",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":176,
                                "y":12,
                                "width":20
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

        public function TipAchieve()
        {
            mx_internal::_document = this;
            this.width = 224;
            this.height = 88;
            this.styleName = "CanvasToolTip";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipAchieve._watcherSetupUtil = _arg_1;
        }


        private function _TipAchieve_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = achVo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtAchName.htmlText = _arg_1;
            }, "txtAchName.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = achVo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipAchieve_Text2.htmlText = _arg_1;
            }, "_TipAchieve_Text2.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_ACHIEVEMENT);
            }, function (_arg_1:Object):void
            {
                imageAch.source = _arg_1;
            }, "imageAch.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = achVo.award;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtAchieveAward.label = _arg_1;
            }, "txtAchieveAward.label");
            result[3] = binding;
            return (result);
        }

        public function set txtAchName(_arg_1:Text):void
        {
            var _local_2:Object = this._1621552033txtAchName;
            if (_local_2 !== _arg_1)
            {
                this._1621552033txtAchName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtAchName", _local_2, _arg_1));
            };
        }

        public function set object(_arg_1:Object):void
        {
            achVo = new AchieveVO();
            if (((_arg_1.type == BasicToolTip.TYPE_TEMP) && (_arg_1.temp)))
            {
                achVo.name = ACH_NAME_STR.replace("{color}", GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]).replace("{name}", _arg_1.temp.name);
                achVo.description = _arg_1.temp.description;
                achVo.award = _arg_1.temp.award;
            };
        }

        override public function initialize():void
        {
            var target:TipAchieve;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipAchieve_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipAchieveWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get txtAchieveAward():BasicTxtButton
        {
            return (this._1330657564txtAchieveAward);
        }

        public function set imageAch(_arg_1:Image):void
        {
            var _local_2:Object = this._859630293imageAch;
            if (_local_2 !== _arg_1)
            {
                this._859630293imageAch = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageAch", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get achVo():AchieveVO
        {
            return (this._92633567achVo);
        }

        private function set achVo(_arg_1:AchieveVO):void
        {
            var _local_2:Object = this._92633567achVo;
            if (_local_2 !== _arg_1)
            {
                this._92633567achVo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achVo", _local_2, _arg_1));
            };
        }

        private function _TipAchieve_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = achVo.name;
            _local_1 = achVo.description;
            _local_1 = ResManager.ICON_ACHIEVEMENT;
            _local_1 = achVo.award;
        }

        [Bindable(event="propertyChange")]
        public function get txtAchName():Text
        {
            return (this._1621552033txtAchName);
        }

        [Bindable(event="propertyChange")]
        public function get imageAch():Image
        {
            return (this._859630293imageAch);
        }

        public function set txtAchieveAward(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1330657564txtAchieveAward;
            if (_local_2 !== _arg_1)
            {
                this._1330657564txtAchieveAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtAchieveAward", _local_2, _arg_1));
            };
        }

        public function ___TipAchieve_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }


    }
}//package com.qeedoo.ui.view.comp

