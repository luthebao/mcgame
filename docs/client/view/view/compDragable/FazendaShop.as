// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FazendaShop

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ShopSlot;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.data.GameData;
    import mx.events.PropertyChangeEvent;
    import mx.managers.CursorManager;
    import com.qeedoo.ui.resource.ResManager;
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

    public class FazendaShop extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2115046235shopSlot9:ShopSlot;
        private var _2115046243shopSlot1:ShopSlot;
        private var _2106311967tileItem:Tile;
        private var _2115046236shopSlot8:ShopSlot;
        private var _2115046240shopSlot4:ShopSlot;
        private var _2115046237shopSlot7:ShopSlot;
        private var _2115046241shopSlot3:ShopSlot;
        private var _1141924045shopSlot10:ShopSlot;
        public var _FazendaShop_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2115046238shopSlot6:ShopSlot;
        private var _2115046242shopSlot2:ShopSlot;
        private var _2115046239shopSlot5:ShopSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":420,
                    "height":300,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FazendaShop_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15";
                            this.top = "40";
                            this.bottom = "40";
                            this.right = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Tile,
                                    "id":"tileItem",
                                    "events":{"mouseDown":"__tileItem_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalAlign = "center";
                                        this.top = "3";
                                        this.paddingBottom = 5;
                                        this.paddingLeft = 5;
                                        this.paddingRight = 5;
                                        this.paddingTop = 5;
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "height":195,
                                            "width":386,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot1",
                                                "events":{"click":"__shopSlot1_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot2",
                                                "events":{"click":"__shopSlot2_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot3",
                                                "events":{"click":"__shopSlot3_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot4",
                                                "events":{"click":"__shopSlot4_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot5",
                                                "events":{"click":"__shopSlot5_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot6",
                                                "events":{"click":"__shopSlot6_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot7",
                                                "events":{"click":"__shopSlot7_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot8",
                                                "events":{"click":"__shopSlot8_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot9",
                                                "events":{"click":"__shopSlot9_click"}
                                            }), new UIComponentDescriptor({
                                                "type":ShopSlot,
                                                "id":"shopSlot10",
                                                "events":{"click":"__shopSlot10_click"}
                                            })]
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

        public function FazendaShop()
        {
            mx_internal::_document = this;
            this.styleName = "StandardContent";
            this.width = 420;
            this.height = 300;
            this.addEventListener("creationComplete", ___FazendaShop_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FazendaShop._watcherSetupUtil = _arg_1;
        }


        public function __shopSlot1_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot1.slotData.id);
        }

        public function __shopSlot3_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot3.slotData.id);
        }

        public function __shopSlot9_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot9.slotData.id);
        }

        override public function initialize():void
        {
            var target:FazendaShop;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FazendaShop_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FazendaShopWatcherSetupUtil");
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

        public function __shopSlot5_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot5.slotData.id);
        }

        public function __shopSlot7_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot7.slotData.id);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot1():ShopSlot
        {
            return (this._2115046243shopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot2():ShopSlot
        {
            return (this._2115046242shopSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot4():ShopSlot
        {
            return (this._2115046240shopSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot5():ShopSlot
        {
            return (this._2115046239shopSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot7():ShopSlot
        {
            return (this._2115046237shopSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot8():ShopSlot
        {
            return (this._2115046236shopSlot8);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot9():ShopSlot
        {
            return (this._2115046235shopSlot9);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot3():ShopSlot
        {
            return (this._2115046241shopSlot3);
        }

        public function init():void
        {
            var _local_2:*;
            var _local_3:String;
            var _local_4:Object;
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_MINERAL_TEMPLATE];
            for (_local_2 in _local_1)
            {
                _local_1[_local_2].type = GamePredef.TBL_MINERAL_TEMPLATE;
                _local_1[_local_2].itemId = _local_1[_local_2].id;
                _local_3 = Language.FAZENDAPANEL_S[17].toString().replace("{time}", _local_1[_local_2].time);
                _local_1[_local_2].description = (_local_1[_local_2].description + _local_3);
                _local_4 = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_local_1[_local_2].tid];
                _local_1[_local_2].info = Language.FAZENDAPANEL_S[18].toString().replace("{num}", _local_1[_local_2].num).replace("{name}", _local_4.name);
                this[("shopSlot" + _local_2)].type = GamePredef.TBL_MINERAL_TEMPLATE;
                this[("shopSlot" + _local_2)].giid = _local_1[_local_2].id;
                this[("shopSlot" + _local_2)].name = _local_1[_local_2].name;
                this[("shopSlot" + _local_2)].slotData = _local_1[_local_2];
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot6():ShopSlot
        {
            return (this._2115046238shopSlot6);
        }

        public function set shopSlot1(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046243shopSlot1;
            if (_local_2 !== _arg_1)
            {
                this._2115046243shopSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot1", _local_2, _arg_1));
            };
        }

        private function mouseAction(_arg_1:MouseEvent, _arg_2:int):void
        {
            CursorManager.removeAllCursors();
            _core.view.resoreMouse();
            _arg_1.stopImmediatePropagation();
            var _local_3:int = (160 + ((_arg_2 - 1) * 10));
            var _local_4:Class = ResManager.MOUSE_ACTION_IMG[_local_3];
            CursorManager.setCursor(_local_4);
            _core.view.mouseState = _local_3;
            hide();
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot10():ShopSlot
        {
            return (this._1141924045shopSlot10);
        }

        private function _FazendaShop_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAZENDASHOPPANEL_U[0];
        }

        public function set shopSlot7(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046237shopSlot7;
            if (_local_2 !== _arg_1)
            {
                this._2115046237shopSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot7", _local_2, _arg_1));
            };
        }

        public function __shopSlot2_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot2.slotData.id);
        }

        public function set shopSlot8(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046236shopSlot8;
            if (_local_2 !== _arg_1)
            {
                this._2115046236shopSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot8", _local_2, _arg_1));
            };
        }

        public function __shopSlot4_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot4.slotData.id);
        }

        public function __shopSlot6_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot6.slotData.id);
        }

        public function __shopSlot8_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot8.slotData.id);
        }

        public function set shopSlot4(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046240shopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._2115046240shopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot4", _local_2, _arg_1));
            };
        }

        public function set shopSlot5(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046239shopSlot5;
            if (_local_2 !== _arg_1)
            {
                this._2115046239shopSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot5", _local_2, _arg_1));
            };
        }

        private function _FazendaShop_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAZENDASHOPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FazendaShop_BasicTitleCanvas1.text = _arg_1;
            }, "_FazendaShop_BasicTitleCanvas1.text");
            result[0] = binding;
            return (result);
        }

        public function set shopSlot2(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046242shopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2115046242shopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot2", _local_2, _arg_1));
            };
        }

        public function set shopSlot3(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046241shopSlot3;
            if (_local_2 !== _arg_1)
            {
                this._2115046241shopSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot3", _local_2, _arg_1));
            };
        }

        public function set shopSlot9(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046235shopSlot9;
            if (_local_2 !== _arg_1)
            {
                this._2115046235shopSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot9", _local_2, _arg_1));
            };
        }

        public function __shopSlot10_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, shopSlot10.slotData.id);
        }

        [Bindable(event="propertyChange")]
        public function get tileItem():Tile
        {
            return (this._2106311967tileItem);
        }

        public function set shopSlot10(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924045shopSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1141924045shopSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot10", _local_2, _arg_1));
            };
        }

        public function __tileItem_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function ___FazendaShop_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set shopSlot6(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046238shopSlot6;
            if (_local_2 !== _arg_1)
            {
                this._2115046238shopSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot6", _local_2, _arg_1));
            };
        }

        public function set tileItem(_arg_1:Tile):void
        {
            var _local_2:Object = this._2106311967tileItem;
            if (_local_2 !== _arg_1)
            {
                this._2106311967tileItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileItem", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

