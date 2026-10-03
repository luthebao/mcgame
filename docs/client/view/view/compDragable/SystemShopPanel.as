// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.SystemShopPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.ShopSlot;
    import com.qeedoo.ui.view.comp.LimitShopSlot;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicMultiLineButton;
    import mx.controls.RadioButton;
    import mx.controls.RadioButtonGroup;
    import flash.utils.Timer;
    import mx.containers.Tile;
    import com.qeedoo.ui.view.comp.LinkTextInput;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Button;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import mx.containers.HBox;
    import mx.containers.VBox;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import com.qeedoo.game.config.Language;
    import mx.controls.Alert;
    import mx.events.FlexEvent;
    import mx.collections.SortField;
    import mx.collections.Sort;
    import com.qeedoo.game.data.GameData;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
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

    public class SystemShopPanel extends DragableCanvas implements IBindingClient 
    {

        private static var isBuyLimit:Boolean;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const ITEM_COUNT_PER_PAGE:int = 20;
        private const LIMIT_ITEM_COUNT_PER_PAGE:int = 6;
        public var _SystemShopPanel_BasicTxtButton3:BasicTxtButton;
        private var _1141924040shopSlot15:ShopSlot;
        public var _SystemShopPanel_BasicTxtButton1:BasicTxtButton;
        private var _2115046236shopSlot8:ShopSlot;
        private var _2115046240shopSlot4:ShopSlot;
        private var _1141924043shopSlot12:ShopSlot;
        private var _543673122limitShopSlot1:LimitShopSlot;
        private var _1247297353tabBtnPoint:BasicGlowButton;
        private var _2115046244shopSlot0:ShopSlot;
        public var _SystemShopPanel_BoxLabel1:BoxLabel;
        public var _SystemShopPanel_BoxLabel2:BoxLabel;
        public var _SystemShopPanel_BoxLabel3:BoxLabel;
        private var _1141924038shopSlot17:ShopSlot;
        private var _87929615tabBtnSearch:BasicMultiLineButton;
        private var _1123890648radioGoldBind:RadioButton;
        private var _1062215115currencyRadioGroup:RadioButtonGroup;
        private var _1118612889tabBtnNew:BasicMultiLineButton;
        private var myTimer:Timer;
        private var _543673124limitShopSlot3:LimitShopSlot;
        private var _387922915globalBuy:BasicGlowButton;
        private var _selectedSlot:ShopSlot;
        private var _1118607430tabBtnHot:BasicMultiLineButton;
        private var _2115046237shopSlot7:ShopSlot;
        private var _2115046241shopSlot3:ShopSlot;
        private var _970616069radioGold:RadioButton;
        private var _452648351tabBtnLimitTime:BasicMultiLineButton;
        private var _1314872641tileHot:Tile;
        private var _1058056547textInput:LinkTextInput;
        private var _296707362tabBtnTrolley:BasicGlowButton;
        private var _543673126limitShopSlot5:LimitShopSlot;
        public var _selectedLimitSlot:LimitShopSlot;
        public var _SystemShopPanel_BasicGlowButton1:BasicGlowButton;
        public var _SystemShopPanel_BasicGlowButton2:BasicGlowButton;
        private var _1141924042shopSlot13:ShopSlot;
        private var _1267322019lb_noItem:RoundedLabel;
        private var _1141924045shopSlot10:ShopSlot;
        private var _1141924037shopSlot18:ShopSlot;
        public var _SystemShopPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _2014444312tabBtnDiscount:BasicMultiLineButton;
        private var _1236300784tabBtnDress:BasicGlowButton;
        private var _543673121limitShopSlot0:LimitShopSlot;
        private var flag0:Boolean = true;
        private var flag1:Boolean = true;
        private var flag2:Boolean = true;
        private var flag3:Boolean = true;
        private var flag4:Boolean = true;
        private var flag5:Boolean = true;
        private var flag6:Boolean = true;
        private var _1118614808tabBtnPet:BasicGlowButton;
        private var flag8:Boolean = true;
        private var flag9:Boolean = true;
        private var flag7:Boolean = true;
        private var _2115046238shopSlot6:ShopSlot;
        private var _2115046242shopSlot2:ShopSlot;
        private var _81207RL1:RoundedLabel;
        private var firstTimeFlag:Boolean = true;
        private var _86586420tabBtnScroll:BasicGlowButton;
        private var _543673123limitShopSlot2:LimitShopSlot;
        private var _1988561714tabBtnMaterial:BasicGlowButton;
        private var _1141924041shopSlot14:ShopSlot;
        private var _81208RL2:RoundedLabel;
        private var _1276882458tileLimitTime:Tile;
        private var _904220074tabBtnTreasure:BasicGlowButton;
        private var _2115046235shopSlot9:ShopSlot;
        private var _1141924044shopSlot11:ShopSlot;
        private var _3178592gold:Button;
        private var _1237987865tabBtnFlyer:BasicGlowButton;
        private var _1141924036shopSlot19:ShopSlot;
        private var _543673125limitShopSlot4:LimitShopSlot;
        private var shopItemList:ArrayCollection = null;
        private var _1141924039shopSlot16:ShopSlot;
        private var _2115046239shopSlot5:ShopSlot;
        private var _2115046243shopSlot1:ShopSlot;
        private var _316913168tabBtnBook:BasicGlowButton;
        private var _607339634pageSelector:PageSelector;
        private var _1241471484tabBtnJewel:BasicGlowButton;
        public var _SystemShopPanel_BasicTxtButton2:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":575,
                    "height":405,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_SystemShopPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_SystemShopPanel_BasicGlowButton1",
                                    "events":{"click":"___SystemShopPanel_BasicGlowButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "199.95";
                                        this.bottom = "42";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "width":60,
                                            "height":26
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_SystemShopPanel_BasicGlowButton2",
                                    "events":{"click":"___SystemShopPanel_BasicGlowButton2_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "42";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":267.95,
                                            "styleName":"CrystalYellowButton",
                                            "width":60,
                                            "height":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"globalBuy",
                                    "events":{"click":"__globalBuy_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "179.04999";
                                        this.bottom = "42";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CrystalYellowButton",
                                            "width":60,
                                            "height":25
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkTextInput,
                                    "id":"textInput",
                                    "events":{"enter":"__textInput_enter"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "35";
                                        this.bottom = "42";
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":26,
                                            "width":156.95
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "30";
                                        this.bottom = "55";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":20,
                                            "width":125,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":20,
                                                        "height":15,
                                                        "styleName":"GoldBinded",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"_SystemShopPanel_BoxLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "22";
                                                    this.verticalCenter = "0";
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":45,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"radioGoldBind",
                                                "events":{"click":"__radioGoldBind_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.right = "35";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "groupName":"currencyRadioGroup",
                                                        "width":14
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_SystemShopPanel_BasicTxtButton1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.right = "0";
                                                    this.verticalCenter = "0";
                                                    this.color = 16776365;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":30,
                                                        "height":19
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "30";
                                        this.bottom = "30";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":20,
                                            "width":125,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"gold",
                                                "events":{"click":"__gold_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":20,
                                                        "height":15,
                                                        "styleName":"GoldLocked"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"_SystemShopPanel_BoxLabel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "22";
                                                    this.verticalCenter = "0";
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":45,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RadioButton,
                                                "id":"radioGold",
                                                "events":{"click":"__radioGold_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                    this.right = "35";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "groupName":"currencyRadioGroup",
                                                        "width":14
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_SystemShopPanel_BasicTxtButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                    this.fontSize = 12;
                                                    this.verticalCenter = "0";
                                                    this.color = 16776365;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":30,
                                                        "height":19
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "30";
                                        this.bottom = "5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":20,
                                            "width":125,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":20,
                                                        "height":15,
                                                        "styleName":"ExchangePoint",
                                                        "enabled":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"_SystemShopPanel_BoxLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "22";
                                                    this.verticalCenter = "0";
                                                    this.textAlign = "left";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":45,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_SystemShopPanel_BasicTxtButton3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "0";
                                                    this.fontSize = 12;
                                                    this.textAlign = "right";
                                                    this.color = 16776365;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":60,
                                                        "height":19
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"mouseDown":"___SystemShopPanel_Canvas5_mouseDown"},
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "60";
                                        this.left = "35";
                                        this.right = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":270,
                                            "styleName":"CanvasBorder",
                                            "width":520,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"lb_noItem",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.verticalCenter = "0";
                                                    this.fontSize = 14;
                                                    this.color = 0xFF0000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"visible":false});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"tileHot",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot0",
                                                            "events":{
                                                                "click":"__shopSlot0_click",
                                                                "doubleClick":"__shopSlot0_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot1",
                                                            "events":{
                                                                "click":"__shopSlot1_click",
                                                                "doubleClick":"__shopSlot1_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot2",
                                                            "events":{
                                                                "click":"__shopSlot2_click",
                                                                "doubleClick":"__shopSlot2_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot3",
                                                            "events":{
                                                                "click":"__shopSlot3_click",
                                                                "doubleClick":"__shopSlot3_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot4",
                                                            "events":{
                                                                "click":"__shopSlot4_click",
                                                                "doubleClick":"__shopSlot4_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot5",
                                                            "events":{
                                                                "click":"__shopSlot5_click",
                                                                "doubleClick":"__shopSlot5_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot6",
                                                            "events":{
                                                                "click":"__shopSlot6_click",
                                                                "doubleClick":"__shopSlot6_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot7",
                                                            "events":{
                                                                "click":"__shopSlot7_click",
                                                                "doubleClick":"__shopSlot7_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot8",
                                                            "events":{
                                                                "click":"__shopSlot8_click",
                                                                "doubleClick":"__shopSlot8_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot9",
                                                            "events":{
                                                                "click":"__shopSlot9_click",
                                                                "doubleClick":"__shopSlot9_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot10",
                                                            "events":{
                                                                "click":"__shopSlot10_click",
                                                                "doubleClick":"__shopSlot10_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot11",
                                                            "events":{
                                                                "click":"__shopSlot11_click",
                                                                "doubleClick":"__shopSlot11_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot12",
                                                            "events":{
                                                                "click":"__shopSlot12_click",
                                                                "doubleClick":"__shopSlot12_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot13",
                                                            "events":{
                                                                "click":"__shopSlot13_click",
                                                                "doubleClick":"__shopSlot13_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot14",
                                                            "events":{
                                                                "click":"__shopSlot14_click",
                                                                "doubleClick":"__shopSlot14_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot15",
                                                            "events":{
                                                                "click":"__shopSlot15_click",
                                                                "doubleClick":"__shopSlot15_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot16",
                                                            "events":{
                                                                "click":"__shopSlot16_click",
                                                                "doubleClick":"__shopSlot16_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot17",
                                                            "events":{
                                                                "click":"__shopSlot17_click",
                                                                "doubleClick":"__shopSlot17_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot18",
                                                            "events":{
                                                                "click":"__shopSlot18_click",
                                                                "doubleClick":"__shopSlot18_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ShopSlot,
                                                            "id":"shopSlot19",
                                                            "events":{
                                                                "click":"__shopSlot19_click",
                                                                "doubleClick":"__shopSlot19_doubleClick"
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Tile,
                                                "id":"tileLimitTime",
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                    this.verticalGap = 5;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":LimitShopSlot,
                                                            "id":"limitShopSlot0",
                                                            "events":{
                                                                "click":"__limitShopSlot0_click",
                                                                "doubleClick":"__limitShopSlot0_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LimitShopSlot,
                                                            "id":"limitShopSlot1",
                                                            "events":{
                                                                "click":"__limitShopSlot1_click",
                                                                "doubleClick":"__limitShopSlot1_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LimitShopSlot,
                                                            "id":"limitShopSlot2",
                                                            "events":{
                                                                "click":"__limitShopSlot2_click",
                                                                "doubleClick":"__limitShopSlot2_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LimitShopSlot,
                                                            "id":"limitShopSlot3",
                                                            "events":{
                                                                "click":"__limitShopSlot3_click",
                                                                "doubleClick":"__limitShopSlot3_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LimitShopSlot,
                                                            "id":"limitShopSlot4",
                                                            "events":{
                                                                "click":"__limitShopSlot4_click",
                                                                "doubleClick":"__limitShopSlot4_doubleClick"
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LimitShopSlot,
                                                            "id":"limitShopSlot5",
                                                            "events":{
                                                                "click":"__limitShopSlot5_click",
                                                                "doubleClick":"__limitShopSlot5_doubleClick"
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelector",
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "6";
                                                    this.horizontalCenter = "0";
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 0;
                                        this.left = "45";
                                        this.top = "40";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HTabWrapper",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnPet",
                                                "events":{"click":"__tabBtnPet_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnBook",
                                                "events":{"click":"__tabBtnBook_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnTreasure",
                                                "events":{"click":"__tabBtnTreasure_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnDress",
                                                "events":{"click":"__tabBtnDress_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnFlyer",
                                                "events":{"click":"__tabBtnFlyer_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnMaterial",
                                                "events":{"click":"__tabBtnMaterial_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnJewel",
                                                "events":{"click":"__tabBtnJewel_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnScroll",
                                                "events":{"click":"__tabBtnScroll_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtnPoint",
                                                "events":{"click":"__tabBtnPoint_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":51,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function ():void
                                    {
                                        this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":15,
                                            "y":70,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicMultiLineButton,
                                                "id":"tabBtnHot",
                                                "events":{"click":"__tabBtnHot_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"VerticalTab",
                                                        "selected":true,
                                                        "height":51
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicMultiLineButton,
                                                "id":"tabBtnDiscount",
                                                "events":{"click":"__tabBtnDiscount_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"VerticalTab",
                                                        "height":51
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicMultiLineButton,
                                                "id":"tabBtnNew",
                                                "events":{"click":"__tabBtnNew_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"VerticalTab",
                                                        "height":51
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicMultiLineButton,
                                                "id":"tabBtnLimitTime",
                                                "events":{"click":"__tabBtnLimitTime_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"VerticalTab",
                                                        "height":51
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicMultiLineButton,
                                                "id":"tabBtnSearch",
                                                "events":{"click":"__tabBtnSearch_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"VerticalTab",
                                                        "height":51
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"RL1",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.horizontalCenter = "0";
                                        this.bottom = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":260,
                                            "x":157.5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"RL2",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.horizontalCenter = "0";
                                        this.bottom = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":260,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnTrolley",
                                    "events":{"click":"__tabBtnTrolley_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":503,
                                            "y":40,
                                            "styleName":"HorizontalTab"
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
        private var dict:Dictionary = new Dictionary();
        private var searchResult:ArrayCollection = new ArrayCollection();
        private var limitShopItem:ArrayCollection = new ArrayCollection();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function SystemShopPanel()
        {
            mx_internal::_document = this;
            this.width = 575;
            this.height = 405;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.creationPolicy = "all";
            _SystemShopPanel_RadioButtonGroup1_i();
            this.addEventListener("creationComplete", ___SystemShopPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            SystemShopPanel._watcherSetupUtil = _arg_1;
        }


        public function __tabBtnFlyer_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_FLYER);
        }

        public function __shopSlot16_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set tabBtnBook(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._316913168tabBtnBook;
            if (_local_2 !== _arg_1)
            {
                this._316913168tabBtnBook = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnBook", _local_2, _arg_1));
            };
        }

        public function __shopSlot17_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
            if (((gold) && (_arg_1)))
            {
                gold.styleName = "GoldLocked";
            }
            else
            {
                if (gold)
                {
                    gold.styleName = "GoldUnlock";
                };
            };
        }

        public function set tabBtnFlyer(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1237987865tabBtnFlyer;
            if (_local_2 !== _arg_1)
            {
                this._1237987865tabBtnFlyer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnFlyer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnScroll():BasicGlowButton
        {
            return (this._86586420tabBtnScroll);
        }

        public function __tabBtnSearch_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_SEARCH);
        }

        public function __shopSlot6_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set tileLimitTime(_arg_1:Tile):void
        {
            var _local_2:Object = this._1276882458tileLimitTime;
            if (_local_2 !== _arg_1)
            {
                this._1276882458tileLimitTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileLimitTime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnHot():BasicMultiLineButton
        {
            return (this._1118607430tabBtnHot);
        }

        public function __shopSlot0_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get gold():Button
        {
            return (this._3178592gold);
        }

        private function callMessageChangable():void
        {
            myTimer = new Timer(5000, 0);
            myTimer.start();
            myTimer.addEventListener(TimerEvent.TIMER, setMessageChangable);
            initDictionary();
            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultGold, 1))
            {
                radioGoldBind.selected = true;
            }
            else
            {
                if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultGold, 2))
                {
                    radioGold.selected = true;
                };
            };
            var _local_1:Boolean = _core.view.getUI(ViewManager.PANEL_BAG).goldLockFlag;
            if (_local_1)
            {
                gold.styleName = "GoldLocked";
            }
            else
            {
                gold.styleName = "GoldUnlock";
            };
        }

        public function set tabBtnScroll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._86586420tabBtnScroll;
            if (_local_2 !== _arg_1)
            {
                this._86586420tabBtnScroll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnScroll", _local_2, _arg_1));
            };
        }

        public function set currencyRadioGroup(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._1062215115currencyRadioGroup;
            if (_local_2 !== _arg_1)
            {
                this._1062215115currencyRadioGroup = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currencyRadioGroup", _local_2, _arg_1));
            };
        }

        private function unSelectAll():void
        {
            tabBtnHot.selected = false;
            tabBtnDiscount.selected = false;
            tabBtnNew.selected = false;
            tabBtnPet.selected = false;
            tabBtnTreasure.selected = false;
            tabBtnMaterial.selected = false;
            tabBtnJewel.selected = false;
            tabBtnScroll.selected = false;
            tabBtnBook.selected = false;
            tabBtnPoint.selected = false;
            tabBtnDress.selected = false;
            tabBtnFlyer.selected = false;
            tabBtnSearch.selected = false;
            isBuyLimit = (tabBtnLimitTime.selected = false);
        }

        public function __tabBtnHot_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_HOT);
        }

        public function setDefaultGold(_arg_1:int):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            switch (_arg_1)
            {
                case 1:
                    if (((!(ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultGold, 1))) && (_local_2)))
                    {
                        _local_2.setDefaultGold(1);
                    };
                    if (((radioGold) && (radioGoldBind)))
                    {
                        radioGold.enabled = true;
                        radioGoldBind.enabled = true;
                        radioGoldBind.selected = true;
                    };
                    return;
                case 2:
                    if (((!(ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultGold, 2))) && (_local_2)))
                    {
                        _local_2.setDefaultGold(2);
                    };
                    if (((radioGold) && (radioGoldBind)))
                    {
                        radioGold.enabled = true;
                        radioGoldBind.enabled = true;
                        radioGold.selected = true;
                    };
                    return;
            };
        }

        public function __radioGoldBind_click(_arg_1:MouseEvent):void
        {
            changeMoneyType(_arg_1);
        }

        private function onGetLimitTimeShop(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:int;
            if (firstTimeFlag)
            {
                if (((_arg_1) && (_arg_1.hasOwnProperty("1"))))
                {
                    unSelectAll();
                    isBuyLimit = (tileLimitTime.visible = true);
                    unSelectedAllLimit();
                    tabBtnLimitTime.selected = true;
                }
                else
                {
                    pageSelector.onPageChanged = onPageChanged;
                    pageSelector.onPageCleared = clearPage;
                    setTab(GamePredef.SHOP_TAB_HOT);
                    firstTimeFlag = false;
                    return;
                };
                firstTimeFlag = false;
            };
            limitShopItem.removeAll();
            for (_local_2 in _arg_1)
            {
                _arg_1[_local_2].type = _arg_1[_local_2].tid;
                limitShopItem.addItem(_arg_1[_local_2]);
            };
            pageSelector.onPageChanged = onLimitPageChanged;
            pageSelector.initPageSeletor(limitShopItem.length, LIMIT_ITEM_COUNT_PER_PAGE);
            _local_3 = ((LIMIT_ITEM_COUNT_PER_PAGE < limitShopItem.length) ? LIMIT_ITEM_COUNT_PER_PAGE : limitShopItem.length);
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                if (limitShopItem[_local_4])
                {
                    this[("limitShopSlot" + _local_4)].slotData = limitShopItem[_local_4];
                    this[("limitShopSlot" + _local_4)]._startTime = parseAndSetTime(Number(limitShopItem[_local_4].startTime));
                    this[("limitShopSlot" + _local_4)]._endTime = parseAndSetTime(Number(limitShopItem[_local_4].endTime));
                    this[("limitShopSlot" + _local_4)].visible = true;
                    this[("limitShopSlot" + _local_4)].st = 3;
                };
                _local_4++;
            };
        }

        public function set tabBtnHot(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1118607430tabBtnHot;
            if (_local_2 !== _arg_1)
            {
                this._1118607430tabBtnHot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnHot", _local_2, _arg_1));
            };
        }

        public function __shopSlot13_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __shopSlot5_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __limitShopSlot3_click(_arg_1:MouseEvent):void
        {
            clickLimitHandler(_arg_1);
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

        public function __tabBtnDress_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_DRESS);
        }

        private function clickHandler(_arg_1:Event):void
        {
            clearSelection();
            var _local_2:ShopSlot = ShopSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            _selectedSlot = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot7():ShopSlot
        {
            return (this._2115046237shopSlot7);
        }

        public function __shopSlot11_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot9():ShopSlot
        {
            return (this._2115046235shopSlot9);
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
        public function get shopSlot1():ShopSlot
        {
            return (this._2115046243shopSlot1);
        }

        private function initTabs(_arg_1:String):int
        {
            switch (_arg_1)
            {
                case GamePredef.SHOP_TAB_HOT:
                    shopItemList = getShopListByType(GamePredef.SHOP_SELL_TYPE_HOT);
                    return (0);
                case GamePredef.SHOP_TAB_DISCOUNT:
                    shopItemList = getShopListByType(GamePredef.SHOP_SELL_TYPE_DISCOUNT);
                    return (1);
                case GamePredef.SHOP_TAB_LIMIT:
                    shopItemList = getShopListByType(GamePredef.SHOP_SELL_TYPE_LIMIT);
                    return (10);
                case GamePredef.SHOP_TAB_NEW:
                    shopItemList = getShopListByType(GamePredef.SHOP_SELL_TYPE_NEW);
                    return (2);
                case GamePredef.SHOP_TAB_PET:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[5]);
                    return (3);
                case GamePredef.SHOP_TAB_TREASURE:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[1]);
                    return (4);
                case GamePredef.SHOP_TAB_MATERIAL:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[2]);
                    return (5);
                case GamePredef.SHOP_TAB_JEWEL:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[0]);
                    return (6);
                case GamePredef.SHOP_TAB_SCROLL:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[3]);
                    return (7);
                case GamePredef.SHOP_TAB_BOOK:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[4]);
                    return (8);
                case GamePredef.SHOP_TAB_POINT:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[15]);
                    return (9);
                case GamePredef.SHOP_TAB_DRESS:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[6]);
                    return (10);
                case GamePredef.SHOP_TAB_FLYER:
                    shopItemList = getShopListByName(Language.SYSTEMSHOPPANEL_S[7]);
                    return (11);
                case GamePredef.SHOP_TAB_SEARCH:
                    shopItemList = searchResult;
                    return (12);
            };
            return (-1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot6():ShopSlot
        {
            return (this._2115046238shopSlot6);
        }

        private function dClickLimitHandler(_arg_1:Event):void
        {
            var _local_2:LimitShopSlot = LimitShopSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _local_2.selected = true;
            _selectedLimitSlot = _local_2;
            buyLimit();
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot0():ShopSlot
        {
            return (this._2115046244shopSlot0);
        }

        private function clickLimitHandler(_arg_1:Event):void
        {
            clearLimitSelection();
            var _local_2:LimitShopSlot = LimitShopSlot(_arg_1.currentTarget);
            _local_2.selected = true;
            _selectedLimitSlot = _local_2;
        }

        public function set tabBtnTreasure(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._904220074tabBtnTreasure;
            if (_local_2 !== _arg_1)
            {
                this._904220074tabBtnTreasure = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnTreasure", _local_2, _arg_1));
            };
        }

        public function set limitTimeItem(_arg_1:Object):void
        {
            reFreshLimitList(_arg_1);
        }

        public function __shopSlot3_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set gold(_arg_1:Button):void
        {
            var _local_2:Object = this._3178592gold;
            if (_local_2 !== _arg_1)
            {
                this._3178592gold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gold", _local_2, _arg_1));
            };
        }

        public function set tabBtnLimitTime(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._452648351tabBtnLimitTime;
            if (_local_2 !== _arg_1)
            {
                this._452648351tabBtnLimitTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnLimitTime", _local_2, _arg_1));
            };
        }

        public function __limitShopSlot5_doubleClick(_arg_1:MouseEvent):void
        {
            dClickLimitHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot8():ShopSlot
        {
            return (this._2115046236shopSlot8);
        }

        public function __gold_click(_arg_1:MouseEvent):void
        {
            clickLock();
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnMaterial():BasicGlowButton
        {
            return (this._1988561714tabBtnMaterial);
        }

        public function buyLimit():void
        {
            var _local_1:Number = Number(_selectedLimitSlot.slotData.gold);
            var _local_2:Number = Number(_selectedLimitSlot.slotData.point);
            var _local_3:String = ((_local_1 > 0) ? Language.SYSTEMSHOPPANEL_U[24].replace("{num}", _local_1) : Language.SYSTEMSHOPPANEL_U[60].replace("{num}", _local_2));
            Alert.show(_local_3, "", (Alert.YES | Alert.NO), null, handler);
        }

        public function __shopSlot16_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnDiscount():BasicMultiLineButton
        {
            return (this._2014444312tabBtnDiscount);
        }

        public function __limitShopSlot2_doubleClick(_arg_1:MouseEvent):void
        {
            dClickLimitHandler(_arg_1);
        }

        public function __tabBtnTrolley_click(_arg_1:MouseEvent):void
        {
            openShopTrolley();
        }

        public function __shopSlot10_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __shopSlot18_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnPet():BasicGlowButton
        {
            return (this._1118614808tabBtnPet);
        }

        public function ___SystemShopPanel_Canvas5_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function _SystemShopPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            currencyRadioGroup = _local_1;
            _local_1.initialized(this, "currencyRadioGroup");
            return (_local_1);
        }

        private function isSystemShopSlot(_arg_1:int):Boolean
        {
            var _local_2:*;
            for (_local_2 in GamePredef.SYSTEM_SHOP_ID)
            {
                if (_arg_1 == GamePredef.SYSTEM_SHOP_ID[_local_2])
                {
                    return (true);
                };
            };
            return (false);
        }

        public function __tabBtnPoint_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_POINT);
        }

        [Bindable(event="propertyChange")]
        public function get RL1():RoundedLabel
        {
            return (this._81207RL1);
        }

        [Bindable(event="propertyChange")]
        public function get RL2():RoundedLabel
        {
            return (this._81208RL2);
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

        public function __shopSlot0_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __shopSlot8_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
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

        public function set textInput(_arg_1:LinkTextInput):void
        {
            var _local_2:Object = this._1058056547textInput;
            if (_local_2 !== _arg_1)
            {
                this._1058056547textInput = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textInput", _local_2, _arg_1));
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

        public function set shopSlot2(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046242shopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._2115046242shopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot2", _local_2, _arg_1));
            };
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

        public function set shopSlot7(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._2115046237shopSlot7;
            if (_local_2 !== _arg_1)
            {
                this._2115046237shopSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot7", _local_2, _arg_1));
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
            clickHandler(_arg_1);
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

        public function ___SystemShopPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            callMessageChangable();
        }

        public function __limitShopSlot2_click(_arg_1:MouseEvent):void
        {
            clickLimitHandler(_arg_1);
        }

        public function __shopSlot10_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function addDataToList(_arg_1:Object):ArrayCollection
        {
            var _local_3:Object;
            var _local_4:SortField;
            var _local_5:Sort;
            var _local_6:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            for each (_local_3 in _arg_1)
            {
                if (_local_3 != null)
                {
                    _local_6 = new Object();
                    _local_6.slotData = _local_3;
                    _local_6.type = _local_3.type;
                    _local_6.giid = _local_3.itemId;
                    _local_6.position = _local_3.position;
                    _local_6.st = _local_3.st;
                    if (!((_local_6.st == 3) && (!(isSystemShopSlot(_local_6.slotData.sid)))))
                    {
                        if (_local_6.st != GamePredef.SHOP_SELL_TYPE_HIDE)
                        {
                            _local_2.addItem(_local_6);
                        };
                    };
                };
            };
            _local_4 = new SortField();
            _local_4.name = "position";
            _local_5 = new Sort();
            _local_5.fields = [_local_4];
            _local_4.numeric = true;
            _local_2.sort = _local_5;
            _local_2.refresh();
            return (_local_2);
        }

        public function __shopSlot15_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function __shopSlot9_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set tileHot(_arg_1:Tile):void
        {
            var _local_2:Object = this._1314872641tileHot;
            if (_local_2 !== _arg_1)
            {
                this._1314872641tileHot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileHot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnNew():BasicMultiLineButton
        {
            return (this._1118612889tabBtnNew);
        }

        public function set tabBtnMaterial(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1988561714tabBtnMaterial;
            if (_local_2 !== _arg_1)
            {
                this._1988561714tabBtnMaterial = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnMaterial", _local_2, _arg_1));
            };
        }

        public function __tabBtnScroll_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_SCROLL);
        }

        public function __shopSlot15_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __tabBtnJewel_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_JEWEL);
        }

        private function search():void
        {
            var _local_3:String;
            var _local_4:SortField;
            var _local_5:Sort;
            var _local_6:Object;
            var _local_1:String = textInput.text;
            if (_local_1 == "")
            {
                return;
            };
            var _local_2:ArrayCollection = new ArrayCollection();
            for (_local_3 in dict)
            {
                if (_local_3.indexOf(_local_1) >= 0)
                {
                    for each (_local_6 in dict[_local_3])
                    {
                        _local_2.addItem(_local_6);
                    };
                };
            };
            _local_4 = new SortField();
            _local_4.name = "position";
            _local_5 = new Sort();
            _local_5.fields = [_local_4];
            _local_4.numeric = true;
            _local_2.sort = _local_5;
            _local_2.refresh();
            searchResult = _local_2;
            setTab(GamePredef.SHOP_TAB_SEARCH);
        }

        public function __shopSlot5_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set tabBtnTrolley(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._296707362tabBtnTrolley;
            if (_local_2 !== _arg_1)
            {
                this._296707362tabBtnTrolley = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnTrolley", _local_2, _arg_1));
            };
        }

        private function clearSelection():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                this[("shopSlot" + _local_1)].selected = false;
                _local_1++;
            };
        }

        private function initDictionary():void
        {
            var _local_3:ArrayCollection;
            var _local_4:int;
            var _local_1:Array = [0, 1, 2, 3, 4, 5, 6, 7, 15];
            var _local_2:int;
            while (_local_2 < _local_1.length)
            {
                _local_3 = getShopListByName(Language.SYSTEMSHOPPANEL_S[_local_1[_local_2]]);
                _local_4 = 0;
                while (_local_4 < _local_3.length)
                {
                    getItemInfo(_local_3[_local_4].type, _local_3[_local_4].giid, _local_3[_local_4]);
                    _local_4++;
                };
                _local_2++;
            };
        }

        private function onPageChanged(_arg_1:int, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_local_4 + _arg_1);
                this[("shopSlot" + _local_4)].type = shopItemList[_local_3].type;
                this[("shopSlot" + _local_4)].slotData = shopItemList[_local_3].slotData;
                this[("shopSlot" + _local_4)].stackNum = shopItemList[_local_3].stackNum;
                this[("shopSlot" + _local_4)].giid = shopItemList[_local_3].giid;
                this[("shopSlot" + _local_4)].st = shopItemList[_local_3].st;
                this[("shopSlot" + _local_4)].visible = true;
                _local_4++;
            };
            if (_selectedSlot)
            {
                _selectedSlot.selected = false;
                _selectedSlot = null;
            };
        }

        public function set tabBtnDiscount(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._2014444312tabBtnDiscount;
            if (_local_2 !== _arg_1)
            {
                this._2014444312tabBtnDiscount = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnDiscount", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get radioGoldBind():RadioButton
        {
            return (this._1123890648radioGoldBind);
        }

        public function set radioGold(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._970616069radioGold;
            if (_local_2 !== _arg_1)
            {
                this._970616069radioGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radioGold", _local_2, _arg_1));
            };
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
                if (((_selectedSlot) && (!(isBuyLimit))))
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    _local_3.numStepper.enabled = true;
                    _local_3.parent = this;
                    _local_3.showSelected(_selectedSlot, null, NumPanel.TYPE_BUY, buySelected);
                    _local_3.closeWith(this);
                    return;
                };
                if (((_selectedLimitSlot) && (isBuyLimit)))
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    if (12 == _selectedLimitSlot.slotData.tid)
                    {
                        _local_3.numStepper.value = 1;
                        _local_3.numStepper.enabled = false;
                    }
                    else
                    {
                        _local_3.numStepper.enabled = true;
                    };
                    _local_3.parent = this;
                    _local_3.showSelected(_selectedLimitSlot, null, NumPanel.TYPE_BUY, buyLimitSelected);
                    _local_3.closeWith(this);
                    return;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnJewel():BasicGlowButton
        {
            return (this._1241471484tabBtnJewel);
        }

        public function __limitShopSlot4_doubleClick(_arg_1:MouseEvent):void
        {
            dClickLimitHandler(_arg_1);
        }

        public function __limitShopSlot1_click(_arg_1:MouseEvent):void
        {
            clickLimitHandler(_arg_1);
        }

        public function __shopSlot3_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnBook():BasicGlowButton
        {
            return (this._316913168tabBtnBook);
        }

        public function setPage(_arg_1:String):void
        {
            setTab(_arg_1);
        }

        public function __shopSlot12_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnFlyer():BasicGlowButton
        {
            return (this._1237987865tabBtnFlyer);
        }

        [Bindable(event="propertyChange")]
        public function get tileLimitTime():Tile
        {
            return (this._1276882458tileLimitTime);
        }

        public function set tabBtnSearch(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._87929615tabBtnSearch;
            if (_local_2 !== _arg_1)
            {
                this._87929615tabBtnSearch = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnSearch", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currencyRadioGroup():RadioButtonGroup
        {
            return (this._1062215115currencyRadioGroup);
        }

        public function __shopSlot2_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set tabBtnPet(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1118614808tabBtnPet;
            if (_local_2 !== _arg_1)
            {
                this._1118614808tabBtnPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnPet", _local_2, _arg_1));
            };
        }

        public function buyStarAddItem():void
        {
            var _local_1:Object = GameData.d[GamePredef.TBL_SHOP_SLOT][4165];
            var _local_2:ShopSlot = new ShopSlot();
            _local_2.giid = _local_1.itemId;
            _local_2.type = _local_1.type;
            _local_2.slotData = _local_1;
            _selectedSlot = _local_2;
            if (isBuyLimit)
            {
                isBuyLimit = false;
                buy();
                isBuyLimit = true;
            }
            else
            {
                buy();
            };
        }

        public function __tabBtnTreasure_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_TREASURE);
        }

        public function set limitShopSlot0(_arg_1:LimitShopSlot):void
        {
            var _local_2:Object = this._543673121limitShopSlot0;
            if (_local_2 !== _arg_1)
            {
                this._543673121limitShopSlot0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitShopSlot0", _local_2, _arg_1));
            };
        }

        public function set limitShopSlot3(_arg_1:LimitShopSlot):void
        {
            var _local_2:Object = this._543673124limitShopSlot3;
            if (_local_2 !== _arg_1)
            {
                this._543673124limitShopSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitShopSlot3", _local_2, _arg_1));
            };
        }

        private function changeMoneyType(_arg_1:Event):void
        {
            switch (_arg_1.currentTarget.id)
            {
                case "radioGoldBind":
                    radioGold.enabled = false;
                    radioGoldBind.enabled = false;
                    _core.remote.call("changeMoneyType", new Responder(onChangeMoneyType), 3);
                    return;
                case "radioGold":
                    radioGold.enabled = false;
                    radioGoldBind.enabled = false;
                    _core.remote.call("changeMoneyType", new Responder(onChangeMoneyType), 4);
                    return;
            };
        }

        private function getShopListByName(_arg_1:String):ArrayCollection
        {
            var _local_3:*;
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_SHOP][_arg_1];
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3])
                {
                    return (addDataToList(_core.data.gameDataIndex[GamePredef.TBL_SHOP_SLOT][_local_2[_local_3].id]));
                };
            };
            return (null);
        }

        public function __shopSlot8_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set limitShopSlot2(_arg_1:LimitShopSlot):void
        {
            var _local_2:Object = this._543673123limitShopSlot2;
            if (_local_2 !== _arg_1)
            {
                this._543673123limitShopSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitShopSlot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnTreasure():BasicGlowButton
        {
            return (this._904220074tabBtnTreasure);
        }

        public function __tabBtnLimitTime_click(_arg_1:MouseEvent):void
        {
            setLimitTimeTab();
        }

        public function set limitShopSlot1(_arg_1:LimitShopSlot):void
        {
            var _local_2:Object = this._543673122limitShopSlot1;
            if (_local_2 !== _arg_1)
            {
                this._543673122limitShopSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitShopSlot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnLimitTime():BasicMultiLineButton
        {
            return (this._452648351tabBtnLimitTime);
        }

        public function set limitShopSlot4(_arg_1:LimitShopSlot):void
        {
            var _local_2:Object = this._543673125limitShopSlot4;
            if (_local_2 !== _arg_1)
            {
                this._543673125limitShopSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitShopSlot4", _local_2, _arg_1));
            };
        }

        public function __globalBuy_click(_arg_1:MouseEvent):void
        {
            buyStyle();
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

        public function __shopSlot14_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function set shopSlot11(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924044shopSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1141924044shopSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot11", _local_2, _arg_1));
            };
        }

        private function onLimitPageChanged(_arg_1:int, _arg_2:*):void
        {
            var _local_3:int;
            unSelectedAllLimit();
            var _local_4:int;
            while (_local_4 < _arg_2)
            {
                _local_3 = (_arg_1 + _local_4);
                if (limitShopItem[_local_3])
                {
                    this[("limitShopSlot" + _local_4)].slotData = limitShopItem[_local_3];
                    this[("limitShopSlot" + _local_4)]._startTime = parseAndSetTime(Number(limitShopItem[_local_3].startTime));
                    this[("limitShopSlot" + _local_4)]._endTime = parseAndSetTime(Number(limitShopItem[_local_3].endTime));
                    this[("limitShopSlot" + _local_4)].visible = true;
                    this[("limitShopSlot" + _local_4)].st = 3;
                };
                _local_4++;
            };
        }

        public function setMessageChangable(_arg_1:TimerEvent):void
        {
            RL1.visible = (!(RL1.visible));
            RL2.visible = (!(RL2.visible));
        }

        public function onChangeMoneyType(_arg_1:Object):void
        {
            if (_arg_1.flag)
            {
                switch (_arg_1.num)
                {
                    case 3:
                        setDefaultGold(1);
                        return;
                    case 4:
                        setDefaultGold(2);
                        return;
                };
            };
        }

        public function set shopSlot13(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924042shopSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1141924042shopSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot13", _local_2, _arg_1));
            };
        }

        public function set RL1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._81207RL1;
            if (_local_2 !== _arg_1)
            {
                this._81207RL1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL1", _local_2, _arg_1));
            };
        }

        public function set RL2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._81208RL2;
            if (_local_2 !== _arg_1)
            {
                this._81208RL2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "RL2", _local_2, _arg_1));
            };
        }

        public function set shopSlot12(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924043shopSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1141924043shopSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot12", _local_2, _arg_1));
            };
        }

        public function set shopSlot16(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924039shopSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1141924039shopSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot16", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function set shopSlot17(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924038shopSlot17;
            if (_local_2 !== _arg_1)
            {
                this._1141924038shopSlot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot17", _local_2, _arg_1));
            };
        }

        public function set shopSlot14(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924041shopSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1141924041shopSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot14", _local_2, _arg_1));
            };
        }

        public function set shopSlot15(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924040shopSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1141924040shopSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot15", _local_2, _arg_1));
            };
        }

        public function __tabBtnBook_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_BOOK);
        }

        private function clearPage():void
        {
            var _local_1:int;
            while (_local_1 < ITEM_COUNT_PER_PAGE)
            {
                this[("shopSlot" + _local_1)].st = -1;
                this[("shopSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        private function doLimitBuy(_arg_1:Boolean):void
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
                if (_selectedLimitSlot)
                {
                    _local_3 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                    _local_3.showSelected(_selectedLimitSlot, null, NumPanel.TYPE_BUY, buyLimitSelected);
                    _local_3.closeWith(this);
                    _local_3.parent = this;
                };
            };
        }

        private function reFreshLimitList(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:int;
            var _local_5:int;
            limitShopItem.removeAll();
            for (_local_2 in _arg_1)
            {
                limitShopItem.addItem(_arg_1[_local_2]);
            };
            _local_3 = ((LIMIT_ITEM_COUNT_PER_PAGE < (limitShopItem.length - (pageSelector.pageNo * LIMIT_ITEM_COUNT_PER_PAGE))) ? LIMIT_ITEM_COUNT_PER_PAGE : (limitShopItem.length - (pageSelector.pageNo * LIMIT_ITEM_COUNT_PER_PAGE)));
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                _local_5 = ((pageSelector.pageNo * LIMIT_ITEM_COUNT_PER_PAGE) + _local_4);
                if (limitShopItem[_local_5] != null)
                {
                    this[("limitShopSlot" + _local_4)].slotData = limitShopItem[_local_5];
                    this[("limitShopSlot" + _local_4)]._startTime = parseAndSetTime(Number(limitShopItem[_local_5].startTime));
                    this[("limitShopSlot" + _local_4)]._endTime = parseAndSetTime(Number(limitShopItem[_local_5].endTime));
                    this[("limitShopSlot" + _local_4)].visible = true;
                    this[("limitShopSlot" + _local_4)].st = 3;
                };
                _local_4++;
            };
        }

        public function set shopSlot19(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924036shopSlot19;
            if (_local_2 !== _arg_1)
            {
                this._1141924036shopSlot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot19", _local_2, _arg_1));
            };
        }

        public function __limitShopSlot1_doubleClick(_arg_1:MouseEvent):void
        {
            dClickLimitHandler(_arg_1);
        }

        public function set limitShopSlot5(_arg_1:LimitShopSlot):void
        {
            var _local_2:Object = this._543673126limitShopSlot5;
            if (_local_2 !== _arg_1)
            {
                this._543673126limitShopSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitShopSlot5", _local_2, _arg_1));
            };
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

        public function set shopSlot18(_arg_1:ShopSlot):void
        {
            var _local_2:Object = this._1141924037shopSlot18;
            if (_local_2 !== _arg_1)
            {
                this._1141924037shopSlot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shopSlot18", _local_2, _arg_1));
            };
        }

        private function buyLimitSelected(_arg_1:int):void
        {
            _core.remote.call("buyLimitTimeItem", null, _selectedLimitSlot.slotData.id, _arg_1);
        }

        public function __shopSlot17_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        private function _SystemShopPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SYSTEMSHOPPANEL_U[14];
            _local_1 = Language.SYSTEMSHOPPANEL_U[48];
            _local_1 = Language.SYSTEMSHOPPANEL_U[12];
            _local_1 = Language.SYSTEMSHOPPANEL_U[13];
            _local_1 = _core.player.goldBind;
            _local_1 = Language.BAGPANEL_S[16];
            _local_1 = Language.BAGPANEL_U[8];
            _local_1 = Language.BAGPANEL_S[18];
            _local_1 = _core.player.gold;
            _local_1 = Language.BAGPANEL_S[17];
            _local_1 = Language.BAGPANEL_U[9];
            _local_1 = _core.player.exPoint;
            _local_1 = Language.SYSTEMSHOPPANEL_U[50];
            _local_1 = Language.SYSTEMSHOPPANEL_U[45];
            _local_1 = Language.SYSTEMSHOPPANEL_U[0];
            _local_1 = Language.SYSTEMSHOPPANEL_U[3];
            _local_1 = Language.SYSTEMSHOPPANEL_U[15];
            _local_1 = Language.SYSTEMSHOPPANEL_U[4];
            _local_1 = Language.SYSTEMSHOPPANEL_U[46];
            _local_1 = Language.SYSTEMSHOPPANEL_U[47];
            _local_1 = Language.SYSTEMSHOPPANEL_U[5];
            _local_1 = Language.SYSTEMSHOPPANEL_U[6];
            _local_1 = Language.SYSTEMSHOPPANEL_U[7];
            _local_1 = Language.SYSTEMSHOPPANEL_U[9];
            _local_1 = Language.SYSTEMSHOPPANEL_U[0];
            _local_1 = Language.SYSTEMSHOPPANEL_U[1];
            _local_1 = Language.SYSTEMSHOPPANEL_U[2];
            _local_1 = Language.SYSTEMSHOPPANEL_U[20];
            _local_1 = Language.SYSTEMSHOPPANEL_U[49];
            _local_1 = Language.SYSTEMSHOPPANEL_S[11];
            _local_1 = Language.SYSTEMSHOPPANEL_S[12];
            _local_1 = Language.SYSTEMSHOPPANEL_S[16];
            _local_1 = Language.SYSTEMSHOPPANEL_S[12];
            _local_1 = Language.SYSTEMSHOPPANEL_U[25];
        }

        public function set tabBtnPoint(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1247297353tabBtnPoint;
            if (_local_2 !== _arg_1)
            {
                this._1247297353tabBtnPoint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnPoint", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get textInput():LinkTextInput
        {
            return (this._1058056547textInput);
        }

        public function __shopSlot19_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __tabBtnMaterial_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_MATERIAL);
        }

        public function set lb_noItem(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1267322019lb_noItem;
            if (_local_2 !== _arg_1)
            {
                this._1267322019lb_noItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_noItem", _local_2, _arg_1));
            };
        }

        public function __shopSlot7_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get tileHot():Tile
        {
            return (this._1314872641tileHot);
        }

        public function __shopSlot2_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __limitShopSlot0_click(_arg_1:MouseEvent):void
        {
            clickLimitHandler(_arg_1);
        }

        private function buyStyle():void
        {
            if (isBuyLimit)
            {
                buyLimit();
            }
            else
            {
                buy();
            };
        }

        private function setLimitTimeTab():void
        {
            unSelectAll();
            isBuyLimit = (tileLimitTime.visible = true);
            tileHot.visible = false;
            unSelectedAllLimit();
            tabBtnLimitTime.selected = true;
            _core.remote.call("getLimitTimeShop", new Responder(onGetLimitTimeShop));
            pageSelector.onPageChanged = onLimitPageChanged;
            pageSelector.initPageSeletor(limitShopItem.length, LIMIT_ITEM_COUNT_PER_PAGE);
            if (limitShopItem.length == 0)
            {
                lb_noItem.visible = true;
            }
            else
            {
                lb_noItem.visible = false;
            };
        }

        private function clickLock():void
        {
            var gfunc:Function;
            var goldLockFlag:Boolean = _core.view.getUI(ViewManager.PANEL_BAG).goldLockFlag;
            if (goldLockFlag)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
            }
            else
            {
                setGoldLock(true);
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnTrolley():BasicGlowButton
        {
            return (this._296707362tabBtnTrolley);
        }

        private function openShopTrolley():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP_TROLLEY);
            _local_1.getAcDetailText();
            if (_local_1.visible == false)
            {
                _local_1.show();
            }
            else
            {
                _local_1.hide();
            };
        }

        public function __textInput_enter(_arg_1:FlexEvent):void
        {
            search();
        }

        private function getShopListByType(_arg_1:String):ArrayCollection
        {
            return (addDataToList(_core.data.gameDataIndex2[GamePredef.TBL_SHOP_SLOT][_arg_1]));
        }

        [Bindable(event="propertyChange")]
        public function get radioGold():RadioButton
        {
            return (this._970616069radioGold);
        }

        public function __shopSlot7_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function unSelectedAllLimit():void
        {
            var _local_1:* = 0;
            while (_local_1 < LIMIT_ITEM_COUNT_PER_PAGE)
            {
                this[("limitShopSlot" + _local_1)].visible = false;
                _local_1++;
            };
        }

        public function __shopSlot14_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
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

        public function __limitShopSlot5_click(_arg_1:MouseEvent):void
        {
            clickLimitHandler(_arg_1);
        }

        public function __shopSlot13_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get limitShopSlot0():LimitShopSlot
        {
            return (this._543673121limitShopSlot0);
        }

        [Bindable(event="propertyChange")]
        public function get limitShopSlot1():LimitShopSlot
        {
            return (this._543673122limitShopSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get limitShopSlot2():LimitShopSlot
        {
            return (this._543673123limitShopSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get limitShopSlot3():LimitShopSlot
        {
            return (this._543673124limitShopSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get limitShopSlot4():LimitShopSlot
        {
            return (this._543673125limitShopSlot4);
        }

        private function dClickHandler(_arg_1:Event):void
        {
            var _local_2:ShopSlot = ShopSlot(_arg_1.currentTarget);
            if (_local_2.giid < 0)
            {
                return;
            };
            _local_2.selected = true;
            buy();
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnSearch():BasicMultiLineButton
        {
            return (this._87929615tabBtnSearch);
        }

        [Bindable(event="propertyChange")]
        public function get limitShopSlot5():LimitShopSlot
        {
            return (this._543673126limitShopSlot5);
        }

        public function set tabBtnNew(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1118612889tabBtnNew;
            if (_local_2 !== _arg_1)
            {
                this._1118612889tabBtnNew = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnNew", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot10():ShopSlot
        {
            return (this._1141924045shopSlot10);
        }

        public function ___SystemShopPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_EXCHANGE);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot12():ShopSlot
        {
            return (this._1141924043shopSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot13():ShopSlot
        {
            return (this._1141924042shopSlot13);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot14():ShopSlot
        {
            return (this._1141924041shopSlot14);
        }

        public function __shopSlot4_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot16():ShopSlot
        {
            return (this._1141924039shopSlot16);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot17():ShopSlot
        {
            return (this._1141924038shopSlot17);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot18():ShopSlot
        {
            return (this._1141924037shopSlot18);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot15():ShopSlot
        {
            return (this._1141924040shopSlot15);
        }

        private function buySelected(_arg_1:int):void
        {
            _core.remote.buySystemItemClient(_selectedSlot.slotData.id, _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get shopSlot19():ShopSlot
        {
            return (this._1141924036shopSlot19);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnPoint():BasicGlowButton
        {
            return (this._1247297353tabBtnPoint);
        }

        private function handler(event:CloseEvent):void
        {
            if (((!(event == null)) && (!(event.detail == Alert.YES))))
            {
                return;
            };
            var point:Number = Number(_selectedLimitSlot.slotData.point);
            if (point > _core.player.exPoint)
            {
                Alert.show(Language.SYSTEMSHOPPANEL_U[61]);
                return;
            };
            if (point > 0)
            {
                doBuy(true);
                return;
            };
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
        public function get shopSlot11():ShopSlot
        {
            return (this._1141924044shopSlot11);
        }

        public function __tabBtnDiscount_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_DISCOUNT);
        }

        [Bindable(event="propertyChange")]
        public function get lb_noItem():RoundedLabel
        {
            return (this._1267322019lb_noItem);
        }

        public function __radioGold_click(_arg_1:MouseEvent):void
        {
            changeMoneyType(_arg_1);
        }

        public function __shopSlot18_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function _SystemShopPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_SystemShopPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BasicGlowButton1.label = _arg_1;
            }, "_SystemShopPanel_BasicGlowButton1.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BasicGlowButton2.label = _arg_1;
            }, "_SystemShopPanel_BasicGlowButton2.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                globalBuy.label = _arg_1;
            }, "globalBuy.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.goldBind;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BoxLabel1.text = _arg_1;
            }, "_SystemShopPanel_BoxLabel1.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                radioGoldBind.toolTip = _arg_1;
            }, "radioGoldBind.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BasicTxtButton1.label = _arg_1;
            }, "_SystemShopPanel_BasicTxtButton1.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gold.toolTip = _arg_1;
            }, "gold.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.gold;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BoxLabel2.text = _arg_1;
            }, "_SystemShopPanel_BoxLabel2.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_S[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                radioGold.toolTip = _arg_1;
            }, "radioGold.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BAGPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BasicTxtButton2.label = _arg_1;
            }, "_SystemShopPanel_BasicTxtButton2.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.exPoint;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BoxLabel3.text = _arg_1;
            }, "_SystemShopPanel_BoxLabel3.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _SystemShopPanel_BasicTxtButton3.label = _arg_1;
            }, "_SystemShopPanel_BasicTxtButton3.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lb_noItem.text = _arg_1;
            }, "lb_noItem.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tileHot.label = _arg_1;
            }, "tileHot.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnPet.label = _arg_1;
            }, "tabBtnPet.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnBook.label = _arg_1;
            }, "tabBtnBook.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnTreasure.label = _arg_1;
            }, "tabBtnTreasure.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnDress.label = _arg_1;
            }, "tabBtnDress.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnFlyer.label = _arg_1;
            }, "tabBtnFlyer.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnMaterial.label = _arg_1;
            }, "tabBtnMaterial.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnJewel.label = _arg_1;
            }, "tabBtnJewel.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnScroll.label = _arg_1;
            }, "tabBtnScroll.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnPoint.label = _arg_1;
            }, "tabBtnPoint.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnHot.label = _arg_1;
            }, "tabBtnHot.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnDiscount.label = _arg_1;
            }, "tabBtnDiscount.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnNew.label = _arg_1;
            }, "tabBtnNew.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnLimitTime.label = _arg_1;
            }, "tabBtnLimitTime.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnSearch.label = _arg_1;
            }, "tabBtnSearch.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL1.text = _arg_1;
            }, "RL1.text");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL1.toolTip = _arg_1;
            }, "RL1.toolTip");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL2.text = _arg_1;
            }, "RL2.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                RL2.toolTip = _arg_1;
            }, "RL2.toolTip");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SYSTEMSHOPPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnTrolley.label = _arg_1;
            }, "tabBtnTrolley.label");
            result[33] = binding;
            return (result);
        }

        public function __tabBtnNew_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_NEW);
        }

        public function __limitShopSlot3_doubleClick(_arg_1:MouseEvent):void
        {
            dClickLimitHandler(_arg_1);
        }

        public function __shopSlot1_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        private function parseAndSetTime(_arg_1:Number):Date
        {
            var _local_2:Date = new Date();
            _local_2.setTime((_arg_1 * 1000));
            return (_local_2);
        }

        public function __shopSlot11_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        override public function initialize():void
        {
            var target:SystemShopPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _SystemShopPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_SystemShopPanelWatcherSetupUtil");
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

        public function __shopSlot19_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set radioGoldBind(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._1123890648radioGoldBind;
            if (_local_2 !== _arg_1)
            {
                this._1123890648radioGoldBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radioGoldBind", _local_2, _arg_1));
            };
        }

        public function __shopSlot1_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        private function clearLimitSelection():void
        {
            var _local_1:int;
            while (_local_1 < LIMIT_ITEM_COUNT_PER_PAGE)
            {
                this[("limitShopSlot" + _local_1)].selected = false;
                _local_1++;
            };
        }

        public function __tabBtnPet_click(_arg_1:MouseEvent):void
        {
            setTab(GamePredef.SHOP_TAB_PET);
        }

        public function __shopSlot9_doubleClick(_arg_1:MouseEvent):void
        {
            dClickHandler(_arg_1);
        }

        public function set globalBuy(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._387922915globalBuy;
            if (_local_2 !== _arg_1)
            {
                this._387922915globalBuy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "globalBuy", _local_2, _arg_1));
            };
        }

        public function __shopSlot6_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        public function __limitShopSlot4_click(_arg_1:MouseEvent):void
        {
            clickLimitHandler(_arg_1);
        }

        private function setTab(alias:String):void
        {
            try
            {
                initTabs(alias);
                pageSelector.onPageChanged = onPageChanged;
                pageSelector.onPageCleared = clearPage;
                pageSelector.initPageSeletor(shopItemList.length, ITEM_COUNT_PER_PAGE);
                if (shopItemList.length == 0)
                {
                    lb_noItem.visible = true;
                }
                else
                {
                    lb_noItem.visible = false;
                };
            }
            catch(e:Error)
            {
                trace("Error in call tab name");
                return;
            };
            unSelectAll();
            tileLimitTime.visible = false;
            tileHot.visible = true;
            this[("tabBtn" + alias)].selected = true;
        }

        override public function initView():void
        {
            if (!initialized)
            {
                _core.player.normalView.pause();
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            callLater(_core.player.normalView.resume);
            tileHot.visible = false;
            _core.remote.call("getLimitTimeShop", new Responder(onGetLimitTimeShop));
        }

        private function getItemInfo(_arg_1:int, _arg_2:int, _arg_3:Object):void
        {
            if (((_arg_2 <= 0) || (_arg_1 <= 0)))
            {
                return;
            };
            var _local_4:Object = _core.getTemplateData(_arg_1, _arg_2);
            if (_local_4 != null)
            {
                if (dict[_local_4.name] == null)
                {
                    dict[_local_4.name] = new ArrayCollection();
                };
                ArrayCollection(dict[_local_4.name]).addItem(_arg_3);
            };
        }

        public function __shopSlot12_click(_arg_1:MouseEvent):void
        {
            clickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get globalBuy():BasicGlowButton
        {
            return (this._387922915globalBuy);
        }

        public function set tabBtnDress(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1236300784tabBtnDress;
            if (_local_2 !== _arg_1)
            {
                this._1236300784tabBtnDress = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnDress", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnDress():BasicGlowButton
        {
            return (this._1236300784tabBtnDress);
        }

        public function ___SystemShopPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            search();
        }

        public function set tabBtnJewel(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1241471484tabBtnJewel;
            if (_local_2 !== _arg_1)
            {
                this._1241471484tabBtnJewel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnJewel", _local_2, _arg_1));
            };
        }

        public function __limitShopSlot0_doubleClick(_arg_1:MouseEvent):void
        {
            dClickLimitHandler(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

