// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.PetCmdCanvas

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleLabel;
    import mx.states.RemoveChild;
    import mx.containers.VBox;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import flash.events.MouseEvent;
    import mx.states.State;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.binding.BindingManager;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.states.SetProperty;
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

    public class PetCmdCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _355403348btnDefence:BasicGlowButton;
        public var _PetCmdCanvas_BasicTitleLabel1:BasicTitleLabel;
        private var _1767350363btnPosition:BasicGlowButton;
        private var _2097083733btnSkill:BasicGlowButton;
        public var _PetCmdCanvas_RemoveChild1:RemoveChild;
        private var _191477245btnEscape:BasicGlowButton;
        private var _78390212btnAttack:BasicGlowButton;
        private var _205905807btnItem:BasicGlowButton;
        private var _1595507859wrapper:VBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":83,
                    "height":185,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"wrapper",
                        "stylesFactory":function ():void
                        {
                            this.left = "5";
                            this.right = "5";
                            this.top = "27";
                            this.verticalGap = 3;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnAttack",
                                    "events":{"click":"__btnAttack_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":73,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnDefence",
                                    "events":{"click":"__btnDefence_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":73,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnSkill",
                                    "events":{"click":"__btnSkill_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":73,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnItem",
                                    "events":{"click":"__btnItem_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":73,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnPosition",
                                    "events":{"click":"__btnPosition_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":73,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnEscape",
                                    "events":{"click":"__btnEscape_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":73,
                                            "styleName":"CrystalBlueButton"
                                        });
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":4,
                                "width":65,
                                "height":22,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTitleLabel,
                                    "id":"_PetCmdCanvas_BasicTitleLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 8375228;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":-2,
                                            "x":8,
                                            "width":65
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PetCmdCanvas()
        {
            mx_internal::_document = this;
            this.width = 83;
            this.height = 185;
            this.styleName = "CanvasBattleCommand";
            this.states = [_PetCmdCanvas_State1_c()];
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PetCmdCanvas._watcherSetupUtil = _arg_1;
        }


        public function set btnEscape(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._191477245btnEscape;
            if (_local_2 !== _arg_1)
            {
                this._191477245btnEscape = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnEscape", _local_2, _arg_1));
            };
        }

        private function btnClick(_arg_1:Event):void
        {
            var _local_2:BasicGlowButton = BasicGlowButton(_arg_1.currentTarget);
            doCmd(_local_2.id);
            if (_local_2.id == "btnAttack")
            {
                _core.view.showSelect();
            };
            dispatchEvent(new Event(DragableCanvas.EVENT_CLOSE));
        }

        public function __btnPosition_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        public function set btnAttack(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._78390212btnAttack;
            if (_local_2 !== _arg_1)
            {
                this._78390212btnAttack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAttack", _local_2, _arg_1));
            };
        }

        private function _PetCmdCanvas_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "noEscape";
            _local_1.overrides = [_PetCmdCanvas_RemoveChild1_i(), _PetCmdCanvas_SetProperty1_c()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get wrapper():VBox
        {
            return (this._1595507859wrapper);
        }

        [Bindable(event="propertyChange")]
        public function get btnItem():BasicGlowButton
        {
            return (this._205905807btnItem);
        }

        override public function initialize():void
        {
            var target:PetCmdCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PetCmdCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_PetCmdCanvasWatcherSetupUtil");
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

        public function set btnItem(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._205905807btnItem;
            if (_local_2 !== _arg_1)
            {
                this._205905807btnItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnItem", _local_2, _arg_1));
            };
        }

        private function _PetCmdCanvas_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _PetCmdCanvas_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_PetCmdCanvas_RemoveChild1", _PetCmdCanvas_RemoveChild1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnEscape():BasicGlowButton
        {
            return (this._191477245btnEscape);
        }

        public function set wrapper(_arg_1:VBox):void
        {
            var _local_2:Object = this._1595507859wrapper;
            if (_local_2 !== _arg_1)
            {
                this._1595507859wrapper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wrapper", _local_2, _arg_1));
            };
        }

        public function doCmd(_arg_1:String):void
        {
            var _local_3:Object;
            _core.view.hide(ViewManager.PANEL_PET);
            _core.view.hide(ViewManager.PANEL_BAG);
            unSelectAll();
            if (this[_arg_1])
            {
                this[_arg_1].selected = true;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
            if (_local_2)
            {
                _local_2.hide();
            };
            switch (_arg_1)
            {
                case "btnSkill":
                    _core.cmdState = GamePredef.ST_BATTLE_SKILL;
                    _local_3 = _core.view.getUI(ViewManager.PANEL_PET);
                    _local_3.currentState = "skill";
                    _local_3.showPet(_core.battlePet);
                    _local_3.show();
                    return;
                case "btnDefence":
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_DEFENCE, -1);
                    return;
                case "btnItem":
                    _core.cmdState = GamePredef.ST_BATTLE_ITEM;
                    _core.view.getUI(ViewManager.PANEL_BAG).showItem();
                    return;
                case "btnAttack":
                    _core.cmdState = GamePredef.ST_BATTLE_ATTACK;
                    return;
                case "btnEscape":
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_ESCAPE, 0);
                    return;
                case "btnPosition":
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_POSITION, 0);
                    return;
                case "btnAuto":
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_AUTO, 0);
                    return;
                default:
                    _core.sysMidNote(Language.PERSONINFOCANVAS_S[0]);
            };
        }

        public function set btnSkill(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2097083733btnSkill;
            if (_local_2 !== _arg_1)
            {
                this._2097083733btnSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnSkill", _local_2, _arg_1));
            };
        }

        public function __btnDefence_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        public function set btnDefence(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._355403348btnDefence;
            if (_local_2 !== _arg_1)
            {
                this._355403348btnDefence = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnDefence", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAttack():BasicGlowButton
        {
            return (this._78390212btnAttack);
        }

        [Bindable(event="propertyChange")]
        public function get btnPosition():BasicGlowButton
        {
            return (this._1767350363btnPosition);
        }

        private function _PetCmdCanvas_SetProperty1_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "height";
            _local_1.value = 165;
            return (_local_1);
        }

        public function set btnPosition(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1767350363btnPosition;
            if (_local_2 !== _arg_1)
            {
                this._1767350363btnPosition = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPosition", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnDefence():BasicGlowButton
        {
            return (this._355403348btnDefence);
        }

        [Bindable(event="propertyChange")]
        public function get btnSkill():BasicGlowButton
        {
            return (this._2097083733btnSkill);
        }

        private function _PetCmdCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (btnEscape);
            }, function (_arg_1:DisplayObject):void
            {
                _PetCmdCanvas_RemoveChild1.target = _arg_1;
            }, "_PetCmdCanvas_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAttack.label = _arg_1;
            }, "btnAttack.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnDefence.label = _arg_1;
            }, "btnDefence.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSkill.label = _arg_1;
            }, "btnSkill.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnItem.label = _arg_1;
            }, "btnItem.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPosition.label = _arg_1;
            }, "btnPosition.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnEscape.label = _arg_1;
            }, "btnEscape.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETCMDCANVAS_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PetCmdCanvas_BasicTitleLabel1.text = _arg_1;
            }, "_PetCmdCanvas_BasicTitleLabel1.text");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT5]);
            }, function (_arg_1:Array):void
            {
                _PetCmdCanvas_BasicTitleLabel1.filters = _arg_1;
            }, "_PetCmdCanvas_BasicTitleLabel1.filters");
            result[8] = binding;
            return (result);
        }

        private function _PetCmdCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = btnEscape;
            _local_1 = Language.PETCMDCANVAS_U[3];
            _local_1 = Language.PETCMDCANVAS_U[2];
            _local_1 = Language.PETCMDCANVAS_U[0];
            _local_1 = Language.PETCMDCANVAS_U[1];
            _local_1 = Language.PETCMDCANVAS_U[4];
            _local_1 = Language.PETCMDCANVAS_U[6];
            _local_1 = Language.PETCMDCANVAS_U[5];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT5];
        }

        private function unSelectAll():void
        {
            var _local_1:Object;
            for each (_local_1 in wrapper.getChildren())
            {
                if ((_local_1 is BasicGlowButton))
                {
                    _local_1.selected = false;
                };
            };
        }

        public function __btnAttack_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        public function __btnEscape_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        public function __btnItem_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        override public function show():void
        {
            var _local_1:AutoBattleCanvas = AutoBattleCanvas(_core.view.getUI(ViewManager.PANEL_BATTLEAUTO));
            if (_local_1.auto)
            {
                _core.battle.battlePetAuto();
            }
            else
            {
                _core.cmdState = GamePredef.ST_BATTLE_ATTACK;
                unSelectAll();
                btnAttack.selected = true;
                visible = true;
            };
            if (_core.player.currentHp <= 0)
            {
                currentState = "";
            }
            else
            {
                currentState = "noEscape";
            };
        }

        public function __btnSkill_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compBattle

