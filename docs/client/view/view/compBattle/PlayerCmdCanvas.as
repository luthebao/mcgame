// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.PlayerCmdCanvas

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Alert;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BasicTitleLabel;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compBattle.AutoBattleCanvas;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.ui.utils.Key;
    import mx.managers.PopUpManager;
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

    public class PlayerCmdCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _escapeConfirm:Alert;
        private var _1595507859wrapper:VBox;
        private var _1767350363btnPosition:BasicGlowButton;
        public var isEscapeThisRound:Boolean = false;
        private var _1378824925btnPet:BasicGlowButton;
        private var _355403348btnDefence:BasicGlowButton;
        private var _2082019775btnCatch:BasicGlowButton;
        private var _205905807btnItem:BasicGlowButton;
        private var _2097083733btnSkill:BasicGlowButton;
        private var _205668907btnAuto:BasicGlowButton;
        private var _191477245btnEscape:BasicGlowButton;
        public var needToShow:Boolean = true;
        private var _78390212btnAttack:BasicGlowButton;
        public var _PlayerCmdCanvas_BasicTitleLabel1:BasicTitleLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":83,
                    "height":267,
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
                                    "id":"btnCatch",
                                    "events":{"click":"__btnCatch_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.textAlign = "center";
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
                                    "id":"btnPet",
                                    "events":{"click":"__btnPet_click"},
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
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnAuto",
                                    "events":{"click":"__btnAuto_click"},
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
                                "x":20,
                                "y":0,
                                "width":45,
                                "height":22,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicTitleLabel,
                                    "id":"_PlayerCmdCanvas_BasicTitleLabel1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 8375228;
                                        this.fontWeight = "bold";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":2});
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

        public function PlayerCmdCanvas()
        {
            mx_internal::_document = this;
            this.width = 83;
            this.height = 267;
            this.styleName = "CanvasBattleCommand";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PlayerCmdCanvas._watcherSetupUtil = _arg_1;
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

        private function _PlayerCmdCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAttack.label = _arg_1;
            }, "btnAttack.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnDefence.label = _arg_1;
            }, "btnDefence.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnSkill.label = _arg_1;
            }, "btnSkill.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnCatch.label = _arg_1;
            }, "btnCatch.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPet.label = _arg_1;
            }, "btnPet.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPosition.label = _arg_1;
            }, "btnPosition.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnItem.label = _arg_1;
            }, "btnItem.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnEscape.label = _arg_1;
            }, "btnEscape.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAuto.label = _arg_1;
            }, "btnAuto.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PLAYERCMDCANVAS_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PlayerCmdCanvas_BasicTitleLabel1.text = _arg_1;
            }, "_PlayerCmdCanvas_BasicTitleLabel1.text");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT5]);
            }, function (_arg_1:Array):void
            {
                _PlayerCmdCanvas_BasicTitleLabel1.filters = _arg_1;
            }, "_PlayerCmdCanvas_BasicTitleLabel1.filters");
            result[10] = binding;
            return (result);
        }

        private function btnClick(_arg_1:Event):void
        {
            var _local_2:BasicGlowButton = BasicGlowButton(_arg_1.currentTarget);
            doCmd(_local_2.id);
            dispatchEvent(new Event(DragableCanvas.EVENT_CLOSE));
            if (_local_2.id == "btnAttack")
            {
                _core.view.showSelect();
            };
        }

        public function __btnAuto_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        public function __btnPosition_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        override public function initialize():void
        {
            var target:PlayerCmdCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PlayerCmdCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_PlayerCmdCanvasWatcherSetupUtil");
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
        public function get btnItem():BasicGlowButton
        {
            return (this._205905807btnItem);
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

        [Bindable(event="propertyChange")]
        public function get wrapper():VBox
        {
            return (this._1595507859wrapper);
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
            var _local_3:AutoBattleCanvas;
            _core.view.hide(ViewManager.PANEL_SKILLMANAGER);
            _core.view.hide(ViewManager.PANEL_BAG);
            unSelectAll();
            var _local_2:Object = _core.view.getUI(ViewManager.POP_NEW_PLAER_GUIDE);
            if (_local_2)
            {
                _local_2.hide();
            };
            switch (_arg_1)
            {
                case "btnSkill":
                    _core.cmdState = GamePredef.ST_BATTLE_SKILL;
                    _core.view.getUI(ViewManager.PANEL_SKILLMANAGER).battleShow();
                    return;
                case "btnDefence":
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_DEFENCE, -1);
                    return;
                case "btnItem":
                    _core.cmdState = GamePredef.ST_BATTLE_ITEM;
                    _core.view.getUI(ViewManager.PANEL_BAG).showItem();
                    return;
                case "btnPet":
                    _core.cmdState = GamePredef.ST_BATTLE_PET;
                    _core.view.getUI(ViewManager.PANEL_BAG).showPet();
                    return;
                case "btnAttack":
                    _core.cmdState = GamePredef.ST_BATTLE_ATTACK;
                    return;
                case "btnEscape":
                    isEscapeThisRound = true;
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_ESCAPE, 0);
                    return;
                case "btnPosition":
                    _core.battle.battleCmd(-1, GamePredef.BATTLE_ACTION_POSITION, 0);
                    return;
                case "btnCatch":
                    _core.cmdState = GamePredef.ST_BATTLE_CATCH;
                    _core.view.showSelect();
                    return;
                case "btnAuto":
                    _core.view.getUI(ViewManager.STAGE_BATTLE).startAuto();
                    _local_3 = AutoBattleCanvas(_core.view.getUI(ViewManager.PANEL_BATTLEAUTO));
                    if (((_local_3.auto) && (_local_3.num > 0)))
                    {
                        if (_core.view.getUI(ViewManager.MAIN_LONGBUFF).containBuff(GamePredef.MEET_BATTLE_ON_STILL_BID))
                        {
                            trace("no need to minus view.num");
                            _local_3.num = _local_3.maxNum;
                        }
                        else
                        {
                            _local_3.num--;
                        };
                    };
                    _core.battle.battleAuto();
                    _core.view.getUI(ViewManager.MAIN_AUTOBATTLE_SET).changeStyle(false);
                    return;
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

        [Bindable(event="propertyChange")]
        public function get btnAuto():BasicGlowButton
        {
            return (this._205668907btnAuto);
        }

        public function set btnCatch(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2082019775btnCatch;
            if (_local_2 !== _arg_1)
            {
                this._2082019775btnCatch = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnCatch", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnPet():BasicGlowButton
        {
            return (this._1378824925btnPet);
        }

        public function __btnDefence_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnCatch():BasicGlowButton
        {
            return (this._2082019775btnCatch);
        }

        private function onEscape(evt:Event):void
        {
            var btn:BasicGlowButton;
            if (isEscapeThisRound)
            {
                return;
            };
            this.visible = false;
            btn = BasicGlowButton(evt.currentTarget);
            var func:Function = function (_arg_1:CloseEvent):void
            {
                removeEscapeConfirm(_escapeConfirm);
                if (Alert.YES == _arg_1.detail)
                {
                    doCmd(btn.id);
                };
                if (Alert.NO == _arg_1.detail)
                {
                    show();
                };
            };
            var msgString:String = Language.PLAYERCMDCANVAS_U[10];
            _escapeConfirm = Alert.show(msgString, "", (Alert.YES | Alert.NO), this, func);
            stage.addEventListener(GameEvent.BATTLE_ROUND_TIME_OUT, onRoundTimeout);
            Key.setListenerEnabled(stage, false);
        }

        [Bindable(event="propertyChange")]
        public function get btnAttack():BasicGlowButton
        {
            return (this._78390212btnAttack);
        }

        private function _PlayerCmdCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PLAYERCMDCANVAS_U[5];
            _local_1 = Language.PLAYERCMDCANVAS_U[1];
            _local_1 = Language.PLAYERCMDCANVAS_U[0];
            _local_1 = Language.PLAYERCMDCANVAS_U[8];
            _local_1 = Language.PLAYERCMDCANVAS_U[3];
            _local_1 = Language.PLAYERCMDCANVAS_U[7];
            _local_1 = Language.PLAYERCMDCANVAS_U[2];
            _local_1 = Language.PLAYERCMDCANVAS_U[6];
            _local_1 = Language.PLAYERCMDCANVAS_U[4];
            _local_1 = Language.PLAYERCMDCANVAS_U[9];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT5];
        }

        [Bindable(event="propertyChange")]
        public function get btnPosition():BasicGlowButton
        {
            return (this._1767350363btnPosition);
        }

        public function __btnPet_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        public function set btnPet(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1378824925btnPet;
            if (_local_2 !== _arg_1)
            {
                this._1378824925btnPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPet", _local_2, _arg_1));
            };
        }

        public function defence():void
        {
            doCmd("btnDefence");
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

        private function removeEscapeConfirm(_arg_1:Alert):void
        {
            if (_arg_1)
            {
                stage.removeEventListener(GameEvent.BATTLE_ROUND_TIME_OUT, onRoundTimeout);
                Key.setListenerEnabled(stage, true);
                PopUpManager.removePopUp(_arg_1);
                _arg_1 = null;
            };
        }

        public function set btnAuto(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._205668907btnAuto;
            if (_local_2 !== _arg_1)
            {
                this._205668907btnAuto = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAuto", _local_2, _arg_1));
            };
        }

        public function __btnEscape_click(_arg_1:MouseEvent):void
        {
            onEscape(_arg_1);
        }

        public function __btnCatch_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((!(needToShow)) && (_arg_1)))
            {
                super.visible = false;
            }
            else
            {
                super.visible = _arg_1;
            };
        }

        public function __btnAttack_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        private function onRoundTimeout(_arg_1:GameEvent):void
        {
            removeEscapeConfirm(_escapeConfirm);
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

        public function __btnItem_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }

        override public function show():void
        {
            var _local_1:AutoBattleCanvas = AutoBattleCanvas(_core.view.getUI(ViewManager.PANEL_BATTLEAUTO));
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_WB_BATTLEAUTO);
            if (((_local_1.auto) && (_local_1.num > 0)))
            {
                if (((_core.view.getUI(ViewManager.MAIN_LONGBUFF).containBuff(GamePredef.MEET_BATTLE_ON_STILL_BID)) || ((_local_2) && (_local_2.getWbAuto()))))
                {
                    trace("no need to minus view.num");
                    _local_1.num = _local_1.maxNum;
                }
                else
                {
                    _local_1.num--;
                };
                _core.battle.battleAuto();
            }
            else
            {
                _core.cmdState = GamePredef.ST_BATTLE_ATTACK;
                unSelectAll();
                btnAttack.selected = true;
                visible = true;
            };
        }

        public function __btnSkill_click(_arg_1:MouseEvent):void
        {
            btnClick(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compBattle

