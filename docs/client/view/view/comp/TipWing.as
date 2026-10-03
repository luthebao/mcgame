// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipWing

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Text;
    import mx.states.SetStyle;
    import mx.states.SetProperty;
    import mx.controls.Label;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.containers.Canvas;
    import mx.states.RemoveChild;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import mx.states.State;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import flash.display.DisplayObject;
    import mx.styles.IStyleClient;
    import com.qeedoo.ui.resource.ResManager;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.game.data.GameData;
    import mx.events.ResizeEvent;
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

    public class TipWing extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1638753418iconImg:Image;
        private var _110256292text1:Text;
        private var _994192832propBind:Text;
        public var _TipWing_SetStyle1:SetStyle;
        public var _TipWing_SetStyle2:SetStyle;
        public var _TipWing_SetStyle3:SetStyle;
        public var _TipWing_Text2:Text;
        public var _TipWing_Text6:Text;
        public var _TipWing_SetProperty2:SetProperty;
        private var _549739330canSell:Label;
        public var _TipWing_Label3:Label;
        public var _TipWing_Label6:Label;
        public var _TipWing_Text1:Text;
        public var _TipWing_Label2:Label;
        private var _3769vo:ToolTipVO;
        public var _TipWing_Image10:Image;
        public var _TipWing_Image11:Image;
        public var _TipWing_Image12:Image;
        public var _TipWing_Image13:Image;
        public var _TipWing_Image14:Image;
        public var _TipWing_Image15:Image;
        public var _TipWing_Image16:Image;
        public var _TipWing_Image17:Image;
        public var _TipWing_Image18:Image;
        public var _TipWing_Image19:Image;
        public var _TipWing_Text9:Text;
        private var _110256294text3:Text;
        public var _TipWing_Image20:Image;
        public var _TipWing_Image21:Image;
        private var _267844315magicWeaponLevel:Text;
        private var _1311839802tipName:Label;
        private var _609884145featherInfo:Text;
        private var _849270234tipContainer:VBox;
        private var _99346des:Label;
        private var _148001439useType:Text;
        private var _core:Core;
        private var dm:DataManager;
        public var _TipWing_Text10:Text;
        private var _1994147171_isLimitWing:Boolean = false;
        private var _1463976772featherCanvasPet:Canvas;
        private var _1298740563endure:Text;
        public var _TipWing_Image2:Image;
        public var _TipWing_Image3:Image;
        public var _TipWing_Image4:Image;
        public var _TipWing_Image5:Image;
        public var _TipWing_Image6:Image;
        public var _TipWing_Image7:Image;
        public var _TipWing_Image8:Image;
        private var _1861745199featherCanvasChar:Canvas;
        public var _TipWing_RemoveChild1:RemoveChild;
        private var _110256293text2:Text;
        public var _TipWing_Image9:Image;
        public var _TipWing_Button1:Button;
        private var _431118970reqLevel:Text;
        private var obj:Object;
        private var _1095316408currencyPrice:Currency;
        private var _110256295text4:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"tipContainer",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 0;
                            this.paddingLeft = 5;
                            this.paddingRight = 5;
                            this.paddingTop = 5;
                            this.paddingBottom = 5;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":57,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"tipName",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":5,
                                                        "text":"完美的什么装备名字[金]"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipWing_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0x3CFF00;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2,
                                                        "y":39,
                                                        "text":"已绑定"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipWing_Label3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "right";
                                                    this.right = "5";
                                                    this.color = 16766552;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":38,
                                                        "text":"名字最长的人打造",
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"iconImg",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":5,
                                                        "width":32,
                                                        "height":32
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":46,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":74,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":88,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":102,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":115.75,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":129.5,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":143,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":156.75,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":170.75,
                                                        "y":22,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"_TipWing_Button1",
                                                "events":{"click":"___TipWing_Button1_click"},
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
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipWing_Text1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备描述"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipWing_Text2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备位置: 主手"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"useType",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"使用对象: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"reqLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"等级需求: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"magicWeaponLevel",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"神器等级: 123"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipWing_Text6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"物理攻击: 9999"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"endure",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"装备耐久: 9999/9999"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"propBind",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"绑定属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipWing_Text9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"羽毛（人物）属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"featherCanvasChar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":19,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":17.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image16",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":61.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipWing_Text10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"羽毛（宠物）属性"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"featherCanvasPet",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":19,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image17",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":2.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image18",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":17.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image19",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":32.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image20",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":47.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipWing_Image21",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":61.4,
                                                        "y":3,
                                                        "width":12,
                                                        "height":12
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"featherInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x777777;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":""});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"text3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"外形效果:"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"text4",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFBA00;
                                        this.fontSize = 11;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"外形效果:"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"text1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"外形效果:"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"text2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"text":"外形效果:"});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"currencyPrice"
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"canSell",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xC8C8C8;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"des",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x777777;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TipWing_Label6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0x777777;
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TipWing()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.currentState = "common";
            this.states = [_TipWing_State1_c(), _TipWing_State2_c()];
            this.addEventListener("resize", ___TipWing_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipWing._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get featherInfo():Text
        {
            return (this._609884145featherInfo);
        }

        public function set reqLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._431118970reqLevel;
            if (_local_2 !== _arg_1)
            {
                this._431118970reqLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reqLevel", _local_2, _arg_1));
            };
        }

        public function set iconImg(_arg_1:Image):void
        {
            var _local_2:Object = this._1638753418iconImg;
            if (_local_2 !== _arg_1)
            {
                this._1638753418iconImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconImg", _local_2, _arg_1));
            };
        }

        private function _TipWing_SetStyle3_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _TipWing_SetStyle3 = _local_1;
            _local_1.name = "fontSize";
            _local_1.value = 11;
            BindingManager.executeBindings(this, "_TipWing_SetStyle3", _TipWing_SetStyle3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get des():Label
        {
            return (this._99346des);
        }

        private function _TipWing_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "simplify";
            _local_1.overrides = [_TipWing_RemoveChild1_i()];
            return (_local_1);
        }

        public function set des(_arg_1:Label):void
        {
            var _local_2:Object = this._99346des;
            if (_local_2 !== _arg_1)
            {
                this._99346des = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "des", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tipContainer():VBox
        {
            return (this._849270234tipContainer);
        }

        private function setFeatherInfo(_arg_1:Object):void
        {
            var _local_2:int = int(((int(int((_arg_1.inst.holeNum / 10)))) || (0)));
            var _local_3:int = ((int((_arg_1.inst.holeNum % 10))) || (0));
            _setFeatherInfo(_arg_1, "Char", _local_2);
            _setFeatherInfo(_arg_1, "Pet", _local_3);
        }

        private function setTreasure(_arg_1:Object):void
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:*;
            var _local_2:Number = ((_arg_1.slotData.q) || (_arg_1.slotData.quality));
            var _local_3:Number = _core.basic.getColorByQuality(_local_2);
            if (_local_3 == 0)
            {
                _local_4 = GamePredef.EQUIPT_QUALITY[0];
                _local_5 = GamePredef.EQUIPT_QUALITY[0];
            }
            else
            {
                _local_4 = GamePredef.EQUIPT_QUALITY[((_local_3 * 5) - 4)];
                _local_5 = GamePredef.EQUIPT_QUALITY[(_local_3 * 5)];
            };
            vo.costVisible = (_arg_1.temp.tradable > 0);
            if ((((_local_2 > 0) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_core.basic.getColorByQuality(_local_2)]) + "'>") + vo.name) + "</font>");
            };
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]) + "'>") + _arg_1.temp.name) + "</font>");
            };
            vo.propBasic = "";
            if (_arg_1.temp.mainProp1 > 0)
            {
                vo.propBasic = ((((((GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + Math.round((_arg_1.temp.mainPropNum1 * _local_4))) + "-") + Math.round((_arg_1.temp.mainPropNum1 * _local_5))) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.temp.mainProp2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + Math.round((_arg_1.temp.mainPropNum2 * _local_4))) + "-") + Math.round((_arg_1.temp.mainPropNum2 * _local_5))) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + Math.round((_arg_1.temp.propNum1 * _local_4))) + "-") + Math.round((_arg_1.temp.propNum1 * _local_5))) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + Math.round((_arg_1.temp.propNum2 * _local_4))) + "-") + Math.round((_arg_1.temp.propNum2 * _local_5))) + FONT_COLOR_SUF_PROP));
            };
            vo.propBind = "";
            if (((_arg_1.temp.bindPropNum > 0) && (((_arg_1.slotData.q >= 6) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))))
            {
                propBind.visible = true;
                propBind.includeInLayout = true;
                _local_6 = (((_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON) || (_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER)) ? Math.round(_arg_1.temp.bindPropNum) : ("0-" + Math.round((_arg_1.temp.bindPropNum * _local_5))));
                vo.propBind = ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1]) + ": ") + FONT_COLOR_PRE_PROP) + _local_6) + "%") + FONT_COLOR_SUF_PROP);
                vo.propBind = (vo.propBind + "\n");
                vo.propBind = (vo.propBind + ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _local_6) + "%") + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.slotData.b > 0)
            {
                vo.bind = Language.TIPEQUIP_S[3];
            }
            else
            {
                if (_arg_1.slotData.b == 0)
                {
                    vo.bind = Language.TIPEQUIP_S[4];
                    if (vo.propBind.length > 0)
                    {
                        vo.propBind = ((FONT_COLOR_PRE_UNACTIVE + vo.propBind) + FONT_COLOR_SUF_UNACTIVE);
                    };
                };
            };
            if (((_arg_1.slotData.sid) && (_arg_1.slotData.gold)))
            {
                vo.bind = "";
            };
            if (vo.propBind.length > 0)
            {
                vo.propBind = ((PRE_BIND_PROP + "\n") + vo.propBind);
            };
            if ((((!(_arg_1.temp.kind == GamePredef.ITEM_KIND_MAGICWEAPON)) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_FLYER))) && (!(_arg_1.temp.kind == GamePredef.ITEM_KIND_PETEQU))))
            {
                vo.propJewel = Language.TIPEQUIP_S[5];
            };
        }

        private function _TipWing_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (currencyPrice);
            }, function (_arg_1:DisplayObject):void
            {
                _TipWing_RemoveChild1.target = _arg_1;
            }, "_TipWing_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (text3);
            }, function (_arg_1:IStyleClient):void
            {
                _TipWing_SetStyle1.target = _arg_1;
            }, "_TipWing_SetStyle1.target");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (text4);
            }, function (_arg_1:Object):void
            {
                _TipWing_SetProperty2.target = _arg_1;
            }, "_TipWing_SetProperty2.target");
            result[2] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (text4);
            }, function (_arg_1:IStyleClient):void
            {
                _TipWing_SetStyle2.target = _arg_1;
            }, "_TipWing_SetStyle2.target");
            result[3] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (text4);
            }, function (_arg_1:IStyleClient):void
            {
                _TipWing_SetStyle3.target = _arg_1;
            }, "_TipWing_SetStyle3.target");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tipName.htmlText = _arg_1;
            }, "tipName.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.bind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Label2.htmlText = _arg_1;
            }, "_TipWing_Label2.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.maker;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Label3.htmlText = _arg_1;
            }, "_TipWing_Label3.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.urlIcon);
            }, function (_arg_1:Object):void
            {
                iconImg.source = _arg_1;
            }, "iconImg.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar1);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image2.source = _arg_1;
            }, "_TipWing_Image2.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar2);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image3.source = _arg_1;
            }, "_TipWing_Image3.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar3);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image4.source = _arg_1;
            }, "_TipWing_Image4.source");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar4);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image5.source = _arg_1;
            }, "_TipWing_Image5.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar5);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image6.source = _arg_1;
            }, "_TipWing_Image6.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar6);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image7.source = _arg_1;
            }, "_TipWing_Image7.source");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar7);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image8.source = _arg_1;
            }, "_TipWing_Image8.source");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar8);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image9.source = _arg_1;
            }, "_TipWing_Image9.source");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar9);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image10.source = _arg_1;
            }, "_TipWing_Image10.source");
            result[17] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsStar10);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image11.source = _arg_1;
            }, "_TipWing_Image11.source");
            result[18] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipWing_Button1.visible = _arg_1;
            }, "_TipWing_Button1.visible");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Text1.htmlText = _arg_1;
            }, "_TipWing_Text1.htmlText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.position;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Text2.htmlText = _arg_1;
            }, "_TipWing_Text2.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.useType;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                useType.htmlText = _arg_1;
            }, "useType.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.reqLevel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                reqLevel.htmlText = _arg_1;
            }, "reqLevel.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                magicWeaponLevel.htmlText = _arg_1;
            }, "magicWeaponLevel.htmlText");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propBasic;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Text6.htmlText = _arg_1;
            }, "_TipWing_Text6.htmlText");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.endure;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                endure.htmlText = _arg_1;
            }, "endure.htmlText");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propBind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propBind.htmlText = _arg_1;
            }, "propBind.htmlText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propFeatherChar;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Text9.htmlText = _arg_1;
            }, "_TipWing_Text9.htmlText");
            result[28] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel1);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image12.source = _arg_1;
            }, "_TipWing_Image12.source");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel3);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image13.source = _arg_1;
            }, "_TipWing_Image13.source");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel5);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image14.source = _arg_1;
            }, "_TipWing_Image14.source");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel7);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image15.source = _arg_1;
            }, "_TipWing_Image15.source");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel9);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image16.source = _arg_1;
            }, "_TipWing_Image16.source");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.propFeatherPet;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Text10.htmlText = _arg_1;
            }, "_TipWing_Text10.htmlText");
            result[34] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel2);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image17.source = _arg_1;
            }, "_TipWing_Image17.source");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel4);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image18.source = _arg_1;
            }, "_TipWing_Image18.source");
            result[36] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel6);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image19.source = _arg_1;
            }, "_TipWing_Image19.source");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel8);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image20.source = _arg_1;
            }, "_TipWing_Image20.source");
            result[38] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.clsJewel10);
            }, function (_arg_1:Object):void
            {
                _TipWing_Image21.source = _arg_1;
            }, "_TipWing_Image21.source");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.info;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text3.htmlText = _arg_1;
            }, "text3.htmlText");
            result[40] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.info == null));
            }, function (_arg_1:Boolean):void
            {
                text3.includeInLayout = _arg_1;
            }, "text3.includeInLayout");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.lwingName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text4.htmlText = _arg_1;
            }, "text4.htmlText");
            result[42] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_isLimitWing);
            }, function (_arg_1:Boolean):void
            {
                text4.includeInLayout = _arg_1;
            }, "text4.includeInLayout");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.effectTime;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text1.htmlText = _arg_1;
            }, "text1.htmlText");
            result[44] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_isLimitWing);
            }, function (_arg_1:Boolean):void
            {
                text1.includeInLayout = _arg_1;
            }, "text1.includeInLayout");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.effectEndTime;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                text2.htmlText = _arg_1;
            }, "text2.htmlText");
            result[46] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (_isLimitWing);
            }, function (_arg_1:Boolean):void
            {
                text2.includeInLayout = _arg_1;
            }, "text2.includeInLayout");
            result[47] = binding;
            binding = new Binding(this, function ():Number
            {
                return (vo.currency);
            }, function (_arg_1:Number):void
            {
                currencyPrice.value = _arg_1;
            }, "currencyPrice.value");
            result[48] = binding;
            binding = new Binding(this, function ():uint
            {
                return (vo.currencyType);
            }, function (_arg_1:uint):void
            {
                currencyPrice.type = _arg_1;
            }, "currencyPrice.type");
            result[49] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                currencyPrice.visible = _arg_1;
            }, "currencyPrice.visible");
            result[50] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.costVisible);
            }, function (_arg_1:Boolean):void
            {
                currencyPrice.includeInLayout = _arg_1;
            }, "currencyPrice.includeInLayout");
            result[51] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.costVisible));
            }, function (_arg_1:Boolean):void
            {
                canSell.visible = _arg_1;
            }, "canSell.visible");
            result[52] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.costVisible));
            }, function (_arg_1:Boolean):void
            {
                canSell.includeInLayout = _arg_1;
            }, "canSell.includeInLayout");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEQUIP_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                canSell.text = _arg_1;
            }, "canSell.text");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPEQUIP_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipWing_Label6.text = _arg_1;
            }, "_TipWing_Label6.text");
            result[55] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get propBind():Text
        {
            return (this._994192832propBind);
        }

        private function set _isLimitWing(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1994147171_isLimitWing;
            if (_local_2 !== _arg_1)
            {
                this._1994147171_isLimitWing = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isLimitWing", _local_2, _arg_1));
            };
        }

        public function set text1(_arg_1:Text):void
        {
            var _local_2:Object = this._110256292text1;
            if (_local_2 !== _arg_1)
            {
                this._110256292text1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text1", _local_2, _arg_1));
            };
        }

        private function _TipWing_SetStyle2_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _TipWing_SetStyle2 = _local_1;
            _local_1.name = "color";
            _local_1.value = 0xFFBA00;
            BindingManager.executeBindings(this, "_TipWing_SetStyle2", _TipWing_SetStyle2);
            return (_local_1);
        }

        private function setTemp(_arg_1:Object):void
        {
            vo.propBasic = "";
            if (_arg_1.temp.mainProp1 > 0)
            {
                vo.propBasic = (((((GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.mainPropNum1) + (((_arg_1.temp.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.temp.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.temp.mainProp2 > 0)
            {
                vo.propBasic = (vo.propBasic + (((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.mainPropNum2) + (((_arg_1.temp.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.temp.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.propNum1) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.temp.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.temp.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.temp.propNum2) + FONT_COLOR_SUF_PROP));
            };
        }

        private function _TipWing_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _TipWing_SetProperty2 = _local_1;
            _local_1.name = "width";
            _local_1.value = 168;
            BindingManager.executeBindings(this, "_TipWing_SetProperty2", _TipWing_SetProperty2);
            return (_local_1);
        }

        public function set propBind(_arg_1:Text):void
        {
            var _local_2:Object = this._994192832propBind;
            if (_local_2 !== _arg_1)
            {
                this._994192832propBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propBind", _local_2, _arg_1));
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

        public function set text2(_arg_1:Text):void
        {
            var _local_2:Object = this._110256293text2;
            if (_local_2 !== _arg_1)
            {
                this._110256293text2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text2", _local_2, _arg_1));
            };
        }

        private function _setFeatherInfo(_arg_1:Object, _arg_2:String, _arg_3:int):void
        {
            var _local_8:Object;
            var _local_9:int;
            var _local_4:Number = 1;
            var _local_5:* = "";
            if (_arg_2 == "Char")
            {
                _local_4 = 1;
            }
            else
            {
                if (_arg_2 == "Pet")
                {
                    _local_4 = 2;
                }
                else
                {
                    return;
                };
            };
            if (_arg_3 > 0)
            {
                this[("featherCanvas" + _arg_2)].visible = true;
                this[("featherCanvas" + _arg_2)].includeInLayout = true;
            };
            _arg_3 = ((Math.min(5, _arg_3) - 1) * 2);
            _local_5 = (_local_5 + "\n");
            var _local_6:int = _local_4;
            while (_local_6 <= (_local_4 + _arg_3))
            {
                if (_arg_1.inst[("t" + _local_6)] > 0)
                {
                    _local_8 = _core.data.getData(GamePredef.TBL_ITEM_TEMPLATE, _arg_1.inst[("t" + _local_6)]);
                    if (_local_8)
                    {
                        _local_9 = 1;
                        while (_local_9 <= 3)
                        {
                            if (((_local_8[("i" + _local_9)] > 0) && (_local_8[("n" + _local_9)] > 0)))
                            {
                                _local_5 = (_local_5 + (((("" + GamePredef.FEATHER_PROP_NAME[_local_8[("i" + _local_9)]]) + ":") + FONT_COLOR_PRE_PROP) + _local_8[("n" + _local_9)]));
                                if (_local_8.type == GamePredef.ITEM_TYPE_FEATHER_D)
                                {
                                    _local_5 = (_local_5 + "%");
                                };
                                _local_5 = (_local_5 + (FONT_COLOR_SUF_PROP + " "));
                            };
                            _local_9++;
                        };
                        if (_local_5.length > 0)
                        {
                            _local_5 = (_local_5 + "\n");
                        };
                        vo[("clsJewel" + _local_6)] = ResManager.ICON_EQUIP_WING_FEATHER;
                    };
                }
                else
                {
                    vo[("clsJewel" + _local_6)] = ResManager.ICON_EQUIP_WING_HOLE;
                };
                _local_6 = (_local_6 + 2);
            };
            var _local_7:String = ((_arg_2 == "Char") ? PRE_FEATHER_PROP_CHAR : PRE_FEATHER_PROP_PET);
            if (((_local_5.length > 0) || (true)))
            {
                vo[("propFeather" + _arg_2)] = (_local_7 + _local_5);
            };
        }

        public function set object(_arg_1:Object):void
        {
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            vo = new ToolTipVO();
            obj = _arg_1;
            if (!_arg_1.temp)
            {
                return;
            };
            setCommon(_arg_1);
            if (((((_arg_1.slotData) && (_arg_1.slotData.wingTemp)) || (_arg_1.slotType == Slot.SLOT_TREASURE)) || ((_arg_1.slotData) && ((_arg_1.slotData.q) || (Number(_arg_1.slotData.quality))))))
            {
                setTreasure(_arg_1);
            }
            else
            {
                if (_arg_1.type == BasicToolTip.TYPE_TEMP)
                {
                    setTemp(_arg_1);
                }
                else
                {
                    setInst(_arg_1);
                };
            };
        }

        private function isEquSid(_arg_1:int):void
        {
            var _local_2:Core = Core.getInstance();
            _local_2.remote.call("isEquSid", new Responder(onIsEquSid), _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get iconImg():Image
        {
            return (this._1638753418iconImg);
        }

        public function set canSell(_arg_1:Label):void
        {
            var _local_2:Object = this._549739330canSell;
            if (_local_2 !== _arg_1)
            {
                this._549739330canSell = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canSell", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TipWing;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipWing_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipWingWatcherSetupUtil");
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
        public function get useType():Text
        {
            return (this._148001439useType);
        }

        private function _TipWing_SetStyle1_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _TipWing_SetStyle1 = _local_1;
            _local_1.name = "fontSize";
            _local_1.value = 10;
            BindingManager.executeBindings(this, "_TipWing_SetStyle1", _TipWing_SetStyle1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get reqLevel():Text
        {
            return (this._431118970reqLevel);
        }

        public function set endure(_arg_1:Text):void
        {
            var _local_2:Object = this._1298740563endure;
            if (_local_2 !== _arg_1)
            {
                this._1298740563endure = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endure", _local_2, _arg_1));
            };
        }

        private function _TipWing_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _TipWing_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_TipWing_RemoveChild1", _TipWing_RemoveChild1);
            return (_local_1);
        }

        public function set featherCanvasChar(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1861745199featherCanvasChar;
            if (_local_2 !== _arg_1)
            {
                this._1861745199featherCanvasChar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherCanvasChar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get text1():Text
        {
            return (this._110256292text1);
        }

        private function _TipWing_SetProperty1_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "height";
            _local_1.value = 472;
            return (_local_1);
        }

        public function set currencyPrice(_arg_1:Currency):void
        {
            var _local_2:Object = this._1095316408currencyPrice;
            if (_local_2 !== _arg_1)
            {
                this._1095316408currencyPrice = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currencyPrice", _local_2, _arg_1));
            };
        }

        public function set featherCanvasPet(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1463976772featherCanvasPet;
            if (_local_2 !== _arg_1)
            {
                this._1463976772featherCanvasPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherCanvasPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get text2():Text
        {
            return (this._110256293text2);
        }

        [Bindable(event="propertyChange")]
        public function get endure():Text
        {
            return (this._1298740563endure);
        }

        private function equipDataLoaded(_arg_1:GameDataEvent):void
        {
            _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.data.id), equipDataLoaded);
            vo.activeEquipName = _arg_1.data.name;
        }

        public function set tipName(_arg_1:Label):void
        {
            var _local_2:Object = this._1311839802tipName;
            if (_local_2 !== _arg_1)
            {
                this._1311839802tipName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get text3():Text
        {
            return (this._110256294text3);
        }

        [Bindable(event="propertyChange")]
        public function get currencyPrice():Currency
        {
            return (this._1095316408currencyPrice);
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        public function set text4(_arg_1:Text):void
        {
            var _local_2:Object = this._110256295text4;
            if (_local_2 !== _arg_1)
            {
                this._110256295text4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherCanvasPet():Canvas
        {
            return (this._1463976772featherCanvasPet);
        }

        [Bindable(event="propertyChange")]
        public function get canSell():Label
        {
            return (this._549739330canSell);
        }

        private function setInst(_arg_1:Object):void
        {
            var _local_4:Date;
            var _local_5:String;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:*;
            var _local_11:String;
            var _local_12:Array;
            var _local_13:RegExp;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:Number;
            var _local_18:Number;
            var _local_19:int;
            var _local_20:Date;
            var _local_21:Object;
            if (ToolKit.isBigThan(_arg_1.inst.t, 0))
            {
                _local_4 = new Date(Number(_arg_1.inst.t));
                _local_5 = Language.TIPEQUIP_S[21].toString();
                _local_5 = _local_5.replace("{fullYear}", _local_4.fullYear);
                _local_5 = _local_5.replace("{lastMonth}", ToolKit.add(_local_4.month, 1));
                _local_5 = _local_5.replace("{lastDate}", _local_4.date);
                _local_5 = _local_5.replace("{lastHour}", _local_4.hours);
                _local_5 = _local_5.replace("{lastMinutes}", _local_4.minutes);
                vo.info = (vo.info + _local_5);
            };
            vo.costVisible = (_arg_1.temp.tradable > 0);
            if (vo.costVisible)
            {
                if (_arg_1.temp.price > 0)
                {
                    vo.currency = int((_arg_1.temp.price / 4));
                    if (_arg_1.inst.binded > 0)
                    {
                        vo.currencyType = Currency.TYPE_MONEY_BIND;
                    }
                    else
                    {
                        vo.currencyType = Currency.TYPE_MONEY;
                    };
                };
                if (_arg_1.temp.gold > 0)
                {
                    vo.currency = 1;
                    if (_arg_1.inst.binded > 0)
                    {
                        vo.currencyType = Currency.TYPE_MONEY_BIND;
                    }
                    else
                    {
                        vo.currencyType = Currency.TYPE_MONEY;
                    };
                };
            };
            var _local_2:int = 1;
            while (_local_2 <= Math.min(_arg_1.inst.upgradeNum, 10))
            {
                vo[("clsStar" + _local_2)] = ResManager.ICON_EQUIP_STAR;
                _local_2++;
            };
            var _local_3:int;
            if (((_arg_1.inst.flag) && (_arg_1.inst.flag.indexOf("level") >= 0)))
            {
                _local_6 = _arg_1.inst.flag;
                _local_6 = _local_6.substring(_local_6.indexOf("level"));
                _local_7 = _local_6.split(",");
                _local_8 = _local_7[0].split(":");
                _local_9 = _local_8[1].split('"').join("");
                _local_3 = int(_local_9);
            };
            if (_arg_1.inst.color > 0)
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.inst.color]) + "'>") + ((_local_3) ? (vo.name + GamePredef.WING_QUALITY_NAME_ARR[(_local_3 - 1)]) : vo.name)) + "</font>");
            };
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]) + "'>") + _arg_1.temp.name) + "</font>");
            };
            vo.propBasic = "";
            if (_arg_1.inst.mainProp1 > 0)
            {
                _local_10 = GamePredef.EQUIPT_STAR_NUM[_arg_1.inst.upgradeNum];
                vo.propBasic = (((((GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp1] + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.inst.mainPropNum1 * _local_10))) + (((_arg_1.inst.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.inst.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.inst.mainProp2 > 0)
            {
                _local_10 = GamePredef.EQUIPT_STAR_NUM[_arg_1.inst.upgradeNum];
                vo.propBasic = (vo.propBasic + (((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + int((_arg_1.inst.mainPropNum2 * _local_10))) + (((_arg_1.inst.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (_arg_1.inst.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.inst.prop1 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.prop1]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.propNum1) + FONT_COLOR_SUF_PROP));
            };
            if (_arg_1.inst.prop2 > 0)
            {
                vo.propBasic = (vo.propBasic + ((((("\n" + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.prop2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.propNum2) + FONT_COLOR_SUF_PROP));
            };
            setFeatherInfo(_arg_1);
            vo.propBind = "";
            if (((_arg_1.inst.bindMainPropNum1 > 0) || (_arg_1.inst.bindMainPropNum2 > 0)))
            {
                propBind.visible = true;
                propBind.includeInLayout = true;
            };
            if (_arg_1.inst.binded > 0)
            {
                vo.bind = Language.TIPEQUIP_S[3];
                if (_arg_1.inst.bindMainPropNum1 > 0)
                {
                    vo.propBind = ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp1]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.bindMainPropNum1) + "%") + FONT_COLOR_SUF_PROP);
                };
                if (_arg_1.inst.bindMainPropNum2 > 0)
                {
                    if (vo.propBind.length > 0)
                    {
                        vo.propBind = (vo.propBind + "\n");
                    };
                    vo.propBind = (vo.propBind + ((((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp2]) + ": ") + FONT_COLOR_PRE_PROP) + _arg_1.inst.bindMainPropNum2) + "%") + FONT_COLOR_SUF_PROP));
                };
            }
            else
            {
                vo.bind = Language.TIPEQUIP_S[4];
                if (_arg_1.inst.bindMainPropNum1 > 0)
                {
                    vo.propBind = ((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp1]) + ": ") + _arg_1.inst.bindMainPropNum1) + "%");
                };
                if (_arg_1.inst.bindMainPropNum2 > 0)
                {
                    if (vo.propBind.length > 0)
                    {
                        vo.propBind = (vo.propBind + "\n");
                    };
                    vo.propBind = (vo.propBind + ((((PRE_BINDED_PROP + GamePredef.EQUIPT_PROP_NAME[_arg_1.inst.mainProp2]) + ": ") + _arg_1.inst.bindMainPropNum2) + "%"));
                };
                if (vo.propBind.length > 0)
                {
                    vo.propBind = ((FONT_COLOR_PRE_UNACTIVE + vo.propBind) + FONT_COLOR_SUF_UNACTIVE);
                };
            };
            if (vo.propBind.length > 0)
            {
                vo.propBind = ((PRE_BIND_PROP + "\n") + vo.propBind);
            };
            if (!ToolKit.isEqual(_arg_1.temp.kind, GamePredef.ITEM_KIND_DRESS))
            {
                _local_11 = Language.TIPEQUIP_S[22].toString();
                _local_11 = _local_11.replace("{endureLeft}", Number(_arg_1.inst.endureLeft));
                _local_11 = _local_11.replace("{endureMax}", _arg_1.inst.endureMax);
                vo.endure = _local_11;
            };
            if (_arg_1.inst.endureLeft == 0)
            {
                vo.endure = ((FONT_COLOR_RED_PROP + vo.endure) + FONT_COLOR_SUF_PROP);
            };
            if (_arg_1.inst.maker)
            {
                vo.maker = (_arg_1.inst.maker + Language.TIPEQUIP_S[23]);
            };
            if (((((_arg_1.inst.flag) && (!(_arg_1.inst.flag == ""))) && (_arg_1.inst.flag.indexOf("lc:") >= 0)) && ((_arg_1.inst.flag.indexOf("{s:2") >= 0) || (_arg_1.inst.flag.indexOf(",s:2") >= 0))))
            {
                _local_12 = String(_arg_1.inst.flag).split(",");
                _local_13 = /\d+/;
                _local_14 = 99999;
                _local_15 = 1;
                _local_17 = 0;
                _local_18 = 0;
                _local_19 = 0;
                while (_local_19 < _local_12.length)
                {
                    if (_local_12[_local_19].indexOf("lc:") >= 0)
                    {
                        _local_14 = _local_19;
                    };
                    if (((_local_12[_local_19].indexOf("s:") >= 0) && (_local_19 >= _local_14)))
                    {
                        _local_15 = Number(_local_12[_local_19].match(_local_13));
                        _local_18++;
                        if (_local_15 != 1)
                        {
                            _isLimitWing = true;
                        }
                        else
                        {
                            if (_local_18 == 0)
                            {
                                _isLimitWing = false;
                            };
                        };
                    };
                    if (((_local_12[_local_19].indexOf("t:") >= 0) && (_local_19 >= _local_14)))
                    {
                        _local_16 = Number(_local_12[_local_19].match(_local_13));
                        _local_20 = new Date(_local_16);
                        vo.effectEndTime = (((((((((((Language.TIPEQUIP_S[39] + _local_20.getFullYear()) + "-") + ToolKit.add(_local_20.month, 1)) + "-") + _local_20.date) + " ") + _local_20.hours) + ":") + _local_20.minutes) + ":") + _local_20.seconds);
                    };
                    if ((((_local_12[_local_19].indexOf("r:") >= 0) && (_local_19 >= _local_14)) && (_local_18 == 0)))
                    {
                        _local_18++;
                        _local_17 = Number(_local_12[_local_19].match(_local_13));
                        if (GamePredef.WING_RES_ID[_local_17])
                        {
                            _local_21 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][GamePredef.WING_RES_ID[_local_17][0]];
                            vo.lwingName = (Language.TIPEQUIP_S[40] + _local_21.name);
                            vo.effectTime = Language.TIPEQUIP_S[41].replace("{num}", GamePredef.WING_RES_ID[_local_17][1]);
                        };
                    };
                    _local_19++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get text4():Text
        {
            return (this._110256295text4);
        }

        [Bindable(event="propertyChange")]
        private function get _isLimitWing():Boolean
        {
            return (this._1994147171_isLimitWing);
        }

        [Bindable(event="propertyChange")]
        public function get tipName():Label
        {
            return (this._1311839802tipName);
        }

        public function set magicWeaponLevel(_arg_1:Text):void
        {
            var _local_2:Object = this._267844315magicWeaponLevel;
            if (_local_2 !== _arg_1)
            {
                this._267844315magicWeaponLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicWeaponLevel", _local_2, _arg_1));
            };
        }

        public function set text3(_arg_1:Text):void
        {
            var _local_2:Object = this._110256294text3;
            if (_local_2 !== _arg_1)
            {
                this._110256294text3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "text3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get featherCanvasChar():Canvas
        {
            return (this._1861745199featherCanvasChar);
        }

        private function onIsEquSid(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                des.text = Language.TIPEQUIP_S[32];
            }
            else
            {
                des.text = Language.TIPEQUIP_S[33];
            };
        }

        [Bindable(event="propertyChange")]
        public function get magicWeaponLevel():Text
        {
            return (this._267844315magicWeaponLevel);
        }

        private function _TipWing_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "common";
            _local_1.overrides = [_TipWing_SetProperty1_c(), _TipWing_SetStyle1_i(), _TipWing_SetProperty2_i(), _TipWing_SetStyle2_i(), _TipWing_SetStyle3_i()];
            return (_local_1);
        }

        public function set featherInfo(_arg_1:Text):void
        {
            var _local_2:Object = this._609884145featherInfo;
            if (_local_2 !== _arg_1)
            {
                this._609884145featherInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "featherInfo", _local_2, _arg_1));
            };
        }

        public function set useType(_arg_1:Text):void
        {
            var _local_2:Object = this._148001439useType;
            if (_local_2 !== _arg_1)
            {
                this._148001439useType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useType", _local_2, _arg_1));
            };
        }

        private function setCommon(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:String;
            var _local_9:Array;
            var _local_10:int;
            var _local_11:int;
            vo.bind = "";
            vo.btnVisible = _arg_1.btnVisible;
            tipName.toolTip = "";
            vo.name = _arg_1.temp.name;
            if (ToolKit.isBigOrEqual(_arg_1.temp.color, 0))
            {
                vo.name = (((("<font color='" + GamePredef.MSG_ITEM_COLOR[_arg_1.temp.color]) + "'>") + _arg_1.temp.name) + "</font>");
            };
            vo.urlIcon = ResManager.getIconUrl(_arg_1.temp.iconCode);
            ResManager.setColorCode(iconImg, _arg_1.temp.colorCode);
            vo.description = _arg_1.temp.description;
            vo.info = _arg_1.temp.info;
            if (((ToolKit.isBigThan(_arg_1.temp.t, 0)) && (ToolKit.isSmallOrEqual(_arg_1.temp.t, 100000000000))))
            {
                if (vo.info.length > 0)
                {
                    vo.info = (vo.info + "<br>");
                };
                vo.info = (vo.info + Language.TIPEQUIP_S[7]);
                _local_3 = (_arg_1.temp.t % 60);
                _local_4 = int((Math.floor((_arg_1.temp.t / 60)) % 24));
                _local_5 = int((Math.floor((_arg_1.temp.t / 1440)) % 31));
                _local_6 = int((Math.floor((_arg_1.temp.t / 44640)) % 365));
                _local_7 = int(Math.floor((_arg_1.temp.t / 16293600)));
                if (ToolKit.isBigThan(_local_7, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[8].toString().replace("{year}", _local_7));
                };
                if (ToolKit.isBigThan(_local_6, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[9].toString().replace("{month}", _local_6));
                };
                if (ToolKit.isBigThan(_local_5, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[10].toString().replace("{day}", _local_5));
                };
                if (ToolKit.isBigThan(_local_4, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[11].toString().replace("{hour}", _local_4));
                };
                if (ToolKit.isBigThan(_local_3, 0))
                {
                    vo.info = (vo.info + Language.TIPEQUIP_S[12].toString().replace("{minute}", _local_3));
                };
            };
            var _local_2:String = Language.TIPEQUIP_S[14].toString().replace("{EQUIP_POSITION}", GamePredef.EQUIP_POSITION[_arg_1.temp.position]);
            vo.costVisible = true;
            vo.position = _local_2;
            vo.bind = GamePredef.PROP_BINDTYPE[_arg_1.temp.bindType];
            if (((_arg_1.slotData) && (_arg_1.slotData.type)))
            {
                if ((((_arg_1.slotData.type == GamePredef.TBL_EQUIPT_TEMPLATE) || (_arg_1.slotData.type == GamePredef.TBL_ITEM_TEMPLATE)) || (_arg_1.slotData.type == GamePredef.TBL_CREATURE)))
                {
                    vo.bind = "";
                };
            };
            if (_arg_1.cost > 0)
            {
                vo.currency = _arg_1.cost;
                vo.currencyType = _arg_1.costType;
            }
            else
            {
                if (_arg_1.temp.price > 0)
                {
                    vo.currency = _arg_1.temp.price;
                    vo.currencyType = Currency.TYPE_MONEYALL;
                };
                if (_arg_1.temp.gold > 0)
                {
                    vo.currency = _arg_1.temp.gold;
                    vo.currencyType = Currency.TYPE_GOLDALL;
                };
            };
            featherCanvasChar.visible = false;
            featherCanvasChar.includeInLayout = false;
            featherCanvasPet.visible = false;
            featherCanvasPet.includeInLayout = false;
            propBind.visible = false;
            propBind.includeInLayout = false;
            switch (Number(_arg_1.temp.useType))
            {
                case 1:
                    if (_arg_1.temp.reqLevel)
                    {
                        _local_8 = Language.TIPEQUIP_S[15].toString().replace("{reqLevel}", _arg_1.temp.reqLevel);
                        vo.reqLevel = _local_8;
                        if (ToolKit.isSmallThan(_core.player.level, _arg_1.temp.reqLevel))
                        {
                            vo.reqLevel = ((FONT_COLOR_RED_PROP + vo.reqLevel) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    if (_arg_1.temp.reqClass)
                    {
                        vo.useType = Language.TIPEQUIP_S[16];
                        _local_9 = _arg_1.temp.reqClass.split("|");
                        _local_10 = 0;
                        for each (_local_11 in _local_9)
                        {
                            if ((((_local_11) && (_local_11 >= 1)) && (_local_11 <= 6)))
                            {
                                vo.useType = (vo.useType + (dm.getGameDataList(GamePredef.TBL_CLASS)[_local_11].name + " "));
                                _local_10 = (_local_10 + _local_11);
                            };
                        };
                        if (_local_10 == 21)
                        {
                            vo.useType = Language.TIPEQUIP_S[17];
                        };
                        if (String(_arg_1.temp.reqClass).indexOf((("|" + _core.player.classId) + "|")) < 0)
                        {
                            vo.useType = ((FONT_COLOR_RED_PROP + vo.useType) + FONT_COLOR_SUF_PROP);
                        };
                    };
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = true;
                    break;
                default:
                    vo.useType = Language.TIPEQUIP_S[20];
                    useType.includeInLayout = true;
                    reqLevel.includeInLayout = false;
            };
            if (obj.slotData)
            {
                isEquSid(obj.slotData.sid);
            };
        }

        public function ___TipWing_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
        }

        public function ___TipWing_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        private function _TipWing_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = currencyPrice;
            _local_1 = text3;
            _local_1 = text4;
            _local_1 = text4;
            _local_1 = text4;
            _local_1 = vo.name;
            _local_1 = vo.bind;
            _local_1 = vo.maker;
            _local_1 = vo.urlIcon;
            _local_1 = vo.clsStar1;
            _local_1 = vo.clsStar2;
            _local_1 = vo.clsStar3;
            _local_1 = vo.clsStar4;
            _local_1 = vo.clsStar5;
            _local_1 = vo.clsStar6;
            _local_1 = vo.clsStar7;
            _local_1 = vo.clsStar8;
            _local_1 = vo.clsStar9;
            _local_1 = vo.clsStar10;
            _local_1 = vo.btnVisible;
            _local_1 = vo.description;
            _local_1 = vo.position;
            _local_1 = vo.useType;
            _local_1 = vo.reqLevel;
            _local_1 = vo.level;
            _local_1 = vo.propBasic;
            _local_1 = vo.endure;
            _local_1 = vo.propBind;
            _local_1 = vo.propFeatherChar;
            _local_1 = vo.clsJewel1;
            _local_1 = vo.clsJewel3;
            _local_1 = vo.clsJewel5;
            _local_1 = vo.clsJewel7;
            _local_1 = vo.clsJewel9;
            _local_1 = vo.propFeatherPet;
            _local_1 = vo.clsJewel2;
            _local_1 = vo.clsJewel4;
            _local_1 = vo.clsJewel6;
            _local_1 = vo.clsJewel8;
            _local_1 = vo.clsJewel10;
            _local_1 = vo.info;
            _local_1 = (!(vo.info == null));
            _local_1 = vo.lwingName;
            _local_1 = _isLimitWing;
            _local_1 = vo.effectTime;
            _local_1 = _isLimitWing;
            _local_1 = vo.effectEndTime;
            _local_1 = _isLimitWing;
            _local_1 = vo.currency;
            _local_1 = vo.currencyType;
            _local_1 = vo.costVisible;
            _local_1 = vo.costVisible;
            _local_1 = (!(vo.costVisible));
            _local_1 = (!(vo.costVisible));
            _local_1 = Language.TIPEQUIP_S[24];
            _local_1 = Language.TIPEQUIP_S[34];
        }

        public function currencyHide(_arg_1:String):void
        {
            if (_arg_1 == "temp")
            {
                currentState = "simplify";
            };
            if (_arg_1 == "inst")
            {
                if ((((!(vo.currency)) || (vo.currency < 500)) || (canSell.visible)))
                {
                    currentState = "simplify";
                }
                else
                {
                    currentState = "common";
                };
            };
        }

        public function set tipContainer(_arg_1:VBox):void
        {
            var _local_2:Object = this._849270234tipContainer;
            if (_local_2 !== _arg_1)
            {
                this._849270234tipContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipContainer", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

