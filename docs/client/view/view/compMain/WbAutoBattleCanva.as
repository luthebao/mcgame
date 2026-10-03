// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.WbAutoBattleCanva

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponent;
    import flash.display.MovieClip;
    import com.qeedoo.ui.view.comp.ScrollText;
    import mx.controls.Button;
    import flash.utils.Timer;
    import mx.controls.Label;
    import mx.controls.CheckBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.core.IUITextField;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.resource.Loader10;
    import com.qeedoo.ui.resource.ResManager;
    import flash.net.URLRequest;
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

    public class WbAutoBattleCanva extends SimpleCanvas implements IBindingClient 
    {

        public static var WB_BOSS_HP:Number = 0x2FAF0800;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var lastTimeNum:Number;
        private var _1662853568elemUIC:UIComponent;
        private var mc:MovieClip;
        private var _scrollText2:ScrollText;
        public var initFlag:Boolean = false;
        private var _543550324strongBtn1:Button;
        private var hpNow:Number = 0x2FAF0800;
        private var wbTimer:Timer;
        private var _1775826383lastTimeLabel:Label;
        private var _795540710wbAuto:CheckBox;
        private var _151488461onlineNum:Label;
        private var bloodLost:Number = 0;
        private var _729448801bossHpLabel:Label;
        private var _543550323strongBtn2:Button;
        private var hpBer:Number = 0x2FAF0800;
        public var buffLevel:int = 0;
        public var bossCurrentHp:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":150,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"elemUIC",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":20,
                                "width":300,
                                "height":30
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":CheckBox,
                        "id":"wbAuto",
                        "events":{"change":"__wbAuto_change"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
                                "y":0,
                                "visible":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"lastTimeLabel",
                        "stylesFactory":function ():void
                        {
                            this.color = 1961723;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "y":0,
                                "percentWidth":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"bossHpLabel",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":150,
                                "y":20,
                                "percentWidth":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"onlineNum",
                        "stylesFactory":function ():void
                        {
                            this.color = 1961723;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":300,
                                "y":0,
                                "percentWidth":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"strongBtn1",
                        "events":{"click":"__strongBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":140,
                                "y":50,
                                "styleName":"BtnWbGold",
                                "height":50,
                                "width":50
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"strongBtn2",
                        "events":{"click":"__strongBtn2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":230,
                                "y":50,
                                "styleName":"BtnWbMoney",
                                "height":50,
                                "width":50
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var element:Class = WbAutoBattleCanva_element;
        private var timer:Timer = new Timer(500);
        public var WB_LONGBUFF_STRONG:* = [2435, 2436, 2437, 2437, 2438];
        public var WB_STRONG_LEVEL:* = [20, 40, 60, 80, 100];
        public var WB_STRONG_COST:* = [{
            "gold":2,
            "money":250000,
            "r":"100%"
        }, {
            "gold":2,
            "money":250000,
            "r":"85%"
        }, {
            "gold":2,
            "money":250000,
            "r":"65%"
        }, {
            "gold":2,
            "money":250000,
            "r":"45%"
        }, {
            "gold":2,
            "money":250000,
            "r":"25%"
        }];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WbAutoBattleCanva()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 150;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WbAutoBattleCanva._watcherSetupUtil = _arg_1;
        }


        public function set elemUIC(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1662853568elemUIC;
            if (_local_2 !== _arg_1)
            {
                this._1662853568elemUIC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elemUIC", _local_2, _arg_1));
            };
        }

        public function set onlineNum(_arg_1:Label):void
        {
            var _local_2:Object = this._151488461onlineNum;
            if (_local_2 !== _arg_1)
            {
                this._151488461onlineNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "onlineNum", _local_2, _arg_1));
            };
        }

        public function updateWbStrongLabel(_arg_1:int):void
        {
            if (_arg_1 == 5)
            {
                strongBtn1.enabled = false;
                strongBtn2.enabled = false;
                strongBtn1.toolTip = Language.WBQUTOBATTLECANVA_U[3];
                strongBtn2.toolTip = Language.WBQUTOBATTLECANVA_U[3];
            }
            else
            {
                buffLevel = _arg_1;
                strongBtn1.toolTip = Language.WBQUTOBATTLECANVA_U[7].replace("{type}", "Vàng").replace("{num}", WB_STRONG_COST[_arg_1].gold).replace("{add}", WB_STRONG_LEVEL[_arg_1]);
                strongBtn2.toolTip = (Language.WBQUTOBATTLECANVA_U[7].replace("{type}", "Bạc").replace("{num}", WB_STRONG_COST[_arg_1].money).replace("{add}", WB_STRONG_LEVEL[_arg_1]) + Language.WBQUTOBATTLECANVA_U[8].replace("{r}", WB_STRONG_COST[_arg_1].r));
            };
        }

        [Bindable(event="propertyChange")]
        public function get strongBtn1():Button
        {
            return (this._543550324strongBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get strongBtn2():Button
        {
            return (this._543550323strongBtn2);
        }

        override public function initialize():void
        {
            var target:WbAutoBattleCanva;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WbAutoBattleCanva_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_WbAutoBattleCanvaWatcherSetupUtil");
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

        public function __wbAuto_change(_arg_1:Event):void
        {
            clickAutoBattle();
        }

        private function _WbAutoBattleCanva_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WBQUTOBATTLECANVA_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                wbAuto.label = _arg_1;
            }, "wbAuto.label");
            result[0] = binding;
            return (result);
        }

        public function updateWbOnlineNum(_arg_1:int):void
        {
            onlineNum.text = (Language.WBQUTOBATTLECANVA_U[10] + _arg_1);
        }

        private function removeTimer():void
        {
            if (wbTimer)
            {
                wbTimer.removeEventListener(TimerEvent.TIMER, timerRepeat);
                wbTimer.stop();
            };
        }

        public function changeBossHp(_arg_1:Number):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (_arg_1 < hpBer)
            {
                hpNow = _arg_1;
            };
            var _local_2:Number = Math.round(_arg_1);
            bossHpLabel.text = ((_local_2 + "/") + WB_BOSS_HP);
            var _local_3:int = int((Math.round((((WB_BOSS_HP - _local_2) * 94) / WB_BOSS_HP)) + 6));
            if (!mc)
            {
                mc = new ((element as Class))();
                elemUIC.addChild(mc);
            };
            mc.gotoAndStop(_local_3);
        }

        public function set strongBtn1(_arg_1:Button):void
        {
            var _local_2:Object = this._543550324strongBtn1;
            if (_local_2 !== _arg_1)
            {
                this._543550324strongBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "strongBtn1", _local_2, _arg_1));
            };
        }

        public function getWbAuto():Boolean
        {
            return (wbAuto.selected);
        }

        public function set strongBtn2(_arg_1:Button):void
        {
            var _local_2:Object = this._543550323strongBtn2;
            if (_local_2 !== _arg_1)
            {
                this._543550323strongBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "strongBtn2", _local_2, _arg_1));
            };
        }

        public function strongBattle(type:int):void
        {
            var _alert:Alert;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("wbStrongBattle", null, type);
                };
            };
            var msg:String = "";
            var htmlMsg:String = "";
            if (type == 1)
            {
                htmlMsg = Language.WBQUTOBATTLECANVA_U[2].replace("{gold}", WB_STRONG_COST[buffLevel].gold);
            }
            else
            {
                htmlMsg = Language.WBQUTOBATTLECANVA_U[5].replace("{money}", WB_STRONG_COST[buffLevel].money);
            };
            msg = htmlMsg.replace(/<font(.*?)>/g, "");
            msg = msg.replace(/<\/font>/g, "");
            msg = msg.replace(/<b>/g, "");
            msg = msg.replace(/<\/b>/g, "");
            _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
            var tf:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = htmlMsg;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        [Bindable(event="propertyChange")]
        public function get lastTimeLabel():Label
        {
            return (this._1775826383lastTimeLabel);
        }

        public function set wbAuto(_arg_1:CheckBox):void
        {
            var _local_2:Object = this._795540710wbAuto;
            if (_local_2 !== _arg_1)
            {
                this._795540710wbAuto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wbAuto", _local_2, _arg_1));
            };
        }

        private function _WbAutoBattleCanva_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WBQUTOBATTLECANVA_U[0];
        }

        public function __strongBtn2_click(_arg_1:MouseEvent):void
        {
            strongBattle(2);
        }

        [Bindable(event="propertyChange")]
        public function get bossHpLabel():Label
        {
            return (this._729448801bossHpLabel);
        }

        private function timerRepeat(_arg_1:TimerEvent):void
        {
            var _local_3:Date;
            var _local_2:* = "";
            if (ToolKit.isBigThan(lastTimeNum, 0))
            {
                lastTimeNum = int(lastTimeNum);
                lastTimeNum--;
                if (lastTimeNum < 0)
                {
                    removeTimer();
                };
                if (lastTimeNum >= 86400)
                {
                    _local_2 = Language.QUESTCANVAS_S[9].toString();
                    lastTimeLabel.text = _local_2.replace("{day}", int((lastTimeNum / 86400)));
                }
                else
                {
                    _local_3 = new Date(2000, 1, 1, 0, 0, 0, 0);
                    _local_3.setTime((_local_3.getTime() + Number((lastTimeNum * 1000))));
                    _local_2 = Language.QUESTCANVAS_S[11].toString();
                    _local_2 = _local_2.replace("{hour}", _local_3.getHours());
                    _local_2 = _local_2.replace("{minute}", _local_3.getMinutes());
                    lastTimeLabel.text = _local_2.replace("{second}", _local_3.getSeconds());
                };
            };
        }

        private function showBloodLost(_arg_1:Event):void
        {
            if (hpBer == 0)
            {
                if (timer.running)
                {
                    timer.stop();
                    timer.removeEventListener(TimerEvent.TIMER, showBloodLost);
                };
                return;
            };
            bloodLost = (hpBer - hpNow);
            if (bloodLost > 0)
            {
                _scrollText2.show(Math.round(bloodLost).toString(), 0xFF0000, 32, 2, 40);
                hpBer = hpNow;
            };
        }

        [Bindable(event="propertyChange")]
        public function get elemUIC():UIComponent
        {
            return (this._1662853568elemUIC);
        }

        [Bindable(event="propertyChange")]
        public function get onlineNum():Label
        {
            return (this._151488461onlineNum);
        }

        public function initView(_arg_1:Number, _arg_2:Boolean, _arg_3:Number, _arg_4:Number, _arg_5:int, _arg_6:int):void
        {
            var _local_8:Loader10;
            var _local_9:String;
            var _local_10:String;
            WB_BOSS_HP = _arg_4;
            wbAuto.selected = _arg_2;
            clickAutoBattle();
            if (_arg_3 < 0)
            {
                _arg_3 = 0;
            };
            _arg_3 = Math.round(_arg_3);
            bossHpLabel.text = ((_arg_3 + "/") + WB_BOSS_HP);
            hpBer = _arg_3;
            hpNow = _arg_3;
            var _local_7:int = int((Math.round((((WB_BOSS_HP - _arg_3) * 94) / WB_BOSS_HP)) + 6));
            if (!mc)
            {
                mc = new ((element as Class))();
                elemUIC.addChild(mc);
            };
            mc.gotoAndStop(_local_7);
            if (!_scrollText2)
            {
                _scrollText2 = new ScrollText();
                elemUIC.addChild(_scrollText2);
                _scrollText2.x = 440;
                _scrollText2.y = -60;
                bloodLost = 0;
            };
            if (timer.running)
            {
                timer.stop();
                timer.removeEventListener(TimerEvent.TIMER, showBloodLost);
            };
            timer.addEventListener(TimerEvent.TIMER, showBloodLost);
            timer.start();
            removeTimer();
            if (_arg_1 > 0)
            {
                lastTimeNum = _arg_1;
                wbTimer = new Timer(1000, int(_arg_1));
                wbTimer.addEventListener(TimerEvent.TIMER, timerRepeat);
                wbTimer.start();
                lastTimeLabel.visible = true;
                lastTimeLabel.includeInLayout = true;
                this.visible = true;
                if (_arg_5 == 5)
                {
                    strongBtn1.enabled = false;
                    strongBtn2.enabled = false;
                    strongBtn1.toolTip = Language.WBQUTOBATTLECANVA_U[3];
                    strongBtn2.toolTip = Language.WBQUTOBATTLECANVA_U[3];
                }
                else
                {
                    buffLevel = _arg_5;
                    strongBtn1.toolTip = Language.WBQUTOBATTLECANVA_U[7].replace("{type}", "Vàng").replace("{num}", WB_STRONG_COST[_arg_5].gold).replace("{add}", WB_STRONG_LEVEL[_arg_5]);
                    strongBtn2.toolTip = (Language.WBQUTOBATTLECANVA_U[7].replace("{type}", "Bạc").replace("{num}", WB_STRONG_COST[_arg_5].money).replace("{add}", WB_STRONG_LEVEL[_arg_5]) + Language.WBQUTOBATTLECANVA_U[8].replace("{r}", WB_STRONG_COST[_arg_5].r));
                };
                buffLevel = _arg_5;
                onlineNum.text = (Language.WBQUTOBATTLECANVA_U[10] + _arg_6);
                this.visible = true;
                if (!initFlag)
                {
                    _local_8 = new Loader10();
                    _local_9 = ResManager.getResUrlNoHash(2060100100028);
                    _local_10 = ResManager.hash((_local_9 + "_NEW.swf"));
                    _local_8.load(new URLRequest(_local_10));
                    initFlag = true;
                };
            }
            else
            {
                this.visible = false;
            };
        }

        public function set bossHpLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._729448801bossHpLabel;
            if (_local_2 !== _arg_1)
            {
                this._729448801bossHpLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossHpLabel", _local_2, _arg_1));
            };
        }

        public function set lastTimeLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1775826383lastTimeLabel;
            if (_local_2 !== _arg_1)
            {
                this._1775826383lastTimeLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastTimeLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get wbAuto():CheckBox
        {
            return (this._795540710wbAuto);
        }

        public function clickAutoBattle():void
        {
            if (wbAuto.selected)
            {
                _core.remote.call("wbAutoBattle", null, _core.player.id, true);
            }
            else
            {
                _core.remote.call("wbAutoBattle", null, _core.player.id, false);
            };
        }

        public function __strongBtn1_click(_arg_1:MouseEvent):void
        {
            strongBattle(1);
        }


    }
}//package com.qeedoo.ui.view.compMain

