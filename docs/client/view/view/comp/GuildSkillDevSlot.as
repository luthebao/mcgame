// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.GuildSkillDevSlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.containers.HBox;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.SkillSlotVO;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import com.qeedoo.game.event.GameDataEvent;
    import flash.events.Event;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.data.DataManager;
    import flash.utils.getDefinitionByName;
    import mx.controls.Alert;
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

    public class GuildSkillDevSlot extends Canvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _gid:Number;
        private var _1426038344btnDevSkill:BasicGlowButton;
        private var _471817573btnReqSkillLabel:String = "";
        private var _3034453btn1:Button;
        private var _94068091btn10:Button;
        private var _3034455btn3:Button;
        private var _3034457btn5:Button;
        private var _987030448levelBtnCanvas:HBox;
        private var _3034459btn7:Button;
        private var learn:int;
        private var _3034460btn8:Button;
        private var _skill:Object = null;
        private var _1110417475label1:RoundedLabel;
        private var _data:Object;
        private var _3034454btn2:Button;
        private var _3034456btn4:Button;
        private var _3034458btn6:Button;
        private var _1464792627btnReqSkillStyleName:String = "";
        private var _3034461btn9:Button;
        private var _1991153647skillSlot:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":340,
                    "height":41,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"skillSlot",
                        "stylesFactory":function ():void
                        {
                            this.borderStyle = "none";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "movable":false,
                                "y":5,
                                "x":6.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"label1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":50,
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
                                "width":213,
                                "height":26.5,
                                "x":110,
                                "y":10.5,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn1",
                                    "events":{
                                        "rollOver":"__btn1_rollOver",
                                        "rollOut":"__btn1_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel1",
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn2",
                                    "events":{
                                        "rollOver":"__btn2_rollOver",
                                        "rollOut":"__btn2_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel2",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn3",
                                    "events":{
                                        "rollOver":"__btn3_rollOver",
                                        "rollOut":"__btn3_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel3",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn4",
                                    "events":{
                                        "rollOver":"__btn4_rollOver",
                                        "rollOut":"__btn4_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel4",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn5",
                                    "events":{
                                        "rollOver":"__btn5_rollOver",
                                        "rollOut":"__btn5_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel5",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn6",
                                    "events":{
                                        "rollOver":"__btn6_rollOver",
                                        "rollOut":"__btn6_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel6",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn7",
                                    "events":{
                                        "rollOver":"__btn7_rollOver",
                                        "rollOut":"__btn7_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel7",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn8",
                                    "events":{
                                        "rollOver":"__btn8_rollOver",
                                        "rollOut":"__btn8_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel8",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn9",
                                    "events":{
                                        "rollOver":"__btn9_rollOver",
                                        "rollOut":"__btn9_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel9",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btn10",
                                    "events":{
                                        "rollOver":"__btn10_rollOver",
                                        "rollOut":"__btn10_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSkillLevel10",
                                            "enabled":false,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnDevSkill",
                                    "events":{
                                        "click":"__btnDevSkill_click",
                                        "rollOver":"__btnDevSkill_rollOver",
                                        "rollOut":"__btnDevSkill_rollOut"
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnSquGreen",
                                            "height":26,
                                            "width":33
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

        public function GuildSkillDevSlot()
        {
            mx_internal::_document = this;
            this.width = 340;
            this.height = 41;
            this.styleName = "SkillUseBar";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildSkillDevSlot._watcherSetupUtil = _arg_1;
        }


        public function __btn3_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function set giid(_arg_1:Number):void
        {
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
            var _local_3:Object = _core.getSkillData(_arg_1, _arg_2);
            var _local_4:TipSkill = TipSkill(_core.view.getUI(ViewManager.TOOLTIP_SKILL));
            var _local_5:Object = {};
            _local_5.temp = _local_3;
            _local_4.object = _local_5;
            _local_4.show();
        }

        public function __btn10_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function __btn4_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        private function _GuildSkillDevSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = skillVO.slotData;
            _local_1 = skillVO.type;
            _local_1 = skillVO.giid;
            _local_1 = skillVO.name;
            _local_1 = Language.GUILDSKILLDEVSLOT_U[1];
        }

        private function _GuildSkillDevSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (skillVO.slotData);
            }, function (_arg_1:Object):void
            {
                skillSlot.slotData = _arg_1;
            }, "skillSlot.slotData");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (skillVO.type);
            }, function (_arg_1:int):void
            {
                skillSlot.type = _arg_1;
            }, "skillSlot.type");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (skillVO.giid);
            }, function (_arg_1:Number):void
            {
                skillSlot.giid = _arg_1;
            }, "skillSlot.giid");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = skillVO.name;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label1.text = _arg_1;
            }, "label1.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDSKILLDEVSLOT_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnDevSkill.label = _arg_1;
            }, "btnDevSkill.label");
            result[4] = binding;
            return (result);
        }

        public function set giids(_arg_1:Object):void
        {
            var _local_2:Object;
            learn = _arg_1.learn;
            if (_core.data.hasData(skillVO.type, _arg_1.id))
            {
                _local_2 = _core.data.getGameData(skillVO.type, _arg_1.id);
                slotData = _local_2;
            }
            else
            {
                _core.data.addEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + skillVO.type) + "_") + _arg_1.id), dataLoaded);
                _core.data.getGameData(skillVO.type, _arg_1.id);
            };
            skillVO.giid = _arg_1.id;
        }

        public function __btnDevSkill_rollOut(_arg_1:MouseEvent):void
        {
            hideTipForDemand();
        }

        public function __btn5_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function get type():int
        {
            return (skillVO.type);
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
                _local_2.enabled = false;
                _local_2.toolTip = "";
                _local_1++;
            };
        }

        private function enableBtnReqSkill(_arg_1:int):void
        {
        }

        public function reset():void
        {
            skillSlot.reset();
        }

        [Bindable(event="propertyChange")]
        public function get btn1():Button
        {
            return (this._3034453btn1);
        }

        [Bindable(event="propertyChange")]
        public function get btn3():Button
        {
            return (this._3034455btn3);
        }

        [Bindable(event="propertyChange")]
        public function get btn5():Button
        {
            return (this._3034457btn5);
        }

        [Bindable(event="propertyChange")]
        public function get btn6():Button
        {
            return (this._3034458btn6);
        }

        [Bindable(event="propertyChange")]
        public function get btn7():Button
        {
            return (this._3034459btn7);
        }

        public function __btn6_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
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

        public function __btnDevSkill_click(_arg_1:MouseEvent):void
        {
            developSkill();
        }

        [Bindable(event="propertyChange")]
        public function get btn8():Button
        {
            return (this._3034460btn8);
        }

        [Bindable(event="propertyChange")]
        public function get btn2():Button
        {
            return (this._3034454btn2);
        }

        public function get slotType():int
        {
            return (skillSlot.slotType);
        }

        private function enableDevBtn():void
        {
            if (ToolKit.isEqual(skillVO.level, 10))
            {
                btnDevSkill.enabled = false;
            };
        }

        public function __btn7_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function set btnDevSkill(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1426038344btnDevSkill;
            if (_local_2 !== _arg_1)
            {
                this._1426038344btnDevSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnDevSkill", _local_2, _arg_1));
            };
        }

        public function set stackMax(_arg_1:int):void
        {
        }

        private function getToLearnSkillId():String
        {
            var _local_4:*;
            if (ToolKit.isEqual(skillVO.level, 10))
            {
                return (null);
            };
            var _local_1:Number = 0;
            if (learn != -1)
            {
                _local_1 = Number(skillVO.level);
            };
            var _local_2:String = GameData.d[GamePredef.TBL_SKILL][skillVO.giid].codeName;
            var _local_3:Object = DataManager.getInstance().gameDataIndex[GamePredef.TBL_SKILL][_local_2];
            for (_local_4 in _local_3)
            {
                if ((_local_1 + 1) == Number(_local_3[_local_4].level))
                {
                    return (_local_4);
                };
            };
            return (null);
        }

        [Bindable(event="propertyChange")]
        public function get btn4():Button
        {
            return (this._3034456btn4);
        }

        private function hideTipForDemand():void
        {
            var _local_1:TipDevSkill = TipDevSkill(_core.view.getUI(ViewManager.TOOLTIP_DEVSKILL));
            _local_1.hide();
        }

        private function dataLoaded(_arg_1:GameDataEvent):void
        {
            if (_arg_1.data.data)
            {
                _arg_1.currentTarget.removeEventListener(((((GameDataEvent.DATA_RECIEVED + "_") + _arg_1.data.type) + "_") + _arg_1.data.index), dataLoaded);
                giid = _arg_1.data.index;
            };
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

        [Bindable(event="propertyChange")]
        public function get btn10():Button
        {
            return (this._94068091btn10);
        }

        public function set type(_arg_1:int):void
        {
            skillVO.type = _arg_1;
        }

        public function set gid(_arg_1:Number):void
        {
            this._gid = _arg_1;
        }

        public function __btn1_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function __btn4_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function __btn5_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function get giid():Number
        {
            return (skillVO.giid);
        }

        public function __btn7_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function restore():void
        {
            skillSlot.restore();
        }

        public function __btn2_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        override public function initialize():void
        {
            var target:GuildSkillDevSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildSkillDevSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_GuildSkillDevSlotWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        private function get btnReqSkillLabel():String
        {
            return (this._471817573btnReqSkillLabel);
        }

        public function __btn6_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function __btn8_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function __btn9_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        public function __btn3_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
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

        public function get selected():Boolean
        {
            return (alpha == 0.5);
        }

        public function __btn8_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
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
                enableDevBtn();
            };
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

        public function __btnDevSkill_rollOver(_arg_1:MouseEvent):void
        {
            showTipForDemand();
        }

        public function set btn1(_arg_1:Button):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        public function set index(_arg_1:int):void
        {
            skillVO.index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        [Bindable(event="propertyChange")]
        public function get btn9():Button
        {
            return (this._3034461btn9);
        }

        public function set btn5(_arg_1:Button):void
        {
            var _local_2:Object = this._3034457btn5;
            if (_local_2 !== _arg_1)
            {
                this._3034457btn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn5", _local_2, _arg_1));
            };
        }

        public function set btn3(_arg_1:Button):void
        {
            var _local_2:Object = this._3034455btn3;
            if (_local_2 !== _arg_1)
            {
                this._3034455btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local_2, _arg_1));
            };
        }

        private function showTipForDemand():void
        {
            var _local_1:int = getMaxLevelSkill();
            var _local_2:Object;
            _local_2 = _core.getSkillData(skillVO.giid, (_local_1 + 1));
            var _local_3:TipDevSkill = TipDevSkill(_core.view.getUI(ViewManager.TOOLTIP_DEVSKILL));
            var _local_4:Object = {};
            _local_4.temp = _local_1;
            _local_4.skill = _local_2;
            _local_3.object = _local_4;
            _local_3.show();
        }

        public function set btn4(_arg_1:Button):void
        {
            var _local_2:Object = this._3034456btn4;
            if (_local_2 !== _arg_1)
            {
                this._3034456btn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn4", _local_2, _arg_1));
            };
        }

        public function __btn9_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function __btn1_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        public function set stackNum(_arg_1:int):void
        {
        }

        public function set btn7(_arg_1:Button):void
        {
            var _local_2:Object = this._3034459btn7;
            if (_local_2 !== _arg_1)
            {
                this._3034459btn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7", _local_2, _arg_1));
            };
        }

        public function set btn8(_arg_1:Button):void
        {
            var _local_2:Object = this._3034460btn8;
            if (_local_2 !== _arg_1)
            {
                this._3034460btn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn8", _local_2, _arg_1));
            };
        }

        public function set btn9(_arg_1:Button):void
        {
            var _local_2:Object = this._3034461btn9;
            if (_local_2 !== _arg_1)
            {
                this._3034461btn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn9", _local_2, _arg_1));
            };
        }

        public function set btn2(_arg_1:Button):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnDevSkill():BasicGlowButton
        {
            return (this._1426038344btnDevSkill);
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

        private function set skillVO(_arg_1:SkillSlotVO):void
        {
            var _local_2:Object = this._2147321034skillVO;
            if (_local_2 !== _arg_1)
            {
                this._2147321034skillVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillVO", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        private function get btnReqSkillStyleName():String
        {
            return (this._1464792627btnReqSkillStyleName);
        }

        public function initView():void
        {
        }

        public function set btn6(_arg_1:Button):void
        {
            var _local_2:Object = this._3034458btn6;
            if (_local_2 !== _arg_1)
            {
                this._3034458btn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn6", _local_2, _arg_1));
            };
        }

        public function __btn2_rollOver(_arg_1:MouseEvent):void
        {
            showTip(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get levelBtnCanvas():HBox
        {
            return (this._987030448levelBtnCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get label1():RoundedLabel
        {
            return (this._1110417475label1);
        }

        private function enableBtn(_arg_1:int):void
        {
            var _local_2:Button = Button(this[("btn" + _arg_1)]);
            if (this.learn == -1)
            {
                _local_2.enabled = false;
            }
            else
            {
                _local_2.enabled = true;
            };
        }

        public function get stackNum():int
        {
            return (0);
        }

        public function __btn10_rollOut(_arg_1:MouseEvent):void
        {
            hideTip();
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot():ItemSlot
        {
            return (this._1991153647skillSlot);
        }

        private function developSkill():void
        {
            var _local_1:* = getToLearnSkillId();
            if (_local_1 == null)
            {
                Alert.show(Language.GUILDSKILLDEVSLOT_U[0]);
                return;
            };
            Core.getInstance().remote.call("developSkill", null, {
                "gid":_gid,
                "sid":_local_1
            });
        }

        private function hideTip():void
        {
            var _local_1:TipSkill = TipSkill(_core.view.getUI(ViewManager.TOOLTIP_SKILL));
            _local_1.hide();
        }

        private function getMaxLevelSkill():int
        {
            var _local_3:Button;
            var _local_1:int;
            var _local_2:int = 1;
            while (_local_2 <= 10)
            {
                _local_3 = Button(this[("btn" + _local_2)]);
                if (_local_3.enabled)
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

        public function set btn10(_arg_1:Button):void
        {
            var _local_2:Object = this._94068091btn10;
            if (_local_2 !== _arg_1)
            {
                this._94068091btn10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn10", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

