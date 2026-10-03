// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FriendsBar

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.getDefinitionByName;
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

    public class FriendsBar extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _charLevel:int = -1;
        public var _FriendsBar_Image1:Image;
        private var _94976_st:Boolean = false;
        private var _iconCode:Number;
        private var _98264cav:Canvas;
        private var _fData:Object;
        private var _mData:Object;
        private var _3642rl:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":140,
                    "height":18,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"cav",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"rl",
                                    "events":{"click":"__rl_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":0,
                                            "height":18,
                                            "width":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_FriendsBar_Image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":0,
                                            "width":18,
                                            "height":18
                                        });
                                    }
                                })]
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

        public function FriendsBar()
        {
            mx_internal::_document = this;
            this.width = 140;
            this.height = 18;
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___FriendsBar_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FriendsBar._watcherSetupUtil = _arg_1;
        }


        private function updateFriendFazendaByLocalData():void
        {
            var _local_1:Object = {};
            _local_1.farm = _fData;
            _local_1.mine = _mData;
            if (_charLevel < 0)
            {
                _local_1.lv = "--";
            }
            else
            {
                _local_1.lv = _charLevel;
            };
            if (_iconCode)
            {
                _local_1.icon = _iconCode;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_FAZENDA);
            _local_2.updateFazendaData(_local_1, false);
        }

        private function mouseOut(_arg_1:MouseEvent):void
        {
            cav.setStyle("backgroundColor", null);
        }

        public function set rl(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3642rl;
            if (_local_2 !== _arg_1)
            {
                this._3642rl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rl", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cav():Canvas
        {
            return (this._98264cav);
        }

        [Bindable(event="propertyChange")]
        private function get _st():Boolean
        {
            return (this._94976_st);
        }

        [Bindable(event="propertyChange")]
        public function get rl():RoundedLabel
        {
            return (this._3642rl);
        }

        private function _FriendsBar_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Boolean
            {
                return (_st);
            }, function (_arg_1:Boolean):void
            {
                _FriendsBar_Image1.visible = _arg_1;
            }, "_FriendsBar_Image1.visible");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.MOUSE_ACTION_CAN_STEAL);
            }, function (_arg_1:Object):void
            {
                _FriendsBar_Image1.source = _arg_1;
            }, "_FriendsBar_Image1.source");
            result[1] = binding;
            return (result);
        }

        private function updateView():void
        {
            rl.text = _fData.name;
        }

        public function init():void
        {
            addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
        }

        override public function set data(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _fData = _arg_1.farm;
                _mData = _arg_1.mine;
                _st = _arg_1.st;
                if (_arg_1.lv)
                {
                    _charLevel = _arg_1.lv;
                }
                else
                {
                    _charLevel = -1;
                };
                if (_arg_1.icon)
                {
                    _iconCode = _arg_1.icon;
                }
                else
                {
                    _iconCode = NaN;
                };
                updateView();
            };
        }

        override public function initialize():void
        {
            var target:FriendsBar;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FriendsBar_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FriendsBarWatcherSetupUtil");
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

        private function mouseOver(_arg_1:MouseEvent):void
        {
            cav.setStyle("backgroundColor", "#009dff");
        }

        public function ___FriendsBar_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __rl_click(_arg_1:MouseEvent):void
        {
            enterOthersFazenda();
        }

        private function enterOthersFazenda():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_FAZENDA);
            if (!_core.getFazendaDataByCid(_fData.cid))
            {
                trace("请求间隔不到1分钟, 使用本地数据更新好友庄园");
                updateFriendFazendaByLocalData();
            };
        }

        private function set _st(_arg_1:Boolean):void
        {
            var _local_2:Object = this._94976_st;
            if (_local_2 !== _arg_1)
            {
                this._94976_st = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_st", _local_2, _arg_1));
            };
        }

        private function _FriendsBar_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = _st;
            _local_1 = ResManager.MOUSE_ACTION_CAN_STEAL;
        }

        public function set cav(_arg_1:Canvas):void
        {
            var _local_2:Object = this._98264cav;
            if (_local_2 !== _arg_1)
            {
                this._98264cav = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

