// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.TemporaryBagWarnCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import flash.utils.Timer;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
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

    public class TemporaryBagWarnCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var timer:Timer;
        private var _104387img:Image;
        private var _warnState:Boolean = false;
        private var flag:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":32,
                    "height":32,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "events":{"click":"__img_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "mouseChildren":false
                            });
                        }
                    })]
                });
            }
        });
        private var img1:Class = TemporaryBagWarnCanvas_img1;
        private var img2:Class = TemporaryBagWarnCanvas_img2;
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TemporaryBagWarnCanvas()
        {
            mx_internal::_document = this;
            this.width = 32;
            this.height = 32;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TemporaryBagWarnCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        public function __img_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_TEMPORARY_BAG);
        }

        private function _TemporaryBagWarnCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (img1);
            }, function (_arg_1:Object):void
            {
                img.source = _arg_1;
            }, "img.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TEMPORARYBAGWARNCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                img.toolTip = _arg_1;
            }, "img.toolTip");
            result[1] = binding;
            return (result);
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:TemporaryBagWarnCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TemporaryBagWarnCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_TemporaryBagWarnCanvasWatcherSetupUtil");
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

        private function _TemporaryBagWarnCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = img1;
            _local_1 = Language.TEMPORARYBAGWARNCANVAS_U[0];
        }

        public function reset():void
        {
            _warnState = false;
            visible = false;
        }

        public function set warnState(_arg_1:Boolean):void
        {
            _warnState = _arg_1;
            visible = _arg_1;
        }

        override public function set visible(_arg_1:Boolean):void
        {
            setVisible(_arg_1);
            if (_arg_1)
            {
                if (timer)
                {
                    return;
                };
                timer = new Timer(500, 0);
                timer.addEventListener(TimerEvent.TIMER, handleTimer);
                timer.start();
            }
            else
            {
                if (((timer) && (timer.running == true)))
                {
                    timer.stop();
                };
                timer = null;
            };
        }

        public function restore():void
        {
            visible = _warnState;
        }

        public function get warnState():Boolean
        {
            return (_warnState);
        }

        private function handleTimer(_arg_1:TimerEvent):void
        {
            if (flag == true)
            {
                img.source = img1;
                flag = false;
            }
            else
            {
                img.source = img2;
                flag = true;
            };
        }


    }
}//package com.qeedoo.ui.view.compMain

