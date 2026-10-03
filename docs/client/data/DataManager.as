// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.data.DataManager

package com.qeedoo.game.data
{
    import flash.events.EventDispatcher;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import flash.utils.setTimeout;
    import com.qeedoo.game.view.ViewManager;

    public class DataManager extends EventDispatcher 
    {

        private static var _instance:DataManager;

        private var _bagIndexInited:Boolean;
        private var _gsInited:Boolean;
        private var _bagSlotIndex:Object;
        private var _tmpDict:Object;
        private var _sList:Object;
        public var gameData:Array;
        private var _sInited:Boolean;
        private var _gsList:Object;

        public var gameDataIndex:Object = {};
        public var gameDataIndex2:Object = {};
        public var gameDataIndex3:Object = {};
        private var _core:Core = Core.getInstance();

        public function DataManager(_arg_1:Single)
        {
            _sInited = false;
            _gsInited = false;
            _bagIndexInited = false;
            gameData = GameData.d;
            createDataIndex();
        }

        public static function getInstance():DataManager
        {
            if (_instance == null)
            {
                _instance = new DataManager(new Single());
            };
            return (_instance);
        }


        public function get sInited():Boolean
        {
            return (_sInited);
        }

        private function initBagSlotIndex():void
        {
            _bagSlotIndex = {};
            _initBagSlotIndex();
        }

        public function set gsInited(_arg_1:Boolean):void
        {
            _gsInited = _arg_1;
        }

        private function addSlotToUnhandled(_arg_1:Number):void
        {
            if (!_bagSlotIndex)
            {
                _bagSlotIndex = {};
            };
            if (!_bagSlotIndex["unH"])
            {
                _bagSlotIndex["unH"] = new Array();
            };
            _bagSlotIndex["unH"].push(_arg_1);
        }

        private function onNewData(_arg_1:Object):void
        {
            if (_arg_1)
            {
                addNewData(_arg_1.type, _arg_1.data);
            };
        }

        public function addBagSlotIndex(_arg_1:Number, _arg_2:Object):void
        {
            var _local_3:Number;
            var _local_4:Number;
            if (!_bagSlotIndex)
            {
                _bagSlotIndex = {};
            };
            if (!_arg_2)
            {
                return;
            };
            if (((_sList) && (_sList[_arg_1])))
            {
                _local_3 = Number(_sList[_arg_1].sid);
                _local_4 = Number(_sList[_arg_1].type);
                _sList[_arg_1].tid = _arg_2.id;
                if (isBagSlot(_local_3))
                {
                    if (!_bagSlotIndex[_local_4])
                    {
                        _bagSlotIndex[_local_4] = {};
                    };
                    if (_bagSlotIndex[_local_4][_arg_2.id] != null)
                    {
                        if (_bagSlotIndex[_local_4][_arg_2.id].indexOf(_arg_1) < 0)
                        {
                            _bagSlotIndex[_local_4][_arg_2.id].push(_arg_1);
                        };
                    }
                    else
                    {
                        _bagSlotIndex[_local_4][_arg_2.id] = [];
                        _bagSlotIndex[_local_4][_arg_2.id].push(_arg_1);
                    };
                }
                else
                {
                    return;
                };
            };
        }

        public function addNewData(_arg_1:int, _arg_2:*):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (gameData == null)
            {
                gameData = [];
            };
            if (gameData[_arg_1] == null)
            {
                gameData[_arg_1] = [];
            };
            gameData[_arg_1][_arg_2.id] = _arg_2;
            var _local_3:GameDataEvent = new GameDataEvent(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1) + "_") + _arg_2.id));
            _local_3.data = {
                "type":_arg_1,
                "index":_arg_2.id,
                "data":_arg_2
            };
            dispatchEvent(_local_3);
        }

        public function updateData(_arg_1:int, _arg_2:*):void
        {
            gameData[_arg_1][_arg_2.id] = _arg_2;
        }

        public function getDataPackage(_arg_1:int, _arg_2:Number):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:GameDataEvent;
            var _local_6:Core;
            if (gameData[_arg_1])
            {
                _local_3 = gameData[_arg_1][_arg_2];
            };
            if (_local_3)
            {
                if (_arg_1 == GamePredef.TBL_PET)
                {
                    _local_4 = gameData[GamePredef.TBL_CREATURE][_local_3.tid];
                }
                else
                {
                    _local_4 = gameData[(_arg_1 + 1)][_local_3.tid];
                };
            };
            if (((_local_3) && (_local_4)))
            {
                _local_5 = new GameDataEvent(((((GameDataEvent.DATA_PACKAGE_RECIEVED + "_") + _arg_1) + "_") + _arg_2));
                _local_5.data = {
                    "type":_arg_1,
                    "inst":_local_3,
                    "temp":_local_4
                };
                dispatchEvent(_local_5);
            }
            else
            {
                _local_6 = Core.getInstance();
                _local_6.remote.nc.call("getDataPackageClient", new Responder(onNewDataPackage), _arg_1, _arg_2);
            };
        }

        public function clearData(_arg_1:int, _arg_2:Number):void
        {
            gameData[_arg_1][_arg_2] = null;
        }

        public function isBagSlot(_arg_1:Number):Boolean
        {
            if (((((_arg_1 > GamePredef.SLOT_SID_BAG[0]) && (_arg_1 <= GamePredef.SLOT_SID_BAG[_core.player.bagSlotNum])) || ((_arg_1 > GamePredef.SLOT_SID_BAG[7]) && (_arg_1 <= GamePredef.SLOT_SID_BAG[8]))) || ((_arg_1 > GamePredef.SLOT_SID_BAG[8]) && (_arg_1 <= GamePredef.SLOT_SID_BAG[9]))))
            {
                return (true);
            };
            return (false);
        }

        public function getData(_arg_1:int, _arg_2:Number):Object
        {
            if (gameData)
            {
                if (gameData[_arg_1])
                {
                    if (gameData[_arg_1][_arg_2])
                    {
                        return (gameData[_arg_1][_arg_2]);
                    };
                };
            };
            return (null);
        }

        public function get bagIdxInited():Boolean
        {
            return (_bagIndexInited);
        }

        public function delSlot(_arg_1:Object):void
        {
            var _local_2:Boolean;
            var _local_3:String;
            var _local_4:GameDataEvent;
            if (_arg_1.id != undefined)
            {
                delBagSlotIndex(_arg_1.id);
                delete _sList[_arg_1.id];
                _local_2 = true;
            }
            else
            {
                if (_arg_1.sid != undefined)
                {
                    for (_local_3 in sList)
                    {
                        if (sList[_local_3].sid == _arg_1.sid)
                        {
                            delBagSlotIndex(Number(_local_3));
                            delete sList[_local_3];
                            _local_2 = true;
                        };
                    };
                };
            };
            if (_local_2)
            {
                _local_4 = new GameDataEvent(GamePredef.EVENT_REFRESH_FUNCSLOTS);
                _local_4.data = {};
                dispatchEvent(_local_4);
            };
        }

        public function get gsList():Object
        {
            return (_gsList);
        }

        public function extAddBagSlotIndex(_arg_1:Object):void
        {
            var _local_3:GameDataEvent;
            var _local_2:Object = _core.getTemplateData(_arg_1.type, _arg_1.itemId, false);
            if (_local_2)
            {
                addBagSlotIndex(Number(_arg_1.id), _local_2);
                _local_3 = new GameDataEvent(GamePredef.EVENT_REFRESH_FUNCSLOTS);
                _local_3.data = {};
                dispatchEvent(_local_3);
            }
            else
            {
                addSlotToUnhandled(Number(_arg_1.id));
                setTimeout(handleSlotIndexLater, 200);
            };
        }

        public function getChaQuestFullData(_arg_1:Object):Object
        {
            var _local_3:*;
            var _local_2:Object = getQuestFullData(_arg_1.qid);
            if (!_local_2)
            {
                return (null);
            };
            for (_local_3 in _arg_1)
            {
                _local_2[_local_3] = _arg_1[_local_3];
            };
            return (_local_2);
        }

        public function get sList():Object
        {
            return (_sList);
        }

        public function initGuildSlotData(_arg_1:Object):void
        {
            _gsList = _arg_1;
            _gsInited = true;
            Core.getInstance().view.getUI(ViewManager.PANEL_GUILDWAREHOUSE).updateView();
        }

        public function createIndex(_arg_1:int, _arg_2:Object):void
        {
            if (_arg_2)
            {
                if (!gameDataIndex[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY[_arg_1]]])
                {
                    gameDataIndex[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY[_arg_1]]] = {};
                };
                gameDataIndex[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY[_arg_1]]][_arg_2.id] = _arg_2;
            };
        }

        public function createDataIndex():void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Object;
            var _local_5:Number;
            var _local_1:int;
            trace(">> Index start...");
            for (_local_2 in gameData)
            {
                _local_3 = Number(_local_2);
                gameDataIndex[_local_2] = {};
                gameDataIndex2[_local_2] = {};
                gameDataIndex3[_local_2] = {};
                for (_local_4 in gameData[_local_3])
                {
                    _local_5 = Number(_local_4);
                    if (GamePredef.TBL_INDEX_ARRAY[_local_3] != null)
                    {
                        createIndex(_local_3, gameData[_local_3][_local_5]);
                    };
                    if (GamePredef.TBL_INDEX_ARRAY2[_local_3] != null)
                    {
                        createIndex2(_local_3, gameData[_local_3][_local_5]);
                    };
                    if (GamePredef.TBL_INDEX_ARRAY3[_local_3] != null)
                    {
                        createIndex3(_local_3, gameData[_local_3][_local_5]);
                    };
                };
            };
            trace(">> Index finished.");
        }

        public function createIndex3(_arg_1:int, _arg_2:Object):void
        {
            if (_arg_2)
            {
                if (!gameDataIndex3[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY3[_arg_1]]])
                {
                    gameDataIndex3[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY3[_arg_1]]] = {};
                };
                if (_arg_1 == GamePredef.TBL_CHARACTOR)
                {
                    if (_arg_2[GamePredef.TBL_INDEX_ARRAY3[_arg_1]] == -1)
                    {
                        return;
                    };
                };
                gameDataIndex3[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY3[_arg_1]]][_arg_2.id] = _arg_2;
            };
        }

        public function addSlot(_arg_1:Object):void
        {
            if (_sList == null)
            {
                _sList = {};
            };
            _sList[_arg_1.id] = _arg_1;
            extAddBagSlotIndex(_arg_1);
        }

        public function handleSlotIndexLater():void
        {
            var _local_1:int;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:*;
            var _local_5:GameDataEvent;
            if (((_bagSlotIndex) && (_bagSlotIndex["unH"])))
            {
                _local_1 = _bagSlotIndex["unH"].length;
                if (_local_1 > 0)
                {
                    for (_local_4 in _bagSlotIndex["unH"])
                    {
                        if (_bagSlotIndex["unH"][_local_4] == -1)
                        {
                            _local_1--;
                        }
                        else
                        {
                            _local_2 = _sList[_bagSlotIndex["unH"][_local_4]];
                            if (!_local_2)
                            {
                                _bagSlotIndex["unH"][_local_4] = -1;
                                _local_1--;
                            }
                            else
                            {
                                _local_3 = _core.getTemplateData(_local_2.type, _local_2.itemId, false);
                                if (_local_3)
                                {
                                    addBagSlotIndex(Number(_local_2.id), _local_3);
                                    _local_1--;
                                    _bagSlotIndex["unH"][_local_4] = -1;
                                };
                            };
                        };
                    };
                };
                if (_local_1 > 0)
                {
                    setTimeout(handleSlotIndexLater, 2000);
                }
                else
                {
                    _bagSlotIndex["unH"] = null;
                    _core.productFlag = true;
                    _core.view.getUI(ViewManager.MAIN_USER_BAR).setNum();
                    _core.view.getUI(ViewManager.PANEL_BATTLESET).setNum();
                    _local_5 = new GameDataEvent(GamePredef.EVENT_REFRESH_FUNCSLOTS);
                    _local_5.data = {};
                    dispatchEvent(_local_5);
                };
            }
            else
            {
                _core.productFlag = true;
            };
        }

        public function getGameData(_arg_1:int, _arg_2:Number):Object
        {
            var _local_3:Core;
            if (((_arg_1 <= 0) || (_arg_2 <= 0)))
            {
                return (null);
            };
            if (_arg_1 == GamePredef.TBL_QUEST)
            {
                return (getQuestFullData(_arg_2));
            };
            if (gameData == null)
            {
                gameData = [];
            };
            if (gameData[_arg_1] == null)
            {
                gameData[_arg_1] = [];
            };
            if (gameData[_arg_1][_arg_2] == null)
            {
                _local_3 = Core.getInstance();
                if (Number(_arg_2) > 0)
                {
                    _local_3.remote.call("gdc", new Responder(onNewData), _arg_1, _arg_2);
                };
                return (null);
            };
            return (gameData[_arg_1][_arg_2]);
        }

        private function onNewDataPackage(_arg_1:Object):void
        {
            addNewData(_arg_1.type, _arg_1.inst);
            if (_arg_1.type == GamePredef.TBL_PET)
            {
                addNewData(GamePredef.TBL_CREATURE, _arg_1.temp);
            }
            else
            {
                addNewData((_arg_1.type + 1), _arg_1.temp);
            };
            var _local_2:GameDataEvent = new GameDataEvent(((((GameDataEvent.DATA_PACKAGE_RECIEVED + "_") + _arg_1.type) + "_") + _arg_1.index));
            _local_2.data = _arg_1;
            dispatchEvent(_local_2);
        }

        public function delGuildSlot(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1.id != undefined)
            {
                delete _gsList[_arg_1.id];
            }
            else
            {
                if (_arg_1.sid != undefined)
                {
                    for (_local_2 in gsList)
                    {
                        if (gsList[_local_2].sid == _arg_1.sid)
                        {
                            delete gsList[_local_2];
                        };
                    };
                };
            };
        }

        public function addNewDataList(_arg_1:int, _arg_2:*):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            if (gameData == null)
            {
                gameData = [];
            };
            gameData[_arg_1] = _arg_2;
            var _local_3:GameDataEvent = new GameDataEvent(((GameDataEvent.DATA_RECIEVED + "_") + _arg_1));
            _local_3.data = {
                "type":_arg_1,
                "data":_arg_2
            };
            dispatchEvent(_local_3);
        }

        public function updateGuildSlot(_arg_1:Object):void
        {
            _gsList[_arg_1.id] = _arg_1;
        }

        public function get gsInited():Boolean
        {
            return (_gsInited);
        }

        public function createIndex2(_arg_1:int, _arg_2:Object):void
        {
            if (_arg_2)
            {
                if (!gameDataIndex2[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY2[_arg_1]]])
                {
                    gameDataIndex2[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY2[_arg_1]]] = {};
                };
                gameDataIndex2[_arg_1][_arg_2[GamePredef.TBL_INDEX_ARRAY2[_arg_1]]][_arg_2.id] = _arg_2;
            };
        }

        public function get bagSlotIndex():Object
        {
            return (_bagSlotIndex);
        }

        public function createAllIndex(_arg_1:int, _arg_2:Object):void
        {
            createIndex(_arg_1, _arg_2);
            createIndex2(_arg_1, _arg_2);
            createIndex3(_arg_1, _arg_2);
        }

        public function reset():void
        {
            _sInited = false;
            _gsInited = false;
            _bagIndexInited = false;
            _sList = null;
            _gsList = null;
            _bagSlotIndex = null;
        }

        private function onNewDataList(_arg_1:Object):void
        {
            if (_arg_1)
            {
                addNewDataList(_arg_1.type, _arg_1.data);
            };
        }

        public function getQuestFullData(_arg_1:int):Object
        {
            var _local_6:Object;
            var _local_7:*;
            var _local_8:Object;
            var _local_9:*;
            var _local_10:Object;
            var _local_11:*;
            var _local_12:Object;
            var _local_13:Object;
            var _local_14:*;
            var _local_15:Object;
            var _local_2:Object = {};
            _local_2.id = _arg_1;
            _local_2.data = gameData[GamePredef.TBL_QUEST][_arg_1];
            if (!_local_2.data)
            {
                return (null);
            };
            var _local_3:Object = gameData[GamePredef.TBL_NPC][_local_2.data.finishNpc];
            var _local_4:Object = gameData[GamePredef.TBL_NPC][_local_2.data.startNpc];
            if (_local_3)
            {
                _local_2.fName = _local_3.name;
                _local_2.fMid = _local_3.posMapId;
            };
            if (_local_4)
            {
                _local_2.sMid = _local_4.posMapId;
                _local_2.sName = _local_4.name;
            };
            _local_2.pre = getQuestPre(_arg_1);
            var _local_5:Object = gameDataIndex[GamePredef.TBL_QUEST_REQUIRE][_arg_1];
            if (_local_5)
            {
                for (_local_7 in _local_5)
                {
                    if (_local_5[_local_7])
                    {
                        if (!_local_6)
                        {
                            _local_6 = {};
                        };
                        _local_6[_local_7] = _local_5[_local_7];
                        if (_local_5[_local_7].kind == GamePredef.QUEST_REQUIRE_CREATUR)
                        {
                            _local_8 = {};
                            for (_local_9 in _local_5[_local_7])
                            {
                                _local_8[_local_9] = _local_5[_local_7][_local_9];
                            };
                            _local_8["creature"] = gameData[GamePredef.TBL_CREATURE][_local_5[_local_7].itemId];
                            _local_6[_local_7] = _local_8;
                        }
                        else
                        {
                            if (_local_5[_local_7].kind == GamePredef.QUEST_REQUIRE_ITEM)
                            {
                                _local_10 = {};
                                for (_local_11 in _local_5[_local_7])
                                {
                                    _local_10[_local_11] = _local_5[_local_7][_local_11];
                                };
                                _local_12 = gameData[_local_5[_local_7].type][_local_5[_local_7].itemId];
                                if (_local_12)
                                {
                                    _local_10["name"] = _local_12.name;
                                }
                                else
                                {
                                    _local_10["name"] = "";
                                };
                                _local_6[_local_7] = _local_10;
                            }
                            else
                            {
                                if (_local_5[_local_7].kind == GamePredef.QUEST_REQUIRE_PET)
                                {
                                    _local_13 = {};
                                    for (_local_14 in _local_5[_local_7])
                                    {
                                        _local_13[_local_14] = _local_5[_local_7][_local_14];
                                    };
                                    _local_15 = gameData[GamePredef.TBL_CREATURE][_local_5[_local_7].itemId];
                                    if (_local_15)
                                    {
                                        _local_13["name"] = _local_15.name;
                                    }
                                    else
                                    {
                                        _local_13["name"] = "";
                                    };
                                    _local_6[_local_7] = _local_13;
                                };
                            };
                        };
                    };
                };
            };
            _local_2.require = _local_6;
            _local_2.award = gameDataIndex[GamePredef.TBL_QUEST_AWARD][_arg_1];
            _local_2.state = -1;
            return (_local_2);
        }

        public function delData(_arg_1:int, _arg_2:Number):void
        {
            var _local_3:* = gameData[_arg_1][_arg_2];
            gameData[_arg_1][_arg_2] = null;
            delete gameData[_arg_1][_arg_2];
        }

        public function getQuestPre(_arg_1:Number):Object
        {
            return (gameDataIndex[GamePredef.TBL_QUEST_PRE][_arg_1]);
        }

        public function set tmpDict(_arg_1:Object):void
        {
            _tmpDict = _arg_1;
        }

        public function _initBagSlotIndex():void
        {
            var _local_3:Object;
            var _local_4:Object;
            _bagIndexInited = true;
            var _local_1:int = -1;
            var _local_2:int = -1;
            for each (_local_4 in _sList)
            {
                if (isBagSlot(Number(_local_4.sid)))
                {
                    _local_1 = _local_4.type;
                    _local_2 = _local_4.itemId;
                    _local_3 = _core.getTemplateData(_local_1, _local_2, false);
                    if (_local_3)
                    {
                        addBagSlotIndex(Number(_local_4.id), _local_3);
                    }
                    else
                    {
                        addSlotToUnhandled(Number(_local_4.id));
                    };
                };
            };
            setTimeout(handleSlotIndexLater, 3000);
        }

        public function getGuildSlot(_arg_1:Object):Object
        {
            var _local_2:Object;
            if (_arg_1.id != undefined)
            {
                if (_gsList == null)
                {
                    return (null);
                };
                return (_gsList[_arg_1.id]);
            };
            if (_arg_1.sid != undefined)
            {
                for each (_local_2 in gsList)
                {
                    if (_local_2.sid == _arg_1.sid)
                    {
                        return (_local_2);
                    };
                };
                return (null);
            };
            return (null);
        }

        public function updateSlot(_arg_1:Object):void
        {
            _sList[_arg_1.id] = _arg_1;
            extAddBagSlotIndex(_arg_1);
        }

        public function hasData(_arg_1:int, _arg_2:Number):Boolean
        {
            return ((!(gameData[_arg_1] == null)) && (!(gameData[_arg_1][_arg_2] == null)));
        }

        public function get tmpDict():Object
        {
            return (_tmpDict);
        }

        public function addGuildSlot(_arg_1:Object):void
        {
            if (_gsList == null)
            {
                _gsList = {};
            };
            _gsList[_arg_1.id] = _arg_1;
        }

        public function clearDataType(_arg_1:int):void
        {
            gameData[_arg_1] = null;
        }

        public function getSlot(_arg_1:Object):Object
        {
            var _local_2:Object;
            if (_arg_1.id != undefined)
            {
                return (_sList[_arg_1.id]);
            };
            if (_arg_1.sid != undefined)
            {
                for each (_local_2 in sList)
                {
                    if (_local_2.sid == _arg_1.sid)
                    {
                        return (_local_2);
                    };
                };
                return (null);
            };
            return (null);
        }

        public function delBagSlotIndex(_arg_1:Number):void
        {
            var _local_5:GameDataEvent;
            var _local_6:Number;
            var _local_7:int;
            var _local_8:String;
            var _local_2:Number = _sList[_arg_1].type;
            var _local_3:Number = _sList[_arg_1].itemId;
            var _local_4:Object = _core.getTemplateData(_local_2, _local_3, false);
            if (_local_4)
            {
                _local_6 = _local_4.id;
                if ((((_bagSlotIndex) && (_bagSlotIndex[_local_2])) && (_bagSlotIndex[_local_2][_local_6])))
                {
                    _local_7 = _bagSlotIndex[_local_2][_local_6].indexOf(_arg_1);
                    if (_local_7 >= 0)
                    {
                        _bagSlotIndex[_local_2][_local_6].splice(_local_7, 1);
                        if (_bagSlotIndex[_local_2][_local_6].length <= 0)
                        {
                            delete _bagSlotIndex[_local_2][_local_6];
                        };
                    };
                };
            }
            else
            {
                for (_local_8 in _bagSlotIndex[_local_2])
                {
                    _local_7 = _bagSlotIndex[_local_2][_local_8].indexOf(_arg_1);
                    if (_local_7 >= 0)
                    {
                        _bagSlotIndex[_local_2][_local_8].splice(_local_7, 1);
                        if (_bagSlotIndex[_local_2][_local_8].length <= 0)
                        {
                            delete _bagSlotIndex[_local_2][_local_8];
                        };
                        break;
                    };
                };
            };
            _local_5 = new GameDataEvent(GamePredef.EVENT_REFRESH_FUNCSLOTS);
            _local_5.data = {};
            dispatchEvent(_local_5);
        }

        public function initSlotData(_arg_1:Object):void
        {
            _sList = _arg_1;
            _sInited = true;
            if (!_bagIndexInited)
            {
                initBagSlotIndex();
            };
        }

        private function delDataIndex(_arg_1:int, _arg_2:*, _arg_3:Array, _arg_4:Array):void
        {
            if (_arg_3[_arg_1] == null)
            {
                return;
            };
            var _local_5:Number = _arg_4[_arg_1][_arg_2[_arg_3[_arg_1]]].indexOf(_arg_2);
            _arg_4[_arg_1][_arg_2[_arg_3[_arg_1]]][_local_5] = null;
            delete _arg_4[_arg_1][_arg_2[_arg_3[_arg_1]]][_local_5];
        }

        public function getGameDataList(_arg_1:int):Array
        {
            var _local_2:Core;
            if ((((gameData == null) || (gameData[_arg_1] == null)) || (gameData[_arg_1].length == 0)))
            {
                _local_2 = Core.getInstance();
                _local_2.remote.call("gdc", new Responder(onNewDataList), _arg_1, -1);
                return (null);
            };
            return (gameData[_arg_1]);
        }


    }
}//package com.qeedoo.game.data

class Single 
{


}


