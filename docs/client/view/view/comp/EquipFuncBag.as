// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.EquipFuncBag

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Tile;
    import mx.containers.ViewStack;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.events.FlexEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.event.GameDataEvent;
    import com.qeedoo.ui.view.compDragable.NumPanel;
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

    public class EquipFuncBag extends SimpleCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const SHOP_SLOT_NUM:int = 6;
        private const NUM_PER_PAGE:int = 18;
        private var _saltType:String;
        private var _109532659slot1:ItemSlot;
        private var downItemCls:String = null;
        public var _showTab:int = 0;
        private var _109532667slot9:ItemSlot;
        private var _2115046240shopSlot4:ShopSlot;
        private var _899454813slot16:ItemSlot;
        private var _1951567364dslot13:ItemSlot;
        private var _133022078firstTile:Tile;
        private var _1322519536dslot2:ItemSlot;
        private var showItemListDown:Array = null;
        private var _109532664slot6:ItemSlot;
        private var _shopShowList:Array;
        private var _1280534524downItem1:BasicGlowButton;
        private var _2143325187itemTileD:Tile;
        private var _296401653updateDown:BasicGlowButton;
        private var _109532661slot3:ItemSlot;
        private var _2115046242shopSlot2:ShopSlot;
        private var _899454818slot11:ItemSlot;
        private var _1951567362dslot11:ItemSlot;
        private var _1322519533dslot5:ItemSlot;
        private var _2114215424shopTileD:Tile;
        private var _1951567369dslot18:ItemSlot;
        private var _2115046244shopSlot0:ShopSlot;
        private var _899454815slot14:ItemSlot;
        private var upItemType:int = -1;
        public var firstTimeFlag:Boolean = true;
        private var _1322519530dslot8:ItemSlot;
        private var _1647659402pageSelectorD:PageSelector;
        public var eFuncPanel:Object;
        private var _1951567367dslot16:ItemSlot;
        private var _109532665slot7:ItemSlot;
        private var _899454812slot17:ItemSlot;
        private var _saleList:Object = null;
        private var _1322519535dslot3:ItemSlot;
        private var _109532662slot4:ItemSlot;
        private var _1951567365dslot14:ItemSlot;
        private var downItemList:Object = null;
        private var _1322519529dslot9:ItemSlot;
        private var _selectedSlot:ShopSlot;
        private var _1280534523downItem0:BasicGlowButton;
        private var _899454817slot12:ItemSlot;
        private var _1322519532dslot6:ItemSlot;
        private var _2115046241shopSlot3:ShopSlot;
        private var _1951567363dslot12:ItemSlot;
        private var _1554086441tabDown:ViewStack;
        private var _839632818upItem:BasicGlowButton;
        private var _899454814slot15:ItemSlot;
        private var _1322519537dslot1:ItemSlot;
        private var _2115046239shopSlot5:ShopSlot;
        private var _2115046243shopSlot1:ShopSlot;
        private var _109532666slot8:ItemSlot;
        private var _1951567361dslot10:ItemSlot;
        private var _109532663slot5:ItemSlot;
        private var _899454819slot10:ItemSlot;
        private var _1951567368dslot17:ItemSlot;
        private var showItemListUp:Array = null;
        private var _607339634pageSelector:PageSelector;
        private var _1322519534dslot4:ItemSlot;
        private var downItemType:int = -1;
        private var _itemList:Object = null;
        private var _899454811slot18:ItemSlot;
        private var _109532660slot2:ItemSlot;
        public var _EquipFuncBag_Canvas1:Canvas;
        public var _EquipFuncBag_Canvas2:Canvas;
        public var _EquipFuncBag_Canvas3:Canvas;
        private var _isRefreshing:Boolean = false;
        private var _899454816slot13:ItemSlot;
        private var _1951567366dslot15:ItemSlot;
        private var _1322595652updateUp:BasicGlowButton;
        private var _1322519531dslot7:ItemSlot;
        private var upItemCls:String = null;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":240,
                    "height":367,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"upItem",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selected":true,
                                "x":5,
                                "y":4,
                                "styleName":"HorizontalTab",
                                "width":50,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"updateUp",
                        "events":{"click":"__updateUp_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":175,
                                "y":4,
                                "styleName":"HorizontalTab",
                                "width":40,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":21,
                                "width":240,
                                "height":146,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_EquipFuncBag_Canvas1",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "3";
                                        this.bottom = "3";
                                        this.left = "4.5";
                                        this.right = "4.5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"firstTile",
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalGap = 4;
                                                    this.horizontalGap = 3;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "height":125,
                                                        "direction":"horizontal",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "styleName":"TileSlot",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"slot18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"acceptable":false});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "2";
                                                    this.horizontalCenter = "0";
                                                }
                                            })]});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":5,
                                "y":170,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"downItem0",
                                    "events":{"click":"__downItem0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"downItem1",
                                    "events":{"click":"__downItem1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":40
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"updateDown",
                        "events":{"click":"__updateDown_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":175,
                                "y":170,
                                "styleName":"HorizontalTab",
                                "width":40,
                                "height":16
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tabDown",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":187,
                                "width":240,
                                "height":165,
                                "creationPolicy":"all",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_EquipFuncBag_Canvas2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "3";
                                                    this.bottom = "3";
                                                    this.left = "4.5";
                                                    this.right = "4.5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"itemTileD",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 4;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "height":121,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dslot18",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"acceptable":false});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]});
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "events":{"creationComplete":"___EquipFuncBag_SimpleCanvas4_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":240,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_EquipFuncBag_Canvas3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "3";
                                                    this.bottom = "3";
                                                    this.left = "1.5";
                                                    this.right = "1.5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"shopTileD",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 4;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "height":136,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot0",
                                                                        "events":{
                                                                            "click":"__shopSlot0_click",
                                                                            "doubleClick":"__shopSlot0_doubleClick"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":112});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot1",
                                                                        "events":{
                                                                            "click":"__shopSlot1_click",
                                                                            "doubleClick":"__shopSlot1_doubleClick"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":112});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot2",
                                                                        "events":{
                                                                            "click":"__shopSlot2_click",
                                                                            "doubleClick":"__shopSlot2_doubleClick"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":112});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot3",
                                                                        "events":{
                                                                            "click":"__shopSlot3_click",
                                                                            "doubleClick":"__shopSlot3_doubleClick"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":112});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot4",
                                                                        "events":{
                                                                            "click":"__shopSlot4_click",
                                                                            "doubleClick":"__shopSlot4_doubleClick"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":112});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ShopSlot,
                                                                        "id":"shopSlot5",
                                                                        "events":{
                                                                            "click":"__shopSlot5_click",
                                                                            "doubleClick":"__shopSlot5_doubleClick"
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":112});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]});
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelector,
                        "id":"pageSelectorD",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":328
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

        public function EquipFuncBag()
        {
            mx_internal::_document = this;
            this.width = 240;
            this.height = 367;
            this.addEventListener("creationComplete", ___EquipFuncBag_SimpleCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            EquipFuncBag._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get shopTileD():Tile
        {
            return (this._2114215424shopTileD);
        }

        [Bindable(event="propertyChange")]
        public function get dslot10():ItemSlot
        {
            return (this._1951567361dslot10);
        }

        [Bindable(event="propertyChange")]
        public function get downItem0():BasicGlowButton
        {
            return (this._1280534523downItem0);
        }

        [Bindable(event="propertyChange")]
        public function get downItem1():BasicGlowButton
        {
            return (this._1280534524downItem1);
        }

        public function set dslot11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567362dslot11;
            if (_local_2 !== _arg_1)
            {
                this._1951567362dslot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot11", _local_2, _arg_1));
            };
        }

        private function _EquipFuncBag_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.EQUIPTFUNCPANEL_U[180];
            _local_1 = Language.EQUIPTFUNCPANEL_U[187];
            _local_1 = Language.BANKPANEL_S[2];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.EQUIPTFUNCPANEL_U[185];
            _local_1 = Language.EQUIPTFUNCPANEL_U[186];
            _local_1 = Language.EQUIPTFUNCPANEL_U[187];
            _local_1 = Language.BANKPANEL_S[2];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.BANKPANEL_S[2];
        }

        public function set dslot12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567363dslot12;
            if (_local_2 !== _arg_1)
            {
                this._1951567363dslot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot16():ItemSlot
        {
            return (this._1951567367dslot16);
        }

        public function __shopSlot3_click(_arg_1:MouseEvent):void
        {
            shopClickHandler(_arg_1);
        }

        public function set dslot10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567361dslot10;
            if (_local_2 !== _arg_1)
            {
                this._1951567361dslot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot12():ItemSlot
        {
            return (this._1951567363dslot12);
        }

        [Bindable(event="propertyChange")]
        public function get dslot13():ItemSlot
        {
            return (this._1951567364dslot13);
        }

        [Bindable(event="propertyChange")]
        public function get dslot15():ItemSlot
        {
            return (this._1951567366dslot15);
        }

        public function set dslot16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567367dslot16;
            if (_local_2 !== _arg_1)
            {
                this._1951567367dslot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot16", _local_2, _arg_1));
            };
        }

        public function set dslot17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567368dslot17;
            if (_local_2 !== _arg_1)
            {
                this._1951567368dslot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot17", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot11():ItemSlot
        {
            return (this._1951567362dslot11);
        }

        private function addSlotListener():void
        {
            _core.data.addEventListener(GamePredef.EVENT_REFRESH_FUNCSLOTS, refreshEquipBag);
        }

        [Bindable(event="propertyChange")]
        public function get dslot14():ItemSlot
        {
            return (this._1951567365dslot14);
        }

        [Bindable(event="propertyChange")]
        public function get dslot1():ItemSlot
        {
            return (this._1322519537dslot1);
        }

        public function set dslot13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567364dslot13;
            if (_local_2 !== _arg_1)
            {
                this._1951567364dslot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot18():ItemSlot
        {
            return (this._1951567369dslot18);
        }

        public function refreshSlots(_arg_1:Object):void
        {
            var _local_2:int = 1;
            while (_local_2 <= NUM_PER_PAGE)
            {
                if (((this[("slot" + _local_2)].slotData) && (ToolKit.isEqual(this[("slot" + _local_2)].slotData.sid, _arg_1.sid))))
                {
                    this[("slot" + _local_2)].giid = _arg_1.giid;
                    return;
                };
                if (((this[("dslot" + _local_2)].slotData) && (ToolKit.isEqual(this[("dslot" + _local_2)].slotData.sid, _arg_1.sid))))
                {
                    this[("dslot" + _local_2)].giid = _arg_1.giid;
                };
                _local_2++;
            };
        }

        public function set dslot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567366dslot15;
            if (_local_2 !== _arg_1)
            {
                this._1951567366dslot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot15", _local_2, _arg_1));
            };
        }

        public function ___EquipFuncBag_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get dslot2():ItemSlot
        {
            return (this._1322519536dslot2);
        }

        [Bindable(event="propertyChange")]
        public function get dslot17():ItemSlot
        {
            return (this._1951567368dslot17);
        }

        private function clearShopPage():void
        {
            var _local_1:int;
            while (_local_1 < SHOP_SLOT_NUM)
            {
                this[("shopSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        public function set dslot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519537dslot1;
            if (_local_2 !== _arg_1)
            {
                this._1322519537dslot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot1", _local_2, _arg_1));
            };
        }

        public function set dslot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519536dslot2;
            if (_local_2 !== _arg_1)
            {
                this._1322519536dslot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot2", _local_2, _arg_1));
            };
        }

        public function set dslot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519532dslot6;
            if (_local_2 !== _arg_1)
            {
                this._1322519532dslot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot3():ItemSlot
        {
            return (this._1322519535dslot3);
        }

        [Bindable(event="propertyChange")]
        public function get dslot9():ItemSlot
        {
            return (this._1322519529dslot9);
        }

        public function set dslot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519535dslot3;
            if (_local_2 !== _arg_1)
            {
                this._1322519535dslot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot3", _local_2, _arg_1));
            };
        }

        public function set dslot18(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567369dslot18;
            if (_local_2 !== _arg_1)
            {
                this._1951567369dslot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot18", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot5():ItemSlot
        {
            return (this._1322519533dslot5);
        }

        public function __shopSlot2_doubleClick(_arg_1:MouseEvent):void
        {
            shopDClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get dslot8():ItemSlot
        {
            return (this._1322519530dslot8);
        }

        public function set dslot7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519531dslot7;
            if (_local_2 !== _arg_1)
            {
                this._1322519531dslot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot7", _local_2, _arg_1));
            };
        }

        public function set dslot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519530dslot8;
            if (_local_2 !== _arg_1)
            {
                this._1322519530dslot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot8", _local_2, _arg_1));
            };
        }

        public function set dslot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519534dslot4;
            if (_local_2 !== _arg_1)
            {
                this._1322519534dslot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot4", _local_2, _arg_1));
            };
        }

        public function set dslot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519533dslot5;
            if (_local_2 !== _arg_1)
            {
                this._1322519533dslot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot5", _local_2, _arg_1));
            };
        }

        public function set slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get dslot6():ItemSlot
        {
            return (this._1322519532dslot6);
        }

        [Bindable(event="propertyChange")]
        public function get dslot7():ItemSlot
        {
            return (this._1322519531dslot7);
        }

        public function __shopSlot0_click(_arg_1:MouseEvent):void
        {
            shopClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }

        public function set slot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemTileD():Tile
        {
            return (this._2143325187itemTileD);
        }

        [Bindable(event="propertyChange")]
        public function get dslot4():ItemSlot
        {
            return (this._1322519534dslot4);
        }

        private function getAllShopList():void
        {
            var _local_5:String;
            _saleList = {};
            var _local_1:Object = getShopListByName(Language.SYSTEMSHOPPANEL_S[0]);
            var _local_2:Object = getShopListByName(Language.SYSTEMSHOPPANEL_S[2]);
            var _local_3:Object = getShopListByName(Language.SYSTEMSHOPPANEL_S[5]);
            var _local_4:Object = getShopListByName(Language.SYSTEMSHOPPANEL_S[15]);
            for (_local_5 in _local_1)
            {
                if (!_saleList[_local_5])
                {
                    _saleList[_local_5] = _local_1[_local_5];
                };
            };
            for (_local_5 in _local_2)
            {
                if (!_saleList[_local_5])
                {
                    _saleList[_local_5] = _local_2[_local_5];
                };
            };
            for (_local_5 in _local_3)
            {
                if (!_saleList[_local_5])
                {
                    _saleList[_local_5] = _local_3[_local_5];
                };
            };
            for (_local_5 in _local_4)
            {
                if (!_saleList[_local_5])
                {
                    _saleList[_local_5] = _local_4[_local_5];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot9():ItemSlot
        {
            return (this._109532667slot9);
        }

        public function set shopTileD(_arg_1:Tile):void
        {
            var _local_2:Object = this._2114215424shopTileD;
            if (_local_2 !== _arg_1)
            {
                this._2114215424shopTileD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopTileD", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot4():ItemSlot
        {
            return (this._109532662slot4);
        }

        private function getShopListByName(_arg_1:String):Object
        {
            var _local_3:*;
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_SHOP][_arg_1];
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3])
                {
                    return (_core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_local_2[_local_3].id]);
                };
            };
            return (null);
        }

        public function set updateDown(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._296401653updateDown;
            if (_local_2 !== _arg_1)
            {
                this._296401653updateDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "updateDown", _local_2, _arg_1));
            };
        }

        public function __downItem0_click(_arg_1:MouseEvent):void
        {
            tabDownClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():ItemSlot
        {
            return (this._109532661slot3);
        }

        public function set itemTileD(_arg_1:Tile):void
        {
            var _local_2:Object = this._2143325187itemTileD;
            if (_local_2 !== _arg_1)
            {
                this._2143325187itemTileD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemTileD", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot6():ItemSlot
        {
            return (this._109532664slot6);
        }

        public function set dslot14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1951567365dslot14;
            if (_local_2 !== _arg_1)
            {
                this._1951567365dslot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot14", _local_2, _arg_1));
            };
        }

        private function onShopPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("shopSlot" + _local_4)].type = _shopShowList[_local_3].type;
                this[("shopSlot" + _local_4)].slotData = _shopShowList[_local_3].slotData;
                this[("shopSlot" + _local_4)].stackNum = _shopShowList[_local_3].stackNum;
                this[("shopSlot" + _local_4)].giid = _shopShowList[_local_3].giid;
                this[("shopSlot" + _local_4)].visible = true;
                _local_4++;
            };
        }

        public function set dslot9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._1322519529dslot9;
            if (_local_2 !== _arg_1)
            {
                this._1322519529dslot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dslot9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectorD():PageSelector
        {
            return (this._1647659402pageSelectorD);
        }

        public function ___EquipFuncBag_SimpleCanvas4_creationComplete(_arg_1:FlexEvent):void
        {
            getAllShopList();
        }

        [Bindable(event="propertyChange")]
        public function get upItem():BasicGlowButton
        {
            return (this._839632818upItem);
        }

        private function clearPage():void
        {
            var _local_1:int = 1;
            while (_local_1 <= NUM_PER_PAGE)
            {
                this[("slot" + _local_1)].clean();
                _local_1++;
            };
        }

        public function set updateUp(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1322595652updateUp;
            if (_local_2 !== _arg_1)
            {
                this._1322595652updateUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "updateUp", _local_2, _arg_1));
            };
        }

        public function __shopSlot5_click(_arg_1:MouseEvent):void
        {
            shopClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get slot8():ItemSlot
        {
            return (this._109532666slot8);
        }

        private function buy():void
        {
            var bagpanel:Object = _core.view.getUI(ViewManager.PANEL_BAG);
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

        [Bindable(event="propertyChange")]
        public function get shopSlot0():ShopSlot
        {
            return (this._2115046244shopSlot0);
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
        public function get shopSlot3():ShopSlot
        {
            return (this._2115046241shopSlot3);
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
        public function get slot15():ItemSlot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():ItemSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():ItemSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():ItemSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():ItemSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():ItemSlot
        {
            return (this._899454812slot17);
        }

        public function __updateUp_click(_arg_1:MouseEvent):void
        {
            upItemFresh();
        }

        [Bindable(event="propertyChange")]
        public function get slot14():ItemSlot
        {
            return (this._899454815slot14);
        }

        [Bindable(event="propertyChange")]
        public function get slot10():ItemSlot
        {
            return (this._899454819slot10);
        }

        public function __shopSlot3_doubleClick(_arg_1:MouseEvent):void
        {
            shopDClickHandler(_arg_1);
        }

        private function shopClickHandler(_arg_1:Event):void
        {
            clearSelection();
            var _local_2:ShopSlot = ShopSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            _selectedSlot = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get slot18():ItemSlot
        {
            return (this._899454811slot18);
        }

        public function set upItem(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._839632818upItem;
            if (_local_2 !== _arg_1)
            {
                this._839632818upItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upItem", _local_2, _arg_1));
            };
        }

        private function addItemToShopList(_arg_1:Object):void
        {
            var _local_2:Object = new Object();
            _local_2.slotData = _arg_1;
            _local_2.type = _arg_1.type;
            _local_2.giid = _arg_1.itemId;
            _local_2.quality = _arg_1.quality;
            _local_2.st = _arg_1.st;
            if (((_local_2.st == 3) && (!(isSystemShopSlot(_local_2.slotData.sid)))))
            {
                return;
            };
            if (_local_2.st == Number(GamePredef.SHOP_SELL_TYPE_HIDE))
            {
                return;
            };
            _shopShowList.push(_local_2);
        }

        public function __shopSlot2_click(_arg_1:MouseEvent):void
        {
            shopClickHandler(_arg_1);
        }

        public function set slot9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                showItem(_showTab, _itemList);
            };
        }

        public function set pageSelectorD(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1647659402pageSelectorD;
            if (_local_2 !== _arg_1)
            {
                this._1647659402pageSelectorD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectorD", _local_2, _arg_1));
            };
        }

        public function set firstTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._133022078firstTile;
            if (_local_2 !== _arg_1)
            {
                this._133022078firstTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstTile", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get updateDown():BasicGlowButton
        {
            return (this._296401653updateDown);
        }

        private function updateView(_arg_1:int=0, _arg_2:Object=null):void
        {
            switch (_arg_1)
            {
                case 0:
                    upItemType = GamePredef.TBL_EQUIPT_INSTANCE;
                    downItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[180];
                    upItemCls = "equipt";
                    downItemCls = "matrl";
                    _saltType = Language.SYSTEMSHOPPANEL_S[7];
                    break;
                case 1:
                    upItemType = GamePredef.TBL_EQUIPT_INSTANCE;
                    downItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[180];
                    upItemCls = "equipt";
                    downItemCls = "matrl";
                    break;
                case 2:
                    upItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[181];
                    upItemCls = "matrl";
                    downItemType = -1;
                    downItemCls = null;
                    break;
                case 3:
                    upItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[182];
                    upItemCls = "jewel";
                    downItemType = -1;
                    downItemCls = null;
                    break;
                case 4:
                    upItemType = GamePredef.TBL_EQUIPT_INSTANCE;
                    downItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[183];
                    upItemCls = "mw";
                    downItemCls = "mw_m";
                    break;
                case 5:
                    upItemType = GamePredef.TBL_EQUIPT_INSTANCE;
                    downItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[184];
                    upItemCls = "pet";
                    downItemCls = "pet_m";
                    break;
                case 99:
                    upItemType = GamePredef.TBL_EQUIPT_INSTANCE;
                    downItemType = GamePredef.TBL_ITEM_INSTANCE;
                    upItem.label = Language.EQUIPTFUNCPANEL_U[180];
                    upItemCls = "equipt";
                    downItemCls = "matrl";
                    break;
            };
            upItemFresh();
            if (((_arg_1 == 2) || (_arg_1 == 3)))
            {
                tabDownClick(1);
            }
            else
            {
                tabDownClick(0);
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
        }

        private function dClickHandler(_arg_1:Event):void
        {
            trace(" equFunc dClick ");
            var _local_2:ItemSlot = ItemSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
        }

        private function isSystemShopSlot(_arg_1:int):Boolean
        {
            var _local_2:String;
            for (_local_2 in GamePredef.SYSTEM_SHOP_ID)
            {
                if (_arg_1 == GamePredef.SYSTEM_SHOP_ID[_local_2])
                {
                    return (true);
                };
            };
            return (false);
        }

        public function __shopSlot4_doubleClick(_arg_1:MouseEvent):void
        {
            shopDClickHandler(_arg_1);
        }

        public function __updateDown_click(_arg_1:MouseEvent):void
        {
            downFresh();
        }

        private function showSaleItems():void
        {
            var _local_1:Object;
            var _local_2:Object;
            _shopShowList = new Array();
            if (((!(_itemList)) || ((_itemList.type < 0) && (!(_itemList.type == -2)))))
            {
                clearShopPage();
                pageSelectorD.initPageSeletor(0, SHOP_SLOT_NUM);
                return;
            };
            for each (_local_1 in _saleList)
            {
                _local_2 = _core.getTemplateData(_local_1.type, _local_1.itemId, false);
                if (_itemList.type == 1)
                {
                    if (_itemList.idList.indexOf(Number(_local_1.itemId)) >= 0)
                    {
                        addItemToShopList(_local_1);
                    };
                }
                else
                {
                    if (_itemList.type == 2)
                    {
                        if (_itemList.val == Number(_local_2.type))
                        {
                            addItemToShopList(_local_1);
                        };
                    }
                    else
                    {
                        if (_itemList.type == -2)
                        {
                            if (_itemList.idList.indexOf(Number(_local_2.type)) >= 0)
                            {
                                addItemToShopList(_local_1);
                            };
                        };
                    };
                };
            };
            _shopShowList.sortOn("quality", Array.NUMERIC);
            initShopPage();
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

        public function set shopSlot0(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046244shopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._2115046244shopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot0", _local_2, _arg_1));
            };
        }

        private function buySelected(_arg_1:int):void
        {
            _core.remote.buySystemItemClient(_selectedSlot.slotData.id, _arg_1);
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

        public function __shopSlot0_doubleClick(_arg_1:MouseEvent):void
        {
            shopDClickHandler(_arg_1);
        }

        private function onDownPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                this[("dslot" + _local_4)].type = showItemListDown[_local_3].type;
                this[("dslot" + _local_4)].slotData = showItemListDown[_local_3].slotData;
                this[("dslot" + _local_4)].stackNum = showItemListDown[_local_3].stackNum;
                this[("dslot" + _local_4)].giid = showItemListDown[_local_3].giid;
                this[("dslot" + _local_4)].update();
                _local_4++;
            };
        }

        public function set slot12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
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

        public function set slot17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function __shopSlot4_click(_arg_1:MouseEvent):void
        {
            shopClickHandler(_arg_1);
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

        public function reset():void
        {
            firstTimeFlag = true;
        }

        public function set slot14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set slot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
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

        public function set slot13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        public function downItemFresh():void
        {
            showItemListDown = getItemList(downItemType, downItemCls, _itemList);
            pageSelectorD.onPageChanged = onDownPageChanged;
            pageSelectorD.onPageCleared = clearDownPage;
            pageSelectorD.initPageSeletor(showItemListDown.length, NUM_PER_PAGE);
        }

        public function set slot11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        private function addSlotEventListener():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 18)
            {
                this[("slot" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, eFuncPanel.funcBagClickHandler);
                this[("dslot" + _local_1)].addEventListener(Slot.EVENT_SLOT_DCLICK, eFuncPanel.funcBagClickHandler);
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get updateUp():BasicGlowButton
        {
            return (this._1322595652updateUp);
        }

        public function set slot18(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        public function set slot16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function setSlot(_arg_1:Object):void
        {
            _dm.initSlotData(_arg_1);
            updateView(_showTab, _itemList);
        }

        public function upItemFresh():void
        {
            showItemListUp = getItemList(upItemType, upItemCls);
            pageSelector.onPageChanged = onPageChanged;
            pageSelector.onPageCleared = clearPage;
            pageSelector.initPageSeletor(showItemListUp.length, NUM_PER_PAGE);
        }

        public function __shopSlot1_click(_arg_1:MouseEvent):void
        {
            shopClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:EquipFuncBag;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _EquipFuncBag_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_EquipFuncBagWatcherSetupUtil");
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

        public function __downItem1_click(_arg_1:MouseEvent):void
        {
            tabDownClick(1);
        }

        public function set tabDown(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1554086441tabDown;
            if (_local_2 !== _arg_1)
            {
                this._1554086441tabDown = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabDown", _local_2, _arg_1));
            };
        }

        private function downFresh():void
        {
            tabDownClick(tabDown.selectedIndex);
        }

        public function __shopSlot1_doubleClick(_arg_1:MouseEvent):void
        {
            shopDClickHandler(_arg_1);
        }

        public function showItem(_arg_1:int=0, _arg_2:Object=null):void
        {
            _showTab = _arg_1;
            _itemList = _arg_2;
            if (visible)
            {
                _isRefreshing = true;
                updateView(_arg_1, _arg_2);
                _isRefreshing = false;
            };
        }

        public function __shopSlot5_doubleClick(_arg_1:MouseEvent):void
        {
            shopDClickHandler(_arg_1);
        }

        private function _EquipFuncBag_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[180];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upItem.label = _arg_1;
            }, "upItem.label");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[187];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                updateUp.label = _arg_1;
            }, "updateUp.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquipFuncBag_Canvas1.label = _arg_1;
            }, "_EquipFuncBag_Canvas1.label");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                slot18.slotType = _arg_1;
            }, "slot18.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[185];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                downItem0.label = _arg_1;
            }, "downItem0.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[186];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                downItem1.label = _arg_1;
            }, "downItem1.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EQUIPTFUNCPANEL_U[187];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                updateDown.label = _arg_1;
            }, "updateDown.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquipFuncBag_Canvas2.label = _arg_1;
            }, "_EquipFuncBag_Canvas2.label");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot1.slotType = _arg_1;
            }, "dslot1.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot2.slotType = _arg_1;
            }, "dslot2.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot3.slotType = _arg_1;
            }, "dslot3.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot4.slotType = _arg_1;
            }, "dslot4.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot5.slotType = _arg_1;
            }, "dslot5.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot6.slotType = _arg_1;
            }, "dslot6.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot7.slotType = _arg_1;
            }, "dslot7.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot8.slotType = _arg_1;
            }, "dslot8.slotType");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot9.slotType = _arg_1;
            }, "dslot9.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot10.slotType = _arg_1;
            }, "dslot10.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot11.slotType = _arg_1;
            }, "dslot11.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot12.slotType = _arg_1;
            }, "dslot12.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot13.slotType = _arg_1;
            }, "dslot13.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot14.slotType = _arg_1;
            }, "dslot14.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot15.slotType = _arg_1;
            }, "dslot15.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot16.slotType = _arg_1;
            }, "dslot16.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot17.slotType = _arg_1;
            }, "dslot17.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                dslot18.slotType = _arg_1;
            }, "dslot18.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquipFuncBag_Canvas3.label = _arg_1;
            }, "_EquipFuncBag_Canvas3.label");
            result[43] = binding;
            return (result);
        }

        private function clearDownPage():void
        {
            var _local_1:int = 1;
            while (_local_1 <= NUM_PER_PAGE)
            {
                this[("dslot" + _local_1)].clean();
                _local_1++;
            };
        }

        private function clearSelection():void
        {
            var _local_1:int;
            while (_local_1 <= 5)
            {
                this[("shopSlot" + _local_1)].selected = false;
                _local_1++;
            };
        }

        private function refreshEquipBag(_arg_1:GameDataEvent):void
        {
            if (((!(visible)) || (_isRefreshing)))
            {
                return;
            };
            if (((_arg_1.data) && (_arg_1.data.numOnly)))
            {
                refreshStackNum(_arg_1.data.insId, _arg_1.data.stackNum);
            }
            else
            {
                if ((((_arg_1.data) && (_arg_1.data.id)) && (_arg_1.data.itemList)))
                {
                    showItem(_arg_1.data.id, _arg_1.data.itemList);
                }
                else
                {
                    upItemFresh();
                    if (tabDown.selectedIndex == 0)
                    {
                        downItemFresh();
                    };
                };
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int = 1;
            while (_local_4 <= _arg_2)
            {
                _local_3 = ((_local_4 - 1) + _arg_1);
                this[("slot" + _local_4)].type = showItemListUp[_local_3].type;
                this[("slot" + _local_4)].slotData = showItemListUp[_local_3].slotData;
                this[("slot" + _local_4)].stackNum = showItemListUp[_local_3].stackNum;
                this[("slot" + _local_4)].giid = showItemListUp[_local_3].giid;
                this[("slot" + _local_4)].update();
                _local_4++;
            };
        }

        private function getItemList(_arg_1:int=-1, _arg_2:String=null, _arg_3:Object=null):Array
        {
            var _local_5:Array;
            var _local_6:Boolean;
            var _local_7:Object;
            var _local_8:String;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:int;
            var _local_12:Object;
            var _local_13:String;
            var _local_14:Object;
            var _local_4:Array = new Array();
            if (((_dm.bagSlotIndex) && (_dm.bagSlotIndex[_arg_1])))
            {
                _local_5 = null;
                _local_6 = false;
                if (((!(_arg_3)) || (_arg_3.type < 0)))
                {
                    switch (_arg_2)
                    {
                        case "equipt":
                            _local_5 = [GamePredef.ITEM_KIND_MAINHAND, GamePredef.ITEM_KIND_SUBHAND, GamePredef.ITEM_KIND_DEFENCE, GamePredef.ITEM_KIND_JEWELRY];
                            break;
                        case "matrl":
                            _local_5 = [GamePredef.ITEM_TYPE_DIAMOND, GamePredef.ITEM_TYPE_METAL, GamePredef.ITEM_TYPE_WOOD, GamePredef.ITEM_TYPE_JADE, GamePredef.ITEM_TYPE_CLOTH, GamePredef.ITEM_TYPE_FUR];
                            break;
                        case "jewel":
                            _local_5 = [GamePredef.ITEM_TYPE_JEWEL];
                            break;
                        case "mw":
                            _local_5 = [GamePredef.ITEM_KIND_MAGICWEAPON];
                            break;
                        case "mw_m":
                            _local_5 = [GamePredef.ITEM_TYPE_MW_REPAIR, GamePredef.ITEM_TYPE_MW_SKILL_RESET, GamePredef.ITEM_TYPE_MW_TRANS, GamePredef.ITEM_TYPE_MW_STAGE_EIGHT];
                            break;
                        case "pet":
                            _local_5 = [GamePredef.ITEM_KIND_PETEQU];
                            break;
                        case "pet_m":
                            _local_5 = [GamePredef.ITEM_TYPE_PETEQU_LEVELUP, GamePredef.ITEM_TYPE_PETEQU_MODCOLOR, GamePredef.ITEM_TYPE_STAR];
                            break;
                    };
                };
                for (_local_8 in _dm.bagSlotIndex[_arg_1])
                {
                    if (!(((_arg_3) && (_arg_3.type == 1)) && (_arg_3.idList.indexOf(Number(_local_8)) < 0)))
                    {
                        _local_7 = _dm.bagSlotIndex[_arg_1][_local_8];
                        if (_local_7)
                        {
                            _local_9 = _core.getTemplateData((_arg_1 + 1), Number(_local_8), false);
                            if (!(((_arg_3) && (_arg_3.type == 2)) && (!(Number(_local_9.type) == _arg_3.val))))
                            {
                                if ((((_arg_2 == "equipt") || (_arg_2 == "pet")) || (_arg_2 == "mw")))
                                {
                                    _local_11 = _local_9.kind;
                                }
                                else
                                {
                                    _local_11 = _local_9.type;
                                };
                                for (_local_13 in _local_7)
                                {
                                    _local_10 = _dm.sList[_local_7[_local_13]];
                                    if ((((_local_10) && (_core.data.isBagSlot(Number(_local_10.sid)))) && ((!(_local_5)) || (_local_5.indexOf(_local_11) >= 0))))
                                    {
                                        _local_12 = _dm.getGameData(_local_10.type, _local_10.itemId);
                                        if (!((_arg_2 == "pet") && (_local_10.stackNum <= 0)))
                                        {
                                            _local_14 = new Object();
                                            if (_local_12)
                                            {
                                                _local_14.color = _local_12.color;
                                            }
                                            else
                                            {
                                                _local_14.color = 0;
                                            };
                                            _local_14.slotData = _local_10;
                                            _local_14.type = _local_10.type;
                                            _local_14.giid = _local_10.itemId;
                                            _local_14.stackNum = _local_10.stackNum;
                                            _local_4.push(_local_14);
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
                _local_4.sortOn("color", Array.NUMERIC);
            };
            return (_local_4);
        }

        private function shopDClickHandler(_arg_1:Event):void
        {
            var _local_2:ShopSlot = ShopSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _local_2.selected = true;
            buy();
        }

        private function refreshStackNum(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:int = 1;
            while (_local_3 <= NUM_PER_PAGE)
            {
                if (ToolKit.isEqual(this[("slot" + _local_3)].giid, _arg_1))
                {
                    this[("slot" + _local_3)].stackNum = _arg_2;
                    this[("slot" + _local_3)].update();
                    return;
                };
                if (ToolKit.isEqual(this[("dslot" + _local_3)].giid, _arg_1))
                {
                    this[("dslot" + _local_3)].stackNum = _arg_2;
                    this[("dslot" + _local_3)].update();
                };
                _local_3++;
            };
        }

        public function initView():void
        {
            addSlotListener();
            firstTimeFlag = false;
            if (!_dm.sInited)
            {
                _core.remote.call("getInitSlot", new Responder(setSlot));
            }
            else
            {
                updateView(_showTab, _itemList);
            };
            addSlotEventListener();
        }

        private function initShopPage():void
        {
            pageSelectorD.onPageChanged = onShopPageChanged;
            pageSelectorD.onPageCleared = clearShopPage;
            pageSelectorD.initPageSeletor(_shopShowList.length, SHOP_SLOT_NUM);
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

        public function set slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabDown():ViewStack
        {
            return (this._1554086441tabDown);
        }

        public function set slot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        private function tabDownClick(_arg_1:int):void
        {
            tabDown.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= (tabDown.numChildren - 1))
            {
                if (_local_2 == _arg_1)
                {
                    this[("downItem" + _local_2)].selected = true;
                }
                else
                {
                    this[("downItem" + _local_2)].selected = false;
                };
                _local_2++;
            };
            if (_arg_1 == 1)
            {
                showSaleItems();
            }
            else
            {
                downItemFresh();
            };
        }

        public function set slot7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
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
        public function get slot5():ItemSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():ItemSlot
        {
            return (this._109532665slot7);
        }

        public function doBuy(_arg_1:Boolean):void
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
                if (_selectedSlot)
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    _local_3.numStepper.enabled = true;
                    _local_3.parent = DragableCanvas(_core.view.getUI(ViewManager.PANEL_EQUIPTFUNC));
                    _local_3.showSelected(_selectedSlot, null, NumPanel.TYPE_BUY, buySelected);
                    _local_3.closeWith(DragableCanvas(_core.view.getUI(ViewManager.PANEL_EQUIPTFUNC)));
                    return;
                };
            };
        }

        public function set downItem0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1280534523downItem0;
            if (_local_2 !== _arg_1)
            {
                this._1280534523downItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "downItem0", _local_2, _arg_1));
            };
        }

        public function set downItem1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1280534524downItem1;
            if (_local_2 !== _arg_1)
            {
                this._1280534524downItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "downItem1", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

