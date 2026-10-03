// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NumPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Label;
    import com.qeedoo.game.ui.ISlot;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class NumPanel extends DragableCanvas implements IBindingClient 
    {

        public static const TYPE_BUY:uint = 0;
        public static const TYPE_MOVE:uint = 1;
        public static const TYPE_AMOUNTBUY:uint = 2;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _hideCallback:Function;
        private var _1513419331btn_cancel:BasicGlowButton;
        private var _type:int;
        private var _206544419btn_buy:BasicGlowButton;
        private var _callback:Function;
        private var _defaultStack:int;
        private var _actionType:uint;
        public var _NumPanel_Label1:Label;
        private var _parent:DragableCanvas;
        private var _targetSlot:ISlot;
        private var _1177491377itemSlot:ItemSlot;
        private var _sourceSlot:ISlot;
        private var _729542621btn_confirm:BasicGlowButton;
        private var _401559445numStepper:NumericStepper;
        private var _shopTrolleyPane:SystemShopTrolleyPanel;
        private var _1275771774btn_trolley:BasicGlowButton;
        private var _maxStack:int;
        private var _tid:Number;
        public var _NumPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _shopSlotId:Number;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":186,
                    "height":126,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_NumPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"itemSlot",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":22,
                                            "y":13,
                                            "movable":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_NumPanel_Label1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"DescriptionText",
                                            "x":58,
                                            "y":20,
                                            "width":41
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":NumericStepper,
                                    "id":"numStepper",
                                    "events":{"mouseDown":"__numStepper_mouseDown"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":92,
                                            "y":18,
                                            "value":1,
                                            "maximum":20,
                                            "minimum":1,
                                            "width":76
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_confirm",
                                    "events":{"click":"__btn_confirm_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":30,
                                            "y":53,
                                            "width":60,
                                            "height":20,
                                            "styleName":"BtnNormalRed",
                                            "focusEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_cancel",
                                    "events":{"click":"__btn_cancel_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":98,
                                            "y":53,
                                            "width":60,
                                            "height":20,
                                            "styleName":"BtnNormalRed",
                                            "focusEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_buy",
                                    "events":{"click":"__btn_buy_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":22,
                                            "y":53,
                                            "width":70,
                                            "height":20,
                                            "styleName":"BtnNormalRed",
                                            "focusEnabled":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_trolley",
                                    "events":{"click":"__btn_trolley_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":98,
                                            "y":53,
                                            "width":70,
                                            "height":20,
                                            "styleName":"BtnNormalRed",
                                            "focusEnabled":false
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
        private var _dm:DataManager = DataManager.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function NumPanel()
        {
            mx_internal::_document = this;
            this.width = 186;
            this.height = 126;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NumPanel._watcherSetupUtil = _arg_1;
        }


        public function set btn_cancel(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1513419331btn_cancel;
            if (_local_2 !== _arg_1)
            {
                this._1513419331btn_cancel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_cancel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_trolley():BasicGlowButton
        {
            return (this._1275771774btn_trolley);
        }

        public function set btn_trolley(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1275771774btn_trolley;
            if (_local_2 !== _arg_1)
            {
                this._1275771774btn_trolley = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_trolley", _local_2, _arg_1));
            };
        }

        public function __btn_buy_click(_arg_1:MouseEvent):void
        {
            submit();
        }

        private function submit():void
        {
            var doLocked:Function = function ():Boolean
            {
                var doBuy:Function;
                var bagPanel:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                var func:Function = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doBuy), MD5.hash(_arg_1));
                };
                if (((_parent == _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP)) && (bagPanel.goldDisable())))
                {
                    doBuy = SystemShopPanel(_parent).doBuy;
                    _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.NUMPANEL_U[1], func);
                    return (true);
                };
                if (_parent == _core.view.getUI(ViewManager.PANEL_SHOP))
                {
                    if ((((_sourceSlot) && (_sourceSlot.slotData)) && (_sourceSlot.slotData.gold > 0)))
                    {
                        if (bagPanel.goldDisable())
                        {
                            doBuy = ShopPanel(_parent).doBuy;
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.NUMPANEL_U[1], func);
                            return (true);
                        };
                    }
                    else
                    {
                        if (bagPanel.silverDisable())
                        {
                            doBuy = ShopPanel(_parent).doBuy;
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.NUMPANEL_U[2], func);
                            return (true);
                        };
                    };
                };
                return (false);
            };
            if (doLocked())
            {
                hide();
                return;
            };
            if (((_actionType == TYPE_AMOUNTBUY) && (!(_callback == null))))
            {
                _core.remote.call("buyAmountItemClient", new Responder(_callback), _shopSlotId, numStepper.value);
                hide();
                return;
            };
            if (_callback != null)
            {
                _callback(numStepper.value);
                hide();
                return;
            };
            switch (_actionType)
            {
                case TYPE_BUY:
                    _core.remote.buyItemClient(_shopSlotId, numStepper.value);
                    break;
                case TYPE_MOVE:
                    _core.remote.moveItemNum(_sourceSlot.index, _targetSlot.index, numStepper.value);
                    break;
            };
            hide();
        }

        override public function initialize():void
        {
            var target:NumPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NumPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NumPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get btn_buy():BasicGlowButton
        {
            return (this._206544419btn_buy);
        }

        public function __btn_trolley_click(_arg_1:MouseEvent):void
        {
            putInShopTrolley();
        }

        [Bindable(event="propertyChange")]
        public function get itemSlot():ItemSlot
        {
            return (this._1177491377itemSlot);
        }

        [Bindable(event="propertyChange")]
        public function get btn_cancel():BasicGlowButton
        {
            return (this._1513419331btn_cancel);
        }

        public function numSelected(_arg_1:Object, _arg_2:Function):void
        {
            itemSlot.type = _arg_1.type;
            itemSlot.giid = _arg_1.itemId;
            _callback = _arg_2;
            show();
        }

        public function showSelected(_arg_1:ISlot, _arg_2:ISlot=null, _arg_3:uint=0, _arg_4:Function=null, _arg_5:Function=null):void
        {
            var _local_7:Object;
            _tid = _arg_1.giid;
            _type = _arg_1.type;
            _shopSlotId = _arg_1.slotData.id;
            var _local_6:Object = _core.getTemplateData(_type, _tid);
            _maxStack = _core.getTemplateData(_type, _tid).stackMax;
            _actionType = _arg_3;
            _targetSlot = _arg_2;
            _sourceSlot = _arg_1;
            _callback = _arg_4;
            _hideCallback = _arg_5;
            numStepper.value = _defaultStack;
            if (((_arg_3 == TYPE_BUY) || (_arg_3 == TYPE_AMOUNTBUY)))
            {
                _local_7 = _core.getTemplateData(_sourceSlot.slotData.type, _sourceSlot.slotData.itemId);
                if (_local_7)
                {
                    numStepper.maximum = _local_7.stackMax;
                };
                if (((_parent == _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP)) && (_arg_1.slotData.point <= 0)))
                {
                    btn_confirm.visible = false;
                    btn_cancel.visible = false;
                    btn_trolley.visible = true;
                    btn_buy.visible = true;
                }
                else
                {
                    btn_confirm.visible = true;
                    btn_cancel.visible = true;
                    btn_trolley.visible = false;
                    btn_buy.visible = false;
                };
            }
            else
            {
                numStepper.maximum = _sourceSlot.stackNum;
                btn_confirm.visible = true;
                btn_cancel.visible = true;
                btn_trolley.visible = false;
                btn_buy.visible = false;
            };
            itemSlot.slotData = _arg_1.slotData;
            itemSlot.type = _type;
            itemSlot.giid = _tid;
            show();
        }

        public function set btn_confirm(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._729542621btn_confirm;
            if (_local_2 !== _arg_1)
            {
                this._729542621btn_confirm = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_confirm", _local_2, _arg_1));
            };
        }

        public function set parent(_arg_1:*):void
        {
            this._parent = _arg_1;
        }

        public function __btn_confirm_click(_arg_1:MouseEvent):void
        {
            submit();
        }

        public function set numStepper(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._401559445numStepper;
            if (_local_2 !== _arg_1)
            {
                this._401559445numStepper = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "numStepper", _local_2, _arg_1));
            };
        }

        private function putInShopTrolley():void
        {
            var _local_1:Object = new Object();
            _local_1.itemId = _tid;
            _local_1.type = _type;
            _local_1.stackNum = _sourceSlot.stackNum;
            _local_1.name = _core.getTemplateData(_type, _tid).name;
            _local_1.kind = _core.getTemplateData(_type, _tid).kind;
            _local_1.typeName = _core.getTemplateData(_type, _tid).type;
            _local_1.gold = _sourceSlot.slotData.gold;
            _local_1.shopSlotId = _shopSlotId;
            _local_1.num = numStepper.value;
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP_TROLLEY);
            _local_2.addGoodsToTrolley(_local_1);
            hide();
        }

        public function set itemSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1177491377itemSlot;
            if (_local_2 !== _arg_1)
            {
                this._1177491377itemSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn_confirm():BasicGlowButton
        {
            return (this._729542621btn_confirm);
        }

        public function __btn_cancel_click(_arg_1:MouseEvent):void
        {
            cancel();
        }

        [Bindable(event="propertyChange")]
        public function get numStepper():NumericStepper
        {
            return (this._401559445numStepper);
        }

        public function __numStepper_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function _NumPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NUMPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NumPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_NumPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.NUMPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NumPanel_Label1.text = _arg_1;
            }, "_NumPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_confirm.label = _arg_1;
            }, "btn_confirm.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_cancel.label = _arg_1;
            }, "btn_cancel.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_buy.label = _arg_1;
            }, "btn_buy.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.INPUTPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn_trolley.label = _arg_1;
            }, "btn_trolley.label");
            result[5] = binding;
            return (result);
        }

        private function cancel():void
        {
            if (_hideCallback != null)
            {
                _hideCallback();
            };
            hide();
        }

        private function _NumPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.NUMPANEL_U[0];
            _local_1 = Language.NUMPANEL_S[0];
            _local_1 = Language.INPUTPANEL_U[0];
            _local_1 = Language.INPUTPANEL_U[1];
            _local_1 = Language.INPUTPANEL_U[3];
            _local_1 = Language.INPUTPANEL_U[4];
        }

        override public function show():void
        {
            super.show();
            x = ((stage.stageWidth - width) / 2);
            y = ((stage.stageHeight - height) / 2);
        }

        public function set btn_buy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._206544419btn_buy;
            if (_local_2 !== _arg_1)
            {
                this._206544419btn_buy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_buy", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

