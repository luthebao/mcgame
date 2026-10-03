// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.GatherProgressCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.ProgressBar;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
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

    public class GatherProgressCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _delay:uint = 5000;
        private var _1566114207quitButton:Button;
        private var _97299bar:ProgressBar;
        private var _608094309labelHint:Label;
        private var _startTime:Number;
        private var _hint:String;
        public var viewType:uint = 16;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":400,
                    "width":300,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"labelHint",
                        "stylesFactory":function ():void
                        {
                            this.fontWeight = "bold";
                            this.fontSize = 14;
                            this.color = 0xFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":180,
                                "height":40,
                                "x":110,
                                "y":166
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"quitButton",
                        "events":{"click":"__quitButton_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":40,
                                "height":40,
                                "styleName":"BtnGatherCancel",
                                "x":130,
                                "y":186
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ProgressBar,
                        "id":"bar",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "mode":"manual",
                                "y":234,
                                "labelPlacement":"center",
                                "label":"",
                                "height":15,
                                "width":250,
                                "x":25
                            });
                        }
                    })]
                });
            }
        });
        private var _timer:Timer = new Timer(30);
        private var _core:Core = Core.getInstance();
        public var hide:Function = quitGathering;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GatherProgressCanvas()
        {
            mx_internal::_document = this;
            this.height = 400;
            this.width = 300;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GatherProgressCanvas._watcherSetupUtil = _arg_1;
        }


        public function __quitButton_click(_arg_1:MouseEvent):void
        {
            quitGathering();
        }

        public function quit(_arg_1:String=null):void
        {
            if (_arg_1)
            {
                _core.sysMsg(_arg_1);
            };
            _timer.removeEventListener(TimerEvent.TIMER, updateProgessBar);
            _timer.stop();
            visible = false;
        }

        override public function initialize():void
        {
            var target:GatherProgressCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GatherProgressCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_GatherProgressCanvasWatcherSetupUtil");
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

        private function updateProgessBar(_arg_1:TimerEvent):void
        {
            bar.setProgress((new Date().getTime() - _startTime), _delay);
            bar.label = ("" + (Math.round((((_startTime + _delay) - new Date().getTime()) / 10)) / 100));
            if ((((_hint) && (_timer.currentCount > 0)) && ((_timer.currentCount % 10) == 0)))
            {
                if (labelHint.text == (_hint + "..."))
                {
                    labelHint.text = _hint;
                }
                else
                {
                    labelHint.text = (labelHint.text + ".");
                };
            };
            if ((new Date().getTime() - _startTime) >= _delay)
            {
                complete();
            };
        }

        private function _GatherProgressCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                labelHint.filters = _arg_1;
            }, "labelHint.filters");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get quitButton():Button
        {
            return (this._1566114207quitButton);
        }

        public function set quitButton(_arg_1:Button):void
        {
            var _local_2:Object = this._1566114207quitButton;
            if (_local_2 !== _arg_1)
            {
                this._1566114207quitButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "quitButton", _local_2, _arg_1));
            };
        }

        private function _GatherProgressCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        [Bindable(event="propertyChange")]
        public function get labelHint():Label
        {
            return (this._608094309labelHint);
        }

        [Bindable(event="propertyChange")]
        public function get bar():ProgressBar
        {
            return (this._97299bar);
        }

        public function play(_arg_1:uint, _arg_2:String=null):void
        {
            this._delay = _arg_1;
            this._hint = _arg_2;
            labelHint.text = _hint;
            bar.setProgress(0, _delay);
            _startTime = new Date().getTime();
            if (!visible)
            {
                visible = true;
            };
            if (!bar.visible)
            {
                bar.visible = true;
            };
            _timer.addEventListener(TimerEvent.TIMER, updateProgessBar);
            _timer.start();
        }

        public function set bar(_arg_1:ProgressBar):void
        {
            var _local_2:Object = this._97299bar;
            if (_local_2 !== _arg_1)
            {
                this._97299bar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bar", _local_2, _arg_1));
            };
        }

        private function quitGathering():void
        {
            if (this.visible)
            {
                _core.remote.quitGatheringClinet();
                quit();
            };
        }

        public function complete():void
        {
            _timer.removeEventListener(TimerEvent.TIMER, updateProgessBar);
            _timer.stop();
            bar.visible = false;
        }

        public function set labelHint(_arg_1:Label):void
        {
            var _local_2:Object = this._608094309labelHint;
            if (_local_2 !== _arg_1)
            {
                this._608094309labelHint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelHint", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

