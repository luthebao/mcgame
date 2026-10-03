// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.CreatureView

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.view.ICreatureView;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.Timer;
    import flash.display.DisplayObject;
    import com.qeedoo.ui.resource.Loader10;
    import flash.display.Sprite;
    import com.qeedoo.game.system.Core;
    import flash.geom.Point;
    import com.qeedoo.ui.view.comp.RoundedText;
    import com.qeedoo.effects.EnterFrameMove;
    import com.qeedoo.ui.view.comp.PopupText;
    import com.qeedoo.game.config.Debug;
    import com.qeedoo.game.resource.ResCacher;
    import flash.display.LoaderInfo;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.resource.CharactorGraphic;
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.resource.DecorateGraphic;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.TimerEvent;
    import com.qeedoo.game.resource.AbstractGameRes;
    import flash.utils.setTimeout;
    import flash.net.URLRequest;
    import com.qeedoo.game.utils.LinkEncode;
    import mx.controls.Alert;
    import com.qeedoo.effects.TimerMove;
    import flash.events.IOErrorEvent;
    import mx.effects.Fade;
    import flash.display.DisplayObjectContainer;
    import flash.events.IEventDispatcher;
    import com.qeedoo.game.resource.FootprintGraphic;
    import com.qeedoo.game.object.Pet;
    import mx.events.EffectEvent;
    import com.qeedoo.game.utils.TextUtil;
    import com.qeedoo.game.config.Version;
    import com.qeedoo.game.resource.*;
    import com.qeedoo.effects.*;

    public class CreatureView extends DynamicItemView implements ICreatureView 
    {

        public static var ADDED:int = 0;
        public static var DESTROYED:int = 0;
        public static var VISIBLE_DELAY:int = 800;
        public static var LOAD_MODEL:Boolean = true;
        public static var LOAD_EFFECT:Boolean = true;
        private static const EMOTION_DELAY:int = 3000;
        protected static var MOVE_SPEED_BATTLE:int = int(((50 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / GamePredef.GLOBAL_FRAME_RATE));
        protected static const WING_CLASS_OFFSET:Object = {};
        protected static const WING_MOUNT_CLASS_OFFSET:Object = {};
        protected static const WING_RUN_OFFSET:Object = {};
        protected static const WING_MOUNT_RUN_OFFSET:Object = {};
        private static const TOTAL_FOOT_COUNT:uint = 5;
        private static const TOTAL_FOOT_FRAME:uint = 30;

        protected const MOVE_SPEED_POSITION:int = 15;
        protected const HITTEST_DISTANCE:int = 30;
        protected const MOVE_SPEED_ESCAPE:int = 3;
        private const FOLLOW_STOP_COUNT:int = 1;
        protected var _flyer_cg:Object;
        protected var _halo_cg:Object;
        protected var _round_cg:Object;
        public var fairyManager:FairyView;
        protected var _isBattleView:Boolean;
        public var lastMountHeight:Number = 0;
        private var _emTimer:Timer;
        public var _shadow:DisplayObject;
        protected var _frontEffLoader:Loader10;
        protected var _emotionLoader:Loader10;
        protected var _frontC:CreatureView;
        protected var _fairy_cg:Object;
        public var _body:Sprite;
        private var _core:Core;
        protected var wing_run_lastTune:Object = null;
        protected var _followOldPoint:Point;
        public var mountHeight:Number = 0;
        protected var _namePrefix:String;
        protected var wing_stand_lastTune:Object = null;
        protected var _attackEffLoader:Loader10;
        public var stateSprite:Sprite;
        protected var _textName:RoundedText;
        protected var _mount_front:Object;
        private var _last_enter_time:Number;
        public var doubleFly:Boolean = false;
        protected var _round_mask_cg:Object;
        public var flyingEffect:EnterFrameMove = null;
        public var _cg:*;
        protected var _skillEffLoader:Loader10;
        protected var _weaponLoader:Loader10;
        protected var _weapon:*;
        protected var _buffEffLoader:Loader10;
        protected var _speed:Number;
        protected var spriteStoped:Boolean = false;
        protected var _gameObjMove:EnterFrameMove;
        protected var _hitTestLayer:DisplayObject;
        protected var _gameObject:Object;
        public var weddingFlyer:DoubleFlyerManager;
        protected var _isWalking:Boolean;
        private var _footprint:Object;
        private var _footprint_count:int = 0;
        protected var _state:int;
        private var FAIRY_RES_CODE:Number = -1;
        protected var _mount_cg:Object;
        protected var _popup:PopupText;
        protected var _callBack:Function;
        protected var _flyer_front:Object;
        protected var _wing_cg:Object;
        protected var _tepe_cg:Object;
        protected var _sprite:*;
        public var _weapon_cg:*;
        protected var _defaultResLoader:Loader10;

        protected const MOVE_SPEED_NORMAL:int = int(((9 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / GamePredef.GLOBAL_FRAME_RATE));
        protected const MOVE_SPEED_RUSH:int = int(((40 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / GamePredef.GLOBAL_FRAME_RATE));
        private const WING_MISSED_DIRECTION:Object = {
            "5":true,
            "6":true,
            "7":true
        };
        public var MOUNT_DRESS_HEIGHT:* = {
            "2050080010004":35,
            "2050080010005":35,
            "2050080010006":35,
            "2050080010007":35,
            "2050080010008":35,
            "2050080010009":35,
            "2050080010010":35,
            "2050080010011":35,
            "2050080010012":35,
            "2050080010013":35,
            "2050080010014":35,
            "2050080010015":35,
            "2050080010016":35,
            "2050080010017":35,
            "2050080010018":35,
            "2050080010019":35,
            "2050080010020":35,
            "2050080010021":35
        };

        {
            WING_CLASS_OFFSET[2050070000001] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-7
                },
                "1":{
                    "x":0,
                    "y":-7
                },
                "2":{
                    "x":-3,
                    "y":-2
                },
                "3":{
                    "x":-2,
                    "y":-2
                },
                "4":{
                    "x":0,
                    "y":-4
                },
                "5":{
                    "x":-1,
                    "y":-4
                },
                "6":{
                    "x":1,
                    "y":-3
                },
                "7":{
                    "x":-2,
                    "y":-7
                }
            };
            WING_CLASS_OFFSET[2050080000001] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":-3,
                    "y":0
                },
                "2":{
                    "x":-2,
                    "y":0
                },
                "3":{
                    "x":0,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-2,
                    "y":-1
                },
                "6":{
                    "x":2,
                    "y":0
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050070000006] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-11
                },
                "1":{
                    "x":2,
                    "y":-7
                },
                "2":{
                    "x":-3,
                    "y":-6
                },
                "3":{
                    "x":-3,
                    "y":-7
                },
                "4":{
                    "x":-3,
                    "y":-5
                },
                "5":{
                    "x":-5,
                    "y":-5
                },
                "6":{
                    "x":-3,
                    "y":-6
                },
                "7":{
                    "x":-9,
                    "y":-6
                }
            };
            WING_CLASS_OFFSET[2050080000006] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":-3
                },
                "1":{
                    "x":7,
                    "y":-1
                },
                "2":{
                    "x":1,
                    "y":1
                },
                "3":{
                    "x":5,
                    "y":1
                },
                "4":{
                    "x":5,
                    "y":1
                },
                "5":{
                    "x":1,
                    "y":2
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":-1
                }
            };
            WING_CLASS_OFFSET[2050070000002] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-7
                },
                "1":{
                    "x":1,
                    "y":-8
                },
                "2":{
                    "x":-3,
                    "y":-2
                },
                "3":{
                    "x":-2,
                    "y":-1
                },
                "4":{
                    "x":0,
                    "y":-2
                },
                "5":{
                    "x":1,
                    "y":-2
                },
                "6":{
                    "x":4,
                    "y":-3
                },
                "7":{
                    "x":-1,
                    "y":-4
                }
            };
            WING_CLASS_OFFSET[2050080000002] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":-5
                },
                "1":{
                    "x":2,
                    "y":-4
                },
                "2":{
                    "x":0,
                    "y":6
                },
                "3":{
                    "x":4,
                    "y":5
                },
                "4":{
                    "x":11,
                    "y":4
                },
                "5":{
                    "x":13,
                    "y":4
                },
                "6":{
                    "x":10,
                    "y":1
                },
                "7":{
                    "x":8,
                    "y":-2
                }
            };
            WING_CLASS_OFFSET[2050070000005] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":-10
                },
                "1":{
                    "x":3,
                    "y":-7
                },
                "2":{
                    "x":-4,
                    "y":-5
                },
                "3":{
                    "x":0,
                    "y":-5
                },
                "4":{
                    "x":3,
                    "y":-6
                },
                "5":{
                    "x":2,
                    "y":-5
                },
                "6":{
                    "x":6,
                    "y":-7
                },
                "7":{
                    "x":3,
                    "y":-12
                }
            };
            WING_CLASS_OFFSET[2050080000005] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-5
                },
                "1":{
                    "x":1,
                    "y":-4
                },
                "2":{
                    "x":0,
                    "y":4
                },
                "3":{
                    "x":1,
                    "y":2
                },
                "4":{
                    "x":1,
                    "y":-1
                },
                "5":{
                    "x":-2,
                    "y":-1
                },
                "6":{
                    "x":-2,
                    "y":3
                },
                "7":{
                    "x":-4,
                    "y":-4
                }
            };
            WING_CLASS_OFFSET[2050070000003] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":-7
                },
                "1":{
                    "x":2,
                    "y":-8
                },
                "2":{
                    "x":-2,
                    "y":-1
                },
                "3":{
                    "x":0,
                    "y":-4
                },
                "4":{
                    "x":1,
                    "y":-5
                },
                "5":{
                    "x":0,
                    "y":-4
                },
                "6":{
                    "x":2,
                    "y":-4
                },
                "7":{
                    "x":-1,
                    "y":-6
                }
            };
            WING_CLASS_OFFSET[2050080000003] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-3
                },
                "1":{
                    "x":1,
                    "y":-4
                },
                "2":{
                    "x":-3,
                    "y":-1
                },
                "3":{
                    "x":1,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-5,
                    "y":3
                },
                "6":{
                    "x":1,
                    "y":3
                },
                "7":{
                    "x":1,
                    "y":1
                }
            };
            WING_CLASS_OFFSET[2050070000004] = {
                "wing":true,
                "0":{
                    "x":5,
                    "y":-11
                },
                "1":{
                    "x":2,
                    "y":-8
                },
                "2":{
                    "x":1,
                    "y":-1
                },
                "3":{
                    "x":6,
                    "y":-2
                },
                "4":{
                    "x":8,
                    "y":-4
                },
                "5":{
                    "x":7,
                    "y":-4
                },
                "6":{
                    "x":8,
                    "y":-4
                },
                "7":{
                    "x":1,
                    "y":-7
                }
            };
            WING_CLASS_OFFSET[2050080000004] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-7
                },
                "1":{
                    "x":6,
                    "y":-4
                },
                "2":{
                    "x":-3,
                    "y":-2
                },
                "3":{
                    "x":0,
                    "y":-1
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":0
                },
                "6":{
                    "x":2,
                    "y":0
                },
                "7":{
                    "x":1,
                    "y":-5
                }
            };
            WING_CLASS_OFFSET[2060100001137] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-5
                },
                "1":{
                    "x":2,
                    "y":-7
                },
                "2":{
                    "x":-3,
                    "y":-2
                },
                "3":{
                    "x":-1,
                    "y":-1
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-1,
                    "y":1
                },
                "6":{
                    "x":-2,
                    "y":-1
                },
                "7":{
                    "x":-5,
                    "y":-6
                }
            };
            WING_CLASS_OFFSET[2060100001138] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-6
                },
                "1":{
                    "x":4,
                    "y":-6
                },
                "2":{
                    "x":1,
                    "y":-2
                },
                "3":{
                    "x":1,
                    "y":-2
                },
                "4":{
                    "x":0,
                    "y":-1
                },
                "5":{
                    "x":-1,
                    "y":0
                },
                "6":{
                    "x":-2,
                    "y":-1
                },
                "7":{
                    "x":-5,
                    "y":-3
                }
            };
            WING_CLASS_OFFSET[2060100200042] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":-7
                },
                "1":{
                    "x":6,
                    "y":-9
                },
                "2":{
                    "x":4,
                    "y":-3
                },
                "3":{
                    "x":4,
                    "y":-7
                },
                "4":{
                    "x":2,
                    "y":-7
                },
                "5":{
                    "x":-2,
                    "y":-5
                },
                "6":{
                    "x":-4,
                    "y":-3
                },
                "7":{
                    "x":-3,
                    "y":-11
                }
            };
            WING_CLASS_OFFSET[2060100200043] = {
                "wing":true,
                "0":{
                    "x":5,
                    "y":-7
                },
                "1":{
                    "x":4,
                    "y":-8
                },
                "2":{
                    "x":-4,
                    "y":-2
                },
                "3":{
                    "x":-4,
                    "y":-4
                },
                "4":{
                    "x":-4,
                    "y":-2
                },
                "5":{
                    "x":-6,
                    "y":-1
                },
                "6":{
                    "x":-2,
                    "y":1
                },
                "7":{
                    "x":-2,
                    "y":-7
                }
            };
            WING_CLASS_OFFSET[2060100200044] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-10
                },
                "1":{
                    "x":4,
                    "y":-11
                },
                "2":{
                    "x":1,
                    "y":-7
                },
                "3":{
                    "x":-1,
                    "y":-9
                },
                "4":{
                    "x":-1,
                    "y":-9
                },
                "5":{
                    "x":-5,
                    "y":-8
                },
                "6":{
                    "x":-6,
                    "y":-8
                },
                "7":{
                    "x":-7,
                    "y":-12
                }
            };
            WING_CLASS_OFFSET[2060100200045] = {
                "wing":true,
                "0":{
                    "x":9,
                    "y":-9
                },
                "1":{
                    "x":7,
                    "y":-11
                },
                "2":{
                    "x":0,
                    "y":-7
                },
                "3":{
                    "x":-3,
                    "y":-5
                },
                "4":{
                    "x":-4,
                    "y":-3
                },
                "5":{
                    "x":-2,
                    "y":-2
                },
                "6":{
                    "x":1,
                    "y":-3
                },
                "7":{
                    "x":1,
                    "y":-7
                }
            };
            WING_CLASS_OFFSET[2060100200068] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-3
                },
                "2":{
                    "x":-3,
                    "y":2
                },
                "3":{
                    "x":0,
                    "y":1
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":1,
                    "y":0
                },
                "6":{
                    "x":3,
                    "y":2
                },
                "7":{
                    "x":-4,
                    "y":-2
                }
            };
            WING_CLASS_OFFSET[2060100200069] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":2,
                    "y":-5
                },
                "2":{
                    "x":0,
                    "y":0
                },
                "3":{
                    "x":0,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-2,
                    "y":0
                },
                "6":{
                    "x":-1,
                    "y":0
                },
                "7":{
                    "x":-5,
                    "y":-4
                }
            };
            WING_CLASS_OFFSET[2060100200062] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-8
                },
                "1":{
                    "x":-4,
                    "y":-10
                },
                "2":{
                    "x":-3,
                    "y":0
                },
                "3":{
                    "x":1,
                    "y":-4
                },
                "4":{
                    "x":0,
                    "y":-4
                },
                "5":{
                    "x":1,
                    "y":-4
                },
                "6":{
                    "x":0,
                    "y":-3
                },
                "7":{
                    "x":3,
                    "y":-12
                }
            };
            WING_CLASS_OFFSET[2060100200060] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-5
                },
                "1":{
                    "x":1,
                    "y":-6
                },
                "2":{
                    "x":0,
                    "y":-5
                },
                "3":{
                    "x":1,
                    "y":-6
                },
                "4":{
                    "x":0,
                    "y":-4
                },
                "5":{
                    "x":-3,
                    "y":-1
                },
                "6":{
                    "x":-2,
                    "y":-4
                },
                "7":{
                    "x":-2,
                    "y":-4
                }
            };
            WING_CLASS_OFFSET[2060100001133] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-6
                },
                "1":{
                    "x":0,
                    "y":-6
                },
                "2":{
                    "x":1,
                    "y":-3
                },
                "3":{
                    "x":1,
                    "y":-5
                },
                "4":{
                    "x":1,
                    "y":-7
                },
                "5":{
                    "x":0,
                    "y":-6
                },
                "6":{
                    "x":-2,
                    "y":-3
                },
                "7":{
                    "x":-3,
                    "y":-8
                }
            };
            WING_CLASS_OFFSET[2060100001134] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-8
                },
                "1":{
                    "x":2,
                    "y":-11
                },
                "2":{
                    "x":0,
                    "y":-6
                },
                "3":{
                    "x":1,
                    "y":-8
                },
                "4":{
                    "x":0,
                    "y":-7
                },
                "5":{
                    "x":-4,
                    "y":-9
                },
                "6":{
                    "x":-1,
                    "y":-6
                },
                "7":{
                    "x":-2,
                    "y":-11
                }
            };
            WING_CLASS_OFFSET[2060100200052] = {
                "wing":true,
                "0":{
                    "x":7,
                    "y":-3
                },
                "1":{
                    "x":3,
                    "y":-6
                },
                "2":{
                    "x":5,
                    "y":-1
                },
                "3":{
                    "x":2,
                    "y":-3
                },
                "4":{
                    "x":4,
                    "y":-2
                },
                "5":{
                    "x":6,
                    "y":-3
                },
                "6":{
                    "x":2,
                    "y":0
                },
                "7":{
                    "x":4,
                    "y":-4
                }
            };
            WING_CLASS_OFFSET[2060100200057] = {
                "wing":true,
                "0":{
                    "x":5,
                    "y":-10
                },
                "1":{
                    "x":4,
                    "y":-10
                },
                "2":{
                    "x":2,
                    "y":-9
                },
                "3":{
                    "x":2,
                    "y":-12
                },
                "4":{
                    "x":2,
                    "y":-9
                },
                "5":{
                    "x":3,
                    "y":-11
                },
                "6":{
                    "x":1,
                    "y":-10
                },
                "7":{
                    "x":1,
                    "y":-10
                }
            };
            WING_CLASS_OFFSET[2060100001144] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-6
                },
                "1":{
                    "x":-2,
                    "y":-4
                },
                "2":{
                    "x":-2,
                    "y":1
                },
                "3":{
                    "x":-1,
                    "y":-2
                },
                "4":{
                    "x":-1,
                    "y":-1
                },
                "5":{
                    "x":0,
                    "y":-2
                },
                "6":{
                    "x":1,
                    "y":0
                },
                "7":{
                    "x":-1,
                    "y":-4
                }
            };
            WING_CLASS_OFFSET[2060100001145] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":-3
                },
                "1":{
                    "x":0,
                    "y":-1
                },
                "2":{
                    "x":-7,
                    "y":3
                },
                "3":{
                    "x":-1,
                    "y":0
                },
                "4":{
                    "x":-1,
                    "y":-1
                },
                "5":{
                    "x":1,
                    "y":-1
                },
                "6":{
                    "x":4,
                    "y":1
                },
                "7":{
                    "x":1,
                    "y":-1
                }
            };
            WING_CLASS_OFFSET[2060100001148] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":-11
                },
                "1":{
                    "x":2,
                    "y":-11
                },
                "2":{
                    "x":3,
                    "y":-9
                },
                "3":{
                    "x":1,
                    "y":-12
                },
                "4":{
                    "x":0,
                    "y":-13
                },
                "5":{
                    "x":0,
                    "y":-11
                },
                "6":{
                    "x":-2,
                    "y":-10
                },
                "7":{
                    "x":-3,
                    "y":-11
                }
            };
            WING_CLASS_OFFSET[2060100001147] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-10
                },
                "1":{
                    "x":2,
                    "y":-9
                },
                "2":{
                    "x":0,
                    "y":-2
                },
                "3":{
                    "x":-1,
                    "y":-3
                },
                "4":{
                    "x":1,
                    "y":-1
                },
                "5":{
                    "x":3,
                    "y":-2
                },
                "6":{
                    "x":-1,
                    "y":-2
                },
                "7":{
                    "x":-1,
                    "y":-7
                }
            };
            WING_CLASS_OFFSET[2060100200077] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-4
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-1,
                    "y":7
                },
                "4":{
                    "x":1,
                    "y":8
                },
                "5":{
                    "x":2,
                    "y":5
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":0,
                    "y":2
                }
            };
            WING_CLASS_OFFSET[2060100200078] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-1
                },
                "2":{
                    "x":-1,
                    "y":3
                },
                "3":{
                    "x":-1,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":4
                },
                "5":{
                    "x":2,
                    "y":1
                },
                "6":{
                    "x":3,
                    "y":3
                },
                "7":{
                    "x":-2,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200081] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200082] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200126] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-4
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-1,
                    "y":7
                },
                "4":{
                    "x":1,
                    "y":8
                },
                "5":{
                    "x":2,
                    "y":5
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":0,
                    "y":2
                }
            };
            WING_CLASS_OFFSET[2060100200125] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-1
                },
                "2":{
                    "x":-1,
                    "y":3
                },
                "3":{
                    "x":-1,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":4
                },
                "5":{
                    "x":2,
                    "y":1
                },
                "6":{
                    "x":3,
                    "y":3
                },
                "7":{
                    "x":-2,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200088] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200089] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200092] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200093] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200090] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200091] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200086] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200087] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200084] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200085] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200070] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200083] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":-4,
                    "y":2
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":5,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200130] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200131] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200140] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200141] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200072] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200071] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200136] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200137] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200132] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200133] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200138] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200139] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200134] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200135] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200158] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200152] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200157] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200151] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200162] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200156] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200160] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200154] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200161] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200155] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200159] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200153] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200146] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200148] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200147] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200169] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200145] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200144] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200142] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200143] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200149] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200150] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200165] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200166] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200163] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200164] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100001256] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100001257] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100001253] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100001254] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100001255] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200170] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2060100200171] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":5,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050070000011] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-6,
                    "y":0
                },
                "3":{
                    "x":-5,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":0
                },
                "6":{
                    "x":3,
                    "y":0
                },
                "7":{
                    "x":-4,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050080000011] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":0
                },
                "2":{
                    "x":2,
                    "y":0
                },
                "3":{
                    "x":4,
                    "y":0
                },
                "4":{
                    "x":2,
                    "y":0
                },
                "5":{
                    "x":2,
                    "y":0
                },
                "6":{
                    "x":0,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":-1
                }
            };
            WING_CLASS_OFFSET[2050070000016] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-5,
                    "y":0
                },
                "3":{
                    "x":-7,
                    "y":-5
                },
                "4":{
                    "x":-2,
                    "y":-1
                },
                "5":{
                    "x":0,
                    "y":-4
                },
                "6":{
                    "x":0,
                    "y":0
                },
                "7":{
                    "x":-6,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050080000016] = {
                "wing":true,
                "0":{
                    "x":-2,
                    "y":0
                },
                "1":{
                    "x":-3,
                    "y":-1
                },
                "2":{
                    "x":-2,
                    "y":0
                },
                "3":{
                    "x":0,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":1
                },
                "6":{
                    "x":-2,
                    "y":0
                },
                "7":{
                    "x":-5,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050070000012] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-5,
                    "y":0
                },
                "3":{
                    "x":0,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":0
                },
                "6":{
                    "x":2,
                    "y":0
                },
                "7":{
                    "x":-1,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050080000012] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-5,
                    "y":0
                },
                "3":{
                    "x":-8,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":3,
                    "y":0
                },
                "6":{
                    "x":3,
                    "y":0
                },
                "7":{
                    "x":-1,
                    "y":0
                }
            };
            WING_CLASS_OFFSET[2050070000015] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-4,
                    "y":0
                },
                "3":{
                    "x":0,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":1,
                    "y":0
                },
                "6":{
                    "x":3,
                    "y":0
                },
                "7":{
                    "x":-2,
                    "y":-2
                }
            };
            WING_CLASS_OFFSET[2050080000015] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":1,
                    "y":0
                },
                "2":{
                    "x":0,
                    "y":3
                },
                "3":{
                    "x":0,
                    "y":0
                },
                "4":{
                    "x":4,
                    "y":0
                },
                "5":{
                    "x":3,
                    "y":0
                },
                "6":{
                    "x":2,
                    "y":0
                },
                "7":{
                    "x":-3,
                    "y":1
                }
            };
            WING_CLASS_OFFSET[2050070000013] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-4
                },
                "2":{
                    "x":-6,
                    "y":-2
                },
                "3":{
                    "x":-1,
                    "y":0
                },
                "4":{
                    "x":-4,
                    "y":-2
                },
                "5":{
                    "x":-2,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":0
                },
                "7":{
                    "x":1,
                    "y":-2
                }
            };
            WING_CLASS_OFFSET[2050080000013] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":2,
                    "y":0
                },
                "2":{
                    "x":-7,
                    "y":-2
                },
                "3":{
                    "x":-8,
                    "y":0
                },
                "4":{
                    "x":-6,
                    "y":0
                },
                "5":{
                    "x":-2,
                    "y":0
                },
                "6":{
                    "x":3,
                    "y":0
                },
                "7":{
                    "x":-5,
                    "y":1
                }
            };
            WING_CLASS_OFFSET[2050070000014] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-5,
                    "y":0
                },
                "3":{
                    "x":0,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":0
                },
                "6":{
                    "x":4,
                    "y":0
                },
                "7":{
                    "x":-2,
                    "y":1
                }
            };
            WING_CLASS_OFFSET[2050080000014] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":-4,
                    "y":0
                },
                "3":{
                    "x":2,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":-2
                },
                "5":{
                    "x":-1,
                    "y":0
                },
                "6":{
                    "x":2,
                    "y":0
                },
                "7":{
                    "x":-4,
                    "y":0
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050080000012] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":-10
                },
                "2":{
                    "x":2,
                    "y":-1
                },
                "3":{
                    "x":6,
                    "y":5
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-3,
                    "y":2
                },
                "6":{
                    "x":-2,
                    "y":2
                },
                "7":{
                    "x":0,
                    "y":0
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050070000012] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-1
                },
                "1":{
                    "x":-2,
                    "y":-14
                },
                "2":{
                    "x":5,
                    "y":-3
                },
                "3":{
                    "x":4,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":4,
                    "y":1
                },
                "6":{
                    "x":-1,
                    "y":-4
                },
                "7":{
                    "x":0,
                    "y":-12
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050070000011] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-2
                },
                "1":{
                    "x":-5,
                    "y":-13
                },
                "2":{
                    "x":4,
                    "y":0
                },
                "3":{
                    "x":-1,
                    "y":4
                },
                "4":{
                    "x":0,
                    "y":7
                },
                "5":{
                    "x":0,
                    "y":3
                },
                "6":{
                    "x":-3,
                    "y":1
                },
                "7":{
                    "x":-3,
                    "y":-13
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050080000011] = {
                "wing":true,
                "0":{
                    "x":5,
                    "y":1
                },
                "1":{
                    "x":1,
                    "y":-9
                },
                "2":{
                    "x":-1,
                    "y":1
                },
                "3":{
                    "x":-6,
                    "y":4
                },
                "4":{
                    "x":-5,
                    "y":3
                },
                "5":{
                    "x":-2,
                    "y":1
                },
                "6":{
                    "x":-2,
                    "y":4
                },
                "7":{
                    "x":0,
                    "y":-1
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050070000016] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":4,
                    "y":-7
                },
                "2":{
                    "x":1,
                    "y":1
                },
                "3":{
                    "x":1,
                    "y":6
                },
                "4":{
                    "x":1,
                    "y":1
                },
                "5":{
                    "x":0,
                    "y":6
                },
                "6":{
                    "x":2,
                    "y":3
                },
                "7":{
                    "x":-1,
                    "y":-4
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050080000016] = {
                "wing":true,
                "0":{
                    "x":7,
                    "y":0
                },
                "1":{
                    "x":1,
                    "y":-3
                },
                "2":{
                    "x":-6,
                    "y":1
                },
                "3":{
                    "x":-5,
                    "y":7
                },
                "4":{
                    "x":-4,
                    "y":8
                },
                "5":{
                    "x":-2,
                    "y":7
                },
                "6":{
                    "x":2,
                    "y":2
                },
                "7":{
                    "x":1,
                    "y":0
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050070000015] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":-1
                },
                "1":{
                    "x":8,
                    "y":-3
                },
                "2":{
                    "x":8,
                    "y":3
                },
                "3":{
                    "x":-2,
                    "y":6
                },
                "4":{
                    "x":1,
                    "y":3
                },
                "5":{
                    "x":0,
                    "y":2
                },
                "6":{
                    "x":-5,
                    "y":2
                },
                "7":{
                    "x":-3,
                    "y":-3
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050080000015] = {
                "wing":true,
                "0":{
                    "x":6,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-1
                },
                "2":{
                    "x":-1,
                    "y":0
                },
                "3":{
                    "x":-2,
                    "y":5
                },
                "4":{
                    "x":-9,
                    "y":4
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":0,
                    "y":6
                },
                "7":{
                    "x":7,
                    "y":-1
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050070000013] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":-6,
                    "y":-13
                },
                "2":{
                    "x":3,
                    "y":0
                },
                "3":{
                    "x":-1,
                    "y":0
                },
                "4":{
                    "x":4,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":0
                },
                "6":{
                    "x":-1,
                    "y":0
                },
                "7":{
                    "x":0,
                    "y":-12
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050080000013] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":-2
                },
                "1":{
                    "x":3,
                    "y":-7
                },
                "2":{
                    "x":7,
                    "y":-4
                },
                "3":{
                    "x":1,
                    "y":5
                },
                "4":{
                    "x":-1,
                    "y":3
                },
                "5":{
                    "x":-1,
                    "y":1
                },
                "6":{
                    "x":-1,
                    "y":1
                },
                "7":{
                    "x":1,
                    "y":-3
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050070000014] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-1
                },
                "1":{
                    "x":-1,
                    "y":-9
                },
                "2":{
                    "x":3,
                    "y":2
                },
                "3":{
                    "x":0,
                    "y":6
                },
                "4":{
                    "x":1,
                    "y":4
                },
                "5":{
                    "x":-3,
                    "y":5
                },
                "6":{
                    "x":-5,
                    "y":4
                },
                "7":{
                    "x":-2,
                    "y":-10
                }
            };
            WING_MOUNT_CLASS_OFFSET[2050080000014] = {
                "wing":true,
                "0":{
                    "x":5,
                    "y":-1
                },
                "1":{
                    "x":6,
                    "y":-6
                },
                "2":{
                    "x":1,
                    "y":-1
                },
                "3":{
                    "x":-2,
                    "y":6
                },
                "4":{
                    "x":-3,
                    "y":5
                },
                "5":{
                    "x":-3,
                    "y":2
                },
                "6":{
                    "x":0,
                    "y":3
                },
                "7":{
                    "x":4,
                    "y":-4
                }
            };
            WING_RUN_OFFSET[2050070000001] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":2
                },
                "1":{
                    "x":6,
                    "y":4
                },
                "2":{
                    "x":14,
                    "y":-1
                },
                "3":{
                    "x":8,
                    "y":-6
                },
                "4":{
                    "x":-2,
                    "y":-7
                },
                "5":{
                    "x":-8,
                    "y":-5
                },
                "6":{
                    "x":-14,
                    "y":-1
                },
                "7":{
                    "x":-6,
                    "y":2
                }
            };
            WING_RUN_OFFSET[2050080000001] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":5,
                    "y":3
                },
                "2":{
                    "x":12,
                    "y":-4
                },
                "3":{
                    "x":7,
                    "y":-8
                },
                "4":{
                    "x":1,
                    "y":-10
                },
                "5":{
                    "x":-11,
                    "y":-7
                },
                "6":{
                    "x":-12,
                    "y":-4
                },
                "7":{
                    "x":-7,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2050070000006] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":4,
                    "y":0
                },
                "2":{
                    "x":8,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":-1
                },
                "5":{
                    "x":-5,
                    "y":0
                },
                "6":{
                    "x":-8,
                    "y":0
                },
                "7":{
                    "x":-4,
                    "y":3
                }
            };
            WING_RUN_OFFSET[2050080000006] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":-3
                },
                "1":{
                    "x":5,
                    "y":2
                },
                "2":{
                    "x":11,
                    "y":-2
                },
                "3":{
                    "x":4,
                    "y":-6
                },
                "4":{
                    "x":-1,
                    "y":-7
                },
                "5":{
                    "x":-7,
                    "y":-5
                },
                "6":{
                    "x":-11,
                    "y":-2
                },
                "7":{
                    "x":-5,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2050070000002] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":7,
                    "y":7
                },
                "2":{
                    "x":11,
                    "y":1
                },
                "3":{
                    "x":7,
                    "y":-5
                },
                "4":{
                    "x":0,
                    "y":-4
                },
                "5":{
                    "x":-9,
                    "y":-3
                },
                "6":{
                    "x":-12,
                    "y":1
                },
                "7":{
                    "x":-6,
                    "y":5
                }
            };
            WING_RUN_OFFSET[2050080000002] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":5,
                    "y":1
                },
                "2":{
                    "x":9,
                    "y":0
                },
                "3":{
                    "x":4,
                    "y":-14
                },
                "4":{
                    "x":-2,
                    "y":-10
                },
                "5":{
                    "x":-7,
                    "y":-11
                },
                "6":{
                    "x":-9,
                    "y":0
                },
                "7":{
                    "x":-7,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2050070000005] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":0
                },
                "2":{
                    "x":15,
                    "y":-1
                },
                "3":{
                    "x":7,
                    "y":-7
                },
                "4":{
                    "x":0,
                    "y":-6
                },
                "5":{
                    "x":-8,
                    "y":-6
                },
                "6":{
                    "x":-15,
                    "y":-1
                },
                "7":{
                    "x":-11,
                    "y":5
                }
            };
            WING_RUN_OFFSET[2050080000005] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":3
                },
                "2":{
                    "x":10,
                    "y":-6
                },
                "3":{
                    "x":5,
                    "y":-9
                },
                "4":{
                    "x":0,
                    "y":-8
                },
                "5":{
                    "x":-6,
                    "y":-6
                },
                "6":{
                    "x":-10,
                    "y":-6
                },
                "7":{
                    "x":-6,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2050070000003] = {
                "wing":true,
                "0":{
                    "x":-1,
                    "y":0
                },
                "1":{
                    "x":8,
                    "y":9
                },
                "2":{
                    "x":13,
                    "y":-1
                },
                "3":{
                    "x":9,
                    "y":-3
                },
                "4":{
                    "x":1,
                    "y":-5
                },
                "5":{
                    "x":-5,
                    "y":-3
                },
                "6":{
                    "x":-13,
                    "y":-1
                },
                "7":{
                    "x":-9,
                    "y":4
                }
            };
            WING_RUN_OFFSET[2050080000003] = {
                "wing":true,
                "0":{
                    "x":-4,
                    "y":-3
                },
                "1":{
                    "x":9,
                    "y":6
                },
                "2":{
                    "x":15,
                    "y":-1
                },
                "3":{
                    "x":12,
                    "y":-5
                },
                "4":{
                    "x":1,
                    "y":-8
                },
                "5":{
                    "x":-7,
                    "y":-6
                },
                "6":{
                    "x":-16,
                    "y":-2
                },
                "7":{
                    "x":-14,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2050070000004] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":13,
                    "y":3
                },
                "2":{
                    "x":13,
                    "y":0
                },
                "3":{
                    "x":9,
                    "y":-4
                },
                "4":{
                    "x":0,
                    "y":-6
                },
                "5":{
                    "x":-10,
                    "y":-5
                },
                "6":{
                    "x":-13,
                    "y":0
                },
                "7":{
                    "x":-8,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2050080000004] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":2,
                    "y":0
                },
                "2":{
                    "x":9,
                    "y":-3
                },
                "3":{
                    "x":6,
                    "y":-6
                },
                "4":{
                    "x":0,
                    "y":-9
                },
                "5":{
                    "x":-6,
                    "y":-7
                },
                "6":{
                    "x":-9,
                    "y":-3
                },
                "7":{
                    "x":-9,
                    "y":3
                }
            };
            WING_RUN_OFFSET[2060100001137] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":2
                },
                "1":{
                    "x":1,
                    "y":6
                },
                "2":{
                    "x":6,
                    "y":2
                },
                "3":{
                    "x":4,
                    "y":-3
                },
                "4":{
                    "x":-1,
                    "y":-5
                },
                "5":{
                    "x":-4,
                    "y":-5
                },
                "6":{
                    "x":-4,
                    "y":1
                },
                "7":{
                    "x":-3,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100001138] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-2
                },
                "1":{
                    "x":-4,
                    "y":4
                },
                "2":{
                    "x":-3,
                    "y":4
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":-1,
                    "y":-1
                },
                "5":{
                    "x":2,
                    "y":0
                },
                "6":{
                    "x":2,
                    "y":3
                },
                "7":{
                    "x":7,
                    "y":4
                }
            };
            WING_RUN_OFFSET[2060100200042] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-1
                },
                "1":{
                    "x":1,
                    "y":3
                },
                "2":{
                    "x":3,
                    "y":-1
                },
                "3":{
                    "x":3,
                    "y":-3
                },
                "4":{
                    "x":-1,
                    "y":-5
                },
                "5":{
                    "x":-4,
                    "y":-5
                },
                "6":{
                    "x":-3,
                    "y":-1
                },
                "7":{
                    "x":-2,
                    "y":5
                }
            };
            WING_RUN_OFFSET[2060100200043] = {
                "wing":true,
                "0":{
                    "x":-3,
                    "y":6
                },
                "1":{
                    "x":2,
                    "y":11
                },
                "2":{
                    "x":14,
                    "y":3
                },
                "3":{
                    "x":13,
                    "y":0
                },
                "4":{
                    "x":2,
                    "y":-3
                },
                "5":{
                    "x":-5,
                    "y":-4
                },
                "6":{
                    "x":-12,
                    "y":0
                },
                "7":{
                    "x":-8,
                    "y":8
                }
            };
            WING_RUN_OFFSET[2060100200044] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-2
                },
                "1":{
                    "x":0,
                    "y":1
                },
                "2":{
                    "x":3,
                    "y":-1
                },
                "3":{
                    "x":5,
                    "y":-2
                },
                "4":{
                    "x":-1,
                    "y":-4
                },
                "5":{
                    "x":-3,
                    "y":-3
                },
                "6":{
                    "x":-3,
                    "y":0
                },
                "7":{
                    "x":1,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2060100200045] = {
                "wing":true,
                "0":{
                    "x":-5,
                    "y":4
                },
                "1":{
                    "x":4,
                    "y":13
                },
                "2":{
                    "x":13,
                    "y":7
                },
                "3":{
                    "x":14,
                    "y":-1
                },
                "4":{
                    "x":4,
                    "y":-4
                },
                "5":{
                    "x":-6,
                    "y":-6
                },
                "6":{
                    "x":-13,
                    "y":1
                },
                "7":{
                    "x":-10,
                    "y":7
                }
            };
            WING_RUN_OFFSET[2060100200068] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":8
                },
                "1":{
                    "x":11,
                    "y":3
                },
                "2":{
                    "x":10,
                    "y":2
                },
                "3":{
                    "x":9,
                    "y":-1
                },
                "4":{
                    "x":1,
                    "y":-4
                },
                "5":{
                    "x":-9,
                    "y":-2
                },
                "6":{
                    "x":-10,
                    "y":2
                },
                "7":{
                    "x":-11,
                    "y":3
                }
            };
            WING_RUN_OFFSET[2060100200069] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":7,
                    "y":0
                },
                "2":{
                    "x":4,
                    "y":1
                },
                "3":{
                    "x":3,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":2
                },
                "6":{
                    "x":-6,
                    "y":2
                },
                "7":{
                    "x":-7,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2060100200062] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":7
                },
                "2":{
                    "x":4,
                    "y":4
                },
                "3":{
                    "x":4,
                    "y":-1
                },
                "4":{
                    "x":2,
                    "y":-1
                },
                "5":{
                    "x":-4,
                    "y":2
                },
                "6":{
                    "x":-2,
                    "y":3
                },
                "7":{
                    "x":-1,
                    "y":7
                }
            };
            WING_RUN_OFFSET[2060100200060] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":-4,
                    "y":1
                },
                "2":{
                    "x":-5,
                    "y":4
                },
                "3":{
                    "x":-2,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":2
                },
                "5":{
                    "x":2,
                    "y":-1
                },
                "6":{
                    "x":3,
                    "y":6
                },
                "7":{
                    "x":5,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100001133] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-1
                },
                "1":{
                    "x":0,
                    "y":0
                },
                "2":{
                    "x":2,
                    "y":0
                },
                "3":{
                    "x":4,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":-2
                },
                "5":{
                    "x":-4,
                    "y":-3
                },
                "6":{
                    "x":-2,
                    "y":0
                },
                "7":{
                    "x":1,
                    "y":2
                }
            };
            WING_RUN_OFFSET[2060100001134] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":3
                },
                "1":{
                    "x":2,
                    "y":0
                },
                "2":{
                    "x":3,
                    "y":-1
                },
                "3":{
                    "x":0,
                    "y":1
                },
                "4":{
                    "x":1,
                    "y":1
                },
                "5":{
                    "x":0,
                    "y":0
                },
                "6":{
                    "x":-2,
                    "y":-2
                },
                "7":{
                    "x":-3,
                    "y":-1
                }
            };
            WING_RUN_OFFSET[2060100200052] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":9,
                    "y":0
                },
                "2":{
                    "x":7,
                    "y":-3
                },
                "3":{
                    "x":6,
                    "y":-4
                },
                "4":{
                    "x":-1,
                    "y":-6
                },
                "5":{
                    "x":-8,
                    "y":-3
                },
                "6":{
                    "x":-7,
                    "y":-2
                },
                "7":{
                    "x":-5,
                    "y":-4
                }
            };
            WING_RUN_OFFSET[2060100200057] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-1
                },
                "1":{
                    "x":7,
                    "y":-2
                },
                "2":{
                    "x":9,
                    "y":-3
                },
                "3":{
                    "x":7,
                    "y":-2
                },
                "4":{
                    "x":-1,
                    "y":-6
                },
                "5":{
                    "x":-9,
                    "y":-2
                },
                "6":{
                    "x":-10,
                    "y":-1
                },
                "7":{
                    "x":-6,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2060100001144] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":7,
                    "y":2
                },
                "2":{
                    "x":7,
                    "y":-2
                },
                "3":{
                    "x":2,
                    "y":-4
                },
                "4":{
                    "x":-1,
                    "y":-3
                },
                "5":{
                    "x":-5,
                    "y":-3
                },
                "6":{
                    "x":-7,
                    "y":-1
                },
                "7":{
                    "x":-5,
                    "y":2
                }
            };
            WING_RUN_OFFSET[2060100001145] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-6
                },
                "1":{
                    "x":3,
                    "y":-5
                },
                "2":{
                    "x":10,
                    "y":-6
                },
                "3":{
                    "x":4,
                    "y":-6
                },
                "4":{
                    "x":1,
                    "y":-5
                },
                "5":{
                    "x":-5,
                    "y":-5
                },
                "6":{
                    "x":-9,
                    "y":-4
                },
                "7":{
                    "x":-6,
                    "y":-5
                }
            };
            WING_RUN_OFFSET[2060100001148] = {
                "wing":true,
                "0":{
                    "x":-1,
                    "y":0
                },
                "1":{
                    "x":7,
                    "y":-2
                },
                "2":{
                    "x":3,
                    "y":-4
                },
                "3":{
                    "x":5,
                    "y":-2
                },
                "4":{
                    "x":1,
                    "y":-3
                },
                "5":{
                    "x":-5,
                    "y":-3
                },
                "6":{
                    "x":-5,
                    "y":-3
                },
                "7":{
                    "x":-4,
                    "y":-2
                }
            };
            WING_RUN_OFFSET[2060100001147] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":1
                },
                "1":{
                    "x":1,
                    "y":-2
                },
                "2":{
                    "x":2,
                    "y":-4
                },
                "3":{
                    "x":3,
                    "y":-2
                },
                "4":{
                    "x":1,
                    "y":-4
                },
                "5":{
                    "x":-1,
                    "y":-3
                },
                "6":{
                    "x":0,
                    "y":-6
                },
                "7":{
                    "x":1,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2060100200077] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-4
                },
                "2":{
                    "x":2,
                    "y":-5
                },
                "3":{
                    "x":0,
                    "y":-6
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":-5
                },
                "6":{
                    "x":-1,
                    "y":-5
                },
                "7":{
                    "x":0,
                    "y":-4
                }
            };
            WING_RUN_OFFSET[2060100200078] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":1,
                    "y":-1
                },
                "2":{
                    "x":2,
                    "y":-7
                },
                "3":{
                    "x":0,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":1
                },
                "6":{
                    "x":-3,
                    "y":-7
                },
                "7":{
                    "x":-3,
                    "y":-1
                }
            };
            WING_RUN_OFFSET[2060100200081] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200082] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100200126] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":0,
                    "y":-4
                },
                "2":{
                    "x":2,
                    "y":-5
                },
                "3":{
                    "x":0,
                    "y":-6
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":-5
                },
                "6":{
                    "x":-1,
                    "y":-5
                },
                "7":{
                    "x":0,
                    "y":-4
                }
            };
            WING_RUN_OFFSET[2060100200125] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":1,
                    "y":-1
                },
                "2":{
                    "x":2,
                    "y":-7
                },
                "3":{
                    "x":0,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":1
                },
                "6":{
                    "x":-3,
                    "y":-7
                },
                "7":{
                    "x":-3,
                    "y":-1
                }
            };
            WING_RUN_OFFSET[2060100200088] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200089] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100200070] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200083] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100200084] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200085] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100200086] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200087] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100200090] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200091] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2060100200092] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":1
                },
                "2":{
                    "x":10,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":1,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-1
                },
                "6":{
                    "x":-10,
                    "y":1
                },
                "7":{
                    "x":-9,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2060100200093] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":6
                },
                "2":{
                    "x":8,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-8,
                    "y":2
                },
                "7":{
                    "x":-10,
                    "y":6
                }
            };
            WING_RUN_OFFSET[2050070000011] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":0
                },
                "2":{
                    "x":6,
                    "y":-2
                },
                "3":{
                    "x":2,
                    "y":-5
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-4,
                    "y":-3
                },
                "6":{
                    "x":-6,
                    "y":0
                },
                "7":{
                    "x":-10,
                    "y":2
                }
            };
            WING_RUN_OFFSET[2050080000011] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":1
                },
                "2":{
                    "x":9,
                    "y":-1
                },
                "3":{
                    "x":8,
                    "y":-2
                },
                "4":{
                    "x":1,
                    "y":-6
                },
                "5":{
                    "x":-5,
                    "y":-5
                },
                "6":{
                    "x":-7,
                    "y":-3
                },
                "7":{
                    "x":-7,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2050070000016] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":1
                },
                "2":{
                    "x":9,
                    "y":-1
                },
                "3":{
                    "x":8,
                    "y":-2
                },
                "4":{
                    "x":1,
                    "y":-6
                },
                "5":{
                    "x":-5,
                    "y":-5
                },
                "6":{
                    "x":-7,
                    "y":-3
                },
                "7":{
                    "x":-7,
                    "y":0
                }
            };
            WING_RUN_OFFSET[2050080000016] = {
                "wing":true,
                "0":{
                    "x":-2,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":4
                },
                "2":{
                    "x":6,
                    "y":2
                },
                "3":{
                    "x":5,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":-2
                },
                "5":{
                    "x":-8,
                    "y":-2
                },
                "6":{
                    "x":-11,
                    "y":0
                },
                "7":{
                    "x":-13,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2050070000012] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":8,
                    "y":0
                },
                "2":{
                    "x":8,
                    "y":0
                },
                "3":{
                    "x":5,
                    "y":-4
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":-10,
                    "y":-4
                },
                "6":{
                    "x":-10,
                    "y":0
                },
                "7":{
                    "x":-8,
                    "y":2
                }
            };
            WING_RUN_OFFSET[2050080000012] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":9
                },
                "1":{
                    "x":9,
                    "y":4
                },
                "2":{
                    "x":7,
                    "y":0
                },
                "3":{
                    "x":-1,
                    "y":-3
                },
                "4":{
                    "x":0,
                    "y":0
                },
                "5":{
                    "x":0,
                    "y":-1
                },
                "6":{
                    "x":-9,
                    "y":1
                },
                "7":{
                    "x":-12,
                    "y":7
                }
            };
            WING_RUN_OFFSET[2050070000015] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":12,
                    "y":2
                },
                "2":{
                    "x":11,
                    "y":0
                },
                "3":{
                    "x":9,
                    "y":-3
                },
                "4":{
                    "x":1,
                    "y":-5
                },
                "5":{
                    "x":-9,
                    "y":-1
                },
                "6":{
                    "x":-11,
                    "y":1
                },
                "7":{
                    "x":-12,
                    "y":1
                }
            };
            WING_RUN_OFFSET[2050080000015] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":11,
                    "y":2
                },
                "2":{
                    "x":10,
                    "y":1
                },
                "3":{
                    "x":8,
                    "y":-2
                },
                "4":{
                    "x":1,
                    "y":-5
                },
                "5":{
                    "x":-1,
                    "y":-3
                },
                "6":{
                    "x":-8,
                    "y":0
                },
                "7":{
                    "x":-15,
                    "y":5
                }
            };
            WING_RUN_OFFSET[2050070000013] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":-4
                },
                "2":{
                    "x":7,
                    "y":-3
                },
                "3":{
                    "x":6,
                    "y":-6
                },
                "4":{
                    "x":3,
                    "y":-7
                },
                "5":{
                    "x":-9,
                    "y":-7
                },
                "6":{
                    "x":-10,
                    "y":-2
                },
                "7":{
                    "x":-9,
                    "y":-2
                }
            };
            WING_RUN_OFFSET[2050080000013] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":10,
                    "y":2
                },
                "2":{
                    "x":12,
                    "y":-4
                },
                "3":{
                    "x":6,
                    "y":-9
                },
                "4":{
                    "x":3,
                    "y":-5
                },
                "5":{
                    "x":-7,
                    "y":-7
                },
                "6":{
                    "x":-12,
                    "y":-2
                },
                "7":{
                    "x":-15,
                    "y":3
                }
            };
            WING_RUN_OFFSET[2050070000014] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":11,
                    "y":0
                },
                "2":{
                    "x":9,
                    "y":-4
                },
                "3":{
                    "x":6,
                    "y":-6
                },
                "4":{
                    "x":1,
                    "y":-3
                },
                "5":{
                    "x":-7,
                    "y":-5
                },
                "6":{
                    "x":-9,
                    "y":-2
                },
                "7":{
                    "x":-13,
                    "y":2
                }
            };
            WING_RUN_OFFSET[2050080000014] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":0
                },
                "1":{
                    "x":6,
                    "y":0
                },
                "2":{
                    "x":7,
                    "y":-4
                },
                "3":{
                    "x":8,
                    "y":-5
                },
                "4":{
                    "x":-2,
                    "y":-10
                },
                "5":{
                    "x":-11,
                    "y":-5
                },
                "6":{
                    "x":-9,
                    "y":-2
                },
                "7":{
                    "x":-10,
                    "y":0
                }
            };
            WING_MOUNT_RUN_OFFSET[2050070000011] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-8
                },
                "1":{
                    "x":2,
                    "y":-8
                },
                "2":{
                    "x":4,
                    "y":1
                },
                "3":{
                    "x":-1,
                    "y":0
                },
                "4":{
                    "x":0,
                    "y":6
                },
                "5":{
                    "x":-2,
                    "y":6
                },
                "6":{
                    "x":-2,
                    "y":0
                },
                "7":{
                    "x":-2,
                    "y":-7
                }
            };
            WING_MOUNT_RUN_OFFSET[2050080000011] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":1
                },
                "1":{
                    "x":2,
                    "y":-6
                },
                "2":{
                    "x":1,
                    "y":3
                },
                "3":{
                    "x":-4,
                    "y":3
                },
                "4":{
                    "x":-4,
                    "y":4
                },
                "5":{
                    "x":-2,
                    "y":1
                },
                "6":{
                    "x":-3,
                    "y":3
                },
                "7":{
                    "x":-2,
                    "y":-2
                }
            };
            WING_MOUNT_RUN_OFFSET[2050070000016] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":0
                },
                "1":{
                    "x":-6,
                    "y":-13
                },
                "2":{
                    "x":-1,
                    "y":1
                },
                "3":{
                    "x":-2,
                    "y":4
                },
                "4":{
                    "x":1,
                    "y":2
                },
                "5":{
                    "x":1,
                    "y":2
                },
                "6":{
                    "x":2,
                    "y":3
                },
                "7":{
                    "x":-6,
                    "y":-10
                }
            };
            WING_MOUNT_RUN_OFFSET[2050080000016] = {
                "wing":true,
                "0":{
                    "x":6,
                    "y":-1
                },
                "1":{
                    "x":0,
                    "y":-3
                },
                "2":{
                    "x":-3,
                    "y":1
                },
                "3":{
                    "x":-5,
                    "y":4
                },
                "4":{
                    "x":-1,
                    "y":2
                },
                "5":{
                    "x":0,
                    "y":2
                },
                "6":{
                    "x":1,
                    "y":0
                },
                "7":{
                    "x":0,
                    "y":-4
                }
            };
            WING_MOUNT_RUN_OFFSET[2050070000012] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-7
                },
                "1":{
                    "x":1,
                    "y":-14
                },
                "2":{
                    "x":3,
                    "y":-6
                },
                "3":{
                    "x":7,
                    "y":-3
                },
                "4":{
                    "x":1,
                    "y":-4
                },
                "5":{
                    "x":7,
                    "y":-2
                },
                "6":{
                    "x":0,
                    "y":-9
                },
                "7":{
                    "x":0,
                    "y":-11
                }
            };
            WING_MOUNT_RUN_OFFSET[2050080000012] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":0
                },
                "1":{
                    "x":4,
                    "y":-7
                },
                "2":{
                    "x":4,
                    "y":-3
                },
                "3":{
                    "x":5,
                    "y":3
                },
                "4":{
                    "x":3,
                    "y":-1
                },
                "5":{
                    "x":-2,
                    "y":1
                },
                "6":{
                    "x":-2,
                    "y":-2
                },
                "7":{
                    "x":0,
                    "y":-2
                }
            };
            WING_MOUNT_RUN_OFFSET[2050070000015] = {
                "wing":true,
                "0":{
                    "x":2,
                    "y":-4
                },
                "1":{
                    "x":0,
                    "y":-10
                },
                "2":{
                    "x":7,
                    "y":-2
                },
                "3":{
                    "x":-2,
                    "y":1
                },
                "4":{
                    "x":2,
                    "y":-2
                },
                "5":{
                    "x":2,
                    "y":0
                },
                "6":{
                    "x":-4,
                    "y":-1
                },
                "7":{
                    "x":-2,
                    "y":-7
                }
            };
            WING_MOUNT_RUN_OFFSET[2050080000015] = {
                "wing":true,
                "0":{
                    "x":4,
                    "y":0
                },
                "1":{
                    "x":-2,
                    "y":-1
                },
                "2":{
                    "x":1,
                    "y":1
                },
                "3":{
                    "x":2,
                    "y":4
                },
                "4":{
                    "x":-6,
                    "y":1
                },
                "5":{
                    "x":-5,
                    "y":0
                },
                "6":{
                    "x":-3,
                    "y":3
                },
                "7":{
                    "x":0,
                    "y":-1
                }
            };
            WING_MOUNT_RUN_OFFSET[2050070000013] = {
                "wing":true,
                "0":{
                    "x":0,
                    "y":-9
                },
                "1":{
                    "x":0,
                    "y":-12
                },
                "2":{
                    "x":0,
                    "y":-6
                },
                "3":{
                    "x":1,
                    "y":-4
                },
                "4":{
                    "x":5,
                    "y":-3
                },
                "5":{
                    "x":2,
                    "y":-2
                },
                "6":{
                    "x":1,
                    "y":-6
                },
                "7":{
                    "x":0,
                    "y":-10
                }
            };
            WING_MOUNT_RUN_OFFSET[2050080000013] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":-3
                },
                "1":{
                    "x":5,
                    "y":-9
                },
                "2":{
                    "x":9,
                    "y":-5
                },
                "3":{
                    "x":3,
                    "y":5
                },
                "4":{
                    "x":2,
                    "y":2
                },
                "5":{
                    "x":0,
                    "y":-1
                },
                "6":{
                    "x":-3,
                    "y":1
                },
                "7":{
                    "x":0,
                    "y":-5
                }
            };
            WING_MOUNT_RUN_OFFSET[2050070000014] = {
                "wing":true,
                "0":{
                    "x":1,
                    "y":-5
                },
                "1":{
                    "x":-2,
                    "y":-7
                },
                "2":{
                    "x":2,
                    "y":0
                },
                "3":{
                    "x":1,
                    "y":1
                },
                "4":{
                    "x":0,
                    "y":-1
                },
                "5":{
                    "x":0,
                    "y":0
                },
                "6":{
                    "x":-5,
                    "y":0
                },
                "7":{
                    "x":0,
                    "y":-7
                }
            };
            WING_MOUNT_RUN_OFFSET[2050080000014] = {
                "wing":true,
                "0":{
                    "x":3,
                    "y":0
                },
                "1":{
                    "x":4,
                    "y":-7
                },
                "2":{
                    "x":2,
                    "y":-3
                },
                "3":{
                    "x":1,
                    "y":4
                },
                "4":{
                    "x":0,
                    "y":2
                },
                "5":{
                    "x":-2,
                    "y":-1
                },
                "6":{
                    "x":0,
                    "y":-3
                },
                "7":{
                    "x":-1,
                    "y":-4
                }
            };
        }

        public function CreatureView()
        {
            initProp();
            addChildren();
            addVisibleTimer();
            addListener();
            Debug.refView(this);
            this.mouseEnabled = false;
        }

        private function tepeLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_3:String;
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if (_gameObject.mountState == GamePredef.MOUNT_STATE_ON)
            {
                _local_3 = ResManager.getResUrlNoHash(Number(_gameObject.decoBottomCodeOnMount));
            }
            else
            {
                _local_3 = ResManager.getResUrlNoHash(Number(_gameObject.decoBottomCode));
            };
            var _local_4:String = ResManager.hash(_local_3);
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", tepeLoadCompleteHandler);
            setTepeGraphic(_arg_1.target.current_complete_loader.content);
        }

        protected function wingLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if (!_gameObject)
            {
                return;
            };
            var _local_3:String = ResManager.getResUrlNoHash(_gameObject.wingResCode);
            var _local_4:String = ResManager.hash((_local_3 + "_NEW.swf"));
            if (_local_2.url.indexOf(_local_4) == -1)
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", wingLoadCompleteHandler);
            setWingGraphic(_arg_1.target.current_complete_loader.content);
        }

        public function stop():void
        {
            _gameObject.moveRoute = [];
            _gameObjMove.stop();
        }

        private function setFlyerGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.flyerResCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            dispatchEvent(new GameEvent(GameEvent.BEHAVIOR_CHANGE_TO_STOP));
            if (_flyer_cg)
            {
                this._body.removeChild(DisplayObject(_flyer_cg));
                _flyer_cg.unload();
                _flyer_cg = null;
            };
            if (_tepe_cg)
            {
                (_tepe_cg as DisplayObject).visible = false;
            };
            _flyer_cg = new CharactorGraphic(_local_3, (_arg_1 as MovieClip));
            if (((_cg) && (_flyer_cg)))
            {
                _flyer_cg.dir = _cg.dir;
                _flyer_cg.behavior = _cg.behavior;
                _flyer_cg.play(((_flyer_cg.dir + "-") + _flyer_cg.behavior));
                _flyer_cg.x = -(_flyer_cg.midX);
                _flyer_cg.y = -(_flyer_cg.footY);
            };
            if (doubleFly)
            {
                if (weddingFlyer)
                {
                    weddingFlyer.flyer = new FlyerView(_flyer_cg);
                    weddingFlyer.upFlyerPos();
                };
            }
            else
            {
                this._body.addChildAt(DisplayObject(_flyer_cg), 0);
            };
            if ((this is CharactorView))
            {
                var _local_4:* = this;
                (_local_4["setTitle"](_gameObject.t));
            };
        }

        public function moveToSafeArea():Boolean
        {
            var _local_1:Array;
            if (this.isWalking)
            {
                _local_1 = _core.move.getSafeRoute(_gameObjMove["xTo"], _gameObjMove["yTo"], _gameObject.mapData.safeX, _gameObject.mapData.safeY, _hitTestLayer);
            }
            else
            {
                _local_1 = _core.move.getSafeRoute(this.x, this.y, _gameObject.mapData.safeX, _gameObject.mapData.safeY, _hitTestLayer);
            };
            if (((_local_1) && (_local_1.length > 0)))
            {
                _gameObject.moveRoute = new Array();
                _gameObject.moveRoute.push(_local_1[(_local_1.length - 1)]);
                _core.remote.udcr({
                    "id":_gameObject.id,
                    "route":_local_1,
                    "x":posX,
                    "y":posY
                });
                walk(null);
                return (true);
            };
            return (false);
        }

        override public function set brightCode(_arg_1:Number):void
        {
            if (((this is BattleCreatureView) || (this is CharactorView)))
            {
                if (_cg)
                {
                    ResManager.setBrightCode(_cg, _arg_1);
                };
            }
            else
            {
                if (_sprite)
                {
                    ResManager.setBrightCode(_sprite, _arg_1);
                };
            };
        }

        protected function setFemalStatePos():void
        {
            if (_sprite)
            {
                stateSprite.x = -14;
                stateSprite.y = ((_sprite.y - _sprite.bodyHeight) - 5);
            };
        }

        protected function actionOnCreature(_arg_1:MouseEvent, _arg_2:int):void
        {
            if (((((this._gameObject) && (this._gameObject.hasOwnProperty("dotaData"))) && (!(this._gameObject.dotaData.isDead))) && (!(this._gameObject.dotaData.isBattle))))
            {
                _core.remote.call("dotaPlayerVSNPC", null, this._gameObject.dotaData.index);
            };
        }

        protected function setName():void
        {
            var _local_1:Charactor;
            if (((_gameObject.hasOwnProperty("gmLevel")) && (_gameObject.gmLevel > 0)))
            {
                _namePrefix = "GM-";
                _textName.textColor = 0xFF00;
            }
            else
            {
                _namePrefix = "";
            };
            _textName.text = (_namePrefix + _gameObject.name);
            if ((this is PetView))
            {
                _local_1 = (_core.getCharactor(_gameObject.cid) as Charactor);
                if (_local_1)
                {
                    _textName.htmlText = ((((("<p align='center'>" + ToolKit.getColorTxt("#FFFF00", _gameObject.name)) + "</p>") + "<p align='center'>") + ToolKit.getColorTxt("#00FF00", ("\n" + Language.CREATURE_VIEW_U[0].replace("{name}", _local_1.name)))) + "</p>");
                };
            };
            _textName.x = (-(_textName.textWidth) / 2);
        }

        public function removeFootprintView(_arg_1:Event):void
        {
            _footprint_count = 0;
            removeEventListener(Event.ENTER_FRAME, onSetFootprintView);
        }

        public function clearDoubleFlyFlag():void
        {
            doubleFly = false;
            if (weddingFlyer)
            {
                clearWeddingFlyer();
            };
            if (_gameObject)
            {
                var _local_1:* = this;
                (_local_1["setTitle"](_gameObject.t));
            };
        }

        protected function unloadAll():void
        {
            _frontEffLoader.unload();
            _skillEffLoader.unload();
            _buffEffLoader.unload();
            _emotionLoader.unload();
            stateUnload();
        }

        public function walkTo(_arg_1:int, _arg_2:int):void
        {
            if (_gameObject)
            {
                _gameObject.walkTo(_arg_1, _arg_2);
            };
        }

        private function loadDefaultRes():void
        {
            if (((this is CharactorView) || (this is CreatureShowView)))
            {
                loadCharactorRes();
            }
            else
            {
                if (_defaultResLoader == null)
                {
                    _defaultResLoader = new Loader10();
                };
                _defaultResLoader.visible = false;
                _defaultResLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, defaultResComplete);
                _defaultResLoader.loadBytes(new ResManager.DEFAULT_CRE());
            };
        }

        public function setTepeGraphic(_arg_1:Object):void
        {
            var _local_2:String;
            if (_gameObject.mountState == GamePredef.MOUNT_STATE_ON)
            {
                _local_2 = ResManager.getResUrlNoHash(Number(_gameObject.decoBottomCodeOnMount));
            }
            else
            {
                _local_2 = ResManager.getResUrlNoHash(Number(_gameObject.decoBottomCode));
            };
            var _local_3:String = ResManager.hash(_local_2);
            if (_tepe_cg)
            {
                _body.removeChild(DisplayObject(_tepe_cg));
                _tepe_cg.unload();
                _tepe_cg = null;
            };
            _tepe_cg = new DecorateGraphic(_local_3, (_arg_1 as MovieClip), 225, 181);
            (_tepe_cg as Sprite).mouseEnabled = false;
            _body.addChildAt(DisplayObject(_tepe_cg), 0);
            _tepe_cg.x = -113;
            _tepe_cg.y = -86;
        }

        private function roundMaskLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            var _local_3:String = ResManager.getResUrlNoHash(Number(_gameObject.decoLightMaskCode));
            var _local_4:String = ResManager.hash(_local_3);
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", roundMaskLoadCompleteHandler);
            setRoundMaskGraphic(_arg_1.target.current_complete_loader.content);
        }

        public function equipOn(_arg_1:Number, _arg_2:int, _arg_3:Boolean, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=true):void
        {
            var _local_7:String;
            var _local_8:String;
            var _local_9:Object;
            if (!_arg_6)
            {
                return;
            };
            if (_arg_5)
            {
                colorCode = 0;
            };
            if (((((_arg_1 > 0) && (_weaponLoader)) && ((isDefaultRes()) || (isRebirthRes()))) && (!(_arg_5))))
            {
                _local_7 = (ResManager.getResUrlNoHash(_arg_1) + "_NEW.swf");
                _local_8 = ResManager.hash(_local_7);
                _local_9 = ResCacher.getInstance().getRes(_local_8);
                if (_local_9 == null)
                {
                    ResCacher.getInstance().addEventListener("complete", weaponLoadCompleteHandler);
                }
                else
                {
                    setWeaponGraphic(_local_9, _local_8, _arg_2, _arg_3, _arg_4);
                };
            };
        }

        public function getNameTextColor():uint
        {
            return (_textName.textColor);
        }

        private function haloLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            var _local_3:String = ResManager.getResUrlNoHash(Number(_gameObject.decoHeadCode));
            var _local_4:String = ResManager.hash(_local_3);
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", haloLoadCompleteHandler);
            setHaloGraphic(_arg_1.target.current_complete_loader.content);
        }

        public function switchFlyingView():void
        {
            var _local_1:StageMain = StageMain(_core.view.getUI(ViewManager.STAGE_MAIN));
            var _local_2:Boolean = Boolean(Number(GamePredef.GLOBAL_SETTING["flyEffect"]));
            _local_1.applyZoomEffect(((_local_2) ? 0.7 : 1));
            var _local_3:Object = this;
            _local_3.updateUI();
            if (((doubleFly) && (weddingFlyer)))
            {
                weddingFlyer.upFlyerPos();
            };
        }

        private function setColor():void
        {
            var _local_1:int = _gameObject.colorCode;
            if (_gameObject.type == GamePredef.TBL_CHARACTOR)
            {
                if (_gameObject.dressResCode > 0)
                {
                    _local_1 = 0;
                };
            };
            colorCode = _local_1;
            brightCode = _gameObject.brightCode;
        }

        public function roundOn():void
        {
            if (((((!(_gameObject)) || (!(_gameObject.decoLightCode))) || (isNaN(_gameObject.decoLightCode))) || (Number(_gameObject.decoLightCode) <= 0)))
            {
                return;
            };
            var _local_1:String = ResManager.getResUrlNoHash(Number(_gameObject.decoLightCode));
            var _local_2:String = ResManager.hash(_local_1);
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (!_local_3)
            {
                ResCacher.getInstance().addEventListener("complete", roundLoadCompleteHandler);
            }
            else
            {
                setRoundGraphic(_local_3);
            };
        }

        public function emotionHide(_arg_1:Event=null):void
        {
            if (_emotionLoader)
            {
                _emotionLoader.unload();
            };
        }

        protected function timerHandler(_arg_1:TimerEvent):void
        {
            checkVisible(_arg_1);
        }

        protected function checkVisible(_arg_1:TimerEvent):void
        {
            if (((((!(_deleted)) && (inScreen)) && (!(_core.state == GamePredef.ST_CORE_BATTLE))) && (container.numChildren < GamePredef.GLOBAL_SETTING.maxView)))
            {
                visible = true;
                if (spriteStoped)
                {
                    spriteStoped = false;
                    if ((this is CharactorView))
                    {
                        if ((((_core.player) && (_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)) && (_gameObject.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)))
                        {
                            this.scaleX = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                            this.scaleY = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                        }
                        else
                        {
                            this.scaleX = 1;
                            this.scaleY = 1;
                        };
                    }
                    else
                    {
                        if (_sprite)
                        {
                            _sprite.play();
                        };
                        if (_weapon)
                        {
                            _weapon.play();
                        };
                    };
                };
            }
            else
            {
                visible = false;
                spriteStoped = true;
                if (!(this is CharactorView))
                {
                    if (_sprite)
                    {
                        _sprite.stop();
                    };
                    if (_weapon)
                    {
                        _weapon.stop();
                    };
                };
            };
        }

        public function behavior(_arg_1:int, _arg_2:int=0):void
        {
            var _local_4:int;
            var _local_5:int;
            if ((((this is CharactorView) && (!(_gameObject.mountState == GamePredef.MOUNT_STATE_OFF))) && (_mount_cg)))
            {
                switch (_arg_1)
                {
                    case AbstractGameRes.BH_BREATH_SLOW:
                        _arg_1 = AbstractGameRes.BH_BREATH_MOUNT;
                        break;
                    case AbstractGameRes.BH_RUN_FAST:
                        _arg_1 = AbstractGameRes.BH_RUN_FAST_MOUNT;
                        break;
                    case AbstractGameRes.BH_RUN_NORMAL:
                        _arg_1 = AbstractGameRes.BH_RUN_NORMAL_MOUNT;
                        break;
                };
                _local_4 = _mount_cg.behavior;
                _mount_cg.behavior = _arg_1;
                if (_local_4 != _arg_1)
                {
                    if (this.isWalking == false)
                    {
                        _mount_cg.play(((_mount_cg.dir + "-") + _mount_cg.behavior));
                    };
                };
            };
            var _local_3:int = (_arg_1 % 8);
            if (_gameObject.flyingState != GamePredef.FLYING_STATE_ON_GROUND)
            {
                if (_flyer_cg)
                {
                    _flyer_cg.behavior = _local_3;
                    _flyer_cg.play(((_flyer_cg.dir + "-") + _flyer_cg.behavior));
                    if (_flyer_front)
                    {
                        _flyer_front.behavior = _local_3;
                        _flyer_front.dir = _flyer_cg.dir;
                        _flyer_front.play(((_flyer_front.dir + "-") + AbstractGameRes.BH_BREATH_SLOW));
                    };
                };
                if (_arg_1 == AbstractGameRes.BH_RUN_NORMAL)
                {
                    _arg_1 = AbstractGameRes.BH_BREATH_SLOW;
                };
                if (_arg_1 == AbstractGameRes.BH_RUN_NORMAL_MOUNT)
                {
                    _arg_1 = AbstractGameRes.BH_BREATH_MOUNT;
                };
            };
            if (((this is CharactorView) && (!(this is BattleCreatureView))))
            {
                if (!_cg)
                {
                    return;
                };
                _local_5 = _cg.behavior;
                if (_local_5 == _arg_1)
                {
                    return;
                };
                if (((((_arg_1 == AbstractGameRes.BH_RUN_FAST) || (_arg_1 == AbstractGameRes.BH_RUN_NORMAL)) || (_arg_1 == AbstractGameRes.BH_RUN_FAST_MOUNT)) || (_arg_1 == AbstractGameRes.BH_RUN_NORMAL_MOUNT)))
                {
                    dispatchEvent(new GameEvent(GameEvent.BEHAVIOR_CHANGE_TO_RUN));
                };
                if (((_arg_1 == AbstractGameRes.BH_BREATH_SLOW) || (_arg_1 == AbstractGameRes.BH_BREATH_MOUNT)))
                {
                    dispatchEvent(new GameEvent(GameEvent.BEHAVIOR_CHANGE_TO_STOP));
                };
            };
            if (((this is CharactorView) || (this is BattleCreatureView)))
            {
                if (!_cg)
                {
                    return;
                };
                _local_5 = _cg.behavior;
                if (_local_5 == _arg_1)
                {
                    return;
                };
                _cg.behavior = _arg_1;
                if (this.isWalking == false)
                {
                    _cg.play(((_cg.dir + "-") + _cg.behavior));
                };
            }
            else
            {
                if (_sprite == null)
                {
                    return;
                };
                _local_5 = _sprite.behavior;
                if (_local_5 == _arg_1)
                {
                    return;
                };
                _sprite.behavior = _arg_1;
            };
            if (_weapon_cg)
            {
                _weapon_cg.behavior = _arg_1;
                if (_gameObject.flyingState != GamePredef.FLYING_STATE_ON_GROUND)
                {
                    _weapon_cg.behavior = (_arg_1 % 8);
                };
                if (this.isWalking == false)
                {
                    _weapon_cg.play(((_weapon_cg.dir + "-") + _weapon_cg.behavior));
                };
            };
            if (_wing_cg)
            {
                if (((_local_5 == AbstractGameRes.BH_RUN_NORMAL) && (wing_run_lastTune)))
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                    wing_run_lastTune = null;
                }
                else
                {
                    if (_local_5 == AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = true;
                    };
                };
                if ((((_arg_1 == AbstractGameRes.BH_RUN_NORMAL) && (WING_RUN_OFFSET[_gameObject.resCode])) && (WING_RUN_OFFSET[_gameObject.resCode].wing)))
                {
                    wing_run_lastTune = WING_RUN_OFFSET[_gameObject.resCode][_wing_cg.dir];
                    _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
                };
                if ((((_arg_1 == AbstractGameRes.BH_BREATH_MOUNT) && (WING_MOUNT_CLASS_OFFSET[_gameObject.resCode])) && (WING_MOUNT_CLASS_OFFSET[_gameObject.resCode].wing)))
                {
                    if (wing_run_lastTune)
                    {
                        _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                        _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                    };
                    wing_run_lastTune = WING_MOUNT_CLASS_OFFSET[_gameObject.resCode][_wing_cg.dir];
                    _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
                };
                if (((((_arg_1 == AbstractGameRes.BH_RUN_NORMAL_MOUNT) || (_arg_1 == AbstractGameRes.BH_RUN_FAST_MOUNT)) && (WING_MOUNT_RUN_OFFSET[_gameObject.resCode])) && (WING_MOUNT_RUN_OFFSET[_gameObject.resCode].wing)))
                {
                    if (wing_run_lastTune)
                    {
                        _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                        _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                    };
                    wing_run_lastTune = WING_MOUNT_RUN_OFFSET[_gameObject.resCode][_wing_cg.dir];
                    _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
                }
                else
                {
                    if (_arg_1 == AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = false;
                    };
                };
            };
            if (_arg_2 > 0)
            {
                setTimeout(behavior, _arg_2, _local_5);
            };
        }

        protected function weaponLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if ((((_gameObject == null) || (_gameObject.wp == null)) || (_local_2.url.indexOf(ResManager.hash((ResManager.getResUrlNoHash(_gameObject.wp) + "_NEW.swf"))) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", weaponLoadCompleteHandler);
            setWeaponGraphic(_arg_1.target.current_complete_loader.content, _arg_1.target.current_complete_loader.url.substring(-36));
        }

        public function stopFollow():void
        {
            removeEventListener(Event.ENTER_FRAME, followHandler);
            _frontC = null;
        }

        public function emotion(_arg_1:Number):void
        {
            if (((this is CharactorView) || (this is BattleCreatureView)))
            {
                if (_arg_1 > 0)
                {
                    _emotionLoader.load(new URLRequest(ResManager.getResUrl(_arg_1)));
                    _emotionLoader.x = -20;
                    _emotionLoader.y = -120;
                    if (!_emTimer)
                    {
                        _emTimer = new Timer(EMOTION_DELAY, 1);
                        _emTimer.addEventListener(TimerEvent.TIMER, emotionHide);
                    };
                    _emTimer.reset();
                    _emTimer.start();
                };
            };
        }

        public function flyerOn():void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:String;
            if ((((!(_gameObject)) || (isNaN(_gameObject.flyerResCode))) || (_gameObject.flyerResCode <= 0)))
            {
                return;
            };
            var _local_1:String = ResManager.getResUrlNoHash(_gameObject.flyerResCode);
            var _local_2:String = ResManager.hash((_local_1 + "_NEW.swf"));
            _local_3 = ResCacher.getInstance().getRes(_local_2);
            if (_local_3 == null)
            {
                ResCacher.getInstance().addEventListener("complete", flyerLoadCompleteHandler);
            }
            else
            {
                setFlyerGraphic(_local_3);
            };
            if (((_gameObject.flyerFrontResCode) && (_gameObject.flyerFrontResCode > 0)))
            {
                _local_4 = ResManager.getResUrlNoHash(_gameObject.flyerFrontResCode);
                _local_5 = ResManager.hash((_local_4 + "_NEW.swf"));
                _local_3 = ResCacher.getInstance().getRes(_local_5);
                if (_local_3 == null)
                {
                    ResCacher.getInstance().addEventListener("complete", flyerFrontLoadComplete);
                }
                else
                {
                    setFlyerFrontGraphic(_local_3);
                };
            };
        }

        public function clearWeddingFlyer():void
        {
            weddingFlyer.removeFlyer();
            weddingFlyer = null;
        }

        protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
            if (((_cg) && (!(_cg.hitTestPoint(_arg_1.localX, _arg_1.localY, true)))))
            {
                return;
            };
            if (!((((_gameObject) && (_gameObject.type == 35)) && (_gameObject.nid)) && (_gameObject.nid == 2364)))
            {
                _arg_1.stopImmediatePropagation();
            };
            if (_arg_1.shiftKey)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).addLink(LinkEncode.encode(_gameObject.type, _gameObject.id, _gameObject.name));
            };
            if (_core.view.actionState != GamePredef.ACTION_NONE)
            {
                actionOnCreature(_arg_1, _core.view.actionState);
                _core.view.restoreUI();
            };
        }

        public function stepTo(_arg_1:Point):void
        {
            if (((this is CharactorView) || (this is BattleCreatureView)))
            {
                if (!_cg)
                {
                    return;
                };
                if (((!(_cg.behavior == AbstractGameRes.BH_RUN_NORMAL)) || (!(_cg.behavior == AbstractGameRes.BH_RUN_NORMAL_MOUNT))))
                {
                    behavior(AbstractGameRes.BH_RUN_NORMAL);
                };
            }
            else
            {
                if (!_sprite)
                {
                    return;
                };
                if (((!(_sprite.behavior == AbstractGameRes.BH_RUN_NORMAL)) || (!(_sprite.behavior == AbstractGameRes.BH_RUN_NORMAL_MOUNT))))
                {
                    behavior(AbstractGameRes.BH_RUN_NORMAL);
                };
            };
            _gameObject.dir = ToolKit.getDir(_arg_1.x, _arg_1.y, _gameObject.dir);
            faceTo(_gameObject.dir);
            x = (x + _arg_1.x);
            y = (y + _arg_1.y);
            if (_core.player.view == this)
            {
                _core.player.posX = x;
                _core.player.posY = y;
            };
            _followOldPoint = new Point(posX, posY);
            swapDepth(_arg_1.y);
        }

        protected function followHandler(event:Event):void
        {
            var delayTime:Number;
            var pm:Point;
            var pc:Point;
            var len:Number;
            var distance:Number;
            var xDis:Number;
            var yDis:Number;
            var dx:Number;
            var dy:Number;
            var dp:Point;
            var now:Number = new Date().getTime();
            var _nSpeed:Number = _speed;
            if (_last_enter_time)
            {
                delayTime = (now - _last_enter_time);
                if (delayTime <= 40)
                {
                    _nSpeed = ((_speed * delayTime) * 0.025);
                };
            };
            _last_enter_time = now;
            if (!_frontC)
            {
                return;
            };
            if (doubleFly)
            {
                return;
            };
            try
            {
                pm = new Point(posX, posY);
                pc = new Point(_frontC.posX, _frontC.posY);
                len = Point.distance(pm, pc);
                distance = GamePredef.GROUP_FOLLOW_DISTANCE;
                if (this._gameObject.flyingState != GamePredef.FLYING_STATE_ON_GROUND)
                {
                    distance = GamePredef.GROUP_FOLLOW_DISTANCE_FLYING;
                };
                if (len > distance)
                {
                    xDis = (_frontC.posX - posX);
                    yDis = (_frontC.posY - posY);
                    dx = ((_nSpeed * xDis) / len);
                    dy = ((_nSpeed * yDis) / len);
                    dp = new Point(dx, dy);
                    stepTo(dp);
                }
                else
                {
                    if (((!(_followOldPoint == null)) && (_followOldPoint.equals(pm))))
                    {
                        behavior(AbstractGameRes.BH_BREATH_SLOW);
                    };
                };
            }
            catch(e)
            {
                Alert.show("followHandler exception");
            };
        }

        public function weddingFlyerOn():void
        {
            flyerOn();
        }

        public function setRoundMaskGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(Number(_gameObject.decoLightMaskCode));
            var _local_3:String = ResManager.hash(_local_2);
            if (_round_mask_cg)
            {
                _body.removeChild(DisplayObject(_round_mask_cg));
                _round_mask_cg.unload();
                _round_mask_cg = null;
            };
            _round_mask_cg = new DecorateGraphic(_local_3, (_arg_1 as MovieClip), 192, 194);
            (_round_mask_cg as Sprite).mouseEnabled = false;
            _body.addChildAt(DisplayObject(_round_mask_cg), 0);
            _round_mask_cg.x = -95;
            _round_mask_cg.y = -150;
        }

        protected function addListener():void
        {
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            _resLoader.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
            _resLoader.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
            _resLoader.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            _defaultResLoader.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
            _defaultResLoader.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
            _defaultResLoader.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            _gameObjMove.addEventListener(TimerMove.EFFECT_END, walk);
            _gameObjMove.addEventListener(TimerMove.EFFECT_UPDATE, onWalking);
            addLoaderListener(_frontEffLoader.contentLoaderInfo);
            addLoaderListener(_attackEffLoader.contentLoaderInfo);
            addLoaderListener(_skillEffLoader.contentLoaderInfo);
            addLoaderListener(_buffEffLoader.contentLoaderInfo);
            addLoaderListener(_emotionLoader.contentLoaderInfo);
        }

        private function ioErrorHandler(_arg_1:IOErrorEvent):void
        {
            trace(("ioErrorHandler: " + _arg_1));
        }

        public function fixedMountRelPos():void
        {
            if (_wing_cg)
            {
                _wing_cg.y = (_wing_cg.y + mountHeight);
                if (wing_run_lastTune)
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                };
            };
            if (fairyManager)
            {
                fairyManager.posY = (fairyManager.posY + mountHeight);
            };
            if (this["_leaderFlag"])
            {
                this["_leaderFlag"].y = (this["_leaderFlag"].y + mountHeight);
            };
            mountHeight = 0;
        }

        public function get posX():int
        {
            return (x);
        }

        public function behaviorForFlying(_arg_1:int):void
        {
            if (!_cg)
            {
                return;
            };
            var _local_2:int = _cg.behavior;
            if (_local_2 == _arg_1)
            {
                return;
            };
            if (_mount_cg)
            {
                this.behavior(_arg_1);
            }
            else
            {
                _cg.behavior = _arg_1;
                _cg.play(((_cg.dir + "-") + _cg.behavior));
            };
            if (_weapon_cg)
            {
                _weapon_cg.behavior = _arg_1;
                _weapon_cg.play(((_weapon_cg.dir + "-") + _weapon_cg.behavior));
            };
            if (_wing_cg)
            {
                if (((_local_2 == AbstractGameRes.BH_RUN_NORMAL) && (wing_run_lastTune)))
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                    wing_run_lastTune = null;
                }
                else
                {
                    if (_local_2 == AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = true;
                    };
                };
                if ((((_arg_1 == AbstractGameRes.BH_RUN_NORMAL) && (WING_RUN_OFFSET[_gameObject.resCode])) && (WING_RUN_OFFSET[_gameObject.resCode].wing)))
                {
                    wing_run_lastTune = WING_RUN_OFFSET[_gameObject.resCode][_wing_cg.dir];
                    _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
                }
                else
                {
                    if (_arg_1 == AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = false;
                    };
                };
            };
        }

        public function createWeddingFlyer():void
        {
            weddingFlyer = new DoubleFlyerManager();
        }

        protected function flyerFrontLoadComplete(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            var _local_3:String = ResManager.getResUrlNoHash(_gameObject.flyerFrontResCode);
            var _local_4:String = ResManager.hash((_local_3 + "_NEW.swf"));
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", flyerFrontLoadComplete);
            setFlyerFrontGraphic(_arg_1.target.current_complete_loader.content);
        }

        protected function setPos(_arg_1:Point):void
        {
            posX = _arg_1.x;
            posY = _arg_1.y;
        }

        private function initProp():void
        {
            _core = Core.getInstance();
            _resLoader = new Loader10();
            _weaponLoader = new Loader10();
            _defaultResLoader = new Loader10();
            _frontEffLoader = new Loader10();
            _attackEffLoader = new Loader10();
            _skillEffLoader = new Loader10();
            _buffEffLoader = new Loader10();
            _emotionLoader = new Loader10();
            _body = new Sprite();
            stateSprite = new Sprite();
            _textName = new RoundedText();
            _textName.textColor = 0xFFFF00;
            _textName.y = 10;
            _popup = new PopupText();
            _shadow = new ((ResManager.VIEW_SHADOW as Class))();
            _gameObjMove = new EnterFrameMove();
            _gameObjMove.stepLength = _speed;
            _gameObjMove.target = this;
            _gameObjMove.updateFunc = onWalking;
            _speed = MOVE_SPEED_NORMAL;
            _isBattleView = false;
            _namePrefix = "";
            buttonMode = true;
            useHandCursor = true;
        }

        public function get defaultCg():Loader10
        {
            return (_defaultResLoader);
        }

        public function setMonutFrontGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.mountFrontResCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            if (_mount_front)
            {
                _body.removeChild(DisplayObject(_mount_front));
                _mount_front.unload();
                _mount_front = null;
            };
            if (!_local_3)
            {
                return;
            };
            _mount_front = new CharactorGraphic(_local_3, (_arg_1 as MovieClip));
            if (((_cg) && (_mount_front)))
            {
                _mount_front.dir = _cg.dir;
                _mount_front.behavior = _cg.behavior;
                _mount_front.play(((_mount_cg.dir + "-") + _mount_cg.behavior));
                _mount_front.x = -(_mount_cg.midX);
                _mount_front.y = -(_mount_cg.footY);
            };
            _body.addChild(DisplayObject(_mount_front));
        }

        public function get state():int
        {
            return (_state);
        }

        protected function onWalking(_arg_1:Event=null):void
        {
            if (((parent == null) || (parent.parent == null)))
            {
                return;
            };
            swapDepth((posY - _gameObject.posY));
            updateObjectPos();
        }

        public function get posY():int
        {
            return (y);
        }

        protected function mouseOutHandler(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
            if (_resLoader)
            {
                _resLoader.filters = [];
            };
        }

        private function setWingGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.wingResCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            wing_stand_lastTune = null;
            wing_run_lastTune = null;
            if (_wing_cg)
            {
                this._body.removeChild(DisplayObject(_wing_cg));
                _wing_cg.unload();
                _wing_cg = null;
            };
            _wing_cg = new CharactorGraphic(_local_3, (_arg_1 as MovieClip), true);
            _wing_cg.mouseEnabled = false;
            if (((_cg) && (_wing_cg)))
            {
                _wing_cg.dir = _cg.dir;
                _wing_cg.behavior = AbstractGameRes.BH_BREATH_FAST;
                _wing_cg.play(((_wing_cg.dir + "-") + _wing_cg.behavior));
                _wing_cg.x = -(_wing_cg.midX);
                _wing_cg.y = -(_wing_cg.footY);
            };
            _body.addEventListener(MouseEvent.MOUSE_DOWN, bodyMouseDown);
            this._body.addChildAt(DisplayObject(_wing_cg), 0);
            coordinateWingPos();
            if (_mount_cg)
            {
                _wing_cg.y = (_wing_cg.y - mountHeight);
            };
        }

        public function get centerY():int
        {
            return (_core.view.getUI(ViewManager.STAGE_MAIN).centerY);
        }

        public function mountOff():void
        {
            if (_weapon_cg)
            {
                _weapon_cg.visible = true;
            };
            if (_mount_cg)
            {
                if (_body.contains(DisplayObject(_mount_cg)))
                {
                    _body.removeChild(DisplayObject(_mount_cg));
                };
                _mount_cg.unload();
                _mount_cg = null;
                if (((_cg) && (_cg.behavior >= 8)))
                {
                    _cg.behavior = (_cg.behavior - 8);
                };
                ((_cg) && (_cg.play(((_cg.dir + "-") + _cg.behavior))));
                fixedMountRelPos();
            };
            if (_mount_front)
            {
                if (_body.contains(DisplayObject(_mount_front)))
                {
                    _body.removeChild(DisplayObject(_mount_front));
                };
                _mount_front.unload();
                _mount_front = null;
            };
            _gameObject.mountState = GamePredef.MOUNT_STATE_OFF;
            if (_halo_cg)
            {
                haloOn();
            };
        }

        public function get centerX():int
        {
            return (_core.view.getUI(ViewManager.STAGE_MAIN).centerX);
        }

        public function fairyOn():void
        {
            if (((((!(_gameObject)) || (!(_gameObject.fairy))) || (isNaN(_gameObject.fairy.resCode))) || (_gameObject.fairy.resCode <= 0)))
            {
                return;
            };
            var _local_1:String = ResManager.getResUrlNoHash(_gameObject.fairy.resCode);
            var _local_2:String = ResManager.hash((_local_1 + "_NEW.swf"));
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (_local_3 == null)
            {
                ResCacher.getInstance().addEventListener("complete", fairyLoadCompleteHandler);
            }
            else
            {
                setFairyGraphic(_local_3);
            };
        }

        public function set flyerGuest(_arg_1:CharactorView):void
        {
            if (!_frontC)
            {
                addEventListener("add_leader", memSetLeader);
                return;
            };
            if (!_frontC.weddingFlyer)
            {
                _frontC.createWeddingFlyer();
            };
            _frontC.weddingFlyer.guest = _arg_1;
            var _local_2:* = this;
            (_local_2["setTitle"](_gameObject.t));
        }

        public function startFollow(_arg_1:CreatureView):void
        {
            if (_deleted)
            {
                return;
            };
            addEventListener(Event.ENTER_FRAME, followHandler);
            _frontC = _arg_1;
            if (doubleFly)
            {
                dispatchEvent(new Event("add_leader"));
            };
        }

        public function tepeOn():void
        {
            var _local_1:String;
            if (((!(_gameObject)) || ((((!(_gameObject.decoBottomCode)) || (isNaN(_gameObject.decoBottomCode))) || (Number(_gameObject.decoBottomCode) <= 0)) && (((!(_gameObject.decoBottomCodeOnMount)) || (isNaN(_gameObject.decoBottomCodeOnMount))) || (Number(_gameObject.decoBottomCodeOnMount) <= 0)))))
            {
                return;
            };
            if (_gameObject.mountState == GamePredef.MOUNT_STATE_ON)
            {
                _local_1 = ResManager.getResUrlNoHash(Number(_gameObject.decoBottomCodeOnMount));
            }
            else
            {
                _local_1 = ResManager.getResUrlNoHash(Number(_gameObject.decoBottomCode));
            };
            var _local_2:String = ResManager.hash(_local_1);
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (!_local_3)
            {
                ResCacher.getInstance().addEventListener("complete", tepeLoadCompleteHandler);
            }
            else
            {
                setTepeGraphic(_local_3);
            };
        }

        protected function footprintLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            var _local_3:String = ResManager.getResUrlNoHash(Number(_gameObject.decoFootCode));
            var _local_4:String = ResManager.hash(_local_3);
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", footprintLoadCompleteHandler);
            _footprint = _arg_1.target.current_complete_loader.content;
            addEventListener(Event.ENTER_FRAME, onSetFootprintView);
        }

        private function setFlyerFrontGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.flyerFrontResCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            if (_flyer_front)
            {
                this._body.removeChild(DisplayObject(_flyer_front));
                _flyer_front.unload();
                _flyer_front = null;
            };
            if (_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
            {
                return;
            };
            if (_local_3)
            {
                _flyer_front = new CharactorGraphic(_local_3, (_arg_1 as MovieClip));
                if (((_cg) && (_flyer_front)))
                {
                    _flyer_front.dir = _cg.dir;
                    _flyer_front.behavior = _cg.behavior;
                    _flyer_front.play(((_flyer_front.dir + "-") + _flyer_front.behavior));
                    _flyer_front.x = -(_flyer_front.midX);
                    _flyer_front.y = -(_flyer_front.footY);
                };
                if (doubleFly)
                {
                    if (weddingFlyer)
                    {
                        weddingFlyer.flyerFront = new FlyerView(_flyer_front);
                        weddingFlyer.upFlyerPos();
                    };
                }
                else
                {
                    this._body.addChild(DisplayObject(_flyer_front));
                };
            };
        }

        public function fadeIn():void
        {
            var _local_1:Fade = new Fade(this);
            _local_1.alphaFrom = 0;
            _local_1.alphaTo = 1;
            _local_1.duration = 1000;
            _local_1.play();
        }

        protected function setFeMaleState():void
        {
            var _local_1:Number;
            var _local_2:int;
            var _local_3:*;
            var _local_4:Object;
            if (((isFeMaleState(_gameObject.t)) && (_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND)))
            {
                _local_1 = Number(_gameObject.t);
                _local_2 = -1;
                switch (_local_1)
                {
                    case GamePredef.FEMALE_TITLE_1:
                        _local_2 = GamePredef.ST_F4;
                        break;
                    case GamePredef.FEMALE_TITLE_2:
                        _local_2 = GamePredef.ST_F3;
                        break;
                    case GamePredef.FEMALE_TITLE_3:
                        _local_2 = GamePredef.ST_F2;
                        break;
                    case GamePredef.FEMALE_TITLE_4:
                        _local_2 = GamePredef.ST_F1;
                        break;
                    default:
                        return;
                };
                _local_3 = new (ResManager.STATE_ICON[_local_2])();
                _local_3.width = 32;
                _local_3.height = 32;
                stateSprite.addChild(_local_3);
                setFemalStatePos();
                stateSprite.visible = true;
                _local_4 = _gameObject.decoInfo;
                if (((((_local_4) && (_local_4[2])) && (Number(_local_4[2]["did"]))) && (Number(_local_4[2]["isShow"]))))
                {
                    stateSprite.visible = false;
                };
            }
            else
            {
                stateUnload();
            };
        }

        private function bulletHitHandler(_arg_1:Event):void
        {
            var _local_2:Object;
            _arg_1.currentTarget.removeEventListener(EnterFrameMove.EFFECT_END, bulletHitHandler);
            if (_isBattleView)
            {
                _local_2 = _core.view.getUI(ViewManager.STAGE_BATTLE);
            }
            else
            {
                _local_2 = _core.view.getUI(ViewManager.STAGE_MAIN);
            };
            if (_local_2.frontEffectLayer.contains(_arg_1.currentTarget.target))
            {
                _local_2.frontEffectLayer.removeChild(_arg_1.currentTarget.target);
            };
            behaviorEnd();
        }

        protected function setFairyGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.fairy.resCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            if (_fairy_cg)
            {
                _fairy_cg.unload();
                _fairy_cg = null;
            };
            _fairy_cg = new CharactorGraphic(_local_3, (_arg_1 as MovieClip));
            if (!fairyManager)
            {
                fairyOff();
            };
            fairyManager = new FairyView(_fairy_cg);
            var _local_4:DisplayObjectContainer = ((this.container) || (this.parent));
            if (_local_4)
            {
                _local_4.addChild(fairyManager);
                fairyManager.host = this;
                fairyManager.x = this.x;
                fairyManager.y = this.y;
                if (_gameObject.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)
                {
                    fairyManager.isFlying = true;
                }
                else
                {
                    fairyManager.isFlying = false;
                };
            }
            else
            {
                Alert.show("角色的container未找到");
            };
            if (_mount_cg)
            {
                fairyManager.y = (fairyManager.y - mountHeight);
            };
        }

        private function clearStateImg():void
        {
            stateUnload();
        }

        public function playFlying(isTakingOff:Boolean, zoomMap:Boolean, zoomCharacter:Boolean):void
        {
            var thisView:Object;
            var callbackFunc:Function;
            var _stage:StageMain;
            var zoomRate:Number;
            var zoomStep:Number;
            var doZoom:Function;
            var defaultFunc:Function;
            stopPlayingFlyingEffect();
            thisView = this;
            var directionMultiplier:int = 1;
            if (isTakingOff)
            {
                directionMultiplier = -1;
            };
            flyingEffect = new EnterFrameMove();
            flyingEffect.target = this._body;
            flyingEffect.stepLength = 2;
            flyingEffect.xBy = 0;
            flyingEffect.yBy = (directionMultiplier * GamePredef.FLIGHT_HEIGHT);
            thisView = this;
            if (zoomMap)
            {
                _stage = StageMain(_core.view.getUI(ViewManager.STAGE_MAIN));
                if (isTakingOff)
                {
                    zoomRate = 1;
                    zoomStep = Math.pow((GamePredef.C_FLYING_ZOOM_RATE / 1), 0.02);
                }
                else
                {
                    zoomRate = GamePredef.C_FLYING_ZOOM_RATE;
                    zoomStep = Math.pow((1 / GamePredef.C_FLYING_ZOOM_RATE), 0.02);
                };
                doZoom = function ():void
                {
                    zoomRate = (zoomRate * zoomStep);
                    var _local_1:Boolean = Boolean(Number(GamePredef.GLOBAL_SETTING["flyEffect"]));
                    _stage.applyZoomEffect(((_local_1) ? zoomRate : 1));
                    thisView.updateUI();
                    if (((doubleFly) && (weddingFlyer)))
                    {
                        weddingFlyer.upFlyerPos();
                    };
                };
                flyingEffect.updateFunc = doZoom;
            }
            else
            {
                if (zoomCharacter)
                {
                    if (isTakingOff)
                    {
                        zoomRate = 1;
                        zoomStep = Math.pow((GamePredef.C_FLYING_PLAYER_ZOOM_RATE / GamePredef.C_FLYING_ZOOM_RATE), 0.02);
                    }
                    else
                    {
                        zoomRate = (GamePredef.C_FLYING_PLAYER_ZOOM_RATE / GamePredef.C_FLYING_ZOOM_RATE);
                        zoomStep = Math.pow((GamePredef.C_FLYING_ZOOM_RATE / GamePredef.C_FLYING_PLAYER_ZOOM_RATE), 0.02);
                    };
                    doZoom = function ():void
                    {
                        zoomRate = (zoomRate * zoomStep);
                        var _local_1:Boolean = Boolean(Number(GamePredef.GLOBAL_SETTING["flyEffect"]));
                        thisView.scaleX = ((_local_1) ? zoomRate : 1);
                        thisView.scaleY = ((_local_1) ? zoomRate : 1);
                        if (((doubleFly) && (weddingFlyer)))
                        {
                            weddingFlyer.upFlyerPos();
                        };
                        if (fairyManager)
                        {
                            fairyManager.scaleX = thisView.scaleX;
                            fairyManager.scaleY = thisView.scaleY;
                        };
                    };
                    flyingEffect.updateFunc = doZoom;
                }
                else
                {
                    defaultFunc = function ():void
                    {
                        if (((doubleFly) && (weddingFlyer)))
                        {
                            weddingFlyer.upFlyerPos();
                        };
                    };
                    flyingEffect.updateFunc = defaultFunc;
                };
            };
            callbackFunc = function ():void
            {
                flyingEffect.removeEventListener(EnterFrameMove.EFFECT_END, callbackFunc);
                flyingEffect = null;
                if (isTakingOff)
                {
                    if (((thisView) && (thisView._gameObject)))
                    {
                        thisView._body.y = -(GamePredef.FLIGHT_HEIGHT);
                        thisView._gameObject.flyingState = GamePredef.FLYING_STATE_IN_THE_AIR;
                        if (fairyManager)
                        {
                            fairyManager.isFlying = true;
                            fairyManager.switchLayer();
                        };
                    };
                }
                else
                {
                    if ((((thisView) && (thisView._gameObject)) && (!(thisView._gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND))))
                    {
                        if (thisView.isWalking)
                        {
                            thisView.behaviorForFlying(AbstractGameRes.BH_RUN_NORMAL);
                        };
                        thisView._body.y = 0;
                        _core.view.switchLayer(thisView._gameObject, false);
                        thisView._gameObject.flyingState = GamePredef.FLYING_STATE_ON_GROUND;
                        if (fairyManager)
                        {
                            fairyManager.isFlying = false;
                            fairyManager.switchLayer();
                        };
                        if (doubleFly)
                        {
                            clearDoubleFlyFlag();
                        };
                        thisView.flyerOff();
                    };
                    if (thisView.state == GamePredef.ST_NORMAL)
                    {
                        thisView.state = GamePredef.ST_NORMAL;
                    };
                };
            };
            flyingEffect.addEventListener(EnterFrameMove.EFFECT_END, callbackFunc);
            flyingEffect.play();
        }

        private function addLoaderListener(_arg_1:IEventDispatcher):void
        {
            _arg_1.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        public function get yBase():int
        {
            return (y);
        }

        public function stopWalk():void
        {
            if (((this is PlayerView) && (_gameObject.flyingState == GamePredef.FLYING_STATE_PRE_LANDING)))
            {
                if ((((!(_gameObject.inGroup)) || (_gameObject.isLeader)) || (_gameObject.groupAfk)))
                {
                    if (_hitTestLayer["checkHitTest"](this.x, this.y))
                    {
                        _core.remote.stopFlying();
                        if (_mount_cg)
                        {
                            this._gameObject.mountState = GamePredef.MOUNT_STATE_ON;
                        };
                    }
                    else
                    {
                        landToSafeArea();
                        return;
                    };
                };
            };
            isWalking = false;
            behavior(AbstractGameRes.BH_BREATH_SLOW);
            updateObjectPos();
            behaviorEnd();
            moveEnd();
        }

        public function coordinateSelfXY():void
        {
            var _local_1:Number;
            if ((((!(_cg)) || (!(_frontC))) || (!(doubleFly))))
            {
                return;
            };
            _local_1 = ((-(Number(_frontC._cg.dir)) * Math.PI) / 4);
            _cg.dir = _frontC._cg.dir;
            _cg.behavior = _frontC._cg.behavior;
            _cg.play(((_cg.dir + "-") + _cg.behavior));
            if (_weapon_cg)
            {
                _weapon_cg.play(((_cg.dir + "-") + _cg.behavior));
            };
            var _local_2:Number = Math.cos(_local_1);
            var _local_3:Number = Math.sin(_local_1);
            var _local_4:Number = 0;
            var _local_5:Number = 0;
            _local_4 = (-(GamePredef.DFLYING_DISTANCE_PLAYER) * _local_2);
            _local_5 = ((-(GamePredef.DFLYING_DISTANCE_PLAYER) / 2) * _local_3);
            if ((_frontC._cg.dir % 2) == 1)
            {
                _local_4 = (_local_4 / 2);
                _local_5 = (_local_5 / 2);
            };
            posX = (_frontC.posX + _local_4);
            posY = (_frontC.posY + _local_5);
            _gameObject.posX = _frontC.posX;
            _gameObject.posY = _frontC.posY;
            if ((this is PlayerView))
            {
                PlayerView(this).updateUI(false, _frontC.posX, _frontC.posY);
            };
            if (this._wing_cg)
            {
                _wing_cg.dir = _cg.dir;
                _wing_cg.play(((_wing_cg.dir + "-") + _wing_cg.behavior));
                coordinateWingPos();
            };
        }

        private function stateUnload():void
        {
            if (!stateSprite)
            {
                return;
            };
            while (stateSprite.numChildren > 0)
            {
                stateSprite.removeChildAt(0);
            };
            stateSprite.visible = false;
        }

        public function stopPlayingFlyingEffect():void
        {
            if (flyingEffect)
            {
                if (((_gameObject.flyingState == GamePredef.FLYING_STATE_TAKING_OFF) || (_gameObject.flyingState == GamePredef.FLYING_STATE_LANDING)))
                {
                    flyingEffect.stop();
                };
            };
            if (_gameObject.flyingState == GamePredef.FLYING_STATE_PRE_LANDING)
            {
                _gameObject.flyingState = GamePredef.FLYING_STATE_ON_GROUND;
            };
        }

        protected function defaultResComplete(_arg_1:Event):void
        {
            if (!_defaultResLoader)
            {
                return;
            };
            _defaultResLoader.visible = true;
            _defaultResLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, defaultResComplete);
            _sprite = _defaultResLoader.content;
            if (_callBack != null)
            {
                _sprite.callBack = _callBack;
            };
            setPosSprite();
            setPosState();
            setPosition();
            if (!((this is CharactorView) || (this is CreatureShowView)))
            {
                if (LOAD_MODEL)
                {
                    loadRes();
                };
            };
        }

        private function isFeMaleState(_arg_1:int):Boolean
        {
            var _local_2:int;
            for each (_local_2 in GamePredef.TITLE_IMG_VISIABLE)
            {
                if (_local_2 == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function setVipState():void
        {
            var _local_1:Number;
            var _local_2:uint;
            var _local_3:Boolean;
            var _local_4:*;
            var _local_5:Boolean;
            var _local_6:Object;
            if (stateSprite.numChildren > 0)
            {
                return;
            };
            _local_1 = -1;
            if (((_gameObject.t > 0) && (_core.checkTitleShow(_gameObject.t))))
            {
                _local_1 = Number(_gameObject.t);
            }
            else
            {
                if (((_gameObject.vipT > 0) && (_core.checkTitleType(_local_1, GamePredef.TITLE_KIND_VIP))))
                {
                    _local_1 = Number(_gameObject.vipT);
                };
            };
            if ((((_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND) && (_core.checkTitleType(_gameObject.actT, GamePredef.TITLE_KIND_ACTIVE))) && (_core.checkTitleShow(_gameObject.actT))))
            {
                _local_1 = _gameObject.actT;
            }
            else
            {
                if (_gameObject.flyingState != GamePredef.FLYING_STATE_ON_GROUND)
                {
                    _local_1 = -1;
                };
            };
            if (((_gameObject.decoFootCode == "2080130102100") || (_gameObject.decoFootCode == "2080130102101")))
            {
                footprintOff();
            };
            if (_local_1 == GamePredef.SPE_SHUANGXUEQIMENG)
            {
                _gameObject.decoFootCode = "2080130102100";
                footprintOn();
            };
            if (_local_1 == GamePredef.SPE_GUIXIANGMITANG)
            {
                _gameObject.decoFootCode = "2080130102101";
                footprintOn();
            };
            _local_2 = -1;
            _local_3 = false;
            switch (_local_1)
            {
                case GamePredef.STAR_3_TID:
                    _local_2 = GamePredef.ST_VIP3;
                    break;
                case GamePredef.STAR_4_TID:
                    _local_2 = GamePredef.ST_VIP4;
                    break;
                case GamePredef.STAR_5_TID:
                    _local_2 = GamePredef.ST_VIP5;
                    break;
                case GamePredef.STAR_6_TID:
                    _local_2 = GamePredef.ST_VIP6;
                    break;
                case GamePredef.STAR_7_TID:
                    _local_2 = GamePredef.ST_VIP7;
                    break;
                case GamePredef.DOG_FIGHT_T1:
                    _local_2 = GamePredef.ST_DF1;
                    break;
                case GamePredef.DOG_FIGHT_T2:
                    _local_2 = GamePredef.ST_DF2;
                    break;
                case GamePredef.DOG_FIGHT_T3:
                    _local_2 = GamePredef.ST_DF3;
                    break;
                case GamePredef.SPE_RICH_PEOPLE:
                    _local_2 = GamePredef.ST_RICH;
                    break;
                case GamePredef.SPE_LIGHT_WUYO:
                    _local_2 = GamePredef.ST_LIGHT_WUYO;
                    break;
                case GamePredef.SPE_MOLI_SCHOLAR:
                    _local_2 = GamePredef.ST_MOLI_SCHOLAR;
                    break;
                case GamePredef.SPE_REVENGE_SOUL:
                    _local_2 = GamePredef.ST_REVENGE_SOUL;
                    break;
                case GamePredef.SPE_PK_WINNER_A:
                case GamePredef.SPE_PK_WINNER_B:
                case GamePredef.SPE_PK_WINNER_C:
                case GamePredef.SPE_PK_WINNER_D:
                case GamePredef.SPE_BAOBEI:
                case GamePredef.SPE_ANNI_EIGHT:
                    _local_2 = GamePredef.ST_PK_WINNER;
                    break;
                case GamePredef.SPE_PK_WINNER_MALE_A:
                case GamePredef.SPE_PK_WINNER_MALE_B:
                case GamePredef.SPE_PK_WINNER_MALE_C:
                case GamePredef.SPE_PK_WINNER_MALE_D:
                    _local_2 = GamePredef.ST_PK_WINNER_MALE;
                    break;
                case GamePredef.SPE_PK_WINNER_FEMALE_A:
                case GamePredef.SPE_PK_WINNER_FEMALE_B:
                case GamePredef.SPE_PK_WINNER_FEMALE_C:
                case GamePredef.SPE_PK_WINNER_FEMALE_D:
                    _local_2 = GamePredef.ST_PK_WINNER_FEMALE;
                    break;
                case GamePredef.SPE_GODDESS_BLESS:
                    _local_2 = GamePredef.ST_GODDESS_BLESS;
                    break;
                case GamePredef.SPE_ANGRY_SOUL:
                    _local_2 = GamePredef.ST_ANGRY_SOUL;
                    break;
                case GamePredef.SPE_UNDYING_BIRD:
                    _local_2 = GamePredef.ST_UNDYING_BIRD;
                    break;
                case GamePredef.SPE_MOLI_BABY_1:
                case GamePredef.MOLI_XINGXIANG_5:
                    _local_2 = GamePredef.ST_MOLI_BABY_1;
                    break;
                case GamePredef.SPE_MOLI_BABY_2:
                case GamePredef.MOLI_XINGXIANG_4:
                    _local_2 = GamePredef.ST_MOLI_BABY_2;
                    break;
                case GamePredef.SPE_MOLI_BABY_3:
                case GamePredef.MOLI_XINGXIANG_3:
                    _local_2 = GamePredef.ST_MOLI_BABY_3;
                    break;
                case GamePredef.SPE_MOLI_MAN_1:
                    _local_2 = GamePredef.ST_MOLI_MAN_1;
                    break;
                case GamePredef.SPE_MOLI_MAN_2:
                    _local_2 = GamePredef.ST_MOLI_MAN_2;
                    break;
                case GamePredef.SPE_MOLI_MAN_3:
                    _local_2 = GamePredef.ST_MOLI_MAN_3;
                    break;
                case GamePredef.SPE_ACADEMIC_SUCCESS:
                    _local_2 = GamePredef.ST_ACADEMIC_SUCCESS;
                    break;
                case GamePredef.SPE_QIXI_MALE:
                    _local_2 = GamePredef.ST_PK_WINNER_MALE;
                    break;
                case GamePredef.SPE_QIXI_FEMALE:
                    _local_2 = GamePredef.ST_PK_WINNER_FEMALE;
                    break;
                case GamePredef.NEW_SERVER_MER_MALE:
                    _local_2 = GamePredef.ST_PK_WINNER_MALE;
                    break;
                case GamePredef.NEW_SERVER_MER_FEMALE:
                    _local_2 = GamePredef.ST_PK_WINNER_FEMALE;
                    break;
                case GamePredef.PK_WINNER_2013:
                    _local_2 = GamePredef.ST_PK_WINNER;
                    break;
                case GamePredef.HAOSHENGYIN_GUANJUN:
                    _local_2 = GamePredef.ST_MOLI_BABY_1;
                    break;
                case GamePredef.HAOSHENGYIN_YAJUN:
                    _local_2 = GamePredef.ST_MOLI_MAN_2;
                    break;
                case GamePredef.HAOSHENGYIN_JIJUN:
                case GamePredef.CHENHAOTEXIAO_346:
                case GamePredef.CHENHAOTEXIAO_347:
                case GamePredef.CHENHAOTEXIAO_348:
                case GamePredef.CHENHAOTEXIAO_349:
                case GamePredef.CHENHAOTEXIAO_350:
                    _local_2 = GamePredef.ST_MOLI_BABY_3;
                    break;
                case GamePredef.SPE_CROSS_PK_A:
                    _local_2 = GamePredef.ST_CROSS_PK_A;
                    break;
                case GamePredef.SPE_CROSS_PK_B:
                    _local_2 = GamePredef.ST_CROSS_PK_B;
                    break;
                case GamePredef.SPE_CROSS_PK_C:
                    _local_2 = GamePredef.ST_CROSS_PK_C;
                    break;
                case GamePredef.SPE_CROSS_PK_D:
                    _local_2 = GamePredef.ST_CROSS_PK_D;
                    break;
                case GamePredef.ZHI_ZHU_ZAI_WO:
                    _local_2 = GamePredef.ST_UNDYING_BIRD;
                    break;
                case GamePredef.XIAN_FA_ZHI_REN:
                case GamePredef.LAO_BU_KE_PO:
                case GamePredef.WU_JIAN_BU_CUI:
                    _local_2 = GamePredef.ST_MOLI_SCHOLAR;
                    break;
                case GamePredef.SPE_YUANDAN:
                    _local_2 = GamePredef.ST_MOLI_MAN_3;
                    break;
                case GamePredef.SPE_SHOWTIME_A:
                    _local_2 = GamePredef.ST_SHOWTIME_A;
                    break;
                case GamePredef.SPE_SHOWTIME_B:
                    _local_2 = GamePredef.ST_SHOWTIME_B;
                    break;
                case GamePredef.SPE_SHOWTIME_C:
                    _local_2 = GamePredef.ST_SHOWTIME_C;
                    break;
                case GamePredef.SPE_SHOWTIME_D:
                    _local_2 = GamePredef.ST_SHOWTIME_D;
                    break;
                case GamePredef.SPE_MOLI_MAN_2018_1:
                    _local_2 = GamePredef.ST_MOLI_MAN_1;
                    break;
                case GamePredef.SPE_MOLI_MAN_2018_2:
                    _local_2 = GamePredef.ST_MOLI_MAN_2;
                    break;
                case GamePredef.SPE_MOLI_MAN_2018_3:
                    _local_2 = GamePredef.ST_MOLI_MAN_3;
                    break;
                case GamePredef.SPE_PET_PK_20191:
                    _local_2 = GamePredef.ST_MOLI_BABY_3;
                    break;
                case GamePredef.SPE_PET_PK_20192:
                    _local_2 = GamePredef.ST_MOLI_BABY_2;
                    break;
                case GamePredef.SPE_PET_PK_20193:
                    _local_2 = GamePredef.ST_MOLI_BABY_1;
                    break;
                case GamePredef.SPE_ZHONGQIU2019:
                    _local_2 = GamePredef.ST_ZHONGQIU2019;
                    break;
                case GamePredef.SPE_BAISEVDAY2020:
                    _local_2 = GamePredef.ST_PK_WINNER_FEMALE;
                    break;
                case GamePredef.SPE_MOLI_2020_1:
                    _local_2 = GamePredef.ST_MOLI_2020_1;
                    break;
                case GamePredef.SPE_MOLI_2020_2:
                    _local_2 = GamePredef.ST_MOLI_2020_2;
                    break;
                case GamePredef.SPE_MOLI_2020_3:
                    _local_2 = GamePredef.ST_MOLI_2020_3;
                    break;
                case GamePredef.SPE_XCDS_1:
                    _local_2 = GamePredef.ST_XCDS_1;
                    break;
                case GamePredef.SPE_XCDS_2:
                    _local_2 = GamePredef.ST_XCDS_2;
                    break;
                case GamePredef.SPE_XCDS_3:
                    _local_2 = GamePredef.ST_XCDS_3;
                    break;
                case GamePredef.SPE_YSXG:
                    _local_2 = GamePredef.ST_YSXG_1;
                    break;
                case GamePredef.SPE_ML12:
                    _local_2 = GamePredef.ST_ML_12;
                    break;
                case GamePredef.SPE_TXKC:
                    _local_2 = GamePredef.ST_TXKC;
                    break;
                case GamePredef.SPE_ML13:
                    _local_2 = GamePredef.ST_ML_12;
                    break;
                case GamePredef.SPE_QL2101:
                    _local_2 = GamePredef.ST_QL_2101;
                    break;
                case GamePredef.SPE_QL2102:
                    _local_2 = GamePredef.ST_QL_2102;
                    break;
                case GamePredef.SPE_QL2103:
                    _local_2 = GamePredef.ST_QL_2103;
                    break;
                case GamePredef.SPE_XZ2201:
                    _local_2 = GamePredef.ST_XZ_2201;
                    break;
                case GamePredef.SPE_XZ2207:
                    _local_2 = GamePredef.ST_XZ_2207;
                    break;
                case GamePredef.SPE_BUYER2208:
                    _local_2 = GamePredef.ST_BUYER_2208;
                    break;
                case GamePredef.SPE_ML14:
                    _local_2 = GamePredef.ST_ML_12;
                    break;
                case GamePredef.SPE_BUYER2212:
                    _local_2 = GamePredef.ST_BUYER_2212;
                    break;
                case GamePredef.SPE_CHUNRIHUAKAI:
                    _local_2 = GamePredef.ST_CHUNRIHUAKAI;
                    break;
                case GamePredef.SPE_TONGXINTONGQU:
                    _local_2 = GamePredef.ST_TONGXINTONGQU;
                    break;
                case GamePredef.SPE_ML15:
                    _local_2 = GamePredef.ST_ML_12;
                    break;
                case GamePredef.SPE_WSJ2301:
                    _local_2 = GamePredef.ST_WSJ2301;
                    break;
                case GamePredef.SPE_WSJ2302:
                    _local_2 = GamePredef.ST_WSJ2302;
                    break;
                case GamePredef.SPE_MCZDTITLE_A1:
                case GamePredef.SPE_MCZDTITLE_A1_F:
                    _local_2 = GamePredef.ST_MCZDTITLE1;
                    break;
                case GamePredef.SPE_MCZDTITLE_A2:
                case GamePredef.SPE_MCZDTITLE_A2_F:
                    _local_2 = GamePredef.ST_MCZDTITLE2;
                    break;
                case GamePredef.SPE_MCZDTITLE_A3:
                case GamePredef.SPE_MCZDTITLE_A3_F:
                    _local_2 = GamePredef.ST_MCZDTITLE3;
                    break;
                case GamePredef.SPE_MCZDTITLE_B1:
                case GamePredef.SPE_MCZDTITLE_B1_F:
                    _local_2 = GamePredef.ST_MCZDTITLE1;
                    break;
                case GamePredef.SPE_MCZDTITLE_B2:
                case GamePredef.SPE_MCZDTITLE_B2_F:
                    _local_2 = GamePredef.ST_MCZDTITLE2;
                    break;
                case GamePredef.SPE_MCZDTITLE_B3:
                case GamePredef.SPE_MCZDTITLE_B3_F:
                    _local_2 = GamePredef.ST_MCZDTITLE3;
                    break;
                case GamePredef.SPE_MCZDTITLE_C1:
                case GamePredef.SPE_MCZDTITLE_C1_F:
                    _local_2 = GamePredef.ST_MCZDTITLE1;
                    break;
                case GamePredef.SPE_MCZDTITLE_C2:
                case GamePredef.SPE_MCZDTITLE_C2_F:
                    _local_2 = GamePredef.ST_MCZDTITLE2;
                    break;
                case GamePredef.SPE_MCZDTITLE_C3:
                case GamePredef.SPE_MCZDTITLE_C3_F:
                    _local_2 = GamePredef.ST_MCZDTITLE3;
                    break;
                case GamePredef.SPE_MCZDTITLE_D1:
                case GamePredef.SPE_MCZDTITLE_D1_F:
                    _local_2 = GamePredef.ST_MCZDTITLE1;
                    break;
                case GamePredef.SPE_MCZDTITLE_D2:
                case GamePredef.SPE_MCZDTITLE_D2_F:
                    _local_2 = GamePredef.ST_MCZDTITLE2;
                    break;
                case GamePredef.SPE_MCZDTITLE_D3:
                case GamePredef.SPE_MCZDTITLE_D3_F:
                    _local_2 = GamePredef.ST_MCZDTITLE3;
                    break;
                case GamePredef.SPE_MCZDTITLE_E1:
                case GamePredef.SPE_MCZDTITLE_E1_F:
                    _local_2 = GamePredef.ST_MCZDTITLE1;
                    break;
                case GamePredef.SPE_MCZDTITLE_E2:
                case GamePredef.SPE_MCZDTITLE_E2_F:
                    _local_2 = GamePredef.ST_MCZDTITLE2;
                    break;
                case GamePredef.SPE_MCZDTITLE_E3:
                case GamePredef.SPE_MCZDTITLE_E3_F:
                    _local_2 = GamePredef.ST_MCZDTITLE3;
                    break;
                case GamePredef.SPE_MCZDTITLE_F1:
                case GamePredef.SPE_MCZDTITLE_F1_F:
                    _local_2 = GamePredef.ST_MCZDTITLE1;
                    break;
                case GamePredef.SPE_MCZDTITLE_F2:
                case GamePredef.SPE_MCZDTITLE_F2_F:
                    _local_2 = GamePredef.ST_MCZDTITLE2;
                    break;
                case GamePredef.SPE_MCZDTITLE_F3:
                case GamePredef.SPE_MCZDTITLE_F3_F:
                    _local_2 = GamePredef.ST_MCZDTITLE3;
                    break;
                case GamePredef.SPE_LOVERS2024_1:
                    _local_2 = GamePredef.ST_LOVER20241;
                    break;
                case GamePredef.SPE_LOVERS2024_2:
                    _local_2 = GamePredef.ST_LOVER20242;
                    break;
                case GamePredef.SPE_LOVERS2024_3:
                    _local_2 = GamePredef.ST_LOVER20243;
                    break;
                case GamePredef.SPE_SIXIANGSHOUHU:
                    _local_2 = GamePredef.ST_SIXIANGSHOUHU;
                    break;
                case GamePredef.SPE_MITANGZHILIAN:
                    _local_2 = GamePredef.ST_MITANGZHILIAN;
                    break;
                case GamePredef.SPE_NUANXIANGZUIREN:
                    _local_2 = GamePredef.ST_NUANXIANGZUIREN;
                    break;
                case GamePredef.SPE_CHAOJIBIANJU:
                    _local_2 = GamePredef.ST_CHAOJIBIANJU;
                    break;
                case GamePredef.SPE_ZUIJIABIANDAO:
                    _local_2 = GamePredef.ST_ZUIJIABIANDAO;
                    break;
                case GamePredef.SPE_MOLIQILV:
                    _local_2 = GamePredef.ST_MOLIQILV;
                    break;
                case GamePredef.SPE_XINGGUANGCUICAN:
                    _local_2 = GamePredef.ST_XINGGUANGCUICAN;
                    break;
                case GamePredef.SPE_XIUCHANGJIAODIAN:
                    _local_2 = GamePredef.ST_XIUCHANGJIAODIAN;
                    break;
                case GamePredef.SPE_MEILIWUTAI:
                    _local_2 = GamePredef.ST_MEILIWUTAI;
                    break;
                case GamePredef.SPE_FENGSHANGZHIXING:
                    _local_2 = GamePredef.ST_FENGSHANGZHIXING;
                    break;
                case GamePredef.SPE_SHENSHENGHUIGUANG:
                    _local_2 = GamePredef.ST_SHENSHENGHUIGUANG;
                    break;
                case GamePredef.SPE_ML16:
                    _local_2 = GamePredef.ST_ML_12;
                    break;
                case GamePredef.SPE_QIQUWANJIA:
                    _local_2 = GamePredef.ST_QIQUWANJIA;
                    break;
                case GamePredef.SPE_MOLIZHUIGUANG:
                    _local_2 = GamePredef.ST_MOLIZHUIGUANG;
                    break;
                default:
                    return;
            };
            if (_core.checkTitleShow(_local_1))
            {
                _local_3 = true;
            };
            _local_4 = new (ResManager.STATE_ICON[_local_2])();
            _local_5 = false;
            if ((((_local_2 >= 29) && (_local_2 <= 31)) || (_local_3)))
            {
                _local_5 = true;
            }
            else
            {
                _local_4.width = 32;
                _local_4.height = 32;
            };
            stateSprite.addChild(_local_4);
            setVipStatePos(_local_5);
            stateSprite.visible = true;
            _local_6 = _gameObject.decoInfo;
            if (((((_local_6) && (_local_6[2])) && (Number(_local_6[2]["did"]))) && (Number(_local_6[2]["isShow"]))))
            {
                stateSprite.visible = false;
            };
        }

        public function get isWalking():Boolean
        {
            return (_isWalking);
        }

        private function swapDepth(_arg_1:int):void
        {
            if (parent)
            {
                container = this.parent;
            }
            else
            {
                return;
            };
            var _local_2:uint = container.getChildIndex(this);
            var _local_3:DisplayObject;
            while (true)
            {
                if (((_arg_1 > 0) && (_local_2 < (container.numChildren - 1))))
                {
                    _local_3 = container.getChildAt((_local_2 + 1));
                    if (this.yBase > _local_3["yBase"])
                    {
                        container.swapChildren(this, _local_3);
                    }
                    else
                    {
                        return;
                    };
                }
                else
                {
                    if (((_arg_1 < 0) && (_local_2 > 0)))
                    {
                        _local_3 = container.getChildAt((_local_2 - 1));
                        if (this.yBase < _local_3["yBase"])
                        {
                            container.swapChildren(this, _local_3);
                        }
                        else
                        {
                            return;
                        };
                    }
                    else
                    {
                        return;
                    };
                };
            };
        }

        private function onSetFootprintView(_arg_1:Event):void
        {
            var _local_5:FootprintGraphic;
            var _local_6:FootprintView;
            var _local_2:DisplayObjectContainer = ((this.container) || (this.parent));
            var _local_3:String = ResManager.getResUrlNoHash(Number(_gameObject.decoFootCode));
            var _local_4:String = ResManager.hash(_local_3);
            if ((_footprint_count % (TOTAL_FOOT_FRAME / TOTAL_FOOT_COUNT)) == 0)
            {
                if (_local_2)
                {
                    _local_5 = new FootprintGraphic(_local_4, (_footprint as MovieClip), 120, 145);
                    _local_6 = new FootprintView(_local_5, _local_2);
                    _local_2.addChildAt(_local_6, 0);
                    _local_6.x = (this.x - 58);
                    _local_6.y = (this.y - 70);
                };
            };
            _footprint_count++;
        }

        private function setCharGraphic(_arg_1:Object):void
        {
            var _local_5:Object;
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.resCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            if (_cg)
            {
                this._body.removeChild(_cg);
                _cg.unload();
                _cg = null;
            };
            var _local_4:* = null;
            _local_4 = new CharactorGraphic(_local_3, (_arg_1 as MovieClip));
            if ((this is CharactorView))
            {
                this["_leaderFlag"].x = 0;
                this["_leaderFlag"].y = -90;
                var _local_6:* = this;
                (_local_6["loadStateIcon"]());
                _local_6 = this;
                (_local_6["loadLeaderIcon"]());
            };
            this._cg = _local_4;
            _cg.addEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
            _cg.addEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
            _cg.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            this._body.addChildAt(_cg, 0);
            if (_mount_cg)
            {
                behavior(_cg.behavior);
                this._body.setChildIndex(DisplayObject(_mount_cg), 0);
            };
            _resLoader.visible = true;
            _resLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, resLoadCompleteHandler);
            _resLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, resIoError);
            if (_defaultResLoader)
            {
                if (_defaultResLoader.parent)
                {
                    _body.removeChild(_defaultResLoader);
                };
                _defaultResLoader.unload();
                _defaultResLoader.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
                _defaultResLoader.removeEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
                _defaultResLoader.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
                _defaultResLoader = null;
            };
            _sprite = _arg_1;
            setPosSprite();
            setPosState();
            setPosition();
            setColor();
            if (((_gameObject.type == GamePredef.TBL_CHARACTOR) && ((isDefaultRes()) || (this.isRebirthRes()))))
            {
                if (((isNaN(_gameObject.dressResCode)) || (_gameObject.dressResCode < 0)))
                {
                    equipOn(_gameObject.wp, _gameObject.ee, _gameObject.ef, _gameObject.star);
                }
                else
                {
                    equipOn(_gameObject.dressResCode, _gameObject.ee, _gameObject.ef, _gameObject.star, true);
                };
            }
            else
            {
                if (_weaponLoader)
                {
                    _weaponLoader.unload();
                };
                if (_weapon_cg)
                {
                    if (_weapon_cg)
                    {
                        if (this._body.contains(_weapon_cg))
                        {
                            this._body.removeChild(_weapon_cg);
                        };
                        _weapon_cg = null;
                    };
                };
            };
            if (((this is CharactorView) || (this is CreatureShowView)))
            {
                if (_gameObject.flyingState != GamePredef.FLYING_STATE_ON_GROUND)
                {
                    if (_gameObject.doubleFly)
                    {
                        coordinateSelfXY();
                    }
                    else
                    {
                        _local_6 = this;
                        (_local_6["flyerOn"]());
                    };
                }
                else
                {
                    _local_6 = this;
                    (_local_6["flyerOff"]());
                };
                if (_wing_cg)
                {
                    if (this._body.contains(DisplayObject(_wing_cg)))
                    {
                        this._body.removeChild(DisplayObject(_wing_cg));
                    };
                    _wing_cg = null;
                };
                _local_6 = this;
                (_local_6["wingOn"]());
                _local_6 = this;
                (_local_6["fairyOn"]());
                _local_6 = this;
                (_local_6["mountOn"]());
                if ((this is CreatureShowView))
                {
                    if ((this as CreatureShowView).decoFlag)
                    {
                        _local_6 = this;
                        (_local_6["tepeOn"]());
                    };
                    _local_6 = this;
                    (_local_6["roundOn"]());
                    _local_6 = this;
                    (_local_6["roundMaskOn"]());
                    _local_6 = this;
                    (_local_6["haloOn"]());
                }
                else
                {
                    if ((this is CharactorView))
                    {
                        _local_5 = _gameObject.decoInfo;
                        if (!_local_5)
                        {
                            return;
                        };
                        if ((((_local_5[1]) && (Number(_local_5[1]["did"]))) && (Number(_local_5[1]["isShow"]))))
                        {
                            _local_6 = this;
                            (_local_6["haloOn"]());
                        };
                        if ((((_local_5[2]) && (Number(_local_5[2]["did"]))) && (Number(_local_5[2]["isShow"]))))
                        {
                            stateSprite.visible = false;
                            _local_6 = this;
                            (_local_6["roundOn"]());
                            _local_6 = this;
                            (_local_6["roundMaskOn"]());
                        };
                        if ((((_local_5[3]) && (Number(_local_5[3]["did"]))) && (Number(_local_5[3]["isShow"]))))
                        {
                            _local_6 = this;
                            (_local_6["footprintOn"]());
                        };
                        if ((((_local_5[4]) && (Number(_local_5[4]["did"]))) && (Number(_local_5[4]["isShow"]))))
                        {
                            _local_6 = this;
                            (_local_6["tepeOn"]());
                        };
                    };
                };
            }
            else
            {
                if (((this is BattleCreatureView) && ((gameObject is Charactor) || (gameObject is Pet))))
                {
                    if ((gameObject is Charactor))
                    {
                        if (_wing_cg)
                        {
                            if (this._body.contains(DisplayObject(_wing_cg)))
                            {
                                this._body.removeChild(DisplayObject(_wing_cg));
                            };
                            _wing_cg = null;
                        };
                        _local_6 = this;
                        (_local_6["wingOn"]());
                        _local_6 = this;
                        (_local_6["fairyOn"]());
                    };
                    if (this["isAirBattle"])
                    {
                        if (!gameObject.doubleFly)
                        {
                            _local_6 = this;
                            (_local_6["flyerOn"]());
                        };
                    };
                };
            };
        }

        protected function setFootprintView(_arg_1:Event):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(Number(_gameObject.decoFootCode));
            var _local_3:String = ResManager.hash(_local_2);
            _footprint = ResCacher.getInstance().getRes(_local_3);
            if (_footprint == null)
            {
                ResCacher.getInstance().addEventListener("complete", footprintLoadCompleteHandler);
            }
            else
            {
                addEventListener(Event.ENTER_FRAME, onSetFootprintView);
            };
        }

        public function set posY(_arg_1:int):void
        {
            y = _arg_1;
        }

        public function setRoundGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(Number(_gameObject.decoLightCode));
            var _local_3:String = ResManager.hash(_local_2);
            if (_round_cg)
            {
                _body.removeChild(DisplayObject(_round_cg));
                _round_cg.unload();
                _round_cg = null;
            };
            _round_cg = new DecorateGraphic(_local_3, (_arg_1 as MovieClip), 192, 194);
            (_round_cg as Sprite).mouseEnabled = false;
            _body.addChild(DisplayObject(_round_cg));
            _round_cg.x = -95;
            _round_cg.y = -150;
        }

        public function set posX(_arg_1:int):void
        {
            x = _arg_1;
        }

        public function roundOff():void
        {
            if (_round_cg)
            {
                _round_cg.unload();
                _round_cg = null;
            };
        }

        private function stateLoad(_arg_1:int):void
        {
            var _local_3:DisplayObject;
            if (!stateSprite)
            {
                return;
            };
            var _local_2:Class = ResManager.STATE_ICON[_arg_1];
            if (!_local_2)
            {
                if ((_gameObject instanceof Charactor))
                {
                    if (((_gameObject.t) && (isFeMaleState(int(_gameObject.t)))))
                    {
                        setFeMaleState();
                    }
                    else
                    {
                        setActTState();
                        setVipState();
                    };
                }
                else
                {
                    return;
                };
            }
            else
            {
                _local_3 = new (_local_2)();
                stateSprite.addChild(_local_3);
                setPosState();
                stateSprite.visible = true;
            };
        }

        public function set hitTestLayer(_arg_1:DisplayObject):void
        {
            _hitTestLayer = _arg_1;
        }

        public function roundMaskOn():void
        {
            if ((((!(_gameObject)) || (isNaN(_gameObject.decoLightMaskCode))) || (Number(_gameObject.decoLightMaskCode) < 0)))
            {
                return;
            };
            if (_gameObject.decoLightMaskCode == 0)
            {
                roundMaskOff();
                return;
            };
            var _local_1:String = ResManager.getResUrlNoHash(Number(_gameObject.decoLightMaskCode));
            var _local_2:String = ResManager.hash(_local_1);
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (!_local_3)
            {
                ResCacher.getInstance().addEventListener("complete", roundMaskLoadCompleteHandler);
            }
            else
            {
                setRoundMaskGraphic(_local_3);
            };
        }

        public function frontEffect(_arg_1:Number):void
        {
            if (((_arg_1 > 0) && (LOAD_EFFECT)))
            {
                _frontEffLoader.load(new URLRequest(ResManager.getResUrl(_arg_1)));
            };
        }

        public function flyerOff():void
        {
            if (_tepe_cg)
            {
                (_tepe_cg as DisplayObject).visible = true;
            };
            if (_flyer_cg)
            {
                if (this._body.contains(DisplayObject(_flyer_cg)))
                {
                    this._body.removeChild(DisplayObject(_flyer_cg));
                };
                _flyer_cg.unload();
                _flyer_cg = null;
                if (_flyer_front)
                {
                    if (this._body.contains(DisplayObject(_flyer_front)))
                    {
                        this._body.removeChild(DisplayObject(_flyer_front));
                    };
                    _flyer_front.unload();
                    _flyer_front = null;
                };
                if ((this is CharactorView))
                {
                    var _local_1:* = this;
                    (_local_1["setTitle"](_gameObject.t));
                };
            };
        }

        public function bulletTo(_arg_1:Number, _arg_2:ICreatureView):void
        {
            var _local_4:Object;
            var _local_3:Loader10 = new Loader10();
            if (((_arg_1 > 0) && (LOAD_EFFECT)))
            {
                _local_3.load(new URLRequest(ResManager.getResUrl(_arg_1)));
            };
            if (_isBattleView)
            {
                _local_4 = _core.view.getUI(ViewManager.STAGE_BATTLE);
            }
            else
            {
                _local_4 = _core.view.getUI(ViewManager.STAGE_MAIN);
            };
            _local_4.frontEffectLayer.addChild(_local_3);
            _local_3.x = posX;
            _local_3.y = (posY - 30);
            if (((_isBattleView) && (_local_4.isAirBattle)))
            {
                _local_3.y = (_local_3.y - GamePredef.FLIGHT_HEIGHT);
            };
            var _local_5:EnterFrameMove = new EnterFrameMove();
            _local_5.target = _local_3;
            _local_5.stepLength = MOVE_SPEED_BATTLE;
            _local_5.xBy = (_arg_2.posX - posX);
            _local_5.yBy = (_arg_2.posY - posY);
            _local_5.addEventListener(EnterFrameMove.EFFECT_END, bulletHitHandler);
            _local_5.play();
        }

        public function equipOff(_arg_1:Number=0):void
        {
            if (_weaponLoader)
            {
                _weaponLoader.unload();
            };
            if (_weapon_cg)
            {
                if (this._body.contains(_weapon_cg))
                {
                    this._body.removeChild(_weapon_cg);
                };
                _weapon_cg.unload();
                _weapon_cg = null;
            };
        }

        public function set state(_arg_1:int):void
        {
            _state = _arg_1;
            if (ToolKit.isSmallThan(_arg_1, 0))
            {
                stateUnload();
                return;
            };
            stateUnload();
            stateLoad(_arg_1);
        }

        private function wingMouseDown(_arg_1:MouseEvent):void
        {
            var _local_2:uint;
            var _local_3:DisplayObject;
            if (_wing_cg)
            {
                if (parent)
                {
                    container = this.parent;
                }
                else
                {
                    return;
                };
                _local_2 = container.getChildIndex(this);
                _local_3 = null;
                while (_local_2 > 0)
                {
                    _local_2--;
                    _local_3 = container.getChildAt(_local_2);
                    if ((this is BattleCreatureView))
                    {
                        if ((_local_3 is BattleCreatureView))
                        {
                            if (_local_3.hitTestPoint(_arg_1.stageX, _arg_1.stageY, true))
                            {
                                BattleCreatureView(_local_3).mouseDownHandler(_arg_1);
                                _arg_1.stopImmediatePropagation();
                                return;
                            };
                        };
                    }
                    else
                    {
                        if ((_local_3 is NPCView))
                        {
                            if (_local_3.hitTestPoint(_arg_1.stageX, _arg_1.stageY, true))
                            {
                                NPCView(_local_3).mouseDownHandler(_arg_1);
                                _arg_1.stopImmediatePropagation();
                                return;
                            };
                        };
                    };
                };
                return;
            };
        }

        protected function behaviorEnd():void
        {
            if (_callBack != null)
            {
                _callBack();
            };
        }

        protected function addVisibleTimer():void
        {
            _visibleTimer = new Timer(VISIBLE_DELAY);
            _visibleTimer.addEventListener(TimerEvent.TIMER, timerHandler);
            _visibleTimer.start();
        }

        private function setPosState():void
        {
            if ((((this is CharactorView) || (this is BattleCreatureView)) || (this is CreatureShowView)))
            {
                if (_cg)
                {
                    if (((_gameObject) && ((_gameObject.flyingState == GamePredef.FLYING_STATE_TAKING_OFF) || (_gameObject.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR))))
                    {
                        stateSprite.x = 0;
                        stateSprite.y = ((_cg.y - stateSprite.height) - 80);
                    }
                    else
                    {
                        stateSprite.x = 0;
                        stateSprite.y = ((_cg.y - stateSprite.height) + 30);
                    };
                };
            }
            else
            {
                if (_sprite)
                {
                    stateSprite.x = 0;
                    stateSprite.y = (((_sprite.y + _sprite.headY) - stateSprite.height) + 30);
                };
            };
        }

        public function fadeOut():void
        {
            var _local_1:Fade = new Fade(this);
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 0;
            _local_1.duration = 1000;
            _local_1.addEventListener(EffectEvent.EFFECT_END, fadeOutHandler);
            _local_1.play();
        }

        private function resortSelf():void
        {
            if (parent == null)
            {
                return;
            };
            var _local_1:Object = parent;
            _local_1.sortChildren();
        }

        public function footprintOn():void
        {
            if (((((!(_gameObject)) || (!(_gameObject.decoFootCode))) || (isNaN(_gameObject.decoFootCode))) || (Number(_gameObject.decoFootCode) <= 0)))
            {
                return;
            };
            addEventListener(GameEvent.BEHAVIOR_CHANGE_TO_RUN, setFootprintView);
            addEventListener(GameEvent.BEHAVIOR_CHANGE_TO_STOP, removeFootprintView);
        }

        public function setMonutGraphic(_arg_1:Object):void
        {
            var _local_4:int;
            var _local_2:String = ResManager.getResUrlNoHash(_gameObject.mountResCode);
            var _local_3:String = ResManager.hash((_local_2 + "_NEW.swf"));
            if (_halo_cg)
            {
                haloOn();
            };
            if (_tepe_cg)
            {
                tepeOn();
            };
            if (_mount_cg)
            {
                _body.removeChild(DisplayObject(_mount_cg));
                _mount_cg.unload();
                _mount_cg = null;
            };
            _mount_cg = new CharactorGraphic(_local_3, (_arg_1 as MovieClip));
            lastMountHeight = mountHeight;
            mountHeight = MOUNT_DRESS_HEIGHT[("" + _gameObject.mountResCode)];
            if (((_cg) && (_mount_cg)))
            {
                behavior(_cg.behavior);
                _mount_cg.dir = _cg.dir;
                _mount_cg.behavior = _cg.behavior;
                _mount_cg.play(((_mount_cg.dir + "-") + _mount_cg.behavior));
                _cg.play(((_cg.dir + "-") + _cg.behavior));
                _mount_cg.x = -(_mount_cg.midX);
                _mount_cg.y = -(_mount_cg.footY);
                if (((_weapon_cg) && (_weapon_cg.visible)))
                {
                    _weapon_cg.visible = true;
                    _weapon_cg.dir = _cg.dir;
                    _weapon_cg.behavior = _cg.behavior;
                    _weapon_cg.play(((_weapon_cg.dir + "-") + _weapon_cg.behavior));
                };
            };
            if (_tepe_cg)
            {
                _local_4 = _body.getChildIndex(DisplayObject(_tepe_cg));
                _body.addChildAt(DisplayObject(_mount_cg), (_local_4 + 1));
            }
            else
            {
                _body.addChildAt(DisplayObject(_mount_cg), 0);
            };
            if (((!(_weapon_cg)) || (_weapon_cg.visible == false)))
            {
                _weapon_cg = null;
            };
            coordinateMountRelPos();
        }

        protected function mountLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if ((((!(_gameObject)) || (isNaN(_gameObject.mountResCode))) || (_gameObject.mountResCode <= 0)))
            {
                return;
            };
            var _local_3:String = ResManager.getResUrlNoHash(_gameObject.mountResCode);
            var _local_4:String = ResManager.hash((_local_3 + "_NEW.swf"));
            if (_local_2.url.indexOf(_local_4) == -1)
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", mountLoadCompleteHandler);
            setMonutGraphic(_arg_1.target.current_complete_loader.content);
        }

        public function skillEffect(_arg_1:Number):void
        {
            if (((_arg_1 > 0) && (LOAD_EFFECT)))
            {
                _skillEffLoader.load(new URLRequest(ResManager.getResUrl(_arg_1)));
            };
        }

        protected function moveEnd():void
        {
        }

        protected function resLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo;
            var _local_3:Function;
            if ((((this is CharactorView) || (this is BattleCreatureView)) || (this is CreatureShowView)))
            {
                _local_2 = ResCacher.getInstance().current_complete_loader;
                if (((_gameObject == null) || (_local_2.url.indexOf(ResManager.hash((ResManager.getResUrlNoHash(_gameObject.resCode) + "_NEW.swf"))) == -1)))
                {
                    return;
                };
                setCharGraphic(_local_2.content);
                ResCacher.getInstance().removeEventListener("complete", resLoadCompleteHandler);
            }
            else
            {
                _resLoader.visible = true;
                _resLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, resLoadCompleteHandler);
                _resLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, resIoError);
                if (_defaultResLoader)
                {
                    if (_defaultResLoader.parent)
                    {
                        _body.removeChild(_defaultResLoader);
                    };
                    _defaultResLoader.unload();
                    _defaultResLoader.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
                    _defaultResLoader.removeEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
                    _defaultResLoader.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
                    _defaultResLoader = null;
                };
                _local_3 = _sprite.callBack;
                _sprite.callBack = null;
                _sprite = _resLoader.content;
                if (_sprite)
                {
                    _sprite.callBack = _local_3;
                    setPosSprite();
                };
                setPosState();
                setPosition();
                setColor();
                if (((_gameObject.type == GamePredef.TBL_CHARACTOR) && ((isDefaultRes()) || (isRebirthRes()))))
                {
                    equipOn(_gameObject.wp, _gameObject.ee, _gameObject.ef, _gameObject.star);
                }
                else
                {
                    if (_weaponLoader)
                    {
                        _weaponLoader.unload();
                    };
                };
            };
        }

        public function setDoubleFlyer():void
        {
            if (doubleFly)
            {
                return;
            };
            if (_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
            {
                if (_gameObject.isLeader)
                {
                    if (!weddingFlyer)
                    {
                        createWeddingFlyer();
                    };
                };
                return;
            };
            doubleFly = true;
            if (_gameObject.isLeader)
            {
                if (!weddingFlyer)
                {
                    createWeddingFlyer();
                };
                weddingFlyer.host = _gameObject.view;
                weddingFlyerOn();
            }
            else
            {
                flyerGuest = _gameObject.view;
            };
        }

        public function wingOn():void
        {
            if (((((!(_gameObject)) || (isNaN(_gameObject.wingResCode))) || (_gameObject.wingResCode <= 0)) || (!(WING_CLASS_OFFSET[_gameObject.resCode]))))
            {
                return;
            };
            var _local_1:String = ResManager.getResUrlNoHash(_gameObject.wingResCode);
            var _local_2:String = ResManager.hash((_local_1 + "_NEW.swf"));
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (_local_3 == null)
            {
                ResCacher.getInstance().addEventListener("complete", wingLoadCompleteHandler);
            }
            else
            {
                setWingGraphic(_local_3);
            };
        }

        public function haloOn():void
        {
            if (((((!(_gameObject)) || (!(_gameObject.decoHeadCode))) || (isNaN(_gameObject.decoHeadCode))) || (Number(_gameObject.decoHeadCode) <= 0)))
            {
                return;
            };
            var _local_1:String = ResManager.getResUrlNoHash(Number(_gameObject.decoHeadCode));
            var _local_2:String = ResManager.hash(_local_1);
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (!_local_3)
            {
                ResCacher.getInstance().addEventListener("complete", haloLoadCompleteHandler);
            }
            else
            {
                setHaloGraphic(_local_3);
            };
        }

        protected function removeListener():void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            _resLoader.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
            _resLoader.removeEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
            _resLoader.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            if (_defaultResLoader)
            {
                _defaultResLoader.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
                _defaultResLoader.removeEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
                _defaultResLoader.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            };
            if (_cg)
            {
                _cg.removeEventListener(MouseEvent.ROLL_OVER, mouseOverHandler);
                _cg.removeEventListener(MouseEvent.ROLL_OUT, mouseOutHandler);
                _cg.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            };
            _gameObjMove.removeEventListener(TimerMove.EFFECT_END, walk);
            _gameObjMove.removeEventListener(TimerMove.EFFECT_UPDATE, onWalking);
            removeLoaderListener(_frontEffLoader.contentLoaderInfo);
            removeLoaderListener(_attackEffLoader.contentLoaderInfo);
            removeLoaderListener(_skillEffLoader.contentLoaderInfo);
            removeLoaderListener(_buffEffLoader.contentLoaderInfo);
            removeLoaderListener(_emotionLoader.contentLoaderInfo);
        }

        public function setHaloGraphic(_arg_1:Object):void
        {
            var _local_2:String = ResManager.getResUrlNoHash(Number(_gameObject.decoHeadCode));
            var _local_3:String = ResManager.hash(_local_2);
            if (_halo_cg)
            {
                _body.removeChild(DisplayObject(_halo_cg));
                _halo_cg.unload();
                _halo_cg = null;
            };
            _halo_cg = new DecorateGraphic(_local_3, (_arg_1 as MovieClip), 86, 68);
            (_halo_cg as Sprite).mouseEnabled = false;
            _body.addChild(DisplayObject(_halo_cg));
            if (_gameObject.mountState == GamePredef.MOUNT_STATE_ON)
            {
                _halo_cg.x = -43;
                _halo_cg.y = -160;
            }
            else
            {
                _halo_cg.x = -43;
                _halo_cg.y = -130;
            };
        }

        public function isRebirthRes():Boolean
        {
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_CLASS][_gameObject.classId];
            if (((_gameObject.gender == 0) && (Number(_gameObject.resCode) == Number(_local_1.resCodeMale2))))
            {
                return (true);
            };
            if (((_gameObject.gender == 1) && (Number(_gameObject.resCode) == Number(_local_1.resCodeFemale2))))
            {
                return (true);
            };
            return (false);
        }

        public function wingOff():void
        {
            if (_wing_cg)
            {
                if (this._body.contains(DisplayObject(_wing_cg)))
                {
                    this._body.removeChild(DisplayObject(_wing_cg));
                };
                _wing_cg.unload();
                _wing_cg = null;
            };
        }

        private function bodyMouseDown(_arg_1:MouseEvent):void
        {
            var _local_2:Point;
            var _local_3:Point;
            if (_wing_cg)
            {
                _local_2 = new Point(_arg_1.stageX, _arg_1.stageY);
                _local_3 = _cg.globalToLocal(_local_2);
                if (((_cg) && (!(_cg.hitTestPoint(_local_3.x, _local_3.y, true)))))
                {
                    _local_2 = _wing_cg.globalToLocal(_local_2);
                    if (_wing_cg.hitTestPoint(_local_2.x, _local_2.y, true))
                    {
                        wingMouseDown(_arg_1);
                    };
                };
            };
        }

        public function faceToTarget(_arg_1:ICreatureView):void
        {
            if (this == _arg_1)
            {
                return;
            };
            var _local_2:int = ToolKit.getDir((_arg_1.posX - posX), (_arg_1.posY - posY));
            faceTo(_local_2);
        }

        private function setActTState():void
        {
            if ((((Number(_gameObject.vipT) <= 0) && (_core.checkTitleType(_gameObject.actT, GamePredef.TITLE_KIND_ACTIVE))) && (_core.checkTitleShow(_gameObject.actT))))
            {
                _gameObject.vipT = _gameObject.actT;
            }
            else
            {
                if (((Number(_gameObject.actT) <= 0) && (_core.checkTitleType(_gameObject.vipT, GamePredef.TITLE_KIND_ACTIVE))))
                {
                    gameObject.vipT = -1;
                }
                else
                {
                    if ((((_core.checkTitleType(_gameObject.vipT, GamePredef.TITLE_KIND_ACTIVE)) && (_core.checkTitleType(_gameObject.actT, GamePredef.TITLE_KIND_ACTIVE))) && (!(_core.checkTitleShow(_gameObject.actT)))))
                    {
                        gameObject.vipT = -1;
                    }
                    else
                    {
                        if ((((Number(_gameObject.vipT) <= 0) && (Number(_gameObject.actT) <= 0)) && (_core.checkTitleShow(_gameObject.t))))
                        {
                        };
                    };
                };
            };
        }

        private function removeRef():void
        {
            _callBack = null;
            if (!((this is CharactorView) || (this is CreatureShowView)))
            {
                if (_sprite)
                {
                    _sprite.filters = [];
                    _sprite.callBack = null;
                    _sprite.stop();
                    _sprite = null;
                };
            };
            if (_weapon)
            {
                _weapon.filters = [];
                _weapon.callBack = null;
                _weapon.stop();
                _weapon = null;
            };
            if (_wing_cg)
            {
                wing_run_lastTune = null;
                _wing_cg.filters = [];
                _wing_cg.callBack = null;
                _wing_cg.stop();
                _wing_cg = null;
            };
            if (fairyManager)
            {
                fairyOff();
            };
            if (_defaultResLoader)
            {
                _defaultResLoader.unload();
                _defaultResLoader = null;
            };
            _resLoader.unload();
            _weaponLoader.unload();
            _resLoader = null;
            _weaponLoader = null;
            _frontC = null;
            if (_gameObject)
            {
                if (_gameObject.view == this)
                {
                    _gameObject.view = null;
                };
                if (_gameObject.normalView == this)
                {
                    _gameObject.normalView = null;
                };
                if (_gameObject.battleView == this)
                {
                    _gameObject.battleView = null;
                };
                _gameObject = null;
            };
            _gameObjMove.destroy();
            _gameObjMove = null;
            _hitTestLayer = null;
            _core = null;
            _frontEffLoader = null;
            _attackEffLoader = null;
            _skillEffLoader = null;
            _buffEffLoader = null;
            _emotionLoader = null;
            stateSprite = null;
            _textName = null;
            _popup = null;
            _shadow = null;
            _defaultResLoader = null;
            _followOldPoint = null;
        }

        public function fairyOff():void
        {
            if (fairyManager)
            {
                fairyManager.destroy();
                if (_fairy_cg)
                {
                    _fairy_cg.unload();
                    _fairy_cg = null;
                };
                fairyManager = null;
            };
        }

        public function roundMaskOff():void
        {
            if (_round_mask_cg)
            {
                _round_mask_cg.unload();
                _round_mask_cg = null;
            };
        }

        public function isDefaultRes():Boolean
        {
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_CLASS][_gameObject.classId];
            if (((_gameObject.gender == 0) && (Number(_gameObject.resCode) == Number(_local_1.resCodeMale))))
            {
                return (true);
            };
            if (((_gameObject.gender == 1) && (Number(_gameObject.resCode) == Number(_local_1.resCodeFemale))))
            {
                return (true);
            };
            return (false);
        }

        protected function setVipStatePos(_arg_1:Boolean):void
        {
            var _local_2:int;
            if (_sprite)
            {
                if (_arg_1)
                {
                    _local_2 = -1;
                    if (((_gameObject.t > 0) && (_core.checkTitleShow(_gameObject.t))))
                    {
                        _local_2 = Number(_gameObject.t);
                    }
                    else
                    {
                        if (_gameObject.vipT > 0)
                        {
                            _local_2 = Number(_gameObject.vipT);
                        };
                    };
                    if ((((_gameObject.flyingState == GamePredef.FLYING_STATE_ON_GROUND) && (_core.checkTitleType(_gameObject.actT, GamePredef.TITLE_KIND_ACTIVE))) && (_core.checkTitleShow(_gameObject.actT))))
                    {
                        _local_2 = _gameObject.actT;
                    };
                    if (((((((((((((((((_local_2 == GamePredef.SPE_MOLI_BABY_1) || (_local_2 == GamePredef.SPE_MOLI_BABY_2)) || (_local_2 == GamePredef.SPE_MOLI_BABY_3)) || (_local_2 == GamePredef.HAOSHENGYIN_GUANJUN)) || (_local_2 == GamePredef.HAOSHENGYIN_YAJUN)) || (_local_2 == GamePredef.HAOSHENGYIN_JIJUN)) || (_local_2 == GamePredef.SPE_MOLI_MAN_2)) || (_local_2 == GamePredef.SPE_MOLI_MAN_2018_1)) || (_local_2 == GamePredef.SPE_MOLI_MAN_2018_2)) || (_local_2 == GamePredef.SPE_MOLI_MAN_2018_3)) || (_local_2 == GamePredef.MOLI_XINGXIANG_3)) || (_local_2 == GamePredef.MOLI_XINGXIANG_4)) || (_local_2 == GamePredef.MOLI_XINGXIANG_5)) || (_local_2 == GamePredef.SPE_PET_PK_20191)) || (_local_2 == GamePredef.SPE_PET_PK_20192)) || (_local_2 == GamePredef.SPE_PET_PK_20193)))
                    {
                        stateSprite.x = (-(stateSprite.width) / 2);
                        stateSprite.y = -(stateSprite.height - 23);
                    }
                    else
                    {
                        if ((((((((_local_2 == GamePredef.SPE_BAOBEI) || (_local_2 == GamePredef.SPE_ANNI_EIGHT)) || (_local_2 == GamePredef.SPE_PK_WINNER_A)) || (_local_2 == GamePredef.SPE_PK_WINNER_B)) || (_local_2 == GamePredef.SPE_PK_WINNER_C)) || (_local_2 == GamePredef.SPE_PK_WINNER_D)) || (_local_2 == GamePredef.PK_WINNER_2013)))
                        {
                            stateSprite.x = (-(stateSprite.width) / 2);
                            stateSprite.y = -(stateSprite.height - 23);
                            stateSprite.x = (stateSprite.x + 1);
                            stateSprite.y = (stateSprite.y + 10);
                        }
                        else
                        {
                            if (((((((((_local_2 == GamePredef.SPE_PK_WINNER_MALE_A) || (_local_2 == GamePredef.SPE_PK_WINNER_MALE_B)) || (_local_2 == GamePredef.SPE_PK_WINNER_MALE_C)) || (_local_2 == GamePredef.SPE_PK_WINNER_MALE_D)) || (_local_2 == GamePredef.SPE_PK_WINNER_FEMALE_A)) || (_local_2 == GamePredef.SPE_PK_WINNER_FEMALE_B)) || (_local_2 == GamePredef.SPE_PK_WINNER_FEMALE_C)) || (_local_2 == GamePredef.SPE_PK_WINNER_FEMALE_D)))
                            {
                                stateSprite.x = (-(stateSprite.width) / 2);
                                stateSprite.y = -(stateSprite.height - 23);
                                stateSprite.x--;
                                stateSprite.y = (stateSprite.y + 3);
                            }
                            else
                            {
                                if (((_local_2 == GamePredef.SPE_CROSS_PK_B) || (_local_2 == GamePredef.SPE_CROSS_PK_D)))
                                {
                                    stateSprite.x = -(stateSprite.width - 70);
                                    stateSprite.y = -(stateSprite.height - 50);
                                }
                                else
                                {
                                    if (((_local_2 == GamePredef.SPE_CROSS_PK_A) || (_local_2 == GamePredef.SPE_CROSS_PK_C)))
                                    {
                                        stateSprite.x = -(stateSprite.width - 80);
                                        stateSprite.y = -(stateSprite.height - 50);
                                    }
                                    else
                                    {
                                        if ((((((((_local_2 == GamePredef.SPE_SHOWTIME_A) || (_local_2 == GamePredef.SPE_SHOWTIME_B)) || (_local_2 == GamePredef.SPE_SHOWTIME_C)) || (_local_2 == GamePredef.SPE_SHOWTIME_D)) || (_local_2 == GamePredef.SPE_MOLI_2020_1)) || (_local_2 == GamePredef.SPE_MOLI_2020_2)) || (_local_2 == GamePredef.SPE_MOLI_2020_3)))
                                        {
                                            stateSprite.x = -(stateSprite.width - 75);
                                            stateSprite.y = -(stateSprite.height - 40);
                                        }
                                        else
                                        {
                                            if ((((((((((((((((((_local_2 == GamePredef.SPE_XCDS_1) || (_local_2 == GamePredef.SPE_XCDS_2)) || (_local_2 == GamePredef.SPE_XCDS_3)) || (_local_2 == GamePredef.SPE_YSXG)) || (_local_2 == GamePredef.SPE_ML12)) || (_local_2 == GamePredef.SPE_ML13)) || (_local_2 == GamePredef.SPE_TXKC)) || (_local_2 == GamePredef.SPE_QL2101)) || (_local_2 == GamePredef.SPE_QL2102)) || (_local_2 == GamePredef.SPE_QL2103)) || (_local_2 == GamePredef.SPE_XZ2201)) || (_local_2 == GamePredef.SPE_ML14)) || (_local_2 == GamePredef.SPE_ML15)) || (_local_2 == GamePredef.SPE_ML16)) || (_local_2 == GamePredef.SPE_LOVERS2024_1)) || (_local_2 == GamePredef.SPE_LOVERS2024_2)) || (_local_2 == GamePredef.SPE_LOVERS2024_3)))
                                            {
                                                stateSprite.x = ((-(stateSprite.width) / 2) - 5);
                                                stateSprite.y = -170;
                                            }
                                            else
                                            {
                                                if (_local_2 == GamePredef.SPE_MITANGZHILIAN)
                                                {
                                                    stateSprite.x = (-(stateSprite.width) / 2);
                                                    stateSprite.y = -130;
                                                }
                                                else
                                                {
                                                    if (((((((((_local_2 == GamePredef.SPE_XZ2207) || (_local_2 == GamePredef.SPE_XINGGUANGCUICAN)) || (_local_2 == GamePredef.SPE_XIUCHANGJIAODIAN)) || (_local_2 == GamePredef.SPE_MEILIWUTAI)) || (_local_2 == GamePredef.SPE_FENGSHANGZHIXING)) || (_local_2 == GamePredef.SPE_SHENSHENGHUIGUANG)) || (_local_2 == GamePredef.SPE_QIQUWANJIA)) || (_local_2 == GamePredef.SPE_MOLIZHUIGUANG)))
                                                    {
                                                        stateSprite.x = ((-(stateSprite.width) / 2) - 5);
                                                        stateSprite.y = -160;
                                                    }
                                                    else
                                                    {
                                                        if ((((((((((((((((((((((((((((((((((((((((((((((((_local_2 == GamePredef.SPE_BUYER2208) || (_local_2 == GamePredef.SPE_BUYER2212)) || (_local_2 == GamePredef.SPE_CHUNRIHUAKAI)) || (_local_2 == GamePredef.SPE_TONGXINTONGQU)) || (_local_2 == GamePredef.SPE_WSJ2301)) || (_local_2 == GamePredef.SPE_WSJ2302)) || (_local_2 == GamePredef.SPE_MCZDTITLE_A1)) || (_local_2 == GamePredef.SPE_MCZDTITLE_A2)) || (_local_2 == GamePredef.SPE_MCZDTITLE_A3)) || (_local_2 == GamePredef.SPE_MCZDTITLE_B1)) || (_local_2 == GamePredef.SPE_MCZDTITLE_B2)) || (_local_2 == GamePredef.SPE_MCZDTITLE_B3)) || (_local_2 == GamePredef.SPE_MCZDTITLE_C1)) || (_local_2 == GamePredef.SPE_MCZDTITLE_C2)) || (_local_2 == GamePredef.SPE_MCZDTITLE_C3)) || (_local_2 == GamePredef.SPE_MCZDTITLE_D1)) || (_local_2 == GamePredef.SPE_MCZDTITLE_D2)) || (_local_2 == GamePredef.SPE_MCZDTITLE_D3)) || (_local_2 == GamePredef.SPE_MCZDTITLE_E1)) || (_local_2 == GamePredef.SPE_MCZDTITLE_E2)) || (_local_2 == GamePredef.SPE_MCZDTITLE_E3)) || (_local_2 == GamePredef.SPE_MCZDTITLE_F1)) || (_local_2 == GamePredef.SPE_MCZDTITLE_F2)) || (_local_2 == GamePredef.SPE_MCZDTITLE_F3)) || (_local_2 == GamePredef.SPE_MCZDTITLE_A1_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_A2_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_A3_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_B1_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_B2_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_B3_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_C1_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_C2_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_C3_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_D1_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_D2_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_D3_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_E1_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_E2_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_E3_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_F1_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_F2_F)) || (_local_2 == GamePredef.SPE_MCZDTITLE_F3_F)) || (_local_2 == GamePredef.SPE_SIXIANGSHOUHU)) || (_local_2 == GamePredef.SPE_NUANXIANGZUIREN)) || (_local_2 == GamePredef.SPE_CHAOJIBIANJU)) || (_local_2 == GamePredef.SPE_ZUIJIABIANDAO)) || (_local_2 == GamePredef.SPE_MOLIQILV)))
                                                        {
                                                            stateSprite.x = (-(stateSprite.width) / 2);
                                                            stateSprite.y = -160;
                                                        }
                                                        else
                                                        {
                                                            stateSprite.x = -50;
                                                            stateSprite.y = (_sprite.y - 30);
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    stateSprite.x = -14;
                    stateSprite.y = ((_sprite.y - _sprite.bodyHeight) - 30);
                };
            };
        }

        public function tepeOff():void
        {
            if (_tepe_cg)
            {
                _tepe_cg.unload();
                _tepe_cg = null;
            };
        }

        private function removeLoaderListener(_arg_1:IEventDispatcher):void
        {
            _arg_1.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        public function onSay(_arg_1:String):void
        {
            _popup.show(TextUtil.decode(_arg_1));
            if (((this is CharactorView) || (this is BattleCreatureView)))
            {
                if (_cg)
                {
                    _popup.y = ((_cg.y - _popup.height) - 5);
                }
                else
                {
                    _popup.y = -135;
                };
            }
            else
            {
                if (_sprite)
                {
                    _popup.y = (((_sprite.y + _sprite.headY) - _popup.height) - 5);
                }
                else
                {
                    _popup.y = -100;
                };
            };
        }

        protected function flyerLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if ((((!(_gameObject)) || (isNaN(_gameObject.flyerResCode))) || (_gameObject.flyerResCode <= 0)))
            {
                return;
            };
            var _local_3:String = ResManager.getResUrlNoHash(_gameObject.flyerResCode);
            var _local_4:String = ResManager.hash((_local_3 + "_NEW.swf"));
            if (_local_2.url.indexOf(_local_4) == -1)
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", flyerLoadCompleteHandler);
            setFlyerGraphic(_arg_1.target.current_complete_loader.content);
        }

        public function get hitTestLayer():DisplayObject
        {
            return (_hitTestLayer);
        }

        public function landToSafeArea():void
        {
            if (!moveToSafeArea())
            {
                _core.remote.stopFlying();
                if (_mount_cg)
                {
                    this._gameObject.mountState = GamePredef.MOUNT_STATE_ON;
                };
            };
        }

        protected function onAddedToStage(_arg_1:Event):void
        {
            if ((parent is DynamicItemLayer))
            {
                hitTestLayer = DisplayObject(_core.scene.hitTest);
            };
        }

        protected function setPosition():void
        {
            if (_gameObject)
            {
                x = _gameObject.posX;
                y = _gameObject.posY;
            };
        }

        private function roundLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            var _local_3:String = ResManager.getResUrlNoHash(Number(_gameObject.decoLightCode));
            var _local_4:String = ResManager.hash(_local_3);
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", roundLoadCompleteHandler);
            setRoundGraphic(_arg_1.target.current_complete_loader.content);
        }

        private function coordinateWingPos():void
        {
            var _local_1:Number;
            var _local_2:Number;
            if (((WING_CLASS_OFFSET[_gameObject.resCode]) && (WING_CLASS_OFFSET[_gameObject.resCode].wing)))
            {
                if (wing_stand_lastTune)
                {
                    _wing_cg.x = (_wing_cg.x - wing_stand_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_stand_lastTune.y);
                };
                wing_stand_lastTune = WING_CLASS_OFFSET[_gameObject.resCode][_wing_cg.dir];
                _wing_cg.x = (_wing_cg.x + wing_stand_lastTune.x);
                _wing_cg.y = (_wing_cg.y + wing_stand_lastTune.y);
            };
            if ((((_cg.behavior == AbstractGameRes.BH_RUN_NORMAL) && (WING_RUN_OFFSET[_gameObject.resCode])) && (WING_RUN_OFFSET[_gameObject.resCode].wing)))
            {
                if (wing_run_lastTune)
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                };
                wing_run_lastTune = WING_RUN_OFFSET[_gameObject.resCode][_wing_cg.dir];
                _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
            };
            if ((((_cg.behavior == AbstractGameRes.BH_BREATH_MOUNT) && (WING_MOUNT_CLASS_OFFSET[_gameObject.resCode])) && (WING_MOUNT_CLASS_OFFSET[_gameObject.resCode].wing)))
            {
                if (wing_run_lastTune)
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                };
                wing_run_lastTune = WING_MOUNT_CLASS_OFFSET[_gameObject.resCode][_wing_cg.dir];
                _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
            };
            if (((((_cg.behavior == AbstractGameRes.BH_RUN_NORMAL_MOUNT) || (_cg.behavior == AbstractGameRes.BH_RUN_FAST_MOUNT)) && (WING_MOUNT_RUN_OFFSET[_gameObject.resCode])) && (WING_MOUNT_RUN_OFFSET[_gameObject.resCode].wing)))
            {
                if (wing_run_lastTune)
                {
                    _wing_cg.x = (_wing_cg.x - wing_run_lastTune.x);
                    _wing_cg.y = (_wing_cg.y - wing_run_lastTune.y);
                };
                wing_run_lastTune = WING_MOUNT_RUN_OFFSET[_gameObject.resCode][_wing_cg.dir];
                _wing_cg.x = (_wing_cg.x + wing_run_lastTune.x);
                _wing_cg.y = (_wing_cg.y + wing_run_lastTune.y);
            };
            if ((((_cg.dir == 0) || (_cg.dir == 1)) || (_cg.dir == 7)))
            {
                _body.setChildIndex(DisplayObject(_wing_cg), 0);
            }
            else
            {
                _local_1 = (_body.getChildIndex(_cg) + 1);
                _local_2 = ((_weapon_cg) ? (_body.getChildIndex(_weapon_cg) + 1) : 0);
                _local_1 = Math.max(_local_1, _local_2);
                if (_local_1 >= _body.numChildren)
                {
                    _local_1 = (_body.numChildren - 1);
                };
                _body.setChildIndex(DisplayObject(_wing_cg), _local_1);
            };
        }

        public function haloOff():void
        {
            if (_halo_cg)
            {
                _halo_cg.unload();
                _halo_cg = null;
            };
        }

        private function memSetLeader(_arg_1:Event):void
        {
            removeEventListener("add_leader", memSetLeader);
            flyerGuest = _gameObject.view;
        }

        public function setStateNum(_arg_1:int, _arg_2:int=3000):void
        {
            _state = _arg_1;
            stateUnload();
            stateLoad(_arg_1);
            setTimeout(clearStateImg, _arg_2);
        }

        public function faceTo(_arg_1:int, _arg_2:int=0):void
        {
            var _local_3:int;
            if ((((this is CharactorView) || (this is BattleCreatureView)) || (this is CreatureShowView)))
            {
                if (!_cg)
                {
                    return;
                };
                _local_3 = _cg.dir;
                if (_local_3 == _arg_1)
                {
                    return;
                };
                _cg.dir = _arg_1;
                _cg.play(((_cg.dir + "-") + _cg.behavior));
            }
            else
            {
                if (_sprite == null)
                {
                    return;
                };
                _local_3 = _sprite.dir;
                if (_local_3 == _arg_1)
                {
                    return;
                };
                _sprite.dir = _arg_1;
            };
            if (_weapon_cg)
            {
                _weapon_cg.dir = _arg_1;
                _weapon_cg.play(((_weapon_cg.dir + "-") + _weapon_cg.behavior));
            };
            if (_mount_cg)
            {
                _mount_cg.dir = _arg_1;
                _mount_cg.play(((_mount_cg.dir + "-") + _mount_cg.behavior));
                if (_mount_front)
                {
                    _mount_front.dir = _arg_1;
                    _mount_front.play(((_mount_front.dir + "-") + AbstractGameRes.BH_BREATH_SLOW));
                };
            };
            if (_wing_cg)
            {
                _wing_cg.dir = _arg_1;
                _wing_cg.play(((_wing_cg.dir + "-") + _wing_cg.behavior));
                coordinateWingPos();
            };
            if (_flyer_cg)
            {
                _flyer_cg.dir = _arg_1;
                _flyer_cg.play(((_flyer_cg.dir + "-") + _flyer_cg.behavior));
                if (_flyer_front)
                {
                    _flyer_front.dir = _arg_1;
                    _flyer_front.play(((_flyer_front.dir + "-") + AbstractGameRes.BH_BREATH_SLOW));
                };
            };
            if (((doubleFly) && (weddingFlyer)))
            {
                weddingFlyer.upFlyerPos();
            };
            if (_arg_2)
            {
                setTimeout(faceTo, _arg_2, _local_3);
            };
        }

        public function set gameObject(_arg_1:Object):void
        {
            var _local_2:int;
            _gameObject = _arg_1;
            _gameObject.view = this;
            loadDefaultRes();
            setName();
            setPosition();
            if (_gameObject.flyingState != GamePredef.FLYING_STATE_ON_GROUND)
            {
                this._body.y = -(GamePredef.FLIGHT_HEIGHT);
                if (fairyManager)
                {
                    fairyManager.isFlying = true;
                };
            };
            if (((_gameObject.type == GamePredef.TBL_NPC) && (_gameObject.npcType == 4)))
            {
                if (((!(_gameObject.name == "水果树")) && (!(_gameObject.name == "蘑菇群"))))
                {
                    _local_2 = int(((360 * Math.random()) - 180));
                    _gameObject.colorCode = _local_2;
                };
            };
        }

        private function resIoError(_arg_1:Event):void
        {
            _resLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, resLoadCompleteHandler);
            _resLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, resIoError);
        }

        private function addChildren():void
        {
            addChild(_shadow);
            addChild(stateSprite);
            addChild(_body);
            _body.addChild(_defaultResLoader);
            _body.addChild(_resLoader);
            _body.addChild(_weaponLoader);
            _body.addChild(_buffEffLoader);
            _body.addChild(_attackEffLoader);
            _body.addChild(_skillEffLoader);
            _body.addChild(_frontEffLoader);
            _body.addChild(_popup);
            _body.addChild(_emotionLoader);
            _body.addChild(_textName);
            _body.mouseEnabled = false;
        }

        public function walk(_arg_1:Event):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Boolean;
            if (((_gameObject.moveRoute) && (_gameObject.moveRoute.length > 0)))
            {
                _local_2 = _gameObject.moveRoute.shift();
                if (_local_2 == null)
                {
                    stopWalk();
                    return;
                };
                _local_3 = (_local_2[0] - posX);
                _local_4 = (_local_2[1] - posY);
                _gameObjMove.xBy = _local_3;
                _gameObjMove.yBy = _local_4;
                _gameObjMove.stepLength = _speed;
                _gameObject.dir = ToolKit.getDir(_local_3, _local_4, _gameObject.dir);
                faceTo(_gameObject.dir);
                _local_5 = Boolean((_gameObject.moveRoute.length <= 0));
                _gameObjMove.play(_local_5, _core.player.inBattle);
                isWalking = true;
            }
            else
            {
                stopWalk();
            };
        }

        protected function updateObjectPos():void
        {
            _gameObject.posX = posX;
            _gameObject.posY = posY;
            if (((doubleFly) && (weddingFlyer)))
            {
                weddingFlyer.upFlyerPos();
            };
        }

        public function get gameObject():Object
        {
            return (_gameObject);
        }

        public function buffEffect(_arg_1:Number):void
        {
            if (((_arg_1 > 0) && (LOAD_EFFECT)))
            {
                _buffEffLoader.load(new URLRequest(ResManager.getResUrl(_arg_1)));
            };
        }

        private function loadCharactorRes():void
        {
            var _local_1:* = (ResManager.getResUrlNoHash(_gameObject.resCode) + "_NEW.swf");
            var _local_2:String = ResManager.hash(_local_1);
            var _local_3:String = _local_2.substr(-32);
            if (Version.ASSETS_VERSION[_local_3])
            {
                _local_2 = (_local_2 + ("?v=" + Version.VERSION.slice(-3)));
            };
            var _local_4:Object = ResCacher.getInstance().getRes(_local_2);
            if (_local_4 == null)
            {
                if (((_defaultResLoader) && (!(_defaultResLoader.content))))
                {
                    _defaultResLoader.visible = false;
                    _defaultResLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, defaultResComplete);
                    _defaultResLoader.loadBytes(new ResManager.DEFAULT_CRE());
                };
                ResCacher.getInstance().addEventListener("complete", resLoadCompleteHandler);
            }
            else
            {
                setCharGraphic(_local_4);
            };
        }

        private function fadeOutHandler(_arg_1:EffectEvent):void
        {
            _arg_1.currentTarget.removeEventListener(EffectEvent.EFFECT_END, fadeOutHandler);
            visible = false;
        }

        public function coordinateMountRelPos():void
        {
            if (_wing_cg)
            {
                _wing_cg.y = (_wing_cg.y + lastMountHeight);
                _wing_cg.y = (_wing_cg.y - mountHeight);
            };
            if (fairyManager)
            {
                fairyManager.posY = (fairyManager.posY + lastMountHeight);
                fairyManager.posY = (fairyManager.posY - mountHeight);
            };
            if (((this.hasOwnProperty("_leaderFlag")) && (this["_leaderFlag"])))
            {
                this["_leaderFlag"].y = (this["_leaderFlag"].y + lastMountHeight);
                this["_leaderFlag"].y = (this["_leaderFlag"].y - mountHeight);
            };
        }

        public function mountOn():void
        {
            var _local_4:String;
            var _local_5:String;
            var _local_6:Object;
            if (((((!(_gameObject)) || (isNaN(_gameObject.mountResCode))) || (_gameObject.mountResCode <= 0)) || ((!(isRebirthRes())) && (!(isDefaultRes())))))
            {
                return;
            };
            if (_gameObject.mountState == GamePredef.MOUNT_STATE_OFF)
            {
                _gameObject.mountState = GamePredef.MOUNT_STATE_ON;
            };
            var _local_1:String = ResManager.getResUrlNoHash(_gameObject.mountResCode);
            var _local_2:String = ResManager.hash((_local_1 + "_NEW.swf"));
            var _local_3:Object = ResCacher.getInstance().getRes(_local_2);
            if (!_local_3)
            {
                ResCacher.getInstance().addEventListener("complete", mountLoadCompleteHandler);
            }
            else
            {
                setMonutGraphic(_local_3);
            };
            if ((((_gameObject.hasOwnProperty("mountFrontResCode")) && (!(isNaN(_gameObject.mountFrontResCode)))) && (_gameObject.mountFrontResCode > 0)))
            {
                _local_4 = ResManager.getResUrlNoHash(_gameObject.mountFrontResCode);
                _local_5 = ResManager.hash((_local_4 + "_NEW.swf"));
                _local_6 = ResCacher.getInstance().getRes(_local_5);
                if (!_local_6)
                {
                    ResCacher.getInstance().addEventListener("complete", mountFrontLoadComplete);
                }
                else
                {
                    setMonutFrontGraphic(_local_6);
                };
            };
        }

        protected function loadRes():void
        {
            if ((((this is CharactorView) || (this is BattleCreatureView)) || (this is CreatureShowView)))
            {
                loadCharactorRes();
            }
            else
            {
                _resLoader.visible = false;
                _resLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, resLoadCompleteHandler);
                _resLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, resIoError);
                _resLoader.load(new URLRequest(ResManager.getResUrl(_gameObject.resCode)));
            };
        }

        public function set isWalking(_arg_1:Boolean):void
        {
            _isWalking = _arg_1;
        }

        override public function set colorCode(_arg_1:int):void
        {
            if ((((this is BattleCreatureView) || (this is CharactorView)) || (this is CreatureShowView)))
            {
                if (_cg)
                {
                    ResManager.setColorCode(_cg, _arg_1);
                };
            }
            else
            {
                if (_sprite)
                {
                    ResManager.setColorCode(_sprite, _arg_1);
                };
            };
        }

        protected function setWeaponGraphic(_arg_1:Object, _arg_2:String, _arg_3:int=0, _arg_4:Boolean=false, _arg_5:int=0):void
        {
            if (_weapon_cg)
            {
                if (this._body.contains(_weapon_cg))
                {
                    this._body.removeChild(_weapon_cg);
                };
                _weapon_cg.unload();
                _weapon_cg = null;
            };
            if ((((this is CharactorView) || (this is BattleCreatureView)) || (this is CreatureShowView)))
            {
                _weapon_cg = new CharactorGraphic(_arg_2, (_arg_1 as MovieClip));
            };
            _weapon_cg.mouseEnabled = false;
            _weapon = _weapon_cg;
            _weapon.x = -(_weapon.midX);
            _weapon.y = -(_weapon.footY);
            trace(("_weapon.width=" + _weapon.width));
            trace(("_weapon.height=" + _weapon.height));
            trace(("_weapon.x=" + _weapon.x));
            trace(("_weapon.y=" + _weapon.y));
            if (((_cg) && (_weapon_cg)))
            {
                _weapon_cg.dir = _cg.dir;
                _weapon_cg.behavior = _cg.behavior;
                _weapon_cg.play(((_weapon_cg.dir + "-") + _weapon_cg.behavior));
            };
            this._body.addChild(_weapon_cg);
            if (((_arg_4) && (_arg_5 == 10)))
            {
                _weapon_cg.filters = [GamePredef.FILTER_WEAPON_ARR1[(_gameObject.ee - 1)]];
            }
            else
            {
                if (_arg_4)
                {
                    _weapon_cg.filters = [GamePredef.FILTER_WEAPON_ARR2[(_gameObject.ee - 1)]];
                }
                else
                {
                    if (_arg_5 == 10)
                    {
                        _weapon_cg.filters = [GamePredef.FILTER_WEAPON_20];
                    }
                    else
                    {
                        _weapon_cg.filters = [];
                    };
                };
            };
        }

        protected function mountFrontLoadComplete(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if (((((!(_gameObject)) || (!(_gameObject.hasOwnProperty("mountFrontResCode")))) || (isNaN(_gameObject.mountFrontResCode))) || (_gameObject.mountFrontResCode <= 0)))
            {
                return;
            };
            var _local_3:String = ResManager.getResUrlNoHash(_gameObject.mountFrontResCode);
            var _local_4:String = ResManager.hash((_local_3 + "_NEW.swf"));
            if (_local_2.url.indexOf(_local_4) == -1)
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", mountFrontLoadComplete);
            setMonutFrontGraphic(_arg_1.target.current_complete_loader.content);
        }

        public function footprintOff():void
        {
            _gameObject.decoFootCode = 0;
            removeEventListener(GameEvent.BEHAVIOR_CHANGE_TO_RUN, setFootprintView);
            removeEventListener(GameEvent.BEHAVIOR_CHANGE_TO_STOP, removeFootprintView);
        }

        protected function mouseOverHandler(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
            if (_resLoader)
            {
                if (Number(gameObject.resCode) == 2060090400092)
                {
                    return;
                };
                _resLoader.filters = [GamePredef.FILTER_CHAR_SELECTED];
            };
        }

        protected function fairyLoadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
            if (!_gameObject)
            {
                return;
            };
            var _local_3:String = ResManager.getResUrlNoHash(_gameObject.fairy.resCode);
            var _local_4:String = ResManager.hash((_local_3 + "_NEW.swf"));
            if (((_gameObject == null) || (_local_2.url.indexOf(_local_4) == -1)))
            {
                return;
            };
            ResCacher.getInstance().removeEventListener("complete", fairyLoadCompleteHandler);
            setFairyGraphic(_arg_1.target.current_complete_loader.content);
        }

        protected function setPosSprite():void
        {
            if ((((this is CharactorView) || (this is BattleCreatureView)) || (this is CreatureShowView)))
            {
                if (_cg)
                {
                    _cg.x = -(_sprite.midX);
                    _cg.y = -(_sprite.footY);
                }
                else
                {
                    _sprite.x = -(_sprite.midX);
                    _sprite.y = -(_sprite.footY);
                };
            }
            else
            {
                _sprite.x = -(_sprite.midX);
                _sprite.y = -(_sprite.footY);
            };
            if (_gameObject)
            {
                faceTo(_gameObject.posDir);
            };
        }

        public function attackEffect(_arg_1:Number):void
        {
            if (((_arg_1 > 0) && (LOAD_EFFECT)))
            {
                _attackEffLoader.load(new URLRequest(ResManager.getResUrl(_arg_1)));
            };
        }

        override public function destroy():void
        {
            if (_deleted)
            {
                return;
            };
            super.destroy();
            stopFollow();
            removeListener();
            unloadAll();
            while (numChildren > 0)
            {
                removeChildAt(0);
            };
            removeRef();
            if (weddingFlyer)
            {
                clearDoubleFlyFlag();
            };
        }


    }
}//package com.qeedoo.ui.view.compGameStage

