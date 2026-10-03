// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SkillManager

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.SkillUseSlot;
    import com.qeedoo.ui.view.comp.BasicMultiLineButton;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.PageSelector;
    import flash.utils.Timer;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compGameStage.BattleCreatureView;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.logic.Battle;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.game.data.GameData;
    import flash.utils.setTimeout;
    import mx.controls.Image;
    import mx.core.DragSource;
    import mx.controls.Button;
    import mx.managers.DragManager;
    import com.qeedoo.ui.view.compBattle.PlayerCmdCanvas;
    import mx.binding.Binding;
    import com.qeedoo.game.event.GameDataEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import flash.net.Responder;
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

    public class SkillManager extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1596220961skillSlot0:SkillUseSlot;
        private var _1554141554tabBtn5:BasicMultiLineButton;
        private var _1596220965skillSlot4:SkillUseSlot;
        private var _3582325vBox:VBox;
        private var _selectedSlot:SkillUseSlot;
        private var _skillList2:Array;
        private var _skillList3:Array;
        private var _skillList4:Array;
        private var _skillList5:Array;
        private var _skillList6:Array;
        private var _skillList7:Array;
        private var _1554141553tabBtn6:BasicMultiLineButton;
        private var _skillList1:Array;
        private var _1596220964skillSlot3:SkillUseSlot;
        private var _1554141559tabBtn0:BasicMultiLineButton;
        public var _SkillManager_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1952114124expSkill:Currency;
        private var _1554141558tabBtn1:BasicMultiLineButton;
        private var tabBtnNum:int = 7;
        private var _1596220963skillSlot2:SkillUseSlot;
        private var _2106311967tileItem:Canvas;
        private var ITEM_COUNT_PER_PAGE:int = 5;
        public var _SkillManager_Canvas2:Canvas;
        private var _1554141557tabBtn2:BasicMultiLineButton;
        public var firstTimeFlag:Boolean = true;
        private var _607339634pageSelector:PageSelector;
        private var _sList:Object;
        private var _disableFlag:Boolean = false;
        private var _laterTimer:Timer;
        private var _1554141556tabBtn3:BasicMultiLineButton;
        private var _1596220962skillSlot1:SkillUseSlot;
        private var _skillPageNo1:int = 0;
        private var _skillPageNo2:int = 0;
        private var _skillPageNo3:int = 0;
        private var _skillPageNo4:int = 0;
        private var _skillPageNo5:int = 0;
        private var _skillPageNo6:int = 0;
        private var _skillPageNo7:int = 0;
        private var _1554141555tabBtn4:BasicMultiLineButton;
        private var selectedTabIndex:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":372,
                    "height":358,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SkillManager_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"tileItem",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "horizontalScrollPolicy":"off",
                                "y":40,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_SkillManager_Canvas2",
                                    "events":{"mouseDown":"___SkillManager_Canvas2_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "30";
                                        this.right = "10";
                                        this.borderColor = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":290,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vBox",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "5";
                                                    this.paddingLeft = 5;
                                                    this.paddingTop = 5;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":250,
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":SkillUseSlot,
                                                            "id":"skillSlot0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"skillType":"character"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SkillUseSlot,
                                                            "id":"skillSlot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"skillType":"character"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SkillUseSlot,
                                                            "id":"skillSlot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"skillType":"character"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SkillUseSlot,
                                                            "id":"skillSlot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"skillType":"character"});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":SkillUseSlot,
                                                            "id":"skillSlot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"skillType":"character"});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":0xFF});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Currency,
                                    "id":"expSkill",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":52,
                                            "y":293,
                                            "width":112
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10,
                                            "selected":true,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":50,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":90,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":130,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":170,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn5",
                                    "events":{"click":"__tabBtn5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":210,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn6",
                                    "events":{"click":"__tabBtn6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":250,
                                            "styleName":"VerticalTab",
                                            "height":40,
                                            "width":20
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _90794110_core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SkillManager()
        {
            mx_internal::_document = this;
            this.width = 372;
            this.height = 358;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SkillManager._watcherSetupUtil = _arg_1;
        }


        private function set _core(_arg_1:Core):void
        {
            var _local_2:Object = this._90794110_core;
            if (_local_2 !== _arg_1)
            {
                this._90794110_core = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_core", _local_2, _arg_1));
            };
        }

        private function useSkill(_arg_1:SkillUseSlot, _arg_2:MouseEvent):void
        {
            var _local_4:String;
            var _local_5:int;
            var _local_6:Object;
            var _local_3:Object = _arg_1.slotData;
            if (!_local_3)
            {
                return;
            };
            if (_arg_2.target.hasOwnProperty("id"))
            {
                _local_4 = _arg_2.target.id;
                _local_5 = int(_local_4.substr(3));
                _local_3 = skillGetLevel(_local_3.id, _local_5);
            };
            if ((((_core.state == GamePredef.ST_CORE_BATTLE) && (_core.cmdState == GamePredef.ST_BATTLE_SKILL)) && (BattleCreatureView.cmdMode)))
            {
                if (_core.checkSkillRequire(_local_3, true))
                {
                    _core.skill = _local_3;
                    if (_local_3.targetType == Battle.SKILL_TARGET_TYPE_SELF_PLAYER)
                    {
                        _core.battle.battleCmd(_core.player.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                        _core.skill = null;
                        _core.skillLevel = -1;
                    }
                    else
                    {
                        if (_local_3.targetType == Battle.SKILL_TARGET_TYPE_SELF_PET)
                        {
                            _local_6 = _core.battle.battleGetPlayerPet(_core.view.getUI(ViewManager.STAGE_BATTLE).cList);
                            if (null == _local_6)
                            {
                                _core.sysMidNote(Language.SKILLMANAGER_U[6]);
                                return;
                            };
                            _core.battle.battleCmd(_local_6.battleId, GamePredef.BATTLE_ACTION_SKILL, _core.skill.id, _core.skillLevel);
                            _core.skill = null;
                            _core.skillLevel = -1;
                        }
                        else
                        {
                            _core.view.showSelect();
                        };
                    };
                };
            }
            else
            {
                drag(_arg_1, _arg_2);
            };
        }

        public function set tabBtn2(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function autoClick(_arg_1:Object):void
        {
            var _local_2:int;
            var _local_3:*;
            var _local_4:int;
            var _local_5:int;
            if (_arg_1)
            {
                _local_2 = GameData.d[GamePredef.TBL_SKILL][_arg_1.id].useEnv;
                if (_local_2 >= 0)
                {
                    tabBtnClick(_local_2);
                };
                _local_3 = true;
                _local_4 = 5;
                while (((_local_3) && (_local_4--)))
                {
                    _local_5 = 0;
                    while (_local_5 < 5)
                    {
                        if ((((this[("skillSlot" + _local_5)]) && (this[("skillSlot" + _local_5)].slotData)) && (this[("skillSlot" + _local_5)].slotData.name == _arg_1.name)))
                        {
                            _local_3 = false;
                            break;
                        };
                        _local_5++;
                    };
                    if (_local_5 == 5)
                    {
                        setTimeout(delayClick, 200);
                        pageSelector.pageNo++;
                    };
                };
            };
        }

        public function set tabBtn1(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        public function set tabBtn6(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141553tabBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1554141553tabBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot1():SkillUseSlot
        {
            return (this._1596220962skillSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot2():SkillUseSlot
        {
            return (this._1596220963skillSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot3():SkillUseSlot
        {
            return (this._1596220964skillSlot3);
        }

        public function set tabBtn4(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        private function drag(_arg_1:SkillUseSlot, _arg_2:MouseEvent, _arg_3:int=0):void
        {
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:*;
            var _local_4:Image = Image(_arg_1.skillSlot.itemIcon);
            var _local_5:DragSource = new DragSource();
            _local_5.addData(_local_4, "image");
            if (_arg_1.skillSlot.type == GamePredef.TBL_SKILL)
            {
                if ((_arg_2.target is Button))
                {
                    _local_8 = Number(Button(_arg_2.target).id.substr(3, Button(_arg_2.target).id.length));
                    if (((_local_8 > 0) && (_local_8 < 10)))
                    {
                        _local_9 = _core.data.gameDataIndex[GamePredef.TBL_SKILL][_core.data.gameData[GamePredef.TBL_SKILL][_arg_1.skillSlot.slotData.id].codeName];
                        for each (_local_10 in _local_9)
                        {
                            if (_local_10.level == _local_8)
                            {
                                _arg_1.skillSlot.giid = _local_10.id;
                                break;
                            };
                        };
                    };
                };
            };
            _local_5.addData(_arg_1.skillSlot, "slot");
            _local_5.addData(_arg_3, "level");
            var _local_6:Image = new Image();
            _local_6.source = _local_4.source;
            _local_6.height = _local_4.height;
            _local_6.width = _local_4.width;
            _local_6.x = _local_4.x;
            _local_6.y = _local_4.y;
            var _local_7:int;
            if (_arg_3 > 0)
            {
                _local_7 = (-78 - (_arg_3 * 16));
            };
            DragManager.doDrag(_local_4, _local_5, _arg_2, _local_6, _local_7, 0, 0.5);
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot0():SkillUseSlot
        {
            return (this._1596220961skillSlot0);
        }

        public function set tabBtn3(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        private function _SkillManager_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SKILLMANAGER_U[4];
            _local_1 = Language.SKILLMANAGER_U[0];
            _local_1 = Currency.TYPE_POINT;
            _local_1 = _core.player.expSkill;
            _local_1 = Language.SKILLMANAGER_U[0];
            _local_1 = Language.SKILLMANAGER_U[1];
            _local_1 = Language.SKILLMANAGER_U[2];
            _local_1 = Language.SKILLMANAGER_U[5];
            _local_1 = Language.SKILLMANAGER_U[3];
            _local_1 = Language.SKILLMANAGER_U[7];
            _local_1 = Language.SKILLMANAGER_U[8];
        }

        public function set tabBtn5(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        private function skillGetLevel(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:*;
            var _local_5:Object;
            var _local_3:Object = GameData.d[GamePredef.TBL_SKILL][_arg_1];
            if (_arg_2 > 0)
            {
                _local_4 = _core.data.gameDataIndex[GamePredef.TBL_SKILL][_local_3.codeName];
                for each (_local_5 in _local_4)
                {
                    if (Number(_local_5.level) == Number(_arg_2))
                    {
                        _local_3 = _local_5;
                        break;
                    };
                };
            };
            return (_local_3);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            selectedTabIndex = _arg_1;
            pageSelector.initPageSeletor(this[("_skillList" + (_arg_1 + 1))].length, ITEM_COUNT_PER_PAGE);
            var _local_2:int;
            while (_local_2 < tabBtnNum)
            {
                this[("tabBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("tabBtn" + _arg_1)].selected = true;
        }

        [Bindable(event="propertyChange")]
        public function get expSkill():Currency
        {
            return (this._1952114124expSkill);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot4():SkillUseSlot
        {
            return (this._1596220965skillSlot4);
        }

        override public function hide():void
        {
            var _local_1:PlayerCmdCanvas;
            super.hide();
            if (_core.state == GamePredef.ST_CORE_BATTLE)
            {
                _local_1 = PlayerCmdCanvas(_core.view.getUI(ViewManager.MAIN_BATTLE_PLAYER));
                _local_1.doCmd("btnAttack");
            };
        }

        public function set skillSlot2(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._1596220963skillSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1596220963skillSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot2", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            firstTimeFlag = true;
            clearSlots();
        }

        public function set skillSlot1(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._1596220962skillSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1596220962skillSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot1", _local_2, _arg_1));
            };
        }

        public function enableUI():void
        {
            if (initialized)
            {
                if (this._disableFlag)
                {
                    this._disableFlag = false;
                };
            }
            else
            {
                this._disableFlag = false;
            };
        }

        public function set tabBtn0(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set skillSlot4(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._1596220965skillSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1596220965skillSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot4", _local_2, _arg_1));
            };
        }

        public function set skillSlot0(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._1596220961skillSlot0;
            if (_local_2 !== _arg_1)
            {
                this._1596220961skillSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot0", _local_2, _arg_1));
            };
        }

        public function set skillSlot3(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._1596220964skillSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1596220964skillSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot3", _local_2, _arg_1));
            };
        }

        public function set expSkill(_arg_1:Currency):void
        {
            var _local_2:Object = this._1952114124expSkill;
            if (_local_2 !== _arg_1)
            {
                this._1952114124expSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expSkill", _local_2, _arg_1));
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get vBox():VBox
        {
            return (this._3582325vBox);
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4);
        }

        private function _SkillManager_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillManager_BasicTitleCanvas1.text = _arg_1;
            }, "_SkillManager_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SkillManager_Canvas2.label = _arg_1;
            }, "_SkillManager_Canvas2.label");
            result[1] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_POINT);
            }, function (_arg_1:uint):void
            {
                expSkill.type = _arg_1;
            }, "expSkill.type");
            result[2] = binding;
            binding = new Binding(this, function ():Number
            {
                return (_core.player.expSkill);
            }, function (_arg_1:Number):void
            {
                expSkill.value = _arg_1;
            }, "expSkill.value");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SKILLMANAGER_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn6.label = _arg_1;
            }, "tabBtn6.label");
            result[10] = binding;
            return (result);
        }

        private function clearPage():void
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < 5)
            {
                this[("skillSlot" + _local_1)].removeEventListener(MouseEvent.CLICK, clickSkill);
                this[("skillSlot" + _local_1)].removeEventListener(GameDataEvent.SKILL_LEVEL_CLICKED, skillLevelClicked);
                this[("skillSlot" + _local_1)].currentState = "";
                this[("skillSlot" + _local_1)].clean();
                this[("skillSlot" + _local_1)].visible = false;
                if (selectedTabIndex == 2)
                {
                    this[("skillSlot" + _local_1)].learnAble = false;
                }
                else
                {
                    if (selectedTabIndex == 3)
                    {
                        this[("skillSlot" + _local_1)].learnAble = true;
                    }
                    else
                    {
                        if (selectedTabIndex == 5)
                        {
                            this[("skillSlot" + _local_1)].maxLevel = 3;
                        };
                    };
                };
                _local_1++;
            };
        }

        public function disableUI():void
        {
            var _local_1:int;
            if (initialized)
            {
                if (!this._disableFlag)
                {
                    this._disableFlag = true;
                }
                else
                {
                    _local_1 = 0;
                    while (_local_1 < 5)
                    {
                        this[("skillSlot" + _local_1)].btnReqSkill.enabled = false;
                        _local_1++;
                    };
                };
            }
            else
            {
                this._disableFlag = true;
            };
        }

        [Bindable(event="propertyChange")]
        private function get _core():Core
        {
            return (this._90794110_core);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicMultiLineButton
        {
            return (this._1554141557tabBtn2);
        }

        public function updateMWeaponSkillList(_arg_1:Object=null, _arg_2:Boolean=true):void
        {
            var _local_4:Object;
            var _local_5:*;
            var _local_6:int;
            var _local_7:*;
            var _local_8:*;
            var _local_9:*;
            var _local_10:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:*;
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_arg_1)
            {
                trace("初始化时未获得实例数据，再次刷新神器技能面板");
            };
            tileItem.visible = false;
            _skillList6 = [];
            var _local_3:* = {};
            for each (_local_4 in _core.player.skillList)
            {
                _local_6 = GameData.d[GamePredef.TBL_SKILL][_local_4.sid].useEnv;
                switch (_local_6)
                {
                    case 5:
                        _local_3[GameData.d[GamePredef.TBL_SKILL][_local_4.sid].name] = true;
                        _skillList6.push({
                            "id":_local_4.sid,
                            "position":_local_4.position,
                            "temp":1,
                            "creKind":GameData.d[GamePredef.TBL_SKILL][_local_4.sid].creKind,
                            "kind":_local_4.kind,
                            "sort":((Number(_local_4.kind) == 2) ? 10 : Number(_local_4.kind))
                        });
                        break;
                };
            };
            for (_local_5 in GamePredef.MW_MAIN_POSITION)
            {
                _local_7 = _core.data.getSlot({"sid":_local_5});
                if (_local_7)
                {
                    _local_8 = _core.getTemplateData(_local_7.type, _local_7.itemId);
                    _local_9 = _core.data.getData(_local_7.type, _local_7.itemId);
                    _local_10 = _local_8.artifactSkill;
                    _local_11 = ((_local_10) && (_local_10.toString().split("|")));
                    _local_12 = _local_11[0];
                    _local_13 = _core.getTemplateData(GamePredef.TBL_SKILL, _local_12);
                    if (_local_13)
                    {
                        _arg_1 = {
                            "id":_local_13.id,
                            "position":(_local_5 + "-1"),
                            "temp":-1,
                            "creKind":_local_13.creKind,
                            "kind":_local_13.kind,
                            "sort":((Number(_local_13.kind) == 2) ? 10 : Number(_local_13.kind))
                        };
                        if ((((!(_local_3[_local_13.name])) && (_local_9.endureLeft > 0)) && (_arg_2)))
                        {
                            _skillList6.push(_arg_1);
                        };
                    };
                };
            };
            _skillList6.sortOn("sort", Array.NUMERIC);
            if (selectedTabIndex == 5)
            {
                pageSelector.initPageSeletor(_skillList6.length, ITEM_COUNT_PER_PAGE);
                pageSelector.pageNo = _skillPageNo6;
            };
            tileItem.visible = true;
        }

        override public function initialize():void
        {
            var target:SkillManager;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SkillManager_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SkillManagerWatcherSetupUtil");
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
        public function get tabBtn1():BasicMultiLineButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicMultiLineButton
        {
            return (this._1554141556tabBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicMultiLineButton
        {
            return (this._1554141555tabBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicMultiLineButton
        {
            return (this._1554141559tabBtn0);
        }

        public function ___SkillManager_Canvas2_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function clickSkill(_arg_1:MouseEvent):void
        {
            var _local_2:SkillUseSlot = SkillUseSlot(_arg_1.currentTarget);
            if (_arg_1.target == _local_2.btnReqSkill)
            {
                return;
            };
            useSkill(_local_2, _arg_1);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(5);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():BasicMultiLineButton
        {
            return (this._1554141554tabBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn6():BasicMultiLineButton
        {
            return (this._1554141553tabBtn6);
        }

        private function delayClick():void
        {
            pageSelector.pageNo++;
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            this[("_skillPageNo" + (selectedTabIndex + 1))] = pageSelector.pageNo;
            drawPage(selectedTabIndex, _arg_1, _arg_2);
        }

        override public function update():void
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:Array;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:Array;
            var _local_10:*;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:*;
            var _local_14:int;
            var _local_15:Object;
            var _local_16:String;
            var _local_17:int;
            var _local_18:int;
            var _local_19:String;
            var _local_20:*;
            var _local_21:*;
            var _local_22:*;
            var _local_23:*;
            var _local_24:*;
            var _local_25:*;
            var _local_26:*;
            var _local_27:*;
            tileItem.visible = false;
            clearSlots();
            var _local_1:Object = {};
            var _local_2:Object = _core.player.awakenPointDict;
            for each (_local_3 in _core.player.skillList)
            {
                _local_15 = GameData.d[GamePredef.TBL_SKILL][_local_3.sid];
                _local_16 = _local_15.codeName;
                if (((_local_2) && (_local_2[_local_16])))
                {
                    _local_18 = int(_local_2[_local_16]);
                    if (int(_local_15[("exSid" + _local_18)]) > 0)
                    {
                        _local_19 = _local_15[("exSid" + _local_18)];
                        if (_core.data.hasData(GamePredef.TBL_SKILL, Number(_local_19)))
                        {
                            _local_15 = GameData.d[GamePredef.TBL_SKILL][_local_19];
                        };
                    };
                };
                _local_17 = _local_15.useEnv;
                switch (_local_17)
                {
                    case 0:
                        _skillList1.push({
                            "id":_local_15.id,
                            "temp":1,
                            "creKind":_local_15.creKind
                        });
                        break;
                    case 1:
                        _skillList2.push({
                            "id":_local_15.id,
                            "temp":1,
                            "creKind":_local_15.creKind
                        });
                        break;
                    case 2:
                        _skillList3.push(_local_15.id);
                        break;
                    case 3:
                        _skillList4.push({
                            "id":_local_15.id,
                            "temp":1,
                            "creKind":_local_15.creKind
                        });
                        break;
                    case 4:
                        _skillList5.push({
                            "id":_local_15.id,
                            "temp":1,
                            "creKind":_local_15.creKind
                        });
                        break;
                    case 5:
                        _local_1[_local_15.name] = true;
                        _skillList6.push({
                            "id":_local_15.id,
                            "position":_local_3.position,
                            "temp":1,
                            "creKind":_local_15.creKind,
                            "kind":_local_3.kind,
                            "sort":((Number(_local_3.kind) == 2) ? 10 : Number(_local_3.kind))
                        });
                        break;
                    case 6:
                        _skillList7.push({
                            "id":_local_15.id,
                            "temp":1,
                            "creKind":_local_15.creKind
                        });
                        break;
                };
            };
            _local_4 = (("|" + _core.player.classId) + "|");
            _local_5 = _core.data.gameDataIndex2[GamePredef.TBL_SKILL][_local_4];
            _local_6 = [];
            _local_7 = [];
            _local_8 = [];
            _local_9 = [];
            for each (_local_10 in _local_5)
            {
                if (_local_10.reqLevel <= _core.player.level)
                {
                    if (!((_local_10.reqCL == 10) && (!(_core.player.expRe))))
                    {
                        if (_local_10.level == 1)
                        {
                            if (((_local_2) && (_local_2[_local_10.codeName])))
                            {
                                _local_18 = int(_local_2[_local_10.codeName]);
                                if (int(_local_10[("exSid" + _local_18)]) > 0)
                                {
                                    _local_19 = _local_10[("exSid" + _local_18)];
                                    _local_10 = GameData.d[GamePredef.TBL_SKILL][_local_19];
                                };
                            };
                            switch (int(_local_10.useEnv))
                            {
                                case 0:
                                    _local_6.push({
                                        "learchSkill":Number(_local_10.reqLevel),
                                        "id":_local_10.id,
                                        "temp":-1,
                                        "creKind":_local_10.creKind
                                    });
                                    break;
                                case 1:
                                    _local_7.push({
                                        "learchSkill":Number(_local_10.reqLevel),
                                        "id":_local_10.id,
                                        "temp":-1,
                                        "creKind":_local_10.creKind
                                    });
                                    break;
                                case 3:
                                    _local_8.push({
                                        "learchSkill":Number(_local_10.reqLevel),
                                        "id":_local_10.id,
                                        "temp":-1,
                                        "creKind":_local_10.creKind
                                    });
                                    break;
                            };
                        };
                    };
                };
            };
            _local_11 = _core.data.gameDataIndex3[GamePredef.TBL_SKILL]["3"];
            for each (_local_10 in _local_11)
            {
                if (_local_10.reqLevel <= _core.player.level)
                {
                    if (_local_10.level == 1)
                    {
                        _local_8.push({
                            "learchSkill":Number(_local_10.reqLevel),
                            "id":_local_10.id,
                            "temp":-1,
                            "creKind":_local_10.creKind,
                            "orderNum":GamePredef.TRAINING_SKILL_ORDER[_local_10.codeName]
                        });
                    };
                };
            };
            _local_12 = _core.data.gameDataIndex3[GamePredef.TBL_SKILL]["4"];
            for each (_local_10 in _local_12)
            {
                if (_local_10.reqLevel <= _core.player.level)
                {
                    if (_local_10.level == 1)
                    {
                        _local_9.push({
                            "learchSkill":Number(_local_10.reqLevel),
                            "id":_local_10.id,
                            "temp":-1,
                            "creKind":_local_10.creKind,
                            "nameLength":_local_10.name.length
                        });
                    };
                };
            };
            for (_local_13 in GamePredef.MW_MAIN_POSITION)
            {
                _local_20 = _core.data.getSlot({"sid":_local_13});
                if (_local_20)
                {
                    _local_21 = _core.getTemplateData(_local_20.type, _local_20.itemId);
                    _local_22 = _core.data.getData(_local_20.type, _local_20.itemId);
                    if (_local_21 == null)
                    {
                        _core.remote.call("gdc", new Responder(updateMWeaponSkillList), _local_20.type, _local_20.itemId);
                    }
                    else
                    {
                        _local_23 = _local_21.artifactSkill;
                        _local_24 = ((_local_23) && (_local_23.toString().split("|")));
                        _local_25 = _local_24[0];
                        _local_26 = _core.getTemplateData(GamePredef.TBL_SKILL, _local_25);
                        if (_local_26)
                        {
                            _local_27 = {
                                "id":_local_26.id,
                                "position":(_local_13 + "-1"),
                                "temp":-1,
                                "creKind":_local_26.creKind,
                                "kind":_local_26.kind,
                                "sort":((Number(_local_26.kind) == 2) ? 10 : Number(_local_26.kind))
                            };
                            if (((!(_local_1[_local_26.name])) && (_local_22.endureLeft > 0)))
                            {
                                _skillList6.push(_local_27);
                            };
                        };
                    };
                };
            };
            _local_6.sortOn("learchSkill", (Array.NUMERIC | Array.DESCENDING));
            _local_7.sortOn("learchSkill", (Array.NUMERIC | Array.DESCENDING));
            _local_8.sortOn("orderNum", (Array.NUMERIC | Array.DESCENDING));
            _local_9.sortOn(["nameLength", "learchSkill"], [(Array.NUMERIC | Array.DESCENDING), (Array.NUMERIC | Array.DESCENDING)]);
            _skillList6.sortOn("sort", Array.NUMERIC);
            skillListProcess(_local_6, _skillList1);
            skillListProcess(_local_7, _skillList2);
            skillListProcess(_local_8, _skillList4);
            skillListProcess(_local_9, _skillList5);
            _skillList1 = _local_6.reverse();
            _skillList2 = _local_7.reverse();
            _skillList4 = _local_8.reverse();
            _skillList5 = _local_9.reverse();
            _local_14 = 1;
            while (_local_14 <= 7)
            {
                this[("_skillPageNo" + _local_14)] = 0;
                _local_14++;
            };
            pageSelector.initPageSeletor(this[("_skillList" + (selectedTabIndex + 1))].length, ITEM_COUNT_PER_PAGE);
            pageSelector.pageNo = this[("_skillPageNo" + (selectedTabIndex + 1))];
            tileItem.visible = true;
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            update();
        }

        private function skillListProcess(_arg_1:Array, _arg_2:Array):void
        {
            var _local_4:int;
            var _local_3:int;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = 0;
                while (_local_4 < _arg_2.length)
                {
                    if (_core.data.gameData[GamePredef.TBL_SKILL][_arg_2[_local_4].id].name == _core.data.gameData[GamePredef.TBL_SKILL][_arg_1[_local_3].id].name)
                    {
                        _arg_1[_local_3] = _arg_2[_local_4];
                        break;
                    };
                    _local_4++;
                };
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get tileItem():Canvas
        {
            return (this._2106311967tileItem);
        }

        private function clearSlots():void
        {
            _skillList1 = [];
            _skillList2 = [];
            _skillList3 = [];
            _skillList4 = [];
            _skillList5 = [];
            _skillList6 = [];
            _skillList7 = [];
        }

        public function set vBox(_arg_1:VBox):void
        {
            var _local_2:Object = this._3582325vBox;
            if (_local_2 !== _arg_1)
            {
                this._3582325vBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vBox", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
                firstTimeFlag = false;
            };
        }

        public function battleShow():void
        {
            show();
        }

        public function set tileItem(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2106311967tileItem;
            if (_local_2 !== _arg_1)
            {
                this._2106311967tileItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileItem", _local_2, _arg_1));
            };
        }

        private function skillLevelClicked(_arg_1:GameDataEvent):void
        {
            var _local_2:int;
            var _local_3:Object;
            var _local_4:Object;
            if (((_core.state == GamePredef.ST_CORE_BATTLE) && (_core.cmdState == GamePredef.ST_BATTLE_SKILL)))
            {
                _local_2 = _arg_1.data.level;
                _local_3 = _arg_1.data.skill;
                _local_4 = _core.getSkillData(_local_3.id, _local_2);
                if (_core.checkSkillRequire(_local_4, true))
                {
                    _core.skill = _local_4;
                    _core.skillLevel = _local_2;
                    visible = false;
                };
            }
            else
            {
                drag(_arg_1.data.slot, _arg_1.data.event, _arg_1.data.level);
            };
        }

        private function drawPage(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_6:SkillUseSlot;
            var _local_4:String = ((_arg_1 == 2) ? "giid" : "giids");
            var _local_5:int;
            while (_local_5 < _arg_3)
            {
                _local_6 = this[("skillSlot" + _local_5)];
                _local_6[_local_4] = this[("_skillList" + (_arg_1 + 1))][(_local_5 + _arg_2)];
                _local_6.visible = true;
                if ((((_arg_1 == 0) || (_arg_1 == 2)) || ((_arg_1 == 5) && (_local_6.isDragAble))))
                {
                    _local_6.addEventListener(MouseEvent.CLICK, clickSkill);
                    _local_6.addEventListener(GameDataEvent.SKILL_LEVEL_CLICKED, skillLevelClicked);
                };
                _local_5++;
            };
            if (_disableFlag)
            {
                disableUI();
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        public function __tabBtn6_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(6);
        }


    }
}//package com.qeedoo.ui.view.compDragable

