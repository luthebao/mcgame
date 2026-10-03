// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SysInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.utils.getTimer;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
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

    public class SysInfoPanel extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const UPDATE_COUNT:int = 10;
        private const GAP_THRESHOLD:Number = 1.2;
        private const CHECK_COUNT:int = 79;
        private var _checkCount:int;
        private var _107989mem:String;
        private var last:Number = 0;
        private var frameRateState:uint = 1;
        private var frames:int;
        private var _1080618603realFps:Number;
        private var total:Number = 0;
        private var _prevDateTime:Number;
        private var _prevGetTime:Number;
        private var lastFpS:Number;
        public var _SysInfoPanel_Label1:Label;
        public var _SysInfoPanel_Label2:Label;
        private var fps:Number;
        private var _accCount:int;
        private var current:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":100,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_SysInfoPanel_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF00;
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_SysInfoPanel_Label2",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFF0000;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":20});
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

        public function SysInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.height = 100;
            this.addEventListener("initialize", ___SysInfoPanel_SimpleCanvas1_initialize);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SysInfoPanel._watcherSetupUtil = _arg_1;
        }


        override public function initialize():void
        {
            var target:SysInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SysInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SysInfoPanelWatcherSetupUtil");
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

        private function updateInfo(_arg_1:Event):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:*;
            var _local_6:Object;
            current = getTimer();
            if (((_core.player) && ((_checkCount % CHECK_COUNT) == 0)))
            {
                _local_2 = new Date().getTime();
                if (((_prevGetTime) && (_prevDateTime)))
                {
                    _local_3 = (current - _prevGetTime);
                    _local_4 = (_local_2 - _prevDateTime);
                    if (_local_3 > (GAP_THRESHOLD * _local_4))
                    {
                        _core.player.say(Language.CHEATCHECKER_S[0], GamePredef.MSG_CHANNEL_LOCAL);
                        _accCount++;
                        if (_accCount >= 3)
                        {
                            _accCount = 0;
                            _core.logout();
                            _core.refresh();
                        };
                    };
                };
                _prevGetTime = current;
                _prevDateTime = _local_2;
            };
            _checkCount++;
            fps = ((1 / (current - last)) * 1000);
            last = current;
            frames = ((frames + 1) % UPDATE_COUNT);
            total = (total + fps);
            if (frames == 0)
            {
                if (realFps)
                {
                    lastFpS = realFps;
                };
                realFps = Math.round((total / UPDATE_COUNT));
                if (_core)
                {
                    _core.realFps = realFps;
                };
                if (((lastFpS) && (!(lastFpS == realFps))))
                {
                    if (((frameRateState == 1) && (realFps <= 5)))
                    {
                        for (_local_5 in _core.view.cDict)
                        {
                            _local_6 = _core.view.getC(_local_5);
                            if (_local_6)
                            {
                                _local_6.speed = int(((9 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / realFps));
                            };
                        };
                        if ((((_core) && (_core.player)) && (_core.player.inBattle)))
                        {
                            _core.view.getUI(ViewManager.STAGE_BATTLE).setBattleSpeed(realFps);
                        };
                        frameRateState = 2;
                    }
                    else
                    {
                        if (((frameRateState == 2) && (realFps > 5)))
                        {
                            for (_local_5 in _core.view.cDict)
                            {
                                _local_6 = _core.view.getC(_local_5);
                                if (_local_6)
                                {
                                    _local_6.speed = int(((9 * GamePredef.GLOBAL_FRAME_RATE_DEFAULT) / GamePredef.GLOBAL_FRAME_RATE));
                                };
                            };
                            if ((((_core) && (_core.player)) && (_core.player.inBattle)))
                            {
                                _core.view.getUI(ViewManager.STAGE_BATTLE).setBattleSpeed(realFps);
                            };
                            frameRateState = 1;
                        };
                    };
                };
                total = 0;
            };
        }

        private function init():void
        {
            this.addEventListener(Event.ENTER_FRAME, updateInfo);
        }

        private function set mem(_arg_1:String):void
        {
            var _local_2:Object = this._107989mem;
            if (_local_2 !== _arg_1)
            {
                this._107989mem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mem", _local_2, _arg_1));
            };
        }

        private function _SysInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ("FPS:" + realFps.toString());
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SysInfoPanel_Label1.text = _arg_1;
            }, "_SysInfoPanel_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ("MEM:" + mem);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SysInfoPanel_Label2.text = _arg_1;
            }, "_SysInfoPanel_Label2.text");
            result[1] = binding;
            return (result);
        }

        public function ___SysInfoPanel_SimpleCanvas1_initialize(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _SysInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ("FPS:" + realFps.toString());
            _local_1 = ("MEM:" + mem);
        }

        private function set realFps(_arg_1:Number):void
        {
            var _local_2:Object = this._1080618603realFps;
            if (_local_2 !== _arg_1)
            {
                this._1080618603realFps = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "realFps", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get mem():String
        {
            return (this._107989mem);
        }

        [Bindable(event="propertyChange")]
        private function get realFps():Number
        {
            return (this._1080618603realFps);
        }


    }
}//package com.qeedoo.ui.view.compDragable

