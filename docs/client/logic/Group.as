// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.Group

package com.qeedoo.game.logic
{
    import mx.controls.Alert;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.utils.LinkEncode;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.utils.Alert1;
    import com.qeedoo.game.object.Charactor;
    import flash.utils.setTimeout;
    import com.qeedoo.game.view.ViewManager;
    import mx.collections.ArrayCollection;

    public class Group 
    {

        private var _inviteAlert:Alert;
        private var _core:Core = Core.getInstance();


        public function onGroupInviteSent(_arg_1:Object):void
        {
            var _local_2:String = LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.pid, _arg_1.name);
            var _local_3:* = "";
            _local_3 = Language.GROUP_S[0];
            _local_3 = _local_3.replace("{nameLink}", _local_2);
            _core.sysMidNote(_local_3);
        }

        public function onGroupInvited(obj:Object):void
        {
            var nameLink:String;
            var str:String;
            var handler:Function;
            var invitedInfo:Object;
            if (((obj) && (!(obj.dis))))
            {
                if (_core.state != GamePredef.ST_CORE_NORMAL)
                {
                    return;
                };
                nameLink = LinkEncode.encode(GamePredef.TBL_CHARACTOR, obj.pid, obj.name);
                str = "";
                str = Language.GROUP_S[2];
                str = str.replace("{nameLink}", nameLink);
                _core.sysMidNote(str);
                handler = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.groupJoin(obj.pid);
                    };
                    if (_arg_1.detail == Alert.NO)
                    {
                        _core.remote.groupReqDeny(obj.pid);
                    };
                };
                if (_inviteAlert)
                {
                    PopUpManager.removePopUp(_inviteAlert);
                    _inviteAlert = null;
                };
                str = Language.GROUP_S[3];
                str = str.replace("{obj.name}", obj.name);
                _inviteAlert = Alert1.show(str, null, (Alert.YES | Alert.NO), null, handler);
            }
            else
            {
                if (((obj) && (obj.dis == "far")))
                {
                    invitedInfo = new Object();
                    invitedInfo.pid = obj.pid;
                    invitedInfo.name = obj.name;
                    invitedInfo.warnType = GamePredef.WARN_TYPE_GROUP_INVITE;
                    _core.addWarn(invitedInfo);
                };
            };
        }

        public function onGroupRequestSent(_arg_1:Object):void
        {
            var _local_2:String = LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.pid, _arg_1.name);
            var _local_3:* = "";
            _local_3 = Language.GROUP_S[6];
            _local_3 = _local_3.replace("{nameLink}", _local_2);
            _core.sysMidNote(_local_3);
        }

        public function onGroupJoined(_arg_1:Object):void
        {
            if (!_core.groupMemberListArr)
            {
                _core.groupMemberListArr = new Object();
            };
            if (_arg_1.groupCharactorList)
            {
                groupCreateChars(_arg_1.groupCharactorList, _arg_1.groupAKFCidList);
            };
            setGroupState(_arg_1.mList);
        }

        public function onGroupDismiss(_arg_1:Object):void
        {
            showGroupNote(_arg_1, GamePredef.SYS_MSG_GROUP_DISMISS);
            clearGroupState(_arg_1);
            var _local_2:Object = _arg_1.head;
            while (_local_2)
            {
                if (((_core.groupMemberListArr) && (_core.groupMemberListArr[_local_2.obj])))
                {
                    _core.groupMemberListArr[_local_2.obj] = null;
                };
                _local_2 = _local_2.next;
            };
        }

        public function onGroupDeny(_arg_1:Object):void
        {
            var _local_2:String = LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.cid, _arg_1.name);
            var _local_3:* = "";
            _local_3 = Language.GROUP_S[4];
            _local_3 = _local_3.replace("{nameLink}", _local_2);
            _core.sysMidNote(_local_3);
        }

        public function groupCreateChars(_arg_1:Object, _arg_2:Object=null):void
        {
            var _local_3:Object;
            var _local_4:Charactor;
            for each (_local_3 in _arg_1)
            {
                if (_local_3 != null)
                {
                    if (((_local_3.vipT < 0) && (_local_3.SpeT > 0)))
                    {
                        _local_3.vipT = _local_3.SpeT;
                    };
                    if (((((_local_3.vipT > 0) && (_local_3.SpeT > 0)) && (!(_local_3.vipT == _local_3.SpeT))) && (_core.checkTitleShow(_local_3.SpeT))))
                    {
                        _local_3.t = _local_3.SpeT;
                    };
                    _local_4 = new Charactor();
                    _local_4.data = _local_3;
                    if (isInThisList(_arg_2, _local_3.id))
                    {
                        _local_4.groupAfk = true;
                    }
                    else
                    {
                        _local_4.groupAfk = false;
                    };
                    if (_core.groupMemberListArr[_local_3.id])
                    {
                        _core.groupMemberListArr[_local_3.id] = null;
                    };
                    _core.groupMemberListArr[_local_3.id] = _local_4;
                };
            };
        }

        private function onAddGroupFailed(_arg_1:Object):void
        {
            var _local_2:* = "";
            if (((_arg_1.pid) && (_arg_1.name)))
            {
                _local_2 = LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.pid, _arg_1.name);
            };
            switch (_arg_1.type)
            {
                case 0:
                    _core.sysMidNote(GamePredef.SYS_MSG_GROUP_INVITETOOFAR);
                    return;
                case 1:
                    _core.sysMidNote((_local_2 + GamePredef.SYS_MSG_GROUP_INTEAM));
                    return;
                case 2:
                    _core.sysMidNote((_local_2 + GamePredef.SYS_MSG_GROUP_INOTHERTEAM));
                    return;
                case 3:
                    _core.sysMidNote(GamePredef.SYS_MSG_GROUP_FULL);
                    return;
                case 4:
                    _core.sysMidNote(GamePredef.SYS_MSG_GROUP_NOT_SAME_LEAGUE);
                    return;
                case 5:
                    _core.sysMidNote(GamePredef.SYS_MSG_GROUP_NOT_LEAGUE_AND_LEAGUE);
                    return;
            };
        }

        private function showGroupNote(_arg_1:Object, _arg_2:String):void
        {
            var _local_3:Object = _arg_1.head;
            while (_local_3)
            {
                if (_local_3.obj == _core.cid)
                {
                    _core.sysMidNote(_arg_2);
                };
                _local_3 = _local_3.next;
            };
        }

        public function unGroupAfk(_arg_1:Object):void
        {
            var _local_2:* = _core.getCharactor(_arg_1.mList.head.obj);
            if (_local_2)
            {
                _followLeader(_arg_1);
            }
            else
            {
                setTimeout(_followLeader, 1500, _arg_1);
            };
        }

        private function setGroupState(_arg_1:Object):void
        {
            var _local_5:Charactor;
            var _local_6:Charactor;
            var _local_2:Object = _arg_1.head;
            var _local_3:Object = _local_2.next;
            var _local_4:Charactor = _core.getCharactor(_local_2.obj);
            if (((_core.groupMemberListArr) && (_core.groupMemberListArr[_local_2.obj])))
            {
                _core.groupMemberListArr[_local_2.obj].isLeader = true;
            };
            if (!_local_4)
            {
                while (_local_3)
                {
                    _local_5 = _core.getCharactor(_local_3.obj);
                    if (_local_5)
                    {
                        if (Number(_local_3.obj) == _core.cid)
                        {
                            _local_5.isLeader = false;
                            _local_5.inGroup = true;
                            _local_5.groupAfk = true;
                            _core.player.walkable = true;
                            _core.player.groupList = _arg_1;
                            _local_5.normalView.stopFollow();
                            _local_5.normalView.hideLeaderFlag();
                        };
                    };
                    _local_3 = _local_3.next;
                };
                return;
            };
            _local_4.isLeader = true;
            _local_4.inGroup = true;
            _local_4.groupAfk = false;
            _local_4.normalView.stopFollow();
            _local_4.normalView.showLeaderFlag();
            if (_local_2.obj == _core.cid)
            {
                _core.player.walkable = true;
                _core.player.groupList = _arg_1;
            };
            while (_local_3)
            {
                _local_6 = _core.getCharactor(_local_2.obj);
                _local_5 = _core.getCharactor(_local_3.obj);
                if (!_local_5)
                {
                    if (((_core.groupMemberListArr) && (_core.groupMemberListArr[_local_3.obj])))
                    {
                        _core.groupMemberListArr[_local_3.obj].isLeader = false;
                    };
                    _local_3 = _local_3.next;
                    if (!_local_3) break;
                }
                else
                {
                    if (((_core.groupMemberListArr) && (_core.groupMemberListArr[_local_3.obj])))
                    {
                        _core.groupMemberListArr[_local_3.obj].isLeader = false;
                    };
                    _local_5.isLeader = false;
                    _local_5.inGroup = true;
                    if (((_core.groupMemberListArr) && (_core.groupMemberListArr[_local_3.obj])))
                    {
                        _local_5.groupAfk = _core.groupMemberListArr[_local_3.obj].groupAfk;
                    };
                    if (_local_3.obj == _core.cid)
                    {
                        if (_local_5.groupAfk)
                        {
                            _core.player.walkable = true;
                        }
                        else
                        {
                            _core.player.walkable = false;
                        };
                        _core.player.groupList = _arg_1;
                    };
                    if (((_local_5.normalView) && (_local_6.normalView)))
                    {
                        if (_local_5.groupAfk)
                        {
                            _local_5.normalView.stopFollow();
                        }
                        else
                        {
                            _local_5.normalView.startFollow(_local_6.normalView);
                        };
                        _local_5.normalView.hideLeaderFlag();
                    };
                    if (_local_5.groupAfk)
                    {
                        _local_3 = _local_3.next;
                    }
                    else
                    {
                        _local_2 = _local_3;
                        _local_3 = _local_3.next;
                    };
                };
            };
        }

        public function onGroupInviteFailed(_arg_1:Object):void
        {
            onAddGroupFailed(_arg_1);
        }

        public function isInThisList(_arg_1:Object, _arg_2:Number):Boolean
        {
            var _local_3:*;
            if (!_arg_1)
            {
                return (false);
            };
            for each (_local_3 in _arg_1)
            {
                if (Number(_local_3) == _arg_2)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function onGroupRequestFailed(_arg_1:Object):void
        {
            onAddGroupFailed(_arg_1);
        }

        public function onGroupAfk(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_2:Charactor = _core.getCharactor(_arg_1.cid);
            if (((_local_2) && (_local_2.normalView)))
            {
                _local_2.normalView.stopFollow();
            };
            setGroupState(_arg_1.mList);
            if (_arg_1.cid == _core.cid)
            {
                _local_3 = _core.view.getUI(ViewManager.MAIN_GROUP);
                if (_local_3)
                {
                    _local_3.refresh();
                };
            };
        }

        public function onGroupCantJoin(_arg_1:Number, _arg_2:int):void
        {
            var _local_3:*;
            if (((_arg_1) && (_arg_2)))
            {
                _local_3 = "";
                if (_arg_1 == _core.cid)
                {
                    _local_3 = Language.GAMEPREDEF_S[528];
                }
                else
                {
                    if (_arg_1 > 0)
                    {
                        _local_3 = Language.GAMEPREDEF_S[529];
                    };
                };
                if (_arg_2 == 10)
                {
                    _local_3 = (_local_3 + GamePredef.SYS_MSG_GROUP_CANTJOIN_GC_STATE);
                }
                else
                {
                    if (_arg_2 == 20)
                    {
                        _local_3 = (_local_3 + GamePredef.SYS_MSG_GROUP_CANTJOIN_GC_FULL);
                    }
                    else
                    {
                        if (_arg_2 == 30)
                        {
                            _local_3 = (_local_3 + GamePredef.SYS_MSG_GROUP_CANTJOIN_GC_INGROUP);
                        };
                    };
                };
                _core.sysMidNote(_local_3);
            };
        }

        public function onGroupRequested(obj:Object):void
        {
            var handler:Function;
            if (((_core.view.getUI(ViewManager.CANVA_GUIDE).visible) || (!(_core.state == GamePredef.ST_CORE_NORMAL))))
            {
                return;
            };
            var nameLink:String = LinkEncode.encode(GamePredef.TBL_CHARACTOR, obj.pid, obj.name);
            var str:String = "";
            _core.sysMidNote((nameLink + Language.GROUP_S[5]));
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.groupAdd(obj.pid);
                };
                if (_arg_1.detail == Alert.NO)
                {
                    _core.remote.groupReqDeny(obj.pid);
                };
            };
            if (_inviteAlert)
            {
                PopUpManager.removePopUp(_inviteAlert);
                _inviteAlert = null;
            };
            str = Language.GROUP_S[5];
            str = str.replace("{nameLink}", obj.name);
            _inviteAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        private function clearGroupLeaderState(_arg_1:Object):void
        {
            var _local_2:Charactor = _core.getCharactor(_arg_1.sid);
            if (_local_2)
            {
                _local_2.inGroup = false;
                _local_2.isLeader = false;
                _local_2.groupAfk = false;
                if (_local_2.normalView)
                {
                    _local_2.normalView.stopFollow();
                    _local_2.normalView.hideLeaderFlag();
                };
            };
            if (_core.cid == _arg_1.sid)
            {
                _core.player.groupList = null;
                _core.player.walkable = true;
            };
        }

        public function onGroupLeave(obj:Object):void
        {
            var msg:String = (LinkEncode.encode(GamePredef.TBL_CHARACTOR, obj.sid, obj.name) + GamePredef.SYS_MSG_GROUP_LEAVE);
            showGroupNote(obj.mList, msg);
            setGroupState(obj.mList);
            if (((_core.groupMemberListArr) && (_core.groupMemberListArr[obj.sid])))
            {
                _core.groupMemberListArr[obj.sid] = null;
            };
            if (obj.sid == _core.player.id)
            {
                _core.player.groupList = [];
                _core.player.isLeader = false;
                _core.player.inGroup = false;
                _core.player.walkable = true;
                _core.player.groupAfk = false;
                _core.player.groupRequestAC = new ArrayCollection();
                if (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
                {
                    try
                    {
                        _core.player.view.moveToSafeArea();
                    }
                    catch(e:Error)
                    {
                    };
                };
            };
            var c:Charactor = _core.getCharactor(obj.sid);
            if (((c) && (c.normalView)))
            {
                c.normalView.stopFollow();
            };
            clearGroupLeaderState(obj);
        }

        private function _followLeader(_arg_1:Object):void
        {
            var _local_2:*;
            setGroupState(_arg_1.mList);
            if (_arg_1.cid == _core.cid)
            {
                _local_2 = _core.view.getUI(ViewManager.MAIN_GROUP);
                if (_local_2)
                {
                    _local_2.refresh();
                };
            };
        }

        public function onGroupGiveLeader(_arg_1:Object):void
        {
            var _local_2:String = ((LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.sid, _arg_1.oName) + GamePredef.SYS_MSG_GROUP_GIVELEADER) + LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.tid, _arg_1.nName));
            showGroupNote(_arg_1.mList, _local_2);
            if (_arg_1.afkflag)
            {
                if (_core.groupMemberListArr)
                {
                    if (_core.groupMemberListArr[_arg_1.tid])
                    {
                        _core.groupMemberListArr[_arg_1.tid].groupAfk = false;
                    };
                    if (_core.groupMemberListArr[_arg_1.sid])
                    {
                        _core.groupMemberListArr[_arg_1.sid].groupAfk = true;
                    };
                };
            };
            setGroupState(_arg_1.mList);
        }

        public function onGroupRequestDeny(_arg_1:Object):void
        {
            var _local_2:String = LinkEncode.encode(GamePredef.TBL_CHARACTOR, _arg_1.cid, _arg_1.name);
            var _local_3:* = "";
            _local_3 = Language.GROUP_S[7];
            _local_3 = _local_3.replace("{nameLink}", _local_2);
            _core.sysMidNote(_local_3);
        }

        private function clearGroupState(mList:Object):void
        {
            var p:Charactor;
            var node:Object = mList.head;
            while (node)
            {
                p = _core.getCharactor(node.obj);
                if (p)
                {
                    p.inGroup = false;
                    p.isLeader = false;
                    p.groupAfk = false;
                    if (p.normalView)
                    {
                        p.normalView.stopFollow();
                        p.normalView.hideLeaderFlag();
                    };
                };
                if (_core.cid == node.obj)
                {
                    _core.player.groupList = null;
                    _core.player.walkable = true;
                    _core.player.groupAfk = false;
                    _core.player.groupRequestAC = new ArrayCollection();
                    if (_core.player.flyingState == GamePredef.FLYING_STATE_ON_GROUND)
                    {
                        try
                        {
                            _core.player.view.moveToSafeArea();
                        }
                        catch(e:Error)
                        {
                        };
                    };
                };
                node = node.next;
            };
        }


    }
}//package com.qeedoo.game.logic

