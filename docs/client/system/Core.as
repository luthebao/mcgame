// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.system.Core

package com.qeedoo.game.system
{
    import flash.events.IEventDispatcher;
    import com.qeedoo.game.logic.BattleServer;
    import com.qeedoo.game.object.Npc;
    import com.qeedoo.game.object.Player;
    import com.qeedoo.game.logic.Basic;
    import com.qeedoo.game.rpc.RemoteObj;
    import com.qeedoo.game.logic.Group;
    import com.qeedoo.game.logic.GameScene;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.logic.Battle;
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import flash.net.LocalConnection;
    import com.qeedoo.game.logic.BattleMap;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.logic.ObjectMove;
    import com.qeedoo.game.object.Charactor;
    import mx.collections.ArrayCollection;
    import flash.utils.Timer;
    import mx.managers.ToolTipManager;
    import flash.events.StatusEvent;
    import flash.external.ExternalInterface;
    import flash.events.TimerEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import flash.system.Capabilities;
    import com.qeedoo.game.object.SceneItem;
    import com.qeedoo.game.utils.LinkEncode;
    import flash.events.Event;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.qeedoo.game.config.ItemConfig;
    import com.qeedoo.game.object.Pet;
    import com.qeedoo.game.object.Building;
    import com.qeedoo.game.data.GameData;
    import mx.utils.ObjectUtil;
    import flash.net.SharedObject;
    import com.qeedoo.game.utils.CheatChecker;
    import com.qeedoo.game.object.Creature;
    import mx.events.PropertyChangeEvent;

    public class Core implements IEventDispatcher 
    {

        private static var _instance:Core;

        private const MIN_REQUEST_FAZENDA_INTERVAL:Number = 60000;
        public var pet_rate:uint = 0;
        public var error:int;
        public var eventTooltipAlready:Boolean = false;
        private var _ui_create_complete:Boolean = false;
        public var pass:String;
        public var battleServer:BattleServer;
        private var _showPetId:Number;
        private var _npc:Npc;
        private var _self:Player;
        public var basic:Basic;
        public var tg_User:Boolean;
        public var remote:RemoteObj;
        public var currentType:int;
        public var allowMusic:Boolean = false;
        public var currentMusicId:String = "";
        public var realFps:Number;
        public var activeFairy:Object;
        public var targetIP:*;
        public var group:Group;
        public var classify:int = 1;
        public var scene:GameScene;
        public var lastGetItemId:int;
        public var view:ViewManager;
        public var groupMemberListArr:Object;
        public var by_session:String = "false";
        public var battle:Battle;
        private var _bindingEventDispatcher:EventDispatcher;
        public var delPass:String;
        public var lineInfo:Object;
        public var time:String;
        public var lastQuestTime:Number;
        private var _cmdState:int;
        public var productFlag:Boolean = false;
        private var _checkEquipEffectTime:int = -1;
        private var _checkMagicCrystalEffectTime:int = -1;
        public var urlLogin:Boolean;
        public var serverTimeOffSet:Number;
        private var _skill:Object;
        private var _skillLevel:int;
        public var loginTimes:int = -1;
        public var eventTooltipDict:Dictionary = null;
        public var ipWarnFlag:Boolean = false;
        private var _guid:Number;
        public var local:LocalConnection;
        public var isGOSU:Boolean = false;
        public var acountLv:int;
        public var timeLag:Number = 0;
        public var battleMap:BattleMap;
        public var target:*;
        private var _state:int;
        public var firstGC:Boolean = true;
        public var targetNPC:*;
        public var ready:Boolean;
        public var firstLoginFlag:int = 0;
        public var replayMCZD:Boolean = false;
        public var data:DataManager;
        public var wbMapId:int = 0;
        public var global:RemoteObj;
        private var _itemState:int;
        public var newPlayerGuideOpen:Boolean = true;
        private var _battlePet:Object;
        public var user:String;
        public var logined:Boolean;
        private var _tid:Number;
        public var move:ObjectMove;
        public var targetPlayer:Charactor;
        public var inBattleServer:Boolean = false;
        public var hidesysbar:Boolean = false;
        private var _item:Object;
        public var lastGC:Number;
        private var _cid:Number;

        public var _lineList:ArrayCollection = new ArrayCollection();
        private var _653737042bloodBag:Array = [];
        public var bagMax:Array = [0, 10000000, 10000000, 10000000, 10000000];
        public var questGuideList:Object = new Object();
        public var timer:Timer = new Timer(1000);
        private var timer10:Timer = new Timer(10000);
        public var loopQuestStartTime:Object = new Object();
        public var takeAchieveAwardLog:Object = {};
        public var MC_BIRTH_FLAG:Object = {};
        public var lastIdxs:Array = [];
        public var qxWishesArr:Array = [];
        public var VDAYWishesArr:Array = [];
        private var farmReqArr:Array = [];

        public function Core(_arg_1:Single)
        {
            var _local_2:Object;
            var _local_3:Object;
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
            ready = false;
            ToolTipManager.enabled = false;
            ToolTipManager.showDelay = 0;
            ToolTipManager.hideDelay = 60000;
            logined = false;
            error = 0;
            local = new LocalConnection();
            local.addEventListener(StatusEvent.STATUS, localOnStatus);
            if (ExternalInterface.available)
            {
                _local_2 = ExternalInterface.call("getLoginInfo");
                if (_local_2)
                {
                    urlLogin = true;
                    user = _local_2.user;
                    pass = _local_2.pass;
                    time = _local_2.time;
                    by_session = _local_2.by_session;
                }
                else
                {
                    urlLogin = false;
                    by_session = "false";
                };
                _local_3 = ExternalInterface.call("getTgInfo");
                if (_local_3)
                {
                    tg_User = true;
                }
                else
                {
                    tg_User = false;
                };
            };
            timer.addEventListener(TimerEvent.TIMER, onTimer);
            timer10.addEventListener(TimerEvent.TIMER, onTimer10);
            timer10.start();
        }

        public static function getInstance():Core
        {
            if (_instance == null)
            {
                _instance = new Core(new Single());
            };
            return (_instance);
        }


        public function getItemNumFromBag(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Object;
            var _local_3:Object = getTemplateData(_arg_1, _arg_2, false);
            var _local_5:int;
            if (!_local_3)
            {
                return ({
                    "num":_local_5,
                    "slot":_local_4
                });
            };
            var _local_6:Object = data.bagSlotIndex;
            for (_local_7 in data.sList)
            {
                _local_8 = data.sList[_local_7];
                if (((((_local_8) && (Number(_local_8.type) == (_arg_1 - 1))) && (_local_8.sid >= GamePredef.SLOT_SID_BAG[0])) && (_local_8.sid <= GamePredef.SLOT_SID_BAG[9])))
                {
                    _local_9 = getTemplateData(_local_8.type, _local_8.itemId, false);
                    if (_local_9)
                    {
                        if (_local_9.id == _arg_2)
                        {
                            _local_5 = (_local_5 + Number(_local_8.stackNum));
                            if (!_local_4)
                            {
                                _local_4 = _local_8;
                            };
                        };
                    };
                };
            };
            return ({
                "num":_local_5,
                "slot":_local_4
            });
        }

        public function returnToCharList():void
        {
            if (!remote.nc.connected)
            {
                logout();
                return;
            };
            init();
            view.show(ViewManager.UI_LOGIN);
            view.show(ViewManager.FORE_C_C);
            view.hide(ViewManager.STAGE_MAIN);
            view.hide(ViewManager.UI_MAIN);
            var _local_1:Object = view.getUI(ViewManager.PANEL_REDENVELOPE_PANEL);
            if (_local_1)
            {
                _local_1.hideAllRedEvnelope();
            };
            if (((Login_Model.app) && (Login_Model.app.hasOwnProperty("backToCharSelect"))))
            {
                Login_Model.app.backToCharSelect();
            }
            else
            {
                remote.backToCharSelect();
            };
        }

        public function initNewPlayerGuide(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:Boolean;
            if (!newPlayerGuideOpen)
            {
                return;
            };
            lastIdxs = [];
            var _local_2:Array = [];
            for (_local_3 in data.gameData[GamePredef.TBL_GUIDE])
            {
                _local_4 = data.gameData[GamePredef.TBL_GUIDE][_local_3];
                if (((_local_4.level >= player.level) && (((!(_arg_1)) || (_arg_1[_local_4.id] == undefined)) || (!(_arg_1[_local_4.id])))))
                {
                    _local_5 = false;
                    for (_local_3 in _local_2)
                    {
                        if (_local_4.type == _local_2[_local_3])
                        {
                            _local_5 = true;
                            break;
                        };
                    };
                    if (!_local_5)
                    {
                        lastIdxs[_local_4.type] = _local_4.id;
                        _local_2.push(_local_4.type);
                    };
                };
            };
        }

        public function clearPetBattleSetting():void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_6:int;
            var _local_7:int;
            var _local_1:Object = view.getUI(ViewManager.PANEL_BATTLESET);
            var _local_2:Boolean = _local_1.initialized;
            for (_local_5 in GamePredef.PET_AUTO_BATTLE_SLOT_ID)
            {
                _local_6 = GamePredef.PET_AUTO_BATTLE_SLOT_ID[_local_5];
                _local_3 = ("bt" + _local_6);
                _local_4 = ("bs" + _local_6);
                GamePredef.GLOBAL_SETTING[_local_3] = 0;
                GamePredef.GLOBAL_SETTING[_local_4] = 0;
                if (_local_2)
                {
                    _local_1[("i" + _local_6)].clean();
                };
            };
            for (_local_5 in GamePredef.PET_AUTO_BATTLE_SLIDE_ID)
            {
                _local_7 = GamePredef.PET_AUTO_BATTLE_SLIDE_ID[_local_5];
                _local_3 = ("p" + _local_7);
                GamePredef.GLOBAL_SETTING[_local_3] = 10;
                if (_local_2)
                {
                    _local_1[("hs" + _local_7)].value = 10;
                };
            };
        }

        public function haveSpecialStr2(_arg_1:String):Boolean
        {
            if (((((((((((((((((((((((((((((((((((((((((_arg_1.indexOf("[人物]") >= 0) || (_arg_1.indexOf("[包裹]") >= 0)) || (_arg_1.indexOf("[公会]") >= 0)) || (_arg_1.indexOf("[任务]") >= 0)) || (_arg_1.indexOf("[社交]") >= 0)) || (_arg_1.indexOf("[宠物]") >= 0)) || (_arg_1.indexOf("[技能]") >= 0)) || (_arg_1.indexOf("[小地图]") >= 0)) || (_arg_1.indexOf("[排行榜]") >= 0)) || (_arg_1.indexOf("[公会]") >= 0)) || (_arg_1.indexOf("[帮助]") >= 0)) || (_arg_1.indexOf("[设置]") >= 0)) || (_arg_1.indexOf("[世界地图]") >= 0)) || (_arg_1.indexOf("[商城]") >= 0)) || (_arg_1.indexOf("[自动战斗]") >= 0)) || (_arg_1.indexOf("[婚恋交友]") >= 0)) || (_arg_1.indexOf("[玩法]") >= 0)) || (_arg_1 == "人物")) || (_arg_1 == "包裹")) || (_arg_1 == "公会")) || (_arg_1 == "任务")) || (_arg_1 == "社交")) || (_arg_1 == "宠物")) || (_arg_1 == "技能")) || (_arg_1 == "小地图")) || (_arg_1 == "排行榜")) || (_arg_1 == "公会")) || (_arg_1 == "帮助")) || (_arg_1 == "设置")) || (_arg_1 == "世界地图")) || (_arg_1 == "商城")) || (_arg_1 == "自动战斗")) || (_arg_1 == "婚恋交友")) || (_arg_1 == "玩法")) || (_arg_1.indexOf("父亲") >= 0)) || (_arg_1 == "父亲")) || (_arg_1.indexOf("母亲") >= 0)) || (_arg_1 == "母亲")) || (_arg_1.indexOf("商人") >= 0)) || (_arg_1 == "商人")))
            {
                return (true);
            };
            return (false);
        }

        public function initTimer():void
        {
            remote.call("getTodayOnlineTime", new Responder(onGetTodayOnlineTime));
        }

        public function updateSettingNow(_arg_1:String, _arg_2:*, _arg_3:Boolean=false):void
        {
            if (_arg_3)
            {
                updatePetSetting(_arg_1, _arg_2);
            }
            else
            {
                updateSetting(_arg_1, _arg_2);
            };
            remote.call("uif", null, _arg_1, _arg_2, _arg_3);
        }

        public function isPlayer10():Boolean
        {
            var _local_1:String = Capabilities.version.split(",")[0];
            if (_local_1 == "WIN 10")
            {
                return (true);
            };
            return (false);
        }

        public function createSceneItem(_arg_1:Object):void
        {
            var _local_2:SceneItem = new SceneItem();
            _local_2.data = _arg_1.iData;
            _local_2.templateData = _arg_1.tData;
            if (_local_2.templateData)
            {
                view.addS(_local_2);
                data.addNewData(GamePredef.TBL_SCENEITEM_TEMPLATE, _arg_1.tData);
            }
            else
            {
                trace((("严重错误：地图遮罩缺少了模板资源，实例id:" + _local_2.data.id) + "，速度找策划解决！！！"));
            };
        }

        public function set item(_arg_1:Object):void
        {
            _item = _arg_1;
        }

        public function playPK():void
        {
            if (!player)
            {
                stopAll();
                return;
            };
            playMusic("6");
        }

        public function setBloodBag(_arg_1:String):void
        {
            var _local_2:Array;
            if (((_arg_1 == null) || (_arg_1 == "")))
            {
                _arg_1 = "|0|0|0|0";
            };
            if (_arg_1)
            {
                _local_2 = _arg_1.split("|");
                bloodBag[1] = Number(_local_2[1]);
                bloodBag[2] = Number(_local_2[2]);
                bloodBag[3] = Number(_local_2[3]);
                bloodBag[4] = Number(_local_2[4]);
            };
            if (!bloodBag[1])
            {
                bloodBag[1] = 0;
            };
            if (!bloodBag[2])
            {
                bloodBag[2] = 0;
            };
            if (!bloodBag[3])
            {
                bloodBag[3] = 0;
            };
            if (!bloodBag[4])
            {
                bloodBag[4] = 0;
            };
            view.getUI(ViewManager.MAIN_SELF).setHpMp();
            view.getUI(ViewManager.MAIN_PET).setHpMp();
        }

        public function addLink(_arg_1:int, _arg_2:Number, _arg_3:String):void
        {
            var _local_4:int = 1;
            while (_local_4 <= 6)
            {
                if (GamePredef.PRE_EQU_NAME[_local_4])
                {
                    _arg_3 = _arg_3.replace(GamePredef.PRE_EQU_NAME[_local_4], "");
                };
                if (GamePredef.ELEMENT_NAME[_local_4])
                {
                    _arg_3 = _arg_3.replace(("*" + GamePredef.ELEMENT_NAME[_local_4]), "");
                };
                _local_4++;
            };
            view.getUI(ViewManager.MAIN_SYS).addLink(LinkEncode.encode(_arg_1, _arg_2, _arg_3));
        }

        public function stopAll():void
        {
            local.send("_SoundConnection", "stopMusic");
        }

        public function haveSpecialStr(_arg_1:String):Boolean
        {
            if (((((((((((((((((((_arg_1.indexOf("&") >= 0) || (_arg_1.indexOf("'") >= 0)) || (_arg_1.indexOf('"') >= 0)) || (_arg_1.indexOf("-") >= 0)) || (_arg_1.indexOf("\\") >= 0)) || (_arg_1.indexOf("/") >= 0)) || (_arg_1.indexOf("|") >= 0)) || (_arg_1.indexOf("%") >= 0)) || (_arg_1.indexOf("\n") >= 0)) || (_arg_1.indexOf("\r") >= 0)) || (_arg_1.indexOf("\t") >= 0)) || (_arg_1.indexOf("\b") >= 0)) || (_arg_1.indexOf("\f") >= 0)) || (_arg_1.indexOf("\x0B") >= 0)) || (_arg_1.indexOf("<") >= 0)) || (_arg_1.indexOf(">") >= 0)) || (_arg_1.indexOf("@") >= 0)) || (_arg_1.indexOf("*") >= 0)))
            {
                return (true);
            };
            return (false);
        }

        public function createNpc(_arg_1:Object):void
        {
            if ((((_arg_1.type == GamePredef.NPC_TYPE_AUCTION) || (_arg_1.type == GamePredef.NPC_TYPE_MAIL)) && (!(lineInfo.auction))))
            {
                return;
            };
            if (((_arg_1.type == GamePredef.NPC_TYPE_GUILD) && (!(lineInfo.guild))))
            {
                return;
            };
            if (((_arg_1.type == GamePredef.NPC_TYPE_BUILD) && (_arg_1.hasOwnProperty("bState"))))
            {
                if (Number(_arg_1.bState) == Number(1))
                {
                    _arg_1.resCode = GamePredef.BUILD_NPC_INBUILDING_RES;
                }
                else
                {
                    _arg_1.resCode = GamePredef.BUILD_NPC_TOBEBUILD_RES;
                };
            };
            if (_arg_1.v == -1)
            {
                if (!npcVisiable(_arg_1))
                {
                    return;
                };
            };
            var _local_2:Npc = new Npc();
            _local_2.data = _arg_1;
            data.addNewData(GamePredef.TBL_NPC, _arg_1);
            view.addN(_local_2);
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (_bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function haveBadWord(_arg_1:String):Boolean
        {
            var _local_2:String;
            for each (_local_2 in GamePredef.BADWORDAR)
            {
                if (_local_2)
                {
                    if (((_arg_1.length >= _local_2.length) && (_arg_1.indexOf(_local_2) >= 0)))
                    {
                        Alert.show(Language.CORE_S[8], "", Alert.OK);
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            _bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function getHtmlStr(_arg_1:String):String
        {
            var _local_3:Boolean;
            var _local_2:int;
            while (_local_2 < _arg_1.length)
            {
                _local_3 = false;
                if (_arg_1.indexOf("<") >= 0)
                {
                    _local_3 = true;
                    _arg_1 = _arg_1.replace("<", "&lt;");
                };
                if (_arg_1.indexOf(">") >= 0)
                {
                    _local_3 = true;
                    _arg_1 = _arg_1.replace(">", "&gt;");
                };
                if (!_local_3) break;
                _local_2++;
            };
            return (_arg_1);
        }

        public function get skill():Object
        {
            return (_skill);
        }

        public function codeMsg(_arg_1:int):void
        {
        }

        public function sysRedMsg(_arg_1:String):void
        {
            view.showRedMsg(_arg_1);
        }

        public function isFriend(_arg_1:String):Boolean
        {
            return (view.getUI(ViewManager.PANEL_IM).isFriend(_arg_1));
        }

        public function deal():void
        {
            var _local_1:String;
            if (by_session == "sdo")
            {
                ExternalInterface.call("sdoPay");
            }
            else
            {
                if (GamePredef.SERVER_ADD_PAY.indexOf("?thirdparty=va&game_id=1") >= 0)
                {
                    _local_1 = ((GamePredef.SERVER_ADD_PAY + "&user=") + user);
                    navigateToURL(new URLRequest(_local_1), "_blank");
                }
                else
                {
                    if (isGOSU)
                    {
                        navigateToURL(new URLRequest("http://game.gosu.vn/game/vua-phap-thuat/Exchange.aspx"), "_blank");
                    }
                    else
                    {
                        navigateToURL(new URLRequest(GamePredef.SERVER_ADD_PAY), "_blank");
                    };
                };
            };
        }

        private function set _985752863player(_arg_1:Player):void
        {
            _self = _arg_1;
        }

        public function hasEggNum():int
        {
            return (hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_EGG));
        }

        public function set itemState(_arg_1:int):void
        {
            _itemState = _arg_1;
        }

        public function getGuildItemNum(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_3:Object = getTemplateData(_arg_1, _arg_2, false);
            var _local_5:int;
            if (!_local_3)
            {
                return ({
                    "num":_local_5,
                    "slot":_local_4
                });
            };
            for (_local_6 in data.gsList)
            {
                _local_7 = data.gsList[_local_6];
                if (((_local_7) && (Number(_local_7.type) == (_arg_1 - 1))))
                {
                    _local_8 = getTemplateData(_local_7.type, _local_7.itemId, false);
                    if (_local_8)
                    {
                        if (_local_8.id == _arg_2)
                        {
                            _local_5 = (_local_5 + Number(_local_7.stackNum));
                            if (!_local_4)
                            {
                                _local_4 = _local_7;
                            };
                        };
                    };
                };
            };
            return ({
                "num":_local_5,
                "slot":_local_4
            });
        }

        public function createPet(_arg_1:Object):Pet
        {
            var _local_2:Pet = new Pet();
            _local_2.data = _arg_1;
            return (_local_2);
        }

        public function get guid():Number
        {
            return (_guid);
        }

        public function destroyNpc(_arg_1:int):void
        {
            view.removeN(_arg_1);
        }

        public function get state():int
        {
            return (_state);
        }

        public function addCharactorView(_arg_1:Charactor):void
        {
            view.addC(_arg_1);
        }

        public function set battlePet(_arg_1:Object):void
        {
            _battlePet = _arg_1;
        }

        public function checkFinishGuides(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            var _local_6:*;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:Object;
            for (_local_6 in lastIdxs)
            {
                _local_7 = lastIdxs[_local_6];
                _local_8 = data.gameData[GamePredef.TBL_GUIDE][_local_7];
                if ((((((_local_8) && (_arg_1 == _local_8.scPid)) && (_arg_2 == _local_8.scQname)) && (_arg_3 == _local_8.scNpcid)) && (_arg_5 == _local_8.finishType)))
                {
                    remote.call("saveGuideLog", null, _local_7);
                    _local_9 = view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
                    _local_9.hide();
                    trace((((("指引类型：" + _local_6) + ", step:") + lastIdxs[_local_6]) + " 已经完成"));
                    delete lastIdxs[_local_6];
                    break;
                };
            };
        }

        public function haveItem(_arg_1:int, _arg_2:Number, _arg_3:int):Boolean
        {
            if (getItemNum(_arg_1, _arg_2).num >= _arg_3)
            {
                return (true);
            };
            return (false);
        }

        public function getNetDelayState(_arg_1:Number):int
        {
            var _local_3:*;
            var _local_2:int = 4;
            for (_local_3 in GamePredef.NET_DELAY_STATE)
            {
                if (_arg_1 <= GamePredef.NET_DELAY_STATE[_local_3])
                {
                    _local_2 = _local_3;
                    break;
                };
            };
            return (_local_2);
        }

        public function addFriend(_arg_1:String):void
        {
            view.getUI(ViewManager.PANEL_IM).addFriend(_arg_1);
        }

        private function onTimer(event:TimerEvent):void
        {
            var onGetOnlineActive:Function = function (_arg_1:int):void
            {
                if (_arg_1 == -1)
                {
                    initTimer();
                }
                else
                {
                    if (_arg_1 > 0)
                    {
                        timer.stop();
                        timer.delay = (_arg_1 * 60000);
                        timer.start();
                    };
                };
            };
            remote.call("getDailyOnlineAct", new Responder(onGetOnlineActive));
        }

        public function checkGuideCondition(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int):Boolean
        {
            var _local_5:*;
            var _local_6:int;
            var _local_7:Object;
            for (_local_5 in lastIdxs)
            {
                _local_6 = lastIdxs[_local_5];
                _local_7 = data.gameData[GamePredef.TBL_GUIDE][_local_6];
                if ((((((_local_7) && (_arg_1 == _local_7.scPid)) && (_arg_2 == _local_7.scQname)) && (_arg_3 == _local_7.scNpcid)) && (_arg_4 == _local_7.scOtherId)))
                {
                    currentType = _local_7.type;
                    return (true);
                };
            };
            return (false);
        }

        public function set skill(_arg_1:Object):void
        {
            _skill = _arg_1;
        }

        public function setNpcState(_arg_1:int):void
        {
            var _local_4:Number;
            var _local_2:Npc = getNpc(_arg_1);
            var _local_3:Number = Number(player.posMapId);
            if (((_local_3 > 20000) && (data.gameData[GamePredef.TBL_MAP][_local_3])))
            {
                _local_3 = Number(data.gameData[GamePredef.TBL_MAP][_local_3].templateId);
            };
            if (_local_2)
            {
                _local_4 = Number(_local_2.posMapId);
                if (((_local_4 > 20000) && (data.gameData[GamePredef.TBL_MAP][_local_4])))
                {
                    _local_4 = Number(data.gameData[GamePredef.TBL_MAP][_local_4].templateId);
                };
                if (_local_4 == _local_3)
                {
                    remote.setNpcState(_arg_1);
                };
            };
        }

        public function playBoss():void
        {
            if (!player)
            {
                stopAll();
                return;
            };
            playMusic("4");
        }

        public function createCharactor(_arg_1:Object):Charactor
        {
            var _local_2:Charactor;
            _local_2 = getCharactor(_arg_1.id);
            if (_local_2 != null)
            {
                if (_local_2.broT != _arg_1.broT)
                {
                    _local_2.broT = _arg_1.broT;
                };
                if (((_arg_1.actTN) && (!(_local_2.actTN == _arg_1.actTN))))
                {
                    _local_2.actTN = _arg_1.actTN;
                };
                return (_local_2);
            };
            _local_2 = new Charactor();
            if (_arg_1.groupAfk)
            {
                _local_2.groupAfk = _arg_1.groupAfk;
            };
            delete _arg_1.groupAfk;
            _local_2.data = _arg_1;
            view.addC(_local_2);
            if (((_local_2.inGroup) && (!(_local_2.groupAfk))))
            {
                return (_local_2);
            };
            var _local_3:Object = _arg_1.showPetObj;
            if (!_local_3)
            {
                return (_local_2);
            };
            var _local_4:Pet = this.createPet(_local_3);
            this.view.addP(_local_4);
            return (_local_2);
        }

        public function updatePlayerPortrait():void
        {
            var _local_1:Object = view.getUI(ViewManager.MAIN_SELF);
            _local_1.update();
        }

        public function addWarn(_arg_1:Object):void
        {
            view.getUI(ViewManager.MAIN_WARN).addWarn(_arg_1);
        }

        public function fetchQxWish(_arg_1:Object):Object
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            if (_arg_1)
            {
                if (qxWishesArr[_arg_1.idx])
                {
                    qxWishesArr[_arg_1.idx].flag = true;
                };
            };
            var _local_2:int;
            for (_local_3 in qxWishesArr)
            {
                if (qxWishesArr[_local_3].flag)
                {
                    _local_2++;
                };
            };
            if (_local_2 < 1)
            {
                return (null);
            };
            _local_4 = -1;
            do 
            {
                _local_5 = 0;
                for (_local_6 in qxWishesArr)
                {
                    if (qxWishesArr[_local_6].flag)
                    {
                        _local_5++;
                    };
                };
                if (_local_5 < 1)
                {
                    return (null);
                };
                _local_4 = int(Math.round((Math.random() * qxWishesArr.length)));
            } while (((!(qxWishesArr[_local_4])) || (!(qxWishesArr[_local_4].flag))));
            qxWishesArr[_local_4].flag = false;
            qxWishesArr[_local_4].idx = _local_4;
            return (qxWishesArr[_local_4]);
        }

        public function getTargetData():Object
        {
            return (target.data);
        }

        public function createBuild(_arg_1:Object):Building
        {
            var _local_2:Building = new Building();
            var _local_3:Object = GameData.d[GamePredef.TBL_BUILDING][_arg_1.tid];
            var _local_4:Object = ObjectUtil.copy(_local_3);
            _local_4.posX = _arg_1.posX;
            _local_4.posY = _arg_1.posY;
            _local_4.posDir = _arg_1.posDir;
            _local_4.tid = _arg_1.tid;
            _local_4.id = _arg_1.id;
            _local_4.layer = _arg_1.layer;
            _local_4.buildState = _arg_1.buildState;
            if (_arg_1.hasOwnProperty("buildType"))
            {
                _local_4.buildType = _arg_1.buildType;
            };
            _local_2.data = _local_4;
            if (((Number(_local_4.type) == Number(GamePredef.TYPE_GUILD_BUILD)) || (Number(_local_4.type) == Number(GamePredef.TYPE_PRIVATE_BUILD))))
            {
                view.addB(_local_2);
            }
            else
            {
                view.addE(_local_2);
            };
            return (_local_2);
        }

        public function sysMidNote(_arg_1:String):void
        {
            view.showMidNote(_arg_1);
        }

        public function skillBookBySkillName(_arg_1:String):Object
        {
            var _local_4:*;
            _arg_1 = (Language.GAMEPREDEF_S[359] + _arg_1);
            var _local_2:Object = this.data.gameDataIndex[GamePredef.TBL_ITEM_TEMPLATE][_arg_1];
            var _local_3:Object;
            for each (_local_4 in _local_2)
            {
                if (((_local_4.name == _arg_1) && (_local_4.type == 505)))
                {
                    _local_3 = _local_4;
                    break;
                };
            };
            return (_local_3);
        }

        public function refresh():void
        {
            if (ExternalInterface.available)
            {
                ExternalInterface.call("refresh");
                trace("call js refresh");
            };
        }

        public function gc():void
        {
            lastGC = new Date().getTime();
            try
            {
                new LocalConnection().connect("foo");
                new LocalConnection().connect("foo");
            }
            catch(error:Error)
            {
            };
        }

        public function getTitleByBuffId(_arg_1:int):Object
        {
            var _local_2:Object;
            for each (_local_2 in GameData.d[GamePredef.TBL_TITLE])
            {
                if (_local_2.b == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function get cid():Number
        {
            return (_cid);
        }

        public function get player():Player
        {
            return (_self);
        }

        public function addAwardWarn(_arg_1:Object):void
        {
            view.getUI(ViewManager.MAIN_AWARD_WARN).addAwardWarn(_arg_1);
        }

        public function createP(_arg_1:Object):Pet
        {
            var _local_2:Pet = new Pet();
            _local_2.data = _arg_1;
            return (_local_2);
        }

        public function getPetNum(_arg_1:Number, _arg_2:String):int
        {
            var _local_5:Object;
            var _local_3:int;
            var _local_4:Object = player.petList;
            for each (_local_5 in _local_4)
            {
                if ((((_local_5) && (Number(_local_5.tid) == _arg_1)) && (_local_5.petName == _arg_2)))
                {
                    _local_3++;
                };
            };
            return (_local_3);
        }

        public function getShowPetId():Number
        {
            return (_showPetId);
        }

        public function set ui_create_complete(_arg_1:Boolean):void
        {
            this._ui_create_complete = _arg_1;
            if (((_arg_1) && (logined)))
            {
                view.hide(ViewManager.POPU_WAIT);
            };
        }

        public function set cmdState(_arg_1:int):void
        {
            _cmdState = _arg_1;
        }

        public function getFazendaLevelByExp(_arg_1:int):int
        {
            var _local_3:*;
            var _local_2:int = 5;
            for (_local_3 in GamePredef.FARM_LVUP_CONFIG)
            {
                if (_arg_1 <= GamePredef.FARM_LVUP_CONFIG[_local_3].exp)
                {
                    _local_2 = _local_3;
                    break;
                };
            };
            return (_local_2);
        }

        public function getSkillData(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_3:Object = data.getData(GamePredef.TBL_SKILL, _arg_1);
            if (_local_3)
            {
                _local_4 = data.gameDataIndex[GamePredef.TBL_SKILL];
                _local_5 = _local_4[_local_3.codeName];
                for (_local_6 in _local_5)
                {
                    _local_7 = _local_5[_local_6];
                    if (_local_7.level == _arg_2)
                    {
                        return (_local_7);
                    };
                };
                return (null);
            };
            return (null);
        }

        public function hasTrackNum():int
        {
            return (hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRACK));
        }

        public function checkSkillRequire(_arg_1:Object, _arg_2:Boolean=false, _arg_3:Boolean=false):Boolean
        {
            var _local_4:Object;
            if (_arg_3)
            {
                _local_4 = battlePet;
                if (!_local_4)
                {
                    return (false);
                };
                if (_local_4.currentHp < _arg_1.useHp)
                {
                    if (_arg_2)
                    {
                        sysMidNote(((Language.CORE_S[0] + _arg_1.name) + Language.CORE_S[1]));
                    };
                    return (false);
                };
                if (((_arg_1.useMp > 0) && (_arg_1.useMp < 1)))
                {
                    if (_local_4.currentMp < (_arg_1.useMp * _local_4.property.finalMp))
                    {
                        if (_arg_2)
                        {
                            sysMidNote(((Language.CORE_S[2] + _arg_1.name) + Language.CORE_S[3]));
                        };
                        return (false);
                    };
                    return (true);
                };
                if (_local_4.currentMp < _arg_1.useMp)
                {
                    if (_arg_2)
                    {
                        sysMidNote(((Language.CORE_S[2] + _arg_1.name) + Language.CORE_S[3]));
                    };
                    return (false);
                };
                return (true);
            };
            if (((_arg_1.useHp > 0) && (_arg_1.useHp < 1)))
            {
                if (player.currentHp < (_arg_1.useHp * player.property.finalHp))
                {
                    if (_arg_2)
                    {
                        sysMidNote(((Language.CORE_S[4] + _arg_1.name) + Language.CORE_S[7]));
                    };
                    return (false);
                };
                return (true);
            };
            if (player.currentHp < _arg_1.useHp)
            {
                if (_arg_2)
                {
                    sysMidNote(((Language.CORE_S[4] + _arg_1.name) + Language.CORE_S[5]));
                };
                return (false);
            };
            if (((_arg_1.useMp > 0) && (_arg_1.useMp < 1)))
            {
                if (player.currentMp < (_arg_1.useMp * player.property.finalMp))
                {
                    if (_arg_2)
                    {
                        sysMidNote(((Language.CORE_S[6] + _arg_1.name) + Language.CORE_S[7]));
                    };
                    return (false);
                };
                return (true);
            };
            if (player.currentMp < _arg_1.useMp)
            {
                if (_arg_2)
                {
                    sysMidNote(((Language.CORE_S[6] + _arg_1.name) + Language.CORE_S[7]));
                };
                return (false);
            };
            player.currentSp = ((player.currentSp) || (0));
            if (((_arg_1.useSp > 0) && (_arg_1.useSp < 1)))
            {
                if (player.currentSp < (_arg_1.useSp * player.property.finalSp))
                {
                    if (_arg_2)
                    {
                        sysMidNote(Language.CORE_S[10].replace("{skillName}", _arg_1.name));
                    };
                    return (false);
                };
                return (true);
            };
            if (player.currentSp < _arg_1.useSp)
            {
                if (_arg_2)
                {
                    sysMidNote(Language.CORE_S[10].replace("{skillName}", _arg_1.name));
                };
                return (false);
            };
            return (true);
        }

        public function createPlayer(_arg_1:Object):Player
        {
            var _local_2:Player;
            var _local_3:Object;
            var _local_4:Pet;
            _local_2 = (getCharactor(_arg_1.id) as Player);
            if (_local_2 != null)
            {
                return (_local_2);
            };
            _local_2 = new Player();
            _local_2.data = _arg_1;
            view.addC(_local_2);
            if (((_local_2.inGroup) && (!(_local_2.groupAfk))))
            {
                return (_local_2);
            };
            if ((((!(this.view.getUI(ViewManager.MAIN_LONGBUFF).containBuff(GamePredef.SHOW_PET_BUFF))) && (!(this.view.getUI(ViewManager.MAIN_LONGBUFF).containBuff(GamePredef.SHOW_PET_BUFF2)))) && ((this.player) && ((!(this.player.pmLevel)) || (Number(this.player.pmLevel) == 0)))))
            {
                this.remote.call("cancelPetFollow", null, getShowPetId());
                return (_local_2);
            };
            if (getShowPetId() > 0)
            {
                _local_3 = _arg_1.showPetObj;
                if (!_local_3)
                {
                    return (_local_2);
                };
                _local_4 = createPet(_local_3);
                view.addP(_local_4);
            };
            return (_local_2);
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function isBlack(_arg_1:String):Boolean
        {
            return (view.getUI(ViewManager.PANEL_IM).isBlack(_arg_1));
        }

        public function getSceneItem(_arg_1:int):SceneItem
        {
            var _local_2:Object = view.getS(_arg_1);
            if (_local_2)
            {
                return (_local_2.gameObject);
            };
            return (null);
        }

        public function playBattle():void
        {
            if (!player)
            {
                stopAll();
                return;
            };
            var _local_1:Object = view.getUI(ViewManager.STAGE_BATTLE);
            if (((_local_1) && (_local_1.boss > 0)))
            {
                playMusic("4");
                return;
            };
            playMusic("5");
        }

        public function addMidWarn(_arg_1:Object):void
        {
            view.getUI(ViewManager.MID_MAIN_WARN).addWarn(_arg_1);
        }

        public function set guid(_arg_1:Number):void
        {
            _guid = _arg_1;
        }

        public function get item():Object
        {
            return (_item);
        }

        public function isCollegeMap(_arg_1:int):Boolean
        {
            var _local_2:*;
            for (_local_2 in GamePredef.MAP_ID_BY_CLASS)
            {
                if (_arg_1 == GamePredef.MAP_ID_BY_CLASS[_local_2])
                {
                    return (true);
                };
            };
            return (false);
        }

        public function init():void
        {
            cid = -1;
            guid = -1;
            if (player)
            {
                player.onLogout();
                destroyCharactor(player.id);
                player = null;
            };
            resetLine();
            view.reset();
            stopAll();
        }

        public function haveSpecialStr_vn(_arg_1:String):Boolean
        {
            if (_arg_1.indexOf("@") >= 0)
            {
                return (true);
            };
            return (false);
        }

        public function getItemNumNew(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:Object;
            var _local_5:int;
            var _local_7:Array;
            var _local_8:Object;
            var _local_9:String;
            var _local_3:Object = getTemplateData(_arg_1, _arg_2, false);
            if (!_local_3)
            {
                return ({
                    "num":_local_5,
                    "slot":_local_4
                });
            };
            switch (_arg_1)
            {
                case GamePredef.TBL_ITEM_TEMPLATE:
                case GamePredef.TBL_EQUIPT_TEMPLATE:
                    _arg_1--;
                    break;
            };
            _local_5 = 0;
            var _local_6:Object = data.bagSlotIndex;
            if (((_local_6) && (_local_6[_arg_1])))
            {
                _local_7 = _local_6[_arg_1][_local_3.id];
                if (!_local_7)
                {
                    return ({
                        "num":_local_5,
                        "slot":_local_4
                    });
                };
                for (_local_9 in _local_7)
                {
                    _local_8 = data.sList[_local_7[_local_9]];
                    if ((((_local_8) && (Number(_local_8.sid) > GamePredef.SLOT_SID_BAG[0])) && (Number(_local_8.sid) <= GamePredef.SLOT_SID_BAG[_self.bagSlotNum])))
                    {
                        _local_5 = (_local_5 + Number(_local_8.stackNum));
                        if (!_local_4)
                        {
                            _local_4 = data.sList[_local_7[_local_9]];
                        };
                    };
                };
            };
            return ({
                "num":_local_5,
                "slot":_local_4
            });
        }

        private function npcVisiable(_arg_1:Object):Boolean
        {
            var _local_2:String;
            var _local_3:Object;
            if (_arg_1.type == GamePredef.NPC_TYPE_BATTLE)
            {
                if (_arg_1.subType == "all")
                {
                    return (true);
                };
                _local_2 = _arg_1.subType;
            };
            for each (_local_3 in player.questList)
            {
                if (_local_3.data.finishNpc == _arg_1.id)
                {
                    return (true);
                };
                if (((_arg_1.type == GamePredef.NPC_TYPE_BATTLE) && (_local_2.indexOf(_local_3.data.id) >= 0)))
                {
                    return (true);
                };
            };
            return (false);
        }

        public function set state(_arg_1:int):void
        {
            _state = _arg_1;
        }

        public function checkTempBagItemPos(_arg_1:Object):Boolean
        {
            var _local_3:*;
            var _local_2:Object = player.tBag.tempList;
            for (_local_3 in _local_2)
            {
                if (_local_3 == _arg_1.slotData.idx)
                {
                    if ((((!(_local_2[_local_3].t == _arg_1.slotData.ii)) || (!(_local_2[_local_3].n == _arg_1.slotData.n))) || (!((_local_2[_local_3].c * 5) == _arg_1.slotData.q))))
                    {
                        sysMidNote("你的材料位置发生了变化，请重新放入材料");
                        _arg_1.clean();
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function playNormal():void
        {
            if (!player)
            {
                stopAll();
                return;
            };
            var _local_1:Object = data.gameData[GamePredef.TBL_MAP][player.posMapId];
            if (((_local_1) && (_local_1.m >= 0)))
            {
                playMusic(_local_1.m);
                return;
            };
            playMusic("1");
        }

        private function localOnStatus(_arg_1:StatusEvent):void
        {
            switch (_arg_1.level)
            {
                case "status":
                    trace("LocalConnection.send() succeeded");
                    return;
                case "error":
                    trace("LocalConnection.send() failed");
                    return;
            };
        }

        public function initMainUI():void
        {
            view.initView(ViewManager.MAIN_SELF);
            view.initView(ViewManager.MAIN_PET);
            view.initView(ViewManager.MAIN_USER_BAR);
            view.initView(ViewManager.MAIN_MINIMAP);
            view.initView(ViewManager.PANEL_BAG);
            view.initView(ViewManager.PANEL_IM);
            view.initView(ViewManager.PANEL_PETMANAGER);
            view.initView(ViewManager.PANEL_SYSTEM);
            view.initView(ViewManager.PANEL_ACHIEVE);
            view.initView(ViewManager.PANEL_ACHIEVE_WATCHING);
            view.initView(ViewManager.PANEL_FAIRY_MANAGER);
        }

        public function lotteryBlueMsg(_arg_1:String):void
        {
            view.showLotteryBlueMsg(_arg_1);
        }

        public function sysBlueMsg(_arg_1:String):void
        {
            view.showBlueMsg(_arg_1);
        }

        public function getItemNum(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:*;
            var _local_3:Object = getTemplateData(_arg_1, _arg_2, false);
            var _local_5:int;
            if (!_local_3)
            {
                return ({
                    "num":_local_5,
                    "slot":_local_4
                });
            };
            for (_local_6 in data.sList)
            {
                _local_7 = data.sList[_local_6];
                if (((_local_7) && (Number(_local_7.type) == (_arg_1 - 1))))
                {
                    _local_8 = getTemplateData(_local_7.type, _local_7.itemId, false);
                    if (_local_8)
                    {
                        if (_local_8.id == _arg_2)
                        {
                            _local_5 = (_local_5 + Number(_local_7.stackNum));
                            if (!_local_4)
                            {
                                _local_4 = _local_7;
                            };
                        };
                    };
                };
            };
            if (((_arg_1 == GamePredef.TBL_ITEM_TEMPLATE) && (Core.getInstance().player.tBag)))
            {
                _local_9 = Core.getInstance().player.tBag.tempList;
                if (_local_9)
                {
                    for (_local_6 in _local_9)
                    {
                        if ((((_local_9[_local_6]) && (_local_9[_local_6].t)) && (_local_9[_local_6].t == _arg_2)))
                        {
                            _local_5 = (_local_5 + Number(_local_9[_local_6].n));
                        };
                    };
                };
            };
            return ({
                "num":_local_5,
                "slot":_local_4
            });
        }

        public function updateSetting(_arg_1:String, _arg_2:*):void
        {
            var _local_5:SharedObject;
            GamePredef.GLOBAL_SETTING[_arg_1] = _arg_2;
            var _local_3:RegExp = /([a-zA-Z]*)(\d*)/;
            var _local_4:Object = _local_3.exec(_arg_1);
            if (((_local_4) && (_local_4[1] == "sid")))
            {
                view.getUI(ViewManager.MAIN_USER_BAR).updateUserBar(_local_4[2]);
                return;
            };
            if (((_local_4) && (_local_4[1] == "bs")))
            {
                view.getUI(ViewManager.PANEL_BATTLESET).updateSlot(_local_4[2]);
                return;
            };
            if (_arg_1 == "am")
            {
                _local_5 = SharedObject.getLocal("musicSetting");
                _local_5.data.musicSetting = _arg_2;
                if (_arg_2)
                {
                    playNormal();
                }
                else
                {
                    stopAll();
                };
            };
            switch (_arg_1)
            {
                case "pid":
                    view.getUI(ViewManager.PANEL_PRODUCT).updateMana(_arg_2);
                    return;
                case "am":
                    return;
                case "he":
                    view.getUI(ViewManager.STAGE_BATTLE).useEffect = (!(_arg_2));
                    return;
                case "hm":
                    view.getUI(ViewManager.STAGE_BATTLE).useModel = (!(_arg_2));
                    return;
                case "glid":
                    view.getUI(ViewManager.PANEL_PRODUCT).updateGlove(_arg_2);
                    return;
                case "dressHide":
                    view.initView(ViewManager.PANEL_CHARACTOR);
                    view.getUI(ViewManager.PANEL_CHARACTOR).setDressHideCBSelected(_arg_2);
                    view.getUI(ViewManager.PANEL_CHARACTOR).setDressHide();
                case "flyEffect":
                    if (_arg_2)
                    {
                        GamePredef.FLYING_ZOOM_RATE = 0.7;
                        GamePredef.FLYING_PLAYER_ZOOM_RATE = 0.9;
                    }
                    else
                    {
                        GamePredef.FLYING_ZOOM_RATE = 1;
                        GamePredef.FLYING_PLAYER_ZOOM_RATE = 1;
                    };
                    if (player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)
                    {
                        player.view.switchFlyingView();
                    };
                    if (((player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR) || (player.flyingState == GamePredef.FLYING_STATE_TAKING_OFF)))
                    {
                        if (_arg_2)
                        {
                            view.getUI(ViewManager.STAGE_MAIN_CONTAINER).drawClouds();
                        }
                        else
                        {
                            view.getUI(ViewManager.STAGE_MAIN_CONTAINER).clearClouds();
                        };
                    };
                    return;
                case "sjan":
                    view.getUI(ViewManager.MAIN_SELF).setLevelUpBtn();
                    return;
            };
        }

        public function hasSpeakerNum():int
        {
            return (hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_SPEAKER));
        }

        public function useItem(_arg_1:int, _arg_2:Object=null, _arg_3:Boolean=false):void
        {
            var _local_4:Object = getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, _arg_1);
            var _local_5:int = _local_4.num;
            var _local_6:Object = _local_4.slot;
            if (_arg_2)
            {
                _arg_2.stackNum = _local_5;
            };
            if (!_local_6)
            {
                sysMidNote(Language.CORE_S[9]);
                _arg_2.alpha = 0.5;
                return;
            };
            if (state == GamePredef.ST_CORE_NORMAL)
            {
                player.useItem(GamePredef.MOUSE_TARGET_CHA, -1, _local_6.id, _arg_3);
            }
            else
            {
                view.showSelect();
                cmdState = GamePredef.ST_BATTLE_ITEM;
                item = _local_6;
            };
            if (_arg_2)
            {
                _arg_2.stackNum--;
            };
        }

        private function onTimer10(_arg_1:TimerEvent):void
        {
            CheatChecker.check(_arg_1);
            if (((view) && (view.getUI(ViewManager.MAIN_MINIMAP))))
            {
                view.getUI(ViewManager.MAIN_MINIMAP).handleDelayTimer(_arg_1);
            };
            if (player)
            {
                _checkEquipEffectTime++;
                if (((_checkEquipEffectTime >= 60) && ((_checkEquipEffectTime % 60) == 0)))
                {
                    remote.call("checkLimitWingEffect", null);
                    _checkEquipEffectTime = -1;
                };
                _checkMagicCrystalEffectTime++;
                if (((_checkMagicCrystalEffectTime >= 60) && ((_checkMagicCrystalEffectTime % 60) == 0)))
                {
                    remote.call("initMagicCrystalData", null);
                    _checkMagicCrystalEffectTime = -1;
                };
            };
        }

        public function getItemNumByColor(_arg_1:int, _arg_2:int, _arg_3:int):Object
        {
            var _local_5:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:*;
            var _local_4:Object = getTemplateData(_arg_1, _arg_2, false);
            var _local_6:int;
            if (!_local_4)
            {
                return ({
                    "num":_local_6,
                    "slot":_local_5
                });
            };
            for (_local_7 in data.sList)
            {
                _local_8 = data.sList[_local_7];
                if ((((_local_8) && (data.isBagSlot(Number(_local_8.sid)))) && (Number(_local_8.type) == (_arg_1 - 1))))
                {
                    _local_9 = getTemplateData(_local_8.type, _local_8.itemId, false);
                    _local_10 = data.getGameData(_local_8.type, _local_8.itemId);
                    if (!((!(_local_9)) || (!(_local_10))))
                    {
                        if (!(((_arg_1 == GamePredef.TBL_EQUIPT_TEMPLATE) && (_local_9.king == GamePredef.ITEM_KIND_PETEQU)) && (_local_8.stackNum <= 0)))
                        {
                            if (((_local_9.id == _arg_2) && (_local_10.color == _arg_3)))
                            {
                                _local_6 = (_local_6 + Number(_local_8.stackNum));
                                if (!_local_5)
                                {
                                    _local_5 = _local_8;
                                };
                            };
                        };
                    };
                };
            };
            if (((_arg_1 == GamePredef.TBL_ITEM_TEMPLATE) && (Core.getInstance().player.tBag)))
            {
                _local_11 = Core.getInstance().player.tBag.tempList;
                if (_local_11)
                {
                    for (_local_7 in _local_11)
                    {
                        if (((((_local_11[_local_7]) && (_local_11[_local_7].t)) && (_local_11[_local_7].t == _arg_2)) && (_local_11[_local_7].c == _arg_3)))
                        {
                            _local_6 = (_local_6 + Number(_local_11[_local_7].n));
                        };
                    };
                };
            };
            return ({
                "num":_local_6,
                "slot":_local_5
            });
        }

        public function sysMidMsg(_arg_1:String):void
        {
            if (((_arg_1) && (_arg_1.length >= 1)))
            {
                view.showMidMsg(_arg_1);
                view.showRedMsg(_arg_1);
            };
        }

        public function get itemState():int
        {
            return (_itemState);
        }

        public function createCreature(_arg_1:Object):Creature
        {
            var _local_2:Creature = new Creature();
            _local_2.data = _arg_1;
            return (_local_2);
        }

        public function replaceBadWord(_arg_1:String):String
        {
            var _local_2:String;
            var _local_3:RegExp;
            for each (_local_2 in GamePredef.BADWORDAR)
            {
                if (_local_2)
                {
                    if (_arg_1.length >= _local_2.length)
                    {
                        _local_3 = new RegExp(_local_2, "g");
                        _arg_1 = _arg_1.replace(_local_3, "×");
                    };
                };
            };
            return (_arg_1);
        }

        public function checkTitleShow(_arg_1:int):Boolean
        {
            var _local_2:Object = GameData.d[GamePredef.TBL_TITLE][_arg_1];
            if (_local_2)
            {
                if (Number(_local_2.s) > 0)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function set skillLevel(_arg_1:int):void
        {
            _skillLevel = _arg_1;
        }

        public function playMusic(_arg_1:String):void
        {
            currentMusicId = _arg_1;
            if ((((GamePredef.GLOBAL_SETTING.am) && (allowMusic)) && (!(currentMusicId == ""))))
            {
                local.send("_SoundConnection", "playMusicByID", _arg_1);
            };
        }

        public function setShowPetId(_arg_1:Number):void
        {
            _showPetId = _arg_1;
            if (_arg_1 == -1)
            {
                this.view.getUI(ViewManager.PANEL_PETMANAGER).showPetFollowBtn.label = Language.PETMANAGERPANEL_S[23];
            };
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            _bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public function getClassName(_arg_1:int):String
        {
            var _local_2:Object = data.getGameData(GamePredef.TBL_CLASS, _arg_1);
            if (_local_2 != null)
            {
                return (_local_2.name);
            };
            return ("");
        }

        public function get ui_create_complete():Boolean
        {
            return (_ui_create_complete);
        }

        public function get cmdState():int
        {
            return (_cmdState);
        }

        public function hasItemNum(_arg_1:int, _arg_2:int):int
        {
            var _local_3:Object = getItemNum(_arg_1, _arg_2);
            return (_local_3.num);
        }

        public function startGame(_arg_1:uint):void
        {
            global.nc.client = new CallBackGlobal();
            remote.nc.client = new CallBack();
            remote.call("chooseCharactor", null, _arg_1);
            remote.call("getShopConfig", null);
            var _local_2:* = view.getUI(ViewManager.MAIN_LINE);
            _local_2.lineList = Login_Model.lineList;
            lineInfo = Login_Model.lineInfo;
            user = Login_Model.user;
            pass = Login_Model.pass;
            GamePredef.SERVER_ISACTING = Login_Model.SERVER_ISACTING;
        }

        public function set cid(_arg_1:Number):void
        {
            _cid = _arg_1;
        }

        public function get battlePet():Object
        {
            return (_battlePet);
        }

        public function getStarColor(_arg_1:Number):int
        {
            var _local_2:int;
            var _local_3:*;
            if (_arg_1 <= 1)
            {
                _local_2 = 0;
            }
            else
            {
                for (_local_3 in GamePredef.STAR_ADDITION_COLOR)
                {
                    if (_arg_1 <= GamePredef.STAR_ADDITION_COLOR[_local_3])
                    {
                        _local_2 = _local_3;
                        break;
                    };
                };
            };
            return (_local_2);
        }

        public function sysMsg(_arg_1:String):void
        {
            view.showSysMsg(_arg_1);
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (_bindingEventDispatcher.willTrigger(_arg_1));
        }

        public function set bloodBag(_arg_1:Array):void
        {
            var _local_2:Object = this._653737042bloodBag;
            if (_local_2 !== _arg_1)
            {
                this._653737042bloodBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bloodBag", _local_2, _arg_1));
            };
        }

        public function logout():void
        {
            init();
            remote.showAlert = false;
            remote.nc.close();
            remote.showAlert = true;
            lineInfo = null;
            view.show(ViewManager.UI_LOGIN);
            view.show(ViewManager.FORE_L_R);
            view.hide(ViewManager.STAGE_MAIN);
            view.hide(ViewManager.UI_MAIN);
            var _local_1:Object = view.getUI(ViewManager.PANEL_TRIPLE_TURN);
            ((_local_1) && (_local_1.tripleHideUI(false)));
            var _local_2:Object = view.getUI(ViewManager.PANEL_REDENVELOPE_PANEL);
            if (_local_2)
            {
                _local_2.hideAllRedEvnelope();
            };
            if (((Login_Model.app) && (Login_Model.app.hasOwnProperty("backToCharSelect"))))
            {
                Login_Model.app.backToLogin();
            };
            if (by_session == "sdo")
            {
                ExternalInterface.call("flush");
            };
        }

        public function destroyCharactor(_arg_1:Number):void
        {
            if (((this.player) && (this.player.id == _arg_1)))
            {
                if (this.player.view)
                {
                    this.player.view.stopPlayingFlyingEffect();
                };
            };
            view.removeC(_arg_1);
        }

        public function lottoBlueMsg(_arg_1:String):void
        {
            view.showLottoBlueMsg(_arg_1);
        }

        public function getCharactor(_arg_1:Number):Charactor
        {
            var _local_2:Object = view.getC(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.gameObject);
            };
            return (null);
        }

        public function getNpc(_arg_1:int):Npc
        {
            var _local_2:Object = view.getN(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.gameObject);
            };
            return (null);
        }

        public function selectTarget(_arg_1:int, _arg_2:Event=null):void
        {
            if (_state == GamePredef.ST_BATTLE)
            {
                return;
            };
            if (_arg_2)
            {
                _arg_2.stopImmediatePropagation();
            };
            view.showSelect();
            view.actionState = _arg_1;
        }

        public function getPetNumByColor(_arg_1:Number, _arg_2:String, _arg_3:int):int
        {
            var _local_6:Object;
            var _local_4:int;
            var _local_5:Object = player.petList;
            for each (_local_6 in _local_5)
            {
                if (((((_local_6) && (Number(_local_6.tid) == _arg_1)) && (_local_6.petName == _arg_2)) && (basic.colorByGrowRate(_local_6.growRate) >= _arg_3)))
                {
                    _local_4++;
                };
            };
            return (_local_4);
        }

        public function checkBatchItemList(_arg_1:int):Boolean
        {
            var _local_2:*;
            for (_local_2 in ItemConfig.BATCH_ITEM_LIST)
            {
                if (ItemConfig.BATCH_ITEM_LIST[_local_2] == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function hasFlowerNum():int
        {
            return (hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_FLOWER));
        }

        public function get skillLevel():int
        {
            return (_skillLevel);
        }

        [Bindable(event="propertyChange")]
        public function get bloodBag():Array
        {
            return (this._653737042bloodBag);
        }

        public function checkTitleType(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:Object = GameData.d[GamePredef.TBL_TITLE][_arg_1];
            if (_local_3)
            {
                if (_local_3.k == _arg_2)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function hasRavingNum():int
        {
            return (hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_FOOTLE));
        }

        public function getTemplateData(_arg_1:uint, _arg_2:Number, _arg_3:Boolean=true):Object
        {
            var _local_5:Object;
            if (((!(data.hasData(_arg_1, _arg_2))) && (!(_arg_3))))
            {
                return (null);
            };
            var _local_4:Object = data.getGameData(_arg_1, _arg_2);
            if (_local_4 == null)
            {
                return (null);
            };
            switch (_arg_1)
            {
                case GamePredef.TBL_ITEM_INSTANCE:
                case GamePredef.TBL_EQUIPT_INSTANCE:
                case GamePredef.TBL_SCENEITEM_INSTANCE:
                    _local_5 = data.getGameData((_arg_1 + 1), _local_4.tid);
                    break;
                case GamePredef.TBL_ELEMENT_TEMPLATE:
                case GamePredef.TBL_ITEM_TEMPLATE:
                case GamePredef.TBL_EQUIPT_TEMPLATE:
                case GamePredef.TBL_SCENEITEM_TEMPLATE:
                case GamePredef.TBL_CREATURE:
                case GamePredef.TBL_BUILDING:
                case GamePredef.TBL_SKILL:
                case GamePredef.TBL_EQUIPT_SUIT:
                case GamePredef.TBL_MINERAL_TEMPLATE:
                case GamePredef.TBL_MEDAL:
                case GamePredef.TBL_PET_TALENT:
                case GamePredef.TBL_DECO_SHOW:
                case GamePredef.TBL_DECO_RUNE:
                case GamePredef.TBL_MYSTRE:
                case GamePredef.TBL_RUNE_CHIP:
                case GamePredef.TBL_PRS_CHIP:
                case GamePredef.TBL_PRS_SHOW:
                case GamePredef.TBL_PRS_TREE:
                case GamePredef.TBL_CREATUREH_HEART:
                case GamePredef.TBL_PET_STONE:
                    _local_5 = _local_4;
                    break;
                case GamePredef.TBL_PET:
                    _local_5 = data.getGameData(GamePredef.TBL_CREATURE, _local_4.tid);
                    break;
            };
            return (_local_5);
        }

        [Bindable(event="propertyChange")]
        public function set player(_arg_1:Player):void
        {
            var _local_2:Object = this.player;
            if (_local_2 !== _arg_1)
            {
                this._985752863player = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "player", _local_2, _arg_1));
            };
        }

        public function setFrameRate(_arg_1:int):void
        {
            var _local_2:* = view.getUI(ViewManager.UI_CONTAINER);
            scene.secneSetSpeed(_local_2.parentApplication.stage.frameRate, _arg_1);
            _local_2.parentApplication.stage.frameRate = _arg_1;
            GamePredef.GLOBAL_FRAME_RATE = _arg_1;
        }

        public function getGameObject(_arg_1:int, _arg_2:Number):*
        {
            switch (_arg_1)
            {
                case GamePredef.TBL_CHARACTOR:
                    return (getCharactor(_arg_2));
                case GamePredef.TBL_NPC:
                    return (getNpc(_arg_2));
            };
        }

        public function nextGuide(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int=-1, _arg_5:int=-1):void
        {
            var _local_7:Object;
            var _local_8:Object;
            if (!newPlayerGuideOpen)
            {
                return;
            };
            var _local_6:Object = view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
            if (checkGuideCondition(_arg_1, _arg_2, _arg_3, _arg_5))
            {
                _local_7 = data.gameData[GamePredef.TBL_GUIDE][lastIdxs[currentType]];
                if (_local_7.level < player.level)
                {
                    return;
                };
                remote.call("saveGuideLog", null, lastIdxs[currentType]);
                lastIdxs[currentType]++;
                if (_local_7.finishType > 0)
                {
                    delete lastIdxs[currentType];
                };
                if (_local_7.promptType == GamePredef.SHOW_GUIDE_TYPE_BUBBLE)
                {
                    _local_6.init(_local_7);
                    _local_6.showGuide(_local_7.promptText);
                }
                else
                {
                    _local_8 = view.getUI(ViewManager.POP_NEW_PLAER_ALERT);
                    _local_8.init(_local_7);
                };
            };
        }

        public function getFazendaDataByCid(_arg_1:int):Boolean
        {
            var _local_3:Number;
            var _local_2:Number = new Date().getTime();
            if (!farmReqArr[_arg_1])
            {
                farmReqArr[_arg_1] = _local_2;
                remote.getFarmByCid(_arg_1);
                return (true);
            };
            _local_3 = (_local_2 - farmReqArr[_arg_1]);
            if (_local_3 > MIN_REQUEST_FAZENDA_INTERVAL)
            {
                farmReqArr[_arg_1] = _local_2;
                remote.getFarmByCid(_arg_1);
                return (true);
            };
            return (false);
        }

        public function clearCharHistory():void
        {
            view.getUI(ViewManager.MAIN_CHAT).init();
        }

        public function updatePetSetting(_arg_1:String, _arg_2:*):void
        {
            GamePredef.GLOBAL_SETTING[_arg_1] = _arg_2;
            _battlePet.pi[_arg_1] = _arg_2;
            var _local_3:RegExp = /([a-zA-Z]*)(\d*)/;
            var _local_4:Object = _local_3.exec(_arg_1);
            if (((_local_4) && (_local_4[1] == "bs")))
            {
                view.getUI(ViewManager.PANEL_BATTLESET).updateSlot(_local_4[2]);
            };
        }

        public function addBlack(_arg_1:String):void
        {
            view.getUI(ViewManager.PANEL_IM).addBlack(_arg_1);
        }

        public function clearMidWarn():void
        {
            view.getUI(ViewManager.MID_MAIN_WARN).delThisImage();
        }

        public function resetLine():void
        {
            ready = false;
            logined = false;
            clearTargets();
            data.reset();
            scene.sceneLeave();
            if (state == GamePredef.ST_CORE_BATTLE)
            {
                battle.battleOnEnd();
            };
        }

        public function fetchVDAYWish(_arg_1:Object):Object
        {
            var _local_3:*;
            var _local_4:int;
            var _local_5:*;
            var _local_6:*;
            var _local_2:int;
            for (_local_3 in VDAYWishesArr)
            {
                _local_2++;
            };
            if (_local_2 < 1)
            {
                return (null);
            };
            _local_4 = -1;
            do 
            {
                _local_5 = 0;
                for (_local_6 in VDAYWishesArr)
                {
                    if (!VDAYWishesArr[_local_6].flag)
                    {
                        _local_5++;
                    };
                };
                if (_local_5 < 1)
                {
                    return (_arg_1);
                };
                _local_4 = int(Math.round((Math.random() * VDAYWishesArr.length)));
            } while (((!(VDAYWishesArr[_local_4])) || (VDAYWishesArr[_local_4].flag)));
            VDAYWishesArr[_local_4].flag = true;
            return (VDAYWishesArr[_local_4]);
        }

        public function getPet(_arg_1:Number):Pet
        {
            var _local_2:Object = view.getP(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.gameObject);
            };
            return (null);
        }

        private function onGetTodayOnlineTime(_arg_1:Object):void
        {
            var _local_2:int = _arg_1.t;
            var _local_3:int = ((_arg_1.f != undefined) ? _arg_1.f : 0);
            var _local_4:int = (((_local_3 + 1) * GamePredef.ONLINE_ACT_AWARD_DURATION) - _local_2);
            if (timer.running)
            {
                timer.stop();
            };
            if (_local_4 <= 0)
            {
                onTimer(null);
            }
            else
            {
                timer.delay = (_local_4 * 60000);
                timer.start();
            };
        }

        public function hasSeekNum():int
        {
            return (hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_SEEK));
        }

        public function clearTargets():void
        {
            targetIP = null;
            targetNPC = null;
            targetPlayer = null;
            target = null;
        }

        public function getNpcData(_arg_1:int):Object
        {
            return (data.getGameData(GamePredef.TBL_NPC, _arg_1));
        }


    }
}//package com.qeedoo.game.system

class Single 
{


}


