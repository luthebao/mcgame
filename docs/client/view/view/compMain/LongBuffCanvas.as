// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.LongBuffCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Tile;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.Repeater;
    import flash.utils.Timer;
    import mx.collections.ArrayCollection;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Image;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.vo.BuffVO;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.managers.ToolTipManager;
    import flash.events.TimerEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import mx.binding.RepeatableBinding;
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

    use namespace mx_internal;

    public class LongBuffCanvas extends Tile implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var useMountDress:Number = 0;
        public var _LongBuffCanvas_Tile1:Tile;
        private var _3646rp:Repeater;
        public var _LongBuffCanvas_Image1:Array;
        private var updateMountTimer:Timer = null;
        private var RED_CODE_NAME:String = "BUFF102151";
        private var updateBuffTimer:Timer = null;
        private var _1378119755buffAC:ArrayCollection;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Tile,
            "id":"_LongBuffCanvas_Tile1",
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Repeater,
                        "id":"rp",
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_LongBuffCanvas_Image1",
                                    "events":{
                                        "click":"___LongBuffCanvas_Image1_click",
                                        "mouseOver":"___LongBuffCanvas_Image1_mouseOver"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":16,
                                            "height":16,
                                            "scaleContent":true
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var voList:Object = new Object();
        private var _core:Core = Core.getInstance();
        public var dressTimeObj:Object = new Object();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function LongBuffCanvas()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.verticalGap = 1;
                this.horizontalGap = 1;
            };
            this.width = 200;
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            LongBuffCanvas._watcherSetupUtil = _arg_1;
        }


        public function refreshBuffPerBattle():void
        {
            var _local_1:BuffVO;
            for each (_local_1 in buffAC)
            {
                if (_local_1.type == 1)
                {
                    if (ToolKit.isSmallOrEqual(_local_1.battleLeft, 1))
                    {
                        delBuff(_local_1.id);
                    }
                    else
                    {
                        _local_1.battleLeft--;
                    };
                };
            };
        }

        public function ___LongBuffCanvas_Image1_mouseOver(_arg_1:MouseEvent):void
        {
            timerRepeat(null);
        }

        public function set rp(_arg_1:Repeater):void
        {
            var _local_2:Object = this._3646rp;
            if (_local_2 !== _arg_1)
            {
                this._3646rp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rp", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:LongBuffCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _LongBuffCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_LongBuffCanvasWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        public function delGlobalDoubleExpBuff():void
        {
            var _local_1:BuffVO;
            var _local_2:int;
            for each (_local_1 in buffAC)
            {
                if (_local_1.bid == GamePredef.GLOBAL_DOUBLE_EXP_BID)
                {
                    _local_2 = buffAC.getItemIndex(_local_1);
                    buffAC.removeItemAt(_local_2);
                };
            };
        }

        private function setTimeInfo(_arg_1:Number):String
        {
            var _local_3:Date;
            var _local_2:* = "";
            if (_arg_1 >= 86400)
            {
                _local_2 = (int((_arg_1 / 86400)) + Language.LONGBUFFCANVAS_S[5]);
            }
            else
            {
                _local_3 = new Date(2000, 1, 1, 0, 0, 0, 0);
                _local_3.setTime((_local_3.getTime() + Number((_arg_1 * 1000))));
                _local_2 = (((((_local_3.getHours() + Language.LONGBUFFCANVAS_S[6]) + _local_3.getMinutes()) + Language.LONGBUFFCANVAS_S[7]) + _local_3.getSeconds()) + Language.LONGBUFFCANVAS_S[8]);
            };
            return (_local_2);
        }

        public function initLongBuff(_arg_1:Object):void
        {
            var _local_2:Object;
            ToolTipManager.enabled = true;
            if (buffAC)
            {
                buffAC.removeAll();
            }
            else
            {
                buffAC = new ArrayCollection();
            };
            if (_arg_1)
            {
                for each (_local_2 in _arg_1)
                {
                    if (_local_2)
                    {
                        onAddLongBuff(_local_2);
                    };
                };
            };
            if (!updateBuffTimer)
            {
                updateBuffTimer = new Timer(GamePredef.LONG_BUFF_REFRESH_INTERVAL, 0);
                updateBuffTimer.addEventListener(TimerEvent.TIMER, timerRepeat);
                updateBuffTimer.start();
            };
        }

        public function upLongBuff(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:*;
            var _local_6:Object;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:BuffVO = voList[_arg_1.id];
            if (_local_2)
            {
                _local_3 = buffAC.getItemIndex(_local_2);
                if (_local_3 >= 0)
                {
                    buffAC.removeItemAt(_local_3);
                };
            };
            if (_arg_1.type == 10)
            {
                _local_4 = GameData.d[GamePredef.TBL_BUFF][_arg_1.bid];
                if (_local_4)
                {
                    for each (_local_5 in voList)
                    {
                        if (_local_5.type == 10)
                        {
                            _local_6 = GameData.d[GamePredef.TBL_BUFF][_arg_1.bid];
                            if (_local_4.codeName == _local_6.codeName)
                            {
                                _local_3 = buffAC.getItemIndex(_local_5);
                                if (_local_3 >= 0)
                                {
                                    buffAC.removeItemAt(_local_3);
                                };
                            };
                        };
                    };
                };
            };
            onAddLongBuff(_arg_1);
        }

        [Bindable(event="propertyChange")]
        private function get buffAC():ArrayCollection
        {
            return (this._1378119755buffAC);
        }

        private function doActionOnBuffDel(_arg_1:BuffVO):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:Object = _core.getTitleByBuffId(_arg_1.bid);
            if (((_local_2) && (_core.checkTitleType(_local_2.id, GamePredef.TITLE_KIND_ACTIVE))))
            {
                _core.view.getC(_core.player.id).delActiveTitle(_arg_1.bid);
                return;
            };
            switch (_arg_1.bid)
            {
                case GamePredef.MEET_BATTLE_ON_STILL_BID:
                    if (_core.player != null)
                    {
                        _core.player.normalView.stopCheckBattleTimer();
                    };
                    return;
                case GamePredef.STAR_3_VIP:
                case GamePredef.STAR_4_VIP:
                case GamePredef.STAR_5_VIP:
                case GamePredef.STAR_6_VIP:
                case GamePredef.STAR_7_VIP:
                case GamePredef.BBS_1_VIP:
                case GamePredef.BBS_2_VIP:
                case GamePredef.BBS_3_VIP:
                    _core.view.getC(_core.player.id).delVipTitle();
                    return;
                case GamePredef.DOG_FIGHT_B1:
                case GamePredef.DOG_FIGHT_B2:
                case GamePredef.DOG_FIGHT_B3:
                    _core.view.getC(_core.player.id).delActiveTitle(_arg_1.bid);
                    return;
            };
        }

        public function getNewDelay():Number
        {
            var _local_4:*;
            var _local_5:Number;
            var _local_1:Number = Number.MAX_VALUE;
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = (_local_2 + _core.timeLag);
            if (dressTimeObj)
            {
                for (_local_4 in dressTimeObj)
                {
                    _local_5 = dressTimeObj[_local_4];
                    if (_local_5 > _local_3)
                    {
                        if (_local_5 < _local_1)
                        {
                            _local_1 = _local_5;
                        };
                    };
                };
            };
            if ((_local_1 - _local_3) > ((60 * 60) * 1000))
            {
                return ((60 * 60) * 1000);
            };
            return (_local_1 - _local_3);
        }

        public function addGlobalDoubleExpBuff(_arg_1:Object):void
        {
            var _local_2:BuffVO;
            var _local_4:int;
            if (!_arg_1)
            {
                return;
            };
            for each (_local_2 in buffAC)
            {
                if (_local_2.bid == _arg_1.bid)
                {
                    _local_4 = buffAC.getItemIndex(_local_2);
                    buffAC.removeItemAt(_local_4);
                };
            };
            _arg_1.data = _core.data.getGameData(GamePredef.TBL_BUFF, _arg_1.bid);
            if (!_arg_1.data)
            {
                delBuff(_arg_1.id);
                return;
            };
            var _local_3:BuffVO = new BuffVO();
            _local_3.type = _arg_1.type;
            _local_3.id = _arg_1.id;
            _local_3.bid = _arg_1.bid;
            _local_3.source = ResManager.getIconUrl(_arg_1.data.iconCode);
            _local_3.buff = _arg_1.data.buff;
            if (_arg_1.desc)
            {
                _local_3.toolTip = (((_arg_1.data.name + "\n") + _arg_1.desc) + Language.LONGBUFFCANVAS_S[4]);
            }
            else
            {
                _local_3.toolTip = (((_arg_1.data.name + "\n") + _arg_1.data.description) + Language.LONGBUFFCANVAS_S[4]);
            };
            _local_3.timeAll = _arg_1.timeAll;
            _local_3.addTime = _arg_1.addTime;
            _local_3.timeLeft = _arg_1.timeLeft;
            _local_3.timeLeftStr = setTimeInfo(_local_3.timeLeft);
            _local_3.ineffectiveTime = ((_arg_1.timeLeft * 1000) + new Date().getTime());
            _local_3.needTimer = true;
            voList[_local_3.id] = _local_3;
            buffAC.addItem(_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get rp():Repeater
        {
            return (this._3646rp);
        }

        private function timerRepeat(_arg_1:TimerEvent):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:BuffVO;
            if (buffAC)
            {
                _local_2 = new Date().getTime();
                _local_3 = (_local_2 + _core.timeLag);
                for each (_local_4 in buffAC)
                {
                    if (((_local_4) && (_local_4.needTimer)))
                    {
                        _local_4.timeLeft = ((_local_4.ineffectiveTime - _local_3) / 1000);
                        if (_local_4.timeLeft < 1)
                        {
                            if (_local_4.bid != GamePredef.GLOBAL_DOUBLE_EXP_BID)
                            {
                                _core.remote.delBuffClient(_local_4.id);
                            };
                            doActionOnBuffDel(_local_4);
                            delBuff(_local_4.id);
                        }
                        else
                        {
                            _local_4.timeLeftStr = setTimeInfo(_local_4.timeLeft);
                        };
                    };
                };
            };
        }

        public function updateRound():void
        {
            var _local_1:BuffVO;
            var _local_2:int;
            for each (_local_1 in buffAC)
            {
                if (_local_1.type == 1)
                {
                    _local_1.battleLeft--;
                    if (_local_1.battleLeft <= 0)
                    {
                        _local_2 = buffAC.getItemIndex(_local_1);
                        buffAC.removeItemAt(_local_2);
                    };
                };
            };
        }

        public function clearBuff():void
        {
            buffAC.removeAll();
        }

        private function doActionOnBuffAdd(_arg_1:Object, _arg_2:BuffVO):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            switch (_arg_2.bid)
            {
                case GamePredef.MEET_BATTLE_ON_STILL_BID:
                    if (_arg_1 != null)
                    {
                        _arg_1.startCheckBattleTimer();
                    };
                    return;
                default:
                    return;
            };
        }

        public function onAddLongBuff(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            _arg_1.data = _core.data.getGameData(GamePredef.TBL_BUFF, _arg_1.bid);
            if (!_arg_1.data)
            {
                delBuff(_arg_1.id);
                return;
            };
            var _local_2:BuffVO = new BuffVO();
            _local_2.type = _arg_1.type;
            _local_2.buff = _arg_1.data.buff;
            _local_2.source = ResManager.getIconUrl(_arg_1.data.iconCode);
            _local_2.id = _arg_1.id;
            _local_2.bid = _arg_1.bid;
            voList[_local_2.id] = _local_2;
            if (((_local_2.type == 10) || (_local_2.type == 3)))
            {
                _local_2.toolTip = (((((_arg_1.data.name + Language.LONGBUFFCANVAS_S[0]) + _arg_1.data.level) + "\n") + _arg_1.data.description) + Language.LONGBUFFCANVAS_S[1]);
                _local_2.timeLeft = 0;
                _local_2.timeLeftStr = "";
            }
            else
            {
                _local_2.battleLeft = _arg_1.battleLeft;
                _local_2.timeAll = _arg_1.timeAll;
                _local_2.addTime = _arg_1.addTime;
                _local_2.timeLeft = _arg_1.timeLeft;
                _local_2.ineffectiveTime = _arg_1.ineffectiveTime;
                if (_arg_1.data.codeName != RED_CODE_NAME)
                {
                    _local_2.toolTip = (((((_arg_1.data.name + Language.LONGBUFFCANVAS_S[2]) + _arg_1.data.level) + "\n") + _arg_1.data.description) + ((_local_2.type == 1) ? Language.LONGBUFFCANVAS_S[3] : Language.LONGBUFFCANVAS_S[4]));
                    _local_2.timeLeftStr = setTimeInfo(_local_2.timeLeft);
                }
                else
                {
                    _local_2.toolTip = ((_arg_1.data.name + "\n") + _arg_1.data.description);
                    _local_2.timeLeftStr = "";
                };
                if (((_local_2.type == 2) && (!(_arg_1.data.codeName == RED_CODE_NAME))))
                {
                    _local_2.needTimer = true;
                };
            };
            buffAC.addItem(_local_2);
            if (_core.player != null)
            {
                doActionOnBuffAdd(_core.player.normalView, _local_2);
            };
        }

        private function refreshMountDress(_arg_1:TimerEvent):void
        {
            var _local_4:*;
            var _local_5:Number;
            var _local_6:*;
            var _local_7:Object;
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = (_local_2 + _core.timeLag);
            if (dressTimeObj)
            {
                for (_local_4 in dressTimeObj)
                {
                    _local_5 = dressTimeObj[_local_4];
                    if (_local_5 > 1)
                    {
                        if (_local_5 < _local_3)
                        {
                            if (((useMountDress) && (useMountDress == _local_4)))
                            {
                                _core.player.stopMounting();
                                _local_7 = GameData.d[GamePredef.TBL_MOUNT_DRESS][useMountDress];
                            };
                            _local_6 = _core.view.getUI(ViewManager.PANEL_MOUNT);
                            if (_local_6)
                            {
                                _local_6.updateMountDressList(2, _local_4, _local_5);
                            };
                        };
                    };
                };
            };
            resetMountDressTimer();
        }

        public function initMountTimer(_arg_1:Object):void
        {
            dressTimeObj = _arg_1.dressData;
            useMountDress = Number(_arg_1.useDress);
            resetMountDressTimer();
        }

        public function triggerBuffRelatedAction(_arg_1:Object):void
        {
            var _local_2:BuffVO;
            for each (_local_2 in buffAC)
            {
                doActionOnBuffAdd(_arg_1, _local_2);
            };
        }

        public function containBuff(_arg_1:Number):Boolean
        {
            var _local_2:BuffVO;
            for each (_local_2 in buffAC)
            {
                if (_local_2.bid == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function _LongBuffCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = buffAC;
            _local_1 = rp.currentItem.id;
            _local_1 = rp.currentItem.source;
            _local_1 = (rp.currentItem.toolTip + ((rp.currentItem.type == 1) ? rp.currentItem.battleLeft : rp.currentItem.timeLeftStr));
        }

        public function isBuffOn(_arg_1:Number):Boolean
        {
            var _local_2:*;
            for (_local_2 in buffAC)
            {
                if (buffAC[_local_2].bid == _arg_1)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function addMountDressTimer():void
        {
            var _local_1:*;
            if (((!(updateMountTimer)) && (dressTimeObj)))
            {
                _local_1 = getNewDelay();
                updateMountTimer = new Timer(_local_1, 0);
                updateMountTimer.addEventListener(TimerEvent.TIMER, refreshMountDress);
                updateMountTimer.start();
            };
        }

        private function set buffAC(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1378119755buffAC;
            if (_local_2 !== _arg_1)
            {
                this._1378119755buffAC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buffAC", _local_2, _arg_1));
            };
        }

        private function buffClick(event:Event):void
        {
            var voLocal:BuffVO;
            var id:Number;
            var vo:BuffVO;
            voLocal = null;
            id = Number(event.currentTarget.name);
            if (id == 0)
            {
                return;
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.delBuffClient(id);
                    delBuff(id);
                    doActionOnBuffDel(voLocal);
                };
            };
            for each (vo in buffAC)
            {
                if (vo.id == id)
                {
                    voLocal = vo;
                };
                if (((vo.id == id) && (vo.buff == 0)))
                {
                    _core.sysMsg(Language.LONGBUFFCANVAS_S[10]);
                    return;
                };
            };
            Alert.show(Language.LONGBUFFCANVAS_S[9], "", (Alert.YES | Alert.NO), null, func);
        }

        public function ___LongBuffCanvas_Image1_click(_arg_1:MouseEvent):void
        {
            buffClick(_arg_1);
        }

        private function _LongBuffCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (buffAC);
            }, function (_arg_1:Object):void
            {
                rp.dataProvider = _arg_1;
            }, "rp.dataProvider");
            result[0] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = rp.mx_internal::getItemAt(_arg_2[0]).id;
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _LongBuffCanvas_Image1[_arg_2[0]].name = _arg_1;
            }, "_LongBuffCanvas_Image1.name");
            result[1] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (rp.mx_internal::getItemAt(_arg_2[0]).source);
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _LongBuffCanvas_Image1[_arg_2[0]].source = _arg_1;
            }, "_LongBuffCanvas_Image1.source");
            result[2] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):String
            {
                var _local_3:* = (rp.mx_internal::getItemAt(_arg_2[0]).toolTip + ((rp.mx_internal::getItemAt(_arg_2[0]).type == 1) ? rp.mx_internal::getItemAt(_arg_2[0]).battleLeft : rp.mx_internal::getItemAt(_arg_2[0]).timeLeftStr));
                var _local_4:* = ((_local_3 == undefined) ? null : String(_local_3));
                return (_local_4);
            }, function (_arg_1:String, _arg_2:Array):void
            {
                _LongBuffCanvas_Image1[_arg_2[0]].toolTip = _arg_1;
            }, "_LongBuffCanvas_Image1.toolTip");
            result[3] = binding;
            return (result);
        }

        public function delBuff(_arg_1:Number):void
        {
            var _local_2:BuffVO;
            var _local_3:int;
            for each (_local_2 in buffAC)
            {
                if (_local_2.id == _arg_1)
                {
                    _local_3 = buffAC.getItemIndex(_local_2);
                    buffAC.removeItemAt(_local_3);
                };
            };
        }

        public function resetMountDressTimer():void
        {
            var _local_1:Number;
            if (!updateMountTimer)
            {
                addMountDressTimer();
            }
            else
            {
                _local_1 = getNewDelay();
                updateMountTimer.delay = _local_1;
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

