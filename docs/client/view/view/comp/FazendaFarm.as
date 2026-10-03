// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FazendaFarm

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.effects.Glow;
    import flash.utils.Timer;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.filters.GlowFilter;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.utils.TimeUtil;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.managers.CursorManager;
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

    public class FazendaFarm extends Canvas 
    {

        private var _207684226glowEffect:Glow;
        private var _mid:int = -1;
        private var _state:int = 0;
        private var _idx:int;
        public var _time:Number;
        private var _mState:int = -1;
        private var _timer:Timer;
        private var _104387img:Image;
        public var _num:Number;
        private var havestFlag:Boolean;
        private var _cid:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":106,
                    "height":64,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "events":{
                            "mouseOver":"__img_mouseOver",
                            "mouseOut":"__img_mouseOut"
                        },
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"visible":false});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _imgFilters:Array = [];

        public function FazendaFarm()
        {
            mx_internal::_document = this;
            this.width = 106;
            this.height = 64;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            _FazendaFarm_Glow1_i();
            this.addEventListener("creationComplete", ___FazendaFarm_Canvas1_creationComplete);
        }

        public function ___FazendaFarm_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function imageMouseOver(_arg_1:MouseEvent):void
        {
            if (img.visible)
            {
                if (glowEffect.isPlaying)
                {
                    glowEffect.end();
                    img.filters = [];
                };
                if (_state != GamePredef.FARM_STATE_WAIT)
                {
                    if (((_imgFilters.length > 1) || (_imgFilters[0] is GlowFilter)))
                    {
                        _imgFilters.pop();
                    };
                    _imgFilters.push(GamePredef.FILTER_CHAR_SELECTED);
                    img.filters = _imgFilters;
                }
                else
                {
                    img.filters = [GamePredef.FILTER_CHAR_SELECTED];
                };
            };
        }

        public function onMineTimeOut():void
        {
            this.setState(GamePredef.FARM_STATE_OPEN);
            this.resetMine();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
            };
        }

        private function loadImage():void
        {
            var _local_1:Object;
            var _local_2:Date;
            var _local_3:Number;
            var _local_4:String;
            _local_1 = GameData.d[GamePredef.TBL_MINERAL_TEMPLATE][_mid];
            if (_state == GamePredef.FARM_STATE_CAN_OPEN)
            {
                if (_cid == _core.player.id)
                {
                    img.source = ResManager.MOUSE_ACTION_PLANT_BUILD;
                    img.visible = true;
                    img.toolTip = null;
                };
            }
            else
            {
                if (_state == GamePredef.FARM_STATE_WAIT)
                {
                    img.source = ResManager.MOUSE_ACTION_PLANT_WAIT;
                    img.visible = true;
                    _local_2 = new Date();
                    _local_3 = (_time - _core.timeLag);
                    _local_2.setTime(_local_3);
                    _local_4 = TimeUtil.dateFormatter.format(_local_2);
                    img.toolTip = Language.FAZENDAPANEL_S[22].replace("{time}", _local_4);
                    if (glowEffect.isPlaying)
                    {
                        glowEffect.end();
                    };
                    img.filters = [];
                }
                else
                {
                    if (_mState < 0)
                    {
                        img.visible = false;
                    }
                    else
                    {
                        if (_mState == GamePredef.MINE_GROW_ING)
                        {
                            _local_1 = GameData.d[GamePredef.TBL_MINERAL_TEMPLATE][_mid];
                            img.source = ResManager.getResUrl(_local_1.resCode1);
                            ResManager.setColorCode(img, _local_1.colorCode);
                            _imgFilters = img.filters;
                            img.visible = true;
                            setImageTooltip();
                        }
                        else
                        {
                            if (_mState == GamePredef.MINE_GROW_UP)
                            {
                                _local_1 = GameData.d[GamePredef.TBL_MINERAL_TEMPLATE][_mid];
                                img.source = ResManager.getResUrl(_local_1.resCode2);
                                ResManager.setColorCode(img, _local_1.colorCode);
                                _imgFilters = img.filters;
                                img.visible = true;
                                setImageTooltip();
                                if (!glowEffect.isPlaying)
                                {
                                    glowEffect.play([img]);
                                };
                            };
                        };
                    };
                };
            };
        }

        public function updateView():void
        {
            if (_state == GamePredef.FARM_STATE_CLOSE)
            {
                styleName = "farmClose";
            }
            else
            {
                if (_state == GamePredef.FARM_STATE_OPEN)
                {
                    styleName = "farmOpen";
                }
                else
                {
                    if (_state == GamePredef.FARM_STATE_CAN_OPEN)
                    {
                        styleName = "farmClose";
                    }
                    else
                    {
                        if (_state == GamePredef.FARM_STATE_WAIT)
                        {
                            styleName = "farmClose";
                        };
                    };
                };
            };
            loadImage();
        }

        public function setMid(_arg_1:int):void
        {
            _mid = _arg_1;
        }

        public function init():void
        {
            addEventListener(MouseEvent.CLICK, onClick);
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        private function removeTimer():void
        {
            if (((_timer) && (_timer.running)))
            {
                _timer.stop();
                _timer.removeEventListener(TimerEvent.TIMER, handleTimer);
                _timer = null;
                trace((("回自己庄园, 删除农田_" + _idx) + "的定时器"));
            };
        }

        public function onSteelMine(_arg_1:int):void
        {
            _num = (_num - _arg_1);
            setImageTooltip();
            playerAction();
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        private function addTimer():void
        {
            if (((_timer) && (_timer.running)))
            {
                _timer.stop();
                _timer.removeEventListener(TimerEvent.TIMER, handleTimer);
                _timer = null;
            };
            if (_state == GamePredef.FARM_STATE_WAIT)
            {
                _timer = new Timer(10000, 0);
                _timer.addEventListener(TimerEvent.TIMER, handleTimer);
                _timer.start();
            };
        }

        private function setImageTooltip():void
        {
            var _local_5:String;
            var _local_1:Date = new Date();
            var _local_2:Number = (_time - _core.timeLag);
            _local_1.setTime(_local_2);
            var _local_3:String = TimeUtil.dateFormatter.format(_local_1);
            var _local_4:Object = GameData.d[GamePredef.TBL_MINERAL_TEMPLATE][_mid];
            var _local_6:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_4.tid];
            _local_4.info = Language.FAZENDAPANEL_S[18].toString().replace("{num}", _local_4.num).replace("{name}", _local_6.name);
            _local_5 = (_local_4.name + "\n");
            _local_5 = (_local_5 + ((Language.FAZENDAPANEL_S[8] + _local_4.info) + "\n"));
            _local_5 = (_local_5 + (Language.FAZENDAPANEL_S[0].toString().replace("{num}", _num).replace("{maxNum}", _local_4.num) + "\n"));
            if (_mState == GamePredef.MINE_GROW_ING)
            {
                _local_5 = (_local_5 + Language.FAZENDAPANEL_S[1].toString().replace("{time}", _local_3));
            }
            else
            {
                if (_mState == GamePredef.MINE_GROW_UP)
                {
                    _local_5 = (_local_5 + Language.FAZENDAPANEL_S[2]);
                };
            };
            img.toolTip = _local_5;
        }

        public function setMineState(_arg_1:int):void
        {
            _mState = _arg_1;
        }

        public function __img_mouseOver(_arg_1:MouseEvent):void
        {
            imageMouseOver(_arg_1);
        }

        public function resetMine():void
        {
            _mid = -1;
            _mState = GamePredef.MINE_NULL;
            _num = 0;
            _time = -1;
            glowEffect.end();
            img.filters = [];
            img.visible = false;
        }

        public function setNum(_arg_1:int):void
        {
            _num = _arg_1;
        }

        public function __img_mouseOut(_arg_1:MouseEvent):void
        {
            imageMouseOut(_arg_1);
        }

        public function getMineState():int
        {
            return (_mState);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function getHavestFlag():Boolean
        {
            return (havestFlag);
        }

        public function reset():void
        {
            _state = 0;
            resetMine();
        }

        private function _FazendaFarm_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.duration = 1000;
            _local_1.repeatCount = 10000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 0xFFEA00;
            return (_local_1);
        }

        public function setTime(_arg_1:Number):void
        {
            _time = _arg_1;
        }

        public function setState(_arg_1:int):void
        {
            _state = _arg_1;
        }

        private function imageMouseOut(_arg_1:MouseEvent):void
        {
            if (img.visible)
            {
                if (_state != GamePredef.FARM_STATE_WAIT)
                {
                    if (((_mState == GamePredef.MINE_GROW_UP) && (!(glowEffect.isPlaying))))
                    {
                        glowEffect.play([img]);
                    };
                    _imgFilters.pop();
                    img.filters = _imgFilters;
                }
                else
                {
                    img.filters = [];
                };
            };
        }

        public function setHavestFlag(_arg_1:Boolean):void
        {
            havestFlag = _arg_1;
        }

        public function onClick(evt:MouseEvent):void
        {
            var func:Function;
            var mid:* = undefined;
            var flag:Boolean;
            var view:* = undefined;
            var farmNum:int;
            var msg:String;
            evt.stopPropagation();
            var resetMouse:Boolean = true;
            if (_core.view.mouseState == GamePredef.ACTION_CLEAR_PLANT)
            {
                if (_cid == _core.player.id)
                {
                    if (_mid > 0)
                    {
                        func = function (_arg_1:CloseEvent):*
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.delMinearl(_idx);
                            };
                        };
                        Alert.show(Language.FAZENDAPANEL_S[16], "", (Alert.YES | Alert.NO), this, func);
                    };
                };
            }
            else
            {
                if (_core.view.mouseState == GamePredef.ACTION_REAP_MINE)
                {
                    resetMouse = false;
                    if (_cid == _core.player.id)
                    {
                        if (_mid > 0)
                        {
                            _core.remote.harvestMine(_idx);
                        }
                        else
                        {
                            resetMouse = true;
                        };
                    }
                    else
                    {
                        _core.remote.steelMine(_cid, _idx);
                        if (_mid < 0)
                        {
                            resetMouse = true;
                        };
                    };
                }
                else
                {
                    if (_core.view.mouseState == GamePredef.ACTION_REAP_ALL)
                    {
                        _core.view.getUI(ViewManager.PANEL_FAZENDA).reapAllMines();
                    }
                    else
                    {
                        mid = (((_core.view.mouseState - 160) / 10) + 1);
                        if (((mid > 0) && (_cid == _core.player.id)))
                        {
                            resetMouse = false;
                            _core.remote.call("addMineral", null, _idx, mid);
                        }
                        else
                        {
                            if (((_state == GamePredef.FARM_STATE_CAN_OPEN) && (_cid == _core.player.id)))
                            {
                                flag = img.hitTestPoint(evt.stageX, evt.stageY);
                                if (flag)
                                {
                                    func = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.addFarmNum(_idx);
                                        };
                                    };
                                    view = _core.view.getUI(ViewManager.PANEL_FAZENDA);
                                    if (view.canBuildFarm())
                                    {
                                        farmNum = view.getFarmNum();
                                        msg = Language.FAZENDAPANEL_S[3].toString().replace("{num}", GamePredef.FARM_NUM_MONEY[farmNum]);
                                        Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
                                    }
                                    else
                                    {
                                        Alert.show(Language.FAZENDAPANEL_S[10]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (resetMouse)
            {
                _core.view.resoreMouse();
                CursorManager.removeAllCursors();
            };
        }

        public function setOwnerId(_arg_1:int):void
        {
            _cid = _arg_1;
            if (_cid != _core.player.id)
            {
                addTimer();
            }
            else
            {
                removeTimer();
            };
        }

        public function playerAction():void
        {
            _core.view.getUI(ViewManager.PANEL_FAZENDA).playerAction(_idx, img.source, img.filters);
        }

        public function set idx(_arg_1:int):*
        {
            _idx = _arg_1;
        }

        public function handleTimer(_arg_1:TimerEvent):void
        {
            if (!this.havestFlag)
            {
                return;
            };
            var _local_2:Number = new Date().getTime();
            trace(((("检测农田_" + _idx) + "否冷却时间是否已过:") + (_local_2 - _time)));
            if (_local_2 >= _time)
            {
                _timer.stop();
                _timer.removeEventListener(TimerEvent.TIMER, handleTimer);
                _timer = null;
                trace((("冷却时间到了, 删除农田_" + _idx) + "的定时器， 并请求服务器数据"));
                this.setState(GamePredef.FARM_STATE_OPEN);
                this.resetMine();
                updateView();
            };
        }


    }
}//package com.qeedoo.ui.view.comp

