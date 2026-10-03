// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.logic.BattleServer

package com.qeedoo.game.logic
{
    import flash.events.EventDispatcher;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.utils.UrlUtil;
    import mx.core.UIComponent;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.utils.setTimeout;
    import flash.events.Event;

    public class BattleServer extends EventDispatcher 
    {

        public static var EVENT_BATTLE_SERVER_FREE_SPACE:* = "BATTLE_SERVER_FREE_SPACE";

        private var _ORIGINAL_SERVER_URL:String = null;
        private var _ORIGINAL_SERVER_ID:int = -1;
        private var _BATTLE_SERVER_URL:String = null;
        private var _CROSS_SERVER_INDEX:int;
        private var _VERIFY_KEY:String = "";
        public var inBattleServer:Boolean = false;
        private var _ID_OFFSET:Number = 1000000000000;

        private var _core:Core = Core.getInstance();
        private var _DISABLE_UI_ARRAY:Array = [ViewManager.FORE_C_C, ViewManager.PANEL_SYSTEM, ViewManager.MAIN_SYS, ViewManager.PANEL_BAG, ViewManager.PANEL_PETMANAGER, ViewManager.PANEL_PET, ViewManager.PANEL_SKILLMANAGER, ViewManager.MAIN_MINIMAP, ViewManager.PANEL_CHARACTOR, ViewManager.MAIN_SELF, ViewManager.MAIN_PET, ViewManager.PANEL_CHARACTORINFO, ViewManager.MAIN_TARGET, ViewManager.PANEL_MAP, ViewManager.PANEL_FAIRY_MANAGER];
        private var _RECREATE_INDEX_ARRAY:Array = [GamePredef.TBL_CHARACTOR, GamePredef.TBL_CHARACTOR_SLOT, GamePredef.TBL_EQUIPT_INSTANCE, GamePredef.TBL_ITEM_INSTANCE, GamePredef.TBL_PET];


        private function _resetCharactorViewData():void
        {
            _core.view.getUI(ViewManager.PANEL_CHARACTOR).reset();
            _core.view.getUI(ViewManager.PANEL_SKILLMANAGER).reset();
        }

        public function onReqLeaveCrossBattle(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (((_core.remote.nc.connected) && (inBattleServer)))
                {
                    trace(("lineInfo.id=" + _core.lineInfo.id));
                    _core.logined = false;
                    _core.remote.showAlert = false;
                    _core.view.clearStage();
                    _core.remote.connect(_ORIGINAL_SERVER_URL, ["LBS", _core.user, _core.pass, _core.time, _core.by_session, _ORIGINAL_SERVER_ID, _core.lineInfo.id, _core.cid]);
                    _core.remote.showAlert = true;
                };
            };
        }

        public function onAddCrossBattleWaitList(_arg_1:Array):void
        {
            var _local_2:int;
            if (((_arg_1) && (_arg_1[1] == _core.cid)))
            {
                _ORIGINAL_SERVER_ID = _arg_1[0];
                _VERIFY_KEY = _arg_1[2];
                _local_2 = _arg_1[3];
                _CROSS_SERVER_INDEX = _arg_1[3];
                _BATTLE_SERVER_URL = _arg_1[4].url;
                Alert.show(Language.BATTLE_SERVER_S[1].toString().replace("{name}", _arg_1[4].name), "", Alert.YES);
                this.addEventListener(EVENT_BATTLE_SERVER_FREE_SPACE, _getFreeSpaceHandle);
            };
        }

        public function updateBattlePoint():void
        {
        }

        private function _disableBattleServerUI():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < _DISABLE_UI_ARRAY.length)
            {
                _local_2 = _core.view.getUI(_DISABLE_UI_ARRAY[_local_1]);
                if (_local_2)
                {
                    _local_2.disableUI();
                };
                _local_1++;
            };
        }

        private function _doConnectBattleServer(_arg_1:int):void
        {
            if (this.hasEventListener(EVENT_BATTLE_SERVER_FREE_SPACE))
            {
                this.removeEventListener(EVENT_BATTLE_SERVER_FREE_SPACE, _getFreeSpaceHandle);
            };
            var _local_2:String = _core.view.getUI(ViewManager.MAIN_LINE).dnsResolve(_BATTLE_SERVER_URL);
            if (_local_2 != null)
            {
                _BATTLE_SERVER_URL = _local_2;
            };
            if (GamePredef.SERVER_ISACTING)
            {
                _BATTLE_SERVER_URL = _BATTLE_SERVER_URL.replace("rtmp", "rtmpte");
            }
            else
            {
                _BATTLE_SERVER_URL = _BATTLE_SERVER_URL.replace("rtmp", "rtmpe");
            };
            if (((_core.remote.nc.connected) && (!(inBattleServer))))
            {
                _ORIGINAL_SERVER_URL = _core.remote.nc.uri;
                _core.logined = false;
                _core.destroyCharactor(_core.cid);
                _core.remote.showAlert = false;
                if (_arg_1 == 75)
                {
                    _core.remote.connect(_BATTLE_SERVER_URL, ["CPK", _core.user, _core.pass, _core.time, _core.by_session, _ORIGINAL_SERVER_ID, _core.cid, _VERIFY_KEY]);
                }
                else
                {
                    _core.remote.connect(_BATTLE_SERVER_URL, ["EBS", _core.user, _core.pass, _core.time, _core.by_session, _ORIGINAL_SERVER_ID, _core.cid, _VERIFY_KEY]);
                };
                _core.remote.showAlert = true;
            };
        }

        public function reqEnterCrossBattle():void
        {
            _core.remote.reqEnterCrossBattle();
        }

        public function reqLeaveCrossBattle():void
        {
            if (_ORIGINAL_SERVER_URL)
            {
                _core.remote.reqLeaveCrossBattle(_ORIGINAL_SERVER_URL);
            }
            else
            {
                trace("original server url is null");
            };
        }

        public function leaveCrossBattle():void
        {
            this.inBattleServer = false;
            _resetCharactorViewData();
            _enableBattleServerUI();
        }

        public function onReqEnterCrossPK(_arg_1:Array):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            if (((_arg_1) && (_arg_1[1] == _core.cid)))
            {
                _ORIGINAL_SERVER_ID = _arg_1[0];
                _VERIFY_KEY = _arg_1[2];
                _local_2 = _arg_1[3];
                _CROSS_SERVER_INDEX = _arg_1[3];
                _BATTLE_SERVER_URL = _arg_1[4].url;
                trace(((((((("server_id=" + _arg_1[0]) + ",cid=") + _arg_1[1]) + ",key=") + _VERIFY_KEY) + ",bs_url=") + _BATTLE_SERVER_URL));
                trace(("cross_server_index = " + _arg_1[3]));
                _local_3 = _core.data.gameData[GamePredef.TBL_MAP][75];
                if (_local_3)
                {
                    _local_4 = UrlUtil.getResUrlNoHash(_local_3.resCode);
                    _local_5 = _core.view.getUI(ViewManager.STAGE_MAIN);
                    if (((_local_5) && (_local_5.mapContainer)))
                    {
                        _local_5.loadHitTestLayer(_local_4);
                        _local_5.mapContainer.loadSpecialMaps(_local_5, _local_3.id);
                        (_local_5 as UIComponent).addEventListener(GameDataEvent.MAP_READY, handleCrossPKMapReady);
                    };
                };
            };
        }

        public function enterCrossBattle():void
        {
            this.inBattleServer = true;
            _resetCharactorViewData();
            _disableBattleServerUI();
        }

        private function _getFreeSpaceHandle(event:Event):void
        {
            this.removeEventListener(EVENT_BATTLE_SERVER_FREE_SPACE, _getFreeSpaceHandle);
            var findNextFunc:Function = function ():void
            {
                _core.remote.findNextWaitChar();
            };
            var handle:Function = function (event:CloseEvent):void
            {
                var onSetCharWaitToAccept:Function;
                if (((event) && (event.detail == Alert.YES)))
                {
                    trace("您得到一个空闲位置, 确定进入..");
                    onSetCharWaitToAccept = function (_arg_1:Boolean):*
                    {
                        if (_arg_1)
                        {
                            _core.remote.call("crossDFPayIn", null, _CROSS_SERVER_INDEX);
                        };
                    };
                    _core.remote.call("setCharWaitToAccept", new Responder(onSetCharWaitToAccept));
                }
                else
                {
                    findNextFunc();
                };
            };
            var _alert:Alert = Alert.show(Language.BATTLE_SERVER_S[2], "", (Alert.YES | Alert.NO), null, handle);
            setTimeout(findNextFunc, 15000);
        }

        private function handleMapReady(_arg_1:Event):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.STAGE_MAIN);
            (_local_2 as UIComponent).removeEventListener(GameDataEvent.MAP_READY, handleMapReady);
            _doConnectBattleServer(60);
        }

        private function _enableBattleServerUI():void
        {
            var _local_2:Object;
            var _local_1:int;
            while (_local_1 < _DISABLE_UI_ARRAY.length)
            {
                _local_2 = _core.view.getUI(_DISABLE_UI_ARRAY[_local_1]);
                if (_local_2)
                {
                    _local_2.enableUI();
                };
                _local_1++;
            };
        }

        private function handleCrossPKMapReady(_arg_1:Event):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.STAGE_MAIN);
            (_local_2 as UIComponent).removeEventListener(GameDataEvent.MAP_READY, handleCrossPKMapReady);
            _doConnectBattleServer(75);
        }

        public function onReqEnterCrossBattle(_arg_1:Array):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            if (((_arg_1) && (_arg_1[1] == _core.cid)))
            {
                _ORIGINAL_SERVER_ID = _arg_1[0];
                _VERIFY_KEY = _arg_1[2];
                _local_2 = _arg_1[3];
                _CROSS_SERVER_INDEX = _arg_1[3];
                _BATTLE_SERVER_URL = _arg_1[4].url;
                trace(((((((("server_id=" + _arg_1[0]) + ",cid=") + _arg_1[1]) + ",key=") + _VERIFY_KEY) + ",bs_url=") + _BATTLE_SERVER_URL));
                trace(("cross_server_index = " + _arg_1[3]));
                _local_3 = _core.data.gameData[GamePredef.TBL_MAP][60];
                if (_local_3)
                {
                    _local_4 = UrlUtil.getResUrlNoHash(_local_3.resCode);
                    _local_5 = _core.view.getUI(ViewManager.STAGE_MAIN);
                    if (((_local_5) && (_local_5.mapContainer)))
                    {
                        _local_5.loadHitTestLayer(_local_4);
                        _local_5.mapContainer.loadSpecialMaps(_local_5, _local_3.id);
                        (_local_5 as UIComponent).addEventListener(GameDataEvent.MAP_READY, handleMapReady);
                    };
                };
            };
        }


    }
}//package com.qeedoo.game.logic

