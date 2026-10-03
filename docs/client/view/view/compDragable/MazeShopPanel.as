// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazeShopPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.CrossLineLabel;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.data.GameData;
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

    public class MazeShopPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _104584966name1:RoundedLabel;
        private var _sid1:int = -1;
        private var _sid2:int = -1;
        private var _name1:String = "";
        private var _name2:String = "";
        private var _109532659slot1:ItemSlot;
        private var _550215927cancel1:Button;
        private var _itemId1:int = -1;
        private var _itemId2:int = -1;
        public var _MazeShopPanel_RoundedLabel2:RoundedLabel;
        public var _MazeShopPanel_RoundedLabel3:RoundedLabel;
        public var _MazeShopPanel_RoundedLabel7:RoundedLabel;
        private var _costBefore1:int = -1;
        public var _MazeShopPanel_RoundedLabel6:RoundedLabel;
        private var _costBefore2:int = -1;
        private var _3035756buy2:Button;
        private var _104584967name2:RoundedLabel;
        public var _MazeShopPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _costAfter1:int = -1;
        private var _costAfter2:int = -1;
        private var _823812895value2:CrossLineLabel;
        private var _109532660slot2:ItemSlot;
        private var _527533407newValue2:RoundedLabel;
        private var _527533408newValue1:RoundedLabel;
        private var _3035755buy1:Button;
        public var _MazeShopPanel_Image1:Image;
        public var _MazeShopPanel_Image2:Image;
        public var _MazeShopPanel_Image3:Image;
        public var _MazeShopPanel_Image4:Image;
        private var _823812896value1:CrossLineLabel;
        private var _550215928cancel2:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":320,
                    "height":210,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazeShopPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "55";
                            this.left = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":140,
                                "height":100,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"name1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":10,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MazeShopPanel_RoundedLabel2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":58
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_MazeShopPanel_Image1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":16,
                                            "height":16,
                                            "y":58,
                                            "x":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossLineLabel,
                                    "id":"value1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":58,
                                            "lineColor":0xFFFFFF
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MazeShopPanel_RoundedLabel3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_MazeShopPanel_Image2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":16,
                                            "height":16,
                                            "y":78,
                                            "x":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"newValue1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot1",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":53,
                                            "y":16,
                                            "movable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "55";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "width":140,
                                "height":100,
                                "verticalScrollPolicy":"off",
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"name2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":10,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MazeShopPanel_RoundedLabel6",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":58
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_MazeShopPanel_Image3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":16,
                                            "height":16,
                                            "y":58,
                                            "x":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":CrossLineLabel,
                                    "id":"value2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":58,
                                            "lineColor":0xFFFFFF
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_MazeShopPanel_RoundedLabel7",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_MazeShopPanel_Image4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":16,
                                            "height":16,
                                            "y":78,
                                            "x":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"newValue2",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 12;
                                        this.textAlign = "center";
                                        this.fontStyle = "normal";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":78
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ItemSlot,
                                    "id":"slot2",
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "solid";
                                        this.borderThickness = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":53,
                                            "y":16,
                                            "movable":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"buy1",
                        "events":{"click":"__buy1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":163,
                                "x":41
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"cancel1",
                        "events":{"click":"__cancel1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":163,
                                "x":91
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"buy2",
                        "events":{"click":"__buy2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":163,
                                "x":193
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"cancel2",
                        "events":{"click":"__cancel2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnNormalBlue",
                                "height":20,
                                "width":40,
                                "y":163,
                                "x":243
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

        public function MazeShopPanel()
        {
            mx_internal::_document = this;
            this.width = 320;
            this.height = 210;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazeShopPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazeShopPanel._watcherSetupUtil = _arg_1;
        }


        public function set slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set name1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._104584966name1;
            if (_local_2 !== _arg_1)
            {
                this._104584966name1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get name1():RoundedLabel
        {
            return (this._104584966name1);
        }

        public function set name2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._104584967name2;
            if (_local_2 !== _arg_1)
            {
                this._104584967name2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name2", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            _core.remote.call("getMazeShopItem", new Responder(onGetShopId), null);
            this.visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get name2():RoundedLabel
        {
            return (this._104584967name2);
        }

        private function _MazeShopPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazeShopPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                name1.text = _arg_1;
            }, "name1.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_RoundedLabel2.text = _arg_1;
            }, "_MazeShopPanel_RoundedLabel2.text");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_CURRENCY_GOLD);
            }, function (_arg_1:Object):void
            {
                _MazeShopPanel_Image1.source = _arg_1;
            }, "_MazeShopPanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_Image1.toolTip = _arg_1;
            }, "_MazeShopPanel_Image1.toolTip");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                value1.text = _arg_1;
            }, "value1.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_RoundedLabel3.text = _arg_1;
            }, "_MazeShopPanel_RoundedLabel3.text");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_CURRENCY_GOLD);
            }, function (_arg_1:Object):void
            {
                _MazeShopPanel_Image2.source = _arg_1;
            }, "_MazeShopPanel_Image2.source");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_Image2.toolTip = _arg_1;
            }, "_MazeShopPanel_Image2.toolTip");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                newValue1.text = _arg_1;
            }, "newValue1.text");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot1.type = _arg_1;
            }, "slot1.type");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                name2.text = _arg_1;
            }, "name2.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_RoundedLabel6.text = _arg_1;
            }, "_MazeShopPanel_RoundedLabel6.text");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_CURRENCY_GOLD);
            }, function (_arg_1:Object):void
            {
                _MazeShopPanel_Image3.source = _arg_1;
            }, "_MazeShopPanel_Image3.source");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_Image3.toolTip = _arg_1;
            }, "_MazeShopPanel_Image3.toolTip");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                value2.text = _arg_1;
            }, "value2.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_RoundedLabel7.text = _arg_1;
            }, "_MazeShopPanel_RoundedLabel7.text");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_CURRENCY_GOLD);
            }, function (_arg_1:Object):void
            {
                _MazeShopPanel_Image4.source = _arg_1;
            }, "_MazeShopPanel_Image4.source");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeShopPanel_Image4.toolTip = _arg_1;
            }, "_MazeShopPanel_Image4.toolTip");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                newValue2.text = _arg_1;
            }, "newValue2.text");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                slot2.type = _arg_1;
            }, "slot2.type");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buy1.label = _arg_1;
            }, "buy1.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cancel1.label = _arg_1;
            }, "cancel1.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                buy2.label = _arg_1;
            }, "buy2.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_SHOP_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cancel2.label = _arg_1;
            }, "cancel2.label");
            result[24] = binding;
            return (result);
        }

        public function onBuy(_arg_1:int):*
        {
            if (_arg_1)
            {
                this[("slot" + _arg_1)].reset();
                this[("buy" + _arg_1)].enabled = false;
            };
        }

        public function set newValue2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._527533407newValue2;
            if (_local_2 !== _arg_1)
            {
                this._527533407newValue2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newValue2", _local_2, _arg_1));
            };
        }

        public function set newValue1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._527533408newValue1;
            if (_local_2 !== _arg_1)
            {
                this._527533408newValue1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newValue1", _local_2, _arg_1));
            };
        }

        public function __cancel1_click(_arg_1:MouseEvent):void
        {
            cancel(1);
        }

        [Bindable(event="propertyChange")]
        public function get buy1():Button
        {
            return (this._3035755buy1);
        }

        [Bindable(event="propertyChange")]
        public function get buy2():Button
        {
            return (this._3035756buy2);
        }

        public function cancel(_arg_1:int):void
        {
            this.visible = false;
        }

        public function buy(index:int):void
        {
            var obj:* = undefined;
            var sid:int = -1;
            var costBefore:int = -1;
            var costAfter:int = -1;
            var name:String = "";
            if (index == 1)
            {
                sid = _sid1;
                costBefore = _costBefore1;
                costAfter = _costAfter1;
                name = _name1;
            }
            else
            {
                if (index == 2)
                {
                    sid = _sid2;
                    costBefore = _costBefore2;
                    costAfter = _costAfter2;
                    name = _name2;
                }
                else
                {
                    return;
                };
            };
            obj = {};
            obj.sid = sid;
            obj.index = index;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("buyMazeShopItem", new Responder(onBuy), obj);
                };
            };
            Alert.show(Language.MAZE_SHOP_PANEL_U[7].toString().replace("{costBefore}", costBefore).replace("{costAfter}", costAfter).replace("{name}", name), "", (Alert.YES | Alert.NO), null, func);
        }

        public function onGetShopId(_arg_1:Object):void
        {
            var _local_4:Object;
            if ((((_arg_1 == null) || (_arg_1.item1 == null)) || (_arg_1.item2 == null)))
            {
                return;
            };
            _itemId1 = _arg_1.item1.itemId;
            _itemId2 = _arg_1.item2.itemId;
            _sid1 = _arg_1.item1.sid;
            _sid2 = _arg_1.item2.sid;
            _costBefore1 = _arg_1.item1.goldBefore;
            _costBefore2 = _arg_1.item2.goldBefore;
            _costAfter1 = _arg_1.item1.goldAfter;
            _costAfter2 = _arg_1.item2.goldAfter;
            var _local_2:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_itemId1];
            if (_local_2)
            {
                slot1.slotData = _local_2;
                slot1.type = 29;
                slot1.giid = _local_2.id;
                slot1.stackNum = 1;
                slot1.quality = _local_2.color;
                buy1.enabled = true;
                _local_4 = GameData.d[slot1.type][slot1.giid];
                _name1 = _local_4.name;
                name1.text = Language.MAZE_SHOP_PANEL_U[1].toString().replace("{name}", _name1);
            };
            var _local_3:Object = GameData.d[GamePredef.TBL_ITEM_TEMPLATE][_itemId2];
            if (_local_3)
            {
                slot2.slotData = _local_3;
                slot2.type = 29;
                slot2.giid = _local_3.id;
                slot2.stackNum = 1;
                slot2.quality = _local_3.color;
                buy2.enabled = true;
                _local_4 = GameData.d[slot2.type][slot2.giid];
                _name2 = _local_4.name;
                name2.text = Language.MAZE_SHOP_PANEL_U[1].toString().replace("{name}", _name2);
            };
            value1.text = _arg_1.item1.goldBefore;
            newValue1.text = _arg_1.item1.goldAfter;
            value2.text = _arg_1.item2.goldBefore;
            newValue2.text = _arg_1.item2.goldAfter;
        }

        public function __buy1_click(_arg_1:MouseEvent):void
        {
            buy(1);
        }

        override public function initialize():void
        {
            var target:MazeShopPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazeShopPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazeShopPanelWatcherSetupUtil");
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

        public function ___MazeShopPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get newValue1():RoundedLabel
        {
            return (this._527533408newValue1);
        }

        public function __cancel2_click(_arg_1:MouseEvent):void
        {
            cancel(2);
        }

        [Bindable(event="propertyChange")]
        public function get newValue2():RoundedLabel
        {
            return (this._527533407newValue2);
        }

        public function set value2(_arg_1:CrossLineLabel):void
        {
            var _local_2:Object = this._823812895value2;
            if (_local_2 !== _arg_1)
            {
                this._823812895value2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "value2", _local_2, _arg_1));
            };
        }

        public function set value1(_arg_1:CrossLineLabel):void
        {
            var _local_2:Object = this._823812896value1;
            if (_local_2 !== _arg_1)
            {
                this._823812896value1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "value1", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
        }

        public function set buy1(_arg_1:Button):void
        {
            var _local_2:Object = this._3035755buy1;
            if (_local_2 !== _arg_1)
            {
                this._3035755buy1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buy1", _local_2, _arg_1));
            };
        }

        public function set buy2(_arg_1:Button):void
        {
            var _local_2:Object = this._3035756buy2;
            if (_local_2 !== _arg_1)
            {
                this._3035756buy2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buy2", _local_2, _arg_1));
            };
        }

        public function __buy2_click(_arg_1:MouseEvent):void
        {
            buy(2);
        }

        [Bindable(event="propertyChange")]
        public function get value1():CrossLineLabel
        {
            return (this._823812896value1);
        }

        [Bindable(event="propertyChange")]
        public function get value2():CrossLineLabel
        {
            return (this._823812895value2);
        }

        private function _MazeShopPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_SHOP_PANEL_U[0];
            _local_1 = Language.MAZE_SHOP_PANEL_U[1];
            _local_1 = Language.MAZE_SHOP_PANEL_U[2];
            _local_1 = ResManager.ICON_CURRENCY_GOLD;
            _local_1 = Language.MAZE_SHOP_PANEL_U[8];
            _local_1 = Language.MAZE_SHOP_PANEL_U[4];
            _local_1 = Language.MAZE_SHOP_PANEL_U[3];
            _local_1 = ResManager.ICON_CURRENCY_GOLD;
            _local_1 = Language.MAZE_SHOP_PANEL_U[8];
            _local_1 = Language.MAZE_SHOP_PANEL_U[4];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Language.MAZE_SHOP_PANEL_U[1];
            _local_1 = Language.MAZE_SHOP_PANEL_U[2];
            _local_1 = ResManager.ICON_CURRENCY_GOLD;
            _local_1 = Language.MAZE_SHOP_PANEL_U[8];
            _local_1 = Language.MAZE_SHOP_PANEL_U[4];
            _local_1 = Language.MAZE_SHOP_PANEL_U[3];
            _local_1 = ResManager.ICON_CURRENCY_GOLD;
            _local_1 = Language.MAZE_SHOP_PANEL_U[8];
            _local_1 = Language.MAZE_SHOP_PANEL_U[4];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Language.MAZE_SHOP_PANEL_U[5];
            _local_1 = Language.MAZE_SHOP_PANEL_U[6];
            _local_1 = Language.MAZE_SHOP_PANEL_U[5];
            _local_1 = Language.MAZE_SHOP_PANEL_U[6];
        }

        public function set cancel1(_arg_1:Button):void
        {
            var _local_2:Object = this._550215927cancel1;
            if (_local_2 !== _arg_1)
            {
                this._550215927cancel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancel1", _local_2, _arg_1));
            };
        }

        public function set cancel2(_arg_1:Button):void
        {
            var _local_2:Object = this._550215928cancel2;
            if (_local_2 !== _arg_1)
            {
                this._550215928cancel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancel2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ItemSlot
        {
            return (this._109532660slot2);
        }

        public function set slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cancel1():Button
        {
            return (this._550215927cancel1);
        }

        [Bindable(event="propertyChange")]
        public function get cancel2():Button
        {
            return (this._550215928cancel2);
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

