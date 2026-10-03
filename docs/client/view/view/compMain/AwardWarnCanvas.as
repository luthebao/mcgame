// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.AwardWarnCanvas

package com.qeedoo.ui.view.compMain
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import mx.core.Application;
    import flash.display.Sprite;
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

    public class AwardWarnCanvas extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _337438527restTime:int;
        private var currentWarn:*;
        private var _1768633739warnImage:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":38,
                    "height":38,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"warnImage",
                        "events":{"click":"__warnImage_click"},
                        "stylesFactory":function ():void
                        {
                            this.themeColor = 2782887;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "visible":false,
                                "percentHeight":100
                            });
                        }
                    })]
                });
            }
        });
        private var warnArray:Array = new Array();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AwardWarnCanvas()
        {
            mx_internal::_document = this;
            this.width = 38;
            this.height = 38;
            this.cacheAsBitmap = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AwardWarnCanvas._watcherSetupUtil = _arg_1;
        }


        public function delWarnByType(_arg_1:int):void
        {
            var _local_2:int = (warnArray.length - 1);
            while (_local_2 >= 0)
            {
                if (((warnArray[_local_2]) && (warnArray[_local_2].warnType == _arg_1)))
                {
                    delWarn();
                    return;
                };
                _local_2--;
            };
        }

        [Bindable(event="propertyChange")]
        private function get restTime():int
        {
            return (this._337438527restTime);
        }

        private function set restTime(_arg_1:int):void
        {
            var _local_2:Object = this._337438527restTime;
            if (_local_2 !== _arg_1)
            {
                this._337438527restTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restTime", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            warnArray = new Array();
            this.visible = false;
        }

        override public function initialize():void
        {
            var target:AwardWarnCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AwardWarnCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_AwardWarnCanvasWatcherSetupUtil");
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

        private function initView():void
        {
            var _local_1:int;
            if (warnArray.length != 0)
            {
                this.visible = true;
                _local_1 = (warnArray.length - 1);
                while (_local_1 >= 0)
                {
                    if (warnArray[_local_1])
                    {
                        currentWarn = warnArray[_local_1];
                        break;
                    };
                    _local_1--;
                };
                if (currentWarn)
                {
                    warnImage.visible = true;
                    if (currentWarn.warnType == GamePredef.WARN_TYPE_FARM_RIPE)
                    {
                        warnImage.source = ResManager.ICON_WARN_FARM_RIPE;
                        warnImage.toolTip = currentWarn.msg;
                        width = 34;
                        height = 22;
                    }
                    else
                    {
                        if (currentWarn.warnType == GamePredef.WARN_TYPE_QUESTIONING)
                        {
                            warnImage.source = ResManager.ICON_WARN_QUESTION;
                            warnImage.toolTip = GamePredef.WARN_TIP_QUESTIONING;
                            width = 55;
                            height = 55;
                        }
                        else
                        {
                            if (currentWarn.warnType == GamePredef.WARN_TYPE_REGISTER_DXD)
                            {
                                warnImage.source = ResManager.ICON_WARN_REGISTER;
                                warnImage.toolTip = GamePredef.WARN_TIP_DXD_REGISTER;
                                width = 55;
                                height = 55;
                            }
                            else
                            {
                                if (currentWarn.warnType == GamePredef.WARN_TYPE_FEASTIVAL)
                                {
                                    warnImage.source = ResManager.ICON_WARN_AWARD;
                                    warnImage.toolTip = Language.GAMEPREDEF_S[521].replace(new RegExp("{feastival}", "g"), currentWarn.toolTip);
                                    width = 38;
                                    height = 38;
                                    restTime = Math.ceil((currentWarn.restTime / 60000));
                                }
                                else
                                {
                                    warnImage.source = ResManager.ICON_WARN_AWARD;
                                    warnImage.toolTip = GamePredef.WARN_TIP_AWARD;
                                    width = 38;
                                    height = 38;
                                    restTime = Math.ceil((currentWarn.restTime / 60000));
                                };
                            };
                        };
                    };
                }
                else
                {
                    this.visible = false;
                };
            }
            else
            {
                warnImage.visible = false;
                warnImage.source = null;
                this.visible = false;
            };
        }

        private function _AwardWarnCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = null;
            _local_1 = GamePredef.WARN_TIP_AWARD;
        }

        public function __warnImage_click(_arg_1:MouseEvent):void
        {
            imageClick();
        }

        public function addAwardWarn(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1.warnType == GamePredef.WARN_TYPE_REGISTER_DXD)
            {
                _local_2 = (warnArray.length - 1);
                while (_local_2 >= 0)
                {
                    if (warnArray[_local_2].warnType == GamePredef.WARN_TYPE_REGISTER_DXD)
                    {
                        warnArray.splice(_local_2, 1);
                        break;
                    };
                    _local_2--;
                };
            };
            warnArray.push(_arg_1);
            visible = true;
            initView();
            if (((_arg_1.warnType == GamePredef.WARN_TYPE_AWARD) || (_arg_1.warnType == GamePredef.WARN_TYPE_FEASTIVAL)))
            {
                initTime();
            };
        }

        public function set warnImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1768633739warnImage;
            if (_local_2 !== _arg_1)
            {
                this._1768633739warnImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "warnImage", _local_2, _arg_1));
            };
        }

        private function imageClick():void
        {
            var func:Function;
            if (currentWarn.warnType == GamePredef.WARN_TYPE_FARM_RIPE)
            {
                warnImage.visible = false;
                warnImage.source = null;
                delWarn();
            }
            else
            {
                if (currentWarn.warnType == GamePredef.WARN_TYPE_QUESTIONING)
                {
                    _core.view.getUI(ViewManager.PANEL_QUESTIONING).viewClick();
                    warnImage.visible = false;
                    warnImage.source = null;
                    delWarn();
                }
                else
                {
                    if (currentWarn.warnType == GamePredef.WARN_TYPE_REGISTER_DXD)
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                (((_core) && (_core.player)) && (_core.remote.call("dxdRegister", null, _core.player.id, true)));
                            }
                            else
                            {
                                (((_core) && (_core.player)) && (_core.remote.call("dxdRegister", null, _core.player.id, false)));
                            };
                        };
                        Alert.show(Language.AWARD_WARN_CANVAS_S[0], "", (Alert.YES | Alert.NO), (Application.application as Sprite), func);
                        warnImage.visible = false;
                        warnImage.source = null;
                        delWarn();
                    }
                    else
                    {
                        _core.view.getUI(ViewManager.PANEL_AWARD).viewClick();
                        warnImage.source = ResManager.ICON_WARN_AWARD1;
                    };
                };
            };
        }

        public function delDXDRegisterWarn():void
        {
            if (((currentWarn) && (currentWarn.warnType == GamePredef.WARN_TYPE_REGISTER_DXD)))
            {
                delWarn();
            };
        }

        public function delWarn():void
        {
            warnArray.pop();
            currentWarn = undefined;
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get warnImage():Image
        {
            return (this._1768633739warnImage);
        }

        public function delQuestionWarn():void
        {
            if (((currentWarn) && (currentWarn.warnType == GamePredef.WARN_TYPE_QUESTIONING)))
            {
                delWarn();
            };
        }

        private function _AwardWarnCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (null);
            }, function (_arg_1:Object):void
            {
                warnImage.source = _arg_1;
            }, "warnImage.source");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = GamePredef.WARN_TIP_AWARD;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                warnImage.toolTip = _arg_1;
            }, "warnImage.toolTip");
            result[1] = binding;
            return (result);
        }

        private function initTime():void
        {
            _core.view.getUI(ViewManager.PANEL_AWARD).init(restTime, currentWarn);
            _core.view.getUI(ViewManager.PANEL_AWARD).cancel();
        }


    }
}//package com.qeedoo.ui.view.compMain

