// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.GameScene

package com.qeedoo.game.logic
{
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.ByteArray;
    import com.qeedoo.game.config.Language;

    public class GameScene 
    {

        private var _view:Object;
        public var hitTest:Object;
        private var _world:Object;
        private var _core:Core = Core.getInstance();

        public function GameScene():void
        {
        }

        public function sceneCreateNpcs(_arg_1:Object):void
        {
            var _local_2:Object;
            for each (_local_2 in _arg_1)
            {
                _core.createNpc(_local_2);
                _core.remote.setNpcState(_local_2.id);
            };
        }

        public function get view():Object
        {
            return (_view);
        }

        public function sceneLeave():void
        {
            if (_view)
            {
                _view.leaveScene();
            };
            _core.view.hideAll(ViewManager.TYPE_PANEL);
            if (_core.player)
            {
                _world.setN(_core.player.posMapId);
            };
            if (_core.state == GamePredef.ST_CORE_BATTLE)
            {
                _core.battle.battleOnEnd();
            };
        }

        public function setNpcList(npcList:Object):void
        {
            var i:String;
            var npcData:Object;
            var waiguaiIndex:int;
            var num:uint;
            try
            {
                for (i in npcList)
                {
                    if (npcList[i])
                    {
                        npcData = _core.data.gameData[GamePredef.TBL_NPC][npcList[i].nid];
                        if (npcData)
                        {
                            npcData.id = i;
                            npcData.nid = npcList[i].nid;
                            npcData.posX = Number(npcList[i].x);
                            npcData.posY = Number(npcList[i].y);
                            npcData.name = npcList[i].name;
                            if (npcList[i].hasOwnProperty("bState"))
                            {
                                npcData.bState = npcList[i].bState;
                            };
                            if (npcList[i].hasOwnProperty("busy"))
                            {
                                npcData.busy = npcList[i].busy;
                            };
                            npcData.resCode = npcList[i].resCode;
                            waiguaiIndex = GamePredef.ANTI_WAIGUA_BOSSID.indexOf(int(npcData.nid));
                            if (waiguaiIndex >= 0)
                            {
                                npcData.colorCode = int((0 + ((360 - 0) * Math.random())));
                            };
                            _core.createNpc(npcData);
                            _core.remote.setNpcState(npcData.id);
                            num++;
                        };
                    };
                };
            }
            catch(e)
            {
            };
            if (num <= 0)
            {
                _core.view.getUI(ViewManager.PANEL_MAP).clearNpc();
            };
            if (_core.firstGC)
            {
                _core.firstGC = false;
            }
            else
            {
                _core.gc();
            };
        }

        public function secneSetSpeed(_arg_1:int, _arg_2:int):void
        {
            var _local_3:*;
            var _local_4:Object;
            for (_local_3 in _core.view.cDict)
            {
                _local_4 = _core.view.getC(_local_3);
                if (_local_4)
                {
                    _local_4.speed = int(((9 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / _arg_2));
                };
            };
        }

        public function init(_arg_1:Object):void
        {
            _view = _arg_1;
        }

        public function sceneCreateGuildBuildings(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1 == null)
            {
                return;
            };
            _core = Core.getInstance();
            for each (_local_2 in _arg_1)
            {
                if (_local_2 != null)
                {
                    _core.createBuild(_local_2);
                };
            };
        }

        public function sceneCreateChars(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:*;
            _core = Core.getInstance();
            for each (_local_2 in _arg_1)
            {
                if (((!(_local_2 == null)) && (!(Number(_local_2.id) == _core.cid))))
                {
                    if (((_local_2.vipT < 0) && (_local_2.SpeT > 0)))
                    {
                        _local_2.vipT = _local_2.SpeT;
                    };
                    if ((((_local_2.vipT > 0) && (_local_2.SpeT > 0)) && (_core.checkTitleShow(_local_2.SpeT))))
                    {
                        _local_2.t = _local_2.SpeT;
                    };
                    _core.createCharactor(_local_2);
                    if (_local_2.id)
                    {
                        _local_3 = _core.getCharactor(_local_2.id);
                        if (_local_3)
                        {
                            if (_local_2.posMapId)
                            {
                                _local_3.posMapId = _local_2.posMapId;
                            };
                            if (_local_2.posX)
                            {
                                _local_3.posX = _local_2.posX;
                            };
                            if (_local_2.posY)
                            {
                                _local_3.posY = _local_2.posY;
                            };
                        };
                    };
                };
            };
        }

        public function setWorld(_arg_1:Object):void
        {
            _world = _arg_1;
        }

        public function sceneCreateItems(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_2:uint;
            for each (_local_3 in _arg_1)
            {
                _core.createSceneItem(_local_3);
                _local_2++;
            };
            if (!_core.view.getUI(ViewManager.PANEL_MAP).initialized)
            {
                _core.view.getUI(ViewManager.PANEL_MAP).initView();
            };
            if (_local_2 == 0)
            {
                _core.view.getUI(ViewManager.PANEL_MAP).clearIp();
            };
        }

        public function sceneEnter(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=-1):void
        {
            var _local_5:Object = _core.data.getGameData(GamePredef.TBL_MAP, _arg_1);
            _core = Core.getInstance();
            _core.ready = false;
            if (_arg_4 != -1)
            {
                _core.player.posMapId = _arg_4;
            }
            else
            {
                _core.player.posMapId = _arg_1;
            };
            _core.player.posX = _arg_2;
            _core.player.posY = _arg_3;
            _core.player.posCenterX = _arg_2;
            _core.player.posCenterY = _arg_3;
            if (_local_5.flyable != 1)
            {
                _core.player.flyingState = GamePredef.FLYING_STATE_ON_GROUND;
            };
            _core.addCharactorView(_core.player);
            sceneLogin(_arg_1, _arg_4);
        }

        public function sceneLogin(_arg_1:int, _arg_2:int=-1):void
        {
            var _local_6:Object;
            var _local_7:Object;
            var _local_9:ByteArray;
            var _local_10:Object;
            var _local_11:Object;
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_MAP][_arg_1];
            if (((!(_arg_2 == -1)) && (!(_arg_1 == _arg_2))))
            {
                _local_9 = new ByteArray();
                _local_9.writeObject(_local_3);
                _local_9.position = 0;
                _local_10 = _local_9.readObject();
                _local_10.copyFlag = 1;
                _local_10.id = _arg_2;
                _local_10.templateId = _arg_1;
                _core.data.gameData[GamePredef.TBL_MAP][_arg_2] = _local_10;
                _local_3 = _local_10;
            };
            _core.player.mapData = _local_3;
            _view.enterScene(_local_3);
            var _local_4:Object = _core.data.gameDataIndex[GamePredef.TBL_SCENEITEM_INSTANCE][_arg_1];
            var _local_5:Array = [];
            for (_local_6 in _local_4)
            {
                _local_11 = _core.data.getGameData(GamePredef.TBL_SCENEITEM_TEMPLATE, _local_4[_local_6].tid);
                _local_5.push({
                    "iData":_local_4[_local_6],
                    "tData":_local_11
                });
            };
            sceneCreateItems(_local_5);
            _core.remote.createNpcs();
            _core.remote.createBoss();
            _core.remote.createChars();
            _core.remote.createGuildBuildings();
            _core.sysMidNote(_local_3.name);
            _core.playNormal();
            _local_7 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (_local_3.pk > 0)
            {
                _core.sysMidNote(Language.GAMESCENE_S[0]);
                _core.sysMsg(Language.GAMESCENE_S[0]);
            };
            if (((!(GamePredef.TRIALS_PASS_MAP[_local_3.id])) && (_local_7)))
            {
                _local_7.setTrialsInfoVisible(0, -1, false);
            };
            var _local_8:* = _core.view.getUI(ViewManager.MAIN_DOG_FIGHT);
            if (_local_8)
            {
                _local_8.checkAndSetVisible();
            };
        }


    }
}//package com.qeedoo.game.logic

