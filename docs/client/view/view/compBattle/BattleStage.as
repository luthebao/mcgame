// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.BattleStage

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.effects.Fade;
    import mx.controls.Image;
    import com.qeedoo.ui.view.compGameStage.DynamicItemContainer;
    import com.qeedoo.ui.view.comp.Localizer;
    import mx.containers.Canvas;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.SpeakText;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponent;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.ui.view.compGameStage.BattleCreatureView;
    import mx.events.PropertyChangeEvent;
    import flash.utils.setTimeout;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.object.Charactor;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.AreaUtil;
    import flash.display.Sprite;
    import mx.core.IUITextField;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.view.compMain.UserBarCanvas;
    import mx.events.CloseEvent;
    import flash.net.Responder;
    import mx.events.FlexEvent;
    import com.qeedoo.game.object.Pet;
    import com.qeedoo.game.object.Creature;
    import flash.display.Loader;
    import com.qeedoo.ui.view.compGameStage.CreatureView;
    import flash.net.URLRequest;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.ItemConfig;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.collections.ArrayCollection;
    import flash.geom.ColorTransform;
    import com.qeedoo.ui.view.compGameStage.StageMain;
    import flash.display.BitmapData;
    import flash.display.Bitmap;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import mx.managers.PopUpManager;
    import flash.geom.Point;
    import com.qeedoo.ui.view.compMain.ChatCanvas;
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

    public class BattleStage extends SimpleCanvas implements IBindingClient 
    {

        private static const _RELIVE_NORMAL:* = 1;
        private static const _RELIVE_FREE:* = 2;
        private static const _RELIVE_WB:* = 3;
        private static const _RELIVE_TEXT_ENUM:Object = [];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MIN_ACTION_TIME:int = 500;
        private const END_DELAY:int = 1500;
        private const START_DELAY:int = 2000;
        private var _1282133823fadeIn:Fade;
        private var _196953076bgLayer:SimpleCanvas;
        private var _93647166bgImg:Image;
        private var _1387484498cLayer:DynamicItemContainer;
        private var _sneak:int;
        private var _2053587258battlePos6:Localizer;
        public var exp:int;
        private var _93510486cBuff:BuffCanvas;
        private var _1091436750fadeOut:Fade;
        private var _1306176368stageOut:Fade;
        private var _593980680localizerContainer:Canvas;
        private var _2053587261battlePos9:Localizer;
        private var _1089356982magicCircleImg0:Image;
        private var _2107362836battlePos110:Localizer;
        private var _petAlive:Boolean = true;
        private var _2053587253battlePos1:Localizer;
        private var _763304541battlePos18:Localizer;
        private var _alert:Alert;
        private var _763304544battlePos15:Localizer;
        private var _763304547battlePos12:Localizer;
        private var isRoundPlayFinish:Boolean = false;
        private var _auto:Object;
        private var _2053587256battlePos4:Localizer;
        public var rep:int;
        public var isAirBattle:Boolean;
        private var _94035408cTime:TimeCountCanvas;
        private var _playerAlive:Boolean = true;
        private var _actionCount:int;
        private var _2107362805battlePos100:Localizer;
        private var _2053587259battlePos7:Localizer;
        private var _posDict:Object;
        private var _guestBattle:Boolean;
        private var _2053377414battleInfo:SpeakText;
        private var battleInfoBtn:BasicGlowButton;
        private var _1217229302infoPanel:BattleInfoCanvas;
        private var _454794285replayCmd:Canvas;
        private var _763304540battlePos19:Localizer;
        private var _battleSeq:Array;
        private var _763304543battlePos16:Localizer;
        private var _currentAction:Object;
        private var _2053587254battlePos2:Localizer;
        private var _isReplay:Boolean = false;
        public var battleTargetCanvas:BattleTargetCanvas;
        private var _763304546battlePos13:Localizer;
        private var _playerActive:Boolean = true;
        public var expBattle:int;
        private var timerTarget:uint = 0;
        private var _763304549battlePos10:Localizer;
        private var _reliveFlag:int = 1;
        private var _2053587257battlePos5:Localizer;
        private var _333275108cloudLayer:UIComponent;
        private var _1859910569frontEffectLayer:UIComponent;
        private var _545119723watchCmd:Canvas;
        public var boss:int;
        private var _1769958153skillCanvas:SkillCanvas;
        private var _2053587260battlePos8:Localizer;
        private var _1238309517cLayerContainer:SimpleCanvas;
        private var _dirUpper:int;
        public var cPlayerCmd:PlayerCmdCanvas;
        private var _petActive:Boolean = true;
        private var _2053587252battlePos0:Localizer;
        public var cList:Object;
        private var _1897528125stageIn:Fade;
        private var _checkRemote:Boolean = false;
        private var _763304542battlePos17:Localizer;
        private var _877517529backEffectLayer:UIComponent;
        private var _playEnd:Boolean = true;
        private var _1096560525resTime:int = 20;
        private var _763304545battlePos14:Localizer;
        private var _2053587255battlePos3:Localizer;
        private var _dirLower:int;
        public var _BattleStage_Label1:Label;
        public var _BattleStage_Label2:Label;
        private var _watch:Boolean = false;
        public var cPetCmd:PetCmdCanvas;
        private var _763304548battlePos11:Localizer;
        public var _BattleStage_BasicGlowButton1:BasicGlowButton;
        public var _BattleStage_BasicGlowButton2:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"bgLayer",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"bgImg",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "alpha":0.6
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"magicCircleImg0"
                    }), new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"cloudLayer"
                    }), new UIComponentDescriptor({
                        "type":BuffCanvas,
                        "id":"cBuff",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":5});
                        }
                    }), new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"backEffectLayer"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "id":"cLayerContainer",
                        "stylesFactory":function ():void
                        {
                            this.disabledOverlayAlpha = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DynamicItemContainer,
                        "id":"cLayer",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":900,
                                "height":570
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"frontEffectLayer"
                    }), new UIComponentDescriptor({
                        "type":SpeakText,
                        "id":"battleInfo",
                        "stylesFactory":function ():void
                        {
                            this.left = "100";
                            this.top = "280";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":413,
                                "height":93,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"localizerContainer",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "0";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":900,
                                "height":570,
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos9",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "184";
                                        this.top = "410";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos7",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "249";
                                        this.top = "347";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos3",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "347";
                                        this.top = "133.6";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "282";
                                        this.top = "187";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos0",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "225";
                                        this.top = "245";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos2",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "168";
                                        this.top = "302";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos4",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "111";
                                        this.top = "359";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos8",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "431";
                                        this.top = "166";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos6",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "364";
                                        this.top = "225";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos5",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "306";
                                        this.top = "283";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos100",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "382";
                                        this.top = "332.9";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos13",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "333";
                                        this.bottom = "42";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos19",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "172";
                                        this.bottom = "301";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos15",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "298";
                                        this.bottom = "190";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos14",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "90";
                                        this.bottom = "268";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos12",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "156";
                                        this.bottom = "213";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos10",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "215";
                                        this.bottom = "154";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos11",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "272";
                                        this.bottom = "102";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos16",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "354";
                                        this.bottom = "136";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos18",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "409";
                                        this.bottom = "86";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos17",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "237";
                                        this.bottom = "247";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Localizer,
                                    "id":"battlePos110",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "369";
                                        this.bottom = "213";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"height":10});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SkillCanvas,
                        "id":"skillCanvas",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"watchCmd",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "solid";
                            this.cornerRadius = 5;
                            this.backgroundColor = 0xFFFFFF;
                            this.backgroundAlpha = 0.3;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":763,
                                "y":10,
                                "width":127,
                                "height":62,
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleStage_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":38,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_BattleStage_BasicGlowButton1",
                                    "events":{"click":"___BattleStage_BasicGlowButton1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42.2,
                                            "y":34,
                                            "styleName":"BtnNormalRed",
                                            "width":45,
                                            "height":20
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"replayCmd",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "solid";
                            this.cornerRadius = 5;
                            this.backgroundColor = 0xFFFFFF;
                            this.backgroundAlpha = 0.3;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":763,
                                "y":10,
                                "width":127,
                                "height":62,
                                "visible":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_BattleStage_Label2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":38,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_BattleStage_BasicGlowButton2",
                                    "events":{"click":"___BattleStage_BasicGlowButton2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":42.2,
                                            "y":34,
                                            "styleName":"BtnNormalRed",
                                            "width":45,
                                            "height":20
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BattleInfoCanvas,
                        "id":"infoPanel",
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    }), new UIComponentDescriptor({
                        "type":TimeCountCanvas,
                        "id":"cTime",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "15";
                            this.bottom = "318";
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        private var _playList:Array = [];
        private var timer:Timer = new Timer(1000);
        private const battleIdFromLeftToRight:Object = {
            "1":[{
                "c":13,
                "p":18
            }, {
                "c":11,
                "p":16
            }, {
                "c":10,
                "p":15
            }, {
                "c":12,
                "p":17
            }, {
                "c":14,
                "p":19
            }],
            "0":[{
                "c":4,
                "p":9
            }, {
                "c":2,
                "p":7
            }, {
                "c":0,
                "p":5
            }, {
                "c":1,
                "p":6
            }, {
                "c":3,
                "p":8
            }]
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        {
            _RELIVE_TEXT_ENUM[_RELIVE_NORMAL] = Language.BATTLESTAGE_S[1];
            _RELIVE_TEXT_ENUM[_RELIVE_FREE] = Language.BATTLESTAGE_S[11];
            _RELIVE_TEXT_ENUM[_RELIVE_WB] = Language.BATTLESTAGE_S[16];
        }

        public function BattleStage()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundAlpha = 0.5;
                this.disabledOverlayAlpha = 0;
            };
            this.percentWidth = 100;
            this.percentHeight = 100;
            _BattleStage_Fade3_i();
            _BattleStage_Fade4_i();
            _BattleStage_Fade1_i();
            _BattleStage_Fade2_i();
            this.addEventListener("creationComplete", ___BattleStage_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            BattleStage._watcherSetupUtil = _arg_1;
        }


        public function callCreatureData(_arg_1:Number, _arg_2:String, _arg_3:String, _arg_4:Boolean):void
        {
            var _local_5:BattleCreatureView = cList[_arg_1];
            if (((_local_5) && (_local_5.gameObject)))
            {
                if (_arg_2)
                {
                    _core.sysMsg(((("怪物 " + _arg_2) + " :") + _local_5.gameObject[_arg_2]));
                };
                if (_arg_3)
                {
                    _core.sysMsg(((("怪物1 " + _arg_3) + " :") + _local_5[_arg_3]));
                };
                _core.sysMsg(("猜猜我在哪: " + _local_5.visible));
                if (_arg_4)
                {
                    _local_5.visible = true;
                };
            }
            else
            {
                if (((_local_5) && (!(_local_5.gameObject))))
                {
                    _core.sysMsg("现象可能2 &&!");
                }
                else
                {
                    _core.sysMsg("现象可能3 !&&!");
                };
            };
        }

        public function set localizerContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._593980680localizerContainer;
            if (_local_2 !== _arg_1)
            {
                this._593980680localizerContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "localizerContainer", _local_2, _arg_1));
            };
        }

        private function setGuestGroupPos():void
        {
            _posDict = {};
            _posDict[0] = battlePos10;
            _posDict[1] = battlePos11;
            _posDict[2] = battlePos12;
            _posDict[3] = battlePos13;
            _posDict[4] = battlePos14;
            _posDict[5] = battlePos15;
            _posDict[6] = battlePos16;
            _posDict[7] = battlePos17;
            _posDict[8] = battlePos18;
            _posDict[9] = battlePos19;
            _posDict[10] = battlePos0;
            _posDict[11] = battlePos1;
            _posDict[12] = battlePos2;
            _posDict[13] = battlePos3;
            _posDict[14] = battlePos4;
            _posDict[15] = battlePos5;
            _posDict[16] = battlePos6;
            _posDict[17] = battlePos7;
            _posDict[18] = battlePos8;
            _posDict[19] = battlePos9;
            _posDict[110] = battlePos110;
            _posDict[100] = battlePos100;
        }

        public function nextActionRound():void
        {
            var _local_3:Object;
            if (isRoundPlayFinish)
            {
                return;
            };
            if (((!(_currentAction == null)) && (_currentAction.delay > 0)))
            {
                setTimeout(nextActionRound, _currentAction.delay);
                _currentAction = null;
                return;
            };
            if (--_actionCount > 0)
            {
                return;
            };
            if (((!(_battleSeq)) || (_battleSeq.length <= 0)))
            {
                if (visible)
                {
                    isRoundPlayFinish = true;
                    checkEnd();
                };
                return;
            };
            var _local_1:Array = _battleSeq.shift();
            _actionCount = _local_1.length;
            while (_actionCount <= 0)
            {
                if (_battleSeq.length <= 0)
                {
                    if (visible)
                    {
                        isRoundPlayFinish = true;
                        checkEnd();
                    };
                    return;
                };
                _local_1 = _battleSeq.shift();
                _actionCount = _local_1.length;
            };
            var _local_2:* = true;
            for each (_local_3 in _local_1)
            {
                _currentAction = _local_3;
                if (_local_3)
                {
                    _local_2 = false;
                    execBehavior(_local_3);
                }
                else
                {
                    _actionCount--;
                };
            };
            resetNormlPlay();
            if (_local_2)
            {
                nextActionRound();
            };
        }

        [Bindable(event="propertyChange")]
        public function get infoPanel():BattleInfoCanvas
        {
            return (this._1217229302infoPanel);
        }

        private function execBehavior(actionObj:Object):void
        {
            var sView:BattleCreatureView;
            var tView:BattleCreatureView;
            var closeHandler:Function;
            var viewSlef:Object;
            var viewBoss:Object;
            var selfCode:Number;
            var bossCode:Number;
            var arr:Array;
            var time:Number;
            if (actionObj.end)
            {
                if (_watch)
                {
                    watchNewRound();
                }
                else
                {
                    if (((actionObj.type) && (actionObj.result == 1)))
                    {
                        closeHandler = function ():void
                        {
                            _core.state = GamePredef.ST_CORE_NORMAL;
                            _core.player.inBattle = false;
                            _core.battle.watchOnEnd();
                        };
                        _core.view.getUI(ViewManager.POP_STAR_BATTLE_REPORT).showResult(closeHandler);
                    }
                    else
                    {
                        _core.state = GamePredef.ST_CORE_NORMAL;
                        _core.player.inBattle = false;
                        if (_isReplay)
                        {
                            _core.remote.call("battleReplayEnd", null);
                            _core.battle.watchOnEnd();
                        }
                        else
                        {
                            _core.remote.call("battlePlayEnd", null);
                            _core.battle.battleOnEnd();
                        };
                    };
                };
                return;
            };
            if (((actionObj.sid) && (Number(actionObj.sid) == 9999999999)))
            {
                this.battleInfo.visible = false;
                if (actionObj.title)
                {
                    viewSlef = getView(10);
                    viewBoss = getView(0);
                    selfCode = ((viewSlef) ? viewSlef.gameObject.iconCode : 3050070000001);
                    bossCode = ((viewBoss) ? viewBoss.gameObject.iconCode : 3060100000001);
                    this.battleInfo.speak(actionObj.title, selfCode, bossCode);
                };
                if (actionObj.title)
                {
                    arr = actionObj.title.split("|");
                    time = 500;
                    if (arr.length > 0)
                    {
                        time = ((arr.length - 1) * 1500);
                    };
                    if (time > 10000)
                    {
                        time = 10000;
                    };
                    setTimeout(loadNewCre, time, actionObj.sSObj);
                }
                else
                {
                    setTimeout(loadNewCre, 500, actionObj.sSObj);
                };
                return;
            };
            sView = cList[actionObj.sid];
            tView = cList[actionObj.tid];
            if (sView != null)
            {
                sView.battleState(actionObj.sSObj, tView);
                sView.battleBehavior(actionObj.bid, tView);
            }
            else
            {
                if (((actionObj.sSObj) && (actionObj.sSObj["skill"])))
                {
                    showSkill(actionObj.sSObj["skill"]);
                };
                nextActionRound();
            };
            if (tView != null)
            {
                tView.battleState(actionObj.tSObj, sView);
            };
            globalBehavior(actionObj, sView, tView);
        }

        [Bindable(event="propertyChange")]
        public function get bgLayer():SimpleCanvas
        {
            return (this._196953076bgLayer);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos110():Localizer
        {
            return (this._2107362836battlePos110);
        }

        private function setWaitIcon():void
        {
            var _local_1:Object;
            var _local_2:Object;
            for (_local_1 in cList)
            {
                _local_2 = cList[_local_1];
                if (((_local_2.gameObject) && (_local_2.gameObject.type == GamePredef.TBL_CHARACTOR)))
                {
                    _local_2.showWaitIcon();
                };
            };
        }

        public function set bgLayer(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._196953076bgLayer;
            if (_local_2 !== _arg_1)
            {
                this._196953076bgLayer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgLayer", _local_2, _arg_1));
            };
        }

        private function _BattleStage_Fade4_i():Fade
        {
            var _local_1:Fade = new Fade();
            fadeOut = _local_1;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 0;
            _local_1.duration = 500;
            return (_local_1);
        }

        public function set battlePos110(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2107362836battlePos110;
            if (_local_2 !== _arg_1)
            {
                this._2107362836battlePos110 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos110", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cloudLayer():UIComponent
        {
            return (this._333275108cloudLayer);
        }

        private function setBattleGroups(_arg_1:Object):void
        {
            var _local_2:*;
            for each (_local_2 in _arg_1.cList)
            {
                if (_local_2.type == GamePredef.TBL_CHARACTOR)
                {
                    setBattleChar(_local_2);
                };
            };
            for each (_local_2 in _arg_1.cList)
            {
                if (_local_2.type == GamePredef.TBL_CREATURE)
                {
                    setBattleCre(_local_2);
                }
                else
                {
                    if (_local_2.type == GamePredef.TBL_PET)
                    {
                        setBattlePet(_local_2);
                    };
                };
            };
            infoPanel.initList(_arg_1);
        }

        private function setBattleChar(_arg_1:Object):void
        {
            var _local_2:Localizer = Localizer(_posDict[_arg_1.battleId]);
            var _local_3:Charactor = _core.getCharactor(_arg_1.id);
            var _local_4:BattleCreatureView = new BattleCreatureView(isAirBattle, _watch);
            _local_4.initBattleView(_local_3, _arg_1, toPoint(_local_2), getDir(_arg_1.battleId), _guestBattle, true);
            addView(_arg_1.battleId, _local_4);
        }

        public function set skillCanvas(_arg_1:SkillCanvas):void
        {
            var _local_2:Object = this._1769958153skillCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1769958153skillCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillCanvas", _local_2, _arg_1));
            };
        }

        public function set cloudLayer(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._333275108cloudLayer;
            if (_local_2 !== _arg_1)
            {
                this._333275108cloudLayer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cloudLayer", _local_2, _arg_1));
            };
        }

        public function startSequence(_arg_1:Array):void
        {
            var _local_2:Array;
            isRoundPlayFinish = false;
            BattleCreatureView.cmdMode = false;
            cPetCmd.hide();
            cPlayerCmd.hide();
            cTime.hide();
            skillCanvas.hide();
            clearWaitIcon();
            battleTargetCanvas.hide();
            if (_watch)
            {
                if (((_playEnd) && (_playList.length <= 0)))
                {
                    _playEnd = false;
                    _battleSeq = _arg_1;
                    nextActionRound();
                    _core.battle.newSeq();
                }
                else
                {
                    _local_2 = _playList.shift();
                    _playList.push(_arg_1);
                    _battleSeq = _local_2;
                    nextActionRound();
                    _core.battle.newSeq();
                };
            }
            else
            {
                _battleSeq = _arg_1;
                nextActionRound();
                _core.battle.newSeq();
            };
        }

        private function setGuestGroupDir(_arg_1:int):void
        {
            if (_arg_1 == 0)
            {
                _dirLower = 1;
                _dirUpper = 5;
            }
            else
            {
                if (_arg_1 > 0)
                {
                    _dirLower = 1;
                    _dirUpper = 1;
                }
                else
                {
                    _dirLower = 5;
                    _dirUpper = 5;
                };
            };
        }

        public function traceState():void
        {
            if (_battleSeq)
            {
                trace("seq len:", _battleSeq.length);
            }
            else
            {
                trace("seq len:", 0);
            };
        }

        private function startNewRound():void
        {
            _core.battle.battleClearCmd();
            setWaitIcon();
            skillCanvas.hide();
            var _local_1:Object = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            _local_1.visible = true;
            clearGlobalEff(frontEffectLayer);
            clearGlobalEff(backEffectLayer);
            if (_playerAlive)
            {
                cTime.show();
                cPlayerCmd.show();
                battleInfoBtn.visible = true;
                cPetCmd.hide();
                _local_1.setAllSkill(2);
                BattleCreatureView.cmdMode = true;
            }
            else
            {
                if (_petAlive)
                {
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_DEFENCE, -1);
                    cPlayerCmd.hide();
                    cTime.show();
                    _local_1.setAllSkill(3);
                    BattleCreatureView.cmdMode = true;
                }
                else
                {
                    _local_1.setAllSkill(3);
                    cPlayerCmd.hide();
                    cPetCmd.hide();
                    cTime.hide();
                    BattleCreatureView.cmdMode = false;
                };
            };
            cBuff.updateRound();
            showTargetCanvas();
            if (cPlayerCmd)
            {
                cPlayerCmd.isEscapeThisRound = false;
            };
        }

        public function endBattleHandler():void
        {
            clearBattleStage();
            showResult();
        }

        [Bindable(event="propertyChange")]
        public function get frontEffectLayer():UIComponent
        {
            return (this._1859910569frontEffectLayer);
        }

        public function setReady(_arg_1:Number):void
        {
            var _local_2:Object = cList[_arg_1];
            if ((((_local_2) && (_local_2.gameObject)) && (_local_2.gameObject.type == GamePredef.TBL_CHARACTOR)))
            {
                _local_2.hideWaitIcon();
            };
        }

        private function showBattleInfo(_arg_1:MouseEvent):void
        {
            infoPanel.changeVisible();
        }

        public function set battlePos0(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587252battlePos0;
            if (_local_2 !== _arg_1)
            {
                this._2053587252battlePos0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos0", _local_2, _arg_1));
            };
        }

        private function _BattleStage_Fade3_i():Fade
        {
            var _local_1:Fade = new Fade();
            fadeIn = _local_1;
            _local_1.alphaFrom = 0;
            _local_1.alphaTo = 1;
            _local_1.duration = 500;
            return (_local_1);
        }

        public function set battlePos3(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587255battlePos3;
            if (_local_2 !== _arg_1)
            {
                this._2053587255battlePos3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos3", _local_2, _arg_1));
            };
        }

        public function set battlePos4(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587256battlePos4;
            if (_local_2 !== _arg_1)
            {
                this._2053587256battlePos4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos4", _local_2, _arg_1));
            };
        }

        public function set battlePos1(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587253battlePos1;
            if (_local_2 !== _arg_1)
            {
                this._2053587253battlePos1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos1", _local_2, _arg_1));
            };
        }

        public function set battlePos5(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587257battlePos5;
            if (_local_2 !== _arg_1)
            {
                this._2053587257battlePos5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos5", _local_2, _arg_1));
            };
        }

        public function set battlePos2(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587254battlePos2;
            if (_local_2 !== _arg_1)
            {
                this._2053587254battlePos2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos2", _local_2, _arg_1));
            };
        }

        private function checkSelf():void
        {
            if (_core.player)
            {
                if (_core.player.currentHp <= 0)
                {
                    _playerAlive = false;
                }
                else
                {
                    _playerAlive = true;
                };
            }
            else
            {
                _playerAlive = false;
            };
        }

        public function set battlePos7(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587259battlePos7;
            if (_local_2 !== _arg_1)
            {
                this._2053587259battlePos7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos7", _local_2, _arg_1));
            };
        }

        public function set battlePos8(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587260battlePos8;
            if (_local_2 !== _arg_1)
            {
                this._2053587260battlePos8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos8", _local_2, _arg_1));
            };
        }

        public function set battlePos9(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587261battlePos9;
            if (_local_2 !== _arg_1)
            {
                this._2053587261battlePos9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos9", _local_2, _arg_1));
            };
        }

        public function set battlePos6(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2053587258battlePos6;
            if (_local_2 !== _arg_1)
            {
                this._2053587258battlePos6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos6", _local_2, _arg_1));
            };
        }

        public function set bgImg(_arg_1:Image):void
        {
            var _local_2:Object = this._93647166bgImg;
            if (_local_2 !== _arg_1)
            {
                this._93647166bgImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImg", _local_2, _arg_1));
            };
        }

        private function _BattleStage_Fade2_i():Fade
        {
            var _local_1:Fade = new Fade();
            stageOut = _local_1;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 0;
            _local_1.duration = 500;
            return (_local_1);
        }

        private function cleanView():void
        {
            var _local_1:Object;
            var _local_2:BattleCreatureView;
            for (_local_1 in cList)
            {
                _local_2 = cList[_local_1];
                if (!_local_2.gameObject)
                {
                    delView(Number(_local_1));
                };
            };
            cLayer.sortChildren();
        }

        private function clearBattleStage():void
        {
            var i:Object;
            var v:Object;
            var p:Charactor;
            clearPanels();
            clearGlobalEff(frontEffectLayer);
            clearGlobalEff(backEffectLayer);
            AreaUtil.clearClouds(cloudLayer);
            cBuff.clearBuff();
            _playerAlive = true;
            _petAlive = true;
            for (i in cList)
            {
                v = cList[i];
                if (((v.gameObject) && (v.gameObject.type == GamePredef.TBL_CHARACTOR)))
                {
                    p = Charactor(v.gameObject);
                    p.inBattle = false;
                    try
                    {
                        p.view = p.normalView;
                        p.posX = p.normalView.posX;
                        p.posY = p.normalView.posY;
                        if (((p.view.doubleFly) && (p.view.weddingFlyer)))
                        {
                            p.view.weddingFlyer.upFlyerPos();
                        };
                    }
                    catch(e)
                    {
                    };
                    v.destroy();
                }
                else
                {
                    v.destroy();
                };
                delete cList[i];
            };
            _playList = [];
            cList = {};
            bgLayer.removeAllChildren();
            cLayer.removeAllChildren();
            if (_core.player)
            {
                _core.player.inBattle = false;
            };
            _core.state = GamePredef.ST_CORE_NORMAL;
        }

        private function loadNewCre(_arg_1:Object):void
        {
            setAIBattleGroups(_arg_1);
            startNewRound();
        }

        public function set magicCircleImg0(_arg_1:Image):void
        {
            var _local_2:Object = this._1089356982magicCircleImg0;
            if (_local_2 !== _arg_1)
            {
                this._1089356982magicCircleImg0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magicCircleImg0", _local_2, _arg_1));
            };
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            var _local_2:Sprite;
            if (timerTarget == 0)
            {
                if (resTime > 0)
                {
                    resTime--;
                    IUITextField(_alert.alertForm.textField).htmlText = (((_RELIVE_TEXT_ENUM[_reliveFlag] + "<font color='#FF0000'>\n(") + Language.BATTLESTAGE_S[10].toString().replace("{resTime}", resTime)) + "</font>");
                }
                else
                {
                    timer.removeEventListener(TimerEvent.TIMER, onTimer);
                    timer.stop();
                    resTime = 20;
                    _local_2 = (_alert.alertForm.buttons[1] as Sprite);
                    _local_2.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                };
            }
            else
            {
                if (timerTarget == 1)
                {
                    if (resTime > 0)
                    {
                        resTime--;
                        IUITextField(_alert.alertForm.textField).htmlText = (((Language.BATTLESTAGE_S[15] + "<font color='#FF0000'>\n(") + Language.BATTLESTAGE_S[10].toString().replace("{resTime}", resTime)) + "</font>");
                    }
                    else
                    {
                        timer.removeEventListener(TimerEvent.TIMER, onTimer);
                        timer.stop();
                        resTime = 20;
                        _local_2 = (_alert.alertForm.buttons[1] as Sprite);
                        _local_2.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                    };
                };
            };
        }

        public function set fadeOut(_arg_1:Fade):void
        {
            var _local_2:Object = this._1091436750fadeOut;
            if (_local_2 !== _arg_1)
            {
                this._1091436750fadeOut = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOut", _local_2, _arg_1));
            };
        }

        private function setHostGroupPos():void
        {
            _posDict = {};
            var _local_1:int;
            while (_local_1 < 20)
            {
                _posDict[_local_1] = this[("battlePos" + _local_1)];
                _local_1++;
            };
            _posDict[100] = battlePos100;
            _posDict[110] = battlePos110;
        }

        private function endBattleStart():void
        {
            var templateId:int;
            var func:Function;
            var barNum:int;
            if (!visible)
            {
                return;
            };
            visible = false;
            _core.playNormal();
            if (_watch)
            {
                UserBarCanvas(_core.view.getUI(ViewManager.MAIN_USER_BAR)).abc.visible = true;
                return;
            };
            if ((((_core.player) && (_core.player.mapData)) && (_core.player.mapData.templateId)))
            {
                templateId = int(_core.player.mapData.templateId);
                if ((((templateId == 2007) || (templateId == 2008)) || (templateId == 2009)))
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        var _local_2:Object = {};
                        if (_arg_1.detail == Alert.YES)
                        {
                            _local_2.recover = true;
                            _core.remote.call("mazeRecover", null, _local_2);
                        }
                        else
                        {
                            _local_2.recover = false;
                            _core.remote.call("mazeRecover", null, _local_2);
                        };
                    };
                    Alert.show(Language.MAZE_INFO_PANEL_U[12].toString(), "", (Alert.YES | Alert.NO), null, func);
                    return;
                };
            };
            if (((_core.player) && (_core.player.currentHp <= 0)))
            {
                _core.remote.call("reliveSwitch", new Responder(onReliveSwitch));
            };
            var userBarCanvas:UserBarCanvas = UserBarCanvas(_core.view.getUI(ViewManager.MAIN_USER_BAR));
            if (userBarCanvas)
            {
                userBarCanvas.abc.setAutoStyle();
                userBarCanvas.abc.visible = true;
                userBarCanvas.currentState = "normal";
                barNum = int(userBarCanvas.barNum.text);
                userBarCanvas[("bar" + barNum)].visible = true;
            };
            if (((((_core.bloodBag[1] > 0) || (_core.bloodBag[2] > 0)) || (_core.bloodBag[3] > 0)) || (_core.bloodBag[4] > 0)))
            {
                _core.remote.useBloodBag();
            };
        }

        public function checkEnd():void
        {
            if (_watch)
            {
                watchNewRound();
                return;
            };
            newRound();
        }

        [Bindable(event="propertyChange")]
        public function get cLayer():DynamicItemContainer
        {
            return (this._1387484498cLayer);
        }

        private function initBattleInfo():void
        {
            infoPanel.init();
        }

        public function set cBuff(_arg_1:BuffCanvas):void
        {
            var _local_2:Object = this._93510486cBuff;
            if (_local_2 !== _arg_1)
            {
                this._93510486cBuff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cBuff", _local_2, _arg_1));
            };
        }

        public function setBattleSpeed(_arg_1:uint):void
        {
            var _local_2:*;
            for each (_local_2 in cList)
            {
                _local_2.speed = int(((9 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / _arg_1));
            };
        }

        public function set frontEffectLayer(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1859910569frontEffectLayer;
            if (_local_2 !== _arg_1)
            {
                this._1859910569frontEffectLayer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "frontEffectLayer", _local_2, _arg_1));
            };
        }

        private function firstRound():void
        {
            cBuff.clearBuff();
            checkPet();
            startNewRound();
            setSneak();
            resetNormlPlay();
        }

        [Bindable(event="propertyChange")]
        public function get stageIn():Fade
        {
            return (this._1897528125stageIn);
        }

        private function _BattleStage_Fade1_i():Fade
        {
            var _local_1:Fade = new Fade();
            stageIn = _local_1;
            _local_1.alphaFrom = 0;
            _local_1.alphaTo = 1;
            _local_1.duration = 500;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get fadeIn():Fade
        {
            return (this._1282133823fadeIn);
        }

        public function quickPlayLastRound():void
        {
            BattleCreatureView.moveSpeedBattle = int(((60 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / GamePredef.GLOBAL_FRAME_RATE));
            nextActionRound();
        }

        [Bindable(event="propertyChange")]
        public function get backEffectLayer():UIComponent
        {
            return (this._877517529backEffectLayer);
        }

        public function set stageOut(_arg_1:Fade):void
        {
            var _local_2:Object = this._1306176368stageOut;
            if (_local_2 !== _arg_1)
            {
                this._1306176368stageOut = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stageOut", _local_2, _arg_1));
            };
        }

        private function addView(_arg_1:Number, _arg_2:BattleCreatureView):void
        {
            cList[_arg_1] = _arg_2;
            cLayer.addChild(_arg_2);
        }

        private function setHostGroupDir(_arg_1:int):void
        {
            if (_arg_1 == 0)
            {
                _dirLower = 5;
                _dirUpper = 1;
            }
            else
            {
                if (_arg_1 > 0)
                {
                    _dirLower = 5;
                    _dirUpper = 5;
                }
                else
                {
                    _dirLower = 1;
                    _dirUpper = 1;
                };
            };
        }

        public function ___BattleStage_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            quitReplay();
        }

        public function ___BattleStage_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        private function swapView(_arg_1:BattleCreatureView, _arg_2:BattleCreatureView):void
        {
            addView(_arg_1.gameObject.battleId, _arg_2);
            addView(_arg_2.gameObject.battleId, _arg_1);
            var _local_3:int = _arg_1.gameObject.battleId;
            _arg_1.gameObject.battleId = _arg_2.gameObject.battleId;
            _arg_2.gameObject.battleId = _local_3;
        }

        private function checkClient():void
        {
            var _local_2:Object;
            var _local_3:BattleCreatureView;
            var _local_1:Boolean = true;
            for (_local_2 in cList)
            {
                _local_3 = BattleCreatureView(cList[_local_2]);
                if ((((_local_3.leftSide) && (_local_3.visible)) && (_local_3.hp > 0)))
                {
                    _local_1 = false;
                    break;
                };
            };
            if (_local_1)
            {
                endBattle();
            };
        }

        private function resetNormlPlay():void
        {
            BattleCreatureView.moveSpeedBattle = int(((50 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / GamePredef.GLOBAL_FRAME_RATE));
        }

        private function checkPet():void
        {
            _petAlive = false;
            var _local_1:BattleCreatureView = BattleCreatureView(_core.battle.battleGetPlayerPet(cList));
            if (_local_1)
            {
                if (_local_1.isDead())
                {
                    _petAlive = false;
                }
                else
                {
                    _petAlive = true;
                };
            }
            else
            {
                _petAlive = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get localizerContainer():Canvas
        {
            return (this._593980680localizerContainer);
        }

        public function set cLayerContainer(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1238309517cLayerContainer;
            if (_local_2 !== _arg_1)
            {
                this._1238309517cLayerContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cLayerContainer", _local_2, _arg_1));
            };
        }

        private function setBattlePet(_arg_1:Object):void
        {
            var _local_5:int;
            var _local_2:Localizer = Localizer(_posDict[_arg_1.battleId]);
            var _local_3:Pet = _core.createPet(_arg_1);
            if (isAirBattle)
            {
                if ((_arg_1.battleId % 10) < 5)
                {
                    _local_5 = (_arg_1.battleId + 5);
                }
                else
                {
                    _local_5 = (_arg_1.battleId - 5);
                };
                if (cList[_local_5])
                {
                };
            };
            var _local_4:BattleCreatureView = new BattleCreatureView(isAirBattle, _watch);
            _local_4.initBattleView(_local_3, _arg_1, toPoint(_local_2), getDir(_arg_1.battleId), _guestBattle, true);
            addView(_arg_1.battleId, _local_4);
        }

        [Bindable(event="propertyChange")]
        public function get skillCanvas():SkillCanvas
        {
            return (this._1769958153skillCanvas);
        }

        private function clearWaitIcon():void
        {
            var _local_1:Object;
            var _local_2:Object;
            for (_local_1 in cList)
            {
                _local_2 = cList[_local_1];
                if (((_local_2.gameObject) && (_local_2.gameObject.type == GamePredef.TBL_CHARACTOR)))
                {
                    _local_2.hideWaitIcon();
                };
            };
        }

        private function turnBack():void
        {
            var _local_1:Object;
            var _local_2:BattleCreatureView;
            for (_local_1 in cList)
            {
                _local_2 = cList[_local_1];
                if (_local_2)
                {
                    _local_2.turnBack();
                };
            };
        }

        public function get watchMode():Boolean
        {
            return (_watch);
        }

        public function set battleInfo(_arg_1:SpeakText):void
        {
            var _local_2:Object = this._2053377414battleInfo;
            if (_local_2 !== _arg_1)
            {
                this._2053377414battleInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleInfo", _local_2, _arg_1));
            };
        }

        public function frontEffect(_arg_1:Number):void
        {
            globalEffect(_arg_1, frontEffectLayer);
        }

        private function setAIBattleCre(_arg_1:Object):void
        {
            delView(_arg_1.battleId);
            var _local_2:Localizer = Localizer(_posDict[_arg_1.battleId]);
            var _local_3:Creature = _core.createCreature(_arg_1);
            var _local_4:BattleCreatureView = new BattleCreatureView(isAirBattle, _watch);
            _local_4.initBattleView(_local_3, _arg_1, toPoint(_local_2), getDir(_arg_1.battleId), _guestBattle, true);
            addView(_arg_1.battleId, _local_4);
        }

        public function quitReplay():void
        {
            trace("退出观看战斗录像-------------------------------");
            _core.remote.battleReplayEnd();
            _core.battle.watchOnEnd();
        }

        private function checkEndHandler(_arg_1:Object):void
        {
            if (!visible)
            {
                return;
            };
            _checkRemote = false;
            switch (_arg_1)
            {
                case GamePredef.BATTLE_WIN:
                    _core.state = GamePredef.ST_CORE_NORMAL;
                    _core.player.inBattle = false;
                    _core.battle.battleOnEnd();
                    return;
                case GamePredef.BATTLE_LOSE:
                    _core.state = GamePredef.ST_CORE_NORMAL;
                    _core.player.inBattle = false;
                    _core.battle.battleOnEnd();
                    return;
                case GamePredef.BATTLE_NOT_END:
                    newRound();
                    return;
            };
        }

        private function getView(_arg_1:Number):BattleCreatureView
        {
            return (cList[_arg_1]);
        }

        private function globalEffect(_arg_1:Number, _arg_2:UIComponent):void
        {
            var _local_3:Loader;
            clearGlobalEff(_arg_2);
            if (((_arg_1 > 0) && (CreatureView.LOAD_EFFECT)))
            {
                _local_3 = new Loader();
                _local_3.load(new URLRequest(ResManager.getResUrl(_arg_1)));
                if (isAirBattle)
                {
                    _local_3.y = -(GamePredef.FLIGHT_HEIGHT);
                };
                _arg_2.addChild(_local_3);
            };
        }

        public function get petActive():Boolean
        {
            return (_petAlive);
        }

        public function startAuto():void
        {
            _auto.startAuto();
        }

        private function onReliveSwitch(result:int):void
        {
            var func:Function;
            var bbAlert:Alert;
            var bbTime:int;
            var bbGold:int;
            var goldBBRelive:Function;
            var onBBTimerHandler:Function;
            var onBBTimerComplete:Function;
            var bbTimer:Timer;
            if (((_core.player) && (_core.player.posMapId == 78)))
            {
                return;
            };
            if (result)
            {
                if (result == 3)
                {
                    bbTime = 30;
                    bbGold = 6;
                    goldBBRelive = function (_arg_1:CloseEvent):*
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            if (_core.player.gold < bbGold)
                            {
                                Alert.show("金子不足");
                            }
                            else
                            {
                                bbTimer.stop();
                                bbAlert = null;
                                _core.remote.call("bbGoldRelive", null, bbGold);
                            };
                        }
                        else
                        {
                            if (_arg_1.detail == Alert.CANCEL)
                            {
                            };
                        };
                    };
                    onBBTimerHandler = function (_arg_1:TimerEvent):*
                    {
                        bbTime--;
                        bbGold = ((bbTime / 5) + 1);
                        IUITextField(bbAlert.alertForm.textField).htmlText = Language.BATTLESTAGE_S[23].toString().replace("{time}", bbTime).replace("{gold}", bbGold);
                    };
                    onBBTimerComplete = function (_arg_1:TimerEvent):*
                    {
                        bbTimer.stop();
                        bbAlert.visible = false;
                        bbAlert = null;
                        _core.remote.call("bbNormalRelive", null);
                    };
                    bbTimer = new Timer(1000, 30);
                    bbTimer.addEventListener(TimerEvent.TIMER, onBBTimerHandler);
                    bbTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onBBTimerComplete);
                    bbTimer.start();
                    bbAlert = Alert.show("您已经死亡\n点击确定使用6金子立即复活.\n点击'取消'将在30秒后传送到安全区", "", (Alert.YES | Alert.CANCEL), null, goldBBRelive);
                    IUITextField(bbAlert.alertForm.textField).htmlText = Language.BATTLESTAGE_S[23].toString().replace("{time}", bbTime).replace("{gold}", bbGold);
                    return;
                };
                if (result == 2)
                {
                    if ((((_core.player) && (_core.player.posMapId)) && (Number(_core.player.posMapId) == 73)))
                    {
                        return;
                    };
                };
                _reliveFlag = result;
                func = function (event:CloseEvent):void
                {
                    var func1:Function;
                    Alert.cancelLabel = Language.GAMEPREDEF_S[2];
                    timer.stop();
                    resTime = 20;
                    timer.removeEventListener(TimerEvent.TIMER, onTimer);
                    if (((_core.player.currentHp > 0) && (((!(_core.player.inGroup)) || (_core.player.isLeader)) || (_core.player.groupAfk))))
                    {
                        _core.player.walkable = true;
                        return;
                    };
                    if (event.detail == Alert.CANCEL)
                    {
                        if (((_RELIVE_FREE == _reliveFlag) || (_RELIVE_WB == _reliveFlag)))
                        {
                            _core.remote.freeRelive(2);
                        }
                        else
                        {
                            _core.remote.toSafe();
                        };
                    }
                    else
                    {
                        if (((_RELIVE_FREE == _reliveFlag) || (_RELIVE_WB == _reliveFlag)))
                        {
                            _core.remote.freeRelive(1);
                        }
                        else
                        {
                            if (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_STAND_IN_BABY) < 1)
                            {
                                func1 = function (_arg_1:CloseEvent):void
                                {
                                    timer.stop();
                                    resTime = 20;
                                    timer.removeEventListener(TimerEvent.TIMER, onTimer);
                                    if (_arg_1.detail == Alert.NO)
                                    {
                                        _core.remote.toSafe();
                                    }
                                    else
                                    {
                                        _core.remote.reliveUseItem();
                                    };
                                };
                                timer.addEventListener(TimerEvent.TIMER, onTimer);
                                timerTarget = 1;
                                timer.start();
                                _alert = Alert.show(((Language.BATTLESTAGE_S[15] + "\n(") + Language.BATTLESTAGE_S[10].toString().replace("{resTime}", resTime)), "", (Alert.YES | Alert.NO), null, func1);
                                IUITextField(_alert.alertForm.textField).htmlText = (((Language.BATTLESTAGE_S[15] + "<font color='#FF0000'>\n(") + Language.BATTLESTAGE_S[10].toString().replace("{resTime}", resTime)) + "</font>");
                            }
                            else
                            {
                                _core.remote.reliveUseItem();
                            };
                        };
                    };
                };
                Alert.cancelLabel = Language.BATTLESTAGE_S[9].toString();
                timer.addEventListener(TimerEvent.TIMER, onTimer);
                timerTarget = 0;
                timer.start();
                _alert = Alert.show(((_RELIVE_TEXT_ENUM[_reliveFlag] + "\n(") + Language.BATTLESTAGE_S[10].toString().replace("{resTime}", resTime)), "", (Alert.OK | Alert.CANCEL), null, func, null, Alert.CANCEL);
                IUITextField(_alert.alertForm.textField).htmlText = (((_RELIVE_TEXT_ENUM[_reliveFlag] + "<font color='#FF0000'>\n(") + Language.BATTLESTAGE_S[10].toString().replace("{resTime}", resTime)) + "</font>");
                Alert.cancelLabel = Language.GAMEPREDEF_S[2];
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos0():Localizer
        {
            return (this._2053587252battlePos0);
        }

        private function globalBehavior(actionObj:Object, sv:BattleCreatureView, tv:BattleCreatureView):void
        {
            var i:String;
            var buffId:* = undefined;
            switch (actionObj.bid)
            {
                case BattleCreatureView.BH_POSITION:
                    swapView(sv, tv);
                    break;
                case BattleCreatureView.BH_SUMMON:
                    switch (actionObj.type)
                    {
                        case 0:
                            setBattlePet(actionObj.pet);
                            break;
                        case 1:
                            setBattleCre(actionObj.pet);
                            break;
                        case 2:
                            for (i in actionObj.creList)
                            {
                                setBattleCre(actionObj.creList[i]);
                            };
                            break;
                    };
                    break;
            };
            var isArray:* = function (_arg_1:*):Boolean
            {
                var _local_3:*;
                var _local_2:int;
                for (_local_3 in _arg_1)
                {
                    _local_2++;
                };
                if (0 == _local_2)
                {
                    return (false);
                };
                return (true);
            };
            if (((actionObj.sid == _core.player.battleId) && (actionObj.sSObj)))
            {
                if (actionObj.sSObj[GamePredef.BS_BUFF_DEL])
                {
                    if (isArray(actionObj.sSObj.buffDel))
                    {
                        for (buffId in actionObj.sSObj.buffDel)
                        {
                            cBuff.delBuff(actionObj.sSObj.buffDel[buffId]);
                        };
                    }
                    else
                    {
                        cBuff.delBuff(actionObj.sSObj.buffDel);
                    };
                };
                if (actionObj.sSObj[GamePredef.BS_BUFF_COL_DEL])
                {
                    for (buffId in actionObj.sSObj[GamePredef.BS_BUFF_COL_DEL])
                    {
                        cBuff.delBuff(actionObj.sSObj[GamePredef.BS_BUFF_COL_DEL][buffId]);
                    };
                };
                if (actionObj.sSObj[GamePredef.BS_BUFF_ADD])
                {
                    cBuff.addBuff(actionObj.sSObj.buffAdd);
                };
                if (actionObj.sSObj[GamePredef.BS_BUFF_CLEAR])
                {
                    cBuff.clearBuff();
                };
            };
        }

        public function set battlePos11(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304548battlePos11;
            if (_local_2 !== _arg_1)
            {
                this._763304548battlePos11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos5():Localizer
        {
            return (this._2053587257battlePos5);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos7():Localizer
        {
            return (this._2053587259battlePos7);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos1():Localizer
        {
            return (this._2053587253battlePos1);
        }

        public function set battlePos10(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304549battlePos10;
            if (_local_2 !== _arg_1)
            {
                this._763304549battlePos10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos10", _local_2, _arg_1));
            };
        }

        public function set battlePos14(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304545battlePos14;
            if (_local_2 !== _arg_1)
            {
                this._763304545battlePos14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos4():Localizer
        {
            return (this._2053587256battlePos4);
        }

        public function set battlePos15(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304544battlePos15;
            if (_local_2 !== _arg_1)
            {
                this._763304544battlePos15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos15", _local_2, _arg_1));
            };
        }

        public function set battlePos12(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304547battlePos12;
            if (_local_2 !== _arg_1)
            {
                this._763304547battlePos12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos12", _local_2, _arg_1));
            };
        }

        public function set battlePos17(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304542battlePos17;
            if (_local_2 !== _arg_1)
            {
                this._763304542battlePos17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos17", _local_2, _arg_1));
            };
        }

        public function set battlePos18(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304541battlePos18;
            if (_local_2 !== _arg_1)
            {
                this._763304541battlePos18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos18", _local_2, _arg_1));
            };
        }

        private function set resTime(_arg_1:int):void
        {
            var _local_2:Object = this._1096560525resTime;
            if (_local_2 !== _arg_1)
            {
                this._1096560525resTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resTime", _local_2, _arg_1));
            };
        }

        public function set battlePos19(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304540battlePos19;
            if (_local_2 !== _arg_1)
            {
                this._763304540battlePos19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos19", _local_2, _arg_1));
            };
        }

        public function set battlePos16(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304543battlePos16;
            if (_local_2 !== _arg_1)
            {
                this._763304543battlePos16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos16", _local_2, _arg_1));
            };
        }

        public function set battlePos13(_arg_1:Localizer):void
        {
            var _local_2:Object = this._763304546battlePos13;
            if (_local_2 !== _arg_1)
            {
                this._763304546battlePos13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bgImg():Image
        {
            return (this._93647166bgImg);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos2():Localizer
        {
            return (this._2053587254battlePos2);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos3():Localizer
        {
            return (this._2053587255battlePos3);
        }

        private function delView(_arg_1:Number):void
        {
            delete cList[_arg_1];
        }

        [Bindable(event="propertyChange")]
        public function get battlePos9():Localizer
        {
            return (this._2053587261battlePos9);
        }

        [Bindable(event="propertyChange")]
        public function get cBuff():BuffCanvas
        {
            return (this._93510486cBuff);
        }

        private function getDir(_arg_1:int):int
        {
            if (_arg_1 > 9)
            {
                return (_dirLower);
            };
            return (_dirUpper);
        }

        public function showSkill(_arg_1:String):void
        {
            if (skillCanvas)
            {
                skillCanvas.flash(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos6():Localizer
        {
            return (this._2053587258battlePos6);
        }

        public function backEffect(_arg_1:Number):void
        {
            globalEffect(_arg_1, backEffectLayer);
        }

        public function set cLayer(_arg_1:DynamicItemContainer):void
        {
            var _local_2:Object = this._1387484498cLayer;
            if (_local_2 !== _arg_1)
            {
                this._1387484498cLayer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cLayer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos8():Localizer
        {
            return (this._2053587260battlePos8);
        }

        [Bindable(event="propertyChange")]
        public function get fadeOut():Fade
        {
            return (this._1091436750fadeOut);
        }

        [Bindable(event="propertyChange")]
        public function get magicCircleImg0():Image
        {
            return (this._1089356982magicCircleImg0);
        }

        [Bindable(event="propertyChange")]
        public function get stageOut():Fade
        {
            return (this._1306176368stageOut);
        }

        public function endBattle():void
        {
            endBattleStart();
            endBattleHandler();
        }

        private function clearGlobalEff(_arg_1:UIComponent):void
        {
            while (_arg_1.numChildren > 0)
            {
                _arg_1.removeChildAt(0);
            };
        }

        public function showResult():void
        {
            var _local_1:* = "";
            if (expBattle > 0)
            {
                _local_1 = Language.BATTLESTAGE_S[5].toString().replace("{expBattle}", expBattle);
                _core.sysBlueMsg(_local_1);
            }
            else
            {
                if (expBattle < 0)
                {
                    _local_1 = Language.BATTLESTAGE_S[6].toString().replace("{expBattle}", Math.abs(expBattle));
                    _core.sysBlueMsg(_local_1);
                };
            };
            var _local_2:* = "";
            if (rep > 0)
            {
                _local_2 = Language.BATTLESTAGE_S[7].toString().replace("{rep}", rep);
                _core.sysBlueMsg(_local_2);
            }
            else
            {
                if (rep < 0)
                {
                    _local_2 = Language.BATTLESTAGE_S[8].toString().replace("{rep}", Math.abs(rep));
                    _core.sysBlueMsg(_local_2);
                };
            };
            exp = 0;
            expBattle = 0;
            rep = 0;
        }

        [Bindable(event="propertyChange")]
        public function get cLayerContainer():SimpleCanvas
        {
            return (this._1238309517cLayerContainer);
        }

        public function set fadeIn(_arg_1:Fade):void
        {
            var _local_2:Object = this._1282133823fadeIn;
            if (_local_2 !== _arg_1)
            {
                this._1282133823fadeIn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeIn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battleInfo():SpeakText
        {
            return (this._2053377414battleInfo);
        }

        private function _BattleStage_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.BATTLESTAGE_S[0];
            _local_1 = Language.BATTLESTAGE_U[0];
            _local_1 = Language.BATTLESTAGE_S[0];
            _local_1 = Language.BATTLESTAGE_U[0];
        }

        [Bindable(event="propertyChange")]
        private function get resTime():int
        {
            return (this._1096560525resTime);
        }

        public function set stageIn(_arg_1:Fade):void
        {
            var _local_2:Object = this._1897528125stageIn;
            if (_local_2 !== _arg_1)
            {
                this._1897528125stageIn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stageIn", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:BattleStage;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _BattleStage_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_BattleStageWatcherSetupUtil");
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
        public function get battlePos10():Localizer
        {
            return (this._763304549battlePos10);
        }

        private function clearPanels():void
        {
            if (cPetCmd)
            {
                cPetCmd.hide();
            };
            if (cPlayerCmd)
            {
                cPlayerCmd.hide();
            };
            if (battleInfoBtn)
            {
                battleInfoBtn.visible = false;
            };
            if (infoPanel)
            {
                infoPanel.visible = false;
            };
            initBattleInfo();
            if (cTime)
            {
                cTime.hide();
            };
            if (skillCanvas)
            {
                skillCanvas.hide();
            };
            if (battleTargetCanvas)
            {
                battleTargetCanvas.clearView();
                battleTargetCanvas.hide();
            };
        }

        private function _BattleStage_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleStage_Label1.text = _arg_1;
            }, "_BattleStage_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleStage_BasicGlowButton1.label = _arg_1;
            }, "_BattleStage_BasicGlowButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleStage_Label2.text = _arg_1;
            }, "_BattleStage_Label2.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BATTLESTAGE_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _BattleStage_BasicGlowButton2.label = _arg_1;
            }, "_BattleStage_BasicGlowButton2.label");
            result[3] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos17():Localizer
        {
            return (this._763304542battlePos17);
        }

        public function getCharactorBuff():ArrayCollection
        {
            return (cBuff.getCharactorBuff());
        }

        [Bindable(event="propertyChange")]
        public function get battlePos12():Localizer
        {
            return (this._763304547battlePos12);
        }

        public function ___BattleStage_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            quitWatch();
        }

        [Bindable(event="propertyChange")]
        public function get battlePos11():Localizer
        {
            return (this._763304548battlePos11);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos14():Localizer
        {
            return (this._763304545battlePos14);
        }

        private function drawBackGround(boss:Boolean):void
        {
            var ctf:ColorTransform;
            var map:StageMain;
            var bd:BitmapData;
            var img:Bitmap;
            var uic:UIComponent;
            try
            {
                if (boss)
                {
                    ctf = GamePredef.BATTLE_STAGE_COLOR_BOSS;
                }
                else
                {
                    ctf = GamePredef.BATTLE_STAGE_COLOR_NORMAL;
                };
                map = StageMain(_core.view.getUI(ViewManager.STAGE_MAIN));
                bd = new BitmapData(stage.stageWidth, stage.stageHeight);
                img = new Bitmap(bd);
                uic = new UIComponent();
                bd.draw(map.mapCanvas, new Matrix(1, 0, 0, 1, map.x, map.y), ctf, null, new Rectangle(0, 0, bd.width, bd.height));
                uic.addChild(img);
                bgLayer.addChild(uic);
            }
            catch(e)
            {
                trace("battle draw bmp error");
            };
            _core.view.hide(ViewManager.STAGE_MAIN);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos19():Localizer
        {
            return (this._763304540battlePos19);
        }

        public function set replayCmd(_arg_1:Canvas):void
        {
            var _local_2:Object = this._454794285replayCmd;
            if (_local_2 !== _arg_1)
            {
                this._454794285replayCmd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "replayCmd", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos13():Localizer
        {
            return (this._763304546battlePos13);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos15():Localizer
        {
            return (this._763304544battlePos15);
        }

        public function set backEffectLayer(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._877517529backEffectLayer;
            if (_local_2 !== _arg_1)
            {
                this._877517529backEffectLayer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backEffectLayer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battlePos18():Localizer
        {
            return (this._763304541battlePos18);
        }

        private function watchNewRound():void
        {
            var _local_1:Array;
            if (_playList.length <= 0)
            {
                _playEnd = true;
            }
            else
            {
                _local_1 = _playList.shift();
                _battleSeq = _local_1;
                nextActionRound();
                _core.battle.newSeq();
            };
        }

        public function quitWatch():void
        {
            _core.remote.quitWatch();
            _core.battle.watchOnEnd();
        }

        public function startBattle(_arg_1:Object, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            _watch = _arg_2;
            _isReplay = _arg_3;
            BattleCreatureView.cmdMode = false;
            UserBarCanvas(_core.view.getUI(ViewManager.MAIN_USER_BAR)).abc.visible = false;
            cPlayerCmd = PlayerCmdCanvas(_core.view.getUI(ViewManager.MAIN_BATTLE_PLAYER));
            if (cPlayerCmd)
            {
                cPlayerCmd.isEscapeThisRound = false;
            };
            cPetCmd = PetCmdCanvas(_core.view.getUI(ViewManager.MAIN_BATTLE_PET));
            if (!battleInfoBtn)
            {
                battleInfoBtn = new BasicGlowButton();
                battleInfoBtn.label = Language.BATTLESTAGE_S[17];
                battleInfoBtn.addEventListener(MouseEvent.CLICK, showBattleInfo);
                battleInfoBtn.styleName = "CrystalBlueButton";
                battleInfoBtn.visible = false;
                battleInfoBtn.width = 73;
                cTime.parent.addChildAt(battleInfoBtn, (cTime.parent.getChildIndex(cTime) - 1));
                battleInfoBtn.y = ((cPetCmd.y + cPetCmd.height) + 5);
                battleInfoBtn.x = (cPetCmd.x + 5);
            };
            battleInfoBtn.visible = true;
            if (((_arg_2) || (_arg_3)))
            {
                battleInfoBtn.enabled = false;
            }
            else
            {
                battleInfoBtn.enabled = true;
            };
            battleTargetCanvas = BattleTargetCanvas(_core.view.getUI(ViewManager.MAIN_TARGET_SELECT).targetCanvas);
            battleTargetCanvas.clearView();
            stageOut.stop();
            stageIn.stop();
            var _local_4:* = _core.view.getUI(ViewManager.PANEL_MAZE_INFO);
            if (((_local_4) && (_local_4.visible)))
            {
                _local_4.visible = false;
            };
            var _local_5:* = _core.view.getUI(ViewManager.PANEL_BLOODY_BATTLE_INFO);
            if (((_local_5) && (_local_5.visible)))
            {
                _local_5.visible = false;
            };
            var _local_6:* = _core.view.getUI(ViewManager.PANEL_TRIPLE_TURN);
            if (((_local_6) && (_local_6.visible)))
            {
                _local_6.visible = false;
            };
            if (visible)
            {
                clearBattleStage();
            }
            else
            {
                clearPanels();
                visible = true;
            };
            if (_arg_1.warMap)
            {
                bgImg.source = ResManager.hash(GamePredef.RES_STARRY_SKY);
                bgImg.alpha = 1;
            }
            else
            {
                bgImg.alpha = 0.6;
                bgImg.source = ResManager.hash(GamePredef.DEFAULT_IMG_BATTLE);
            };
            if (_arg_1.magicCircle)
            {
                if (_arg_1.magicCircle[0])
                {
                    magicCircleImg0.x = (this.x + ((Number(this.width) - Number(900)) / 2));
                    magicCircleImg0.y = (this.y + ((Number(this.height) - Number(570)) / 2));
                    magicCircleImg0.source = ResManager.getIconUrl(parseInt(_arg_1.magicCircle[0]));
                };
            }
            else
            {
                magicCircleImg0.source = null;
            };
            boss = _arg_1.bossFlag;
            isAirBattle = _arg_1.airBattle;
            drawBackGround(_arg_1.bossFlag);
            if (isAirBattle)
            {
                AreaUtil.drawClouds(cloudLayer, 100000, this.width, this.height, -150, -100, -300, -150);
            };
            if (((_alert) && (_alert.parent)))
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            _guestBattle = _arg_1.guest;
            _auto = _core.view.getUI(ViewManager.PANEL_BATTLEAUTO);
            if (_guestBattle)
            {
                setGuestGroupPos();
                setGuestGroupDir(_arg_1.sneakFlag);
            }
            else
            {
                setHostGroupPos();
                setHostGroupDir(_arg_1.sneakFlag);
            };
            cList = {};
            exp = 0;
            expBattle = 0;
            rep = 0;
            cLayer.addEventListener(Creature.EVENT_BAHAVIOR_END, nextActionRound);
            setBattleGroups(_arg_1);
            cBuff.clearBuff();
            cLayer.sortChildren();
            _checkRemote = false;
            showTargetCanvas();
            _core.playBattle();
            _sneak = _arg_1.sneakFlag;
            if (_watch)
            {
                watchCmd.visible = true;
            }
            else
            {
                if (GamePredef.GLOBAL_SETTING.battleStExpan)
                {
                    UserBarCanvas(_core.view.getUI(ViewManager.MAIN_USER_BAR)).currentState = "battle";
                };
                watchCmd.visible = false;
                _core.player.inBattle = true;
                _core.state = GamePredef.ST_CORE_BATTLE;
                skillCanvas.flash(Language.BATTLESTAGE_S[2]);
                setTimeout(firstRound, START_DELAY);
                if (((_auto.auto) && (!(_arg_3))))
                {
                    _auto.visible = true;
                }
                else
                {
                    _auto.visible = false;
                };
            };
            if (_arg_3)
            {
                replayCmd.visible = true;
            }
            else
            {
                replayCmd.visible = false;
            };
            _core.gc();
        }

        public function set cTime(_arg_1:TimeCountCanvas):void
        {
            var _local_2:Object = this._94035408cTime;
            if (_local_2 !== _arg_1)
            {
                this._94035408cTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cTime", _local_2, _arg_1));
            };
        }

        private function setBattleCre(_arg_1:Object):void
        {
            if ((((_arg_1) && (_arg_1.battleId)) && (checkView(_arg_1.battleId))))
            {
                delView(_arg_1.battleId);
            };
            var _local_2:Localizer = Localizer(_posDict[_arg_1.battleId]);
            var _local_3:Creature = _core.createCreature(_arg_1);
            var _local_4:BattleCreatureView = new BattleCreatureView(isAirBattle, _watch);
            _local_4.initBattleView(_local_3, _arg_1, toPoint(_local_2), getDir(_arg_1.battleId), _guestBattle, true);
            addView(_arg_1.battleId, _local_4);
        }

        public function set useModel(_arg_1:Boolean):void
        {
            CreatureView.LOAD_MODEL = _arg_1;
        }

        private function checkView(_arg_1:Number):Boolean
        {
            if (((cList) && (cList[_arg_1])))
            {
                return (true);
            };
            return (false);
        }

        private function newRound():void
        {
            cleanView();
            checkSelf();
            checkPet();
            startNewRound();
            turnBack();
            _core.battle.newRound();
        }

        private function setSneak():void
        {
            if (_sneak == -1)
            {
                BattleCreatureView.cmdMode = false;
                cTime.visible = false;
                cPlayerCmd.visible = false;
                cTime.timeLeft = 2;
                skillCanvas.text = Language.BATTLESTAGE_S[3];
            }
            else
            {
                if (_sneak == 1)
                {
                    skillCanvas.text = Language.BATTLESTAGE_S[4];
                };
            };
        }

        private function initView():void
        {
            removeChild(localizerContainer);
            bgImg.source = ResManager.hash(GamePredef.DEFAULT_IMG_BATTLE);
            addEventListener(MouseEvent.MOUSE_DOWN, linkHandler);
            backEffectLayer.x = ((GamePredef.APP_WIDTH - GamePredef.APP_WIDTH_OLD) / 2);
            backEffectLayer.y = ((GamePredef.APP_HEIGHT - GamePredef.APP_HEIGHT_OLD) / 2);
            frontEffectLayer.x = ((GamePredef.APP_WIDTH - GamePredef.APP_WIDTH_OLD) / 2);
            frontEffectLayer.y = ((GamePredef.APP_HEIGHT - GamePredef.APP_HEIGHT_OLD) / 2);
            infoPanel.x = ((infoPanel.stage.width - infoPanel.width) >> 1);
            infoPanel.y = ((infoPanel.stage.height - infoPanel.height) >> 1);
        }

        [Bindable(event="propertyChange")]
        public function get cTime():TimeCountCanvas
        {
            return (this._94035408cTime);
        }

        public function setAIBattleGroups(_arg_1:Object):void
        {
            var _local_2:*;
            for each (_local_2 in _arg_1)
            {
                if (_local_2.type == GamePredef.TBL_CREATURE)
                {
                    setAIBattleCre(_local_2);
                };
            };
        }

        private function showTargetCanvas():void
        {
            var _local_3:Number;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:String;
            var _local_1:Object = {};
            var _local_2:int;
            while (_local_2 <= 1)
            {
                _local_3 = ((_guestBattle) ? (_local_2 ^ 0x01) : _local_2);
                for (_local_4 in battleIdFromLeftToRight[_local_2])
                {
                    _local_5 = battleIdFromLeftToRight[_local_2][_local_4];
                    _local_6 = {};
                    for (_local_7 in _local_5)
                    {
                        if (cList[_local_5[_local_7]])
                        {
                            _local_6[_local_7] = cList[_local_5[_local_7]];
                        };
                    };
                    _local_1[((_local_3 * 10) + Number(_local_4))] = _local_6;
                };
                _local_2++;
            };
            battleTargetCanvas.showData = _local_1;
        }

        [Bindable(event="propertyChange")]
        public function get battlePos16():Localizer
        {
            return (this._763304543battlePos16);
        }

        [Bindable(event="propertyChange")]
        public function get replayCmd():Canvas
        {
            return (this._454794285replayCmd);
        }

        private function toPoint(_arg_1:Object):Point
        {
            if (isAirBattle)
            {
                return (new Point(_arg_1.x, (_arg_1.y + GamePredef.FLIGHT_HEIGHT)));
            };
            return (new Point(_arg_1.x, _arg_1.y));
        }

        public function set watchCmd(_arg_1:Canvas):void
        {
            var _local_2:Object = this._545119723watchCmd;
            if (_local_2 !== _arg_1)
            {
                this._545119723watchCmd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "watchCmd", _local_2, _arg_1));
            };
        }

        private function linkHandler(_arg_1:MouseEvent):void
        {
            var _local_2:ChatCanvas = (_core.view.getUI(ViewManager.MAIN_CHAT) as ChatCanvas);
            if (_local_2.checkPoint(_arg_1.stageX, _arg_1.stageY))
            {
                _arg_1.stopImmediatePropagation();
            };
        }

        public function set battlePos100(_arg_1:Localizer):void
        {
            var _local_2:Object = this._2107362805battlePos100;
            if (_local_2 !== _arg_1)
            {
                this._2107362805battlePos100 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battlePos100", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get watchCmd():Canvas
        {
            return (this._545119723watchCmd);
        }

        [Bindable(event="propertyChange")]
        public function get battlePos100():Localizer
        {
            return (this._2107362805battlePos100);
        }

        private function forceEnd():void
        {
            if (_checkRemote)
            {
                endBattle();
            };
        }

        public function set infoPanel(_arg_1:BattleInfoCanvas):void
        {
            var _local_2:Object = this._1217229302infoPanel;
            if (_local_2 !== _arg_1)
            {
                this._1217229302infoPanel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoPanel", _local_2, _arg_1));
            };
        }

        public function set useEffect(_arg_1:Boolean):void
        {
            CreatureView.LOAD_EFFECT = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.compBattle

