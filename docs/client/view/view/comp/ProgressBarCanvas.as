// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ProgressBarCanvas

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.utils.Timer;
    import mx.controls.ProgressBar;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class ProgressBarCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _717410904progressName:String = "";
        private var myTimer:Timer;
        private var _183067657cancelToolTip:String = "";
        private var _979847642proBar:ProgressBar;
        private var _606509545showCancelButton:Boolean = false;
        public var _ProgressBarCanvas_Button1:Button;
        public var completeFunction:Function;
        public var cancelFunction:Function;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":232,
                    "height":16,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ProgressBar,
                        "id":"proBar",
                        "stylesFactory":function ():void
                        {
                            this.left = "0";
                            this.right = "22";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "labelPlacement":"center",
                                "height":16,
                                "mode":"manual"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"_ProgressBarCanvas_Button1",
                        "events":{"click":"___ProgressBarCanvas_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":16,
                                "label":"X",
                                "height":16
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ProgressBarCanvas()
        {
            mx_internal::_document = this;
            this.width = 232;
            this.height = 16;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ProgressBarCanvas._watcherSetupUtil = _arg_1;
        }


        public function hide():void
        {
            showCancelButton = false;
            progressName = "";
            cancelToolTip = "";
            cancelFunction = null;
            completeFunction = null;
            if (myTimer)
            {
                myTimer.removeEventListener(TimerEvent.TIMER, timerHandler);
                myTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
                myTimer.stop();
                myTimer = null;
            };
            visible = false;
        }

        public function show():void
        {
            visible = true;
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            proBar.setProgress(myTimer.currentCount, 100);
        }

        [Bindable(event="propertyChange")]
        public function get cancelToolTip():String
        {
            return (this._183067657cancelToolTip);
        }

        public function setCurrentPercent(_arg_1:Number):void
        {
            proBar.setProgress(_arg_1, 100);
        }

        public function ___ProgressBarCanvas_Button1_click(_arg_1:MouseEvent):void
        {
            cancelBar();
        }

        override public function initialize():void
        {
            var target:ProgressBarCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ProgressBarCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_ProgressBarCanvasWatcherSetupUtil");
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

        private function completeHandler(_arg_1:TimerEvent):void
        {
            completeFunction();
            hide();
        }

        public function set showCancelButton(_arg_1:Boolean):void
        {
            var _local_2:Object = this._606509545showCancelButton;
            if (_local_2 !== _arg_1)
            {
                this._606509545showCancelButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showCancelButton", _local_2, _arg_1));
            };
        }

        public function set proBar(_arg_1:ProgressBar):void
        {
            var _local_2:Object = this._979847642proBar;
            if (_local_2 !== _arg_1)
            {
                this._979847642proBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "proBar", _local_2, _arg_1));
            };
        }

        private function _ProgressBarCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = progressName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                proBar.label = _arg_1;
            }, "proBar.label");
            result[0] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (showCancelButton);
            }, function (_arg_1:Boolean):void
            {
                _ProgressBarCanvas_Button1.visible = _arg_1;
            }, "_ProgressBarCanvas_Button1.visible");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = cancelToolTip;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ProgressBarCanvas_Button1.toolTip = _arg_1;
            }, "_ProgressBarCanvas_Button1.toolTip");
            result[2] = binding;
            return (result);
        }

        private function _ProgressBarCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = progressName;
            _local_1 = showCancelButton;
            _local_1 = cancelToolTip;
        }

        public function showByTime(_arg_1:int):void
        {
            show();
            myTimer = new Timer((_arg_1 * 10), 100);
            myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
            myTimer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
            myTimer.reset();
            myTimer.start();
        }

        private function cancelBar():void
        {
            cancelFunction();
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get progressName():String
        {
            return (this._717410904progressName);
        }

        [Bindable(event="propertyChange")]
        public function get showCancelButton():Boolean
        {
            return (this._606509545showCancelButton);
        }

        public function set progressName(_arg_1:String):void
        {
            var _local_2:Object = this._717410904progressName;
            if (_local_2 !== _arg_1)
            {
                this._717410904progressName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressName", _local_2, _arg_1));
            };
        }

        public function set cancelToolTip(_arg_1:String):void
        {
            var _local_2:Object = this._183067657cancelToolTip;
            if (_local_2 !== _arg_1)
            {
                this._183067657cancelToolTip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelToolTip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get proBar():ProgressBar
        {
            return (this._979847642proBar);
        }


    }
}//package com.qeedoo.ui.view.comp

