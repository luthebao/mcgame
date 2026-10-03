// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.DogFightCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.VBox;
    import mx.states.RemoveChild;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.binding.BindingManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.config.Language;
    import flash.events.TimerEvent;
    import mx.states.State;
    import mx.events.FlexEvent;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
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

    public class DogFightCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _206155944btnRank:BasicGlowButton;
        private var nextRoundLast:uint = 0;
        private var _1569466002scorePanel:VBox;
        public var _DogFightCanvas_RemoveChild1:RemoveChild;
        public var _DogFightCanvas_RemoveChild2:RemoveChild;
        public var _DogFightCanvas_RemoveChild3:RemoveChild;
        public var _DogFightCanvas_RemoveChild4:RemoveChild;
        public var _DogFightCanvas_RemoveChild5:RemoveChild;
        public var _DogFightCanvas_RemoveChild6:RemoveChild;
        private var _750681980blueScoreLabel:Label;
        private var _1021996787redScoreLabel:Label;
        private var _1565760386scoreLabel:Label;
        private var _18543655timeLabel:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":180,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"scorePanel",
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btnRank",
                                    "events":{"click":"__btnRank_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"BtnStdRed",
                                            "width":60,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"timeLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"redScoreLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"blueScoreLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"scoreLabel",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontWeight = "bold";
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var timer:Timer = new Timer(1000);
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DogFightCanvas()
        {
            mx_internal::_document = this;
            this.width = 180;
            this.height = 100;
            this.states = [_DogFightCanvas_State1_c(), _DogFightCanvas_State2_c(), _DogFightCanvas_State3_c()];
            this.addEventListener("creationComplete", ___DogFightCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DogFightCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get scoreLabel():Label
        {
            return (this._1565760386scoreLabel);
        }

        [Bindable(event="propertyChange")]
        public function get blueScoreLabel():Label
        {
            return (this._750681980blueScoreLabel);
        }

        public function set scoreLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1565760386scoreLabel;
            if (_local_2 !== _arg_1)
            {
                this._1565760386scoreLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreLabel", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:DogFightCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DogFightCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_DogFightCanvasWatcherSetupUtil");
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
        public function get scorePanel():VBox
        {
            return (this._1569466002scorePanel);
        }

        private function _DogFightCanvas_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _DogFightCanvas_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_DogFightCanvas_RemoveChild2", _DogFightCanvas_RemoveChild2);
            return (_local_1);
        }

        public function setSocreVisible(_arg_1:Boolean):void
        {
            if ((((_arg_1) && (!(_core.player.state == GamePredef.ST_BATTLE))) || (!(_arg_1))))
            {
                this.visible = _arg_1;
            };
        }

        public function resetRank():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CROSS_BATTLE_RANK);
            if (_local_1)
            {
                _local_1.resetRank();
            };
        }

        private function _DogFightCanvas_RemoveChild6_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _DogFightCanvas_RemoveChild6 = _local_1;
            BindingManager.executeBindings(this, "_DogFightCanvas_RemoveChild6", _DogFightCanvas_RemoveChild6);
            return (_local_1);
        }

        public function setNextRroundTime(_arg_1:Number):void
        {
            if (Math.floor((_arg_1 / 1000)) <= 1)
            {
                timeLabel.text = Language.DOG_FIGHT_U[0].replace("{time}", 0);
                timer.stop();
                timer.removeEventListener(TimerEvent.TIMER, onTimer);
                return;
            };
            nextRoundLast = (Math.floor((_arg_1 / 1000)) - 1);
            var _local_2:String = Language.DOG_FIGHT_U[0];
            if (this.currentState == "dongXuanDefence")
            {
                _local_2 = Language.DOG_FIGHT_U[6];
            };
            timeLabel.text = _local_2.replace("{time}", nextRoundLast);
            timer.stop();
            timer.removeEventListener(TimerEvent.TIMER, onTimer);
            timer.addEventListener(TimerEvent.TIMER, onTimer);
            timer.start();
        }

        private function init():void
        {
            currentState = "dogFight";
        }

        private function _DogFightCanvas_RemoveChild4_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _DogFightCanvas_RemoveChild4 = _local_1;
            BindingManager.executeBindings(this, "_DogFightCanvas_RemoveChild4", _DogFightCanvas_RemoveChild4);
            return (_local_1);
        }

        public function set scorePanel(_arg_1:VBox):void
        {
            var _local_2:Object = this._1569466002scorePanel;
            if (_local_2 !== _arg_1)
            {
                this._1569466002scorePanel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scorePanel", _local_2, _arg_1));
            };
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            if (nextRoundLast <= 0)
            {
                timer.removeEventListener(TimerEvent.TIMER, onTimer);
                timer.stop();
            }
            else
            {
                updateTime(--nextRoundLast);
            };
        }

        private function _DogFightCanvas_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "dogFight";
            _local_1.overrides = [_DogFightCanvas_RemoveChild1_i(), _DogFightCanvas_RemoveChild2_i(), _DogFightCanvas_RemoveChild3_i()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnRank():BasicGlowButton
        {
            return (this._206155944btnRank);
        }

        private function _DogFightCanvas_State3_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "dongXuanDefence";
            _local_1.overrides = [_DogFightCanvas_RemoveChild6_i()];
            return (_local_1);
        }

        public function updateTime(_arg_1:int):void
        {
            var _local_2:String = Language.DOG_FIGHT_U[0];
            if (this.currentState == "dongXuanDefence")
            {
                _local_2 = Language.DOG_FIGHT_U[6];
            };
            timeLabel.text = _local_2.replace("{time}", _arg_1);
        }

        public function ___DogFightCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _DogFightCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (btnRank);
            }, function (_arg_1:DisplayObject):void
            {
                _DogFightCanvas_RemoveChild1.target = _arg_1;
            }, "_DogFightCanvas_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (redScoreLabel);
            }, function (_arg_1:DisplayObject):void
            {
                _DogFightCanvas_RemoveChild2.target = _arg_1;
            }, "_DogFightCanvas_RemoveChild2.target");
            result[1] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (blueScoreLabel);
            }, function (_arg_1:DisplayObject):void
            {
                _DogFightCanvas_RemoveChild3.target = _arg_1;
            }, "_DogFightCanvas_RemoveChild3.target");
            result[2] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (redScoreLabel);
            }, function (_arg_1:DisplayObject):void
            {
                _DogFightCanvas_RemoveChild4.target = _arg_1;
            }, "_DogFightCanvas_RemoveChild4.target");
            result[3] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (blueScoreLabel);
            }, function (_arg_1:DisplayObject):void
            {
                _DogFightCanvas_RemoveChild5.target = _arg_1;
            }, "_DogFightCanvas_RemoveChild5.target");
            result[4] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (btnRank);
            }, function (_arg_1:DisplayObject):void
            {
                _DogFightCanvas_RemoveChild6.target = _arg_1;
            }, "_DogFightCanvas_RemoveChild6.target");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DOG_FIGHT_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnRank.label = _arg_1;
            }, "btnRank.label");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                timeLabel.filters = _arg_1;
            }, "timeLabel.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                redScoreLabel.filters = _arg_1;
            }, "redScoreLabel.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                blueScoreLabel.filters = _arg_1;
            }, "blueScoreLabel.filters");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                scoreLabel.filters = _arg_1;
            }, "scoreLabel.filters");
            result[10] = binding;
            return (result);
        }

        public function checkAndSetVisible():void
        {
            if (((currentState == "crossBattleDF") && (!(_core.battleServer.inBattleServer))))
            {
                trace("检查自身是否应该可见");
                this.visible = false;
            };
        }

        public function showRank():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CROSS_BATTLE_RANK);
            if (_local_1)
            {
                _local_1.visible = true;
            };
        }

        public function set timeLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._18543655timeLabel;
            if (_local_2 !== _arg_1)
            {
                this._18543655timeLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLabel", _local_2, _arg_1));
            };
        }

        public function setState(_arg_1:int=0):void
        {
            trace("设置状态------------------------");
            if (0 == _arg_1)
            {
                currentState = "dogFight";
            }
            else
            {
                if (1 == _arg_1)
                {
                    currentState = "crossBattleDF";
                }
                else
                {
                    if (2 == _arg_1)
                    {
                        currentState = "dongXuanDefence";
                    };
                };
            };
        }

        public function updateScore(_arg_1:uint):void
        {
            if (this.currentState != "dongXuanDefence")
            {
                scoreLabel.text = Language.DOG_FIGHT_U[1].replace("{score}", _arg_1);
            }
            else
            {
                scoreLabel.text = Language.DOG_FIGHT_U[3].replace("{score}", _arg_1);
            };
        }

        public function __btnRank_click(_arg_1:MouseEvent):void
        {
            showRank();
        }

        [Bindable(event="propertyChange")]
        public function get timeLabel():Label
        {
            return (this._18543655timeLabel);
        }

        private function _DogFightCanvas_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _DogFightCanvas_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_DogFightCanvas_RemoveChild1", _DogFightCanvas_RemoveChild1);
            return (_local_1);
        }

        private function _DogFightCanvas_RemoveChild3_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _DogFightCanvas_RemoveChild3 = _local_1;
            BindingManager.executeBindings(this, "_DogFightCanvas_RemoveChild3", _DogFightCanvas_RemoveChild3);
            return (_local_1);
        }

        public function updateDongXuanScore(_arg_1:Object):void
        {
            if (this.currentState == "dongXuanDefence")
            {
                if (_arg_1.redS != null)
                {
                    redScoreLabel.text = Language.DOG_FIGHT_U[4].replace("{score}", _arg_1.redS);
                };
                if (_arg_1.blueS != null)
                {
                    blueScoreLabel.text = Language.DOG_FIGHT_U[5].replace("{score}", _arg_1.blueS);
                };
            };
        }

        public function set btnRank(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._206155944btnRank;
            if (_local_2 !== _arg_1)
            {
                this._206155944btnRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnRank", _local_2, _arg_1));
            };
        }

        public function set redScoreLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1021996787redScoreLabel;
            if (_local_2 !== _arg_1)
            {
                this._1021996787redScoreLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "redScoreLabel", _local_2, _arg_1));
            };
        }

        private function _DogFightCanvas_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "crossBattleDF";
            _local_1.overrides = [_DogFightCanvas_RemoveChild4_i(), _DogFightCanvas_RemoveChild5_i()];
            return (_local_1);
        }

        private function _DogFightCanvas_RemoveChild5_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _DogFightCanvas_RemoveChild5 = _local_1;
            BindingManager.executeBindings(this, "_DogFightCanvas_RemoveChild5", _DogFightCanvas_RemoveChild5);
            return (_local_1);
        }

        private function _DogFightCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = btnRank;
            _local_1 = redScoreLabel;
            _local_1 = blueScoreLabel;
            _local_1 = redScoreLabel;
            _local_1 = blueScoreLabel;
            _local_1 = btnRank;
            _local_1 = Language.DOG_FIGHT_U[2];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }

        public function set blueScoreLabel(_arg_1:Label):void
        {
            var _local_2:Object = this._750681980blueScoreLabel;
            if (_local_2 !== _arg_1)
            {
                this._750681980blueScoreLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "blueScoreLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get redScoreLabel():Label
        {
            return (this._1021996787redScoreLabel);
        }


    }
}//package com.qeedoo.ui.view.compMain

