// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.TimeCountCanvas

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.utils.Timer;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.event.GameEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.events.TimerEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
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

    public class TimeCountCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const TIME_MAX:int = 25;
        private var timer:Timer;
        private var _25846365lblTime:Label;
        private var _2077607820timeLeft:int;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"lblTime",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 60;
                            this.color = 0xFF0000;
                            this.textAlign = "center";
                            this.fontWeight = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"LabelBattleTimer",
                                "width":147,
                                "height":108
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TimeCountCanvas()
        {
            mx_internal::_document = this;
            this.addEventListener("creationComplete", ___TimeCountCanvas_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TimeCountCanvas._watcherSetupUtil = _arg_1;
        }


        public function timeOut():void
        {
            var _local_1:Core = Core.getInstance();
            var _local_2:BattleStage = BattleStage(_local_1.view.getUI(ViewManager.STAGE_BATTLE));
            var _local_3:Object = _local_1.battle;
            dispatchEvent(new GameEvent(GameEvent.BATTLE_ROUND_TIME_OUT, true));
            _local_3.battleCmd(-1, GamePredef.BATTLE_ACTION_TIMEOUT, -1);
            if (Boolean(_local_2.petActive))
            {
                _local_3.battleCmd(-1, GamePredef.BATTLE_ACTION_TIMEOUT, -1);
            };
        }

        override public function hide():void
        {
            timer.stop();
            visible = false;
        }

        override public function show():void
        {
            lblTime.setStyle("color", "yellow");
            lblTime.setStyle("fontSize", 75);
            timeLeft = TIME_MAX;
            timer.start();
            visible = true;
        }

        public function set lblTime(_arg_1:Label):void
        {
            var _local_2:Object = this._25846365lblTime;
            if (_local_2 !== _arg_1)
            {
                this._25846365lblTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lblTime", _local_2, _arg_1));
            };
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            timeLeft--;
            if (timeLeft == 9)
            {
                lblTime.setStyle("color", "red");
                lblTime.setStyle("fontSize", 85);
            };
            if (timeLeft <= 0)
            {
                timeOut();
            };
        }

        override public function initialize():void
        {
            var target:TimeCountCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TimeCountCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compBattle_TimeCountCanvasWatcherSetupUtil");
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

        public function ___TimeCountCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function init():void
        {
            timer = new Timer(1000);
            timeLeft = TIME_MAX;
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
        }

        public function set timeLeft(_arg_1:int):void
        {
            var _local_2:Object = this._2077607820timeLeft;
            if (_local_2 !== _arg_1)
            {
                this._2077607820timeLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeLeft", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lblTime():Label
        {
            return (this._25846365lblTime);
        }

        private function _TimeCountCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = timeLeft.toString();
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lblTime.text = _arg_1;
            }, "lblTime.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                lblTime.filters = _arg_1;
            }, "lblTime.filters");
            result[1] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get timeLeft():int
        {
            return (this._2077607820timeLeft);
        }

        private function _TimeCountCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = timeLeft.toString();
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
        }


    }
}//package com.qeedoo.ui.view.compBattle

