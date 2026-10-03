// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TipSkill

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.core.IToolTip;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.controls.Text;
    import mx.controls.Button;
    import com.qeedoo.game.vo.ToolTipVO;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.containers.Canvas;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.ResizeEvent;
    import mx.events.PropertyChangeEvent;
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

    public class TipSkill extends BasicToolTip implements IBindingClient, IToolTip 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var SKILL_KIND_POSIVE:int = 2;
        private var _core:Core;
        private var dm:DataManager;
        private var SKILL_KIND_BUFF:int = 3;
        public var _TipSkill_Text1:Text;
        public var _TipSkill_Text2:Text;
        public var _TipSkill_Text3:Text;
        public var _TipSkill_Text4:Text;
        public var _TipSkill_Text5:Text;
        public var _TipSkill_Text6:Text;
        private var BUFF_DEFIANCE:String = "BUFF200241";
        public var _TipSkill_Button1:Button;
        private var _3769vo:ToolTipVO;
        public var _TipSkill_Image1:Image;
        public var _TipSkill_Label1:Label;
        private var BUFF_HUNTER_CONFUSE:String = "BUFF200331";
        private var SKILL_KIND_RING:int = 5;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":BasicToolTip,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
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
                                            "height":43,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TipSkill_Label1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 9161214;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_TipSkill_Image1",
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
                                                "type":Button,
                                                "id":"_TipSkill_Button1",
                                                "events":{"click":"___TipSkill_Button1_click"},
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
                                                "type":Text,
                                                "id":"_TipSkill_Text1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 12243454;
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":153,
                                                        "y":23
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_TipSkill_Text2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 16708542;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":45,
                                                        "y":23
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipSkill_Text3"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipSkill_Text4"
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipSkill_Text5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 16773307;
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TipSkill_Text6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
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

        public function TipSkill()
        {
            mx_internal::_document = this;
            this.styleName = "CanvasToolTip";
            this.addEventListener("resize", ___TipSkill_BasicToolTip1_resize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TipSkill._watcherSetupUtil = _arg_1;
        }


        override public function initialize():void
        {
            var target:TipSkill;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TipSkill_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TipSkillWatcherSetupUtil");
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

        private function _TipSkill_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = vo.name;
            _local_1 = Language.TIPSKILL_S[10];
            _local_1 = vo.urlIcon;
            _local_1 = vo.btnVisible;
            _local_1 = vo.consume;
            _local_1 = Language.TIPSKILL_S[11];
            _local_1 = vo.level;
            _local_1 = Language.TIPSKILL_S[0].toString().replace("{level}", "1");
            _local_1 = vo.type;
            _local_1 = Language.TIPSKILL_S[12];
            _local_1 = vo.targetNum;
            _local_1 = (Language.TIPSKILL_S[2] + "1");
            _local_1 = (!(vo.targetNum == ""));
            _local_1 = (!(vo.targetNum == ""));
            _local_1 = vo.description;
            _local_1 = Language.TIPSKILL_S[13];
            _local_1 = vo.maker;
            _local_1 = Language.TIPSKILL_S[14];
        }

        public function set object(_arg_1:Object):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            _core = Core.getInstance();
            dm = DataManager.getInstance();
            vo = new ToolTipVO();
            vo.btnVisible = _arg_1.btnVisible;
            vo.name = _arg_1.temp.name;
            vo.level = Language.TIPSKILL_S[0].toString().replace("{level}", _arg_1.temp.level);
            vo.urlIcon = ResManager.getIconUrl(_arg_1.temp.iconCode);
            vo.description = _arg_1.temp.description;
            vo.info = _arg_1.temp.info;
            if (ToolKit.isEqual(_arg_1.temp.useEnv, 4))
            {
                vo.type = (((Language.TIPSKILL_S[1] + GamePredef.SKILL_KIND_NAME[2]) + "-") + Language.GAMEPREDEF_S[335]);
            }
            else
            {
                vo.type = (((Language.TIPSKILL_S[1] + GamePredef.SKILL_KIND_NAME[_arg_1.temp.kind]) + "-") + GamePredef.SKILL_TYPE_NAME[_arg_1.temp.type]);
            };
            if (((_arg_1.temp.targetNum >= 1) && (_arg_1.temp.kind == 1)))
            {
                vo.targetNum = (Language.TIPSKILL_S[2] + _arg_1.temp.targetNum);
                if (_arg_1.temp.areaAttack > 0)
                {
                    vo.targetNum = (vo.targetNum + ((" [" + GamePredef.SKILL_AREA_TYPE[_arg_1.temp.areaAttack]) + "]"));
                };
            }
            else
            {
                vo.targetNum = "";
            };
            var _local_2:* = "";
            var _local_3:* = "";
            if (_arg_1.temp.useMp > 0)
            {
                if (_arg_1.temp.useMp < 1)
                {
                    _local_4 = int((_arg_1.temp.useMp * 100));
                    _local_3 = (_local_3 = ((Language.TIPSKILL_S[3] + _local_4) + "%"));
                }
                else
                {
                    _local_5 = int(_arg_1.temp.useMp);
                    _local_3 = (Language.TIPSKILL_S[3] + _local_5);
                };
            }
            else
            {
                if (_arg_1.temp.useSp > 0)
                {
                    if (_arg_1.temp.useSp < 1)
                    {
                        _local_4 = int((_arg_1.temp.useSp * 100));
                        _local_3 = ((Language.TIPSKILL_S[15] + _local_4) + "%");
                    }
                    else
                    {
                        _local_5 = int(_arg_1.temp.useSp);
                        _local_3 = (Language.TIPSKILL_S[15] + _local_5);
                    };
                };
            };
            if (_arg_1.slotType == Slot.SLOT_SKILL)
            {
                if (_arg_1.temp.useMp > _core.player.currentMp)
                {
                    _local_3 = ((FONT_COLOR_RED_PROP + _local_3) + FONT_COLOR_SUF_PROP);
                };
            };
            _local_2 = _local_3;
            if (_local_2.length > 0)
            {
                vo.consume = _local_2;
            };
            if (_arg_1.temp.reqLevel)
            {
                vo.reqLevel = (Language.TIPSKILL_S[4] + _arg_1.temp.reqLevel);
                if (ToolKit.isSmallThan(_core.player.level, _arg_1.temp.reqLevel))
                {
                    vo.reqLevel = ((FONT_COLOR_RED_PROP + vo.reqLevel) + FONT_COLOR_SUF_PROP);
                };
            };
            vo.maker = "";
            if (_arg_1.temp.buffId)
            {
                _local_6 = _core.data.getData(GamePredef.TBL_BUFF, _arg_1.temp.buffId);
                if (_local_6)
                {
                    if (((!(_arg_1.temp.kind == SKILL_KIND_POSIVE)) && (!(_arg_1.temp.kind == SKILL_KIND_RING))))
                    {
                        vo.maker = Language.TIPSKILL_S[5].toString().replace("{buffName}", _local_6.name);
                    };
                    vo.maker = (vo.maker + Language.TIPSKILL_S[7].toString().replace("{buffDescription}", _local_6.description));
                    if (((!(_arg_1.temp.kind == SKILL_KIND_POSIVE)) && (!(_arg_1.temp.kind == SKILL_KIND_RING))))
                    {
                        vo.maker = (vo.maker + Language.TIPSKILL_S[8].toString().replace("{buffRound}", _arg_1.temp.buffRound));
                        if (_arg_1.temp.kind != SKILL_KIND_BUFF)
                        {
                            if (GamePredef.notDeleteBuff[_local_6.codeName] == 1)
                            {
                                vo.maker = (vo.maker + Language.TIPSKILL_S[9].toString().replace("{buffRate}", _arg_1.temp.buffRate));
                            }
                            else
                            {
                                if (_local_6.buff == 0)
                                {
                                    if (((!(_local_6.codeName == null)) && ((_local_6.codeName == BUFF_DEFIANCE) || (_local_6.codeName == BUFF_HUNTER_CONFUSE))))
                                    {
                                        vo.maker = (vo.maker + (Language.TIPSKILL_S[9].toString().replace("{buffRate}", _arg_1.temp.buffRate) + Language.TIPSKILL_S[17]));
                                    }
                                    else
                                    {
                                        vo.maker = (vo.maker + (Language.TIPSKILL_S[9].toString().replace("{buffRate}", _arg_1.temp.buffRate) + Language.TIPSKILL_S[16]));
                                    };
                                }
                                else
                                {
                                    vo.maker = (vo.maker + Language.TIPSKILL_S[9].toString().replace("{buffRate}", _arg_1.temp.buffRate));
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        private function get vo():ToolTipVO
        {
            return (this._3769vo);
        }

        private function _TipSkill_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Label1.htmlText = _arg_1;
            }, "_TipSkill_Label1.htmlText");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Label1.text = _arg_1;
            }, "_TipSkill_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (vo.urlIcon);
            }, function (_arg_1:Object):void
            {
                _TipSkill_Image1.source = _arg_1;
            }, "_TipSkill_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (vo.btnVisible);
            }, function (_arg_1:Boolean):void
            {
                _TipSkill_Button1.visible = _arg_1;
            }, "_TipSkill_Button1.visible");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.consume;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text1.htmlText = _arg_1;
            }, "_TipSkill_Text1.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text1.text = _arg_1;
            }, "_TipSkill_Text1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text2.htmlText = _arg_1;
            }, "_TipSkill_Text2.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[0].toString().replace("{level}", "1");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text2.text = _arg_1;
            }, "_TipSkill_Text2.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.type;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text3.htmlText = _arg_1;
            }, "_TipSkill_Text3.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text3.text = _arg_1;
            }, "_TipSkill_Text3.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.targetNum;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text4.htmlText = _arg_1;
            }, "_TipSkill_Text4.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.TIPSKILL_S[2] + "1");
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text4.text = _arg_1;
            }, "_TipSkill_Text4.text");
            result[11] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.targetNum == ""));
            }, function (_arg_1:Boolean):void
            {
                _TipSkill_Text4.visible = _arg_1;
            }, "_TipSkill_Text4.visible");
            result[12] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(vo.targetNum == ""));
            }, function (_arg_1:Boolean):void
            {
                _TipSkill_Text4.includeInLayout = _arg_1;
            }, "_TipSkill_Text4.includeInLayout");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.description;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text5.htmlText = _arg_1;
            }, "_TipSkill_Text5.htmlText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text5.text = _arg_1;
            }, "_TipSkill_Text5.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = vo.maker;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text6.htmlText = _arg_1;
            }, "_TipSkill_Text6.htmlText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TIPSKILL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TipSkill_Text6.text = _arg_1;
            }, "_TipSkill_Text6.text");
            result[17] = binding;
            return (result);
        }

        public function ___TipSkill_Button1_click(_arg_1:MouseEvent):void
        {
            visible = false;
        }

        public function ___TipSkill_BasicToolTip1_resize(_arg_1:ResizeEvent):void
        {
            setPos();
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

        override public function show(_arg_1:Object=null):void
        {
            var _local_3:Object;
            var _local_2:Array = Canvas(parent).getChildren();
            for each (_local_3 in _local_2)
            {
                if (!(_local_3 is TipCre))
                {
                    _local_3.visible = false;
                };
            };
            setPos();
            visible = true;
        }


    }
}//package com.qeedoo.ui.view.comp

