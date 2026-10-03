// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.ActivityCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.Canvas;
    import flash.utils.Timer;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.core.Application;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.display.MovieClip;
    import mx.collections.Sort;
    import mx.collections.ArrayCollection;
    import mx.collections.SortField;
    import mx.controls.Label;
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

    public class ActivityCanvas extends SimpleCanvas 
    {

        public static const Caidanxia1:Class = ActivityCanvas_Caidanxia1;
        public static const Caidanxia2:Class = ActivityCanvas_Caidanxia2;
        public static const Caidanshang1:Class = ActivityCanvas_Caidanshang1;
        public static const Caidanshang2:Class = ActivityCanvas_Caidanshang2;

        private var count:int = 0;
        private var tab:int = 1;
        private var _1174267086jxhdBtn:Button;
        private var _334507179barDown:Button;
        private var _1396254093barNum:RoundedLabel;
        private var _1416844015iconCavas:Canvas;
        private var _93507086barUp:Button;
        private var _124012844btnChange:Button;
        public var actTimer:Timer;
        private var isInited:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"barUp",
                        "events":{"click":"__barUp_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnActivityPageUp",
                                "x":10,
                                "y":48
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"barNum",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"1",
                                "y":35,
                                "x":0,
                                "width":24.2,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"barDown",
                        "events":{"click":"__barDown_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnActivityPageDown",
                                "x":10,
                                "y":75
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"iconCavas",
                        "stylesFactory":function ():void
                        {
                            this.right = "13";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnChange",
                        "events":{"click":"__btnChange_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":12,
                                "width":12,
                                "height":25,
                                "styleName":"BtnHideButtons",
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"jxhdBtn",
                        "events":{"click":"__jxhdBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":-12,
                                "y":0,
                                "width":48,
                                "height":48,
                                "styleName":"BtnJXHD"
                            });
                        }
                    })]
                });
            }
        });
        private var element:Class = ActivityCanvas_element;
        private var _core:Core = Core.getInstance();
        public var ACTIVITY_STYLE_ARR:Array = ["BtnDailyAct", "BtnMonthAct", "BtnStarAct", "BtnTestAct", "BtnConsumeAct", "BtnDailyGiftAct", "BtnBussinessAct", "BtnWBAct", "BtnLimitAct", "BtnNewServerAct", "BtnNewPlayerAct", "BtnFundAct", "BtnSendAct", "BtnNineBossAct", "BtnCardAct", "BtnWBAct", "BtnAnswerAct", "BtnDuiKangAct", "BtnSoulAct", "BtnVipAct", "BtnAutoTaskAct", "BtnLotteryAct", "BtnJingJiAct", "BtnLuckDrawAct", "BtnZhenFaXiuLian", "BtnXiaLingYing", "Btnshengzhewenzhang", "BtnMiZhen", "BtnZiRanZhiLi", "BtnJinHuaZhiShu", "BtnJiangLiZhaoHui", "BtnKuaFuJingJi", "BtnPKZhengBa", "BtnShuangShiYi", "Wuyouyuanzheng", "Chongwutianfu", "Jubaopen", "Fanpai", "Huanjingxunbao", "Dulayinshi", "Fanpaichuangguan", "Zumaguangchang", "Menghuimoli", "Shilianzhidi", "Xiuluozhanchang", "BtnGrouponAct", "summerGames", "ShiJieBei", "BtnAutoTaskActNew", "Mowubiji", "wawajiicon", "shenmironglu", "sirendinggou", "manjiujian", "rebateEveryday", "tripleTownBtn", "monthWelfare", "heiyaoshiZhen", "PetRealSoul", "mijinglixian", "BloodyBattle", "WarSprite", "happyFrontLine", "bazhounianqing", "monsterHeart", "dailySignInAct", "huannengshuijin", "stoneToGoldAct", "qiling", "mojinAct", "laodonggr", "baoshijuling", "tanxianzhexunzhang", "summerGames", "moliyixia", "diaokekongjian", "pkgame", "PetPKBut", "ConsumeNotice", "xiaochudasai", "texunkecheng", "huanmotaxiulian", "moyintuce", "mengchongzhidou"];
        public var ACTIVITY_STATE:Array = [Language.ACTIVITY_CANVAS[1], Language.ACTIVITY_CANVAS[0]];
        private var activityArr:Array = new Array();
        private var activityDict:Dictionary = new Dictionary();

        public function ActivityCanvas()
        {
            mx_internal::_document = this;
            this.width = 450;
            this.cacheAsBitmap = true;
        }

        public function fixActPosition(_arg_1:int, _arg_2:int):void
        {
            if (!activityDict[_arg_1])
            {
                return;
            };
            if (!canIndexShow(_arg_2))
            {
                return;
            };
            activityDict[_arg_1].button.x = getX(_arg_2);
            activityDict[_arg_1].button.y = getY(_arg_2);
            if (activityDict[_arg_1].labelText)
            {
                activityDict[_arg_1].labelText.x = (activityDict[_arg_1].button.x + 4);
                activityDict[_arg_1].labelText.y = (activityDict[_arg_1].button.y + 48);
            };
        }

        public function canIndexShow(_arg_1:int):Boolean
        {
            if (_arg_1 < 0)
            {
                return (false);
            };
            if (((_arg_1 >= ((tab - 1) * 8)) && (_arg_1 <= (((tab + 1) * 8) - 1))))
            {
                return (true);
            };
            return (false);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get iconCavas():Canvas
        {
            return (this._1416844015iconCavas);
        }

        public function fix(_arg_1:Object):void
        {
            var _local_5:int;
            if (activityArr.length <= 0)
            {
                return;
            };
            count = activityArr.length;
            var _local_2:int = getTabNum(count);
            if (tab > _local_2)
            {
                tab = (((tab - 1) < 1) ? _local_2 : (tab - 1));
            };
            var _local_3:int;
            var _local_4:int;
            this.iconCavas.removeAllChildren();
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                activityArr[_local_5].sortType = _arg_1[activityArr[_local_5].id].sortType;
                _local_5++;
            };
            activityArr.sort(sortByType);
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                if (canIndexShow(_local_5))
                {
                    _local_3 = getX(_local_5);
                    _local_4 = getY(_local_5);
                    activityArr[_local_5].button.x = _local_3;
                    activityArr[_local_5].button.y = _local_4;
                    this.iconCavas.addChild(activityArr[_local_5].button);
                    if (activityArr[_local_5].labelText)
                    {
                        activityArr[_local_5].labelText.x = (_local_3 + 4);
                        activityArr[_local_5].labelText.y = (_local_4 + 48);
                        this.iconCavas.addChild(activityArr[_local_5].labelText);
                    };
                };
                _local_5++;
            };
            count = activityArr.length;
            if (count > 8)
            {
                btnChange.y = 37;
            }
            else
            {
                btnChange.y = 12;
            };
            barNum.text = tab.toString();
            if (_local_2 == 1)
            {
                barDown.visible = false;
                barUp.visible = false;
                barNum.visible = false;
            }
            else
            {
                barNum.visible = true;
                if (tab == 1)
                {
                    barUp.visible = false;
                }
                else
                {
                    barUp.visible = true;
                };
                if (tab == _local_2)
                {
                    barDown.visible = false;
                }
                else
                {
                    barDown.visible = true;
                };
            };
            var _local_6:int = ((tab - 1) * 8);
            var _local_7:int = (((tab + 1) * 8) - 1);
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                if (((_local_5 < _local_6) && (activityArr[_local_5].circle)))
                {
                    barUp.setStyle("upSkin", Caidanshang2);
                    break;
                };
                _local_5++;
            };
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                if (((_local_5 > _local_7) && (activityArr[_local_5].circle)))
                {
                    barDown.setStyle("upSkin", Caidanxia2);
                    return;
                };
                _local_5++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get barUp():Button
        {
            return (this._93507086barUp);
        }

        public function getIconIndex(_arg_1:int):int
        {
            if (((!(activityDict[_arg_1])) || (activityArr.indexOf(activityDict[_arg_1]) < 0)))
            {
                return (-1);
            };
            return (activityArr.indexOf(activityDict[_arg_1]));
        }

        public function getTabNum(_arg_1:int):int
        {
            if (_arg_1 <= 16)
            {
                return (1);
            };
            return (int(((_arg_1 - 17) / 8)) + 2);
        }

        public function positionActList2():void
        {
            var _local_4:*;
            if (activityArr.length <= 0)
            {
                return;
            };
            var _local_1:int;
            var _local_2:int;
            this.iconCavas.removeAllChildren();
            activityArr.sort(sortByType);
            var _local_3:int;
            for (_local_4 in activityDict)
            {
                fixActPosition(activityDict[_local_4].id, _local_3);
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnChange():Button
        {
            return (this._124012844btnChange);
        }

        [Bindable(event="propertyChange")]
        public function get jxhdBtn():Button
        {
            return (this._1174267086jxhdBtn);
        }

        public function set barUp(_arg_1:Button):void
        {
            var _local_2:Object = this._93507086barUp;
            if (_local_2 !== _arg_1)
            {
                this._93507086barUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barUp", _local_2, _arg_1));
            };
        }

        public function __barUp_click(_arg_1:MouseEvent):void
        {
            activateIconUp();
        }

        public function activityClick(event:Event):void
        {
            var view:Object;
            var func:Function;
            var p:Object;
            var id:Number = Number(event.currentTarget.id);
            switch (id)
            {
                case GamePredef.DAILY_ACTIVITY:
                    _core.view.show(ViewManager.DAILY_ACTIVITY);
                    break;
                case GamePredef.MONTH_WELFARE_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_WELFARE);
                    if (((view) && (view.isInited)))
                    {
                        view.init();
                        view.visible = true;
                    }
                    else
                    {
                        _core.view.show(ViewManager.PANEL_WELFARE);
                    };
                    break;
                case GamePredef.STAR_PANEL:
                    _core.battleMap.initBattleMap();
                    break;
                case GamePredef.NINE_BOSS_PANEL:
                    view = _core.view.getUI(ViewManager.NINE_BOSS_PANEL);
                    if (view)
                    {
                        view.initNineBossPanel();
                    }
                    else
                    {
                        _core.view.show(ViewManager.NINE_BOSS_PANEL);
                    };
                    break;
                case GamePredef.INTERNAL_ACT_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_NEWSERVER);
                    if (view)
                    {
                        view.init();
                        view.visible = true;
                    }
                    else
                    {
                        _core.view.show(ViewManager.PANEL_NEWSERVER);
                    };
                    break;
                case GamePredef.SEND_COMBINE_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_SENDCOMBINE);
                    if (view)
                    {
                        view.init();
                        view.visible = true;
                    };
                    break;
                case GamePredef.CARD_GAME_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_CARDGAME);
                    if (view)
                    {
                        view.initPanel();
                    };
                    break;
                case GamePredef.WB_BOSS_PANEL:
                    _core.remote.call("canEnterWbMap", null, _core.player.id);
                    break;
                case GamePredef.ANSWER_PANEL:
                    if (((activityDict[id]) && (activityDict[id].state == 1)))
                    {
                        _core.view.getUI(ViewManager.PANEL_QUESTIONING).viewClick();
                    }
                    else
                    {
                        _core.remote.call("canQuest", new Responder(onCanQuest), _core.player.id);
                    };
                    break;
                case GamePredef.DONGXUAN_PANEL:
                    if (((activityDict[id]) && (activityDict[id].state == 1)))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                (((_core) && (_core.player)) && (_core.remote.call("dxdRegister", null, _core.player.id, true)));
                            }
                            else
                            {
                                (((_core) && (_core.player)) && (_core.remote.call("dxdRegister", null, _core.player.id, false)));
                            };
                        };
                        Alert.show(Language.AWARD_WARN_CANVAS_S[0], "", (Alert.YES | Alert.NO), (Application.application as Sprite), func);
                    }
                    else
                    {
                        _core.remote.dxdGetIn();
                    };
                    break;
                case GamePredef.VIP_SHOP_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_VIP_SHOP);
                    if (view)
                    {
                        view.initPanel();
                        view.visible = true;
                    };
                    break;
                case GamePredef.PET_SOUL_PANEL:
                    _core.view.show(ViewManager.POPU_SOUL_PRODUCT);
                    break;
                case GamePredef.AUTO_TASK_PANEL:
                case GamePredef.AUTO_TASK_PANEL_NEW:
                    view = _core.view.getUI(ViewManager.PANEL_AUTOTASK);
                    if (view)
                    {
                        view.clickTaskSweep();
                    };
                    break;
                case GamePredef.LOTTERY_ACT_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_LOTTERY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.SIGN_IN_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_SIGN_IN);
                    if (view)
                    {
                        view.init();
                        view.visible = true;
                    };
                    break;
                case GamePredef.PVP_ROOM_PANEL:
                    func = function (_arg_1:Boolean):void
                    {
                        var _local_2:Object;
                        if (!_arg_1)
                        {
                            return;
                        };
                        if ((((_core.player) && (_core.player.level)) && (_core.player.level >= 50)))
                        {
                            _local_2 = _core.view.getUI(ViewManager.PANEL_PVP_ROOM_LIST);
                            if (_local_2)
                            {
                                _local_2.initRoomListPanel();
                            };
                        }
                        else
                        {
                            _core.sysMidNote(Language.PVP_ROOM_P[20]);
                        };
                    };
                    _core.remote.call("checkPVPLine", new Responder(func));
                    break;
                case GamePredef.LUCK_DRAW_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_LUCK_DRAW);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MAGIC_ARRAY_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_MAGIC_ARRAY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.SMALL_GAME_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_Small_Game);
                    if (view)
                    {
                        view.initPanel();
                        view.visible = true;
                    };
                    break;
                case GamePredef.MEDAL_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_MEDAL);
                    if (view)
                    {
                        view.initView();
                    };
                    break;
                case GamePredef.MAZE_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_MAZE);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.ASTROLOGIC_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_ASTROLOGIC);
                    if (view)
                    {
                        view.visible = true;
                    };
                    break;
                case GamePredef.HANDBOOK_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_PET_HANDBOOK);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.FINDBACK_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_FINDBACK);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.CROSSPK_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_CROSS_FIGHT);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.TEAM_CROSSPK_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_CROSS_TEAM_FIGHT);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.DOUBLE_ELEVEN_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_DOUBLE_ELEVEN);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.CROSS_CONTENTION_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_TOTAL);
                    if (view)
                    {
                        view.visible = true;
                    };
                    break;
                case GamePredef.PET_TALENT_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_PET_TALENT);
                    if (view)
                    {
                        view.initTalentDataByClient();
                    };
                    break;
                case GamePredef.TREASURE_BOWL_PANEL:
                    view = _core.view.getUI(ViewManager.PANEL_TREASURE_BOWL);
                    if (view)
                    {
                        view.initTreasurePanel();
                    };
                    break;
                case GamePredef.EXTRACT_CARD_ARCIVITY:
                    view = _core.view.getUI(ViewManager.PANEL_EXTRACT_CARD_ACTIVITY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.TREASURE_HUNT:
                    _core.remote.call("canEnterTreasureHunt", null);
                    break;
                case GamePredef.STONE_SEAL:
                    view = _core.view.getUI(ViewManager.PANEL_STONE_SEAL);
                    if (view)
                    {
                        view.showPanel(false);
                    };
                    break;
                case GamePredef.FLOP_POSS:
                    view = _core.view.getUI(ViewManager.PANEL_FLOP_PASS);
                    if (view)
                    {
                        view.initFlopPassPanel();
                    };
                    break;
                case GamePredef.HULA:
                    view = _core.view.getUI(ViewManager.PANEL_HULA);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.RETURN_REWARD_ACTIVITY:
                    view = _core.view.getUI(ViewManager.PANEL_RETURN_REWARD);
                    if (view)
                    {
                        view.show();
                    };
                    break;
                case GamePredef.TRAILS:
                    view = _core.view.getUI(ViewManager.PANEL_TRIALS);
                    if (view)
                    {
                        view.trialsPanelInit();
                    };
                    break;
                case GamePredef.DOTA:
                    view = _core.view.getUI(ViewManager.PANEL_DOTA);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.GROUPON:
                    view = _core.view.getUI(ViewManager.PANEL_GROUPON);
                    ((view) && (view.show()));
                    break;
                case GamePredef.SUMMER_GAMES:
                    view = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.WORLD_CUP:
                    view = _core.view.getUI(ViewManager.PANEL_WORLD_CUP);
                    if (view)
                    {
                        view.initWorldCupPanel();
                    };
                    break;
                case GamePredef.BOSS_DAILY:
                    view = _core.view.getUI(ViewManager.PANEL_BOSS_DAILY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.WAWA_GAME:
                    view = _core.view.getUI(ViewManager.PANEL_WAWA_GAME);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MYSTERY_FURNACE:
                    view = _core.view.getUI(ViewManager.PANEL_MYSTERY_FURNACE);
                    ((view) && (view.show()));
                    break;
                case GamePredef.JUHUASUAN:
                    view = _core.view.getUI(ViewManager.PANEL_JUHUASUAN);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MANJIUJIAN:
                    view = _core.view.getUI(ViewManager.PANEL_MANJIUJIAN);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.REBATEEVERYDAY:
                    view = _core.view.getUI(ViewManager.PANEL_REBATEEVERYDAY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.TRIPLE_TOWN:
                    view = _core.view.getUI(ViewManager.PANEL_TRIPLE_TOWN);
                    ((view) && (view.show()));
                    break;
                case GamePredef.MONTHWELFARE:
                    view = _core.view.getUI(ViewManager.PANEL_MONTHWELFARE);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.HEIYAOSHIZHEN:
                    view = _core.view.getUI(ViewManager.PANEL_HEIYAOSHI);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.PETREALSOUL:
                    view = _core.view.getUI(ViewManager.PANEL_PET_REAl_SOUL);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.SECRET_TREASUREHUNT:
                    view = _core.view.getUI(ViewManager.PANEL_SECRET_TREASUREHUNT);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.BLOODY_BATTLE:
                    _core.remote.call("enterBloodyBattle", null);
                    break;
                case GamePredef.WAR_SPRITE:
                    view = _core.view.getUI(ViewManager.PANEL_WAR_BATTLE);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.ANNIVERSARY:
                    view = _core.view.getUI(ViewManager.PANEL_ANNIVERSARY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.LAODONGGR:
                    view = _core.view.getUI(ViewManager.PANEL_ANNIVERSARY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MONSTERHEART:
                    view = _core.view.getUI(ViewManager.PANEL_MONSTERHEART);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.HAPPYFRONTLINE:
                    view = _core.view.getUI(ViewManager.PANEL_HAPPYFRONTLINE);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.DAILYSIGNINACT:
                    view = _core.view.getUI(ViewManager.PANEL_DAILYSIGNINACT);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MAGICCRYSTAL:
                    view = _core.view.getUI(ViewManager.PANEL_MAGICCRYSTAL);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.STONETOGOLDACT:
                    view = _core.view.getUI(ViewManager.PANEL_STONETOGOLDACT);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.QILING:
                    view = _core.view.getUI(ViewManager.PANEL_QILING);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MOJINACT:
                    view = _core.view.getUI(ViewManager.PANEL_MOJINACT);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.PETSTONE:
                    view = _core.view.getUI(ViewManager.PANEL_PET_STONE);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.EXPLORERMEDAL:
                    view = _core.view.getUI(ViewManager.PANEL_EXPLORER_MEDAL);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.HUANLESHIGUANG:
                    view = _core.view.getUI(ViewManager.PANEL_ANNIVERSARY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MOLIYIXIA:
                    view = _core.view.getUI(ViewManager.PANEL_SHOWTIME);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.DIAOKEKONGJIAN:
                    view = _core.view.getUI(ViewManager.PANEL_PET_PVE);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.PKGAME:
                    view = _core.view.getUI(ViewManager.PANEL_PK_GAME);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.PETARENAACTIVITY:
                    if (((_core.player) && (_core.player.level >= 35)))
                    {
                        p = _core.view.getUI(ViewManager.PANEL_PET_ARENA_ACTIVITY);
                        if (((p.initialized) && (!(p.first))))
                        {
                            if (!p.visible)
                            {
                                if (((!(_core.player.petArenaAct)) || (!(_core.player.petArenaAct.actinfo))))
                                {
                                    _core.remote.call("getPetArenaActivityInfo", null);
                                };
                                p.show();
                            }
                            else
                            {
                                p.hide();
                            };
                        }
                        else
                        {
                            _core.remote.call("getPetArenaActivityInfo", null);
                            _core.remote.call("getPetArenaDataActivity", null, true);
                        };
                    }
                    else
                    {
                        Alert.show(Language.MINIMAPCANVAS_S[39]);
                    };
                    break;
                case GamePredef.CONSUMENOTICE:
                    view = _core.view.getUI(ViewManager.PANEL_CONSUME_NOTICE_ACTIVITY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.XIAOCHUSDASAI:
                    view = _core.view.getUI(ViewManager.PANEL_XIAOCHUSDASAI_ACTIVITY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.TEXUNKECHENG:
                    view = _core.view.getUI(ViewManager.PANEL_TEXUNKECHENG_ACTIVITY);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.HUANMOTAXIULIAN:
                    view = _core.view.getUI(ViewManager.PANEL_XIULIAN_PANEL);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MOYINTUCE:
                    view = _core.view.getUI(ViewManager.PANEL_MOYINTUCE_PANEL);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
                case GamePredef.MCZD:
                    view = _core.view.getUI(ViewManager.PANEL_MCZD);
                    if (view)
                    {
                        view.showPanel();
                    };
                    break;
            };
            deleteCircle(id);
        }

        public function set iconCavas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1416844015iconCavas;
            if (_local_2 !== _arg_1)
            {
                this._1416844015iconCavas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconCavas", _local_2, _arg_1));
            };
        }

        public function fix2(_arg_1:int):void
        {
            var _local_5:int;
            if (activityArr.length <= 0)
            {
                return;
            };
            count = activityArr.length;
            var _local_2:int = getTabNum(count);
            if (tab > _local_2)
            {
                tab = (((tab - 1) < 1) ? _local_2 : (tab - 1));
            };
            var _local_3:int;
            var _local_4:int;
            this.iconCavas.removeAllChildren();
            activityArr.sort(sortByType);
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                if (canIndexShow(_local_5))
                {
                    _local_3 = getX(_local_5);
                    _local_4 = getY(_local_5);
                    activityArr[_local_5].button.x = _local_3;
                    activityArr[_local_5].button.y = _local_4;
                    this.iconCavas.addChild(activityArr[_local_5].button);
                    if (activityArr[_local_5].labelText)
                    {
                        activityArr[_local_5].labelText.x = (_local_3 + 4);
                        activityArr[_local_5].labelText.y = (_local_4 + 48);
                        this.iconCavas.addChild(activityArr[_local_5].labelText);
                    };
                };
                _local_5++;
            };
            count = activityArr.length;
            if (count > 8)
            {
                btnChange.y = 37;
            }
            else
            {
                btnChange.y = 12;
            };
            barNum.text = tab.toString();
            if (_local_2 == 1)
            {
                barDown.visible = false;
                barUp.visible = false;
                barNum.visible = false;
            }
            else
            {
                barNum.visible = true;
                if (tab == 1)
                {
                    barUp.visible = false;
                }
                else
                {
                    barUp.visible = true;
                };
                if (tab == _local_2)
                {
                    barDown.visible = false;
                }
                else
                {
                    barDown.visible = true;
                };
            };
            var _local_6:int = ((tab - 1) * 8);
            var _local_7:int = (((tab + 1) * 8) - 1);
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                if ((((_local_5 < _local_6) && (activityArr[_local_5].circle)) && (_arg_1 > 1)))
                {
                    _core.sysMsg(Language.ACTIVITY_CANVAS[6]);
                    barUp.setStyle("upSkin", Caidanshang2);
                    break;
                };
                _local_5++;
            };
            _local_5 = 0;
            while (_local_5 < activityArr.length)
            {
                if ((((_local_5 > _local_7) && (activityArr[_local_5].circle)) && (_arg_1 > 1)))
                {
                    barDown.setStyle("upSkin", Caidanxia2);
                    _core.sysMsg(Language.ACTIVITY_CANVAS[6]);
                    return;
                };
                _local_5++;
            };
        }

        public function __barDown_click(_arg_1:MouseEvent):void
        {
            activateIconDown();
        }

        public function getX(_arg_1:int):int
        {
            return (350 - ((_arg_1 % 8) * 50));
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            _core.view.getUI(ViewManager.DAILY_ACTIVITY).initPenalConfig();
        }

        public function activateIconUp():void
        {
            barUp.setStyle("upSkin", Caidanshang1);
            var _local_1:int = getTabNum(activityArr.length);
            tab = (((tab - 1) < 1) ? _local_1 : (tab - 1));
            var _local_2:int;
            var _local_3:int;
            this.iconCavas.removeAllChildren();
            var _local_4:int;
            while (_local_4 < activityArr.length)
            {
                if (canIndexShow(_local_4))
                {
                    _local_2 = getX(_local_4);
                    _local_3 = getY(_local_4);
                    activityArr[_local_4].button.x = _local_2;
                    activityArr[_local_4].button.y = _local_3;
                    this.iconCavas.addChild(activityArr[_local_4].button);
                    if (activityArr[_local_4].labelText)
                    {
                        activityArr[_local_4].labelText.x = (_local_2 + 4);
                        activityArr[_local_4].labelText.y = (_local_3 + 48);
                        this.iconCavas.addChild(activityArr[_local_4].labelText);
                    };
                };
                _local_4++;
            };
            count = activityArr.length;
            if (count > 8)
            {
                btnChange.y = 37;
            }
            else
            {
                btnChange.y = 12;
            };
            barNum.text = tab.toString();
            if (tab == 1)
            {
                barUp.visible = false;
            };
            if (tab != _local_1)
            {
                barDown.visible = true;
            };
        }

        public function addJXHDCircle():void
        {
            var _local_1:MovieClip = new ((element as Class))();
            _local_1.x = -7;
            _local_1.y = -5;
            jxhdBtn.addChild(_local_1);
        }

        public function set barDown(_arg_1:Button):void
        {
            var _local_2:Object = this._334507179barDown;
            if (_local_2 !== _arg_1)
            {
                this._334507179barDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barDown", _local_2, _arg_1));
            };
        }

        public function activateIconDown():void
        {
            barDown.setStyle("upSkin", Caidanxia1);
            var _local_1:int = getTabNum(activityArr.length);
            tab = (((tab + 1) > _local_1) ? 1 : (tab + 1));
            var _local_2:int;
            var _local_3:int;
            this.iconCavas.removeAllChildren();
            var _local_4:int;
            while (_local_4 < activityArr.length)
            {
                if (canIndexShow(_local_4))
                {
                    _local_2 = getX(_local_4);
                    _local_3 = getY(_local_4);
                    activityArr[_local_4].button.x = _local_2;
                    activityArr[_local_4].button.y = _local_3;
                    this.iconCavas.addChild(activityArr[_local_4].button);
                    if (activityArr[_local_4].labelText)
                    {
                        activityArr[_local_4].labelText.x = (_local_2 + 4);
                        activityArr[_local_4].labelText.y = (_local_3 + 48);
                        this.iconCavas.addChild(activityArr[_local_4].labelText);
                    };
                };
                _local_4++;
            };
            count = activityArr.length;
            if (count > 8)
            {
                btnChange.y = 37;
            }
            else
            {
                btnChange.y = 12;
            };
            barNum.text = tab.toString();
            if (tab == _local_1)
            {
                barDown.visible = false;
            };
            if (_local_1 != 1)
            {
                barUp.visible = true;
            };
        }

        public function initView(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in _arg_1)
            {
                if (_arg_1[_local_2])
                {
                    if (_arg_1[_local_2].type == 3)
                    {
                        changeView(_arg_1[_local_2]);
                    }
                    else
                    {
                        if (_arg_1[_local_2].type == 2)
                        {
                            if ((((_core) && (_core.player)) && (_core.player.level >= _arg_1[_local_2].flag)))
                            {
                                showActivityInfo(_arg_1[_local_2].id);
                            }
                            else
                            {
                                deleteActivity(_arg_1[_local_2].id);
                            };
                            continue;
                        };
                        if (_arg_1[_local_2].type == 4)
                        {
                            if (((((_core) && (_core.player)) && (_core.player.expRe)) && (Number(_core.player.expRe) > 0)))
                            {
                                showActivityInfo(_arg_1[_local_2].id);
                            }
                            else
                            {
                                deleteActivity(_arg_1[_local_2].id);
                            };
                            continue;
                        };
                        if (_arg_1[_local_2].flag)
                        {
                            showActivityInfo(_arg_1[_local_2].id);
                        }
                        else
                        {
                            deleteActivity(_arg_1[_local_2].id);
                        };
                    };
                }
                else
                {
                    deleteActivity(_arg_1[_local_2].id);
                };
            };
            if (!isInited)
            {
                isInited = true;
            };
            positionActList(_arg_1);
            fix(_arg_1);
        }

        private function showJXHD():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_JXHD);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        public function addCircle(_arg_1:int):void
        {
            var _local_2:MovieClip;
            if (activityDict[_arg_1].button)
            {
                if (activityDict[_arg_1].circle)
                {
                    return;
                };
                _local_2 = new ((element as Class))();
                _local_2.x = -7;
                _local_2.y = -5;
                activityDict[_arg_1].circle = _local_2;
                activityDict[_arg_1].button.addChild(_local_2);
            };
        }

        public function deleteActivity(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            if (((activityDict[_arg_1]) && (activityDict[_arg_1].button)))
            {
                if (activityDict[_arg_1].button.parent == this.iconCavas)
                {
                    this.iconCavas.removeChild(activityDict[_arg_1].button);
                };
                if (((activityDict[_arg_1].labelText) && (activityDict[_arg_1].labelText.parent == this.iconCavas)))
                {
                    this.iconCavas.removeChild(activityDict[_arg_1].labelText);
                };
                activityArr.splice(activityArr.indexOf(activityDict[_arg_1]), 1);
                delete activityDict[_arg_1];
                _local_2 = 0;
                _local_3 = 0;
                this.iconCavas.removeAllChildren();
                _local_4 = 0;
                while (_local_4 < activityArr.length)
                {
                    if (canShow(_local_4))
                    {
                        _local_2 = getX(_local_4);
                        _local_3 = getY(_local_4);
                        activityArr[_local_4].button.x = _local_2;
                        activityArr[_local_4].button.y = _local_3;
                        this.iconCavas.addChild(activityArr[_local_4].button);
                        if (activityArr[_local_4].labelText)
                        {
                            activityArr[_local_4].labelText.x = (_local_2 + 4);
                            activityArr[_local_4].labelText.y = (_local_3 + 48);
                            this.iconCavas.addChild(activityArr[_local_4].labelText);
                        };
                    };
                    _local_4++;
                };
                count = activityArr.length;
                if (count > 8)
                {
                    btnChange.y = 37;
                }
                else
                {
                    btnChange.y = 12;
                };
            };
            positionActList2();
            fix2(0);
        }

        public function deleteCircle(_arg_1:int):void
        {
            if ((((activityDict[_arg_1]) && (activityDict[_arg_1].button)) && (activityDict[_arg_1].circle)))
            {
                activityDict[_arg_1].button.removeChild(activityDict[_arg_1].circle);
                delete activityDict[_arg_1].circle;
            };
        }

        public function set btnChange(_arg_1:Button):void
        {
            var _local_2:Object = this._124012844btnChange;
            if (_local_2 !== _arg_1)
            {
                this._124012844btnChange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnChange", _local_2, _arg_1));
            };
        }

        public function __jxhdBtn_click(_arg_1:MouseEvent):void
        {
            showJXHD();
        }

        public function __btnChange_click(_arg_1:MouseEvent):void
        {
            change_canFun();
        }

        public function set barNum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1396254093barNum;
            if (_local_2 !== _arg_1)
            {
                this._1396254093barNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "barNum", _local_2, _arg_1));
            };
        }

        public function positionActList(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Sort;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            for (_local_3 in _arg_1)
            {
                _local_7 = _arg_1[_local_3];
                _local_7.sort1 = _arg_1[_local_3].sortType;
                _local_7.sort2 = _arg_1[_local_3].id;
                _local_2.addItem(_local_7);
            };
            _local_4 = new Sort();
            _local_4.fields = [new SortField("sort1", true, false, true), new SortField("sort2", true, false, true)];
            _local_2.sort = _local_4;
            _local_2.refresh();
            _local_5 = 0;
            _local_6 = 0;
            while (_local_6 < _local_2.length)
            {
                if (activityDict[_local_2[_local_6].id])
                {
                    fixActPosition(_local_2[_local_6].id, _local_5);
                    _local_5++;
                };
                _local_6++;
            };
        }

        public function set jxhdBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1174267086jxhdBtn;
            if (_local_2 !== _arg_1)
            {
                this._1174267086jxhdBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jxhdBtn", _local_2, _arg_1));
            };
        }

        public function canShow(_arg_1:int):Boolean
        {
            var _local_2:int = getIconIndex(_arg_1);
            if (_local_2 < 0)
            {
                return (false);
            };
            if (((_local_2 >= ((tab - 1) * 8)) && (_local_2 <= (((tab + 1) * 8) - 1))))
            {
                return (true);
            };
            return (false);
        }

        private function sortByType(_arg_1:Object, _arg_2:Object):Number
        {
            if (_arg_1.sortType == _arg_2.sortType)
            {
                if (_arg_1.id > _arg_2.id)
                {
                    return (1);
                };
                if (_arg_1.id < _arg_2.id)
                {
                    return (-1);
                };
                return (0);
            };
            if (_arg_1.sortType > _arg_2.sortType)
            {
                return (1);
            };
            return (-1);
        }

        public function getY(_arg_1:int):int
        {
            if (((_arg_1 < (tab * 8)) && (_arg_1 >= ((tab - 1) * 8))))
            {
                return (0);
            };
            if (((_arg_1 >= (tab * 8)) && (_arg_1 < ((tab + 1) * 8))))
            {
                return (50);
            };
            return (0);
        }

        public function onCanQuest(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _core.view.show(ViewManager.PANEL_QUESTIONING);
            }
            else
            {
                Alert.show(Language.ACTIVITY_CANVAS[3], "", Alert.YES, null, null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get barNum():RoundedLabel
        {
            return (this._1396254093barNum);
        }

        public function changeView(_arg_1:Object):*
        {
            if (!_arg_1)
            {
                return;
            };
            switch (_arg_1.flag)
            {
                case 0:
                    deleteActivity(_arg_1.id);
                    return;
                case 1:
                    showActivityInfo(_arg_1.id, 1, _arg_1.sortType);
                    return;
                case 2:
                    showActivityInfo(_arg_1.id, 2, _arg_1.sortType);
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get barDown():Button
        {
            return (this._334507179barDown);
        }

        public function showActivityInfo(_arg_1:int, _arg_2:int=-1, _arg_3:int=-1):void
        {
            var _local_6:Label;
            if (activityDict[_arg_1])
            {
                if (_arg_2 > 0)
                {
                    activityDict[_arg_1].state = _arg_2;
                    if (activityDict[_arg_1].labelText)
                    {
                        activityDict[_arg_1].labelText.text = ACTIVITY_STATE[(_arg_2 - 1)];
                    }
                    else
                    {
                        _local_6 = new Label();
                        _local_6.text = ACTIVITY_STATE[(_arg_2 - 1)];
                        _local_6.setStyle("color", "#FF0000");
                        if (canShow(_arg_1))
                        {
                            if (!activityDict[_arg_1].button.parent)
                            {
                                activityDict[_arg_1].button.x = getX(getIconIndex(_arg_1));
                                activityDict[_arg_1].button.y = getY(getIconIndex(_arg_1));
                                this.iconCavas.addChild(activityDict[_arg_1].button);
                            };
                            _local_6.x = (activityDict[_arg_1].button.x + 4);
                            _local_6.y = (activityDict[_arg_1].button.y + 48);
                            activityDict[_arg_1].labelText = _local_6;
                            this.iconCavas.addChild(_local_6);
                        };
                    };
                };
                if (canShow(_arg_1))
                {
                    if (!activityDict[_arg_1].button.parent)
                    {
                        activityDict[_arg_1].button.x = getX(getIconIndex(_arg_1));
                        activityDict[_arg_1].button.y = getY(getIconIndex(_arg_1));
                        this.iconCavas.addChild(activityDict[_arg_1].button);
                    };
                };
                return;
            };
            var _local_4:Button = new Button();
            _local_4.id = String(_arg_1);
            _local_4.styleName = ACTIVITY_STYLE_ARR[_arg_1];
            _local_4.addEventListener(MouseEvent.CLICK, activityClick);
            _local_4.width = 48;
            _local_4.height = 48;
            _local_4.x = getX(count);
            _local_4.y = getY(count);
            count++;
            if (count > 8)
            {
                btnChange.y = 37;
            }
            else
            {
                btnChange.y = 12;
            };
            if (_arg_2 > 0)
            {
                _local_6 = new Label();
                _local_6.text = ACTIVITY_STATE[(_arg_2 - 1)];
                _local_6.setStyle("color", "#FF0000");
                _local_6.x = (_local_4.x + 4);
                _local_6.y = (_local_4.y + 48);
                if (((count >= ((tab - 1) * 8)) && (count <= (((tab + 1) * 8) - 1))))
                {
                    this.iconCavas.addChild(_local_6);
                };
            };
            var _local_5:Object = new Object();
            _local_5.button = _local_4;
            _local_5.id = _arg_1;
            _local_5.labelText = _local_6;
            _local_5.state = _arg_2;
            if (((_arg_3) && (!(_arg_3 == -1))))
            {
                _local_5.sortType = _arg_3;
            };
            activityDict[_local_5.id] = _local_5;
            activityArr.push(_local_5);
            if (((count >= ((tab - 1) * 8)) && (count <= (((tab + 1) * 8) - 1))))
            {
                this.iconCavas.addChild(_local_4);
            };
            if (isInited)
            {
                addCircle(_arg_1);
            };
            if (_arg_3 != -1)
            {
                positionActList2();
                fix2(2);
            };
        }

        public function change_canFun():void
        {
            if (iconCavas.visible)
            {
                iconCavas.visible = false;
                barDown.visible = false;
                barNum.visible = false;
                barUp.visible = false;
                jxhdBtn.visible = false;
                btnChange.styleName = "BtnShowButtons";
            }
            else
            {
                iconCavas.visible = true;
                barDown.visible = true;
                barNum.visible = true;
                barUp.visible = true;
                jxhdBtn.visible = true;
                btnChange.styleName = "BtnHideButtons";
            };
        }

        public function hideIcons(_arg_1:Boolean):void
        {
            if (!iconCavas)
            {
                this.callLater(hideIcons, [_arg_1]);
                return;
            };
            if (_arg_1)
            {
                iconCavas.visible = false;
                jxhdBtn.visible = false;
                btnChange.styleName = "BtnShowButtons";
            }
            else
            {
                iconCavas.visible = true;
                jxhdBtn.visible = true;
                btnChange.styleName = "BtnHideButtons";
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

