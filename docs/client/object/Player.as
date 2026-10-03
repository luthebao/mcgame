// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.object.Player

package com.qeedoo.game.object
{
    import mx.collections.ArrayCollection;
    import flash.geom.Point;
    import flash.utils.Timer;
    import mx.controls.Alert;
    import flash.events.TimerEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.PropertyChangeEvent;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.ItemConfig;
    import mx.core.IUITextField;
    import mx.managers.PopUpManager;
    import mx.core.mx_internal;
    import com.qeedoo.game.logic.PetLogic;
    import com.qeedoo.game.data.GameData;
    import flash.utils.setTimeout;
    import flash.utils.ByteArray;
    import com.qeedoo.game.utils.JSONUtil;

    public class Player extends Charactor 
    {

        private static const UPDATE_DIS:Number = 30;

        public var attIntelligence:int;
        public var trainSoulExp:Number;
        public var evolutionPetObject:Object;
        public var fairyList:Object;
        public var enableSpeedValidation:Boolean = true;
        public var propCritical:int;
        public var portraitCode:Number;
        public var posBattle:Number;
        public var creditDayDict:Object;
        private var _1589513115tkyyhpointV2:Number = 0;
        public var actpoint:int;
        private var _747604609magiccystalrec:Number = 0;
        private var _1489943514yijieElement:Number = 0;
        public var bp:int;
        public var imgCode:Number;
        private var _907859034medalExp:Number = 0;
        public var awakenAdd:int;
        public var cl:int;
        public var cp:String;
        private var _683269445realSoulCrystal:Number = 0;
        public var reputation:Number;
        public var lastHitNpc:Object;
        private var _1093046749shishangdian:Number = 0;
        private var _2030127989petguardin:Number = 0;
        private var _104079552money:Number;
        private var _106557274petPK:Number = 0;
        public var attStamina:int;
        public var attEnergy:int;
        private var _1590959536posCenterY:int;
        public var movePnt:int;
        public var gData:Object;
        private var _292525742stoneSealPoint:Number;
        private var _1338617699exPoint:Number;
        private var _1490547880petguardout:Number = 0;
        private var _1070495180realSoulStone:Number = 0;
        private var _99509454groupRequestAC:ArrayCollection;
        private var _1183081836magiccystallimit:Number = 0;
        private var _2035869885goldBind:Number;
        private var _1550481539runeExp:Number = 0;
        public var activePetObject:Object;
        public var propReduceHurt1:int;
        public var soulChip:int;
        public var propReduceHurt2:int;
        private var _508024386heroScore2507:Number = 0;
        private var _lastChatTime:Number;
        public var vigor:int;
        private var _2053648975pvePoint:Number;
        private var _634593770threePvpPnt:Number;
        private var _105004308npPnt:Number;
        private var _98254cbM:Number;
        private var _540145372worldCupGoldPoint:Number;
        public var propCounter:int;
        private var _3089041dogM:Number;
        public var equipActiveList:Object;
        private var _293427937groupAC:ArrayCollection;
        public var expBattle:Number;
        public var propHit:int;
        public var petTalentData:Object;
        private var _747603092magiccystalpre:Number = 0;
        public var awakenLevel:int;
        public var ll:String;
        private var _178419583mhjingshi:Number = 0;
        public var petMaxNum:Number;
        private var _2022073533soulPnt:Number;
        public var crystalSid:int;
        public var maxActpoint:int;
        private var _1590959535posCenterX:int;
        private var _mapData:Object;
        public var createTime:Number;
        private var _489540817xcds2403p:Number = 0;
        public var maxVigor:int;
        public var safeCBMids:Array;
        private var _1056511154xmCandy24:Number = 0;
        public var attStrength:int;
        public var serverSpeedThreshold:Number = 300;
        public var trainSoulLvl:int;
        public var newGrade:int;
        public var qn:int;
        public var soulTempBag:Object;
        private var _lp:Point;
        public var creditTotalDict:Object;
        public var propDodge:int;
        private var _94078750lottoBagLength:String;
        private var _94041220btPnt:Number;
        public var petArenaAct:Object;
        public var cpid:Number = -1;
        public var pop:int;
        private var setTime:Timer;
        public var isHanged:Boolean;
        private var _1966126374couragePoint:Number;
        public var petList:Object;
        public var soulBagData:Object;
        public var isLockedUB:Boolean;
        public var attAgility:int;
        public var ti:Number;
        public var tl:int;
        public var tn:String;
        public var tp:Number;
        private var _lastWorldChatTime:Number;
        public var guid:Number;
        public var skillList:Object;
        private var _2052063483heiyaoshiPoint2:Number = 0;
        private var _1789520845warSprite:Number = 0;
        public var walkable:Boolean;
        public var propSpeed:int;
        public var guideLog:String;
        private var _575924634elementPnt:Number;
        private var _1466742551txkc2508p:Number = 0;
        public var alertTrans:Alert;
        public var contractPet:Object;
        public var maxMovePnt:int;
        private var _481837591heiyaoshiPoint:Number = 0;
        public var totalOnline:Number;
        public var loopTakeTime:Array;
        private var _continuousMoveCount:int = 0;
        public var bankSlotNum:Number;
        private var _1654691932worldCupPoint:Number;
        public var tBag:Object;
        private var _1829557571energyStone:Number = 0;
        public var attLastPoint:Number;
        public var questLog:String;
        private var _1897219452starPnt:Number;
        private var _3178592gold:Number;
        public var propDefy:int;
        public var mapSafe:Boolean;
        private var _1691040230decoSilver:Number = 0;
        private var _523115282dmbk2509p:Number = 0;
        public var soulExp:int;
        public var achieveLog:Object;
        public var offlineTime:uint = 0;
        public var creditMonthDict:Object;
        private var _1714071267moneyBind:Number;
        private var _1952114124expSkill:Number;
        public var achieveReqLog:Object;
        public var bagSlotNum:Number;
        public var dressInfo:String;
        public var awakenPoint:int;
        private var _1933665075summerGameScore2015:Number;
        private var _2100767331battleSprite:Number = 0;
        private var _1067362586realSoulWater:Number = 0;
        private var _162163465mysteryCrystal:Number = 0;
        public var starsData:Object;
        private var _530944140monsterHeart:Number = 0;
        public var questGuideAble:Boolean = true;
        private var mapArrComplete:Boolean = false;
        public var achPnt:int;
        private var _465052908wisdonCrystal:Number;
        public var awakenPointDict:Object;
        public var creditWeekDict:Object;
        public var propCombo:int;
        private var _1086658619lotteryBagLength:String;
        public var farmBag:Object;
        public var guild:Object;
        private var _106404485paPnt:Number;
        public var awakenPointUsed:int;

        public var mapArr:ArrayCollection = new ArrayCollection();
        public var questList:Object = {};
        public var loopList:Object = {};
        public var petGuardData:Object = {
            "lvData":{},
            "petData":{}
        };
        private var _lastMoveRoute:Array = [];
        private var _lastPlayerPosition:Object = {
            "time":null,
            "posX":-1,
            "posY":-1
        };

        public function Player()
        {
            isSelf = true;
            walkable = true;
            isHanged = false;
            equipActiveList = {};
            _lp = new Point(0, 0);
            _lastChatTime = new Date().getTime();
            _lastWorldChatTime = 0;
            safeCBMids = new Array();
            setTime = new Timer(((10 * 60) * 1000));
            setTime.addEventListener(TimerEvent.TIMER, onlineReport);
            setTime.start();
        }

        public function stop():void
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_1:Point = new Point(normalView.posX, normalView.posY);
            if (((((!(_inBattle)) && (!(state == GamePredef.ST_BATTLE))) && (!(state == GamePredef.ST_BATTLE_EXEC))) && (Point.distance(_lp, _local_1) > UPDATE_DIS)))
            {
                _local_3 = {
                    "id":id,
                    "route":_lastMoveRoute,
                    "x":normalView.posX,
                    "y":normalView.posY
                };
                _local_3 = ((_continuousMoveCount > 1) ? _local_3 : null);
                _continuousMoveCount = 0;
                if (enableSpeedValidation)
                {
                    _local_4 = new Date().getTime();
                    if (((((!(inGroup)) || (isLeader)) && (_lastPlayerPosition.time)) && (_lastPlayerPosition.mapId == this.posMapId)))
                    {
                        _local_5 = Math.sqrt((((_lastPlayerPosition.posX - posX) * (_lastPlayerPosition.posX - posX)) + ((_lastPlayerPosition.posY - posY) * (_lastPlayerPosition.posY - posY))));
                        _local_6 = ((_local_5 * 1000) / (_local_4 - _lastPlayerPosition.time));
                        if (_local_5 > 100)
                        {
                            if (_local_6 > serverSpeedThreshold)
                            {
                                _core.sysMsg(Language.PLAYER_S[34]);
                                normalView.posX = _lastPlayerPosition.posX;
                                normalView.posY = _lastPlayerPosition.posY;
                                this.posX = _lastPlayerPosition.posX;
                                this.posY = _lastPlayerPosition.posY;
                                _core.view.getUI(ViewManager.STAGE_MAIN).centerPlayer();
                            };
                        };
                    };
                };
                _core.remote.udcp(normalView.posX, normalView.posY, normalView.centerX, normalView.centerY, dir, _local_3);
                _lp = _local_1;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_MAP);
            _local_2.clearRoute();
        }

        public function enoughPetSlot(_arg_1:int):Boolean
        {
            if ((petMaxNum - getPetNumAll()) >= _arg_1)
            {
                return (true);
            };
            return (false);
        }

        public function set decoSilver(_arg_1:Number):void
        {
            var _local_2:Object = this._1691040230decoSilver;
            if (_local_2 !== _arg_1)
            {
                this._1691040230decoSilver = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoSilver", _local_2, _arg_1));
            };
        }

        public function set heiyaoshiPoint(_arg_1:Number):void
        {
            var _local_2:Object = this._481837591heiyaoshiPoint;
            if (_local_2 !== _arg_1)
            {
                this._481837591heiyaoshiPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "heiyaoshiPoint", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get yijieElement():Number
        {
            return (this._1489943514yijieElement);
        }

        public function set yijieElement(_arg_1:Number):void
        {
            var _local_2:Object = this._1489943514yijieElement;
            if (_local_2 !== _arg_1)
            {
                this._1489943514yijieElement = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yijieElement", _local_2, _arg_1));
            };
        }

        public function set shishangdian(_arg_1:Number):void
        {
            var _local_2:Object = this._1093046749shishangdian;
            if (_local_2 !== _arg_1)
            {
                this._1093046749shishangdian = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shishangdian", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gold():Number
        {
            return (this._3178592gold);
        }

        public function onLogout():void
        {
            if (normalView != null)
            {
                normalView.stopCheckBattleTimer();
            };
        }

        public function set expSkill(_arg_1:Number):void
        {
            var _local_2:Object = this._1952114124expSkill;
            if (_local_2 !== _arg_1)
            {
                this._1952114124expSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expSkill", _local_2, _arg_1));
            };
        }

        public function set realSoulStone(_arg_1:Number):void
        {
            var _local_2:Object = this._1070495180realSoulStone;
            if (_local_2 !== _arg_1)
            {
                this._1070495180realSoulStone = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "realSoulStone", _local_2, _arg_1));
            };
        }

        public function enoughBag(_arg_1:int):Boolean
        {
            if (getEmptyBagSlotNum() >= _arg_1)
            {
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get runeExp():Number
        {
            return (this._1550481539runeExp);
        }

        [Bindable(event="propertyChange")]
        public function get mhjingshi():Number
        {
            return (this._178419583mhjingshi);
        }

        [Bindable(event="propertyChange")]
        public function get btPnt():Number
        {
            return (this._94041220btPnt);
        }

        public function isFinishQuest(_arg_1:Number):Boolean
        {
            if (_core.player.questLog)
            {
                if (_core.player.questLog.indexOf((("|" + _arg_1) + "|")) >= 0)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function set heroScore2507(_arg_1:Number):void
        {
            var _local_2:Object = this._508024386heroScore2507;
            if (_local_2 !== _arg_1)
            {
                this._508024386heroScore2507 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "heroScore2507", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petguardin():Number
        {
            return (this._2030127989petguardin);
        }

        [Bindable(event="propertyChange")]
        public function get monsterHeart():Number
        {
            return (this._530944140monsterHeart);
        }

        [Bindable(event="propertyChange")]
        public function get exPoint():Number
        {
            return (this._1338617699exPoint);
        }

        public function setConditionWalkable():void
        {
            if (((((inGroup) && (!(isLeader))) && (!(groupAfk))) && (taskSweep)))
            {
                return;
            };
            walkable = true;
        }

        [Bindable(event="propertyChange")]
        public function get petguardout():Number
        {
            return (this._1490547880petguardout);
        }

        public function get isDead():Boolean
        {
            return (Boolean((currentHp <= 0)));
        }

        [Bindable(event="propertyChange")]
        public function get xmCandy24():Number
        {
            return (this._1056511154xmCandy24);
        }

        [Bindable(event="propertyChange")]
        public function get money():Number
        {
            return (this._104079552money);
        }

        [Bindable(event="propertyChange")]
        public function get magiccystalpre():Number
        {
            return (this._747603092magiccystalpre);
        }

        private function useSnowBall(_arg_1:String):void
        {
            _core.remote.useSnowBall(_arg_1);
        }

        public function transToGuildMap():void
        {
            var func:Function = function (_arg_1:CloseEvent):*
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.useItem(GamePredef.ITEM_GUILD_TRANSPORT);
                };
            };
            Alert.show(Language.WORLDMAPICON_S[7], "", (Alert.YES | Alert.NO), null, func);
        }

        public function createNpcs():void
        {
            _core.remote.createNpcs();
            _core.remote.createBoss();
            _core.remote.createChars();
            _core.remote.createGuildBuildings();
        }

        private function transGroup(mapId:int):void
        {
            var okLabel:String;
            var yesLabel:String;
            var transGWithGold:Function;
            okLabel = Alert.okLabel;
            yesLabel = Alert.yesLabel;
            transGWithGold = function (_arg_1:CloseEvent):void
            {
                var _local_2:*;
                var _local_3:Object;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                    if (_local_2.goldDisable())
                    {
                        Alert.show(Language.PLAYER_S[23]);
                        return;
                    };
                    _local_3 = {
                        "tid":ItemConfig.ITEM_TRANSPORT_SENIOR,
                        "mid":mapId
                    };
                    if (((!(_core.player.inBattle)) && (!(_core.player.taskSweep))))
                    {
                        _core.remote.useItemGold(_local_3);
                    };
                    _core.view.hide(ViewManager.POPU_WORLDMAP);
                    _core.view.hide(ViewManager.TOOLTIP_MAP);
                    _core.view.getUI(ViewManager.TOOLTIP_PET).hide();
                    _core.view.getUI(ViewManager.TOOLTIP_QUEST).hide();
                };
            };
            var leaderTransport:Function = function (_arg_1:CloseEvent):void
            {
                Alert.okLabel = okLabel;
                Alert.yesLabel = yesLabel;
                if (_arg_1.detail == Alert.YES)
                {
                    if ((((((((_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR).num > 0) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_WEEK).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_HALF_MONTH).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_MONTH).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_WEEK_TRUE).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_DAY).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_HALF_DAY).num > 0)))
                    {
                        transTo(mapId, true, true);
                    }
                    else
                    {
                        Alert.show(Language.WORLDMAPICON_S[2], "", (Alert.YES | Alert.NO), null, transGWithGold);
                    };
                }
                else
                {
                    if (_arg_1.detail == Alert.OK)
                    {
                        transSingle(mapId);
                    };
                };
            };
            Alert.okLabel = Language.WORLDMAPICON_S[4];
            Alert.yesLabel = Language.WORLDMAPICON_S[5];
            Alert.show(Language.WORLDMAPICON_S[1], "", ((Alert.OK | Alert.YES) | Alert.NO), null, leaderTransport);
        }

        [Bindable(event="propertyChange")]
        public function get xcds2403p():Number
        {
            return (this._489540817xcds2403p);
        }

        [Bindable(event="propertyChange")]
        public function get goldBind():Number
        {
            return (this._2035869885goldBind);
        }

        public function set gold(_arg_1:Number):void
        {
            var _local_2:Object = this._3178592gold;
            if (_local_2 !== _arg_1)
            {
                this._3178592gold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold", _local_2, _arg_1));
            };
        }

        public function get classLevel():String
        {
            return (GamePredef.CLASS_LEVEL[cl]);
        }

        [Bindable(event="propertyChange")]
        public function get lottoBagLength():String
        {
            return (this._94078750lottoBagLength);
        }

        private function festfootleName(_arg_1:String):void
        {
            _core.remote.useFestFootle(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get heiyaoshiPoint2():Number
        {
            return (this._2052063483heiyaoshiPoint2);
        }

        [Bindable(event="propertyChange")]
        public function get mysteryCrystal():Number
        {
            return (this._162163465mysteryCrystal);
        }

        [Bindable(event="propertyChange")]
        public function get txkc2508p():Number
        {
            return (this._1466742551txkc2508p);
        }

        public function set mhjingshi(_arg_1:Number):void
        {
            var _local_2:Object = this._178419583mhjingshi;
            if (_local_2 !== _arg_1)
            {
                this._178419583mhjingshi = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mhjingshi", _local_2, _arg_1));
            };
        }

        public function set runeExp(_arg_1:Number):void
        {
            var _local_2:Object = this._1550481539runeExp;
            if (_local_2 !== _arg_1)
            {
                this._1550481539runeExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeExp", _local_2, _arg_1));
            };
        }

        public function set btPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._94041220btPnt;
            if (_local_2 !== _arg_1)
            {
                this._94041220btPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btPnt", _local_2, _arg_1));
            };
        }

        private function transSingle(mapId:int):void
        {
            var tf:IUITextField;
            var transWithItem:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    transTo(mapId, false, true);
                };
            };
            if (alertTrans)
            {
                PopUpManager.removePopUp(alertTrans);
                alertTrans = null;
            };
            var transWithGold:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:*;
                var _local_3:Object;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                    if (_local_2.goldDisable())
                    {
                        Alert.show(Language.PLAYER_S[23]);
                        return;
                    };
                    _local_3 = {
                        "tid":ItemConfig.ITEM_TRANSPORT,
                        "mid":mapId
                    };
                    if (((!(_core.player.inBattle)) && (!(_core.player.taskSweep))))
                    {
                        _core.remote.useItemGold(_local_3);
                    };
                    _core.view.hide(ViewManager.POPU_WORLDMAP);
                    _core.view.hide(ViewManager.TOOLTIP_MAP);
                    _core.view.getUI(ViewManager.TOOLTIP_PET).hide();
                    _core.view.getUI(ViewManager.TOOLTIP_QUEST).hide();
                };
            };
            if ((((((((((_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_WEEK).num > 0) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_HALF_MONTH).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_MONTH).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_WEEK).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_HALF_MONTH).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_MONTH).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_WEEK_TRUE).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_DAY).num > 0)) || (_core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR_HALF_DAY).num > 0)))
            {
                transTo(mapId, false, false);
            }
            else
            {
                if (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT) > 0)
                {
                    alertTrans = Alert.show(Language.WORLDMAPICON_S[1], "", (Alert.YES | Alert.NO), null, transWithItem);
                }
                else
                {
                    if (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_TRANSPORT_SENIOR) > 0)
                    {
                        alertTrans = Alert.show(Language.WORLDMAPICON_S[8], "", (Alert.YES | Alert.NO), null, transWithItem);
                        tf = alertTrans.mx_internal::alertForm.mx_internal::textField;
                        tf.htmlText = Language.WORLDMAPICON_S[8];
                    }
                    else
                    {
                        alertTrans = Alert.show(Language.WORLDMAPICON_S[0], "", (Alert.YES | Alert.NO), null, transWithGold);
                    };
                };
            };
        }

        public function set starPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._1897219452starPnt;
            if (_local_2 !== _arg_1)
            {
                this._1897219452starPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "starPnt", _local_2, _arg_1));
            };
        }

        public function set monsterHeart(_arg_1:Number):void
        {
            var _local_2:Object = this._530944140monsterHeart;
            if (_local_2 !== _arg_1)
            {
                this._530944140monsterHeart = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "monsterHeart", _local_2, _arg_1));
            };
        }

        public function set magiccystalrec(_arg_1:Number):void
        {
            var _local_2:Object = this._747604609magiccystalrec;
            if (_local_2 !== _arg_1)
            {
                this._747604609magiccystalrec = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magiccystalrec", _local_2, _arg_1));
            };
        }

        public function set dogM(_arg_1:Number):void
        {
            var _local_2:Object = this._3089041dogM;
            if (_local_2 !== _arg_1)
            {
                this._3089041dogM = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dogM", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get moneyBind():Number
        {
            return (this._1714071267moneyBind);
        }

        public function set petguardin(_arg_1:Number):void
        {
            var _local_2:Object = this._2030127989petguardin;
            if (_local_2 !== _arg_1)
            {
                this._2030127989petguardin = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petguardin", _local_2, _arg_1));
            };
        }

        public function set magiccystalpre(_arg_1:Number):void
        {
            var _local_2:Object = this._747603092magiccystalpre;
            if (_local_2 !== _arg_1)
            {
                this._747603092magiccystalpre = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magiccystalpre", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get worldCupGoldPoint():Number
        {
            return (this._540145372worldCupGoldPoint);
        }

        private function seekName(_arg_1:String):void
        {
            _core.remote.useSeek(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get npPnt():Number
        {
            return (this._105004308npPnt);
        }

        public function getActiveFairy():Object
        {
            var _local_1:Object;
            for each (_local_1 in fairyList)
            {
                if (((_local_1) && (int(_local_1.state) == 1)))
                {
                    return (_local_1);
                };
            };
            return (null);
        }

        public function useItem(targetType:int, petId:Number, slotId:Number, ctrlToPet:Boolean=false):void
        {
            var slot:Object;
            var tData:Object;
            var item:Object;
            var func:Function;
            var panel:Object;
            var pet:Object;
            var splitChar:String;
            var itemId:int;
            var useMultiFunc:Function;
            var onDiv:Function;
            var hasNum:int;
            var cname:String;
            var targetName:Function;
            var rename:Function;
            var obj:Object;
            var maxNum:uint;
            slot = _core.data.sList[slotId];
            if (ctrlToPet)
            {
                targetType = GamePredef.MOUSE_TARGET_PET;
                if (_core.battlePet != null)
                {
                    petId = _core.battlePet.id;
                };
            };
            if (slot)
            {
                if ((((_core.player) && (slot.type)) && (slot.giid)))
                {
                    item = _core.getTemplateData(slot.type, slot.giid);
                    if ((((item) && (item.skillId <= 0)) && (_core.player.taskSweep)))
                    {
                        _core.sysMidNote(Language.TASKSWEEPPANEL_U[22]);
                        return;
                    };
                };
                tData = _core.getTemplateData(slot.type, slot.itemId);
                if (tData)
                {
                    if ((((tData.kind == GamePredef.ITEM_KIND_PETEQU) && (GamePredef.PETEQU_POS_BEGIN <= tData.position)) && (tData.position <= GamePredef.PETEQU_POS_END)))
                    {
                        targetType = GamePredef.MOUSE_TARGET_PET;
                        panel = _core.view.getUI(ViewManager.PANEL_PETMANAGER);
                        if (((panel.petData) && (panel.visible)))
                        {
                            petId = panel.petData.id;
                        }
                        else
                        {
                            if (_core.battlePet)
                            {
                                petId = _core.battlePet.id;
                            };
                        };
                        if (petId < 0)
                        {
                            Alert.show(Language.PLAYER_S[26]);
                            return;
                        };
                    };
                    if (targetType == GamePredef.MOUSE_TARGET_CHA)
                    {
                        if (((!(Number(tData.useType) == 1)) && (!(Number(tData.useType) == 3))))
                        {
                            _core.sysMidNote(Language.PLAYER_S[3]);
                            return;
                        };
                        if (Number(_core.player.level) < Number(tData.reqLevel))
                        {
                            _core.sysMidNote(Language.PLAYER_S[4]);
                            return;
                        };
                        if (tData.reqClass.indexOf((("|" + _core.player.classId) + "|")) < 0)
                        {
                            _core.sysMidNote(Language.PLAYER_S[5]);
                            return;
                        };
                    }
                    else
                    {
                        if (targetType == GamePredef.MOUSE_TARGET_PET)
                        {
                            if (((!(Number(tData.useType) == 2)) && (!(Number(tData.useType) == 3))))
                            {
                                _core.sysMidNote(Language.PLAYER_S[6]);
                                return;
                            };
                            pet = _core.player.petList[petId];
                            if (!pet)
                            {
                                return;
                            };
                            if (PetLogic.expToLv(pet.exp) < Number(tData.reqLevel))
                            {
                                _core.sysMidNote(Language.PLAYER_S[7]);
                                return;
                            };
                        };
                    };
                    switch (Number(tData.type))
                    {
                        case GamePredef.ITEM_TYPE_KEY:
                            if (!enoughBag(1))
                            {
                                _core.sysMidNote(Language.PLAYER_S[8]);
                                return;
                            };
                            if (((_core.view.getUI(ViewManager.PANEL_TREASURE)) && (_core.view.getUI(ViewManager.PANEL_TREASURE).useFlag())))
                            {
                                return;
                            };
                            break;
                        case GamePredef.ITEM_TYPE_TARGET_ITEM:
                            _core.remote.itemToTarget(slotId);
                            return;
                    };
                    if (tData.id == 3012)
                    {
                        if (!enoughBag(1))
                        {
                            _core.sysMidNote(Language.PLAYER_S[8]);
                            return;
                        };
                        if (((_core.view.getUI(ViewManager.PANEL_TREASURE)) && (_core.view.getUI(ViewManager.PANEL_TREASURE).useFlag())))
                        {
                            return;
                        };
                    };
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.useItem(targetType, petId, slotId);
                        };
                    };
                    if (slot.type == GamePredef.TBL_ITEM_INSTANCE)
                    {
                        splitChar = GamePredef.INPUT_PANEL_TITLE_SPLIT;
                        itemId = tData.id;
                        if ((((itemId >= 5375) && (itemId <= 5697)) || (_core.checkBatchItemList(itemId))))
                        {
                            if (slot.stackNum > 1)
                            {
                                useMultiFunc = function (_arg_1:uint):void
                                {
                                    _core.remote.useMultiItem(targetType, petId, slotId, _arg_1);
                                };
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.PLAYER_S[31], Language.PLAYER_S[30], useMultiFunc, slot.stackNum, 1, slot.stackNum);
                            }
                            else
                            {
                                if (slot.stackNum == 1)
                                {
                                    _core.remote.useItem(targetType, petId, slotId);
                                };
                            };
                            return;
                        };
                        switch (itemId)
                        {
                            case ItemConfig.ITEM_RESETPOINT:
                                Alert.show(Language.PLAYER_S[10], "", 3, null, func);
                                break;
                            case ItemConfig.ITEM_GOOD_CARD:
                                onDiv = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.useGoodCard();
                                    };
                                };
                                Alert.show(Language.PLAYER_S[24], "", 3, null, onDiv);
                                break;
                            case ItemConfig.ITEM_SEEK_MONTH:
                            case ItemConfig.ITEM_SEEK:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(((Language.PLAYER_S[11] + splitChar) + itemId), Language.PLAYER_S[12], seekName);
                                break;
                            case ItemConfig.ITEM_RADAR_MONTH:
                            case ItemConfig.ITEM_RADAR:
                            case ItemConfig.ITEM_RADAR_WEEK:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showNpcNameInput(Language.PLAYER_S[13], Language.PLAYER_S[14], seekNpc);
                                break;
                            case ItemConfig.ITEM_TRACK:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(((Language.PLAYER_S[15] + splitChar) + itemId), Language.PLAYER_S[16], trackName);
                                break;
                            case ItemConfig.ITEM_FOOTLE:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(((Language.PLAYER_S[15] + splitChar) + itemId), Language.PLAYER_S[16], footleName);
                                break;
                            case ItemConfig.ITEM_ANTI_FOOTLE:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(((Language.PLAYER_S[15] + splitChar) + itemId), Language.PLAYER_S[16], antiFootleName);
                                break;
                            case ItemConfig.ITEM_TRANSPORT_WEEK:
                            case ItemConfig.ITEM_TRANSPORT_MONTH:
                            case ItemConfig.ITEM_TRANSPORT_HALF_MONTH:
                            case ItemConfig.ITEM_TRANSPORT:
                                if (mapArrComplete == false)
                                {
                                    for each (obj in GameData.d[GamePredef.TBL_MAP])
                                    {
                                        if (obj.t > 0)
                                        {
                                            mapArr.addItem(obj);
                                        };
                                    };
                                    if (mapArr.length > 0)
                                    {
                                        mapArrComplete = true;
                                    };
                                };
                                _core.view.getUI(ViewManager.PANEL_INPUT).showPositionInput(Language.PLAYER_S[17], Language.PLAYER_S[27], useTransport, mapArr);
                                break;
                            case ItemConfig.ITEM_RETURN_TEAM:
                                hasNum = _core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, itemId);
                                if (!hasNum)
                                {
                                    _core.sysMidNote(Language.GROUPPANEL_U[14]);
                                    return;
                                };
                                if ((((_core.groupMemberListArr) && (_core.groupMemberListArr[_core.cid])) && (_core.groupMemberListArr[_core.cid].groupAfk)))
                                {
                                    _core.player.groupAfk = _core.groupMemberListArr[_core.cid].groupAfk;
                                };
                                if (!_core.player.groupAfk)
                                {
                                    _core.sysMidNote(Language.GROUPPANEL_U[15]);
                                    return;
                                };
                                if (((_core.player.state) && ((_core.player.state == GamePredef.ST_BATTLE) || (_core.player.state == GamePredef.ST_WATCH))))
                                {
                                    _core.sysMidNote(Language.GROUPPANEL_U[17]);
                                    return;
                                };
                                if (((hasNum > 0) && (_core.player.groupAfk)))
                                {
                                    func = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.call("unGroupAFK", null, false);
                                        };
                                    };
                                    Alert.show(Language.GROUPPANEL_U[16], "", (Alert.YES | Alert.NO), null, func);
                                };
                                break;
                            case ItemConfig.ITEM_TRANSPORT_SENIOR:
                            case ItemConfig.ITEM_TRANSPORT_SENIOR_WEEK:
                            case ItemConfig.ITEM_TRANSPORT_SENIOR_HALF_MONTH:
                            case ItemConfig.ITEM_TRANSPORT_SENIOR_MONTH:
                            case ItemConfig.ITEM_TRANSPORT_SENIOR_WEEK_TRUE:
                            case ItemConfig.ITEM_TRANSPORT_SENIOR_DAY:
                            case ItemConfig.ITEM_TRANSPORT_SENIOR_HALF_DAY:
                                if (mapArr.length < 1)
                                {
                                    for each (obj in GameData.d[GamePredef.TBL_MAP])
                                    {
                                        if (obj.t > 0)
                                        {
                                            mapArr.addItem(obj);
                                        };
                                    };
                                };
                                if (isLeader)
                                {
                                    _core.view.getUI(ViewManager.PANEL_INPUT).showPositionInput(Language.PLAYER_S[17], Language.PLAYER_S[27], useTransportGroup, mapArr);
                                }
                                else
                                {
                                    _core.view.getUI(ViewManager.PANEL_INPUT).showPositionInput(Language.PLAYER_S[17], Language.PLAYER_S[27], useTransport, mapArr);
                                };
                                break;
                            case ItemConfig.ITEM_ROSES:
                            case ItemConfig.ITEM_CHACO:
                            case ItemConfig.ITEM_CHACOS:
                            case ItemConfig.ITEM_ROSE:
                                cname = "";
                                hasNum = _core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, itemId);
                                targetName = function (name:String):void
                                {
                                    cname = name;
                                    var showNumPanel:Function = function ():void
                                    {
                                        var targetNum:Function = function (_arg_1:int):void
                                        {
                                            _core.remote.useIntimacyItem(cname, _arg_1, Number(tData.id));
                                            cname = "";
                                        };
                                        if ((((slot.stackNum > 0) && (hasNum > 0)) && (!(cname == ""))))
                                        {
                                            _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.PLAYER_S[31], Language.PLAYER_S[31], targetNum, 1, 1, hasNum);
                                        };
                                    };
                                    setTimeout(showNumPanel, 500);
                                };
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(((Language.CALLBACK_S[58] + splitChar) + itemId), Language.PLAYER_S[19], targetName);
                                break;
                            case ItemConfig.WEDDING_INVITATION_1:
                            case ItemConfig.WEDDING_INVITATION_2:
                            case ItemConfig.WEDDING_INVITATION_3:
                                _core.remote.useWeddingBag(slotId);
                                break;
                            case ItemConfig.WEDDING_RED_BAG_1:
                                _core.remote.useRedBag(slotId);
                                break;
                            case ItemConfig.ITEM_RENAME_CARD:
                                rename = function (_arg_1:String):void
                                {
                                    if (_core.haveSpecialStr(_arg_1))
                                    {
                                        Alert.show(Language.CHARACTORPANEL_S[11], "");
                                        return;
                                    };
                                    if (_core.haveSpecialStr2(_arg_1))
                                    {
                                        Alert.show(Language.CHARSELECTCANVAS_S[19], "");
                                        return;
                                    };
                                    if (_core.haveBadWord(_arg_1))
                                    {
                                        return;
                                    };
                                    _core.remote.changeNameByCard(_arg_1);
                                };
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.CHARACTORPANEL_S[9], Language.CHARACTORPANEL_S[10], rename);
                                break;
                            case ItemConfig.ITEM_HALLOWEEN_CARD:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.PLAYER_S[15], Language.PLAYER_S[16], useHalloweenCard);
                                break;
                            case ItemConfig.ITEM_SNOW_BALL:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.PLAYER_S[15], Language.PLAYER_S[16], useSnowBall);
                                break;
                            case ItemConfig.ITEM_FEAST_FOOL:
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.PLAYER_S[15], Language.PLAYER_S[16], festfootleName);
                                break;
                            case ItemConfig.ITEM_CHANGE_SEX_CARD:
                                func = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.changeCharSex();
                                    };
                                };
                                Alert.show(Language.CHANGE_SEX_CARD[0], "", (Alert.YES | Alert.NO), null, func);
                                break;
                            case ItemConfig.ITEM_PET_GROW_POTION_A:
                            case ItemConfig.ITEM_PET_GROW_POTION_B:
                            case ItemConfig.ITEM_PET_GROW_POTION_C:
                            case ItemConfig.ITEM_PET_GROW_POTION_SUPER_A:
                            case ItemConfig.ITEM_PET_GROW_POTION_SUPER_B:
                            case ItemConfig.ITEM_PET_GROW_POTION_SUPER_C:
                            case ItemConfig.ITEM_PET_GROW_POTION_SUPER_D:
                            case ItemConfig.ITEM_PET_GROW_POTION_SUPER_E:
                                if (slot.stackNum > 1)
                                {
                                    useMultiFunc = function (_arg_1:uint):void
                                    {
                                        _core.remote.useMultiItem(targetType, petId, slotId, _arg_1);
                                    };
                                    maxNum = getMaxPetGrowItemCanUse(petId, itemId);
                                    if (maxNum > slot.stackNum)
                                    {
                                        maxNum = slot.stackNum;
                                    };
                                    if (maxNum > 0)
                                    {
                                        _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.PLAYER_S[31], Language.PLAYER_S[30], useMultiFunc, 1, 1, maxNum);
                                    };
                                }
                                else
                                {
                                    if (slot.stackNum == 1)
                                    {
                                        _core.remote.useItem(targetType, petId, slotId);
                                    };
                                };
                                break;
                            case ItemConfig.ITEM_WALLET:
                            case ItemConfig.ITEM_WALLET_SMALL:
                            case ItemConfig.ITEM_WALLET_BIG:
                            case ItemConfig.ITEM_GAONENG_ELEMENT_FRUIT:
                            case ItemConfig.ITEM_ELEMENT_FRUIT:
                            case ItemConfig.ITEM_YINGHUN_FRAGMENT:
                            case ItemConfig.ITEM_HEIYAOSHI_CHEST:
                            case ItemConfig.ITEM_MINGHUN_PACKAGE:
                            case ItemConfig.ITEM_RONGYAO_JADE:
                            case ItemConfig.ITEM_WHITEFUSHENQI_PACKAGE:
                            case ItemConfig.ITEM_GREENFUSHENQI_PACKAGE:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_HP:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_MP:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_DEFENCE:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_MDEFENCE:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_ATTACK:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_MATTACK:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_DODGE:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_HIT:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_RESICRITICAL:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_CRITICAL:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_DEBUFFSUCCRATE:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_DEBUFFPROP:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_COUNTER:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_SPEED:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_HURT:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_MAGICHURT:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_REDUDEFY:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_HURTADD:
                            case ItemConfig.ITEM_TIANFUSHI_PACKAGE_MAGICHURTADD:
                            case ItemConfig.ITEM_ZIRANZHILI:
                            case ItemConfig.ITEM_DOUCHONGYINGBI:
                            case ItemConfig.ITEM_YINGHUNSUIXIE:
                            case ItemConfig.ITEM_ZHANCHONGSHOUFU:
                            case ItemConfig.ITEM_ZHONGCHENGLINGPAI:
                            case ItemConfig.ITEM_HUANNENGFENCHENG:
                            case ItemConfig.ITEM_YONGHENGSHUIJING:
                            case ItemConfig.ITEM_FUWENJINGHU:
                            case ItemConfig.ITEM_FUWENSUIPIAN:
                            case ItemConfig.ITEM_YINSHISUIXUE:
                                if (slot.stackNum > 1)
                                {
                                    useMultiFunc = function (_arg_1:uint):void
                                    {
                                        _core.remote.useMultiItem(targetType, petId, slotId, _arg_1);
                                    };
                                    _core.view.getUI(ViewManager.PANEL_INPUT).showInputNum(Language.PLAYER_S[31], Language.PLAYER_S[30], useMultiFunc, 1, 1, slot.stackNum);
                                }
                                else
                                {
                                    if (slot.stackNum == 1)
                                    {
                                        _core.remote.useItem(targetType, petId, slotId);
                                    };
                                };
                                break;
                            default:
                                _core.remote.useItem(targetType, petId, slotId);
                        };
                    }
                    else
                    {
                        _core.remote.useItem(targetType, petId, slotId);
                    };
                };
            };
        }

        public function set exPoint(_arg_1:Number):void
        {
            var _local_2:Object = this._1338617699exPoint;
            if (_local_2 !== _arg_1)
            {
                this._1338617699exPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "exPoint", _local_2, _arg_1));
            };
        }

        public function set paPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._106404485paPnt;
            if (_local_2 !== _arg_1)
            {
                this._106404485paPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "paPnt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get realSoulCrystal():Number
        {
            return (this._683269445realSoulCrystal);
        }

        public function enoughMoney(_arg_1:String, _arg_2:Number):Boolean
        {
            if (_core.player)
            {
                if (_core.player[_arg_1] >= _arg_2)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function set petguardout(_arg_1:Number):void
        {
            var _local_2:Object = this._1490547880petguardout;
            if (_local_2 !== _arg_1)
            {
                this._1490547880petguardout = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petguardout", _local_2, _arg_1));
            };
        }

        public function set stoneSealPoint(_arg_1:Number):void
        {
            var _local_2:Object = this._292525742stoneSealPoint;
            if (_local_2 !== _arg_1)
            {
                this._292525742stoneSealPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stoneSealPoint", _local_2, _arg_1));
            };
        }

        private function routeCopy(_arg_1:Array):Array
        {
            var _local_2:Array = [];
            var _local_3:ByteArray = new ByteArray();
            _local_3.writeObject(_arg_1);
            _local_3.position = 0;
            return (_local_3.readObject() as Array);
        }

        private function seekNpc(_arg_1:String):void
        {
            var _local_2:Object;
            if (_core.data.gameDataIndex2[GamePredef.TBL_NPC][_arg_1])
            {
                for each (_local_2 in _core.data.gameDataIndex2[GamePredef.TBL_NPC][_arg_1])
                {
                    if (_local_2.fd > 0)
                    {
                        _core.remote.useRadar(_arg_1);
                        return;
                    };
                };
                _core.sysBlueMsg(Language.PLAYER_S[25]);
                return;
            };
            _core.sysBlueMsg(Language.PLAYER_S[21]);
        }

        public function set xmCandy24(_arg_1:Number):void
        {
            var _local_2:Object = this._1056511154xmCandy24;
            if (_local_2 !== _arg_1)
            {
                this._1056511154xmCandy24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xmCandy24", _local_2, _arg_1));
            };
        }

        private function onlineReport(_arg_1:TimerEvent):void
        {
            _core.remote.onlineReport();
        }

        public function needToCheckBattle():Boolean
        {
            var _local_2:*;
            var _local_1:Number = _core.player._posMapId;
            for (_local_2 in this.safeCBMids)
            {
                if (safeCBMids[_local_2] == _local_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function useTransport(_arg_1:String):void
        {
            var _local_4:Object;
            var _local_2:int;
            var _local_3:int;
            for each (_local_4 in mapArr)
            {
                if (_local_4.name == _arg_1)
                {
                    _local_2 = _local_4.id;
                    _local_3 = _local_4.level;
                    break;
                };
            };
            if (_local_2 == 0)
            {
                _core.sysBlueMsg(Language.PLAYER_S[20]);
            }
            else
            {
                _core.remote.useTransport(_local_2, true);
            };
        }

        [Bindable(event="propertyChange")]
        public function get magiccystallimit():Number
        {
            return (this._1183081836magiccystallimit);
        }

        public function set money(_arg_1:Number):void
        {
            var _local_2:Object = this._104079552money;
            if (_local_2 !== _arg_1)
            {
                this._104079552money = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "money", _local_2, _arg_1));
            };
        }

        public function set goldBind(_arg_1:Number):void
        {
            var _local_2:Object = this._2035869885goldBind;
            if (_local_2 !== _arg_1)
            {
                this._2035869885goldBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldBind", _local_2, _arg_1));
            };
        }

        private function footleName(_arg_1:String):void
        {
            _core.remote.useFootle(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get elementPnt():Number
        {
            return (this._575924634elementPnt);
        }

        public function set energyStone(_arg_1:Number):void
        {
            var _local_2:Object = this._1829557571energyStone;
            if (_local_2 !== _arg_1)
            {
                this._1829557571energyStone = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "energyStone", _local_2, _arg_1));
            };
        }

        public function set xcds2403p(_arg_1:Number):void
        {
            var _local_2:Object = this._489540817xcds2403p;
            if (_local_2 !== _arg_1)
            {
                this._489540817xcds2403p = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xcds2403p", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get battleSprite():Number
        {
            return (this._2100767331battleSprite);
        }

        [Bindable(event="propertyChange")]
        public function get posCenterX():int
        {
            return (this._1590959535posCenterX);
        }

        [Bindable(event="propertyChange")]
        public function get pvePoint():Number
        {
            return (this._2053648975pvePoint);
        }

        [Bindable(event="propertyChange")]
        public function get posCenterY():int
        {
            return (this._1590959536posCenterY);
        }

        public function set couragePoint(_arg_1:Number):void
        {
            var _local_2:Object = this._1966126374couragePoint;
            if (_local_2 !== _arg_1)
            {
                this._1966126374couragePoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "couragePoint", _local_2, _arg_1));
            };
        }

        public function set lottoBagLength(_arg_1:String):void
        {
            var _local_2:Object = this._94078750lottoBagLength;
            if (_local_2 !== _arg_1)
            {
                this._94078750lottoBagLength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lottoBagLength", _local_2, _arg_1));
            };
        }

        public function set groupAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._293427937groupAC;
            if (_local_2 !== _arg_1)
            {
                this._293427937groupAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupAC", _local_2, _arg_1));
            };
        }

        public function set realSoulWater(_arg_1:Number):void
        {
            var _local_2:Object = this._1067362586realSoulWater;
            if (_local_2 !== _arg_1)
            {
                this._1067362586realSoulWater = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "realSoulWater", _local_2, _arg_1));
            };
        }

        public function set txkc2508p(_arg_1:Number):void
        {
            var _local_2:Object = this._1466742551txkc2508p;
            if (_local_2 !== _arg_1)
            {
                this._1466742551txkc2508p = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txkc2508p", _local_2, _arg_1));
            };
        }

        public function getGroupMemberByCid(_arg_1:Number):Charactor
        {
            var _local_2:*;
            for (_local_2 in groupAC)
            {
                if (_arg_1 == Charactor(groupAC[_local_2]).id)
                {
                    return (Charactor(groupAC[_local_2]));
                };
            };
            return (null);
        }

        [Bindable(event="propertyChange")]
        public function get threePvpPnt():Number
        {
            return (this._634593770threePvpPnt);
        }

        public function set heiyaoshiPoint2(_arg_1:Number):void
        {
            var _local_2:Object = this._2052063483heiyaoshiPoint2;
            if (_local_2 !== _arg_1)
            {
                this._2052063483heiyaoshiPoint2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "heiyaoshiPoint2", _local_2, _arg_1));
            };
        }

        public function set mysteryCrystal(_arg_1:Number):void
        {
            var _local_2:Object = this._162163465mysteryCrystal;
            if (_local_2 !== _arg_1)
            {
                this._162163465mysteryCrystal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysteryCrystal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get decoSilver():Number
        {
            return (this._1691040230decoSilver);
        }

        [Bindable(event="propertyChange")]
        public function get heiyaoshiPoint():Number
        {
            return (this._481837591heiyaoshiPoint);
        }

        public function set dmbk2509p(_arg_1:Number):void
        {
            var _local_2:Object = this._523115282dmbk2509p;
            if (_local_2 !== _arg_1)
            {
                this._523115282dmbk2509p = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dmbk2509p", _local_2, _arg_1));
            };
        }

        public function set npPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._105004308npPnt;
            if (_local_2 !== _arg_1)
            {
                this._105004308npPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "npPnt", _local_2, _arg_1));
            };
        }

        public function getMyLoopData(_arg_1:Number):Object
        {
            var _local_2:Object;
            if (loopList)
            {
                for each (_local_2 in loopList)
                {
                    if (((_local_2) && (Number(_local_2.qid) == _arg_1)))
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }

        public function set moneyBind(_arg_1:Number):void
        {
            var _local_2:Object = this._1714071267moneyBind;
            if (_local_2 !== _arg_1)
            {
                this._1714071267moneyBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyBind", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get expSkill():Number
        {
            return (this._1952114124expSkill);
        }

        public function set wisdonCrystal(_arg_1:Number):void
        {
            var _local_2:Object = this._465052908wisdonCrystal;
            if (_local_2 !== _arg_1)
            {
                this._465052908wisdonCrystal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wisdonCrystal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get realSoulStone():Number
        {
            return (this._1070495180realSoulStone);
        }

        public function useTransportGroup(_arg_1:String):void
        {
            var _local_4:Object;
            var _local_2:int;
            var _local_3:int;
            for each (_local_4 in mapArr)
            {
                if (_local_4.name == _arg_1)
                {
                    _local_2 = _local_4.id;
                    _local_3 = _local_4.level;
                    break;
                };
            };
            if (_local_2 == 0)
            {
                _core.sysBlueMsg(Language.PLAYER_S[20]);
            }
            else
            {
                _core.remote.useTransportGroup(_local_2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get shishangdian():Number
        {
            return (this._1093046749shishangdian);
        }

        [Bindable(event="propertyChange")]
        public function get heroScore2507():Number
        {
            return (this._508024386heroScore2507);
        }

        public function set mapData(_arg_1:Object):void
        {
            _mapData = _arg_1;
            mapSafe = (_mapData.safeFlag > 0);
        }

        public function behavior(_arg_1:Number):void
        {
            _core.remote.behavior(_arg_1);
        }

        public function set worldCupGoldPoint(_arg_1:Number):void
        {
            var _local_2:Object = this._540145372worldCupGoldPoint;
            if (_local_2 !== _arg_1)
            {
                this._540145372worldCupGoldPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "worldCupGoldPoint", _local_2, _arg_1));
            };
        }

        public function set groupRequestAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._99509454groupRequestAC;
            if (_local_2 !== _arg_1)
            {
                this._99509454groupRequestAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupRequestAC", _local_2, _arg_1));
            };
        }

        public function set summerGameScore2015(_arg_1:Number):void
        {
            var _local_2:Object = this._1933665075summerGameScore2015;
            if (_local_2 !== _arg_1)
            {
                this._1933665075summerGameScore2015 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "summerGameScore2015", _local_2, _arg_1));
            };
        }

        private function trackName(_arg_1:String):void
        {
            _core.remote.useTrack(_arg_1);
        }

        public function getEmptyBagSlotNum():int
        {
            var _local_3:Object;
            var _local_1:int = (_core.player.bagSlotNum * 30);
            var _local_2:int;
            for each (_local_3 in _core.data.sList)
            {
                if ((((_local_3) && (_local_3.sid > GamePredef.SLOT_SID_BAG[0])) && (_local_3.sid <= GamePredef.SLOT_SID_BAG[_core.player.bagSlotNum])))
                {
                    _local_2++;
                };
            };
            return (_local_1 - _local_2);
        }

        [Bindable(event="propertyChange")]
        public function get magiccystalrec():Number
        {
            return (this._747604609magiccystalrec);
        }

        [Bindable(event="propertyChange")]
        public function get starPnt():Number
        {
            return (this._1897219452starPnt);
        }

        [Bindable(event="propertyChange")]
        public function get paPnt():Number
        {
            return (this._106404485paPnt);
        }

        public function set soulPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._2022073533soulPnt;
            if (_local_2 !== _arg_1)
            {
                this._2022073533soulPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soulPnt", _local_2, _arg_1));
            };
        }

        public function set realSoulCrystal(_arg_1:Number):void
        {
            var _local_2:Object = this._683269445realSoulCrystal;
            if (_local_2 !== _arg_1)
            {
                this._683269445realSoulCrystal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "realSoulCrystal", _local_2, _arg_1));
            };
        }

        public function isTakeQuest(_arg_1:Number):Boolean
        {
            return (_core.view.getUI(ViewManager.PANEL_QUESTMANAGER).isTakeQuest(_arg_1));
        }

        override public function closeTo(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Array;
            var _local_4:*;
            var _local_5:*;
            var _local_6:Object;
            checkWalkable();
            if (((walkable) && (!(_inBattle))))
            {
                _local_4 = null;
                if (((!(flyingState == GamePredef.FLYING_STATE_TAKING_OFF)) && (!(flyingState == GamePredef.FLYING_STATE_IN_THE_AIR))))
                {
                    _local_4 = normalView.hitTestLayer;
                }
                else
                {
                    _local_5 = _core.view.getUI(ViewManager.STAGE_MAIN).mapContainer;
                    if (((_arg_1 > _local_5.mwidth) || (_arg_2 > _local_5.mheight)))
                    {
                        return;
                    };
                };
                _local_3 = _core.move.getCloseToRoute(normalView.posX, normalView.posY, _arg_1, _arg_2, _local_4);
                moveRoute = _local_3;
                _lastMoveRoute = routeCopy(_local_3);
                _continuousMoveCount++;
                _core.remote.udcr({
                    "id":id,
                    "route":moveRoute,
                    "x":normalView.posX,
                    "y":normalView.posY
                });
                if (((moveRoute) && (moveRoute.length > 0)))
                {
                    _local_6 = _core.view.getUI(ViewManager.PANEL_MAP);
                    _local_6.drawRoute(normalView.posX, normalView.posY, _arg_1, _arg_2, moveRoute);
                };
                walk();
            };
        }

        private function antiFootleName(_arg_1:String):void
        {
            _core.remote.useAntiFootle(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get dogM():Number
        {
            return (this._3089041dogM);
        }

        [Bindable(event="propertyChange")]
        public function get stoneSealPoint():Number
        {
            return (this._292525742stoneSealPoint);
        }

        public function canTakeQuest(_arg_1:Number):Boolean
        {
            var _local_3:Object;
            var _local_4:Boolean;
            var _local_5:String;
            if (isTakeQuest(_arg_1))
            {
                return (false);
            };
            if (isFinishQuest(_arg_1))
            {
                return (false);
            };
            var _local_2:Object = _core.data.getData(GamePredef.TBL_QUEST, _arg_1);
            if (_local_2)
            {
                if (((_local_2.isRebirth) && (Number(_local_2.isRebirth) > 0)))
                {
                    if (((_core.player.levelRe > _local_2.maxLevel) || (_core.player.levelRe < _local_2.minLevel)))
                    {
                        return (false);
                    };
                }
                else
                {
                    if (((!(_local_2.isRebirth)) || (Number(_local_2.isRebirth) == 0)))
                    {
                        if (((_core.player.level > _local_2.maxLevel) || (_core.player.level < _local_2.minLevel)))
                        {
                            return (false);
                        };
                    };
                };
                if (((!(_core.player.gender == _local_2.gender)) && (!(_local_2.gender == GamePredef.GENDER_NONE))))
                {
                    return (false);
                };
                if (((!(_local_2.reqClass == "all")) && (_local_2.reqClass.indexOf((("|" + _core.player.classId) + "|")) < 0)))
                {
                    return (false);
                };
                _local_3 = _core.data.getQuestPre(_arg_1);
                _local_4 = false;
                if (_local_3)
                {
                    for (_local_5 in _local_3)
                    {
                        if (_local_3[_local_5])
                        {
                            switch (Number(_local_3[_local_5].kind))
                            {
                                case GamePredef.QUEST_PRE_ITEM:
                                    if (!_core.haveItem(_local_3[_local_5].type, _local_3[_local_5].itemId, _local_3[_local_5].num))
                                    {
                                        return (false);
                                    };
                                    break;
                                case GamePredef.QUEST_PRE_QUEST:
                                    if (_local_2.preQuestType == 1)
                                    {
                                        if (!isFinishQuest(_local_3[_local_5].itemId))
                                        {
                                            return (false);
                                        };
                                    }
                                    else
                                    {
                                        if (_local_2.preQuestType == 2)
                                        {
                                            if (isFinishQuest(_local_3[_local_5].itemId))
                                            {
                                                _local_4 = true;
                                            };
                                        };
                                    };
                                    break;
                            };
                        };
                    };
                };
                if (((_local_2.preQuestType == 2) && (!(_local_4))))
                {
                    return (false);
                };
                return (true);
            };
            return (false);
        }

        public function mapTrans(_arg_1:int):void
        {
            var _local_2:Boolean;
            var _local_3:*;
            if (((_arg_1 <= 0) || (!(_arg_1))))
            {
                return;
            };
            if (isLeader)
            {
                _local_2 = true;
                for (_local_3 in groupAC)
                {
                    if (((((Charactor(groupAC[_local_3])) && (!(Charactor(groupAC[_local_3]).groupAfk))) && (groupAC[_local_3].id)) && (!(_core.player.id == groupAC[_local_3].id))))
                    {
                        transGroup(_arg_1);
                        _local_2 = false;
                        break;
                    };
                };
                if (_local_2)
                {
                    transSingle(_arg_1);
                };
            }
            else
            {
                transSingle(_arg_1);
            };
        }

        public function set petPK(_arg_1:Number):void
        {
            var _local_2:Object = this._106557274petPK;
            if (_local_2 !== _arg_1)
            {
                this._106557274petPK = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petPK", _local_2, _arg_1));
            };
        }

        public function getEmptyBankSlotNum():int
        {
            var _local_3:Object;
            var _local_1:int = (_core.player.bankSlotNum * 30);
            var _local_2:int;
            for each (_local_3 in _core.data.sList)
            {
                if ((((_local_3) && (_local_3.sid > GamePredef.SLOT_SID_BANK[0])) && (_local_3.sid <= GamePredef.SLOT_SID_BANK[_core.player.bankSlotNum])))
                {
                    _local_2++;
                };
            };
            return (_local_1 - _local_2);
        }

        override public function routeTo(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Array;
            var _local_4:*;
            var _local_5:Point;
            var _local_6:Object;
            checkWalkable();
            if ((((walkable) && (!(_inBattle))) && (normalView)))
            {
                _local_4 = null;
                if (((!(flyingState == GamePredef.FLYING_STATE_TAKING_OFF)) && (!(flyingState == GamePredef.FLYING_STATE_IN_THE_AIR))))
                {
                    _local_4 = normalView.hitTestLayer;
                };
                _local_3 = _core.move.getRoute(normalView.posX, normalView.posY, _arg_1, _arg_2, _local_4);
                moveRoute = _local_3;
                _lastMoveRoute = routeCopy(_local_3);
                _continuousMoveCount++;
                if (((moveRoute) && (moveRoute.length == 1)))
                {
                    _local_5 = new Point(moveRoute[0][0], moveRoute[0][1]);
                    if (Point.distance(_lp, _local_5) < UPDATE_DIS)
                    {
                        return;
                    };
                };
                _core.remote.udcr({
                    "id":id,
                    "route":moveRoute,
                    "x":normalView.posX,
                    "y":normalView.posY
                });
                if (((moveRoute) && (moveRoute.length > 0)))
                {
                    _local_6 = _core.view.getUI(ViewManager.PANEL_MAP);
                    _local_6.drawRoute(normalView.posX, normalView.posY, _arg_1, _arg_2, moveRoute);
                };
                _lastPlayerPosition.time = new Date().getTime();
                _lastPlayerPosition.mapId = this.posMapId;
                _lastPlayerPosition.posX = normalView.posX;
                _lastPlayerPosition.posY = normalView.posY;
                walk();
            };
        }

        private function useHalloweenCard(_arg_1:String):void
        {
            _core.remote.useHalloweenCard(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get energyStone():Number
        {
            return (this._1829557571energyStone);
        }

        [Bindable(event="propertyChange")]
        public function get couragePoint():Number
        {
            return (this._1966126374couragePoint);
        }

        public function set magiccystallimit(_arg_1:Number):void
        {
            var _local_2:Object = this._1183081836magiccystallimit;
            if (_local_2 !== _arg_1)
            {
                this._1183081836magiccystallimit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magiccystallimit", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get groupAC():ArrayCollection
        {
            return (this._293427937groupAC);
        }

        [Bindable(event="propertyChange")]
        public function get realSoulWater():Number
        {
            return (this._1067362586realSoulWater);
        }

        public function enoughMoneyAuto(_arg_1:int, _arg_2:Number):Object
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 == 1)
            {
                _local_3 = GamePredef.GLOBAL_SETTING.defaultMoney;
                switch (_local_3)
                {
                    case 1:
                        return (enoughMoney("moneyBind", _arg_2));
                    case 2:
                        return (enoughMoney("money", _arg_2));
                };
            }
            else
            {
                if (_arg_1 == 2)
                {
                    _local_4 = GamePredef.GLOBAL_SETTING.defaultGold;
                    switch (_local_4)
                    {
                        case 1:
                            return (enoughMoney("goldBind", _arg_2));
                        case 2:
                            return (enoughMoney("gold", _arg_2));
                    };
                };
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get dmbk2509p():Number
        {
            return (this._523115282dmbk2509p);
        }

        [Bindable(event="propertyChange")]
        public function get wisdonCrystal():Number
        {
            return (this._465052908wisdonCrystal);
        }

        public function isTakeLoop(_arg_1:Number):Boolean
        {
            var _local_3:Object;
            var _local_2:Object = getMyLoopData(_arg_1);
            if (_local_2)
            {
                _local_3 = _core.data.getData(GamePredef.TBL_QUEST_LOOP, _local_2.qid);
                if (_local_3)
                {
                    if (((Number(_local_2.finished) <= 0) && (Number(_local_2.ft) < _local_3.num)))
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function get mapData():Object
        {
            return (_mapData);
        }

        [Bindable(event="propertyChange")]
        public function get groupRequestAC():ArrayCollection
        {
            return (this._99509454groupRequestAC);
        }

        public function set elementPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._575924634elementPnt;
            if (_local_2 !== _arg_1)
            {
                this._575924634elementPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementPnt", _local_2, _arg_1));
            };
        }

        public function set tkyyhpointV2(_arg_1:Number):void
        {
            var _local_2:Object = this._1589513115tkyyhpointV2;
            if (_local_2 !== _arg_1)
            {
                this._1589513115tkyyhpointV2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tkyyhpointV2", _local_2, _arg_1));
            };
        }

        public function set battleSprite(_arg_1:Number):void
        {
            var _local_2:Object = this._2100767331battleSprite;
            if (_local_2 !== _arg_1)
            {
                this._2100767331battleSprite = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "battleSprite", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get summerGameScore2015():Number
        {
            return (this._1933665075summerGameScore2015);
        }

        private function transTo(_arg_1:int, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            if (_arg_2)
            {
                _core.remote.useTransportGroup(_arg_1);
            }
            else
            {
                _core.remote.useTransport(_arg_1, _arg_3);
            };
            _core.view.hide(ViewManager.TOOLTIP_MAP);
            _core.view.hide(ViewManager.POPU_WORLDMAP);
            _core.view.getUI(ViewManager.TOOLTIP_PET).hide();
            _core.view.getUI(ViewManager.TOOLTIP_QUEST).hide();
        }

        public function set worldCupPoint(_arg_1:Number):void
        {
            var _local_2:Object = this._1654691932worldCupPoint;
            if (_local_2 !== _arg_1)
            {
                this._1654691932worldCupPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "worldCupPoint", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get soulPnt():Number
        {
            return (this._2022073533soulPnt);
        }

        public function set medalExp(_arg_1:Number):void
        {
            var _local_2:Object = this._907859034medalExp;
            if (_local_2 !== _arg_1)
            {
                this._907859034medalExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petPK():Number
        {
            return (this._106557274petPK);
        }

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            petPK = _arg_1.petPK;
            dogM = _arg_1.dogM;
            btPnt = _arg_1.btPnt;
            cbM = _arg_1.cbM;
            lottoBagLength = _arg_1.lotooBagLength;
            lotteryBagLength = _arg_1.lotteryBagLength;
            achPnt = _arg_1.achPnt;
            paPnt = _arg_1.paPnt;
            starPnt = _arg_1.starPnt;
            soulPnt = _arg_1.soulPnt;
            threePvpPnt = _arg_1.threePvpPnt;
            elementPnt = _arg_1.elementPnt;
            npPnt = _arg_1.npPnt;
            summerGameScore2015 = _arg_1.summerGameScore2015;
            pvePoint = _arg_1.pvePoint;
            stoneSealPoint = _arg_1.stoneSealPoint;
            activePetObject = _arg_1.activePetObject;
            evolutionPetObject = _arg_1.activePetObject;
            wisdonCrystal = _arg_1.wisdonCrystal;
            couragePoint = _arg_1.couragePoint;
            dressInfo = JSONUtil.JSONfy(_arg_1.dressInfo);
            medalExp = _arg_1.medalExp;
            mysteryCrystal = _arg_1.mysteryCrystal;
            heroScore2507 = _arg_1.heroScore2507;
            xmCandy24 = _arg_1.xmCandy;
            xcds2403p = _arg_1.xcdsp;
            txkc2508p = _arg_1.txkcp;
            dmbk2509p = _arg_1.dmbkp;
            tkyyhpointV2 = _arg_1.tkyyhp;
            shishangdian = _arg_1.shishangdian;
            decoSilver = _arg_1.decoSilver;
            runeExp = _arg_1.runeExp;
            heiyaoshiPoint = _arg_1.heiyaoshiPoint;
            heiyaoshiPoint2 = _arg_1.heiyaoshiPoint2;
            realSoulStone = _arg_1.realSoulStone;
            realSoulCrystal = _arg_1.realSoulCrystal;
            realSoulWater = _arg_1.realSoulWater;
            yijieElement = _arg_1.yijieElement;
            warSprite = _arg_1.warSprite;
            battleSprite = _arg_1.battleSprite;
            monsterHeart = _arg_1.monsterHeart;
            mhjingshi = _arg_1.mhjingshi;
            petguardout = _arg_1.petguardout;
            petguardin = _arg_1.petguardin;
            awakenLevel = ((_arg_1.hasOwnProperty("awakenLevel")) ? _arg_1.awakenLevel : 0);
            awakenAdd = ((_arg_1.hasOwnProperty("awakenAdd")) ? _arg_1.awakenAdd : 0);
            awakenPoint = ((_arg_1.hasOwnProperty("awakenPoint")) ? _arg_1.awakenPoint : 0);
            awakenPointUsed = ((_arg_1.hasOwnProperty("awakenPointUsed")) ? _arg_1.awakenPointUsed : 0);
            awakenPointDict = _arg_1.awakenPointDict;
            trainSoulLvl = _arg_1.trainSoulLvl;
            trainSoulExp = _arg_1.trainSoulExp;
            contractPet = _arg_1.contractPet;
            magiccystallimit = _arg_1.magiccystallimit;
            magiccystalpre = _arg_1.magiccystalpre;
            magiccystalrec = _arg_1.magiccystalrec;
            energyStone = _arg_1.energyStone;
            newGrade = _arg_1.newGrade;
        }

        public function set posCenterX(_arg_1:int):void
        {
            var _local_2:Object = this._1590959535posCenterX;
            if (_local_2 !== _arg_1)
            {
                this._1590959535posCenterX = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "posCenterX", _local_2, _arg_1));
            };
        }

        public function set posCenterY(_arg_1:int):void
        {
            var _local_2:Object = this._1590959536posCenterY;
            if (_local_2 !== _arg_1)
            {
                this._1590959536posCenterY = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "posCenterY", _local_2, _arg_1));
            };
        }

        public function set pvePoint(_arg_1:Number):void
        {
            var _local_2:Object = this._2053648975pvePoint;
            if (_local_2 !== _arg_1)
            {
                this._2053648975pvePoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvePoint", _local_2, _arg_1));
            };
        }

        public function checkChatTime():Boolean
        {
            var _local_1:Number = new Date().getTime();
            if (_local_1 > (_lastChatTime + (GamePredef.CHAT_INTERVAL * 1000)))
            {
                _lastChatTime = _local_1;
                return (true);
            };
            return (false);
        }

        private function getMaxPetGrowItemCanUse(_arg_1:uint, _arg_2:uint):uint
        {
            var _local_4:Object;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:Number;
            var _local_8:uint;
            var _local_3:uint = GamePredef.PET_GROW_ITEM_ADD_EXP[_arg_2];
            if ((((petList) && (petList[_arg_1])) && (_local_3)))
            {
                _local_4 = petList[_arg_1];
                _local_5 = PetLogic.expToLv(_local_4.exp);
                _local_6 = (level + 5);
                if (_local_6 > GamePredef.MAX_LEVEL)
                {
                    _local_6 = GamePredef.MAX_LEVEL;
                };
                if (_local_5 < _local_6)
                {
                    _local_7 = (PetLogic.lvToExp(_local_6) - _local_4.exp);
                    _local_8 = uint(Math.ceil((_local_7 / _local_3)));
                    return (_local_8);
                };
            };
            return (0);
        }

        public function set groupList(_arg_1:Object):void
        {
            var _local_3:Charactor;
            groupAC = new ArrayCollection();
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:Object = _arg_1.head;
            while (_local_2)
            {
                if (((_core.groupMemberListArr) && (_core.groupMemberListArr[Number(_local_2.obj)])))
                {
                    groupAC.addItem(_core.groupMemberListArr[Number(_local_2.obj)]);
                }
                else
                {
                    _local_3 = _core.getCharactor(Number(_local_2.obj));
                    if (_local_3)
                    {
                        groupAC.addItem(_local_3);
                    };
                };
                _local_2 = _local_2.next;
            };
        }

        public function set lotteryBagLength(_arg_1:String):void
        {
            var _local_2:Object = this._1086658619lotteryBagLength;
            if (_local_2 !== _arg_1)
            {
                this._1086658619lotteryBagLength = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lotteryBagLength", _local_2, _arg_1));
            };
        }

        public function getPetNumAll():int
        {
            var _local_2:Object;
            var _local_1:Number = 0;
            if (petList)
            {
                for each (_local_2 in petList)
                {
                    if (_local_2)
                    {
                        _local_1++;
                    };
                };
            };
            return (_local_1);
        }

        public function set warSprite(_arg_1:Number):void
        {
            var _local_2:Object = this._1789520845warSprite;
            if (_local_2 !== _arg_1)
            {
                this._1789520845warSprite = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "warSprite", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tkyyhpointV2():Number
        {
            return (this._1589513115tkyyhpointV2);
        }

        public function set cbM(_arg_1:Number):void
        {
            var _local_2:Object = this._98254cbM;
            if (_local_2 !== _arg_1)
            {
                this._98254cbM = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cbM", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get worldCupPoint():Number
        {
            return (this._1654691932worldCupPoint);
        }

        [Bindable(event="propertyChange")]
        public function get medalExp():Number
        {
            return (this._907859034medalExp);
        }

        public function updateSafeCBMids(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1 == null)
            {
                return;
            };
            this.safeCBMids.length = 0;
            for (_local_2 in _arg_1)
            {
                this.safeCBMids.push(_arg_1[_local_2]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get lotteryBagLength():String
        {
            return (this._1086658619lotteryBagLength);
        }

        private function checkWalkable():void
        {
            var func:Function;
            if ((((isDead) && (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_STAND_IN_BABY) < 1)) && (!(_core.player.posMapId == 110))))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.CANCEL)
                    {
                        _core.remote.toSafe();
                    }
                    else
                    {
                        _core.remote.reliveUseItem();
                    };
                };
                Alert.show(Language.PLAYER_S[0], "", (Alert.OK | Alert.CANCEL), null, func);
                walkable = false;
            }
            else
            {
                if (((isDead) && (_core.player.posMapId == 110)))
                {
                    Alert.show("你还处在死亡状态，无法行动", "", Alert.OK, null);
                    walkable = false;
                }
                else
                {
                    if ((((inGroup) && (!(isLeader))) && (!(groupAfk))))
                    {
                        walkable = false;
                        _core.sysMidNote(Language.PLAYER_S[1]);
                        say(Language.PLAYER_S[2], GamePredef.MSG_CHANNEL_GROUP);
                    }
                    else
                    {
                        if (taskSweep)
                        {
                            walkable = false;
                            _core.sysMidNote(Language.TASKSWEEPPANEL_U[16]);
                        }
                        else
                        {
                            walkable = true;
                        };
                    };
                    if (isHanged)
                    {
                        walkable = false;
                    };
                };
            };
        }

        public function checkWorldChatTime():Boolean
        {
            var _local_1:Number = new Date().getTime();
            if (_local_1 > (_lastWorldChatTime + (GamePredef.CHAT_WORLD_INTERVAL * 1000)))
            {
                _lastWorldChatTime = _local_1;
                return (true);
            };
            return (false);
        }

        public function set threePvpPnt(_arg_1:Number):void
        {
            var _local_2:Object = this._634593770threePvpPnt;
            if (_local_2 !== _arg_1)
            {
                this._634593770threePvpPnt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "threePvpPnt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cbM():Number
        {
            return (this._98254cbM);
        }

        public function enoughBank(_arg_1:int):Boolean
        {
            if (getEmptyBankSlotNum() >= _arg_1)
            {
                return (true);
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get warSprite():Number
        {
            return (this._1789520845warSprite);
        }


    }
}//package com.qeedoo.game.object

