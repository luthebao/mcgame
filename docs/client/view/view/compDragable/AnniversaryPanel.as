// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.AnniversaryPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import flash.display.Loader;
    import mx.controls.Label;
    import mx.controls.DataGrid;
    import mx.containers.Canvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.events.PropertyChangeEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import flash.display.SimpleButton;
    import mx.core.UIComponent;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import mx.events.FlexEvent;
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

    public class AnniversaryPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _349420012rank5Slot3:ItemSlot;
        private var _292161709rank3Slot2:ItemSlot;
        private var loader:Loader;
        private var _292161712rank3Slot5:ItemSlot;
        private var _320790863rank4Slot5:ItemSlot;
        private var _378049165rank6Slot5:ItemSlot;
        private var _349420010rank5Slot1:ItemSlot;
        private var _263532558rank2Slot2:ItemSlot;
        public var _AnniversaryPanel_Label10:Label;
        public var _AnniversaryPanel_Label11:Label;
        public var _AnniversaryPanel_Label12:Label;
        public var _AnniversaryPanel_Label13:Label;
        public var _AnniversaryPanel_Label14:Label;
        public var _AnniversaryPanel_Label15:Label;
        public var _AnniversaryPanel_Label16:Label;
        public var _AnniversaryPanel_Label17:Label;
        public var _AnniversaryPanel_Label18:Label;
        public var _AnniversaryPanel_Label19:Label;
        private var subC4:Class;
        private var subC5:Class;
        private var subC6:Class;
        private var subC7:Class;
        private var subC1:Class;
        private var _1352493073perCrossRank:DataGrid;
        private var _234903408rank1Slot3:ItemSlot;
        private var _263532561rank2Slot5:ItemSlot;
        private var _409271709totalContainer:Canvas;
        private var subC3:Class;
        private var subC8:Class;
        public var _AnniversaryPanel_Label20:Label;
        public var _AnniversaryPanel_Label21:Label;
        public var _AnniversaryPanel_Label22:Label;
        public var _AnniversaryPanel_Label23:Label;
        public var _AnniversaryPanel_Label24:Label;
        public var _AnniversaryPanel_Label25:Label;
        public var _AnniversaryPanel_Label26:Label;
        public var _AnniversaryPanel_Label27:Label;
        public var _AnniversaryPanel_Label28:Label;
        public var _AnniversaryPanel_Label29:Label;
        private var _292161710rank3Slot3:ItemSlot;
        private var _378049163rank6Slot3:ItemSlot;
        public var _AnniversaryPanel_ViewStack1:ViewStack;
        private var _2077431384totalCrossRank:DataGrid;
        private var _320790861rank4Slot3:ItemSlot;
        public var _AnniversaryPanel_Label30:Label;
        public var _AnniversaryPanel_Label31:Label;
        public var _AnniversaryPanel_Label32:Label;
        public var _AnniversaryPanel_Label33:Label;
        public var _AnniversaryPanel_Label1:Label;
        public var _AnniversaryPanel_Label2:Label;
        public var _AnniversaryPanel_Label3:Label;
        public var _AnniversaryPanel_Label4:Label;
        public var _AnniversaryPanel_Label5:Label;
        public var _AnniversaryPanel_Label6:Label;
        public var _AnniversaryPanel_Label7:Label;
        public var _AnniversaryPanel_Label8:Label;
        public var _AnniversaryPanel_Label35:Label;
        private var _349420013rank5Slot4:ItemSlot;
        public var _AnniversaryPanel_Label9:Label;
        public var _AnniversaryPanel_Label36:Label;
        public var _AnniversaryPanel_Label34:Label;
        private var subC2:Class;
        private var _234903406rank1Slot1:ItemSlot;
        public var _AnniversaryPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _378049161rank6Slot1:ItemSlot;
        public var _AnniversaryPanel_Image1:Image;
        private var _263532559rank2Slot3:ItemSlot;
        private var _234903409rank1Slot4:ItemSlot;
        private var _349420011rank5Slot2:ItemSlot;
        private var _292161708rank3Slot1:ItemSlot;
        private var _1794723803perTotalCrossRank:DataGrid;
        private var _320790859rank4Slot1:ItemSlot;
        private var _292161711rank3Slot4:ItemSlot;
        private var _803559802pageTab:HButtonTab;
        private var _320790862rank4Slot4:ItemSlot;
        private var _378049164rank6Slot4:ItemSlot;
        private var _349420014rank5Slot5:ItemSlot;
        private var _679437591perRank:DataGrid;
        private var _263532557rank2Slot1:ItemSlot;
        private var _1913215863serverCrossRank:DataGrid;
        private var _234903407rank1Slot2:ItemSlot;
        private var _263532560rank2Slot4:ItemSlot;
        private var _234903410rank1Slot5:ItemSlot;
        private var _320790860rank4Slot2:ItemSlot;
        private var _967817459perTotalRank:DataGrid;
        private var _378049162rank6Slot2:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":760,
                    "height":550,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_AnniversaryPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"totalContainer",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":13,
                                "y":39,
                                "width":740,
                                "height":490,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_AnniversaryPanel_Image1"
                                }), new UIComponentDescriptor({
                                    "type":HButtonTab,
                                    "id":"pageTab",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":47,
                                            "selectedIndex":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"_AnniversaryPanel_ViewStack1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":85,
                                            "width":400,
                                            "height":366,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":400,
                                                                    "height":260,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"perRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":36,
                                                                                "y":41,
                                                                                "columns":[_AnniversaryPanel_DataGridColumn1_c(), _AnniversaryPanel_DataGridColumn2_c(), _AnniversaryPanel_DataGridColumn3_c()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":60000,
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Làm mới",
                                                                    "x":332,
                                                                    "y":0x0101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Thưởng",
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF6600;
                                                                this.horizontalCenter = "-145";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top1",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00FF;
                                                                this.horizontalCenter = "-72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top2",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 13311;
                                                                this.horizontalCenter = "-2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top3",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00;
                                                                this.horizontalCenter = "72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top5",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "144";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top10",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank1Slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":299
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank1Slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":110,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank1Slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank1Slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank1Slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":325,
                                                                    "y":297
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Nhận",
                                                                    "x":169,
                                                                    "y":338
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":400,
                                                                    "height":260,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"perCrossRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":36,
                                                                                "y":41,
                                                                                "columns":[_AnniversaryPanel_DataGridColumn4_c(), _AnniversaryPanel_DataGridColumn5_c(), _AnniversaryPanel_DataGridColumn6_c(), _AnniversaryPanel_DataGridColumn7_c()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":60000,
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Làm mới",
                                                                    "x":332,
                                                                    "y":0x0101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Thưởng",
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF6600;
                                                                this.horizontalCenter = "-145";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top1",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00FF;
                                                                this.horizontalCenter = "-72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top2",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label10",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 13311;
                                                                this.horizontalCenter = "-2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top3",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00;
                                                                this.horizontalCenter = "72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top5",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label12",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "144";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top10",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank2Slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":299
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank2Slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":110,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank2Slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank2Slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank2Slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":325,
                                                                    "y":297
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Nhận",
                                                                    "x":169,
                                                                    "y":338
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":400,
                                                                    "height":260,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"serverCrossRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":36,
                                                                                "y":41,
                                                                                "columns":[_AnniversaryPanel_DataGridColumn8_c(), _AnniversaryPanel_DataGridColumn9_c(), _AnniversaryPanel_DataGridColumn10_c()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":60000,
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Làm mới",
                                                                    "x":332,
                                                                    "y":0x0101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Thưởng Sv",
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label14",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF6600;
                                                                this.horizontalCenter = "-145";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top1",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00FF;
                                                                this.horizontalCenter = "-72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top2",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label16",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 13311;
                                                                this.horizontalCenter = "-2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top3",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label17",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00;
                                                                this.horizontalCenter = "72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top5",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label18",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "144";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top10",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank3Slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":299
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank3Slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":110,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank3Slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank3Slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank3Slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":325,
                                                                    "y":297
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Nhận",
                                                                    "x":169,
                                                                    "y":338
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":400,
                                                                    "height":260,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"perTotalRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":36,
                                                                                "y":41,
                                                                                "columns":[_AnniversaryPanel_DataGridColumn11_c(), _AnniversaryPanel_DataGridColumn12_c(), _AnniversaryPanel_DataGridColumn13_c()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton7_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":60000,
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Làm mới",
                                                                    "x":332,
                                                                    "y":0x0101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label19",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Thưởng",
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label20",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF6600;
                                                                this.horizontalCenter = "-145";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top1",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label21",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00FF;
                                                                this.horizontalCenter = "-72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top2",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label22",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 13311;
                                                                this.horizontalCenter = "-2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top3",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label23",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00;
                                                                this.horizontalCenter = "72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top5",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label24",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "144";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top10",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank4Slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":299
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank4Slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":110,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank4Slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank4Slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank4Slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":325,
                                                                    "y":297
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton8_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Nhận",
                                                                    "x":169,
                                                                    "y":338
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":400,
                                                                    "height":260,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"perTotalCrossRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":36,
                                                                                "y":41,
                                                                                "columns":[_AnniversaryPanel_DataGridColumn14_c(), _AnniversaryPanel_DataGridColumn15_c(), _AnniversaryPanel_DataGridColumn16_c(), _AnniversaryPanel_DataGridColumn17_c()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton9_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":60000,
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Làm mới",
                                                                    "x":332,
                                                                    "y":0x0101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label25",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Thưởng",
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label26",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF6600;
                                                                this.horizontalCenter = "-145";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top1",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label27",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00FF;
                                                                this.horizontalCenter = "-72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top2",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label28",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 13311;
                                                                this.horizontalCenter = "-2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top3",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label29",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00;
                                                                this.horizontalCenter = "72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top5",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label30",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "144";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top10",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank5Slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":299
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank5Slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":110,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank5Slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank5Slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank5Slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":325,
                                                                    "y":297
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton10_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Nhận",
                                                                    "x":169,
                                                                    "y":338
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "x":0,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":400,
                                                                    "height":260,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"totalCrossRank",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "columnWidth":180,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":36,
                                                                                "y":37,
                                                                                "columns":[_AnniversaryPanel_DataGridColumn18_c(), _AnniversaryPanel_DataGridColumn19_c(), _AnniversaryPanel_DataGridColumn20_c()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton11_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "clickDelay":60000,
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Làm mới",
                                                                    "x":332,
                                                                    "y":0x0101
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label31",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Thưởng",
                                                                    "y":258
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label32",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF6600;
                                                                this.horizontalCenter = "-145";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top1",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label33",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00FF;
                                                                this.horizontalCenter = "-72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top2",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label34",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 13311;
                                                                this.horizontalCenter = "-2";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top3",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label35",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFF00;
                                                                this.horizontalCenter = "72";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top5",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_AnniversaryPanel_Label36",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                                this.color = 0xFFFFFF;
                                                                this.horizontalCenter = "144";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"Top10",
                                                                    "y":278
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank6Slot1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":38,
                                                                    "y":299
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank6Slot2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":110,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank6Slot3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":181,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank6Slot4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":253,
                                                                    "y":298
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"rank6Slot5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":325,
                                                                    "y":297
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicDelayButton,
                                                            "events":{"click":"___AnniversaryPanel_BasicDelayButton12_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnStdGreen",
                                                                    "label":"Nhận",
                                                                    "x":169,
                                                                    "y":338
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
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var AnniScoreAwardConfig:Array = [[5739, 5740, 5741, 5742, 5743], [5744, 5745, 5746, 5747, 5748], [5749, 5750, 5751, 5752, 5753], [5754, 5755, 5756, 5757, 5758], [5759, 5760, 5761, 5762, 5763], [5764, 5765, 5766, 5767, 5768]];
        private var SERVER_ID_NAME:Object = {
            "1":"Server 12",
            "2":"Server 6",
            "6":"Server 32",
            "16":"Server 36",
            "19":"Server 38"
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AnniversaryPanel()
        {
            mx_internal::_document = this;
            this.width = 760;
            this.height = 550;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___AnniversaryPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AnniversaryPanel._watcherSetupUtil = _arg_1;
        }


        private function _AnniversaryPanel_DataGridColumn1_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "XH";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        private function _AnniversaryPanel_DataGridColumn9_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Sv";
            _local_1.dataField = "server";
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get rank2Slot2():ItemSlot
        {
            return (this._263532558rank2Slot2);
        }

        [Bindable(event="propertyChange")]
        public function get rank2Slot3():ItemSlot
        {
            return (this._263532559rank2Slot3);
        }

        [Bindable(event="propertyChange")]
        public function get rank2Slot4():ItemSlot
        {
            return (this._263532560rank2Slot4);
        }

        [Bindable(event="propertyChange")]
        public function get rank2Slot5():ItemSlot
        {
            return (this._263532561rank2Slot5);
        }

        [Bindable(event="propertyChange")]
        public function get rank2Slot1():ItemSlot
        {
            return (this._263532557rank2Slot1);
        }

        private function _AnniversaryPanel_DataGridColumn17_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Điểm";
            _local_1.dataField = "score";
            _local_1.width = 100;
            return (_local_1);
        }

        public function set rank2Slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._263532559rank2Slot3;
            if (_local_2 !== _arg_1)
            {
                this._263532559rank2Slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank2Slot3", _local_2, _arg_1));
            };
        }

        public function set rank2Slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._263532560rank2Slot4;
            if (_local_2 !== _arg_1)
            {
                this._263532560rank2Slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank2Slot4", _local_2, _arg_1));
            };
        }

        public function set rank2Slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._263532557rank2Slot1;
            if (_local_2 !== _arg_1)
            {
                this._263532557rank2Slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank2Slot1", _local_2, _arg_1));
            };
        }

        public function set rank2Slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._263532561rank2Slot5;
            if (_local_2 !== _arg_1)
            {
                this._263532561rank2Slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank2Slot5", _local_2, _arg_1));
            };
        }

        private function _AnniversaryPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ANNIVERSARY_LANG[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _AnniversaryPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_AnniversaryPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000723));
            }, function (_arg_1:Object):void
            {
                _AnniversaryPanel_Image1.source = _arg_1;
            }, "_AnniversaryPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTab.filters = _arg_1;
            }, "pageTab.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.ANNIVERSARY_LANG[2]);
            }, function (_arg_1:Array):void
            {
                pageTab.dataArray = _arg_1;
            }, "pageTab.dataArray");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTab.selectedIndex);
            }, function (_arg_1:int):void
            {
                _AnniversaryPanel_ViewStack1.selectedIndex = _arg_1;
            }, "_AnniversaryPanel_ViewStack1.selectedIndex");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label1.filters = _arg_1;
            }, "_AnniversaryPanel_Label1.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label2.filters = _arg_1;
            }, "_AnniversaryPanel_Label2.filters");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label3.filters = _arg_1;
            }, "_AnniversaryPanel_Label3.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label4.filters = _arg_1;
            }, "_AnniversaryPanel_Label4.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label5.filters = _arg_1;
            }, "_AnniversaryPanel_Label5.filters");
            result[9] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label6.filters = _arg_1;
            }, "_AnniversaryPanel_Label6.filters");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label7.filters = _arg_1;
            }, "_AnniversaryPanel_Label7.filters");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label8.filters = _arg_1;
            }, "_AnniversaryPanel_Label8.filters");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label9.filters = _arg_1;
            }, "_AnniversaryPanel_Label9.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label10.filters = _arg_1;
            }, "_AnniversaryPanel_Label10.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label11.filters = _arg_1;
            }, "_AnniversaryPanel_Label11.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label12.filters = _arg_1;
            }, "_AnniversaryPanel_Label12.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label13.filters = _arg_1;
            }, "_AnniversaryPanel_Label13.filters");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label14.filters = _arg_1;
            }, "_AnniversaryPanel_Label14.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label15.filters = _arg_1;
            }, "_AnniversaryPanel_Label15.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label16.filters = _arg_1;
            }, "_AnniversaryPanel_Label16.filters");
            result[20] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label17.filters = _arg_1;
            }, "_AnniversaryPanel_Label17.filters");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label18.filters = _arg_1;
            }, "_AnniversaryPanel_Label18.filters");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label19.filters = _arg_1;
            }, "_AnniversaryPanel_Label19.filters");
            result[23] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label20.filters = _arg_1;
            }, "_AnniversaryPanel_Label20.filters");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label21.filters = _arg_1;
            }, "_AnniversaryPanel_Label21.filters");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label22.filters = _arg_1;
            }, "_AnniversaryPanel_Label22.filters");
            result[26] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label23.filters = _arg_1;
            }, "_AnniversaryPanel_Label23.filters");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label24.filters = _arg_1;
            }, "_AnniversaryPanel_Label24.filters");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label25.filters = _arg_1;
            }, "_AnniversaryPanel_Label25.filters");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label26.filters = _arg_1;
            }, "_AnniversaryPanel_Label26.filters");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label27.filters = _arg_1;
            }, "_AnniversaryPanel_Label27.filters");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label28.filters = _arg_1;
            }, "_AnniversaryPanel_Label28.filters");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label29.filters = _arg_1;
            }, "_AnniversaryPanel_Label29.filters");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label30.filters = _arg_1;
            }, "_AnniversaryPanel_Label30.filters");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label31.filters = _arg_1;
            }, "_AnniversaryPanel_Label31.filters");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label32.filters = _arg_1;
            }, "_AnniversaryPanel_Label32.filters");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label33.filters = _arg_1;
            }, "_AnniversaryPanel_Label33.filters");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label34.filters = _arg_1;
            }, "_AnniversaryPanel_Label34.filters");
            result[38] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label35.filters = _arg_1;
            }, "_AnniversaryPanel_Label35.filters");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _AnniversaryPanel_Label36.filters = _arg_1;
            }, "_AnniversaryPanel_Label36.filters");
            result[40] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get perTotalCrossRank():DataGrid
        {
            return (this._1794723803perTotalCrossRank);
        }

        public function ___AnniversaryPanel_BasicDelayButton5_click(_arg_1:MouseEvent):void
        {
            getRankByType(3);
        }

        private function _AnniversaryPanel_DataGridColumn20_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Điểm";
            _local_1.dataField = "score";
            _local_1.width = 100;
            return (_local_1);
        }

        public function set rank2Slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._263532558rank2Slot2;
            if (_local_2 !== _arg_1)
            {
                this._263532558rank2Slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank2Slot2", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            subC1 = (loader.contentLoaderInfo.applicationDomain.getDefinition("mashangjiqing") as Class);
            var _local_2:SimpleButton = new subC1();
            _local_2.x = 24;
            _local_2.y = 10;
            _local_2.addEventListener(MouseEvent.CLICK, click);
            var _local_3:UIComponent = new UIComponent();
            _local_3.addChild(_local_2);
            totalContainer.addChild(_local_3);
            subC2 = (loader.contentLoaderInfo.applicationDomain.getDefinition("shuiguanyouhuo") as Class);
            var _local_4:SimpleButton = new subC2();
            _local_4.x = 24;
            _local_4.y = 130;
            _local_4.addEventListener(MouseEvent.CLICK, click);
            var _local_5:UIComponent = new UIComponent();
            _local_5.addChild(_local_4);
            totalContainer.addChild(_local_5);
            subC3 = (loader.contentLoaderInfo.applicationDomain.getDefinition("tiantianxiaochu") as Class);
            var _local_6:SimpleButton = new subC3();
            _local_6.x = 24;
            _local_6.y = 250;
            _local_6.addEventListener(MouseEvent.CLICK, click);
            var _local_7:UIComponent = new UIComponent();
            _local_7.addChild(_local_6);
            totalContainer.addChild(_local_7);
            subC4 = (loader.contentLoaderInfo.applicationDomain.getDefinition("zhongzhinengshou") as Class);
            var _local_8:SimpleButton = new subC4();
            _local_8.x = 593;
            _local_8.y = 10;
            _local_8.addEventListener(MouseEvent.CLICK, click);
            var _local_9:UIComponent = new UIComponent();
            _local_9.addChild(_local_8);
            totalContainer.addChild(_local_9);
            subC5 = (loader.contentLoaderInfo.applicationDomain.getDefinition("chengzhongdashi") as Class);
            var _local_10:SimpleButton = new subC5();
            _local_10.x = 593;
            _local_10.y = 130;
            _local_10.addEventListener(MouseEvent.CLICK, click);
            var _local_11:UIComponent = new UIComponent();
            _local_11.addChild(_local_10);
            totalContainer.addChild(_local_11);
            subC6 = (loader.contentLoaderInfo.applicationDomain.getDefinition("mofafangkuai") as Class);
            var _local_12:SimpleButton = new subC6();
            _local_12.x = 593;
            _local_12.y = 250;
            _local_12.addEventListener(MouseEvent.CLICK, click);
            var _local_13:UIComponent = new UIComponent();
            _local_13.addChild(_local_12);
            totalContainer.addChild(_local_13);
            subC7 = (loader.contentLoaderInfo.applicationDomain.getDefinition("jiugongpitu") as Class);
            var _local_14:SimpleButton = new subC7();
            _local_14.x = 24;
            _local_14.y = 370;
            _local_14.addEventListener(MouseEvent.CLICK, click);
            var _local_15:UIComponent = new UIComponent();
            _local_15.addChild(_local_14);
            totalContainer.addChild(_local_15);
            subC8 = (loader.contentLoaderInfo.applicationDomain.getDefinition("chongwupaidui") as Class);
            var _local_16:SimpleButton = new subC8();
            _local_16.x = 593;
            _local_16.y = 370;
            _local_16.addEventListener(MouseEvent.CLICK, click);
            var _local_17:UIComponent = new UIComponent();
            _local_17.addChild(_local_16);
            totalContainer.addChild(_local_17);
        }

        private function gameWasteland():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME_WASTELAND);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        private function _AnniversaryPanel_DataGridColumn8_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "XH";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        private function fixRankDataServer(_arg_1:Object):Array
        {
            var _local_4:Number;
            var _local_2:Array = (_arg_1 as Array);
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = Number(_local_2[_local_3]["serverId"]);
                _local_2[_local_3]["server"] = SERVER_ID_NAME[_local_4];
                _local_3++;
            };
            return (_local_2);
        }

        private function openCubeGamePanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_CUBEMASTER);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        public function set perTotalCrossRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1794723803perTotalCrossRank;
            if (_local_2 !== _arg_1)
            {
                this._1794723803perTotalCrossRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "perTotalCrossRank", _local_2, _arg_1));
            };
        }

        private function _AnniversaryPanel_DataGridColumn16_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tên";
            _local_1.dataField = "name";
            return (_local_1);
        }

        public function ___AnniversaryPanel_BasicDelayButton12_click(_arg_1:MouseEvent):void
        {
            getAnniAward(6);
        }

        public function ___AnniversaryPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            getAnniAward(1);
        }

        private function gameHorseRace():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME_HORSE_RACE);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTab():HButtonTab
        {
            return (this._803559802pageTab);
        }

        private function _AnniversaryPanel_DataGridColumn7_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Điểm";
            _local_1.dataField = "score";
            _local_1.width = 100;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get rank6Slot2():ItemSlot
        {
            return (this._378049162rank6Slot2);
        }

        private function _AnniversaryPanel_DataGridColumn15_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Sv";
            _local_1.dataField = "server";
            _local_1.width = 70;
            return (_local_1);
        }

        private function getAnniRes():void
        {
            var _local_1:LoaderContext;
            if (!loader)
            {
                loader = new Loader();
                _local_1 = new LoaderContext();
                _local_1.applicationDomain = ApplicationDomain.currentDomain;
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                loader.load(new URLRequest(ResManager.getResUrl(2080130106015)), _local_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank3Slot5():ItemSlot
        {
            return (this._292161712rank3Slot5);
        }

        public function set rank4Slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._320790861rank4Slot3;
            if (_local_2 !== _arg_1)
            {
                this._320790861rank4Slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank4Slot3", _local_2, _arg_1));
            };
        }

        public function ___AnniversaryPanel_BasicDelayButton7_click(_arg_1:MouseEvent):void
        {
            getRankByType(4);
        }

        [Bindable(event="propertyChange")]
        public function get rank3Slot3():ItemSlot
        {
            return (this._292161710rank3Slot3);
        }

        [Bindable(event="propertyChange")]
        public function get rank3Slot4():ItemSlot
        {
            return (this._292161711rank3Slot4);
        }

        public function set rank4Slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._320790859rank4Slot1;
            if (_local_2 !== _arg_1)
            {
                this._320790859rank4Slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank4Slot1", _local_2, _arg_1));
            };
        }

        public function set rank4Slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._320790862rank4Slot4;
            if (_local_2 !== _arg_1)
            {
                this._320790862rank4Slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank4Slot4", _local_2, _arg_1));
            };
        }

        public function set rank4Slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._320790863rank4Slot5;
            if (_local_2 !== _arg_1)
            {
                this._320790863rank4Slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank4Slot5", _local_2, _arg_1));
            };
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" stone master load res Error ");
        }

        private function _AnniversaryPanel_DataGridColumn6_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tên";
            _local_1.dataField = "name";
            return (_local_1);
        }

        private function _AnniversaryPanel_DataGridColumn14_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "XH Sv";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        public function set rank1Slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._234903406rank1Slot1;
            if (_local_2 !== _arg_1)
            {
                this._234903406rank1Slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank1Slot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank6Slot1():ItemSlot
        {
            return (this._378049161rank6Slot1);
        }

        public function set rank1Slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._234903407rank1Slot2;
            if (_local_2 !== _arg_1)
            {
                this._234903407rank1Slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank1Slot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank6Slot3():ItemSlot
        {
            return (this._378049163rank6Slot3);
        }

        public function set rank1Slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._234903408rank1Slot3;
            if (_local_2 !== _arg_1)
            {
                this._234903408rank1Slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank1Slot3", _local_2, _arg_1));
            };
        }

        public function set rank1Slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._234903409rank1Slot4;
            if (_local_2 !== _arg_1)
            {
                this._234903409rank1Slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank1Slot4", _local_2, _arg_1));
            };
        }

        public function set rank1Slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._234903410rank1Slot5;
            if (_local_2 !== _arg_1)
            {
                this._234903410rank1Slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank1Slot5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank3Slot1():ItemSlot
        {
            return (this._292161708rank3Slot1);
        }

        [Bindable(event="propertyChange")]
        public function get rank3Slot2():ItemSlot
        {
            return (this._292161709rank3Slot2);
        }

        [Bindable(event="propertyChange")]
        public function get perRank():DataGrid
        {
            return (this._679437591perRank);
        }

        public function ___AnniversaryPanel_BasicDelayButton4_click(_arg_1:MouseEvent):void
        {
            getAnniAward(2);
        }

        public function set rank4Slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._320790860rank4Slot2;
            if (_local_2 !== _arg_1)
            {
                this._320790860rank4Slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank4Slot2", _local_2, _arg_1));
            };
        }

        private function gameThreeDiabetes():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SUMMER_GAME_DIABETES);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank6Slot5():ItemSlot
        {
            return (this._378049165rank6Slot5);
        }

        [Bindable(event="propertyChange")]
        public function get perTotalRank():DataGrid
        {
            return (this._967817459perTotalRank);
        }

        [Bindable(event="propertyChange")]
        public function get rank6Slot4():ItemSlot
        {
            return (this._378049164rank6Slot4);
        }

        private function openSudokuPanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_SUDOKU);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        public function set pageTab(_arg_1:HButtonTab):void
        {
            var _local_2:Object = this._803559802pageTab;
            if (_local_2 !== _arg_1)
            {
                this._803559802pageTab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTab", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get serverCrossRank():DataGrid
        {
            return (this._1913215863serverCrossRank);
        }

        public function set rank6Slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._378049161rank6Slot1;
            if (_local_2 !== _arg_1)
            {
                this._378049161rank6Slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank6Slot1", _local_2, _arg_1));
            };
        }

        public function set rank6Slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._378049162rank6Slot2;
            if (_local_2 !== _arg_1)
            {
                this._378049162rank6Slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank6Slot2", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            visible = true;
            getAnniRes();
        }

        public function set rank6Slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._378049165rank6Slot5;
            if (_local_2 !== _arg_1)
            {
                this._378049165rank6Slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank6Slot5", _local_2, _arg_1));
            };
        }

        private function _AnniversaryPanel_DataGridColumn5_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Sv";
            _local_1.dataField = "server";
            _local_1.width = 70;
            return (_local_1);
        }

        public function onUpdateRankByType(_arg_1:Object):void
        {
            var _local_2:uint;
            var _local_3:Object;
            if (_arg_1)
            {
                _local_2 = uint(Number(_arg_1["type"]));
                _local_3 = _arg_1["rank"];
                switch (_local_2)
                {
                    case 1:
                        perRank.dataProvider = _local_3;
                        return;
                    case 2:
                        perCrossRank.dataProvider = fixRankData(_local_3);
                        return;
                    case 3:
                        serverCrossRank.dataProvider = fixRankDataServer(_local_3);
                        return;
                    case 4:
                        perTotalRank.dataProvider = _local_3;
                        return;
                    case 5:
                        perTotalCrossRank.dataProvider = fixRankData(_local_3);
                        return;
                    case 6:
                        totalCrossRank.dataProvider = fixRankDataServer(_local_3);
                        return;
                };
            };
        }

        private function initSlot():void
        {
            var _local_2:uint;
            var _local_3:ItemSlot;
            var _local_1:uint = 1;
            while (_local_1 <= 6)
            {
                _local_2 = 1;
                while (_local_2 <= 5)
                {
                    _local_3 = (this[((("rank" + _local_1) + "Slot") + _local_2)] as ItemSlot);
                    _local_3.clean();
                    _local_3.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_3.giid = AnniScoreAwardConfig[(_local_1 - 1)][(_local_2 - 1)];
                    _local_2++;
                };
                _local_1++;
            };
        }

        public function ___AnniversaryPanel_BasicDelayButton9_click(_arg_1:MouseEvent):void
        {
            getRankByType(5);
        }

        private function _AnniversaryPanel_DataGridColumn13_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tích lũy";
            _local_1.dataField = "score";
            _local_1.width = 100;
            return (_local_1);
        }

        private function fixRankData(_arg_1:Object):Array
        {
            var _local_4:Number;
            var _local_5:int;
            var _local_6:Number;
            var _local_2:Array = (_arg_1 as Array);
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = Number(_local_2[_local_3]["cid"]);
                _local_5 = int(Math.floor((_local_4 / 100000000)));
                _local_6 = (_local_4 % 100000000);
                _local_2[_local_3]["server"] = SERVER_ID_NAME[_local_5];
                _local_3++;
            };
            return (_local_2);
        }

        public function ___AnniversaryPanel_BasicDelayButton11_click(_arg_1:MouseEvent):void
        {
            getRankByType(6);
        }

        private function openStoneGamePanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_STONEMASTER);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        public function set rank6Slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._378049163rank6Slot3;
            if (_local_2 !== _arg_1)
            {
                this._378049163rank6Slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank6Slot3", _local_2, _arg_1));
            };
        }

        public function ___AnniversaryPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            getRankByType(1);
        }

        public function set totalContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._409271709totalContainer;
            if (_local_2 !== _arg_1)
            {
                this._409271709totalContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalContainer", _local_2, _arg_1));
            };
        }

        public function set rank6Slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._378049164rank6Slot4;
            if (_local_2 !== _arg_1)
            {
                this._378049164rank6Slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank6Slot4", _local_2, _arg_1));
            };
        }

        private function _AnniversaryPanel_DataGridColumn4_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Toàn Sv";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get rank4Slot2():ItemSlot
        {
            return (this._320790860rank4Slot2);
        }

        [Bindable(event="propertyChange")]
        public function get rank4Slot4():ItemSlot
        {
            return (this._320790862rank4Slot4);
        }

        private function _AnniversaryPanel_DataGridColumn12_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tên";
            _local_1.dataField = "name";
            return (_local_1);
        }

        public function set rank3Slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._292161708rank3Slot1;
            if (_local_2 !== _arg_1)
            {
                this._292161708rank3Slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank3Slot1", _local_2, _arg_1));
            };
        }

        public function set rank3Slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._292161712rank3Slot5;
            if (_local_2 !== _arg_1)
            {
                this._292161712rank3Slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank3Slot5", _local_2, _arg_1));
            };
        }

        public function set rank3Slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._292161709rank3Slot2;
            if (_local_2 !== _arg_1)
            {
                this._292161709rank3Slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank3Slot2", _local_2, _arg_1));
            };
        }

        public function set rank3Slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._292161711rank3Slot4;
            if (_local_2 !== _arg_1)
            {
                this._292161711rank3Slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank3Slot4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank4Slot5():ItemSlot
        {
            return (this._320790863rank4Slot5);
        }

        public function set totalCrossRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._2077431384totalCrossRank;
            if (_local_2 !== _arg_1)
            {
                this._2077431384totalCrossRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalCrossRank", _local_2, _arg_1));
            };
        }

        public function set rank3Slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._292161710rank3Slot3;
            if (_local_2 !== _arg_1)
            {
                this._292161710rank3Slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank3Slot3", _local_2, _arg_1));
            };
        }

        public function ___AnniversaryPanel_BasicDelayButton6_click(_arg_1:MouseEvent):void
        {
            getAnniAward(3);
        }

        [Bindable(event="propertyChange")]
        public function get rank1Slot1():ItemSlot
        {
            return (this._234903406rank1Slot1);
        }

        [Bindable(event="propertyChange")]
        public function get rank1Slot2():ItemSlot
        {
            return (this._234903407rank1Slot2);
        }

        [Bindable(event="propertyChange")]
        public function get rank1Slot3():ItemSlot
        {
            return (this._234903408rank1Slot3);
        }

        [Bindable(event="propertyChange")]
        public function get rank1Slot4():ItemSlot
        {
            return (this._234903409rank1Slot4);
        }

        public function getRankByType(_arg_1:uint):void
        {
            switch (_arg_1)
            {
                case 1:
                    _core.remote.call("updateAnniversaryRank", null, 1);
                    return;
                case 2:
                    _core.remote.call("updateAnniPerRank", null, 1);
                    return;
                case 3:
                    _core.remote.call("updateAnniversaryCrossRank", null, 1);
                    return;
                case 4:
                    _core.remote.call("updateAnniversaryRank", null, 2);
                    return;
                case 5:
                    _core.remote.call("updateAnniPerRank", null, 2);
                    return;
                case 6:
                    _core.remote.call("updateAnniversaryCrossRank", null, 2);
                    return;
            };
        }

        public function set serverCrossRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1913215863serverCrossRank;
            if (_local_2 !== _arg_1)
            {
                this._1913215863serverCrossRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serverCrossRank", _local_2, _arg_1));
            };
        }

        public function ___AnniversaryPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initSlot();
        }

        private function openFarmGamePanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_FARMMASTER);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank4Slot3():ItemSlot
        {
            return (this._320790861rank4Slot3);
        }

        [Bindable(event="propertyChange")]
        public function get rank1Slot5():ItemSlot
        {
            return (this._234903410rank1Slot5);
        }

        private function _AnniversaryPanel_DataGridColumn3_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Cống hiến";
            _local_1.dataField = "score";
            _local_1.width = 100;
            return (_local_1);
        }

        private function click(_arg_1:Event):void
        {
            var _local_2:Object = _arg_1.currentTarget;
            if ((_arg_1.currentTarget is subC1))
            {
                gameHorseRace();
            }
            else
            {
                if ((_arg_1.currentTarget is subC2))
                {
                    gameWasteland();
                }
                else
                {
                    if ((_arg_1.currentTarget is subC3))
                    {
                        gameThreeDiabetes();
                    }
                    else
                    {
                        if ((_arg_1.currentTarget is subC4))
                        {
                            openFarmGamePanel();
                        }
                        else
                        {
                            if ((_arg_1.currentTarget is subC5))
                            {
                                openStoneGamePanel();
                            }
                            else
                            {
                                if ((_arg_1.currentTarget is subC6))
                                {
                                    openCubeGamePanel();
                                }
                                else
                                {
                                    if ((_arg_1.currentTarget is subC7))
                                    {
                                        openSudokuPanel();
                                    }
                                    else
                                    {
                                        if ((_arg_1.currentTarget is subC8))
                                        {
                                            openDuiduipengPanel();
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank4Slot1():ItemSlot
        {
            return (this._320790859rank4Slot1);
        }

        override public function initialize():void
        {
            var target:AnniversaryPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AnniversaryPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_AnniversaryPanelWatcherSetupUtil");
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

        private function openDuiduipengPanel():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_DUIDUIPENG);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        private function _AnniversaryPanel_DataGridColumn11_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "XH";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        private function _AnniversaryPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ANNIVERSARY_LANG[0];
            _local_1 = ResManager.getIconUrl(4130220000723);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.ANNIVERSARY_LANG[2];
            _local_1 = pageTab.selectedIndex;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get totalCrossRank():DataGrid
        {
            return (this._2077431384totalCrossRank);
        }

        public function ___AnniversaryPanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            getRankByType(2);
        }

        [Bindable(event="propertyChange")]
        public function get totalContainer():Canvas
        {
            return (this._409271709totalContainer);
        }

        private function _AnniversaryPanel_DataGridColumn19_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Sv";
            _local_1.dataField = "server";
            return (_local_1);
        }

        private function _AnniversaryPanel_DataGridColumn2_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Tên";
            _local_1.dataField = "name";
            return (_local_1);
        }

        public function set perRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._679437591perRank;
            if (_local_2 !== _arg_1)
            {
                this._679437591perRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "perRank", _local_2, _arg_1));
            };
        }

        public function set rank5Slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._349420010rank5Slot1;
            if (_local_2 !== _arg_1)
            {
                this._349420010rank5Slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank5Slot1", _local_2, _arg_1));
            };
        }

        private function _AnniversaryPanel_DataGridColumn10_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "Điểm";
            _local_1.dataField = "score";
            _local_1.width = 100;
            return (_local_1);
        }

        public function set rank5Slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._349420011rank5Slot2;
            if (_local_2 !== _arg_1)
            {
                this._349420011rank5Slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank5Slot2", _local_2, _arg_1));
            };
        }

        public function set rank5Slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._349420012rank5Slot3;
            if (_local_2 !== _arg_1)
            {
                this._349420012rank5Slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank5Slot3", _local_2, _arg_1));
            };
        }

        public function set rank5Slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._349420014rank5Slot5;
            if (_local_2 !== _arg_1)
            {
                this._349420014rank5Slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank5Slot5", _local_2, _arg_1));
            };
        }

        public function set perCrossRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1352493073perCrossRank;
            if (_local_2 !== _arg_1)
            {
                this._1352493073perCrossRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "perCrossRank", _local_2, _arg_1));
            };
        }

        private function getAnniAward(_arg_1:uint):void
        {
            switch (_arg_1)
            {
                case 1:
                case 2:
                case 3:
                    _core.remote.call("getAnniversaryAward", null, _arg_1);
                    return;
                case 4:
                case 5:
                case 6:
                    _core.remote.call("getAnniversaryAwardFinal", null, (_arg_1 - 3));
                    return;
            };
        }

        public function set rank5Slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._349420013rank5Slot4;
            if (_local_2 !== _arg_1)
            {
                this._349420013rank5Slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rank5Slot4", _local_2, _arg_1));
            };
        }

        private function _AnniversaryPanel_DataGridColumn18_c():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _local_1.headerText = "XH";
            _local_1.dataField = "rank";
            _local_1.width = 50;
            return (_local_1);
        }

        public function set perTotalRank(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._967817459perTotalRank;
            if (_local_2 !== _arg_1)
            {
                this._967817459perTotalRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "perTotalRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rank5Slot2():ItemSlot
        {
            return (this._349420011rank5Slot2);
        }

        [Bindable(event="propertyChange")]
        public function get perCrossRank():DataGrid
        {
            return (this._1352493073perCrossRank);
        }

        [Bindable(event="propertyChange")]
        public function get rank5Slot1():ItemSlot
        {
            return (this._349420010rank5Slot1);
        }

        public function ___AnniversaryPanel_BasicDelayButton10_click(_arg_1:MouseEvent):void
        {
            getAnniAward(5);
        }

        [Bindable(event="propertyChange")]
        public function get rank5Slot4():ItemSlot
        {
            return (this._349420013rank5Slot4);
        }

        public function ___AnniversaryPanel_BasicDelayButton8_click(_arg_1:MouseEvent):void
        {
            getAnniAward(4);
        }

        [Bindable(event="propertyChange")]
        public function get rank5Slot3():ItemSlot
        {
            return (this._349420012rank5Slot3);
        }

        [Bindable(event="propertyChange")]
        public function get rank5Slot5():ItemSlot
        {
            return (this._349420014rank5Slot5);
        }


    }
}//package com.qeedoo.ui.view.compDragable

