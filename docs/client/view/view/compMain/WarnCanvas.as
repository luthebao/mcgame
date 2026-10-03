// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.WarnCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.ui.IMainUI;
    import mx.controls.Alert;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.utils.LinkEncode;
    import mx.managers.PopUpManager;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.utils.ChatPanelUtil;
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

    public class WarnCanvas extends SimpleCanvas implements IMainUI 
    {

        internal var _inviteAlert:Alert;
        private var currentWarn:*;
        private var _1768633739warnImage:Image;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"warnImage",
                        "events":{"click":"__warnImage_click"},
                        "stylesFactory":function ():void
                        {
                            this.themeColor = 2782887;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    })]
                });
            }
        });
        private var warnArray:Array = new Array();
        private var _core:Core = Core.getInstance();

        public function WarnCanvas()
        {
            mx_internal::_document = this;
            this.width = 50;
            this.height = 50;
            this.cacheAsBitmap = false;
        }

        [Bindable(event="propertyChange")]
        public function get warnImage():Image
        {
            return (this._1768633739warnImage);
        }

        public function addWarn(_arg_1:Object):void
        {
            warnArray.push(_arg_1);
            visible = true;
            initView();
        }

        public function delMailWarn():void
        {
            var _local_2:Object;
            var _local_1:Boolean;
            if (currentWarn)
            {
                _local_1 = currentWarn.isReceiver;
            };
            for each (_local_2 in warnArray)
            {
                if (((_local_2.warnType == GamePredef.WARN_TYPE_ADDMAIL) && (_local_2.isReceiver == _local_1)))
                {
                    delete warnArray[warnArray.indexOf(_local_2)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        public function delChatGMWarn(_arg_1:String):void
        {
            var _local_2:Object;
            for each (_local_2 in warnArray)
            {
                if ((((_local_2.warnType == GamePredef.WARN_TYPE_CHATGM) || (_local_2.warnType == GamePredef.WARN_TYPE_CHATGM_MIN)) && (_local_2.gmName == _arg_1)))
                {
                    delete warnArray[warnArray.indexOf(_local_2)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        private function findStudent(_arg_1:CloseEvent):void
        {
            if ((((_arg_1.detail == Alert.YES) && (currentWarn)) && (currentWarn.warnType == GamePredef.WARN_TYPE_FINDSTUDENT)))
            {
                _core.remote.acceptTeacher(currentWarn.teacherId);
            };
            delSWarn(currentWarn.teacherId);
        }

        private function delTWarn(_arg_1:Number):void
        {
            var _local_2:Object;
            for each (_local_2 in warnArray)
            {
                if (((_local_2.warnType == GamePredef.WARN_TYPE_FINDTEACHER) && (_local_2.studentId == _arg_1)))
                {
                    delete warnArray[warnArray.indexOf(_local_2)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        public function update():void
        {
        }

        public function initView():void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_1:* = "";
            if (warnArray.length != 0)
            {
                _local_2 = (warnArray.length - 1);
                while (_local_2 >= 0)
                {
                    if (warnArray[_local_2])
                    {
                        currentWarn = warnArray[_local_2];
                        break;
                    };
                    _local_2--;
                };
                if (currentWarn)
                {
                    visible = true;
                    if (((currentWarn.warnType) && (currentWarn.warnType == GamePredef.WARN_TYPE_GROUP_INVITE)))
                    {
                        warnImage.height = 37;
                        warnImage.width = 37;
                    }
                    else
                    {
                        warnImage.height = 50;
                        warnImage.width = 50;
                    };
                    switch (currentWarn.warnType)
                    {
                        case GamePredef.WARN_TYPE_MIN:
                            warnImage.source = ResManager.ICON_WARN_WISPERMIN;
                            warnImage.toolTip = GamePredef.WARN_TIP_MIN.replace("{speakername}", currentWarn.speakerName);
                            break;
                        case GamePredef.WARN_TYPE_P2PWISPER:
                            warnImage.source = ResManager.ICON_WARN_WISPER;
                            warnImage.toolTip = (currentWarn.speakerName + GamePredef.WARN_TIP_P2PWISPER);
                            break;
                        case GamePredef.WARN_TYPE_ADDMAIL:
                            _local_3 = ((currentWarn.info as String).charAt(0) + (currentWarn.info as String).charAt(1));
                            if (_local_3 != Language.WARNCANVAS_S[6])
                            {
                                warnImage.source = ResManager.ICON_WARN_MAIL;
                                warnImage.toolTip = currentWarn.info;
                            }
                            else
                            {
                                warnImage.source = ResManager.ICON_SYSTEM_WARN_MAIL;
                                warnImage.toolTip = currentWarn.info;
                            };
                            if (_local_3 == Language.WARNCANVAS_S[6])
                            {
                                warnImage.source = ResManager.ICON_SYSTEM_WARN_MAIL;
                                warnImage.toolTip = currentWarn.info;
                            };
                            break;
                        case GamePredef.WARN_TYPE_FINDTEACHER:
                            warnImage.source = ResManager.ICON_WARN_FTEACHER;
                            _local_1 = Language.WARNCANVAS_S[0];
                            warnImage.toolTip = _local_1.replace("{studentName}", currentWarn.studentName);
                            break;
                        case GamePredef.WARN_TYPE_FINDSTUDENT:
                            warnImage.source = ResManager.ICON_WARN_FSTUDENT;
                            _local_1 = Language.WARNCANVAS_S[1];
                            warnImage.toolTip = _local_1.replace("{teacherName}", currentWarn.teacherName);
                            break;
                        case GamePredef.WARN_TYPE_CHATGM:
                            warnImage.source = ResManager.ICON_WARN_GM_MSG;
                            warnImage.toolTip = GamePredef.WARN_TIP_CHATGM;
                            break;
                        case GamePredef.WARN_TYPE_CHATGM_MIN:
                            warnImage.source = ResManager.ICON_WARN_GM_MSG_MIN;
                            break;
                        case GamePredef.WARN_TYPE_GROUP_CHAT:
                            warnImage.source = ResManager.ICON_WARN_WISPER;
                            warnImage.toolTip = Language.GROUP_RECRUIT_PANEL_S[31];
                            break;
                        case GamePredef.WARN_TYPE_GROUP_APPLY:
                            warnImage.source = ResManager.ICON_WARN_WISPER;
                            _local_1 = Language.GROUP_RECRUIT_PANEL_S[34];
                            warnImage.toolTip = _local_1.replace("{name}", currentWarn.name);
                            break;
                        case GamePredef.WARN_TYPE_GROUP_INVITE:
                            warnImage.source = ResManager.ICON_WARN_GROUP_INVITE;
                            warnImage.toolTip = GamePredef.WARN_TIP_INVITED.replace("{name}", currentWarn.name);
                            break;
                        case GamePredef.WARN_TYPE_REDENVELOPE:
                            warnImage.source = ResManager.ICON_WARN_REDENVELOPE;
                            warnImage.toolTip = GamePredef.WARN_TIP_REDENVELOPE;
                            break;
                    };
                }
                else
                {
                    visible = false;
                };
            }
            else
            {
                visible = false;
            };
        }

        private function delSWarn(_arg_1:Number):void
        {
            var _local_2:Object;
            for each (_local_2 in warnArray)
            {
                if (((_local_2.warnType == GamePredef.WARN_TYPE_FINDSTUDENT) && (_local_2.teacherId == _arg_1)))
                {
                    delete warnArray[warnArray.indexOf(_local_2)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        public function openRedEnvelope(_arg_1:Object):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_REDENVELOPE_PANEL);
            var _local_3:* = {};
            _local_3.code = 3;
            _local_3.data = _arg_1.data;
            _local_2.openRESingle(_local_3);
            delREWarn(_arg_1.data.v);
        }

        public function delP2pWarn(_arg_1:Number):void
        {
            var _local_2:Object;
            for each (_local_2 in warnArray)
            {
                if ((((_local_2.warnType == GamePredef.WARN_TYPE_P2PWISPER) || (_local_2.warnType == GamePredef.WARN_TYPE_MIN)) && (_local_2.speaker == _arg_1)))
                {
                    delete warnArray[warnArray.indexOf(_local_2)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        private function clickGroupInvited(currentWarn:Object):void
        {
            var handler:Function;
            if (((!(_core.state == GamePredef.ST_CORE_NORMAL)) || (!(currentWarn.warnType == GamePredef.WARN_TYPE_GROUP_INVITE))))
            {
                return;
            };
            var nameLink:String = LinkEncode.encode(GamePredef.TBL_CHARACTOR, currentWarn.pid, currentWarn.name);
            var str:String = "";
            str = Language.GROUP_S[2];
            str = str.replace("{nameLink}", nameLink);
            _core.sysMidNote(str);
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    delGroupInvitedInfo(internal::currentWarn.pid, 2);
                    _core.remote.groupJoin(internal::currentWarn.pid);
                };
                if (_arg_1.detail == Alert.NO)
                {
                    delGroupInvitedInfo(internal::currentWarn.pid, 1);
                    _core.remote.groupReqDeny(internal::currentWarn.pid);
                };
            };
            if (_inviteAlert)
            {
                PopUpManager.removePopUp(_inviteAlert);
                _inviteAlert = null;
            };
            str = Language.GROUP_S[3];
            str = str.replace("{obj.name}", currentWarn.name);
            _inviteAlert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        public function __warnImage_click(_arg_1:MouseEvent):void
        {
            imageClick();
        }

        private function findTeacher(_arg_1:CloseEvent):void
        {
            if ((((_arg_1.detail == Alert.YES) && (currentWarn)) && (currentWarn.warnType == GamePredef.WARN_TYPE_FINDTEACHER)))
            {
                _core.remote.acceptStudent(currentWarn.studentId);
            };
            delTWarn(currentWarn.studentId);
        }

        public function set warnImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1768633739warnImage;
            if (_local_2 !== _arg_1)
            {
                this._1768633739warnImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "warnImage", _local_2, _arg_1));
            };
        }

        private function delREWarn(_arg_1:String):void
        {
            var _local_2:Object;
            for each (_local_2 in warnArray)
            {
                if (((_local_2.warnType == GamePredef.WARN_TYPE_REDENVELOPE) && (_local_2.data.v == _arg_1)))
                {
                    delete warnArray[warnArray.indexOf(_local_2)];
                    currentWarn = undefined;
                };
            };
            initView();
        }

        private function imageClick():void
        {
            var _local_1:* = "";
            switch (currentWarn.warnType)
            {
                case GamePredef.WARN_TYPE_MIN:
                    ChatPanelUtil.getChatPanel(currentWarn.speaker, currentWarn.speakerName);
                    return;
                case GamePredef.WARN_TYPE_P2PWISPER:
                    ChatPanelUtil.getChatPanel(currentWarn.speaker, currentWarn.speakerName);
                    return;
                case GamePredef.WARN_TYPE_ADDMAIL:
                    _core.sysMidNote(currentWarn.info);
                    if (((currentWarn) && (currentWarn.isReceiver)))
                    {
                        _core.view.getUI(ViewManager.PANEL_MAIL_NOTICE).visible = true;
                    };
                    delMailWarn();
                    return;
                case GamePredef.WARN_TYPE_FINDTEACHER:
                    _local_1 = Language.WARNCANVAS_S[2];
                    _local_1 = _local_1.replace("{studentName}", currentWarn.studentName);
                    Alert.show(_local_1, "", 3, this, findTeacher);
                    return;
                case GamePredef.WARN_TYPE_FINDSTUDENT:
                    _local_1 = Language.WARNCANVAS_S[4];
                    _local_1 = _local_1.replace("{teacherName}", currentWarn.teacherName);
                    Alert.show(_local_1, "", 3, this, findStudent);
                    return;
                case GamePredef.WARN_TYPE_CHATGM:
                    ChatPanelUtil.getChatGMPanel(currentWarn.gmName);
                    return;
                case GamePredef.WARN_TYPE_CHATGM_MIN:
                    ChatPanelUtil.getChatGMPanel(currentWarn.gmName);
                    return;
                case GamePredef.WARN_TYPE_GROUP_CHAT:
                    groupChat(currentWarn.warnType);
                    return;
                case GamePredef.WARN_TYPE_GROUP_APPLY:
                    groupChat(currentWarn.warnType);
                    return;
                case GamePredef.WARN_TYPE_GROUP_INVITE:
                    clickGroupInvited(currentWarn);
                    return;
                case GamePredef.WARN_TYPE_REDENVELOPE:
                    openRedEnvelope(currentWarn);
                    return;
            };
        }

        public function reset():void
        {
            warnArray = new Array();
            warnImage.source = null;
            visible = false;
        }

        private function delGroupInvitedInfo(_arg_1:Number, _arg_2:int):*
        {
            var _local_3:Object;
            if (_arg_2 == 1)
            {
                for each (_local_3 in warnArray)
                {
                    if (((_local_3.warnType == GamePredef.WARN_TYPE_GROUP_INVITE) && (_local_3.pid == _arg_1)))
                    {
                        delete warnArray[warnArray.indexOf(_local_3)];
                        currentWarn = undefined;
                    };
                };
            }
            else
            {
                for each (_local_3 in warnArray)
                {
                    if (_local_3.warnType == GamePredef.WARN_TYPE_GROUP_INVITE)
                    {
                        delete warnArray[warnArray.indexOf(_local_3)];
                        currentWarn = undefined;
                    };
                };
            };
            initView();
        }

        private function groupChat(_arg_1:int):void
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_GROUP_RECRUIT_DETAIL);
            if (_local_2.dataFlag)
            {
                _local_2.show();
            }
            else
            {
                _local_4 = _core.view.getUI(ViewManager.PANEL_GROUP);
                _local_4.show();
                _local_4.playGlowEffect();
            };
            for each (_local_3 in warnArray)
            {
                if (_local_3.warnType == _arg_1)
                {
                    delete warnArray[warnArray.indexOf(_local_3)];
                    currentWarn = undefined;
                };
            };
            initView();
        }


    }
}//package com.qeedoo.ui.view.compMain

