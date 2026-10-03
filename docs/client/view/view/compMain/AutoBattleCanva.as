// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.AutoBattleCanva

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import com.qeedoo.ui.view.comp.BasicMultiLineButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.view.compBattle.AutoBattleCanvas;
    import com.qeedoo.game.view.ViewManager;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class AutoBattleCanva extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3840xx:Image;
        private var _205990311btnLock:RoundedButton;
        private var _1432384199changBtn:BasicMultiLineButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":86.1,
                    "height":52,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicMultiLineButton,
                        "id":"changBtn",
                        "events":{"click":"__changBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":43,
                                "y":6,
                                "width":40,
                                "height":40,
                                "selected":true,
                                "styleName":"BtnBattleFlag"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"xx",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":48.5,
                                "y":11.5,
                                "mouseChildren":false,
                                "mouseEnabled":false,
                                "width":29,
                                "height":29
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedButton,
                        "id":"btnLock",
                        "events":{"click":"__btnLock_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":22,
                                "y":26,
                                "styleName":"btnLock",
                                "height":20,
                                "width":20
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _lockObj:Object = {};
        private var imageXX:Class = AutoBattleCanva_imageXX;
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AutoBattleCanva()
        {
            mx_internal::_document = this;
            this.width = 86.1;
            this.height = 52;
            this.addEventListener("creationComplete", ___AutoBattleCanva_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AutoBattleCanva._watcherSetupUtil = _arg_1;
        }


        private function _AutoBattleCanva_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AUTOBATTLECANVA_U[0];
            _local_1 = Language.AUTOBATTLECANVA_U[3];
            _local_1 = imageXX;
            _local_1 = Language.AUTOBATTLECANVA_U[2];
        }

        public function set xx(_arg_1:Image):void
        {
            var _local_2:Object = this._3840xx;
            if (_local_2 !== _arg_1)
            {
                this._3840xx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xx", _local_2, _arg_1));
            };
        }

        public function ___AutoBattleCanva_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        private function changeLocking(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                btnLock.selected = true;
                setMovable(false);
            }
            else
            {
                btnLock.selected = false;
                setMovable(true);
            };
        }

        public function setAutoStyle():void
        {
            var _local_1:AutoBattleCanvas = AutoBattleCanvas(_core.view.getUI(ViewManager.PANEL_BATTLEAUTO));
            if (!_local_1.auto)
            {
                changeStyle(true);
            }
            else
            {
                changeStyle(false);
            };
        }

        private function setLocking():void
        {
            if (_core.player.isLockedUB)
            {
                _core.player.isLockedUB = false;
                changeLocking(false);
            }
            else
            {
                _core.player.isLockedUB = true;
                changeLocking(true);
            };
            updateLockState();
        }

        private function autoBattleChange():void
        {
            var _local_1:AutoBattleCanvas = AutoBattleCanvas(_core.view.getUI(ViewManager.PANEL_BATTLEAUTO));
            if (!_local_1.auto)
            {
                _local_1.startAuto();
                _local_1.hide();
                changeStyle(false);
                xx.visible = false;
            }
            else
            {
                _local_1.stopAuto();
                changeStyle(true);
                xx.visible = true;
            };
        }

        public function initView():void
        {
        }

        private function updateLockState():void
        {
            _lockObj["ubl"] = _core.player.isLockedUB;
            _core.updateSetting("ubl", _core.player.isLockedUB);
            _core.remote.call("us", null, _lockObj);
            _lockObj = {};
        }

        override public function initialize():void
        {
            var target:AutoBattleCanva;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AutoBattleCanva_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_AutoBattleCanvaWatcherSetupUtil");
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

        public function changeStyle(_arg_1:Boolean):void
        {
            xx.visible = _arg_1;
        }

        public function initLock():void
        {
            if (_core.player)
            {
                btnLock.selected = _core.player.isLockedUB;
                changeLocking(btnLock.selected);
            };
        }

        private function _AutoBattleCanva_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVA_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changBtn.label = _arg_1;
            }, "changBtn.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVA_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changBtn.toolTip = _arg_1;
            }, "changBtn.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (imageXX);
            }, function (_arg_1:Object):void
            {
                xx.source = _arg_1;
            }, "xx.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUTOBATTLECANVA_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLock.toolTip = _arg_1;
            }, "btnLock.toolTip");
            result[3] = binding;
            return (result);
        }

        public function set btnLock(_arg_1:RoundedButton):void
        {
            var _local_2:Object = this._205990311btnLock;
            if (_local_2 !== _arg_1)
            {
                this._205990311btnLock = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLock", _local_2, _arg_1));
            };
        }

        public function __btnLock_click(_arg_1:MouseEvent):void
        {
            setLocking();
        }

        private function autoExp():void
        {
            _core.view.changeVisible(ViewManager.MAIN_AUTO_EXP);
        }

        public function __changBtn_click(_arg_1:MouseEvent):void
        {
            autoBattleChange();
        }

        public function set changBtn(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1432384199changBtn;
            if (_local_2 !== _arg_1)
            {
                this._1432384199changBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get changBtn():BasicMultiLineButton
        {
            return (this._1432384199changBtn);
        }

        [Bindable(event="propertyChange")]
        public function get xx():Image
        {
            return (this._3840xx);
        }

        private function setMovable(_arg_1:Boolean):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            var _local_3:int = 1;
            while (_local_3 <= 30)
            {
                _local_2[("s" + _local_3)].movable = _arg_1;
                _local_3++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLock():RoundedButton
        {
            return (this._205990311btnLock);
        }


    }
}//package com.qeedoo.ui.view.compMain

