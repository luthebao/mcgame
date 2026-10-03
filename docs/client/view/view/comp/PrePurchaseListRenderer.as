// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PrePurchaseListRenderer

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.ui.resource.ResManager;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.config.Language;
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

    public class PrePurchaseListRenderer extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1090542378leftdayslabel:Label;
        private var _104079552money:Currency;
        private var pdata:Object = null;
        private var _97884btn:BasicDelayButton;
        private var _104387img:Image;
        private var _1177491377itemSlot:ItemSlot;
        private var _1245307721namelabel:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":226,
                    "height":82,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "source":"",
                                "width":48,
                                "height":60,
                                "x":0,
                                "y":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"itemSlot",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":32,
                                "height":32,
                                "x":28,
                                "y":27,
                                "acceptable":false,
                                "type":29,
                                "movable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"namelabel",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":63,
                                "y":11
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"leftdayslabel",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 11;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "text":"",
                                "x":63,
                                "y":59,
                                "width":153
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Currency,
                        "id":"money",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 12;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "value":0,
                                "x":68,
                                "y":35,
                                "width":62,
                                "type":1
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"btn",
                        "events":{"click":"__btn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":2000,
                                "label":"",
                                "x":136,
                                "y":34,
                                "styleName":"BtnNormalRed",
                                "width":73,
                                "height":21
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var hp:String = ResManager.getIconUrl(4130220003801);
        private var hg:String = ResManager.getIconUrl(4130220003802);
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PrePurchaseListRenderer()
        {
            mx_internal::_document = this;
            this.width = 226;
            this.height = 82;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.styleName = "CanvasBorder";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PrePurchaseListRenderer._watcherSetupUtil = _arg_1;
        }


        public function __btn_click(_arg_1:MouseEvent):void
        {
            list_itemClickHandler();
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

        public function set money(_arg_1:Currency):void
        {
            var _local_2:Object = this._104079552money;
            if (_local_2 !== _arg_1)
            {
                this._104079552money = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "money", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:PrePurchaseListRenderer;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PrePurchaseListRenderer_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_PrePurchaseListRendererWatcherSetupUtil");
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

        public function set namelabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1245307721namelabel;
            if (_local_2 !== _arg_1)
            {
                this._1245307721namelabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "namelabel", _local_2, _arg_1));
            };
        }

        private function _PrePurchaseListRenderer_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_SHOP);
            }, function (_arg_1:int):void
            {
                itemSlot.slotType = _arg_1;
            }, "itemSlot.slotType");
            result[0] = binding;
            return (result);
        }

        public function set leftdayslabel(_arg_1:Label):void
        {
            var _local_2:Object = this._1090542378leftdayslabel;
            if (_local_2 !== _arg_1)
            {
                this._1090542378leftdayslabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftdayslabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemSlot():ItemSlot
        {
            return (this._1177491377itemSlot);
        }

        private function _PrePurchaseListRenderer_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Slot.SLOT_SHOP;
        }

        public function set btn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._97884btn;
            if (_local_2 !== _arg_1)
            {
                this._97884btn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get money():Currency
        {
            return (this._104079552money);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        [Bindable(event="propertyChange")]
        public function get namelabel():Label
        {
            return (this._1245307721namelabel);
        }

        private function reset():void
        {
            itemSlot.slotData = null;
            itemSlot.giid = 0;
            itemSlot.stackNum = 0;
            namelabel.text = "null";
            money.value = 0;
            btn.label = "";
            img.source = "";
            leftdayslabel.text = "";
        }

        override public function set data(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                pdata = _arg_1;
                reset();
                _local_2 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][int(_arg_1.id)];
                if (!_local_2)
                {
                    return;
                };
                itemSlot.giid = int(_arg_1.id);
                itemSlot.slotData = _local_2;
                itemSlot.stackNum = int(_arg_1.n);
                namelabel.text = _arg_1.name;
                money.value = _arg_1.price;
                if (_arg_1.leftDays >= 0)
                {
                    leftdayslabel.text = Language.PPCHES_PANEL[3].toString().replace("{days}", _arg_1.leftDays);
                }
                else
                {
                    leftdayslabel.text = "";
                };
                switch (int(_arg_1.btnStatus))
                {
                    case 1:
                        btn.label = "购买截止";
                        img.source = "";
                        return;
                    case 2:
                        btn.label = "购买";
                        img.source = "";
                        leftdayslabel.text = "购买后连续7天每天可领取1次";
                        return;
                    case 3:
                        btn.label = "领取截止";
                        img.source = "";
                        leftdayslabel.text = Language.PPCHES_PANEL[3].toString().replace("{days}", 0);
                        return;
                    case 4:
                        btn.label = "今日已领取";
                        img.source = hg;
                        return;
                    case 5:
                        btn.label = "领取";
                        img.source = hp;
                        return;
                };
            };
        }

        private function list_itemClickHandler():void
        {
            if (pdata)
            {
                parentDocument.list_itemClickHandler(pdata);
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn():BasicDelayButton
        {
            return (this._97884btn);
        }

        [Bindable(event="propertyChange")]
        public function get leftdayslabel():Label
        {
            return (this._1090542378leftdayslabel);
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


    }
}//package com.qeedoo.ui.view.comp

