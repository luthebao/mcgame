// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TreasureSlot

package com.qeedoo.ui.view.comp
{
    import com.qeedoo.game.ui.ISlot;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.vo.ShopSlotVO;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class TreasureSlot extends SimpleCanvas implements ISlot, IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1177514720itemText:RoundedLabel;
        private var _345321964shopSlot:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":120,
                    "height":41,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"shopSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":4,
                                "y":4,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"itemText",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":37,
                                "y":10,
                                "width":83,
                                "height":18
                            });
                        }
                    })]
                });
            }
        });
        private var _1141922867shopSlotVO:ShopSlotVO = new ShopSlotVO();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TreasureSlot()
        {
            mx_internal::_document = this;
            this.width = 120;
            this.height = 41;
            this.enabled = false;
            this.styleName = "CanvasShopSlot";
            this.addEventListener("creationComplete", ___TreasureSlot_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TreasureSlot._watcherSetupUtil = _arg_1;
        }


        public function set giid(_arg_1:Number):void
        {
            shopSlotVO.giid = _arg_1;
        }

        public function ___TreasureSlot_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function restore():void
        {
            shopSlot.restore();
        }

        override public function initialize():void
        {
            var target:TreasureSlot;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TreasureSlot_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TreasureSlotWatcherSetupUtil");
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

        private function set shopSlotVO(_arg_1:ShopSlotVO):void
        {
            var _local_2:Object = this._1141922867shopSlotVO;
            if (_local_2 !== _arg_1)
            {
                this._1141922867shopSlotVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlotVO", _local_2, _arg_1));
            };
        }

        public function get selected():Boolean
        {
            return ((filters) && (filters.length > 0));
        }

        public function set index(_arg_1:int):void
        {
            shopSlotVO.index = _arg_1;
            _core.view.addSlot(_arg_1, this);
        }

        public function set slotData(_arg_1:Object):void
        {
            shopSlotVO.slotData = _arg_1;
            if (_arg_1)
            {
                getItemInfo(shopSlotVO.type, shopSlotVO.giid);
                enabled = true;
            };
        }

        private function _TreasureSlot_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = shopSlotVO.slotData;
            _local_1 = shopSlotVO.type;
            _local_1 = shopSlotVO.giid;
            _local_1 = Slot.SLOT_TREASURE;
            _local_1 = shopSlotVO.itemName;
            _local_1 = shopSlotVO.itemColor;
        }

        public function set shopSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._345321964shopSlot;
            if (_local_2 !== _arg_1)
            {
                this._345321964shopSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot", _local_2, _arg_1));
            };
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                filters = [GamePredef.FILTER_SHOPSLOT_SELECTED];
            }
            else
            {
                filters = [];
            };
        }

        public function set stackNum(_arg_1:int):void
        {
            shopSlotVO.stackNum = _arg_1;
        }

        public function set itemText(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1177514720itemText;
            if (_local_2 !== _arg_1)
            {
                this._1177514720itemText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemText", _local_2, _arg_1));
            };
        }

        public function get type():int
        {
            return (shopSlotVO.type);
        }

        public function get slotData():Object
        {
            return ((shopSlot) ? shopSlot.slotData : shopSlotVO.slotData);
        }

        public function clean():void
        {
            shopSlot.clean();
            shopSlotVO.itemName = "";
            enabled = false;
        }

        public function get stackMax():int
        {
            return (shopSlotVO.stackMax);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot():ItemSlot
        {
            return (this._345321964shopSlot);
        }

        public function reset():void
        {
            shopSlot.reset();
        }

        [Bindable(event="propertyChange")]
        private function get shopSlotVO():ShopSlotVO
        {
            return (this._1141922867shopSlotVO);
        }

        public function initView():void
        {
        }

        public function get index():int
        {
            return (shopSlotVO.index);
        }

        private function _TreasureSlot_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (shopSlotVO.slotData);
            }, function (_arg_1:Object):void
            {
                shopSlot.slotData = _arg_1;
            }, "shopSlot.slotData");
            result[0] = binding;
            binding = new Binding(this, function ():int
            {
                return (shopSlotVO.type);
            }, function (_arg_1:int):void
            {
                shopSlot.type = _arg_1;
            }, "shopSlot.type");
            result[1] = binding;
            binding = new Binding(this, function ():Number
            {
                return (shopSlotVO.giid);
            }, function (_arg_1:Number):void
            {
                shopSlot.giid = _arg_1;
            }, "shopSlot.giid");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_TREASURE);
            }, function (_arg_1:int):void
            {
                shopSlot.slotType = _arg_1;
            }, "shopSlot.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = shopSlotVO.itemName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                itemText.text = _arg_1;
            }, "itemText.text");
            result[4] = binding;
            binding = new Binding(this, function ():uint
            {
                return (shopSlotVO.itemColor);
            }, function (_arg_1:uint):void
            {
                itemText.setStyle("color", _arg_1);
            }, "itemText.color");
            result[5] = binding;
            return (result);
        }

        public function get stackNum():int
        {
            return (shopSlotVO.stackNum);
        }

        public function get slotType():int
        {
            return (shopSlot.slotType);
        }

        [Bindable(event="propertyChange")]
        public function get itemText():RoundedLabel
        {
            return (this._1177514720itemText);
        }

        private function getItemInfo(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int;
            if (((_arg_2 <= 0) || (_arg_1 <= 0)))
            {
                return;
            };
            var _local_3:Object = _core.getTemplateData(_arg_1, _arg_2);
            if (_local_3 != null)
            {
                _local_4 = int(Math.ceil((shopSlotVO.slotData.quality / 5)));
                if (ToolKit.isBigOrEqual(_local_3.color, 0))
                {
                    _local_4 = _local_3.color;
                };
                shopSlotVO.itemName = _local_3.name;
                if (ToolKit.isOriginalMaterial(_local_3))
                {
                    shopSlotVO.itemName = (shopSlotVO.itemName + (("[" + GamePredef.POSTFIX_MATERIAL_NAME[_local_4]) + "]"));
                };
                shopSlotVO.itemColor = GamePredef.CODE_ITEM_COLOR[_local_4];
            }
            else
            {
                trace("ShopSlot:getItemInfo-Calllater");
                callLater(getItemInfo, [_arg_1, _arg_2]);
            };
        }

        public function update():void
        {
            shopSlot.update();
        }

        public function set type(_arg_1:int):void
        {
            shopSlotVO.type = _arg_1;
        }

        public function get giid():Number
        {
            return (shopSlotVO.giid);
        }

        public function set stackMax(_arg_1:int):void
        {
            shopSlotVO.stackMax = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

