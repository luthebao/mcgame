// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.WaitingPanel

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.ProgressBar;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.core.UIComponentDescriptor;
    import flash.utils.Timer;
    import mx.core.mx_internal;
    import mx.styles.CSSStyleDeclaration;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import flash.events.TimerEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.controls.Alert;
    import com.qeedoo.game.system.Core;
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

    public class WaitingPanel extends Canvas implements IBindingClient 
    {

        public static const MAX_WAIT_TIME:int = 25000;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _111277pro:ProgressBar;
        private var _3446lb:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":300,
                                "height":120,
                                "styleName":"CanvasPopup",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"lb",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":52,
                                            "width":280
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ProgressBar,
                                    "id":"pro",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                        this.fontSize = 8;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "mode":"manual",
                                            "label":"",
                                            "y":78,
                                            "labelPlacement":"center",
                                            "height":10,
                                            "visible":false
                                        });
                                    }
                                })]
                            });
                        }
                    })]});
            }
        });
        private var closeTimer:Timer = new Timer(MAX_WAIT_TIME, 1);
        private var proTimer:Timer = new Timer(500);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WaitingPanel()
        {
            super();
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            };
            this.styleDeclaration.defaultFactory = function ():void
            {
                this.backgroundColor = 16712451;
                this.backgroundAlpha = 0;
            };
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WaitingPanel._watcherSetupUtil = _arg_1;
        }


        private function _WaitingPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WAITINGPANEL_S[1];
        }

        private function _WaitingPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WAITINGPANEL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lb.text = _arg_1;
            }, "lb.text");
            result[0] = binding;
            return (result);
        }

        public function showText(_arg_1:String):void
        {
            if (lb)
            {
                lb.text = _arg_1;
            };
            this.visible = true;
            if (_arg_1 == Language.CALLBACK_S[57])
            {
            };
        }

        private function hidePro(_arg_1:TimerEvent):void
        {
            pro.visible = false;
            proTimer.removeEventListener(TimerEvent.TIMER, updatePro);
            proTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, hidePro);
            proTimer.reset();
        }

        public function set lb(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3446lb;
            if (_local_2 !== _arg_1)
            {
                this._3446lb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pro():ProgressBar
        {
            return (this._111277pro);
        }

        override public function initialize():void
        {
            var target:WaitingPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WaitingPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_WaitingPanelWatcherSetupUtil");
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

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                closeTimer.reset();
                closeTimer.addEventListener(TimerEvent.TIMER, close);
                closeTimer.start();
            }
            else
            {
                closeTimer.stop();
                closeTimer.removeEventListener(TimerEvent.TIMER, close);
                setStyle("backgroundAlpha", 0);
            };
        }

        public function showText2(_arg_1:String, _arg_2:Function):void
        {
            if (lb)
            {
                lb.text = _arg_1;
            };
            this.visible = true;
            closeTimer.reset();
            closeTimer.removeEventListener(TimerEvent.TIMER, close);
            closeTimer.addEventListener(TimerEvent.TIMER, _arg_2);
            closeTimer.start();
        }

        public function showTime(_arg_1:int):void
        {
            proTimer.addEventListener(TimerEvent.TIMER, updatePro);
            proTimer.addEventListener(TimerEvent.TIMER_COMPLETE, hidePro);
            proTimer.repeatCount = (_arg_1 * 2);
            proTimer.reset();
            proTimer.start();
            pro.visible = true;
            pro.setProgress(0, 100);
        }

        public function removeTimeOutListener(_arg_1:Function):*
        {
            closeTimer.removeEventListener(TimerEvent.TIMER, _arg_1);
        }

        public function set pro(_arg_1:ProgressBar):void
        {
            var _local_2:Object = this._111277pro;
            if (_local_2 !== _arg_1)
            {
                this._111277pro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pro", _local_2, _arg_1));
            };
        }

        private function close(_arg_1:TimerEvent):void
        {
            closeTimer.removeEventListener(TimerEvent.TIMER, close);
            visible = false;
            Alert.show(Language.WAITINGPANEL_S[0], "", Alert.YES, null, Core.getInstance().remote.nc.client.onLogout);
        }

        public function addTimeOutListener(_arg_1:Function, _arg_2:int):*
        {
            closeTimer.addEventListener(TimerEvent.TIMER, _arg_1, false, _arg_2);
        }

        private function updatePro(_arg_1:TimerEvent):void
        {
            pro.setProgress(proTimer.currentCount, proTimer.repeatCount);
        }

        [Bindable(event="propertyChange")]
        public function get lb():RoundedLabel
        {
            return (this._3446lb);
        }


    }
}//package com.qeedoo.ui.view.compMain

