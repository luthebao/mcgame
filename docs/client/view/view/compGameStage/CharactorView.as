// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.CharactorView

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.view.ICharactorView;
    import com.qeedoo.ui.view.comp.RoundedText;
    import flash.display.DisplayObject;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.object.Charactor;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.AreaUtil;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.game.resource.AbstractGameRes;
    import flash.net.Responder;
    import com.qeedoo.ui.event.GameEvent;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class CharactorView extends CreatureView implements ICharactorView 
    {

        protected var _vipTitle:RoundedText;
        protected var _actTile:RoundedText;
        protected var _textTitle:RoundedText;
        public var _leaderFlag:DisplayObject;
        protected var _pvpColor:int;
        protected var _textGuild:RoundedText;
        protected var _route:Array;
        protected var _titlePrefix:String;
        public var _leagueFlag:DisplayObject;
        protected var _titleStyle:String;
        private var _colorNormal:uint;
        private var _nameNormal:String;
        protected var _rectX:int;
        protected var _rectY:int;

        protected var _core:Core = Core.getInstance();
        private var nameColor:uint = ((uint(0xFF8800) - uint(0xFF0000)) / 200);

        public function CharactorView()
        {
            _speed = MOVE_SPEED_NORMAL;
            _leaderFlag = new ((ResManager.UI_LEADER_FLAG as Class))();
            _textTitle = new RoundedText();
            _vipTitle = new RoundedText();
            _actTile = new RoundedText();
            _body.addChild(_vipTitle);
            _body.addChild(_textTitle);
            _body.addChild(_actTile);
            _textTitle.x = _textName.x;
            _textTitle.x = (-(_textTitle.textWidth) / 2);
            _textTitle.y = 10;
            _vipTitle.y = _textName.y;
            _actTile.y = (_textName.y + 15);
        }

        public function updateTitlePrefix():void
        {
            if (_gameObject.t == GamePredef.BROTHER_TITLE_ID)
            {
                setTitle(_gameObject.t);
            };
        }

        private function stateLoaded(_arg_1:int):void
        {
            state = _arg_1;
        }

        public function setNewName(_arg_1:String):void
        {
            _textName.text = _arg_1;
            _gameObject.name = _arg_1;
            fixTextsPos();
        }

        override protected function setName():void
        {
            if (int(_gameObject.honor) <= 0)
            {
                setNormalName();
            }
            else
            {
                setRedName(_gameObject.honor);
            };
            super.setName();
            setTitle(_gameObject.t);
            setVipTitle(_gameObject.vipT);
            setActTitle(_gameObject.actT);
        }

        public function updateTitle(_arg_1:Number):void
        {
            _gameObject.t = _arg_1;
            setTitle(_arg_1);
        }

        override public function get state():int
        {
            return (_state);
        }

        override public function destroy():void
        {
            if (_deleted)
            {
                return;
            };
            super.destroy();
            hideLeaderFlag();
            _leaderFlag = null;
        }

        public function set speed(_arg_1:int):void
        {
            _speed = _arg_1;
            _gameObjMove.stepLength = _arg_1;
        }

        public function setNormalName():void
        {
            _textName.textColor = 0xFFFF00;
        }

        public function setTitle(_arg_1:Number):void
        {
            var _local_4:Object;
            _titlePrefix = "";
            if (_gameObject.t > 0)
            {
                _local_4 = _core.data.getGameData(GamePredef.TBL_TITLE, _arg_1);
                if (_local_4)
                {
                    _titlePrefix = _local_4.n;
                    _titleStyle = _local_4.a;
                };
            };
            if (_gameObject.t == GamePredef.BROTHER_TITLE_ID)
            {
                _titlePrefix = (_titlePrefix + ("-" + _gameObject.broT));
            };
            var _local_2:int;
            if (((_flyer_cg) || (doubleFly)))
            {
                _local_2 = 50;
            };
            _textTitle.visible = true;
            _textTitle.y = (10 + _local_2);
            _textName.y = (25 + _local_2);
            super.setFeMaleState();
            if (((_titlePrefix == "") || (_titleStyle == "")))
            {
                _textTitle.visible = false;
                _textName.y = (10 + _local_2);
                fixTextsPos();
                return;
            };
            var _local_3:Array = _titleStyle.split("|");
            if (!_local_3.length)
            {
                trace("ERROR: title template style error.");
                return;
            };
            _textTitle.textColor = uint(_local_3[0]);
            _textTitle.text = ((_local_3[1] + _titlePrefix) + _local_3[2]);
            fixTextsPos();
        }

        override protected function actionOnCreature(_arg_1:MouseEvent, _arg_2:int):void
        {
            var _local_3:Charactor;
            var _local_4:Boolean;
            var _local_5:*;
            super.actionOnCreature(_arg_1, _arg_2);
            switch (_arg_2)
            {
                case GamePredef.ACTION_INVITE:
                    _core.remote.groupInvite(_gameObject.id);
                    return;
                case GamePredef.ACTION_OBSERVE:
                    _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_gameObject.id);
                    return;
                case GamePredef.ACTION_PK:
                    _local_3 = _core.getCharactor(_gameObject.id);
                    _local_4 = AreaUtil.getRectArea(GameData.d[GamePredef.TBL_MAP][_local_3.posMapId].sArea, posX, posY);
                    if (_local_4)
                    {
                        _core.sysMidNote(Language.CHARACTORVIEW_S[0]);
                        return;
                    };
                    _local_5 = _core.view.getUI(ViewManager.MAIN_SYS);
                    trace(_local_5.btnPK, _local_5.btnPK.styleName);
                    if (_core.battleServer.inBattleServer)
                    {
                        _core.remote.assassinate(_gameObject.id);
                    }
                    else
                    {
                        _core.remote.PVPStartClient(_gameObject.id);
                    };
                    return;
                case GamePredef.ACTION_TRADE:
                    _core.view.getUI(ViewManager.PANEL_TRADE).newTrade(_gameObject.id, _gameObject.name);
                    return;
            };
        }

        public function updateVipTitle(_arg_1:Number):void
        {
            _gameObject.vipT = _arg_1;
            setVipTitle(_arg_1);
        }

        public function setNameProtected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (_textName.text.indexOf(Language.CHARACTORVIEW_S[1]) < 0)
                {
                    ((_nameNormal) || (_nameNormal = _textName.text));
                    ((_colorNormal) || (_colorNormal = _textName.textColor));
                    _textName.text = (_textName.text + Language.CHARACTORVIEW_S[1]);
                };
                _textName.textColor = 0xFF00;
            }
            else
            {
                ((_nameNormal) && (_textName.text = _nameNormal));
                ((_colorNormal) && (_textName.textColor = _colorNormal));
            };
        }

        public function resume():void
        {
            _gameObject.moveRoute = _route;
            _route = null;
            _gameObjMove.resume();
            if (_gameObjMove.active)
            {
                behavior(AbstractGameRes.BH_RUN_NORMAL);
            };
        }

        public function loadLeaderIcon():void
        {
            _core.remote.call("getCharLeaderClient", new Responder(leaderLoaded), _gameObject.id);
        }

        protected function checkLeader():void
        {
            if (_gameObject.isLeader)
            {
                showLeaderFlag();
            }
            else
            {
                hideLeaderFlag();
            };
        }

        public function setLeagueFlag(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                _leagueFlag = new ((ResManager.LEAGUE_ICON_RED as Class))();
                _leagueFlag.x = -5;
                _leagueFlag.y = -120;
                this._body.addChild(_leagueFlag);
            }
            else
            {
                if (_arg_1 == 2)
                {
                    _leagueFlag = new ((ResManager.LEAGUE_ICON_BLUE as Class))();
                    _leagueFlag.x = -5;
                    _leagueFlag.y = -120;
                    this._body.addChild(_leagueFlag);
                }
                else
                {
                    if (((_arg_1 == -1) || (_arg_1 == 0)))
                    {
                        if (((_leagueFlag) && (_leagueFlag.parent)))
                        {
                            this._body.removeChild(_leagueFlag);
                        };
                    };
                };
            };
        }

        private function fixTextsPos():void
        {
            if (((_core.checkTitleType(_gameObject.vipT, GamePredef.TITLE_KIND_VIP)) || (_core.checkTitleShow(_gameObject.vipT))))
            {
                if (_vipTitle.visible)
                {
                    _textName.x = ((-(_textName.textWidth) / 2) + (_vipTitle.width / 2));
                    _vipTitle.x = ((-(_textName.textWidth) / 2) - (_vipTitle.width / 2));
                    _vipTitle.y = _textName.y;
                }
                else
                {
                    _textName.x = (-(_textName.textWidth) / 2);
                };
            };
            if (_core.checkTitleType(_gameObject.actT, GamePredef.TITLE_KIND_ACTIVE))
            {
                _actTile.x = ((-(_textName.textWidth) / 2) - ((_actTile.width - _textName.width) / 2));
                _actTile.y = (_textName.y + 15);
            };
        }

        public function setVipTitle(_arg_1:Number):void
        {
            var _local_2:* = "";
            var _local_3:* = "";
            var _local_4:Object;
            if (((_arg_1 > 0) && (_core.checkTitleType(_arg_1, GamePredef.TITLE_KIND_VIP))))
            {
                _local_4 = _core.data.getGameData(GamePredef.TBL_TITLE, _arg_1);
                if (_local_4)
                {
                    _local_2 = _local_4.n;
                    _local_3 = _local_4.a;
                };
                _gameObject.vipT = _arg_1;
            };
            _vipTitle.visible = true;
            if (((_local_2 == "") || (_local_3 == "")))
            {
                _vipTitle.visible = false;
                _textName.x = (-(_textName.textWidth) / 2);
                return;
            };
            if (((_arg_1 > 0) && (_core.checkTitleShow(_gameObject.vipT))))
            {
                _vipTitle.visible = true;
                _textTitle.visible = true;
                return;
            };
            if (((_arg_1 < 0) && (_core.checkTitleShow(_gameObject.vipT))))
            {
                _vipTitle.visible = false;
                _textTitle.visible = true;
                return;
            };
            var _local_5:Array = _local_3.split("|");
            if (!_local_5.length)
            {
                trace("ERROR: title template style error.");
                return;
            };
            _vipTitle.textColor = uint(_local_5[0]);
            _vipTitle.text = ((_local_5[1] + _local_2) + _local_5[2]);
            fixTextsPos();
        }

        public function get speed():int
        {
            return (_speed);
        }

        public function updateActTitle(_arg_1:Number):void
        {
            _gameObject.actT = _arg_1;
            setActTitle(_arg_1);
        }

        override protected function checkVisible(_arg_1:TimerEvent):void
        {
            var _local_2:PetView;
            super.checkVisible(_arg_1);
            if (((GamePredef.GLOBAL_SETTING.hc) || (this.visible == false)))
            {
                _resLoader.visible = false;
                _weaponLoader.visible = false;
                if (_mount_cg)
                {
                    _mount_cg.visible = false;
                };
                spriteStoped = true;
                if (_cg)
                {
                    _cg.visible = false;
                    _cg.stop();
                };
                if (_sprite)
                {
                };
                if (_weapon)
                {
                    _weapon.visible = false;
                    _weapon.stop();
                };
                if (_flyer_cg)
                {
                    _flyer_cg.visible = false;
                    _flyer_cg.stop();
                };
                if (_flyer_front)
                {
                    _flyer_front.visible = false;
                    _flyer_front.stop();
                };
                if (_wing_cg)
                {
                    _wing_cg.visible = false;
                    _wing_cg.stop();
                };
                if (fairyManager)
                {
                    fairyManager.visible = false;
                };
                if (_tepe_cg)
                {
                    _tepe_cg.visible = false;
                };
                if (_halo_cg)
                {
                    _halo_cg.visible = false;
                };
                if (_round_cg)
                {
                    _round_cg.visible = false;
                };
                if (_round_mask_cg)
                {
                    _round_mask_cg.visible = false;
                };
                if (_gameObject.decoFootCode)
                {
                    removeEventListener(GameEvent.BEHAVIOR_CHANGE_TO_RUN, setFootprintView);
                    removeEventListener(GameEvent.BEHAVIOR_CHANGE_TO_STOP, removeFootprintView);
                };
                _local_2 = PetView(_core.view.getP(_gameObject.id));
                if (((_local_2) && (_local_2._body)))
                {
                    _local_2._body.visible = false;
                };
            }
            else
            {
                _resLoader.visible = true;
                _weaponLoader.visible = true;
                if (_mount_cg)
                {
                    _mount_cg.visible = true;
                };
                if (_cg)
                {
                    _cg.visible = true;
                    _cg.play();
                };
                if (_flyer_cg)
                {
                    _flyer_cg.visible = true;
                    _flyer_cg.play();
                };
                if (_flyer_front)
                {
                    _flyer_front.visible = true;
                    _flyer_front.play();
                };
                spriteStoped = false;
                if (_sprite)
                {
                };
                if (_weapon)
                {
                    _weapon.visible = true;
                    _weapon.play();
                };
                if (_wing_cg)
                {
                    if (_cg.behavior != AbstractGameRes.BH_DEAD)
                    {
                        _wing_cg.visible = true;
                        _wing_cg.play();
                    };
                };
                if (fairyManager)
                {
                    fairyManager.visible = true;
                };
                if (_tepe_cg)
                {
                    _tepe_cg.visible = true;
                };
                if (_halo_cg)
                {
                    _halo_cg.visible = true;
                };
                if (_round_cg)
                {
                    _round_cg.visible = true;
                };
                if (_round_mask_cg)
                {
                    _round_mask_cg.visible = true;
                };
                if (_gameObject.decoFootCode)
                {
                    addEventListener(GameEvent.BEHAVIOR_CHANGE_TO_RUN, setFootprintView);
                    addEventListener(GameEvent.BEHAVIOR_CHANGE_TO_STOP, removeFootprintView);
                };
                _local_2 = PetView(_core.view.getP(_gameObject.id));
                if (((_local_2) && (_local_2._body)))
                {
                    _local_2._body.visible = true;
                };
            };
            if (GamePredef.GLOBAL_SETTING.hn)
            {
                _textName.visible = false;
            }
            else
            {
                _textName.visible = true;
            };
        }

        override protected function resLoadCompleteHandler(_arg_1:Event):void
        {
            super.resLoadCompleteHandler(_arg_1);
        }

        public function setRes(_arg_1:Number):void
        {
            _gameObject.resCode = _arg_1;
            loadRes();
        }

        override protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
            if (!_gameObject.isSelf)
            {
                _core.targetPlayer = Charactor(_gameObject);
                _core.view.getUI(ViewManager.MAIN_TARGET).update();
            };
            super.mouseDownHandler(_arg_1);
            if (_arg_1.ctrlKey)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(_gameObject.name);
                return;
            };
        }

        public function loadStateIcon():void
        {
            _core.remote.call("getCharStateClient", new Responder(stateLoaded), _gameObject.id);
        }

        public function delVipTitle():void
        {
            _core.remote.delVipTitle();
        }

        public function delActiveTitle(_arg_1:int):void
        {
            var _local_3:Object;
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_TITLE][GamePredef.TITLE_KIND_ACTIVE];
            for each (_local_3 in _local_2)
            {
                if (((_local_3) && (_local_3.b == _arg_1)))
                {
                    _core.remote.delActiveTitle(_local_3.id);
                    break;
                };
            };
        }

        private function leaderLoaded(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                showLeaderFlag();
                _gameObject.isLeader = _arg_1;
            }
            else
            {
                hideLeaderFlag();
            };
            if (((_gameObject) && (_gameObject.doubleFly)))
            {
                setDoubleFlyer();
            };
        }

        public function setActTitle(_arg_1:Number):void
        {
            var _local_2:* = "";
            var _local_3:* = "";
            var _local_4:Object;
            if (((_arg_1 > 0) && (_core.checkTitleType(_arg_1, GamePredef.TITLE_KIND_ACTIVE))))
            {
                _local_4 = _core.data.getGameData(GamePredef.TBL_TITLE, _arg_1);
                if (_local_4)
                {
                    _local_2 = _local_4.n;
                    _local_3 = _local_4.a;
                };
                _gameObject.actT = _arg_1;
            };
            if (((_gameObject.actT) && (GamePredef.SPECIAL_TITLE_IDARR[_gameObject.actT])))
            {
                _local_2 = _gameObject.actTN;
            };
            _actTile.visible = true;
            if (((_local_2 == "") || (_local_3 == "")))
            {
                _actTile.visible = false;
                return;
            };
            var _local_5:Array = _local_3.split("|");
            if (!_local_5.length)
            {
                trace("ERROR: title template style error.");
                return;
            };
            _actTile.textColor = uint(_local_5[0]);
            _actTile.text = ((_local_5[1] + _local_2) + _local_5[2]);
            fixTextsPos();
        }

        public function showLeaderFlag():void
        {
            if (_leaderFlag)
            {
                _body.addChild(_leaderFlag);
            };
        }

        public function hideLeaderFlag():void
        {
            if (!_leaderFlag)
            {
                return;
            };
            if (_leaderFlag.parent)
            {
                _body.removeChild(_leaderFlag);
            };
        }

        public function updateSpeTitle(_arg_1:Number):void
        {
            _gameObject.t = _arg_1;
            setTitle(_arg_1);
        }

        public function setRedName(_arg_1:int):void
        {
            _textName.textColor = (uint(0xFF8800) - (nameColor * _arg_1));
        }

        public function pause():void
        {
            _gameObjMove.pause();
            _route = _gameObject.moveRoute;
            behavior(AbstractGameRes.BH_BREATH_SLOW);
        }


    }
}//package com.qeedoo.ui.view.compGameStage

