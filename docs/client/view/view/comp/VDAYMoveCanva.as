// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.VDAYMoveCanva

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.utils.Timer;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import flash.events.TimerEvent;
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

    public class VDAYMoveCanva extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const MOVE_DELAY:* = 30;
        private var timer:Timer;
        private var _1070270502RL_sender:RoundedLabel;
        private var _2669TA:TextArea;
        private var _205517396RL_receiver:RoundedLabel;
        private var info:Object;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":120,
                    "height":120,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"RL_sender",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "25";
                            this.fontSize = 9;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":18,
                                "width":65
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"RL_receiver",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"height":18});
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"TA",
                        "stylesFactory":function ():void
                        {
                            this.verticalCenter = "-5";
                            this.horizontalCenter = "0";
                            this.backgroundAlpha = 0;
                            this.borderStyle = "none";
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":100,
                                "height":40,
                                "editable":false
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

        public function VDAYMoveCanva()
        {
            mx_internal::_document = this;
            this.width = 120;
            this.height = 120;
            this.styleName = "CanvasLove";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            VDAYMoveCanva._watcherSetupUtil = _arg_1;
        }


        public function setWishWords(_arg_1:String):void
        {
            TA.htmlText = _arg_1;
        }

        private function _VDAYMoveCanva_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = TA.text;
        }

        public function set RL_sender(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1070270502RL_sender;
            if (_local_2 !== _arg_1)
            {
                this._1070270502RL_sender = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL_sender", _local_2, _arg_1));
            };
        }

        private function _VDAYMoveCanva_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                TA.filters = _arg_1;
            }, "TA.filters");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = TA.text;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                TA.toolTip = _arg_1;
            }, "TA.toolTip");
            result[1] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get TA():TextArea
        {
            return (this._2669TA);
        }

        override public function initialize():void
        {
            var target:VDAYMoveCanva;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _VDAYMoveCanva_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_VDAYMoveCanvaWatcherSetupUtil");
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

        public function updateData():void
        {
            var _local_1:Object;
            _local_1 = _core.fetchVDAYWish(info);
            if (_local_1)
            {
                RL_receiver.text = ("to:" + _local_1.targetName);
                RL_sender.text = ("from:" + _local_1.name);
                TA.htmlText = _local_1.wish;
                RL_receiver.visible = true;
                RL_sender.visible = true;
                info = _local_1;
                if (_local_1.type == 1)
                {
                    RL_receiver.visible = false;
                }
                else
                {
                    RL_receiver.visible = true;
                };
            }
            else
            {
                RL_receiver.visible = false;
                RL_sender.visible = false;
            };
        }

        public function beginMove():void
        {
            stopMove();
            timer = new Timer(MOVE_DELAY, 0);
            timer.addEventListener(TimerEvent.TIMER, handleTiemr);
            timer.start();
        }

        [Bindable(event="propertyChange")]
        public function get RL_receiver():RoundedLabel
        {
            return (this._205517396RL_receiver);
        }

        public function set RL_receiver(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._205517396RL_receiver;
            if (_local_2 !== _arg_1)
            {
                this._205517396RL_receiver = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL_receiver", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get RL_sender():RoundedLabel
        {
            return (this._1070270502RL_sender);
        }

        private function handleTiemr(_arg_1:TimerEvent):void
        {
            x = (x + 1);
            if (x >= (parent.width + width))
            {
                x = -(width);
                updateData();
            };
        }

        public function set TA(_arg_1:TextArea):void
        {
            var _local_2:Object = this._2669TA;
            if (_local_2 !== _arg_1)
            {
                this._2669TA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TA", _local_2, _arg_1));
            };
        }

        public function stopMove():void
        {
            trace((this.name + " stopMove"));
            if (timer)
            {
                if (timer.running)
                {
                    timer.stop();
                };
                timer.removeEventListener(TimerEvent.TIMER, handleTiemr);
                timer = null;
                trace((this.name + " removeTimer"));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

