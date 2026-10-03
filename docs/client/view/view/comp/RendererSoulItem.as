// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RendererSoulItem

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import flash.net.Responder;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.utils.TextUtil;
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

    public class RendererSoulItem extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var soulObj:Object;
        private var _106875lb1:Label;
        private var _97884btn:Button;
        private var _106876lb2:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "height":30,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"lb1"
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"lb2",
                        "stylesFactory":function ():void
                        {
                            this.color = 16775802;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":60});
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":50,
                                "styleName":"BtnStdRed"
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

        public function RendererSoulItem()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.height = 30;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RendererSoulItem._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get lb1():Label
        {
            return (this._106875lb1);
        }

        [Bindable(event="propertyChange")]
        public function get lb2():Label
        {
            return (this._106876lb2);
        }

        public function __btn_click(_arg_1:MouseEvent):void
        {
            onSubExchange();
        }

        public function set lb1(_arg_1:Label):void
        {
            var _local_2:Object = this._106875lb1;
            if (_local_2 !== _arg_1)
            {
                this._106875lb1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:RendererSoulItem;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RendererSoulItem_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_RendererSoulItemWatcherSetupUtil");
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

        override public function set data(_arg_1:Object):void
        {
            super.data = _arg_1;
            soulObj = _arg_1;
            if (_arg_1)
            {
                if (((_core.player) && (_core.player.soulChip >= soulObj.reqChip)))
                {
                    btn.enabled = true;
                }
                else
                {
                    btn.enabled = false;
                };
                lb1.text = (("【" + soulObj.name) + "】");
                lb1.setStyle("color", soulObj.color);
                lb2.text = (("【" + soulObj.desc) + "】");
                btn.toolTip = Language.PET_SOUL_S[28].replace("{num}", soulObj.reqChip);
            };
        }

        private function _RendererSoulItem_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PET_SOUL_S[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn.label = _arg_1;
            }, "btn.label");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get btn():Button
        {
            return (this._97884btn);
        }

        private function onSubExchange():void
        {
            if (_core.player.soulChip < int(soulObj.reqChip))
            {
                Alert.show(Language.PET_SOUL_S[8], "", Alert.YES, null, null);
                return;
            };
            if (((soulObj) && (soulObj.soulId)))
            {
                _core.remote.call("exchangeSoul", new Responder(onExchangeSoul), soulObj.soulId);
            };
        }

        private function _RendererSoulItem_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.PET_SOUL_S[35];
        }

        public function onExchangeSoul(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:String;
            if (!_arg_1)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case 1:
                    if (((_arg_1.soulData) && (_core.player.soulBagData["data"])))
                    {
                        _core.player.soulBagData["data"][_arg_1.soulData.s] = _arg_1.soulData;
                        _core.player.soulChip = _arg_1.chip;
                        _local_2 = _core.view.getUI(ViewManager.PANEL_SOUL_EXCHANGE);
                        if (_local_2)
                        {
                            _local_2.updateView();
                        };
                        _local_3 = _core.view.getUI(ViewManager.PANEL_PET_SOUL);
                        if (_local_3)
                        {
                            _local_3.updateSoulSlotView(_arg_1.soulData["s"]);
                            _local_3.changeSoulPanelInfo(_core.player.soulExp, _core.player.soulChip);
                        };
                        _local_4 = _arg_1.soulData.sid;
                        if (_local_4)
                        {
                            _local_5 = GameData.d[GamePredef.TBL_PET_SOUL][_local_4];
                            _local_6 = Language.PET_SOUL_S[53];
                            _local_6 = _local_6.replace("{soul}", TextUtil.decode((((((((("[@" + GamePredef.LINK_TYPE_ARRAY[GamePredef.TBL_PET_SOUL]) + "|") + _local_4) + "|") + _local_5.name) + "|") + _local_5.color) + "|0|0]")));
                            _core.sysBlueMsg(_local_6);
                        };
                    };
                    return;
                case 2:
                    Alert.show(Language.PET_SOUL_S[27], "", Alert.YES, null, null);
                    return;
                case 3:
                    Alert.show(Language.PET_SOUL_S[8], "", Alert.YES, null, null);
                    return;
            };
        }

        public function set btn(_arg_1:Button):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        public function set lb2(_arg_1:Label):void
        {
            var _local_2:Object = this._106876lb2;
            if (_local_2 !== _arg_1)
            {
                this._106876lb2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb2", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

