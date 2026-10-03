// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WbTimerCanvas

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import flash.events.TimerEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class WbTimerCanvas extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const TIME_MAX:int = 25;
        private var _2077607820timeLeft:int = 25;
        public var _WbTimerCanvas_BasicTitleCanvas1:BasicTitleCanvas;
        private var _607736863labelTime:Label;
        private var _75360398getLife:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WbTimerCanvas_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"labelTime",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.color = 1961723;
                            this.horizontalCenter = "0";
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":40});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"getLife",
                        "events":{"click":"__getLife_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "70";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "label":"Đấu Ngay",
                                "styleName":"BtnStdRed"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var timer:Timer = new Timer(1000);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WbTimerCanvas()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.styleName = "StandardContent";
            this.height = 100;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WbTimerCanvas._watcherSetupUtil = _arg_1;
        }


        public function timeOut():void
        {
            if (timer)
            {
                timer.removeEventListener(TimerEvent.TIMER, timerHandler);
                timer.stop();
            };
            if (_core.state == GamePredef.ST_NORMAL)
            {
                _core.remote.call("wbBattleCheck", null, _core.player.id);
                this.hide();
            };
        }

        override public function hide():void
        {
            this.visible = false;
            timeLeft = TIME_MAX;
        }

        public function set labelTime(_arg_1:Label):void
        {
            var _local_2:Object = this._607736863labelTime;
            if (_local_2 !== _arg_1)
            {
                this._607736863labelTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelTime", _local_2, _arg_1));
            };
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            if (timeLeft > 0)
            {
                timeLeft--;
                labelTime.htmlText = (("<font color='#ff0000'>" + timeLeft) + "</font>giây sau sẽ tiếp tục chiến đấu");
            };
            if (timeLeft <= 0)
            {
                timeOut();
            };
        }

        override public function initialize():void
        {
            var target:WbTimerCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WbTimerCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WbTimerCanvasWatcherSetupUtil");
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

        public function __getLife_click(_arg_1:MouseEvent):void
        {
            reliveNow();
        }

        private function _WbTimerCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WBQUTOBATTLECANVA_U[12];
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get labelTime():Label
        {
            return (this._607736863labelTime);
        }

        private function _WbTimerCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WBQUTOBATTLECANVA_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WbTimerCanvas_BasicTitleCanvas1.text = _arg_1;
            }, "_WbTimerCanvas_BasicTitleCanvas1.text");
            result[0] = binding;
            return (result);
        }

        public function set getLife(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._75360398getLife;
            if (_local_2 !== _arg_1)
            {
                this._75360398getLife = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getLife", _local_2, _arg_1));
            };
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
        public function get timeLeft():int
        {
            return (this._2077607820timeLeft);
        }

        public function reliveNow():void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("wbReliveNow", null, _core.player.id);
                };
            };
            Alert.show(Language.WBQUTOBATTLECANVA_U[9], "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get getLife():BasicGlowButton
        {
            return (this._75360398getLife);
        }

        override public function show():void
        {
            this.visible = true;
            timeLeft = TIME_MAX;
            if (((labelTime) && (labelTime.htmlText)))
            {
                labelTime.htmlText = (("<font color='#ff0000'>" + timeLeft) + "</font>giây sau sẽ tiếp tục chiến đấu");
            };
            if (((timer) && (timer.running)))
            {
                timer.removeEventListener(TimerEvent.TIMER, timerHandler);
                timer.stop();
            };
            timer.addEventListener(TimerEvent.TIMER, timerHandler);
            timer.start();
        }


    }
}//package com.qeedoo.ui.view.compDragable

