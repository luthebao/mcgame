// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AuctionPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.ButtonTree;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.TextInput;
    import mx.effects.Glow;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.ItemSlotAuction;
    import mx.collections.ArrayCollection;
    import mx.controls.RadioButton;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.PageableDataGrid;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererLabel;
    import mx.binding.BindingManager;
    import mx.events.ListEvent;
    import flash.events.MouseEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.view.comp.RendererItemSlot;
    import mx.controls.Alert;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.ui.view.comp.RendererCurrencyMax;
    import flash.events.Event;
    import com.qeedoo.ui.view.comp.RendererCurrency;
    import mx.events.NumericStepperEvent;
    import mx.events.FlexEvent;
    import mx.events.DragEvent;
    import mx.core.DragSource;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import flash.utils.setTimeout;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.events.CloseEvent;
    import flash.events.TimerEvent;
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

    public class AuctionPanel extends DragableCanvas implements IBindingClient 
    {

        private static var TIMESPAN:Number = 5000;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _AuctionPanel_Canvas1:Canvas;
        public var _AuctionPanel_Canvas4:Canvas;
        private var _289018751auctionTree:ButtonTree;
        private var myAuctionList:Object;
        private var response:Boolean = true;
        private var currentTreeIndex:int = 0;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _1656583354levelHigh:TextInput;
        private var _565654093searchCanva:Canvas;
        private var _207684226glowEffect:Glow;
        private var _114581tab:ViewStack;
        private var _905190219moneyMaxCurrency:Currency;
        public var _AuctionPanel_DataGridColumn2:DataGridColumn;
        public var _AuctionPanel_DataGridColumn3:DataGridColumn;
        public var _AuctionPanel_DataGridColumn4:DataGridColumn;
        public var _AuctionPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _AuctionPanel_DataGridColumn6:DataGridColumn;
        public var _AuctionPanel_DataGridColumn7:DataGridColumn;
        public var _AuctionPanel_DataGridColumn8:DataGridColumn;
        private var _pageSize:uint = 30;
        public var _AuctionPanel_DataGridColumn5:DataGridColumn;
        public var _AuctionPanel_BasicTxtButton1:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton2:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton3:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton4:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton5:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton6:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton8:BasicTxtButton;
        private var _289027152auctionTime:NumericStepper;
        public var _AuctionPanel_BasicTxtButton7:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton9:BasicTxtButton;
        private var _858962330pageCtrl:PageSelector;
        private var _1177331774itemName:TextInput;
        private var _286697229costMoney:Currency;
        private var _289344522auctionItem:ItemSlotAuction;
        public var _AuctionPanel_BasicGlowButton1:BasicGlowButton;
        public var _AuctionPanel_BasicGlowButton2:BasicGlowButton;
        public var _AuctionPanel_BasicGlowButton4:BasicGlowButton;
        public var _AuctionPanel_BasicGlowButton5:BasicGlowButton;
        public var _AuctionPanel_BasicGlowButton6:BasicGlowButton;
        public var _AuctionPanel_BasicGlowButton7:BasicGlowButton;
        private var resultAC:ArrayCollection;
        private var _2131644112levelLow:TextInput;
        private var _947882863goldCurrency:Currency;
        private var _109408723moneyRadioButton:RadioButton;
        public var _AuctionPanel_DataGridColumn11:DataGridColumn;
        public var _AuctionPanel_DataGridColumn14:DataGridColumn;
        public var _AuctionPanel_DataGridColumn15:DataGridColumn;
        public var _AuctionPanel_DataGridColumn16:DataGridColumn;
        public var _AuctionPanel_DataGridColumn10:DataGridColumn;
        public var _AuctionPanel_DataGridColumn12:DataGridColumn;
        public var _AuctionPanel_DataGridColumn13:DataGridColumn;
        private var _603490777myAuctionDataGrid:DataGrid;
        private var _2039330033moneyCurrency:Currency;
        public var _AuctionPanel_BasicTxtButton10:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton11:BasicTxtButton;
        public var _AuctionPanel_BasicTxtButton12:BasicTxtButton;
        private var myAuctionAC:ArrayCollection;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _599930547resultDataGrid:PageableDataGrid;
        private var _365389062searchButton:BasicGlowButton;
        private var _1177533677itemType:BoxLabel;
        private var _1242201835goldMaxCurrency:Currency;
        private var npcId:int = -1;
        private var _currentPage:uint = 0;
        private var _446420339goldRadioButton:RadioButton;
        private var _1116570670bidCurrency:Currency;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":445,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AuctionPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tab",
                        "events":{"mouseDown":"__tab_mouseDown"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "creationPolicy":"all",
                                "y":60,
                                "percentWidth":100,
                                "percentHeight":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_AuctionPanel_Canvas1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"searchCanva",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":370,
                                                        "styleName":"CanvasBorder",
                                                        "y":0,
                                                        "width":670,
                                                        "x":15,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ButtonTree,
                                                            "id":"auctionTree",
                                                            "events":{
                                                                "change":"__auctionTree_change",
                                                                "itemClick":"__auctionTree_itemClick"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":143,
                                                                    "x":5,
                                                                    "height":235,
                                                                    "y":4
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":155,
                                                                    "y":10,
                                                                    "height":315,
                                                                    "width":507,
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":PageableDataGrid,
                                                                        "id":"resultDataGrid",
                                                                        "events":{"change":"__resultDataGrid_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.verticalAlign = "middle";
                                                                            this.alternatingItemColors = [0xFFFFFF, 0xFFFFFF];
                                                                            this.useRollOver = false;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "columns":[_AuctionPanel_DataGridColumn1_c(), _AuctionPanel_DataGridColumn2_i(), _AuctionPanel_DataGridColumn3_i(), _AuctionPanel_DataGridColumn4_i(), _AuctionPanel_DataGridColumn5_i(), _AuctionPanel_DataGridColumn6_i(), _AuctionPanel_DataGridColumn7_i(), _AuctionPanel_DataGridColumn8_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Currency,
                                                            "id":"bidCurrency",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "13";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "inputEnabled":true,
                                                                    "x":417,
                                                                    "width":87.95
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_AuctionPanel_BasicGlowButton1",
                                                            "events":{"click":"___AuctionPanel_BasicGlowButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "13";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0x0202,
                                                                    "styleName":"LastPage",
                                                                    "width":69
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_AuctionPanel_BasicGlowButton2",
                                                            "events":{"click":"___AuctionPanel_BasicGlowButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "13";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"LastPage",
                                                                    "width":69
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"itemType",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":247,
                                                                    "width":90,
                                                                    "x":63
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"itemName",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.cornerRadius = 0;
                                                                this.color = 0xFFFFFF;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":274,
                                                                    "width":90,
                                                                    "x":63,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"levelLow",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.cornerRadius = 0;
                                                                this.color = 0xFFFFFF;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":63,
                                                                    "y":301,
                                                                    "width":29,
                                                                    "restrict":"0-9",
                                                                    "maxChars":3,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":TextInput,
                                                            "id":"levelHigh",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.cornerRadius = 0;
                                                                this.color = 0xFFFFFF;
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":301,
                                                                    "width":30,
                                                                    "restrict":"0-9",
                                                                    "maxChars":3,
                                                                    "height":20,
                                                                    "x":115
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"searchButton",
                                                            "events":{"click":"__searchButton_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "13";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "styleName":"LastPage",
                                                                    "width":69
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":250,
                                                                    "height":18,
                                                                    "width":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":276,
                                                                    "height":18,
                                                                    "width":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":301,
                                                                    "height":18,
                                                                    "width":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":PageSelector,
                                                            "id":"pageCtrl",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "13";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "onPageChanged":pageRefresh,
                                                                    "x":253
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_AuctionPanel_Canvas4",
                                    "events":{"creationComplete":"___AuctionPanel_Canvas4_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":670,
                                                        "height":370,
                                                        "styleName":"CanvasBorder",
                                                        "x":15,
                                                        "y":0,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlotAuction,
                                                            "id":"auctionItem",
                                                            "events":{"doubleClick":"__auctionItem_doubleClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":63.699997,
                                                                    "y":14.95,
                                                                    "movable":false,
                                                                    "doubleClickEnabled":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RadioButton,
                                                            "id":"moneyRadioButton",
                                                            "events":{"click":"__moneyRadioButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "groupName":"selectRadioButton",
                                                                    "y":58,
                                                                    "selected":true,
                                                                    "width":68,
                                                                    "label":"　　　",
                                                                    "x":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Currency,
                                                            "id":"moneyCurrency",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.disabledOverlayAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "minValue":1,
                                                                    "value":1,
                                                                    "inputEnabled":true,
                                                                    "y":80,
                                                                    "width":83,
                                                                    "x":66,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Currency,
                                                            "id":"moneyMaxCurrency",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.disabledOverlayAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "inputEnabled":true,
                                                                    "y":102,
                                                                    "height":20,
                                                                    "width":83,
                                                                    "x":66
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RadioButton,
                                                            "id":"goldRadioButton",
                                                            "events":{"click":"__goldRadioButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "groupName":"selectRadioButton",
                                                                    "y":135,
                                                                    "width":68,
                                                                    "label":"　　　",
                                                                    "x":65
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Currency,
                                                            "id":"goldCurrency",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.disabledOverlayAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":157,
                                                                    "minValue":1,
                                                                    "value":0,
                                                                    "inputEnabled":true,
                                                                    "enabled":false,
                                                                    "height":20,
                                                                    "width":83,
                                                                    "x":66
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Currency,
                                                            "id":"goldMaxCurrency",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.disabledOverlayAlpha = 0;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":178,
                                                                    "inputEnabled":true,
                                                                    "enabled":false,
                                                                    "height":20,
                                                                    "width":83,
                                                                    "x":66
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":NumericStepper,
                                                            "id":"auctionTime",
                                                            "events":{"change":"__auctionTime_change"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":68,
                                                                    "y":219,
                                                                    "stepSize":1,
                                                                    "value":24,
                                                                    "maximum":48,
                                                                    "width":40,
                                                                    "height":21
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Currency,
                                                            "id":"costMoney",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":244,
                                                                    "height":20,
                                                                    "width":76,
                                                                    "x":68
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_AuctionPanel_BasicGlowButton4",
                                                            "events":{"click":"___AuctionPanel_BasicGlowButton4_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdOrg",
                                                                    "width":61.7,
                                                                    "x":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_AuctionPanel_BasicGlowButton5",
                                                            "events":{"click":"___AuctionPanel_BasicGlowButton5_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":79.7,
                                                                    "styleName":"BtnStdGreen",
                                                                    "width":61.7
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":155,
                                                                    "y":10,
                                                                    "height":315,
                                                                    "width":507,
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"myAuctionDataGrid",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.verticalAlign = "middle";
                                                                            this.alternatingItemColors = [0xFFFFFF, 0xFFFFFF];
                                                                            this.useRollOver = false;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "height":299,
                                                                                "width":491,
                                                                                "x":8,
                                                                                "y":8,
                                                                                "columns":[_AuctionPanel_DataGridColumn9_c(), _AuctionPanel_DataGridColumn10_i(), _AuctionPanel_DataGridColumn11_i(), _AuctionPanel_DataGridColumn12_i(), _AuctionPanel_DataGridColumn13_i(), _AuctionPanel_DataGridColumn14_i(), _AuctionPanel_DataGridColumn15_i(), _AuctionPanel_DataGridColumn16_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_AuctionPanel_BasicGlowButton6",
                                                            "events":{"click":"___AuctionPanel_BasicGlowButton6_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdBlue",
                                                                    "width":77.8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":83,
                                                                    "y":58,
                                                                    "height":18,
                                                                    "width":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":82,
                                                                    "height":18,
                                                                    "width":53
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":104,
                                                                    "height":18,
                                                                    "width":53
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":83,
                                                                    "y":135,
                                                                    "height":18,
                                                                    "width":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":157,
                                                                    "height":18,
                                                                    "width":53
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":179,
                                                                    "height":18,
                                                                    "width":53
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":221,
                                                                    "height":18,
                                                                    "width":54
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":244,
                                                                    "height":18,
                                                                    "width":54
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_AuctionPanel_BasicTxtButton12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.paddingLeft = 0;
                                                                this.paddingRight = 0;
                                                                this.paddingTop = 2;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":113,
                                                                    "y":221,
                                                                    "height":18,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_AuctionPanel_BasicGlowButton7",
                                                            "events":{"click":"___AuctionPanel_BasicGlowButton7_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "45";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdOrg",
                                                                    "width":61.7,
                                                                    "x":10
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "enabled":true,
                                "selected":true,
                                "width":60
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":85,
                                "y":40,
                                "styleName":"HorizontalTab",
                                "width":60,
                                "height":21
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var lastSearch:Number = new Date().getTime();
        private var dataBuffer:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AuctionPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 445;
            this.styleName = "StandardContent";
            _AuctionPanel_Glow1_i();
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AuctionPanel._watcherSetupUtil = _arg_1;
        }


        private function colorSortFunc(_arg_1:Object, _arg_2:Object):int
        {
            if (((_arg_1) && (_arg_2)))
            {
                if (_arg_1.color < _arg_2.color)
                {
                    return (-1);
                };
                if (_arg_1.color > _arg_2.color)
                {
                    return (1);
                };
                if (_arg_1.color == _arg_2.color)
                {
                    if (_arg_1.name < _arg_2.name)
                    {
                        return (-1);
                    };
                    if (_arg_1.name > _arg_2.name)
                    {
                        return (1);
                    };
                    return (0);
                };
            };
            return (0);
        }

        private function _AuctionPanel_ClassFactory6_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererLabel;
            return (_local_1);
        }

        private function _AuctionPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn10 = _local_1;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory6_c();
            _local_1.width = 80;
            _local_1.sortCompareFunction = colorSortFunc;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn10", _AuctionPanel_DataGridColumn10);
            return (_local_1);
        }

        public function __auctionTree_itemClick(_arg_1:ListEvent):void
        {
            treeClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get auctionItem():ItemSlotAuction
        {
            return (this._289344522auctionItem);
        }

        public function ___AuctionPanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            clearAuctionView();
        }

        [Bindable(event="propertyChange")]
        public function get myAuctionDataGrid():DataGrid
        {
            return (this._603490777myAuctionDataGrid);
        }

        private function _AuctionPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AuctionPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_Canvas1.label = _arg_1;
            }, "_AuctionPanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():PageSelector
            {
                return (pageCtrl);
            }, function (_arg_1:PageSelector):void
            {
                resultDataGrid.pageSelector = _arg_1;
            }, "resultDataGrid.pageSelector");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn2.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn2.headerText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn3.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn3.headerText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn4.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn4.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn5.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn5.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn6.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn6.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn7.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn7.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn8.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn8.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicGlowButton1.label = _arg_1;
            }, "_AuctionPanel_BasicGlowButton1.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicGlowButton2.label = _arg_1;
            }, "_AuctionPanel_BasicGlowButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                searchButton.label = _arg_1;
            }, "searchButton.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton1.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton1.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton2.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton2.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton3.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton3.label");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (_pageSize);
            }, function (_arg_1:int):void
            {
                pageCtrl.pageSize = _arg_1;
            }, "pageCtrl.pageSize");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_Canvas4.label = _arg_1;
            }, "_AuctionPanel_Canvas4.label");
            result[17] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                moneyCurrency.type = _arg_1;
            }, "moneyCurrency.type");
            result[18] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEY);
            }, function (_arg_1:uint):void
            {
                moneyMaxCurrency.type = _arg_1;
            }, "moneyMaxCurrency.type");
            result[19] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                goldCurrency.type = _arg_1;
            }, "goldCurrency.type");
            result[20] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_GOLD);
            }, function (_arg_1:uint):void
            {
                goldMaxCurrency.type = _arg_1;
            }, "goldMaxCurrency.type");
            result[21] = binding;
            binding = new Binding(this, function ():uint
            {
                return (Currency.TYPE_MONEYALL);
            }, function (_arg_1:uint):void
            {
                costMoney.type = _arg_1;
            }, "costMoney.type");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicGlowButton4.label = _arg_1;
            }, "_AuctionPanel_BasicGlowButton4.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicGlowButton5.label = _arg_1;
            }, "_AuctionPanel_BasicGlowButton5.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn10.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn10.headerText");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn11.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn11.headerText");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn12.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn12.headerText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn13.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn13.headerText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn14.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn14.headerText");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn15.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn15.headerText");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_S[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_DataGridColumn16.headerText = _arg_1;
            }, "_AuctionPanel_DataGridColumn16.headerText");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicGlowButton6.label = _arg_1;
            }, "_AuctionPanel_BasicGlowButton6.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton4.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton4.label");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton5.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton5.label");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton6.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton6.label");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton7.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton7.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton8.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton8.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton9.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton9.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton10.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton10.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton11.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton11.label");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicTxtButton12.label = _arg_1;
            }, "_AuctionPanel_BasicTxtButton12.label");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AuctionPanel_BasicGlowButton7.label = _arg_1;
            }, "_AuctionPanel_BasicGlowButton7.label");
            result[42] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (Number(_core.player.pmLevel) >= 3);
            }, function (_arg_1:Boolean):void
            {
                _AuctionPanel_BasicGlowButton7.visible = _arg_1;
            }, "_AuctionPanel_BasicGlowButton7.visible");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.AUCTIONPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[45] = binding;
            return (result);
        }

        public function set goldMaxCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._1242201835goldMaxCurrency;
            if (_local_2 !== _arg_1)
            {
                this._1242201835goldMaxCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldMaxCurrency", _local_2, _arg_1));
            };
        }

        public function onAuctionSearch(_arg_1:Object):void
        {
            var _local_6:*;
            var _local_7:*;
            var _local_8:*;
            var _local_9:Object;
            var _local_10:*;
            _core.view.hide(ViewManager.POPU_WAIT);
            var _local_2:* = ((_arg_1) && (_arg_1.arg));
            var _local_3:* = ((_arg_1) && (_arg_1.version));
            var _local_4:* = ((_arg_1) && (_arg_1.list));
            this.response = true;
            auctionTree.enabled = true;
            searchButton.enabled = true;
            if (_arg_1 == null)
            {
                _core.sysMidNote(Language.AUCTIONPANEL_S[2]);
                return;
            };
            var _local_5:Boolean;
            if (Number(_local_2.type) > 0)
            {
                _local_5 = (((dataBuffer[_local_2.kind]) && (dataBuffer[_local_2.kind][_local_2.type])) && (_local_3 <= dataBuffer[_local_2.kind][_local_2.type].version));
                if (_local_5)
                {
                    _local_4 = dataBuffer[_local_2.kind][_local_2.type].data;
                }
                else
                {
                    dataBuffer[_local_2.kind][_local_2.type] = {
                        "version":_local_3,
                        "data":_local_4
                    };
                };
            }
            else
            {
                _local_5 = ((dataBuffer[_local_2.kind]) && (_local_3 <= dataBuffer[_local_2.kind].version));
                if (_local_5)
                {
                    _local_4 = dataBuffer[_local_2.kind].data;
                }
                else
                {
                    dataBuffer[_local_2.kind] = {
                        "version":_local_3,
                        "data":_local_4
                    };
                    _local_9 = GamePredef.ITEM_KIND_TYPE[_local_2.kind];
                    for (_local_7 in _local_9)
                    {
                        dataBuffer[_local_2.kind][_local_7] = {
                            "version":_local_3,
                            "data":_local_4
                        };
                    };
                };
            };
            _local_6 = {};
            for (_local_7 in _local_4)
            {
                _local_10 = _local_4[_local_7];
                if (!((Number(_local_2.type) > 0) && (!(Number(_local_2.type) == _local_10.itemType))))
                {
                    if (!(((_local_2.name) && (!(_local_2.name == ""))) && (_local_10.name.indexOf(_local_2.name) < 0)))
                    {
                        if (!(((!(Number(_local_10.itemKind) == GamePredef.ITEM_KIND_PET)) && (_local_2.levelLow > 0)) && (_local_10.reqLevel < _local_2.levelLow)))
                        {
                            if (!(((!(Number(_local_10.itemKind) == GamePredef.ITEM_KIND_PET)) && (_local_2.levelHigh > 0)) && (_local_10.reqLevel > _local_2.levelHigh)))
                            {
                                _local_6[_local_7] = _local_10;
                            };
                        };
                    };
                };
            };
            resultAC = new ArrayCollection();
            for each (_local_8 in _local_6)
            {
                if (_local_8)
                {
                    _local_8.auctionType = Number(_local_8.auctionType);
                    _local_8.nowMoney = Number(_local_8.nowMoney);
                    _local_8.nowGold = Number(_local_8.nowGold);
                    _local_8.maxMoney = Number(_local_8.maxMoney);
                    _local_8.maxGold = Number(_local_8.maxGold);
                    _local_8.itemKind = Number(_local_8.itemKind);
                    _local_8.itemType = Number(_local_8.itemType);
                    resultAC.addItem(_local_8);
                };
            };
            resultDataGrid.dataAll = resultAC;
            resultDataGrid.pageSelector = pageCtrl;
            pageCtrl.initPageSeletor(resultAC.length, _pageSize);
        }

        [Bindable(event="propertyChange")]
        public function get moneyRadioButton():RadioButton
        {
            return (this._109408723moneyRadioButton);
        }

        [Bindable(event="propertyChange")]
        public function get bidCurrency():Currency
        {
            return (this._1116570670bidCurrency);
        }

        private function selectResult():void
        {
            if (resultDataGrid.selectedItem.auctionType == 1)
            {
                bidCurrency.type = Currency.TYPE_MONEY;
                bidCurrency.value = (resultDataGrid.selectedItem.nowMoney - -(GamePredef.AUCTION_BIDADD[0]));
            }
            else
            {
                if (resultDataGrid.selectedItem.auctionType == 2)
                {
                    bidCurrency.type = Currency.TYPE_GOLD;
                    bidCurrency.value = (resultDataGrid.selectedItem.nowGold - -(GamePredef.AUCTION_BIDADD[1]));
                };
            };
        }

        private function _AuctionPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "wn";
            _local_1.showDataTips = false;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn6", _AuctionPanel_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get itemName():TextInput
        {
            return (this._1177331774itemName);
        }

        private function initPmAuc():void
        {
            var _local_3:*;
            var _local_1:Array = GameData.d[GamePredef.TBL_PM_RIGHT];
            var _local_2:Object;
            if (((_core.player.pmLevel) && (Number(_core.player.pmLevel) >= 3)))
            {
                _local_3 = _core.view.getUI(ViewManager.PANEL_PM_AUCTION);
                if (_local_3)
                {
                    _local_3.initPmAucPanel();
                };
            };
        }

        public function ___AuctionPanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            auctionBidMax();
        }

        public function set myAuctionDataGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._603490777myAuctionDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._603490777myAuctionDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myAuctionDataGrid", _local_2, _arg_1));
            };
        }

        private function selectType():void
        {
            if (moneyRadioButton.selected)
            {
                moneyCurrency.enabled = true;
                moneyMaxCurrency.enabled = true;
                goldCurrency.enabled = false;
                goldMaxCurrency.enabled = false;
                moneyCurrency.value = 1;
                moneyMaxCurrency.value = 0;
                goldCurrency.value = 0;
                goldMaxCurrency.value = 0;
            }
            else
            {
                if (goldRadioButton.selected)
                {
                    moneyCurrency.enabled = false;
                    moneyMaxCurrency.enabled = false;
                    goldCurrency.enabled = true;
                    goldMaxCurrency.enabled = true;
                    moneyCurrency.value = 0;
                    moneyMaxCurrency.value = 0;
                    goldCurrency.value = 1;
                    goldMaxCurrency.value = 0;
                };
            };
        }

        private function _AuctionPanel_ClassFactory5_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        public function set moneyRadioButton(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._109408723moneyRadioButton;
            if (_local_2 !== _arg_1)
            {
                this._109408723moneyRadioButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyRadioButton", _local_2, _arg_1));
            };
        }

        public function set levelLow(_arg_1:TextInput):void
        {
            var _local_2:Object = this._2131644112levelLow;
            if (_local_2 !== _arg_1)
            {
                this._2131644112levelLow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLow", _local_2, _arg_1));
            };
        }

        public function set bidCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._1116570670bidCurrency;
            if (_local_2 !== _arg_1)
            {
                this._1116570670bidCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bidCurrency", _local_2, _arg_1));
            };
        }

        private function addAuction():void
        {
            var _local_1:Object = {};
            if (((auctionItem.type == -1) || (auctionItem.giid == -1)))
            {
                Alert.show(Language.AUCTIONPANEL_S[3], "", Alert.OK);
                return;
            };
            if ((((moneyRadioButton.selected) && (goldRadioButton.selected)) || ((!(moneyRadioButton.selected)) && (!(goldRadioButton.selected)))))
            {
                Alert.show((((Language.AUCTIONPANEL_S[4] + GamePredef.CURRENCY_TIP[0]) + Language.AUCTIONPANEL_S[5]) + GamePredef.CURRENCY_TIP[1]), "", Alert.OK);
                return;
            };
            if (((((((moneyCurrency.value == 0) && (moneyMaxCurrency.value == 0)) && (goldCurrency.value == 0)) && (goldMaxCurrency.value == 0)) || ((((moneyCurrency.value < 0) || (moneyMaxCurrency.value < 0)) || (goldCurrency.value < 0)) || (goldMaxCurrency.value < 0))) || (((!(moneyCurrency.value == 0)) || (!(moneyMaxCurrency.value == 0))) && ((!(goldCurrency.value == 0)) || (!(goldMaxCurrency.value == 0))))))
            {
                Alert.show(Language.AUCTIONPANEL_S[6], "", Alert.OK);
                return;
            };
            if ((((moneyCurrency.value > moneyMaxCurrency.value) && (!(moneyMaxCurrency.value == 0))) || ((goldCurrency.value > goldMaxCurrency.value) && (!(goldMaxCurrency.value == 0)))))
            {
                Alert.show(Language.AUCTIONPANEL_S[37], "", Alert.OK);
                return;
            };
            if (((auctionTime.value < GamePredef.AUCTION_TIME[0]) || (auctionTime.value > GamePredef.AUCTION_TIME[1])))
            {
                Alert.show(Language.AUCTIONPANEL_S[7], "", Alert.OK);
                return;
            };
            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 1))
            {
                if (costMoney.value > _core.player.moneyBind)
                {
                    Alert.show(((Language.AUCTIONPANEL_S[8] + GamePredef.CURRENCY_TIP[2]) + "!"), "", Alert.OK);
                    return;
                };
            };
            if (ToolKit.isEqual(GamePredef.GLOBAL_SETTING.defaultMoney, 2))
            {
                if (costMoney.value > _core.player.money)
                {
                    Alert.show(((Language.AUCTIONPANEL_S[9] + GamePredef.CURRENCY_TIP[0]) + "!"), "", Alert.OK);
                    return;
                };
            };
            if (moneyRadioButton.selected)
            {
                _local_1.auctionType = 1;
            }
            else
            {
                if (goldRadioButton.selected)
                {
                    _local_1.auctionType = 2;
                };
            };
            if (auctionItem.type == GamePredef.TBL_PET)
            {
                _local_1.slotId = -1;
                _local_1.petId = auctionItem.giid;
                _local_1.stackNum = 1;
            }
            else
            {
                if (auctionItem.slotData)
                {
                    _local_1.slotId = auctionItem.slotData.id;
                    _local_1.petId = -1;
                    _local_1.stackNum = auctionItem.stackNum;
                }
                else
                {
                    return;
                };
            };
            _local_1.type = auctionItem.type;
            _local_1.itemId = auctionItem.giid;
            _local_1.nowMoney = moneyCurrency.value;
            _local_1.maxMoney = moneyMaxCurrency.value;
            _local_1.nowGold = goldCurrency.value;
            _local_1.maxGold = goldMaxCurrency.value;
            _local_1.duration = auctionTime.value;
            _core.remote.addAuction(_local_1);
            clearAuctionView();
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0, 1);
        }

        private function _AuctionPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn5 = _local_1;
            _local_1.sortCompareFunction = priceMaxSortFunc;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory4_c();
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn5", _AuctionPanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get auctionTree():ButtonTree
        {
            return (this._289018751auctionTree);
        }

        private function _AuctionPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererCurrencyMax;
            return (_local_1);
        }

        public function set itemName(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1177331774itemName;
            if (_local_2 !== _arg_1)
            {
                this._1177331774itemName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemName", _local_2, _arg_1));
            };
        }

        public function set levelHigh(_arg_1:TextInput):void
        {
            var _local_2:Object = this._1656583354levelHigh;
            if (_local_2 !== _arg_1)
            {
                this._1656583354levelHigh = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelHigh", _local_2, _arg_1));
            };
        }

        private function _AuctionPanel_DataGridColumn16_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn16 = _local_1;
            _local_1.width = 35;
            _local_1.dataField = "lastTime";
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn16", _AuctionPanel_DataGridColumn16);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get goldCurrency():Currency
        {
            return (this._947882863goldCurrency);
        }

        private function createMyAuctionList():void
        {
            var _local_1:*;
            myAuctionAC = new ArrayCollection();
            for each (_local_1 in myAuctionList)
            {
                if (_local_1)
                {
                    _local_1.auctionType = Number(_local_1.auctionType);
                    _local_1.nowMoney = Number(_local_1.nowMoney);
                    _local_1.nowGold = Number(_local_1.nowGold);
                    _local_1.maxMoney = Number(_local_1.maxMoney);
                    _local_1.maxGold = Number(_local_1.maxGold);
                    _local_1.itemKind = Number(_local_1.itemKind);
                    _local_1.itemType = Number(_local_1.itemType);
                    myAuctionAC.addItem(_local_1);
                };
            };
            myAuctionDataGrid.dataProvider = myAuctionAC;
        }

        public function set resultDataGrid(_arg_1:PageableDataGrid):void
        {
            var _local_2:Object = this._599930547resultDataGrid;
            if (_local_2 !== _arg_1)
            {
                this._599930547resultDataGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resultDataGrid", _local_2, _arg_1));
            };
        }

        private function treeClick(_arg_1:Event):void
        {
            var _local_2:*;
            if (!auctionTree.enabled)
            {
                return;
            };
            if (auctionTree.selectedItem.children)
            {
                if (auctionTree.selectedIndex == currentTreeIndex)
                {
                    auctionTree.expandItem(auctionTree.selectedItem, (!(auctionTree.isItemOpen(auctionTree.selectedItem))));
                }
                else
                {
                    for each (_local_2 in auctionTree.openItems)
                    {
                        auctionTree.expandItem(_local_2, false);
                    };
                    auctionTree.expandItem(auctionTree.selectedItem, (!(auctionTree.isItemOpen(auctionTree.selectedItem))));
                };
                currentTreeIndex = auctionTree.selectedIndex;
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldRadioButton():RadioButton
        {
            return (this._446420339goldRadioButton);
        }

        public function ___AuctionPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            initPmAuc();
        }

        [Bindable(event="propertyChange")]
        public function get moneyMaxCurrency():Currency
        {
            return (this._905190219moneyMaxCurrency);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        private function _AuctionPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn4 = _local_1;
            _local_1.sortCompareFunction = priceSortFunc;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn4", _AuctionPanel_DataGridColumn4);
            return (_local_1);
        }

        private function createTree():void
        {
            var _local_4:*;
            var _local_5:ArrayCollection;
            var _local_6:int;
            var _local_7:int;
            var _local_9:*;
            var _local_1:Object = GamePredef.ITEM_KIND_TYPE;
            var _local_2:ArrayCollection = new ArrayCollection();
            var _local_3:Object = {};
            for (_local_4 in _local_1)
            {
                _local_3[_local_4] = new ArrayCollection();
                for (_local_9 in _local_1[_local_4])
                {
                    _local_3[_local_4].addItem({
                        "label":GamePredef.ITEM_TYPE_NAME[_local_9],
                        "kind":_local_4,
                        "type":_local_9
                    });
                };
                _local_2.addItem({
                    "label":GamePredef.ITEM_KIND_NAME[_local_4],
                    "kind":_local_4,
                    "children":_local_3[_local_4]
                });
            };
            _local_5 = new ArrayCollection();
            _local_6 = 4;
            _local_7 = _local_6;
            while (_local_7 < _local_2.length)
            {
                _local_5.addItem(_local_2.getItemAt(_local_7));
                _local_7++;
            };
            var _local_8:int;
            while (_local_8 < 4)
            {
                _local_5.addItem(_local_2.getItemAt(_local_8));
                _local_8++;
            };
            auctionTree.dataProvider = _local_5;
            auctionTime.minimum = GamePredef.AUCTION_TIME[0];
            auctionTime.maximum = GamePredef.AUCTION_TIME[1];
            moneyCurrency.addEventListener(Event.CHANGE, setCostMoney);
            moneyMaxCurrency.addEventListener(Event.CHANGE, setCostMoney);
            goldCurrency.addEventListener(Event.CHANGE, setCostMoney);
            goldMaxCurrency.addEventListener(Event.CHANGE, setCostMoney);
            tab.selectedIndex = 0;
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        private function _AuctionPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererCurrency;
            return (_local_1);
        }

        private function setCostMoney(_arg_1:Event=null):void
        {
            costMoney.value = Math.round(((((((moneyCurrency.value + moneyMaxCurrency.value) / 2) * GamePredef.AUCTION_COSTPERCENT[0]) / 100) + ((((goldCurrency.value + goldMaxCurrency.value) / 2) * GamePredef.AUCTION_COSTPERCENT[1]) / 100)) + (auctionTime.value * GamePredef.AUCTION_TIMENUM)));
        }

        public function ___AuctionPanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            addAuction();
        }

        private function checkSearch():Boolean
        {
            var _local_1:Number = new Date().getTime();
            var _local_2:Number = (_local_1 - this.lastSearch);
            if (_local_2 >= AuctionPanel.TIMESPAN)
            {
                this.lastSearch = _local_1;
                this.response = true;
                return (true);
            };
            return (false);
        }

        private function _AuctionPanel_DataGridColumn15_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn15 = _local_1;
            _local_1.dataField = "pn";
            _local_1.showDataTips = true;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn15", _AuctionPanel_DataGridColumn15);
            return (_local_1);
        }

        public function __moneyRadioButton_click(_arg_1:MouseEvent):void
        {
            selectType();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:*;
            super.visible = _arg_1;
            if (_arg_1 == false)
            {
                clearAuctionView();
                _local_2 = _core.view.getUI(ViewManager.PANEL_PM_AUCTION);
                if (((_local_2) && (_local_2.visible)))
                {
                    return;
                };
                _core.remote.closeAuction();
            }
            else
            {
                searchCanva.enabled = true;
            };
        }

        public function __tab_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        [Bindable(event="propertyChange")]
        public function get itemType():BoxLabel
        {
            return (this._1177533677itemType);
        }

        private function treeChange(_arg_1:Event):void
        {
            if (auctionTree.selectedItem.type != undefined)
            {
                itemType.text = ((GamePredef.ITEM_KIND_NAME[auctionTree.selectedItem.kind] + "-") + GamePredef.ITEM_TYPE_NAME[auctionTree.selectedItem.type]);
            }
            else
            {
                itemType.text = GamePredef.ITEM_KIND_NAME[auctionTree.selectedItem.kind];
            };
            if (!glowEffect.isPlaying)
            {
                glowEffect.play([searchButton]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get moneyCurrency():Currency
        {
            return (this._2039330033moneyCurrency);
        }

        public function onDelAuction(_arg_1:Number):void
        {
            var _local_2:*;
            if (myAuctionList)
            {
                delete myAuctionList[_arg_1];
                for each (_local_2 in myAuctionAC)
                {
                    if (_local_2.id == _arg_1)
                    {
                        myAuctionAC.removeItemAt(myAuctionAC.getItemIndex(_local_2));
                    };
                };
            };
        }

        private function _AuctionPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "stackNum";
            _local_1.width = 35;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn3", _AuctionPanel_DataGridColumn3);
            return (_local_1);
        }

        public function onAuctionBid(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1.flag)
            {
                _core.sysMidNote(_arg_1.info);
                if (visible)
                {
                    for each (_local_2 in resultAC)
                    {
                        if (_local_2.id == _arg_1.auctionData.id)
                        {
                            resultAC.setItemAt(_arg_1.auctionData, resultAC.getItemIndex(_local_2));
                        };
                    };
                };
            }
            else
            {
                _core.sysMidNote(_arg_1.info);
            };
        }

        [Bindable(event="propertyChange")]
        public function get costMoney():Currency
        {
            return (this._286697229costMoney);
        }

        private function clearAuctionView():void
        {
            var _local_1:*;
            if (!auctionItem)
            {
                return;
            };
            if (auctionItem.slotData)
            {
                _core.view.getUI(ViewManager.PANEL_BAG).updateView();
            };
            auctionItem.clean();
            moneyRadioButton.selected = true;
            moneyCurrency.enabled = true;
            moneyMaxCurrency.enabled = true;
            goldCurrency.enabled = false;
            goldMaxCurrency.enabled = false;
            moneyCurrency.value = 1;
            moneyMaxCurrency.value = 0;
            goldCurrency.value = 0;
            goldMaxCurrency.value = 0;
            costMoney.value = 0;
            bidCurrency.type = Currency.TYPE_MONEY;
            bidCurrency.value = 0;
            resultDataGrid.dataProvider = new ArrayCollection();
            resultDataGrid.dataAll = new ArrayCollection();
            resultAC = new ArrayCollection();
            pageCtrl.initPageSeletor(resultAC.length, _pageSize);
            auctionTree.selectedItem = null;
            auctionTree.enabled = true;
            for each (_local_1 in auctionTree.openItems)
            {
                auctionTree.expandItem(_local_1, false);
            };
            itemType.text = "";
            itemName.text = "";
            levelLow.text = "";
            levelHigh.text = "";
            searchButton.enabled = true;
            glowEffect.end();
            searchButton.filters = [];
        }

        [Bindable(event="propertyChange")]
        public function get searchButton():BasicGlowButton
        {
            return (this._365389062searchButton);
        }

        public function __resultDataGrid_change(_arg_1:ListEvent):void
        {
            selectResult();
        }

        private function _AuctionPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererLabel;
            return (_local_1);
        }

        public function __auctionTime_change(_arg_1:NumericStepperEvent):void
        {
            setCostMoney();
        }

        public function set auctionTree(_arg_1:ButtonTree):void
        {
            var _local_2:Object = this._289018751auctionTree;
            if (_local_2 !== _arg_1)
            {
                this._289018751auctionTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "auctionTree", _local_2, _arg_1));
            };
        }

        public function set glowEffect(_arg_1:Glow):void
        {
            var _local_2:Object = this._207684226glowEffect;
            if (_local_2 !== _arg_1)
            {
                this._207684226glowEffect = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowEffect", _local_2, _arg_1));
            };
        }

        public function __auctionTree_change(_arg_1:ListEvent):void
        {
            treeChange(_arg_1);
        }

        private function _AuctionPanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn14 = _local_1;
            _local_1.dataField = "wn";
            _local_1.showDataTips = false;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn14", _AuctionPanel_DataGridColumn14);
            return (_local_1);
        }

        public function ___AuctionPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            auctionBid();
        }

        [Bindable(event="propertyChange")]
        public function get goldMaxCurrency():Currency
        {
            return (this._1242201835goldMaxCurrency);
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function ___AuctionPanel_Canvas4_creationComplete(_arg_1:FlexEvent):void
        {
            createTree();
        }

        [Bindable(event="propertyChange")]
        public function get levelLow():TextInput
        {
            return (this._2131644112levelLow);
        }

        public function set goldCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._947882863goldCurrency;
            if (_local_2 !== _arg_1)
            {
                this._947882863goldCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldCurrency", _local_2, _arg_1));
            };
        }

        public function set goldRadioButton(_arg_1:RadioButton):void
        {
            var _local_2:Object = this._446420339goldRadioButton;
            if (_local_2 !== _arg_1)
            {
                this._446420339goldRadioButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldRadioButton", _local_2, _arg_1));
            };
        }

        public function set pageCtrl(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._858962330pageCtrl;
            if (_local_2 !== _arg_1)
            {
                this._858962330pageCtrl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageCtrl", _local_2, _arg_1));
            };
        }

        private function _AuctionPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn2 = _local_1;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory2_c();
            _local_1.width = 80;
            _local_1.sortCompareFunction = colorSortFunc;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn2", _AuctionPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        private function _AuctionPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        private function _AuctionPanel_Glow1_i():Glow
        {
            var _local_1:Glow = new Glow();
            glowEffect = _local_1;
            _local_1.repeatCount = 10000;
            _local_1.alphaFrom = 1;
            _local_1.alphaTo = 1;
            _local_1.blurXFrom = 0;
            _local_1.blurXTo = 10;
            _local_1.blurYFrom = 0;
            _local_1.blurYTo = 10;
            _local_1.color = 16135947;
            return (_local_1);
        }

        private function tabBtnClick(_arg_1:int, _arg_2:int):void
        {
            tab.selectedIndex = _arg_1;
            this[("tabBtn" + _arg_1)].selected = true;
            this[("tabBtn" + _arg_2)].selected = false;
        }

        [Bindable(event="propertyChange")]
        public function get levelHigh():TextInput
        {
            return (this._1656583354levelHigh);
        }

        private function _AuctionPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn13 = _local_1;
            _local_1.sortCompareFunction = priceMaxSortFunc;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory8_c();
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn13", _AuctionPanel_DataGridColumn13);
            return (_local_1);
        }

        public function addItem(_arg_1:ItemSlot):void
        {
            var _local_2:DragEvent = new DragEvent(DragEvent.DRAG_DROP);
            var _local_3:DragSource = new DragSource();
            _local_3.addData(_arg_1, "slot");
            _local_2.dragSource = _local_3;
            auctionItem.dispatchEvent(_local_2);
        }

        [Bindable(event="propertyChange")]
        public function get resultDataGrid():PageableDataGrid
        {
            return (this._599930547resultDataGrid);
        }

        public function onInitViewAuctionP(_arg_1:Object):void
        {
            if (_arg_1.flag)
            {
                visible = true;
                npcId = _arg_1.npcId;
                myAuctionList = _arg_1.myAuctionList;
                setTimeout(createMyAuctionList, 1000);
            }
            else
            {
                _core.sysMidNote(_arg_1.info);
            };
        }

        public function pageRefresh(_arg_1:int, _arg_2:int):void
        {
            if (resultAC)
            {
                resultDataGrid.dataProvider = ToolKit.getPageCollection(resultAC, _arg_1, _arg_2);
            };
        }

        public function set searchCanva(_arg_1:Canvas):void
        {
            var _local_2:Object = this._565654093searchCanva;
            if (_local_2 !== _arg_1)
            {
                this._565654093searchCanva = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchCanva", _local_2, _arg_1));
            };
        }

        public function set auctionTime(_arg_1:NumericStepper):void
        {
            var _local_2:Object = this._289027152auctionTime;
            if (_local_2 !== _arg_1)
            {
                this._289027152auctionTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "auctionTime", _local_2, _arg_1));
            };
        }

        private function checkResponse():Boolean
        {
            return (this.response);
        }

        public function set moneyMaxCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._905190219moneyMaxCurrency;
            if (_local_2 !== _arg_1)
            {
                this._905190219moneyMaxCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyMaxCurrency", _local_2, _arg_1));
            };
        }

        private function auctionBidMax():void
        {
            if (resultDataGrid.selectedItem)
            {
                if (resultDataGrid.selectedItem.auctionType == 1)
                {
                    if (resultDataGrid.selectedItem.maxMoney <= 0)
                    {
                        Alert.show(Language.AUCTIONPANEL_S[14], "", Alert.OK);
                        return;
                    };
                    if (resultDataGrid.selectedItem.maxMoney > _core.player.money)
                    {
                        Alert.show(((Language.AUCTIONPANEL_S[15] + GamePredef.CURRENCY_TIP[0]) + "!"), "", Alert.OK);
                        return;
                    };
                }
                else
                {
                    if (resultDataGrid.selectedItem.auctionType == 2)
                    {
                        if (resultDataGrid.selectedItem.maxGold <= 0)
                        {
                            Alert.show(Language.AUCTIONPANEL_S[16], "", Alert.OK);
                            return;
                        };
                        if (resultDataGrid.selectedItem.maxGold > _core.player.gold)
                        {
                            Alert.show(((Language.AUCTIONPANEL_S[17] + GamePredef.CURRENCY_TIP[1]) + "!"), "", Alert.OK);
                            return;
                        };
                    }
                    else
                    {
                        return;
                    };
                };
                _core.remote.call("auctionBidMax", new Responder(onAuctionBidMax), resultDataGrid.selectedItem.id);
            };
        }

        private function _AuctionPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.width = 26;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory1_c();
            return (_local_1);
        }

        public function ___AuctionPanel_BasicGlowButton6_click(_arg_1:MouseEvent):void
        {
            Alert.show(Language.AUCTIONPANEL_S[34], "", 3, this, delAuction);
        }

        public function __goldRadioButton_click(_arg_1:MouseEvent):void
        {
            selectType();
        }

        private function _AuctionPanel_DataGridColumn9_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "";
            _local_1.width = 26;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory5_c();
            return (_local_1);
        }

        private function _AuctionPanel_ClassFactory8_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererCurrencyMax;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get glowEffect():Glow
        {
            return (this._207684226glowEffect);
        }

        public function __auctionItem_doubleClick(_arg_1:MouseEvent):void
        {
            clearAuctionView();
        }

        override public function initialize():void
        {
            var target:AuctionPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AuctionPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AuctionPanelWatcherSetupUtil");
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
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        [Bindable(event="propertyChange")]
        public function get pageCtrl():PageSelector
        {
            return (this._858962330pageCtrl);
        }

        private function _AuctionPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn12 = _local_1;
            _local_1.sortCompareFunction = priceSortFunc;
            _local_1.itemRenderer = _AuctionPanel_ClassFactory7_c();
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn12", _AuctionPanel_DataGridColumn12);
            return (_local_1);
        }

        public function onAddAuction(_arg_1:Object):void
        {
            if (myAuctionList == null)
            {
                myAuctionList = {};
            };
            myAuctionList[_arg_1.id] = _arg_1;
            createMyAuctionList();
        }

        public function onAuctionBidMax(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1.flag)
            {
                _core.sysMidNote(_arg_1.info);
                if (visible)
                {
                    for each (_local_2 in resultAC)
                    {
                        if (_local_2.id == _arg_1.auctionId)
                        {
                            resultAC.removeItemAt(resultAC.getItemIndex(_local_2));
                        };
                    };
                };
            }
            else
            {
                _core.sysMidNote(_arg_1.info);
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1, 0);
        }

        [Bindable(event="propertyChange")]
        public function get auctionTime():NumericStepper
        {
            return (this._289027152auctionTime);
        }

        private function auctionBid():void
        {
            var onClose:Function = function (_arg_1:CloseEvent):void
            {
                if (Alert.OK == _arg_1.detail)
                {
                    auctionBidMax();
                };
            };
            if (resultDataGrid.selectedItem)
            {
                if (resultDataGrid.selectedItem.auctionType == 1)
                {
                    if (bidCurrency.value > _core.player.money)
                    {
                        Alert.show(((Language.AUCTIONPANEL_S[11] + GamePredef.CURRENCY_TIP[0]) + "!"), "", Alert.OK);
                        return;
                    };
                    if (((resultDataGrid.selectedItem.maxMoney <= bidCurrency.value) && (!(resultDataGrid.selectedItem.maxMoney == 0))))
                    {
                        Alert.show(Language.AUCTIONPANEL_S[36], "", (Alert.OK | Alert.CANCEL), null, onClose);
                        return;
                    };
                    if (resultDataGrid.selectedItem.nowMoney >= bidCurrency.value)
                    {
                        Alert.show(Language.AUCTIONPANEL_S[10], "", Alert.OK);
                        return;
                    };
                }
                else
                {
                    if (resultDataGrid.selectedItem.auctionType == 2)
                    {
                        if (bidCurrency.value > _core.player.gold)
                        {
                            Alert.show(((Language.AUCTIONPANEL_S[13] + GamePredef.CURRENCY_TIP[1]) + "!"), "", Alert.OK);
                            return;
                        };
                        if (((resultDataGrid.selectedItem.maxGold <= bidCurrency.value) && (!(resultDataGrid.selectedItem.maxGold == 0))))
                        {
                            Alert.show(Language.AUCTIONPANEL_S[36], "", (Alert.OK | Alert.CANCEL), null, onClose);
                            return;
                        };
                        if (resultDataGrid.selectedItem.nowGold >= bidCurrency.value)
                        {
                            Alert.show(Language.AUCTIONPANEL_S[12], "", Alert.OK);
                            return;
                        };
                    }
                    else
                    {
                        return;
                    };
                };
                _core.remote.call("auctionBid", new Responder(onAuctionBid), resultDataGrid.selectedItem.id, bidCurrency.value);
            };
        }

        private function _AuctionPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn8 = _local_1;
            _local_1.width = 35;
            _local_1.dataField = "lastTime";
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn8", _AuctionPanel_DataGridColumn8);
            return (_local_1);
        }

        private function delAuction(_arg_1:CloseEvent):void
        {
            if (_arg_1.detail == Alert.YES)
            {
                if (myAuctionDataGrid.selectedItem)
                {
                    _core.remote.cancelAuction(myAuctionDataGrid.selectedItem.id);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get searchCanva():Canvas
        {
            return (this._565654093searchCanva);
        }

        private function _AuctionPanel_ClassFactory7_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererCurrency;
            return (_local_1);
        }

        private function auctionSearch():void
        {
            var onClose:Function;
            glowEffect.end();
            searchButton.filters = [];
            if (!checkResponse())
            {
                if (!checkSearch())
                {
                    return;
                };
            };
            trace(("Time: " + (new Date().getTime() / 1000)));
            if (!auctionTree.selectedItem)
            {
                _core.sysMidNote(Language.AUCTIONPANEL_S[0]);
                return;
            };
            if (!auctionTree.selectedItem.type)
            {
            };
            var data:Object = {};
            if (((auctionTree.selectedItem) && (auctionTree.selectedItem.kind)))
            {
                data.kind = auctionTree.selectedItem.kind;
            }
            else
            {
                data.kind = -1;
            };
            if (((auctionTree.selectedItem) && (auctionTree.selectedItem.type)))
            {
                data.type = auctionTree.selectedItem.type;
            }
            else
            {
                data.type = -1;
            };
            if (levelLow.text != "")
            {
                data.levelLow = Number(levelLow.text);
            }
            else
            {
                data.levelLow = -1;
            };
            if (levelHigh.text != "")
            {
                data.levelHigh = Number(levelHigh.text);
            }
            else
            {
                data.levelHigh = -1;
            };
            data.name = itemName.text;
            data.npcId = npcId;
            if (!dataBuffer[data.kind])
            {
                dataBuffer[data.kind] = {
                    "version":-1,
                    "data":{}
                };
            };
            if (data.type > 0)
            {
                if (!dataBuffer[data.kind][data.type])
                {
                    dataBuffer[data.kind][data.type] = {
                        "version":-1,
                        "data":{}
                    };
                };
                data.version = dataBuffer[data.kind][data.type].version;
            }
            else
            {
                data.version = dataBuffer[data.kind].version;
            };
            if (_core.remote.call("auctionSearch", new Responder(onAuctionSearch), data))
            {
                auctionTree.enabled = false;
                this.response = false;
                searchButton.enabled = false;
                onClose = function (_arg_1:TimerEvent):void
                {
                    _core.view.getUI(ViewManager.POPU_WAIT).visible = false;
                };
                _core.view.getUI(ViewManager.POPU_WAIT).showText2(Language.AUCTIONPANEL_S[38], onClose);
            };
        }

        private function _AuctionPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn11 = _local_1;
            _local_1.dataField = "stackNum";
            _local_1.width = 35;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn11", _AuctionPanel_DataGridColumn11);
            return (_local_1);
        }

        public function set moneyCurrency(_arg_1:Currency):void
        {
            var _local_2:Object = this._2039330033moneyCurrency;
            if (_local_2 !== _arg_1)
            {
                this._2039330033moneyCurrency = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyCurrency", _local_2, _arg_1));
            };
        }

        public function __searchButton_click(_arg_1:MouseEvent):void
        {
            auctionSearch();
        }

        public function set costMoney(_arg_1:Currency):void
        {
            var _local_2:Object = this._286697229costMoney;
            if (_local_2 !== _arg_1)
            {
                this._286697229costMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costMoney", _local_2, _arg_1));
            };
        }

        private function priceSortFunc(_arg_1:Object, _arg_2:Object):int
        {
            if (_arg_1.auctionType == _arg_2.auctionType)
            {
                if (_arg_1.auctionType == 1)
                {
                    if (_arg_1.nowMoney < _arg_2.nowMoney)
                    {
                        return (-1);
                    };
                    if (_arg_1.nowMoney > _arg_2.nowMoney)
                    {
                        return (1);
                    };
                    if (_arg_1.nowMoney == _arg_2.nowMoney)
                    {
                        return (0);
                    };
                }
                else
                {
                    if (_arg_1.auctionType == 2)
                    {
                        if (_arg_1.nowGold < _arg_2.nowGold)
                        {
                            return (-1);
                        };
                        if (_arg_1.nowGold > _arg_2.nowGold)
                        {
                            return (1);
                        };
                        if (_arg_1.nowGold == _arg_2.nowGold)
                        {
                            return (0);
                        };
                    };
                };
            }
            else
            {
                if (((_arg_1.auctionType == 1) && (_arg_2.auctionType == 2)))
                {
                    return (-1);
                };
                if (((_arg_1.auctionType == 2) && (_arg_2.auctionType == 1)))
                {
                    return (1);
                };
            };
            return (0);
        }

        public function set itemType(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._1177533677itemType;
            if (_local_2 !== _arg_1)
            {
                this._1177533677itemType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemType", _local_2, _arg_1));
            };
        }

        public function set auctionItem(_arg_1:ItemSlotAuction):void
        {
            var _local_2:Object = this._289344522auctionItem;
            if (_local_2 !== _arg_1)
            {
                this._289344522auctionItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "auctionItem", _local_2, _arg_1));
            };
        }

        private function _AuctionPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.AUCTIONPANEL_U[6];
            _local_1 = Language.AUCTIONPANEL_S[25];
            _local_1 = pageCtrl;
            _local_1 = Language.AUCTIONPANEL_S[18];
            _local_1 = Language.AUCTIONPANEL_S[19];
            _local_1 = Language.AUCTIONPANEL_S[20];
            _local_1 = Language.AUCTIONPANEL_S[21];
            _local_1 = Language.AUCTIONPANEL_S[22];
            _local_1 = Language.AUCTIONPANEL_S[23];
            _local_1 = Language.AUCTIONPANEL_S[24];
            _local_1 = Language.AUCTIONPANEL_U[0];
            _local_1 = Language.AUCTIONPANEL_U[1];
            _local_1 = Language.AUCTIONPANEL_U[2];
            _local_1 = Language.AUCTIONPANEL_U[12];
            _local_1 = Language.AUCTIONPANEL_U[13];
            _local_1 = Language.AUCTIONPANEL_U[14];
            _local_1 = _pageSize;
            _local_1 = Language.AUCTIONPANEL_S[26];
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_MONEY;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Currency.TYPE_GOLD;
            _local_1 = Currency.TYPE_MONEYALL;
            _local_1 = Language.AUCTIONPANEL_U[3];
            _local_1 = Language.AUCTIONPANEL_U[4];
            _local_1 = Language.AUCTIONPANEL_S[27];
            _local_1 = Language.AUCTIONPANEL_S[28];
            _local_1 = Language.AUCTIONPANEL_S[29];
            _local_1 = Language.AUCTIONPANEL_S[30];
            _local_1 = Language.AUCTIONPANEL_S[31];
            _local_1 = Language.AUCTIONPANEL_S[32];
            _local_1 = Language.AUCTIONPANEL_S[33];
            _local_1 = Language.AUCTIONPANEL_U[5];
            _local_1 = Language.AUCTIONPANEL_U[7];
            _local_1 = Language.AUCTIONPANEL_U[8];
            _local_1 = Language.AUCTIONPANEL_U[1];
            _local_1 = Language.AUCTIONPANEL_U[9];
            _local_1 = Language.AUCTIONPANEL_U[8];
            _local_1 = Language.AUCTIONPANEL_U[1];
            _local_1 = Language.AUCTIONPANEL_U[10];
            _local_1 = Language.AUCTIONPANEL_U[11];
            _local_1 = Language.AUCTIONPANEL_U[15];
            _local_1 = Language.AUCTIONPANEL_U[16];
            _local_1 = (Number(_core.player.pmLevel) >= 3);
            _local_1 = Language.AUCTIONPANEL_U[0];
            _local_1 = Language.AUCTIONPANEL_U[3];
        }

        public function set searchButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._365389062searchButton;
            if (_local_2 !== _arg_1)
            {
                this._365389062searchButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchButton", _local_2, _arg_1));
            };
        }

        private function _AuctionPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _AuctionPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "pn";
            _local_1.showDataTips = true;
            BindingManager.executeBindings(this, "_AuctionPanel_DataGridColumn7", _AuctionPanel_DataGridColumn7);
            return (_local_1);
        }

        private function priceMaxSortFunc(_arg_1:Object, _arg_2:Object):int
        {
            if (_arg_1.auctionType == _arg_2.auctionType)
            {
                if (_arg_1.auctionType == 1)
                {
                    if (_arg_1.maxMoney < _arg_2.maxMoney)
                    {
                        return (-1);
                    };
                    if (_arg_1.maxMoney > _arg_2.maxMoney)
                    {
                        return (1);
                    };
                    if (_arg_1.maxMoney == _arg_2.maxMoney)
                    {
                        return (0);
                    };
                }
                else
                {
                    if (_arg_1.auctionType == 2)
                    {
                        if (_arg_1.maxGold < _arg_2.maxGold)
                        {
                            return (-1);
                        };
                        if (_arg_1.maxGold > _arg_2.maxGold)
                        {
                            return (1);
                        };
                        if (_arg_1.maxGold == _arg_2.maxGold)
                        {
                            return (0);
                        };
                    };
                };
            }
            else
            {
                if (((_arg_1.auctionType == 1) && (_arg_2.auctionType == 2)))
                {
                    return (-1);
                };
                if (((_arg_1.auctionType == 2) && (_arg_2.auctionType == 1)))
                {
                    return (1);
                };
            };
            return (0);
        }


    }
}//package com.qeedoo.ui.view.compDragable

