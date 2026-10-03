// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.NPCView

package com.qeedoo.ui.view.compGameStage
{
    import flash.geom.Point;
    import com.qeedoo.ui.view.comp.HulaNpcBombBitmap;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.predef.GamePredef;
    import flash.utils.clearTimeout;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.LinkEncode;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.view.compDragable.HulaPanel;
    import com.qeedoo.game.data.GameData;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.view.compDragable.TripleTownPanel;
    import com.qeedoo.ui.utils.WalkNpcController;
    import com.qeedoo.ui.view.compDragable.DotaPanel;
    import flash.net.Responder;
    import flash.utils.setTimeout;

    public class NPCView extends CreatureView 
    {

        private static const SHOW_TIP_DELAY:Number = 200;

        private var _lastClickTime:Number = 0;
        private var hpbar:NpcViewHPBar;
        private var _walkPos:Point;
        private var stop_count:uint = 20;
        private var _toolTip:Object;
        private var _showTipHandler:Number = 0;
        public var moveEndCall:Function;
        private var bm:HulaNpcBombBitmap;
        public var online:Boolean = true;
        private var currentFrame:int = 0;

        private var _core:Core = Core.getInstance();
        private var queueMovePoints:Array = [];
        private var _destinationPos:Object = {
            "2119":[350, 280],
            "2120":[2740, 270],
            "2121":[400, 2250],
            "2122":[2780, 2270]
        };

        public function NPCView()
        {
            _textName.textColor = 13434828;
            this._speed = 2;
        }

        public function dotaFaceTo(_arg_1:int):void
        {
            faceTo(_arg_1);
            if (_gameObject)
            {
                _gameObject.posDir = _arg_1;
            };
        }

        public function reload(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_NPC][_arg_1.nid];
                if (((_local_2) && (!(this.gameObject.resCode == _arg_1.resCode))))
                {
                    _local_2.resCode = _arg_1.resCode;
                    _local_2.name = _arg_1.name;
                    this.gameObject.resCode = _arg_1.resCode;
                    this.gameObject = this.gameObject;
                };
            };
        }

        override protected function mouseOutHandler(_arg_1:MouseEvent):void
        {
            super.mouseOutHandler(_arg_1);
            clearTimeout(_showTipHandler);
            var _local_2:Object = _core.view.getUI(ViewManager.TOOLTIP_NPC);
            if (_local_2)
            {
                _core.view.getUI(ViewManager.TOOLTIP_NPC).hide();
            };
        }

        public function setSpeed(_arg_1:Number):void
        {
            this._speed = _arg_1;
        }

        override public function walkTo(_arg_1:int, _arg_2:int):void
        {
            _walkPos = new Point(_arg_1, _arg_2);
            super.walkTo(_arg_1, _arg_2);
        }

        public function clickNpc():void
        {
            var str:String;
            var npcDir:int;
            if (((_gameObject) && (_gameObject.npcType == GamePredef.NPC_TYPE_WALK)))
            {
                return;
            };
            str = "";
            if (_core.state != GamePredef.ST_NORMAL)
            {
                return;
            };
            if (_core.player.isDead)
            {
                return;
            };
            if ((((_core.player.inGroup) && (!(_core.player.isLeader))) && (!(_core.player.groupAfk))))
            {
                _core.sysMidNote(Language.NPCVIEW_S[0]);
                str = Language.NPCVIEW_S[1];
                str = str.replace("{NPCName}", LinkEncode.encode(GamePredef.TBL_NPC, _gameObject.id, _gameObject.name));
                _core.player.say(str, GamePredef.MSG_CHANNEL_LOCAL);
                return;
            };
            _core.targetNPC = _gameObject;
            var xBy:int = (_core.player.posX - posX);
            var yBy:int = (_core.player.posY - posY);
            if (ToolKit.getDistance(xBy, yBy) > 250)
            {
                _core.player.closeTo(posX, posY);
                return;
            };
            if (_gameObject.busy)
            {
                onSay(Language.NPCVIEW_S[3]);
                return;
            };
            str = Language.NPCVIEW_S[4];
            var str2:String = Language.NPCVIEW_S[5];
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    doClick();
                };
            };
            if (online)
            {
                npcDir = ToolKit.getDir(xBy, yBy);
                if (_gameObject.npcType == GamePredef.NPC_TYPE_DOTA)
                {
                    if (((_gameObject.dotaData) && (_gameObject.dotaData.group == 1)))
                    {
                        faceTo(2);
                    }
                    else
                    {
                        faceTo(6);
                    };
                }
                else
                {
                    if (_gameObject.npcType != GamePredef.NPC_TYPE_TRIPLE_TOWN)
                    {
                        faceTo(npcDir);
                    };
                };
                _core.player.view.faceTo(((npcDir + 4) % 8));
                if (_gameObject.npcType == GamePredef.NPC_TYPE_BOSS)
                {
                    if (_gameObject.lv > 0)
                    {
                        if ((_gameObject.lv - 5) > _core.player.level)
                        {
                            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
                            return;
                        };
                        if ((_core.player.level - 10) > _gameObject.lv)
                        {
                            if ((((_gameObject.subType == "all") && (_gameObject.npcType == GamePredef.NPC_TYPE_BATTLE)) || (_gameObject.npcType == GamePredef.NPC_TYPE_BOSS)))
                            {
                                Alert.show(str2, "", (Alert.YES | Alert.NO), null, func);
                                return;
                            };
                        };
                    };
                };
                doClick();
            };
        }

        public function dotaDead():void
        {
            hulaDead(2);
        }

        private function doClick():void
        {
            var _local_1:Object;
            var _local_2:Array;
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:Object;
            if (_gameObject.npcType == GamePredef.NPC_TYPE_BOSS)
            {
                _core.remote.clickBoss(Number(_gameObject.id));
            }
            else
            {
                if (_gameObject.npcType == GamePredef.NPC_TYPE_HULA)
                {
                    if (((!(_gameObject.hulaData.isPre)) && (!(HulaPanel.isTurning))))
                    {
                        _local_1 = _core.view.getUI(ViewManager.PANEL_NPCSCRIPT);
                        _local_2 = [];
                        _local_3 = "";
                        if (_gameObject.nid == 2096)
                        {
                            _local_3 = Language.HULA_PANEL[34];
                            _local_2.push({
                                "func":HulaPanel.HULA_NPC_SCRIPT_AWARD,
                                "label":Language.HULA_PANEL[11]
                            });
                        }
                        else
                        {
                            if (_gameObject.nid == 2097)
                            {
                                _local_3 = Language.HULA_PANEL[33];
                                _local_2.push({
                                    "func":HulaPanel.HULA_NPC_SCRIPT_BATTLE,
                                    "label":Language.HULA_PANEL[18]
                                });
                            }
                            else
                            {
                                _local_3 = Language.HULA_PANEL[32];
                                _local_2.push({
                                    "func":HulaPanel.HULA_NPC_SCRIPT_BATTLE,
                                    "label":Language.HULA_PANEL[4]
                                });
                            };
                        };
                        _local_2.push({
                            "func":HulaPanel.HULA_NPC_SCRIPT_CHANGE,
                            "label":Language.HULA_PANEL[5]
                        });
                        _local_2.push({
                            "func":HulaPanel.HULA_NPC_SCRIPT_CANCEL,
                            "label":Language.HULA_PANEL[6]
                        });
                        _local_1.setInfo(_gameObject.id, _gameObject.name, _local_3, _local_2, _gameObject.hulaData);
                    };
                }
                else
                {
                    if (_gameObject.npcType == GamePredef.NPC_TYPE_DOTA)
                    {
                        if (_gameObject.dotaData)
                        {
                            return;
                        };
                    }
                    else
                    {
                        if (_gameObject.npcType == GamePredef.NPC_TYPE_TRIPLE_TOWN)
                        {
                            if (!_gameObject.tripleNpc)
                            {
                                return;
                            };
                            if (this.isWalking)
                            {
                                return;
                            };
                            _local_4 = _gameObject.tripleNpc;
                            if (_local_4.isStandBy)
                            {
                                return;
                            };
                            _local_5 = GameData.d[GamePredef.TBL_NPC][_local_4.npcId];
                            _local_6 = ((_local_5) ? _local_5.onServiceText : "");
                            _local_7 = Language.TRIPLE_TOWN_PANEL[13];
                            _local_8 = _core.view.getUI(ViewManager.PANEL_NPCSCRIPT);
                            _local_8.setInfo(_gameObject.id, _gameObject.name, _local_6, _local_7);
                        }
                        else
                        {
                            _core.remote.clickNpc(Number(_gameObject.id));
                        };
                    };
                };
            };
        }

        public function onEnter(_arg_1:Event):void
        {
            var _local_2:Point;
            var _local_3:uint;
            var _local_4:Date;
            var _local_5:Number;
            if (((this.visible) && (!(_core.player.inBattle))))
            {
                if (!this.isWalking)
                {
                    stop_count++;
                    if (stop_count > 20)
                    {
                        _local_2 = ToolKit.getRandomPoint(_gameObject.cPosX, _gameObject.cPosY, 50, 50);
                        if (((_gameObject.nid) && (GamePredef.TREASURE_NPC[_gameObject.nid])))
                        {
                            _local_2 = ToolKit.getRandomPoint(_gameObject.cPosX, _gameObject.cPosY, 300, 300);
                        };
                        if (((_gameObject.nid) && (_destinationPos[_gameObject.nid])))
                        {
                            _local_2 = new Point(_destinationPos[_gameObject.nid][0], _destinationPos[_gameObject.nid][1]);
                        };
                        this.walkTo(_local_2.x, _local_2.y);
                        stop_count = 0;
                    };
                };
                if (!_core.player.isDead)
                {
                    _local_3 = ToolKit.getDisByXY(_core.player.posX, _core.player.posY, this.posX, this.posY);
                    if (_local_3 < 50)
                    {
                        if ((((_core.player.lastHitNpc) && (_core.player.lastHitNpc.nid)) && (_core.player.lastHitNpc.last)))
                        {
                            _local_4 = new Date();
                            _local_5 = ((_local_4.getTime() + ((_local_4.getTimezoneOffset() * 60) * 1000)) - _core.serverTimeOffSet);
                            if (((_gameObject.nid) && (GamePredef.TREASURE_NPC[_gameObject.nid])))
                            {
                                if (ToolKit.minus(_local_5, _core.player.lastHitNpc.last) < (5 * 1000))
                                {
                                    return;
                                };
                            }
                            else
                            {
                                if (_gameObject.id == _core.player.lastHitNpc.nid)
                                {
                                    if (ToolKit.minus(_local_5, _core.player.lastHitNpc.last) < (3 * 1000))
                                    {
                                        return;
                                    };
                                };
                            };
                        };
                        if (isWalking)
                        {
                            this.stopWalk();
                        };
                        this.walkTo(_core.player.posX, _core.player.posY);
                        _core.remote.hitNpc(_gameObject.id);
                    };
                };
            };
        }

        public function hulaDead(_arg_1:int=1):void
        {
            if (!this.visible)
            {
                return;
            };
            this.visible = false;
            if (!this.container)
            {
                return;
            };
            bm = ((bm) || (new HulaNpcBombBitmap()));
            bm.x = (this.posX - 68);
            bm.y = (this.posY - 120);
            bm.yBase = bm.y;
            this.container.addChild(bm);
            currentFrame = 0;
            addEventListener(Event.ENTER_FRAME, this[("enterFrame" + _arg_1)]);
        }

        override protected function checkVisible(_arg_1:TimerEvent):void
        {
            if ((((!(_deleted)) && (inScreen)) && (online)))
            {
                if ((((_gameObject.layer == 3) && (_core.player)) && (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)))
                {
                    visible = false;
                    return;
                };
                visible = true;
                if ((((_gameObject.layer == 3) && (_core.player)) && (_core.player.flyingState == GamePredef.FLYING_STATE_IN_THE_AIR)))
                {
                    this.scaleX = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                    this.scaleY = (GamePredef.FLYING_PLAYER_ZOOM_RATE / GamePredef.FLYING_ZOOM_RATE);
                };
                if (_gameObject.npcType == GamePredef.NPC_TYPE_WALK)
                {
                };
                if (_sprite)
                {
                    _sprite.play();
                };
            }
            else
            {
                if (!(((_gameObject) && (_gameObject.npcType == GamePredef.NPC_TYPE_WALK)) && ((!(inScreen)) || (_deleted))))
                {
                    visible = false;
                    if (_sprite)
                    {
                        _sprite.stop();
                    };
                };
            };
        }

        public function refreshHpBar(_arg_1:Number, _arg_2:Number, _arg_3:int):void
        {
            if (!hpbar)
            {
                hpbar = new NpcViewHPBar();
                hpbar.x = -35;
                hpbar.y = -82;
                hpbar.yBase = 0;
                if (_body)
                {
                    _body.addChild(hpbar);
                };
            };
            hpbar.graphics.clear();
            var _local_4:uint = 0xFF0000;
            if (_arg_3 == 2)
            {
                _local_4 = 0xFFFF;
            };
            hpbar.graphics.beginFill(_local_4, 1);
            hpbar.graphics.drawRect(0, 0, (65 * (_arg_1 / _arg_2)), 5);
            hpbar.graphics.endFill();
        }

        override protected function moveEnd():void
        {
            if (_walkPos)
            {
                this.setPos(_walkPos);
                this.updateObjectPos();
                _walkPos = null;
            };
            ((moveEndCall) && (moveEndCall(this)));
            if (((!(queueMovePoints)) || (queueMovePoints.length == 0)))
            {
                dispatchEvent(new Event("npc_stop"));
                return;
            };
            var _local_1:Object = queueMovePoints.shift();
            var _local_2:int = _local_1["index"];
            var _local_3:Array = _local_1["p"];
            if (((!(_local_3)) || (!(_local_3.length == 2))))
            {
                return;
            };
            walkTo((_local_3[0] * 10), (_local_3[1] * 10));
            if (_local_2 >= 84)
            {
                dispatchEvent(new Event("hula_game_over"));
            };
        }

        override protected function resLoadCompleteHandler(_arg_1:Event):void
        {
            super.resLoadCompleteHandler(_arg_1);
        }

        public function walkQueue(_arg_1:Array):void
        {
            queueMovePoints = _arg_1;
            moveEnd();
        }

        private function enterFrame1(_arg_1:Event):void
        {
            currentFrame++;
            if (((!(HulaPanel.bombArr)) || (currentFrame >= HulaPanel.bombArr.length)))
            {
                removeEventListener(Event.ENTER_FRAME, enterFrame1);
                if (((bm) && (bm.parent)))
                {
                    bm.parent.removeChild(bm);
                };
                bm = null;
                return;
            };
            if (bm)
            {
                bm.bitmapData = HulaPanel.bombArr[currentFrame];
            };
        }

        private function enterFrame3(_arg_1:Event):void
        {
            if (((!(bm)) || (!(TripleTownPanel.bombDict))))
            {
                return;
            };
            currentFrame++;
            if (currentFrame >= TripleTownPanel.bombDict.length)
            {
                removeEventListener(Event.ENTER_FRAME, enterFrame3);
                ((bm.parent) && (bm.parent.removeChild(bm)));
                bm.visible = false;
                bm = null;
                return;
            };
            bm.bitmapData = TripleTownPanel.bombDict[currentFrame];
        }

        override protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
            super.mouseDownHandler(_arg_1);
            clickNpc();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((_gameObject) && (_gameObject.npcType == GamePredef.NPC_TYPE_WALK)))
            {
                if (((_arg_1) && (!(visible))))
                {
                    WalkNpcController.addWalkNpc(_gameObject.id);
                    if (((!(_gameObject.cPosX)) || (!(_gameObject.cPosY))))
                    {
                        _gameObject.cPosX = _gameObject.posX;
                        _gameObject.cPosY = _gameObject.posY;
                    };
                }
                else
                {
                    if (((!(_arg_1)) && (visible)))
                    {
                        WalkNpcController.delWalkNpc(_gameObject.id);
                    };
                };
            };
            super.visible = _arg_1;
        }

        public function stopWalkQueue(_arg_1:Array=null):void
        {
            if (queueMovePoints)
            {
                queueMovePoints.length = 0;
            };
            if (((_arg_1) && (_arg_1.length == 2)))
            {
                walkTo((_arg_1[0] * 10), (_arg_1[1] * 10));
            }
            else
            {
                stop();
            };
        }

        private function enterFrame2(_arg_1:Event):void
        {
            currentFrame++;
            if (((!(DotaPanel.bombArr)) || (currentFrame >= DotaPanel.bombArr.length)))
            {
                removeEventListener(Event.ENTER_FRAME, enterFrame2);
                if (((bm) && (bm.parent)))
                {
                    bm.parent.removeChild(bm);
                };
                bm = null;
                return;
            };
            if (bm)
            {
                bm.bitmapData = DotaPanel.bombArr[currentFrame];
            };
        }

        override protected function mouseOverHandler(event:MouseEvent):void
        {
            var tipView:Object;
            var typeObjMap:Object;
            var onGetData:Function;
            var showTip:Function;
            super.mouseOverHandler(event);
            tipView = _core.view.getUI(ViewManager.TOOLTIP_NPC);
            typeObjMap = {};
            typeObjMap[GamePredef.NPC_TYPE_PLANT] = {
                "propName":"plantData",
                "funcName":"queryPlant"
            };
            typeObjMap[GamePredef.NPC_TYPE_HERB] = {
                "propName":"herbData",
                "funcName":"queryHerb"
            };
            typeObjMap[GamePredef.NPC_TYPE_FISH_POOL] = {
                "propName":"fishPoolData",
                "funcName":"queryFishPool"
            };
            typeObjMap[GamePredef.NPC_TYPE_GATHER] = {
                "propName":"gatherData",
                "funcName":"queryGather"
            };
            if (typeObjMap[_gameObject.npcType])
            {
                onGetData = function (_arg_1:Object):void
                {
                    tipView[typeObjMap[_gameObject.npcType].propName] = _arg_1;
                    tipView.nid = _gameObject.id;
                    tipView.show();
                };
                showTip = function ():void
                {
                    if (_gameObject)
                    {
                        _core.remote.call(typeObjMap[_gameObject.npcType].funcName, new Responder(onGetData), _gameObject.id);
                    };
                };
                _showTipHandler = setTimeout(showTip, SHOW_TIP_DELAY);
            };
        }

        override protected function addListener():void
        {
            super.addListener();
            this.stateSprite.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        }

        public function reloadDota(resCode:String):void
        {
            var handler:uint;
            if ((((!(resCode)) || (!(this.gameObject))) || (this.gameObject.resCode == resCode)))
            {
                return;
            };
            var resCodeChange:Function = function (_arg_1:NPCView):void
            {
                clearTimeout(handler);
                if ((((_arg_1) && (_arg_1.gameObject)) && (!(_arg_1.gameObject.resCode == resCode))))
                {
                    _arg_1.gameObject.resCode = resCode;
                    _arg_1.gameObject = _arg_1.gameObject;
                };
            };
            handler = uint(setTimeout(resCodeChange, (0.1 + (Math.random() * 0.2)), this));
        }

        public function reloadHula(_arg_1:Object):void
        {
            if (_arg_1)
            {
                this.gameObject.resCode = _arg_1.resCode;
                this.gameObject.name = _arg_1.objName;
                this.gameObject.nid = _arg_1.nid;
                this.gameObject = this.gameObject;
            };
        }


    }
}//package com.qeedoo.ui.view.compGameStage

import flash.display.Sprite;

class NpcViewHPBar extends Sprite 
{

    public var yBase:Number = 0;


    public function destroy():void
    {
    }


}


