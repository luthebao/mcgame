// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SkillUseSlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.states.SetProperty;
    import mx.containers.HBox;
    import mx.controls.Button;
    import mx.states.RemoveChild;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.SkillSlotVO;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.ItemConfig;
    import mx.binding.BindingManager;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.states.State;
    import flash.display.DisplayObject;
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

    public class SkillUseSlot extends Canvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _SkillUseSlot_SetProperty2:SetProperty;
        public var _SkillUseSlot_SetProperty3:SetProperty;
        public var _SkillUseSlot_SetProperty4:SetProperty;
        public var _SkillUseSlot_SetProperty5:SetProperty;
        private var _1355324111btnReqSkill:BasicGlowButton;
        private var _471817573btnReqSkillLabel:String = "";
        private var _987030448levelBtnCanvas:HBox;
        private var _skill:Object = null;
        private var _1110417475label1:RoundedLabel;
        private var btn1:Button = null;
        private var btn2:Button = null;
        private var btn3:Button = null;
        private var btn5:Button = null;
        private var btn6:Button = null;
        private var btn7:Button = null;
        private var btn8:Button = null;
        private var btn9:Button = null;
        private var btn4:Button = null;
        private var btn10:Button = null;
        public var _SkillUseSlot_RemoveChild1:RemoveChild;
        public var _SkillUseSlot_RemoveChild2:RemoveChild;
        private var learnBtn:Boolean = true;
        private var _data:Object;
        private var _skillType:String = "";
        private var _1464792627btnReqSkillStyleName:String = "";
        private var _maxLevel:uint = 10;
        private var _tempLearch:int = 0;
        private var _1991153647skillSlot:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":320,
                    "height":41,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"skillSlot",
                        "events":{
                            "rollOver":"__skillSlot_rollOver",
                            "rollOut":"__skillSlot_rollOut"
                        },
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "y":3,
                                "x":6.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"label1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":45,
                                "y":12,
                                "width":71.55,
                                "height":18
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "id":"levelBtnCanvas",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":206.65,
                                "height":26.5,
                                "x":100.35,
                                "y":7.5,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnReqSkill",
                                    "events":{
                                        "click":"__btnReqSkill_click",
                                        "rollOver":"__btnReqSkill_rollOver",
                                        "rollOut":"__btnReqSkill_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "enabled":false,
                                            "height":26,
                                            "width":27.5
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _2147321034skillVO:SkillSlotVO = new SkillSlotVO();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SkillUseSlot()
        {
            mx_internal::_document = this;
            this.width = 320;
            this.height = 41;
            this.styleName = "SkillUseBar";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.states = [_SkillUseSlot_State1_c(), _SkillUseSlot_State2_c()];
            this.addEventListener("creationComplete", ___SkillUseSlot_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SkillUseSlot._watcherSetupUtil = _arg_1;
        }


        public function set maxLevel(_arg_1:uint):void
        {
            this._maxLevel = _arg_1;
        }

        public function set giid(_arg_1:Number):void
        {
            var _local_3:Object;
            var _local_2:int = 1;
            while (_local_2 <= 10)
            {
                setMyVisible(_local_2);
                _local_2++;
            };
            skillSlot.filters = [];
            if (_core.data.hasData(skillVO.type, _arg_1))
            {
                _local_3 = _core.data.getGameData(skillVO.type, _arg_1);
                slotData = _local_3;
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + skillVO.type) + "_") + _arg_1), dataLoaded);
                _core.data.getGameData(skillVO.type, _arg_1);
            };
            skillVO.giid = _arg_1;
        }

        private function levelClicked(_arg_1:MouseEvent):void
        {
            var _local_2:Button = Button(_arg_1.currentTarget);
            var _local_3:int = Number(_local_2.id.slice(3));
            var _local_4:GameDataEvent = new GameDataEvent(GameDataEvent.SKILL_LEVEL_CLICKED);
            _local_4.data = {
                "skill":skillVO.slotData,
                "level":_local_3,
                "slot":this,
                "event":_arg_1
            };
            dispatchEvent(_local_4);
        }

        public function set skillSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1991153647skillSlot;
            if (_local_2 !== _arg_1)
            {
                this._1991153647skillSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot", _local_2, _arg_1));
            };
        }

        private function showSkillTooltip(_arg_1:int, _arg_2:int):void
        {
            var _local_4:TipSkill;
            var _local_5:Object;
            var _local_3:Object = _core.getSkillData(_arg_1, _arg_2);
            if (_local_3)
            {
                _local_4 = TipSkill(_core.view.getUI(ViewManager.TOOLTIP_SKILL));
                _local_5 = {};
                _local_5.temp = _local_3;
                _local_4.object = _local_5;
                _local_4.show();
            };
        }

        private function skillSlotRollOver():void
        {
            if (_tempLearch == -1)
            {
                skillSlot.filters = [GamePredef.FILTER_SLOT_SKILL_01];
            }
            else
            {
                return;
            };
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:Event = new Event(Slot.EVENT_SLOT_DCLICK);
            dispatchEvent(_local_2);
        }

        public function __skillSlot_rollOver(_arg_1:MouseEvent):void
        {
            skillSlotRollOver();
        }

        private function enableLearnBtn():void
        {
            var _local_6:*;
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_GUILD).skillDevData;
            var _local_2:int;
            if (_tempLearch != -1)
            {
                _local_2 = int(skillVO.level);
            };
            var _local_3:* = GameData.d[GamePredef.TBL_SKILL][skillVO.giid].codeName;
            var _local_4:* = DataManager.getInstance().gameDataIndex[GamePredef.TBL_SKILL][_local_3];
            var _local_5:Number = -1;
            for (_local_6 in _local_4)
            {
                if (_local_1[_local_4[_local_6].id] != null)
                {
                    _local_5 = Number(_local_4[_local_6].id);
                    break;
                };
            };
            if (_local_5 == -1)
            {
                btnReqSkill.enabled = false;
                return;
            };
            if (ToolKit.isBigThan(GameData.d[GamePredef.TBL_SKILL][_local_5].level, _local_2))
            {
                btnReqSkill.enabled = true;
            }
            else
            {
                btnReqSkill.enabled = false;
            };
        }

        public function set giids(_arg_1:Object):void
        {
            var _local_2:int = 1;
            while (_local_2 <= 10)
            {
                setMyVisible(_local_2);
                _local_2++;
            };
            if (_arg_1.creKind == ItemConfig.JUSTICE_SKILL_CREKIND)
            {
                this.currentState = "couple";
            };
            _tempLearch = _arg_1.temp;
            if (_core.data.hasData(skillVO.type, _arg_1.id))
            {
                slotData = _core.data.getGameData(skillVO.type, _arg_1.id);
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + skillVO.type) + "_") + _arg_1.id), dataLoaded);
                _core.data.getGameData(skillVO.type, _arg_1.id);
            };
            skillVO.giid = _arg_1.id;
            if (_arg_1.position !== undefined)
            {
                skillVO.position = _arg_1.position;
            };
            if (_arg_1.kind !== undefined)
            {
                skillVO.kind = _arg_1.kind;
            };
        }

        private function _SkillUseSlot_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _SkillUseSlot_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_SkillUseSlot_RemoveChild1", _SkillUseSlot_RemoveChild1);
            return (_local_1);
        }

        private function _SkillUseSlot_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _SkillUseSlot_SetProperty2 = _local_1;
            _local_1.name = "width";
            _local_1.value = 150;
            BindingManager.executeBindings(this, "_SkillUseSlot_SetProperty2", _SkillUseSlot_SetProperty2);
            return (_local_1);
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                alpha = 0.5;
            }
            else
            {
                alpha = 1;
            };
        }

        public function ___SkillUseSlot_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            generateControls();
        }

        public function __btnReqSkill_click(_arg_1:MouseEvent):void
        {
            learn();
        }

        public function get type():int
        {
            return (skillVO.type);
        }

        private function learn():void
        {
            var func:Function;
            btnReqSkill.enabled = false;
            var msgString:String = "";
            if (_tempLearch == -1)
            {
                msgString = Language.SKILLUSESLOT_S[0].toString().replace("{skillName}", label1.text);
            }
            else
            {
                msgString = Language.SKILLUSESLOT_S[1].toString().replace("{skillName}", label1.text);
            };
            func = function (_arg_1:CloseEvent):void
            {
                var _local_2:Object;
                var _local_3:Object;
                var _local_4:Object;
                var _local_5:Object;
                if (_arg_1.detail == Alert.YES)
                {
                    _local_2 = _core.getSkillData(skillVO.giid, int(skillVO.level));
                    if ((((!(ToolKit.isEqual(_local_2.useEnv, 4))) && (!(ToolKit.isEqual(_local_2.useEnv, 5)))) && (!(ToolKit.isEqual(_local_2.useEnv, 3)))))
                    {
                        if (_tempLearch == -1)
                        {
                            _local_3 = _core.skillBookBySkillName(label1.text);
                            _local_4 = _core.getItemNum(GamePredef.TBL_ITEM_TEMPLATE, _local_3.id);
                            _core.remote.useItem(GamePredef.MOUSE_TARGET_CHA, -1, _local_4.slot.id);
                        }
                        else
                        {
                            _local_5 = _core.getSkillData(skillVO.giid, (int(skillVO.level) + 1));
                            _core.remote.call("skillLearnByClient", new Responder(onSkillLearnByClient), _local_5.id, skillVO.position);
                        };
                    }
                    else
                    {
                        if (ToolKit.isEqual(_local_2.useEnv, 4))
                        {
                            if (_tempLearch == -1)
                            {
                                _core.remote.call("addGuildSkill", null, _local_2.id);
                            }
                            else
                            {
                                _local_5 = _core.getSkillData(skillVO.giid, (int(skillVO.level) + 1));
                                _core.remote.call("improveGuildSkill", new Responder(onSkillLearnByClient), _local_5.id);
                            };
                        }
                        else
                        {
                            if (ToolKit.isEqual(_local_2.useEnv, 5))
                            {
                                if (_tempLearch == -1)
                                {
                                    _core.remote.call("addMagicWeaponSkill", null, _local_2.id, skillVO.position);
                                }
                                else
                                {
                                    _local_5 = _core.getSkillData(skillVO.giid, (int(skillVO.level) + 1));
                                    _core.remote.call("skillLearnByClient", new Responder(onSkillLearnByClient), _local_5.id, skillVO.position);
                                };
                            }
                            else
                            {
                                if (ToolKit.isEqual(_local_2.useEnv, 3))
                                {
                                    if (_tempLearch == -1)
                                    {
                                        _core.remote.call("addTrainingSkill", null, _local_2.id);
                                    }
                                    else
                                    {
                                        _local_5 = _core.getSkillData(skillVO.giid, (int(skillVO.level) + 1));
                                        _core.remote.call("skillLearnByClient", new Responder(onSkillLearnByClient), _local_5.id);
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    btnReqSkill.enabled = true;
                };
            };
            Alert.show(msgString, "", (Alert.YES | Alert.NO), null, func);
        }

        public function __btnReqSkill_rollOver(_arg_1:MouseEvent):void
        {
            showTipForDemand();
        }

        public function clean():void
        {
            var _local_2:Button;
            skillVO.giid = -1;
            skillVO.slotData = null;
            skillSlot.clearIcon();
            skillVO.name = "";
            skillVO.level = "";
            levelBtnCanvas.visible = false;
            var _local_1:int = 1;
            while (_local_1 <= 10)
            {
                _local_2 = Button(this[("btn" + _local_1)]);
                if (_local_2)
                {
                    _local_2.enabled = false;
                    _local_2.toolTip = "";
                };
                _local_1++;
            };
            skillSlot.enabled = true;
            _tempLearch = 0;
            _skill = null;
            btnReqSkillStyleName = "";
            btnReqSkillLabel = "";
            learnBtn = true;
            if (btnReqSkill)
            {
                btnReqSkill.visible = true;
                btnReqSkill.enabled = false;
            };
            _maxLevel = 10;
            _data = null;
        }

        private function generateControls():void
        {
            var _local_2:int;
            var _local_3:Button;
            var _local_1:int = 3;
            if (_skillType == "character")
            {
                _local_1 = 10;
            };
            _local_2 = 1;
            while (_local_2 <= _local_1)
            {
                _local_3 = new Button();
                _local_3.id = ("btn" + _local_2);
                _local_3.styleName = ("BtnSkillLevel" + _local_2);
                _local_3.enabled = false;
                _local_3.height = 26;
                _local_3.addEventListener(MouseEvent.CLICK, levelClicked);
                _local_3.addEventListener(MouseEvent.ROLL_OVER, showTip);
                _local_3.addEventListener(MouseEvent.ROLL_OUT, hideTip);
                levelBtnCanvas.addChildAt(_local_3, (_local_2 - 1));
                this[("btn" + _local_2)] = _local_3;
                setMyVisible(_local_2);
                _local_2++;
            };
            btn1.enabled = true;
            if (skillVO.level != "")
            {
                _local_2 = 1;
                while (_local_2 <= Number(skillVO.level))
                {
                    enableBtn(_local_2);
                    _local_2++;
                };
            };
        }

        private function enableBtnReqSkill(_arg_1:int):void
        {
            var _local_2:int = _arg_1;
            skillSlot.filters = [];
            btnReqSkill.enabled = false;
            if (_local_2 == _maxLevel)
            {
                btnReqSkillStyleName = "BtnSquGreen";
                btnReqSkillLabel = Language.SKILLUSESLOT_U[0];
                return;
            };
            btnReqSkillStyleName = "BtnSquGreen";
            btnReqSkillLabel = Language.SKILLUSESLOT_U[1];
            if (_tempLearch == -1)
            {
                skillSlot.filters = [GamePredef.FILTER_SLOT_SKILL_01];
                btnReqSkillStyleName = "BtnSquGreen";
                btnReqSkillLabel = Language.SKILLUSESLOT_U[2];
                skillSlot.enabled = false;
                _local_2 = 0;
            };
            var _local_3:Object = _core.getSkillData(skillVO.giid, (_local_2 + 1));
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:Object = _core.skillBookBySkillName(_local_3.name);
            if (((((_core.player.level >= Number(_local_3.reqLevel)) && (_core.player.expSkill >= Number(_local_3.expSkill))) && ((_core.player.money >= Number(_local_3.price)) || (_core.player.moneyBind >= Number(_local_3.price)))) && (((_core.player.cl >= int(_local_3.reqCL)) && (!(int(_local_3.reqCL) == GamePredef.SKILL_REQUEST_CHAR_LEVEL))) || ((int(_local_3.reqCL) == GamePredef.SKILL_REQUEST_CHAR_LEVEL) && (_core.player.expRe)))))
            {
                if (ToolKit.isEqual(_local_3.useEnv, 4))
                {
                    if (_core.player.guild != null)
                    {
                        if (_core.view.getUI(ViewManager.PANEL_GUILD).skillDevData == null)
                        {
                            _core.view.getUI(ViewManager.PANEL_GUILD).getGuildPrivateSkillData(guildSkillDataResponser);
                            btnReqSkill.enabled = false;
                            return;
                        };
                        enableLearnBtn();
                    };
                };
                if (((_tempLearch == -1) && (!(ToolKit.isEqual(_local_3.useEnv, 5)))))
                {
                    if (((_local_4) && (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, _local_4.id) <= 0)))
                    {
                        btnReqSkill.enabled = false;
                    };
                }
                else
                {
                    btnReqSkill.enabled = true;
                };
                if (ToolKit.isEqual(_local_3.useEnv, 3))
                {
                    btnReqSkill.enabled = true;
                };
            };
        }

        private function dataLoaded(_arg_1:GameDataEvent):void
        {
            if (_arg_1.data.data)
            {
                _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
                giid = _arg_1.data.index;
            };
        }

        public function reset():void
        {
            skillSlot.reset();
        }

        public function set levelBtnCanvas(_arg_1:HBox):void
        {
            var _local_2:Object = this._987030448levelBtnCanvas;
            if (_local_2 !== _arg_1)
            {
                this._987030448levelBtnCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelBtnCanvas", _local_2, _arg_1));
            };
        }

        private function guildSkillDataResponser(_arg_1:Object):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _core.view.getUI(ViewManager.PANEL_GUILD).skillDevData = _arg_1;
            enableLearnBtn();
        }

        private function onUseItem():void
        {
            _core.view.getUI(ViewManager.PANEL_SKILLMANAGER).update();
        }

        public function __btnReqSkill_rollOut(_arg_1:MouseEvent):void
        {
            hideTipForDemand();
        }

        public function set skillType(_arg_1:String):void
        {
            _skillType = _arg_1;
        }

        private function _SkillUseSlot_SetProperty1_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "width";
            _local_1.value = 160;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get btnReqSkillLabel():String
        {
            return (this._471817573btnReqSkillLabel);
        }

        private function showTip(_arg_1:Event):void
        {
            var _local_3:int;
            var _local_2:Object = _arg_1.currentTarget;
            if (_local_2.enabled)
            {
                _local_3 = Number(_local_2.id.slice(3));
                showSkillTooltip(skillVO.giid, _local_3);
            };
        }

        public function set stackMax(_arg_1:int):void
        {
        }

        public function __skillSlot_rollOut(_arg_1:MouseEvent):void
        {
            skillSlotRollOut();
        }

        public function get slotType():int
        {
            return (skillSlot.slotType);
        }

        public function set type(_arg_1:int):void
        {
            skillVO.type = _arg_1;
        }

        public function set learnAble(_arg_1:Boolean):void
        {
            learnBtn = _arg_1;
            if (btnReqSkill)
            {
                btnReqSkill.visible = _arg_1;
            };
        }

        public function get giid():Number
        {
            return (skillVO.giid);
        }

        public function get maxLevel():uint
        {
            return (_maxLevel);
        }

        public function set label1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1110417475label1;
            if (_local_2 !== _arg_1)
            {
                this._1110417475label1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label1", _local_2, _arg_1));
            };
        }

        private function _SkillUseSlot_SetProperty5_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _SkillUseSlot_SetProperty5 = _local_1;
            _local_1.name = "x";
            _local_1.value = 37;
            BindingManager.executeBindings(this, "_SkillUseSlot_SetProperty5", _SkillUseSlot_SetProperty5);
            return (_local_1);
        }

        private function hideTipForDemand():void
        {
            var _local_1:TipReqSkill = TipReqSkill(_core.view.getUI(ViewManager.TOOLTIP_REQSKILL));
            _local_1.hide();
        }

        public function restore():void
        {
            skillSlot.restore();
        }

        override public function initialize():void
        {
            var target:SkillUseSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SkillUseSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_SkillUseSlotWatcherSetupUtil");
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

        private function set btnReqSkillStyleName(_arg_1:String):void
        {
            var _local_2:Object = this._1464792627btnReqSkillStyleName;
            if (_local_2 !== _arg_1)
            {
                this._1464792627btnReqSkillStyleName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReqSkillStyleName", _local_2, _arg_1));
            };
        }

        public function get selected():Boolean
        {
            return (alpha == 0.5);
        }

        public function set btnReqSkill(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1355324111btnReqSkill;
            if (_local_2 !== _arg_1)
            {
                this._1355324111btnReqSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReqSkill", _local_2, _arg_1));
            };
        }

        public function set slotData(_arg_1:Object):void
        {
            var _local_2:int;
            _data = _arg_1;
            if (_arg_1)
            {
                skillVO.giid = _arg_1.id;
                skillVO.slotData = _arg_1;
                skillVO.name = _arg_1.name;
                skillVO.level = _arg_1.level;
                levelBtnCanvas.visible = true;
                _local_2 = 1;
                while (_local_2 <= _arg_1.level)
                {
                    enableBtn(_local_2);
                    _local_2++;
                };
                if (_tempLearch != 0)
                {
                    enableBtnReqSkill(_arg_1.level);
                };
            };
        }

        private function skillSlotRollOut():void
        {
            if (_tempLearch == -1)
            {
                skillSlot.filters = [GamePredef.FILTER_SLOT_SKILL_01];
            }
            else
            {
                return;
            };
        }

        private function set skillVO(_arg_1:SkillSlotVO):void
        {
            var _local_2:Object = this._2147321034skillVO;
            if (_local_2 !== _arg_1)
            {
                this._2147321034skillVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillVO", _local_2, _arg_1));
            };
        }

        public function set index(_arg_1:int):void
        {
            skillVO.index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        private function _SkillUseSlot_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "couple";
            _local_1.overrides = [_SkillUseSlot_RemoveChild2_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtnCanvas():HBox
        {
            return (this._987030448levelBtnCanvas);
        }

        public function set stackNum(_arg_1:int):void
        {
        }

        private function showTipForDemand():void
        {
            var _local_3:TipReqSkill;
            var _local_4:Object;
            var _local_1:int = getMaxLevelSkill();
            var _local_2:Object;
            _local_2 = _core.getSkillData(skillVO.giid, (_local_1 + 1));
            if (_local_2)
            {
                _local_3 = TipReqSkill(_core.view.getUI(ViewManager.TOOLTIP_REQSKILL));
                _local_4 = {};
                _local_4.temp = _local_1;
                _local_4.skill = _local_2;
                _local_4.position = skillVO.position;
                if (((_local_2) && (GamePredef.LIFE_SKILL_PROP_MAP[_local_2.type])))
                {
                    _local_4.dex = ((_core.player.property[GamePredef.LIFE_SKILL_PROP_MAP[_local_2.type]]) || (0));
                };
                _local_3.object = _local_4;
                _local_3.show();
            };
        }

        private function _SkillUseSlot_SetProperty4_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _SkillUseSlot_SetProperty4 = _local_1;
            _local_1.name = "x";
            _local_1.value = 99.35;
            BindingManager.executeBindings(this, "_SkillUseSlot_SetProperty4", _SkillUseSlot_SetProperty4);
            return (_local_1);
        }

        private function _SkillUseSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = btnReqSkill;
            _local_1 = levelBtnCanvas;
            _local_1 = skillSlot;
            _local_1 = levelBtnCanvas;
            _local_1 = label1;
            _local_1 = btnReqSkill;
            _local_1 = skillVO.slotData;
            _local_1 = skillVO.type;
            _local_1 = skillVO.giid;
            _local_1 = skillVO.name;
            _local_1 = btnReqSkillStyleName;
            _local_1 = learnBtn;
            _local_1 = btnReqSkillLabel;
        }

        public function get slotData():Object
        {
            return (_data);
        }

        public function update():void
        {
            skillSlot.update();
        }

        [Bindable(event="propertyChange")]
        private function get skillVO():SkillSlotVO
        {
            return (this._2147321034skillVO);
        }

        public function get stackMax():int
        {
            return (0);
        }

        [Bindable(event="propertyChange")]
        private function get btnReqSkillStyleName():String
        {
            return (this._1464792627btnReqSkillStyleName);
        }

        private function set btnReqSkillLabel(_arg_1:String):void
        {
            var _local_2:Object = this._471817573btnReqSkillLabel;
            if (_local_2 !== _arg_1)
            {
                this._471817573btnReqSkillLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnReqSkillLabel", _local_2, _arg_1));
            };
        }

        public function get index():int
        {
            return (skillVO.index);
        }

        private function onSkillLearnByClient(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (_core.view.getUI(ViewManager.PANEL_SKILLMANAGER).visible)
                {
                    _core.view.getUI(ViewManager.PANEL_SKILLMANAGER).update();
                };
            };
        }

        public function initView():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get btnReqSkill():BasicGlowButton
        {
            return (this._1355324111btnReqSkill);
        }

        private function enableBtn(_arg_1:int):void
        {
            var _local_2:Button = Button(this[("btn" + _arg_1)]);
            if (!_local_2)
            {
                return;
            };
            if (_tempLearch == -1)
            {
                _local_2.enabled = false;
                return;
            };
            _local_2.enabled = true;
        }

        public function get stackNum():int
        {
            return (0);
        }

        private function _SkillUseSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (btnReqSkill);
            }, function (_arg_1:DisplayObject):void
            {
                _SkillUseSlot_RemoveChild1.target = _arg_1;
            }, "_SkillUseSlot_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (levelBtnCanvas);
            }, function (_arg_1:Object):void
            {
                _SkillUseSlot_SetProperty2.target = _arg_1;
            }, "_SkillUseSlot_SetProperty2.target");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skillSlot);
            }, function (_arg_1:Object):void
            {
                _SkillUseSlot_SetProperty3.target = _arg_1;
            }, "_SkillUseSlot_SetProperty3.target");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (levelBtnCanvas);
            }, function (_arg_1:Object):void
            {
                _SkillUseSlot_SetProperty4.target = _arg_1;
            }, "_SkillUseSlot_SetProperty4.target");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (label1);
            }, function (_arg_1:Object):void
            {
                _SkillUseSlot_SetProperty5.target = _arg_1;
            }, "_SkillUseSlot_SetProperty5.target");
            result[4] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (btnReqSkill);
            }, function (_arg_1:DisplayObject):void
            {
                _SkillUseSlot_RemoveChild2.target = _arg_1;
            }, "_SkillUseSlot_RemoveChild2.target");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (skillVO.slotData);
            }, function (_arg_1:Object):void
            {
                skillSlot.slotData = _arg_1;
            }, "skillSlot.slotData");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (skillVO.type);
            }, function (_arg_1:int):void
            {
                skillSlot.type = _arg_1;
            }, "skillSlot.type");
            result[7] = binding;
            binding = new Binding(this, function ():Number
            {
                return (skillVO.giid);
            }, function (_arg_1:Number):void
            {
                skillSlot.giid = _arg_1;
            }, "skillSlot.giid");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = skillVO.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label1.text = _arg_1;
            }, "label1.text");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (btnReqSkillStyleName);
            }, function (_arg_1:Object):void
            {
                btnReqSkill.styleName = _arg_1;
            }, "btnReqSkill.styleName");
            result[10] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (learnBtn);
            }, function (_arg_1:Boolean):void
            {
                btnReqSkill.visible = _arg_1;
            }, "btnReqSkill.visible");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = btnReqSkillLabel;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnReqSkill.label = _arg_1;
            }, "btnReqSkill.label");
            result[12] = binding;
            return (result);
        }

        private function setMyVisible(_arg_1:uint):void
        {
            if (this[("btn" + _arg_1)])
            {
                this[("btn" + _arg_1)].visible = (_arg_1 <= _maxLevel);
            };
        }

        [Bindable(event="propertyChange")]
        public function get label1():RoundedLabel
        {
            return (this._1110417475label1);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot():ItemSlot
        {
            return (this._1991153647skillSlot);
        }

        private function _SkillUseSlot_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _SkillUseSlot_SetProperty3 = _local_1;
            _local_1.name = "x";
            _local_1.value = 5;
            BindingManager.executeBindings(this, "_SkillUseSlot_SetProperty3", _SkillUseSlot_SetProperty3);
            return (_local_1);
        }

        private function _SkillUseSlot_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "pet";
            _local_1.overrides = [_SkillUseSlot_RemoveChild1_i(), _SkillUseSlot_SetProperty1_c(), _SkillUseSlot_SetProperty2_i(), _SkillUseSlot_SetProperty3_i(), _SkillUseSlot_SetProperty4_i(), _SkillUseSlot_SetProperty5_i()];
            return (_local_1);
        }

        public function get isDragAble():Boolean
        {
            return (((skillVO.kind == 1) || (skillVO.kind == 3)) || (skillVO.kind == 4));
        }

        private function hideTip(_arg_1:Event):void
        {
            var _local_2:TipSkill = TipSkill(_core.view.getUI(ViewManager.TOOLTIP_SKILL));
            _local_2.hide();
        }

        private function getMaxLevelSkill():int
        {
            var _local_3:Button;
            var _local_1:int;
            var _local_2:int = 1;
            while (_local_2 <= 10)
            {
                _local_3 = Button(this[("btn" + _local_2)]);
                if (((_local_3) && (_local_3.enabled)))
                {
                    if (_local_2 >= _local_1)
                    {
                        _local_1 = _local_2;
                    };
                };
                _local_2++;
            };
            return (_local_1);
        }

        private function _SkillUseSlot_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _SkillUseSlot_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_SkillUseSlot_RemoveChild2", _SkillUseSlot_RemoveChild2);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.comp

