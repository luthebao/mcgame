// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ConsumPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.TextArea;
    import mx.controls.Text;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.ItemConfig;
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

    public class ConsumPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1343731790msgText:TextArea;
        public var _ConsumPanel_Text1:Text;
        public var shopNum:int = 0;
        public var shopId:int = 0;
        public var _ConsumPanel_BasicGlowButton1:BasicGlowButton;
        public var _ConsumPanel_BasicGlowButton3:BasicGlowButton;
        private var _1354826374conBtn:BasicGlowButton;
        private var _148589695useAble:Boolean = false;
        public var additionalData:Object = null;
        private var numAbles:Boolean = false;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":200,
                    "height":144,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ConsumPanel_BasicGlowButton1",
                        "events":{"click":"___ConsumPanel_BasicGlowButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":118,
                                "y":110,
                                "width":45,
                                "styleName":"BtnNormalRed",
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"_ConsumPanel_Text1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 15;
                            this.horizontalCenter = "0";
                            this.fontFamily = "宋体";
                            this.color = 15438645;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":20});
                        }
                    }), new UIComponentDescriptor({
                        "type":TextArea,
                        "id":"msgText",
                        "stylesFactory":function ():void
                        {
                            this.backgroundAlpha = 0;
                            this.color = 0xFFFFFF;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":49,
                                "width":161,
                                "height":53,
                                "editable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"conBtn",
                        "events":{"click":"__conBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":40,
                                "y":110,
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_ConsumPanel_BasicGlowButton3",
                        "events":{"click":"___ConsumPanel_BasicGlowButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":40,
                                "y":110,
                                "styleName":"BtnNormalRed",
                                "width":40,
                                "height":19
                            });
                        }
                    })]
                });
            }
        });
        private var shopData:Object = new Object();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ConsumPanel()
        {
            mx_internal::_document = this;
            this.width = 200;
            this.height = 144;
            this.styleName = "CanvasPopup";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ConsumPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get conBtn():BasicGlowButton
        {
            return (this._1354826374conBtn);
        }

        public function set msg(_arg_1:String):void
        {
            visible = true;
            msgText.text = ("    " + _arg_1);
        }

        private function buy():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuy), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuy(true);
            };
        }

        public function set numAble(_arg_1:Boolean):void
        {
            this.numAbles = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get useAble():Boolean
        {
            return (this._148589695useAble);
        }

        public function set useAble(_arg_1:Boolean):void
        {
            var _local_2:Object = this._148589695useAble;
            if (_local_2 !== _arg_1)
            {
                this._148589695useAble = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "useAble", _local_2, _arg_1));
            };
        }

        private function doBuyAndUse(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_2) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                };
                _local_3 = new Object();
                _local_3.tid = shopData.itemId;
                _core.remote.useItemGold(_local_3);
                hide();
            };
        }

        override public function initialize():void
        {
            var target:ConsumPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ConsumPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ConsumPanelWatcherSetupUtil");
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

        public function set msgText(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1343731790msgText;
            if (_local_2 !== _arg_1)
            {
                this._1343731790msgText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "msgText", _local_2, _arg_1));
            };
        }

        private function _ConsumPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONSUMPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ConsumPanel_BasicGlowButton1.label = _arg_1;
            }, "_ConsumPanel_BasicGlowButton1.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONSUMPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ConsumPanel_Text1.text = _arg_1;
            }, "_ConsumPanel_Text1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(useAble));
            }, function (_arg_1:Boolean):void
            {
                conBtn.visible = _arg_1;
            }, "conBtn.visible");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONSUMPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                conBtn.label = _arg_1;
            }, "conBtn.label");
            result[3] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (useAble);
            }, function (_arg_1:Boolean):void
            {
                _ConsumPanel_BasicGlowButton3.visible = _arg_1;
            }, "_ConsumPanel_BasicGlowButton3.visible");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CONSUMPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ConsumPanel_BasicGlowButton3.label = _arg_1;
            }, "_ConsumPanel_BasicGlowButton3.label");
            result[5] = binding;
            return (result);
        }

        public function ___ConsumPanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            buyAndUse();
        }

        public function ___ConsumPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            hide();
        }

        public function set itemData(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in GameData.d[GamePredef.TBL_SHOP_SLOT])
            {
                if ((((GameData.d[GamePredef.TBL_SHOP_SLOT][_local_2].type == _arg_1.type) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_2].itemId == _arg_1.id)) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_2].gold > 0)))
                {
                    shopId = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_2].id;
                    shopData = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_2];
                    shopData.type = _arg_1.type;
                    break;
                };
            };
        }

        private function buySelected(_arg_1:int):void
        {
            _core.remote.buySystemItemClient(shopId, _arg_1);
            hide();
            if (shopData.itemId == 719)
            {
                if (((additionalData) && (additionalData.channelIndex == 9)))
                {
                    channelSelectRumour();
                }
                else
                {
                    channelSelectWorld();
                };
            }
            else
            {
                if (shopData.itemId == ItemConfig.ITEM_HEADLINE_SPEAKER)
                {
                    channelSelectHeadline();
                };
            };
        }

        private function channelSelectRumour():void
        {
            additionalData = null;
            if (_core.hasSpeakerNum() <= 0)
            {
                callLater(channelSelectRumour);
                return;
            };
            _core.view.getUI(ViewManager.MAIN_SYS).selectChannel(9);
        }

        [Bindable(event="propertyChange")]
        public function get msgText():TextArea
        {
            return (this._1343731790msgText);
        }

        private function channelSelectHeadline():void
        {
            if (_core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_HEADLINE_SPEAKER) <= 0)
            {
                callLater(channelSelectHeadline);
                return;
            };
            _core.view.getUI(ViewManager.MAIN_SYS).selectChannel(GamePredef.MSG_CHANNEL_HEADLINE);
        }

        private function buyAndUse():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuyAndUse), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuyAndUse(true);
            };
        }

        public function __conBtn_click(_arg_1:MouseEvent):void
        {
            buy();
        }

        private function _ConsumPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CONSUMPANEL_U[0];
            _local_1 = Language.CONSUMPANEL_S[0];
            _local_1 = (!(useAble));
            _local_1 = Language.CONSUMPANEL_U[1];
            _local_1 = useAble;
            _local_1 = Language.CONSUMPANEL_U[1];
        }

        public function set conBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1354826374conBtn;
            if (_local_2 !== _arg_1)
            {
                this._1354826374conBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "conBtn", _local_2, _arg_1));
            };
        }

        private function channelSelectWorld():void
        {
            if (_core.hasSpeakerNum() <= 0)
            {
                callLater(channelSelectWorld);
                return;
            };
            _core.view.getUI(ViewManager.MAIN_SYS).selectChannel(1);
        }

        private function doBuy(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:NumPanel;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_2) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                };
                if (numAbles)
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    _local_3.numSelected(shopData, buySelected);
                }
                else
                {
                    _core.remote.buySystemItemClient(shopId, shopNum);
                    hide();
                    this.shopId = 0;
                    this.shopNum = 0;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

