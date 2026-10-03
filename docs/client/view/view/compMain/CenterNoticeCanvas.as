// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.CenterNoticeCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Timer;
    import mx.effects.Resize;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
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

    public class CenterNoticeCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _108417msg:Text;
        private var _100325eff:Image;
        private var noticeOn:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"eff",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentHeight":100,
                                "percentWidth":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"msg",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 36;
                            this.textAlign = "center";
                            this.fontWeight = "bold";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"enabled":false});
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        private var setTime:Timer = new Timer(1000, 1);
        private var newZoom:Resize = new Resize();
        private var noticeArr:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CenterNoticeCanvas()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.addEventListener("creationComplete", ___CenterNoticeCanvas_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CenterNoticeCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get msg():Text
        {
            return (this._108417msg);
        }

        override public function initialize():void
        {
            var target:CenterNoticeCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CenterNoticeCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_CenterNoticeCanvasWatcherSetupUtil");
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

        public function set eff(_arg_1:Image):void
        {
            var _local_2:Object = this._100325eff;
            if (_local_2 !== _arg_1)
            {
                this._100325eff = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eff", _local_2, _arg_1));
            };
        }

        private function onOver(_arg_1:TimerEvent):void
        {
            var _local_2:Object;
            this.visible = false;
            eff.source = "";
            newZoom.stop();
            if (noticeArr.length <= 0)
            {
                noticeOn = false;
            }
            else
            {
                _local_2 = noticeArr.removeItemAt(0);
                onNotice(_local_2);
            };
        }

        private function _CenterNoticeCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_RED_SELECTED]);
            }, function (_arg_1:Array):void
            {
                msg.filters = _arg_1;
            }, "msg.filters");
            result[0] = binding;
            binding = new Binding(this, function ():Number
            {
                return ((this.height / 2) - 100);
            }, function (_arg_1:Number):void
            {
                msg.y = _arg_1;
            }, "msg.y");
            result[1] = binding;
            return (result);
        }

        private function onNotice(_arg_1:Object):void
        {
            this.visible = true;
            noticeOn = true;
            msg.text = _arg_1.msg;
            msg.y = ((this.height / 2) + 150);
            var _local_2:uint = _arg_1.delay;
            var _local_3:Number = _arg_1.effect;
            eff.source = ResManager.getResUrl(_local_3);
            newZoom.heightFrom = 3.7;
            newZoom.widthFrom = ((msg.text.length * 4) - 3);
            newZoom.heightBy = 40;
            newZoom.widthBy = (msg.text.length * 40);
            newZoom.target = msg;
            newZoom.repeatCount = 0;
            newZoom.duration = 2000;
            newZoom.repeatDelay = 1000;
            newZoom.play();
            setTime.delay = _local_2;
            setTime.addEventListener(TimerEvent.TIMER_COMPLETE, onOver);
            setTime.reset();
            setTime.start();
        }

        public function addNotice(_arg_1:Object):void
        {
            if (noticeOn)
            {
                noticeArr.addItem(_arg_1);
            }
            else
            {
                onNotice(_arg_1);
            };
        }

        public function set msg(_arg_1:Text):void
        {
            var _local_2:Object = this._108417msg;
            if (_local_2 !== _arg_1)
            {
                this._108417msg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "msg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eff():Image
        {
            return (this._100325eff);
        }

        private function init():void
        {
            this.x = ((this.parent.width - this.width) / 2);
            this.y = ((this.parent.height - this.height) / 2);
        }

        private function _CenterNoticeCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_RED_SELECTED];
            _local_1 = ((this.height / 2) - 100);
        }

        public function ___CenterNoticeCanvas_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.compMain

