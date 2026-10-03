// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.system.CallBackGlobal

package com.qeedoo.game.system
{
    import flash.utils.Proxy;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.utils.setTimeout;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Version;
    import flash.external.ExternalInterface;
    import mx.events.CloseEvent;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public dynamic class CallBackGlobal extends Proxy 
    {

        private var _core:Core;

        public function CallBackGlobal()
        {
            _core = Core.getInstance();
        }

        public function classifyAlert3():void
        {
            Alert.show(Language.ANTIADDICTCANVAS_U[46], "", Alert.OK);
        }

        public function onGetLimitShopConfig(_arg_1:Object):void
        {
            var _local_3:String;
            if (_arg_1[0] != 0)
            {
                trace(("getLimitShopConfig get error : " + _arg_1[1]));
                return;
            };
            var _local_2:Array = _arg_1[2];
            for each (_local_3 in _local_2)
            {
                parseAndSetShopSlot(_local_3);
            };
        }

        public function classifyAlert5():void
        {
            Alert.show(Language.ANTIADDICTCANVAS_U[45], "", Alert.OK);
        }

        public function onUpdateGuildMember(... _args):void
        {
        }

        public function classifyAlert7():void
        {
            Alert.show(Language.ANTIADDICTCANVAS_U[47], "", Alert.OK);
        }

        public function onLogout(... _args):void
        {
        }

        public function onUpdateGuild(... _args):void
        {
        }

        public function onSay(... _args):void
        {
        }

        public function classifyAlert6():void
        {
            Alert.show(Language.ANTIADDICTCANVAS_U[42], "", Alert.OK);
        }

        public function onUpdateGuildRand(... _args):void
        {
        }

        public function onAddGuild(... _args):void
        {
        }

        private function parseAndSetShopSlot(_arg_1:String):void
        {
            var _local_2:int;
            var _local_3:String;
            var _local_4:Array;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Object;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:String;
            if (_arg_1)
            {
                _arg_1 = _arg_1.replace("\r", "");
                _arg_1 = _arg_1.replace("\n", "");
                _local_2 = _arg_1.indexOf(";");
                if (_local_2 <= 0)
                {
                    trace(("getShopConfig get error : " + _arg_1));
                    return;
                };
                _local_3 = _arg_1.substr((_local_2 + 1));
                _local_4 = _local_3.split(";");
                _local_5 = new Object();
                for each (_local_6 in _local_4)
                {
                    if (((_local_6 == null) || (_local_6 == ""))) break;
                    _local_6 = _local_6.replace("obj.", "");
                    _local_8 = _local_6.split("=");
                    _local_9 = _local_8[1];
                    _local_9 = _local_9.replace("'", "");
                    _local_9 = _local_9.replace("'", "");
                    _local_5[_local_8[0]] = _local_9;
                };
                _local_7 = GameData.d[GamePredef.TBL_SHOP_SLOT][int(_local_5["id"])];
                if (((_local_7) && (!(_local_7 == null))))
                {
                    for (_local_10 in _local_5)
                    {
                        if (((_local_10 == "st") && (!(_local_7[_local_10] == _local_5[_local_10]))))
                        {
                            delete _core.data.gameDataIndex2[GamePredef.TBL_SHOP_SLOT][_local_7.st][_local_5.id];
                        };
                        if (((_local_10 == "sid") && (!(_local_7[_local_10] == _local_5[_local_10]))))
                        {
                            delete _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_local_7.sid][_local_5.id];
                        };
                        if (_local_10 != "position")
                        {
                            _local_7[_local_10] = _local_5[_local_10];
                        };
                    };
                };
                if (_core.data.gameDataIndex2[GamePredef.TBL_SHOP_SLOT][_local_5.st] == null)
                {
                    _core.data.gameDataIndex2[GamePredef.TBL_SHOP_SLOT][_local_5.st] = {};
                };
                if (_core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_local_5.sid] == null)
                {
                    _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_local_5.sid] = {};
                };
                _core.data.gameDataIndex2[GamePredef.TBL_SHOP_SLOT][_local_5.st][_local_5.id] = ((_local_7 == null) ? _local_5 : _local_7);
                _core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_local_5.sid][_local_5.id] = ((_local_7 == null) ? _local_5 : _local_7);
            };
        }

        public function classifyAlert4():void
        {
            Alert.show(Language.ANTIADDICTCANVAS_U[43], "", Alert.OK);
        }

        public function onAddGuildMember(... _args):void
        {
        }

        public function onSystemSay(... _args):void
        {
        }

        public function onDelGuildMember(... _args):void
        {
        }

        public function updateAccount(_arg_1:Object):void
        {
            if (_core.by_session == "sdo")
            {
                if (_arg_1.email)
                {
                    _core.user = _arg_1.email;
                };
                if (_arg_1.password)
                {
                    _core.pass = _arg_1.password;
                };
            };
        }

        public function onSystemMidMsg(... _args):void
        {
        }

        public function onBlueMsg(... _args):void
        {
        }

        public function ipChangeWarn(_arg_1:*):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:Array;
            var _local_5:Array;
            var _local_6:Array;
            if (_core.ipWarnFlag)
            {
                return;
            };
            if (((((_arg_1) && (_arg_1.lastLocation)) && (_arg_1.location)) && (_arg_1.last)))
            {
                if (_arg_1.lastLocation == _arg_1.location)
                {
                    _local_2 = Language.CALLBACKGLOBAL_S[8];
                }
                else
                {
                    _local_2 = Language.CALLBACKGLOBAL_S[9];
                };
                _local_2 = _local_2.replace("{lastLocation}", _arg_1.lastLocation);
                _local_2 = _local_2.replace("{location}", _arg_1.location);
                _local_3 = _arg_1.last;
                _local_4 = _local_3.split(" ");
                _local_5 = _local_4[0].split("-");
                _local_6 = _local_4[1].split(":");
                _local_2 = _local_2.replace("{m}", Number(_local_5[1]));
                _local_2 = _local_2.replace("{d}", Number(_local_5[2]));
                _local_2 = _local_2.replace("{h}", Number(_local_6[0]));
                _local_2 = _local_2.replace("{min}", Number(_local_6[1]));
                _local_2 = (("<font color='#ff0000'>" + _local_2) + "</font>");
                setTimeout(sysDelay, 10000, _local_2);
            };
            _core.ipWarnFlag = true;
        }

        public function onRedMsg(... _args):void
        {
        }

        public function onLineList(ver:String, info:Object):void
        {
            var func:Function;
            var yesLabel:String;
            _core.global.call("getShopConfig", null);
            _core.global.call("getLimitShopConfig", null);
            _core.global.call("getRemainShopConfig", null);
            if (_core.player)
            {
                info.lastLogInfo = "";
            };
            _core.loginTimes = info.loginTimes;
            _core.view.getUI(ViewManager.MAIN_LINE).logInfoText.text = info.lastLogInfo;
            _core.view.show(ViewManager.MAIN_LINE);
            if (ver != Version.VERSION)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (((info.forceRefresh) && (ExternalInterface.available)))
                    {
                        ExternalInterface.call("window.location.reload(true)");
                    };
                };
                yesLabel = Alert.yesLabel;
                if (((info.forceRefresh) && (ExternalInterface.available)))
                {
                    Alert.yesLabel = Language.CALLBACKGLOBAL_S[10];
                };
                Alert.show((((Language.CALLBACKGLOBAL_S[0] + ver) + Language.CALLBACKGLOBAL_S[1]) + Version.VERSION), "", Alert.YES, null, func);
                Alert.yesLabel = yesLabel;
            };
        }

        public function onGetShopConfig(_arg_1:Object):void
        {
            var _local_3:String;
            if (_arg_1[0] != 0)
            {
                trace(("getShopConfig get error : " + _arg_1[1]));
                return;
            };
            var _local_2:Array = _arg_1[2];
            for each (_local_3 in _local_2)
            {
                parseAndSetShopSlot(_local_3);
            };
        }

        public function close():void
        {
            _core.view.hide(ViewManager.MAIN_LINE);
            if (!_core.global.showAlert)
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                Alert.cancelLabel = Language.GAMEPREDEF_S[2];
                Alert.okLabel = Language.GAMEPREDEF_S[3];
                if (_core.by_session == "sdo")
                {
                    ExternalInterface.call("flush");
                }
                else
                {
                    if (_arg_1.detail == Alert.OK)
                    {
                        if (((_core.global.appCode == "SERVER_NOT_READY") && (GamePredef.SERVER_JUMP_IFEXIST.length > 0)))
                        {
                            navigateToURL(new URLRequest(GamePredef.SERVER_JUMP_IFEXIST));
                        };
                    };
                };
            };
            switch (_core.global.appCode)
            {
                case "ERR_LOGINED":
                    Alert.show(Language.CALLBACKGLOBAL_S[2], "", Alert.YES, null, func);
                    _core.view.hide(ViewManager.POPU_WAIT);
                    return;
                case "ERR_LOGIN_FAILED":
                    Alert.show(Language.CALLBACKGLOBAL_S[3], "", Alert.YES, null, func);
                    _core.view.hide(ViewManager.POPU_WAIT);
                    return;
                case "SERVER_NOT_READY":
                    if (GamePredef.SERVER_JUMP_IFEXIST.length > 0)
                    {
                        Alert.cancelLabel = Language.GAMEPREDEF_S[496];
                        Alert.okLabel = Language.GAMEPREDEF_S[495];
                        Alert.show(Language.CALLBACKGLOBAL_S[4], "", (Alert.OK | Alert.CANCEL), null, func);
                    }
                    else
                    {
                        Alert.show(Language.CALLBACKGLOBAL_S[4], "", Alert.YES, null, func);
                    };
                    return;
                case "IN_CROSS_SERVER":
                    Alert.show(Language.CALLBACKGLOBAL_S[6], "", Alert.YES, null, func);
                    return;
                case "ERR_LOGIN_BANNED":
                    Alert.show(Language.CALLBACKGLOBAL_S[7], "", Alert.YES, null, func);
                    return;
                case "ERR_IP_BAN":
                    Alert.show(Language.CALLBACKGLOBAL_S[11], "", Alert.YES, null, func);
                    return;
                case "ERR_CLASSIFY5":
                    return;
                case "ERR_CLASSIFY6":
                    Alert.show(Language.ANTIADDICTCANVAS_U[42], "", Alert.OK);
                    return;
                case "ERR_CLASSIFY7":
                    Alert.show(Language.ANTIADDICTCANVAS_U[47], "", Alert.OK);
                    return;
            };
        }

        public function classifyAlert2():void
        {
            Alert.show(Language.ANTIADDICTCANVAS_U[45], "", Alert.OK);
        }

        public function onGetRemainShopConfig(_arg_1:Object):void
        {
            if (_arg_1[0] != 0)
            {
                trace(("getRemainShopConfig get error : " + _arg_1[1]));
                return;
            };
        }

        private function sysDelay(_arg_1:String):void
        {
            if (_core)
            {
                _core.sysMsg(_arg_1);
            };
        }

        public function classifyAlert():void
        {
            Alert.show(Language.CALLBACKGLOBAL_S[13], "", Alert.OK);
        }


    }
}//package com.qeedoo.game.system

