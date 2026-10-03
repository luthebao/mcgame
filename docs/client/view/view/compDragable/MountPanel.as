// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MountPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ScrollTextArrCanvas;
    import mx.controls.Label;
    import mx.controls.LinkButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import flash.utils.Timer;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.PropertyBar;
    import mx.containers.ViewStack;
    import mx.controls.Image;
    import mx.controls.DataGrid;
    import mx.containers.Canvas;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.DelayButton;
    import com.qeedoo.ui.view.comp.PageSelector;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.config.Language;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.binding.BindingManager;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.ListEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import mx.core.ClassFactory;
    import mx.managers.PopUpManager;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import com.qeedoo.ui.utils.ToolKit;
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

    public class MountPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _109730812stExp:ScrollTextArrCanvas;
        private var _1421002864nextLevPro3:Label;
        public var _MountPanel_Label21:Label;
        private var _1421002867nextLevPro6:Label;
        public var _MountPanel_LinkButton1:LinkButton;
        public var _MountPanel_LinkButton2:LinkButton;
        public var _MountPanel_LinkButton3:LinkButton;
        public var _MountPanel_DataGridColumn1:DataGridColumn;
        public var _MountPanel_DataGridColumn2:DataGridColumn;
        public var _MountPanel_DataGridColumn3:DataGridColumn;
        private var _1148692631addPro5:Label;
        private var _69165797levPro5:Label;
        private var _123811004mountLev:Label;
        private var updateMountTimer:Timer = null;
        private var _1424435992nextUpLv:Label;
        private var PAGE_MAX_DRESS_NUM:int = 2;
        private var _1845920214upCostInfo:Label;
        private var selectedDress:int = 0;
        public var _alert:Alert;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _1177350943itemNum2:Label;
        private var _456826222mountLev2:Label;
        private var _1726777758normalGrowBtn:BasicGlowButton;
        private var _1289197386expBar:PropertyBar;
        private var _456180529upExpBar:PropertyBar;
        private var _69165795levPro3:Label;
        public var _MountPanel_BasicGlowButton9:BasicGlowButton;
        private var _114581tab:ViewStack;
        private var _456744072mountImg2:Image;
        private var _1699273611basicPro4:Label;
        public var _MountPanel_Label1:Label;
        public var _MountPanel_Label2:Label;
        public var _MountPanel_Label5:Label;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _934637100rideInGrowCanvasBtn:BasicGlowButton;
        private var _1421002863nextLevPro2:Label;
        private var _1285315961mountUpPro:DataGrid;
        private var _69165793levPro1:Label;
        private var _1699273609basicPro6:Label;
        private var rideIndex:int = 0;
        private var _1421002866nextLevPro5:Label;
        private var _1699273613basicPro2:Label;
        private var _123813654mountImg:Image;
        private var _1148692634addPro2:Label;
        private var _457068166mountTime:Label;
        public var _MountPanel_Canvas11:Canvas;
        public var _MountPanel_Canvas15:Canvas;
        private var _2057263455mountDataList:List;
        private var _69165798levPro6:Label;
        private var _1148692632addPro4:Label;
        private var _1472058084restBtnInGrowCanvasBtn:BasicGlowButton;
        private var _1421002862nextLevPro1:Label;
        private var _1126085605curUpLv:Label;
        private var _69165796levPro4:Label;
        private var _1148692630addPro6:Label;
        private var _456744071mountImg1:Image;
        private var _1177350942itemNum1:Label;
        private var _1177350944itemNum3:Label;
        private var _1699273610basicPro5:Label;
        private var _548908834curUpExp:Label;
        private var _1421002865nextLevPro4:Label;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _493431665renewBtn:DelayButton;
        private var _1197693508rideBtn:DelayButton;
        private var _69165794levPro2:Label;
        public var _MountPanel_Canvas2:Canvas;
        private var _1699273612basicPro3:Label;
        public var _MountPanel_Canvas7:Canvas;
        private var _607339634pageSelector:PageSelector;
        private var _1148692635addPro1:Label;
        public var _MountPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _466731719advancedGrowBtn:BasicGlowButton;
        private var _123817148mountExp:Label;
        private var _976038946feedBtn:DelayButton;
        public var _MountPanel_Label12:Label;
        private var _1699273614basicPro1:Label;
        public var _MountPanel_Label19:Label;
        private var _1351538778mountImgInGrowCanvas:Image;
        private var _1148692633addPro3:Label;
        public var _MountPanel_Label22:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":410,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MountPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":480,
                                "height":370,
                                "horizontalScrollPolicy":"off",
                                "x":10,
                                "y":35,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":3,
                                            "width":65,
                                            "styleName":"HorizontalTab",
                                            "height":23,
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":68,
                                            "y":3,
                                            "width":91,
                                            "styleName":"HorizontalTab",
                                            "height":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":158,
                                            "y":3,
                                            "width":65,
                                            "styleName":"HorizontalTab",
                                            "height":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":226,
                                            "y":3,
                                            "width":65,
                                            "styleName":"HorizontalTab",
                                            "height":23
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tab",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":480,
                                            "height":340,
                                            "x":0,
                                            "y":25,
                                            "tabEnabled":false,
                                            "styleName":"TabNavPlayer",
                                            "creationPolicy":"all",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_MountPanel_Canvas2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":12,
                                                                    "width":100,
                                                                    "height":320,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 14;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":10,
                                                                                "width":70,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":List,
                                                                        "id":"mountDataList",
                                                                        "events":{
                                                                            "itemClick":"__mountDataList_itemClick",
                                                                            "mouseDown":"__mountDataList_mouseDown"
                                                                        },
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0;
                                                                            this.right = "0";
                                                                            this.borderStyle = "none";
                                                                            this.left = "0";
                                                                            this.verticalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "horizontalScrollPolicy":"off",
                                                                                "height":230,
                                                                                "itemRenderer":_MountPanel_ClassFactory1_c()
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
                                                                    "x":108,
                                                                    "y":12,
                                                                    "width":197,
                                                                    "height":320,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 14;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":10,
                                                                                "height":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"mountLev",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":42,
                                                                                "width":175,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"mountTime",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":62,
                                                                                "width":185,
                                                                                "height":20,
                                                                                "htmlText":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"mountImg",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":86,
                                                                                "width":180,
                                                                                "height":180
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"rideBtn",
                                                                        "events":{"click":"__rideBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":2500,
                                                                                "x":20,
                                                                                "width":55,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"renewBtn",
                                                                        "events":{"click":"__renewBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":2500,
                                                                                "x":70,
                                                                                "width":50,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"feedBtn",
                                                                        "events":{"click":"__feedBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":2500,
                                                                                "x":120,
                                                                                "width":55,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
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
                                                                    "x":310,
                                                                    "y":12,
                                                                    "width":165,
                                                                    "height":155,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 14;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":10,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"basicPro1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":30,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"basicPro2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":50,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"basicPro3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":70,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"basicPro4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":90,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"basicPro5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":110,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"basicPro6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":130,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
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
                                                                    "x":310,
                                                                    "y":175,
                                                                    "width":165,
                                                                    "height":155,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label12",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 14;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":10,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"addPro1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":30,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"addPro2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":50,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"addPro3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":70,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"addPro4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":90,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"addPro5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":110,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"addPro6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":130,
                                                                                "width":140,
                                                                                "height":20,
                                                                                "text":""
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
                                                "id":"_MountPanel_Canvas7",
                                                "events":{"show":"___MountPanel_Canvas7_show"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":6,
                                                                    "y":12,
                                                                    "width":190,
                                                                    "height":318,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label19",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 14;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":10,
                                                                                "height":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"mountLev2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":30,
                                                                                "width":175,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"mountImgInGrowCanvas",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":160,
                                                                                "width":175,
                                                                                "x":6.5,
                                                                                "y":67
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"rideInGrowCanvasBtn",
                                                                        "events":{"click":"__rideInGrowCanvasBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "20";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "width":55,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"restBtnInGrowCanvasBtn",
                                                                        "events":{"click":"__restBtnInGrowCanvasBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "20";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":100,
                                                                                "width":55,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
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
                                                                    "x":198,
                                                                    "y":12,
                                                                    "width":272,
                                                                    "height":180,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label21",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":8,
                                                                                "y":10,
                                                                                "height":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_MountPanel_Label22",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":137,
                                                                                "y":10,
                                                                                "height":30
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"levPro1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":38,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"levPro2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":58,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"levPro3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":78,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"levPro4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":98,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"levPro5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":118,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"levPro6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":138,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextLevPro1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":152,
                                                                                "y":38,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextLevPro2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":152,
                                                                                "y":58,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextLevPro3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":152,
                                                                                "y":78,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextLevPro4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":152,
                                                                                "y":98,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextLevPro5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":152,
                                                                                "y":118,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextLevPro6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":152,
                                                                                "y":138,
                                                                                "height":20,
                                                                                "text":""
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
                                                                    "x":198,
                                                                    "y":200,
                                                                    "width":272,
                                                                    "height":130,
                                                                    "styleName":"CSSBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"mountExp",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "y":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":PropertyBar,
                                                                        "id":"expBar",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.cornerRadius = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "y":40,
                                                                                "width":222,
                                                                                "height":14,
                                                                                "showTip":true,
                                                                                "barCornerRadius":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ScrollTextArrCanvas,
                                                                        "id":"stExp",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":165,
                                                                                "y":55
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"normalGrowBtn",
                                                                        "events":{"click":"__normalGrowBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":40,
                                                                                "y":70,
                                                                                "width":86,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"advancedGrowBtn",
                                                                        "events":{"click":"__advancedGrowBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":144,
                                                                                "y":70,
                                                                                "width":108,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"itemNum1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFF0000;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":13,
                                                                                "y":98,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"_MountPanel_LinkButton1",
                                                                        "events":{"click":"___MountPanel_LinkButton1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.textDecoration = "underline";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":200,
                                                                                "y":98
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
                                                "id":"_MountPanel_Canvas11",
                                                "events":{"show":"___MountPanel_Canvas11_show"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":12,
                                                                    "width":460,
                                                                    "height":170,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"mountImg1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":160,
                                                                                "width":175,
                                                                                "x":10,
                                                                                "y":5
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"mountImg2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":160,
                                                                                "width":175,
                                                                                "x":263,
                                                                                "y":5
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"curUpLv",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":10,
                                                                                "width":40,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nextUpLv",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":275,
                                                                                "y":10,
                                                                                "width":40,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":40,
                                                                                "width":40,
                                                                                "x":204,
                                                                                "y":62
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
                                                                    "x":10,
                                                                    "y":185,
                                                                    "width":212,
                                                                    "height":150,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"mountUpPro",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":20,
                                                                                "y":0,
                                                                                "height":145,
                                                                                "verticalScrollPolicy":"off",
                                                                                "columns":[_MountPanel_DataGridColumn1_i(), _MountPanel_DataGridColumn2_i(), _MountPanel_DataGridColumn3_i()]
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
                                                                    "x":230,
                                                                    "y":185,
                                                                    "width":240,
                                                                    "height":150,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"curUpExp",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 15116365;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":25
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":PropertyBar,
                                                                        "id":"upExpBar",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.cornerRadius = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":45,
                                                                                "width":210,
                                                                                "height":14,
                                                                                "showTip":true,
                                                                                "barCornerRadius":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_MountPanel_BasicGlowButton9",
                                                                        "events":{"click":"___MountPanel_BasicGlowButton9_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":170,
                                                                                "y":80,
                                                                                "width":60,
                                                                                "height":20,
                                                                                "styleName":"BtnStdGreen"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"upCostInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":3,
                                                                                "y":81,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"itemNum2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFF0000;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":102,
                                                                                "width":150,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"itemNum3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFF0000;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":15,
                                                                                "y":122,
                                                                                "width":150,
                                                                                "height":20,
                                                                                "text":""
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"_MountPanel_LinkButton2",
                                                                        "events":{"click":"___MountPanel_LinkButton2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.textDecoration = "underline";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":163,
                                                                                "y":118
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
                                                "id":"_MountPanel_Canvas15",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":12,
                                                                    "width":460,
                                                                    "height":318,
                                                                    "styleName":"CSSBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":PageSelector,
                                                                        "id":"pageSelector",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":149.5,
                                                                                "y":270,
                                                                                "width":159,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"_MountPanel_LinkButton3",
                                                                        "events":{"click":"___MountPanel_LinkButton3_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "5";
                                                                            this.bottom = "5";
                                                                            this.color = 0xFFFFFF;
                                                                            this.textDecoration = "underline";
                                                                            this.fontSize = 12;
                                                                            this.fontWeight = "normal";
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
                    })]
                });
            }
        });
        private var MountProArray:Array = [Language.MOUNTPANEL_U[14], Language.MOUNTPANEL_U[15], Language.MOUNTPANEL_U[16], Language.MOUNTPANEL_U[17], Language.MOUNTPANEL_U[18], Language.MOUNTPANEL_U[35]];
        private var AddProNumArray:Array = ["lifeBasic", "phyAttackBasic", "magAttackBasic", "phyDefenseBasic", "magDefenseBasic", "debuffBasic"];
        private var AddProPerArray:Array = ["lifePer", "phyAttackPer", "magAttackPer", "phyDefensePer", "magDefensePer", "debuffPer"];
        private var MountInfoArr:Array = ["exp", "addRate", "lev", "upLv"];
        private var dressAddProNum:Object = new Object();
        private var dressAddProPer:Object = new Object();
        private var mountDressAc:ArrayCollection = new ArrayCollection();
        private var mountDressList:Object = new Object();
        private var _core:Core = Core.getInstance();
        private var mountData:Object = new Object();
        private var MountDressBuyArr:ArrayCollection = new ArrayCollection();
        private var MountDressBuyList:Object = new Object();
        private var DressResMap:Dictionary = new Dictionary();
        public var dressTimeObj:Object = new Object();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MountPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 410;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MountPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MountPanel._watcherSetupUtil = _arg_1;
        }


        public function ___MountPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function __feedBtn_click(_arg_1:MouseEvent):void
        {
            stopMount();
        }

        public function set restBtnInGrowCanvasBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1472058084restBtnInGrowCanvasBtn;
            if (_local_2 !== _arg_1)
            {
                this._1472058084restBtnInGrowCanvasBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restBtnInGrowCanvasBtn", _local_2, _arg_1));
            };
        }

        public function set stExp(_arg_1:ScrollTextArrCanvas):void
        {
            var _local_2:Object = this._109730812stExp;
            if (_local_2 !== _arg_1)
            {
                this._109730812stExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stExp", _local_2, _arg_1));
            };
        }

        public function showMountDressShop():void
        {
            initDressBuyList();
            initPageSelector();
            updateShopView();
        }

        private function refreshMountOvertimeDate(_arg_1:Object):void
        {
            var _local_3:Date;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = mountDressAc.getItemAt(mountDataList.selectedIndex);
            if ((((_local_2) && (_local_2.id)) && (_local_2.id == _arg_1.id)))
            {
                setOverdueTime(_arg_1.time);
                if (_arg_1.time > 1)
                {
                    _local_3 = new Date(_arg_1.time);
                    _core.sysMsg(Language.MOUNTPANEL_U[70].toString().replace("{year}", _local_3.getFullYear()).replace("{month}", (_local_3.getMonth() + 1)).replace("{day}", _local_3.getDate()).replace("{hour}", _local_3.getHours()).replace("{minute}", _local_3.getMinutes()));
                    dressTimeObj[_arg_1.id] = _arg_1.time;
                    _core.view.getUI(ViewManager.MAIN_LONGBUFF).dressTimeObj = dressTimeObj;
                    _core.view.getUI(ViewManager.MAIN_LONGBUFF).resetMountDressTimer();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get stExp():ScrollTextArrCanvas
        {
            return (this._109730812stExp);
        }

        public function ___MountPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            showRule(2);
        }

        private function _MountPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MountPanel_DataGridColumn3 = _local_1;
            _local_1.width = 65;
            _local_1.dataField = "nextPro";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_MountPanel_DataGridColumn3", _MountPanel_DataGridColumn3);
            return (_local_1);
        }

        public function ___MountPanel_BasicGlowButton9_click(_arg_1:MouseEvent):void
        {
            advancedMount();
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabClick(3);
        }

        public function __advancedGrowBtn_click(_arg_1:MouseEvent):void
        {
            feedMount(2);
        }

        public function set itemNum3(_arg_1:Label):void
        {
            var _local_2:Object = this._1177350944itemNum3;
            if (_local_2 !== _arg_1)
            {
                this._1177350944itemNum3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum3", _local_2, _arg_1));
            };
        }

        public function set itemNum1(_arg_1:Label):void
        {
            var _local_2:Object = this._1177350942itemNum1;
            if (_local_2 !== _arg_1)
            {
                this._1177350942itemNum1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum1", _local_2, _arg_1));
            };
        }

        public function set curUpExp(_arg_1:Label):void
        {
            var _local_2:Object = this._548908834curUpExp;
            if (_local_2 !== _arg_1)
            {
                this._548908834curUpExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curUpExp", _local_2, _arg_1));
            };
        }

        public function set nextUpLv(_arg_1:Label):void
        {
            var _local_2:Object = this._1424435992nextUpLv;
            if (_local_2 !== _arg_1)
            {
                this._1424435992nextUpLv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextUpLv", _local_2, _arg_1));
            };
        }

        private function _MountPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MountPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Canvas2.label = _arg_1;
            }, "_MountPanel_Canvas2.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label1.text = _arg_1;
            }, "_MountPanel_Label1.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label1.filters = _arg_1;
            }, "_MountPanel_Label1.filters");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label2.text = _arg_1;
            }, "_MountPanel_Label2.text");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label2.filters = _arg_1;
            }, "_MountPanel_Label2.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rideBtn.label = _arg_1;
            }, "rideBtn.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                renewBtn.label = _arg_1;
            }, "renewBtn.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                feedBtn.label = _arg_1;
            }, "feedBtn.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label5.text = _arg_1;
            }, "_MountPanel_Label5.text");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label5.filters = _arg_1;
            }, "_MountPanel_Label5.filters");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label12.text = _arg_1;
            }, "_MountPanel_Label12.text");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label12.filters = _arg_1;
            }, "_MountPanel_Label12.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Canvas7.label = _arg_1;
            }, "_MountPanel_Canvas7.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label19.text = _arg_1;
            }, "_MountPanel_Label19.text");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label19.filters = _arg_1;
            }, "_MountPanel_Label19.filters");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rideInGrowCanvasBtn.label = _arg_1;
            }, "rideInGrowCanvasBtn.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                restBtnInGrowCanvasBtn.label = _arg_1;
            }, "restBtnInGrowCanvasBtn.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label21.text = _arg_1;
            }, "_MountPanel_Label21.text");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label21.filters = _arg_1;
            }, "_MountPanel_Label21.filters");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Label22.text = _arg_1;
            }, "_MountPanel_Label22.text");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _MountPanel_Label22.filters = _arg_1;
            }, "_MountPanel_Label22.filters");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mountExp.text = _arg_1;
            }, "mountExp.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                expBar.propName = _arg_1;
            }, "expBar.propName");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                normalGrowBtn.label = _arg_1;
            }, "normalGrowBtn.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[43].replace("{num}", 1);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                normalGrowBtn.toolTip = _arg_1;
            }, "normalGrowBtn.toolTip");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                advancedGrowBtn.label = _arg_1;
            }, "advancedGrowBtn.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[43].replace("{num}", 10);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                advancedGrowBtn.toolTip = _arg_1;
            }, "advancedGrowBtn.toolTip");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_LinkButton1.label = _arg_1;
            }, "_MountPanel_LinkButton1.label");
            result[32] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_MountPanel_LinkButton1.overSkin");
            result[33] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_MountPanel_LinkButton1.upSkin");
            result[34] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_MountPanel_LinkButton1.downSkin");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Canvas11.label = _arg_1;
            }, "_MountPanel_Canvas11.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_DataGridColumn1.headerText = _arg_1;
            }, "_MountPanel_DataGridColumn1.headerText");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_DataGridColumn2.headerText = _arg_1;
            }, "_MountPanel_DataGridColumn2.headerText");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_DataGridColumn3.headerText = _arg_1;
            }, "_MountPanel_DataGridColumn3.headerText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                curUpExp.text = _arg_1;
            }, "curUpExp.text");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upExpBar.propName = _arg_1;
            }, "upExpBar.propName");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_BasicGlowButton9.label = _arg_1;
            }, "_MountPanel_BasicGlowButton9.label");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_LinkButton2.label = _arg_1;
            }, "_MountPanel_LinkButton2.label");
            result[43] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_MountPanel_LinkButton2.overSkin");
            result[44] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_MountPanel_LinkButton2.upSkin");
            result[45] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_MountPanel_LinkButton2.downSkin");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_Canvas15.label = _arg_1;
            }, "_MountPanel_Canvas15.label");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MOUNTPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MountPanel_LinkButton3.label = _arg_1;
            }, "_MountPanel_LinkButton3.label");
            result[48] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton3.setStyle("overSkin", _arg_1);
            }, "_MountPanel_LinkButton3.overSkin");
            result[49] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton3.setStyle("upSkin", _arg_1);
            }, "_MountPanel_LinkButton3.upSkin");
            result[50] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _MountPanel_LinkButton3.setStyle("downSkin", _arg_1);
            }, "_MountPanel_LinkButton3.downSkin");
            result[51] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get rideBtn():DelayButton
        {
            return (this._1197693508rideBtn);
        }

        public function __restBtnInGrowCanvasBtn_click(_arg_1:MouseEvent):void
        {
            stopMount();
        }

        public function __mountDataList_itemClick(_arg_1:ListEvent):void
        {
            onClickMountDress();
        }

        public function ___MountPanel_Canvas7_show(_arg_1:FlexEvent):void
        {
            showMountLevelCanvas();
        }

        private function _MountPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MountPanel_DataGridColumn2 = _local_1;
            _local_1.width = 65;
            _local_1.dataField = "curPro";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_MountPanel_DataGridColumn2", _MountPanel_DataGridColumn2);
            return (_local_1);
        }

        public function set itemNum2(_arg_1:Label):void
        {
            var _local_2:Object = this._1177350943itemNum2;
            if (_local_2 !== _arg_1)
            {
                this._1177350943itemNum2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemNum2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPro2():Label
        {
            return (this._1421002863nextLevPro2);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPro4():Label
        {
            return (this._1421002865nextLevPro4);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro2():Label
        {
            return (this._1699273613basicPro2);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro4():Label
        {
            return (this._1699273611basicPro4);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro6():Label
        {
            return (this._1699273609basicPro6);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro3():Label
        {
            return (this._1699273612basicPro3);
        }

        [Bindable(event="propertyChange")]
        public function get basicPro5():Label
        {
            return (this._1699273610basicPro5);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPro3():Label
        {
            return (this._1421002864nextLevPro3);
        }

        [Bindable(event="propertyChange")]
        public function get normalGrowBtn():BasicGlowButton
        {
            return (this._1726777758normalGrowBtn);
        }

        [Bindable(event="propertyChange")]
        public function get mountTime():Label
        {
            return (this._457068166mountTime);
        }

        [Bindable(event="propertyChange")]
        public function get mountImg1():Image
        {
            return (this._456744071mountImg1);
        }

        public function set mountExp(_arg_1:Label):void
        {
            var _local_2:Object = this._123817148mountExp;
            if (_local_2 !== _arg_1)
            {
                this._123817148mountExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get basicPro1():Label
        {
            return (this._1699273614basicPro1);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPro6():Label
        {
            return (this._1421002867nextLevPro6);
        }

        public function updateMountDressList(_arg_1:int, _arg_2:int, _arg_3:Number):void
        {
            var _local_6:Boolean;
            var _local_7:*;
            var _local_8:String;
            if (!this.initialized)
            {
                return;
            };
            var _local_4:Object = GameData.d[GamePredef.TBL_MOUNT_DRESS][_arg_2];
            if (!_local_4)
            {
                return;
            };
            var _local_5:Object = new Object();
            _local_5.id = _arg_2;
            _local_5.name = _local_4.name;
            if (_arg_1 == 1)
            {
                if (!mountDressList)
                {
                    mountDressList = new Object();
                };
                mountDressList[_arg_2] = _arg_2;
                _local_5.iconCode = _local_4.iconCode;
                for (_local_7 in mountDressAc)
                {
                    if (mountDressAc[_local_7].id == _arg_2)
                    {
                        _local_6 = true;
                    };
                };
                if (!_local_6)
                {
                    mountDressAc.addItem(_local_5);
                };
                mountDataList.dataProvider = mountDressAc;
                dressTimeObj[_arg_2] = _arg_3;
                updateDressBuyList(_local_5, 2);
            }
            else
            {
                if (((!(mountDressList)) || (!(mountDressList[_arg_2]))))
                {
                    return;
                };
                delete mountDressList[_arg_2];
                if (dressTimeObj[_arg_2])
                {
                    delete dressTimeObj[_arg_2];
                };
                for (_local_7 in mountDressAc)
                {
                    if (mountDressAc.getItemAt(_local_7).id == _arg_2)
                    {
                        mountDressAc.removeItemAt(_local_7);
                        break;
                    };
                };
                mountDataList.dataProvider = mountDressAc;
                mountDataList.selectedIndex = 0;
                onClickMountDress();
                _local_5.sort1 = _local_5.id;
                _local_5.price = _local_4.gold;
                if (DressResMap[_local_4.iconCode])
                {
                    _local_8 = DressResMap[_local_4.iconCode];
                }
                else
                {
                    _local_8 = ResManager.hash(ResManager.getIconUrlNoHash(_local_4.iconCode));
                };
                _local_5.url = _local_8;
                updateDressBuyList(_local_5, 1);
            };
            updateDressAddPro(mountDressList);
            updateMountInfoView(true, true);
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).dressTimeObj = dressTimeObj;
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).resetMountDressTimer();
        }

        private function _MountPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MOUNTPANEL_U[0];
            _local_1 = Language.MOUNTPANEL_U[1];
            _local_1 = Language.MOUNTPANEL_U[2];
            _local_1 = Language.MOUNTPANEL_U[3];
            _local_1 = Language.MOUNTPANEL_U[4];
            _local_1 = Language.MOUNTPANEL_U[1];
            _local_1 = Language.MOUNTPANEL_U[5];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[19];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[10];
            _local_1 = Language.MOUNTPANEL_U[68];
            _local_1 = Language.MOUNTPANEL_U[20];
            _local_1 = Language.MOUNTPANEL_U[12];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[13];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[2];
            _local_1 = Language.MOUNTPANEL_U[19];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[10];
            _local_1 = Language.MOUNTPANEL_U[20];
            _local_1 = Language.MOUNTPANEL_U[21];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[22];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.MOUNTPANEL_U[26];
            _local_1 = Language.MOUNTPANEL_U[26];
            _local_1 = Language.MOUNTPANEL_U[23];
            _local_1 = Language.MOUNTPANEL_U[43].replace("{num}", 1);
            _local_1 = Language.MOUNTPANEL_U[24];
            _local_1 = Language.MOUNTPANEL_U[43].replace("{num}", 10);
            _local_1 = Language.MOUNTPANEL_U[25];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.MOUNTPANEL_U[3];
            _local_1 = Language.MOUNTPANEL_U[28];
            _local_1 = Language.MOUNTPANEL_U[29];
            _local_1 = Language.MOUNTPANEL_U[30];
            _local_1 = Language.MOUNTPANEL_U[33];
            _local_1 = Language.MOUNTPANEL_U[33];
            _local_1 = Language.MOUNTPANEL_U[34];
            _local_1 = Language.MOUNTPANEL_U[25];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.MOUNTPANEL_U[4];
            _local_1 = Language.MOUNTPANEL_U[25];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
        }

        [Bindable(event="propertyChange")]
        public function get mountImg2():Image
        {
            return (this._456744072mountImg2);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPro1():Label
        {
            return (this._1421002862nextLevPro1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        public function set mountLev(_arg_1:Label):void
        {
            var _local_2:Object = this._123811004mountLev;
            if (_local_2 !== _arg_1)
            {
                this._123811004mountLev = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountLev", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get renewBtn():DelayButton
        {
            return (this._493431665renewBtn);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevPro5():Label
        {
            return (this._1421002866nextLevPro5);
        }

        [Bindable(event="propertyChange")]
        public function get mountDataList():List
        {
            return (this._2057263455mountDataList);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        public function updateShopView(_arg_1:int=0, _arg_2:int=0):void
        {
            if (pageSelector.totalItemCount == 0)
            {
                return;
            };
            if (((pageSelector.pageNo * PAGE_MAX_DRESS_NUM) + 1) < MountDressBuyArr.length)
            {
            };
        }

        private function _MountPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _MountPanel_DataGridColumn1 = _local_1;
            _local_1.width = 80;
            _local_1.dataField = "name";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_MountPanel_DataGridColumn1", _MountPanel_DataGridColumn1);
            return (_local_1);
        }

        public function changeRideState(_arg_1:int):void
        {
            var _local_3:Object;
            var _local_4:*;
            var _local_5:Object;
            if (!this.initialized)
            {
                return;
            };
            if (mountDataList.selectedIndex > (mountDressAc.length - 1))
            {
                return;
            };
            if (mountDataList.selectedIndex < 0)
            {
                mountDataList.selectedIndex = rideIndex;
            };
            var _local_2:Object = mountDressAc.getItemAt(mountDataList.selectedIndex);
            if (_arg_1 == 1)
            {
                if (rideIndex >= mountDressAc.length)
                {
                    return;
                };
                _local_3 = mountDressAc.getItemAt(rideIndex);
                if (rideIndex != mountDataList.selectedIndex)
                {
                    _local_5 = GameData.d[GamePredef.TBL_MOUNT_DRESS][_local_3.id];
                    if (!_local_5)
                    {
                        return;
                    };
                    _local_3.name = _local_5.name;
                    rideIndex = mountDataList.selectedIndex;
                };
                _core.view.getUI(ViewManager.MAIN_LONGBUFF).useMountDress = Number(_local_2.id);
                _local_4 = _local_2.name;
                _local_2.name = ("Đang cưỡi  " + _local_4);
                _core.view.getUI(ViewManager.PANEL_CHARACTOR).updateMount();
            }
            else
            {
                _local_5 = GameData.d[GamePredef.TBL_MOUNT_DRESS][_local_2.id];
                if (!_local_5)
                {
                    return;
                };
                _local_2.name = _local_5.name;
            };
            mountDataList.dataProvider = mountDressAc;
        }

        [Bindable(event="propertyChange")]
        public function get mountImgInGrowCanvas():Image
        {
            return (this._1351538778mountImgInGrowCanvas);
        }

        public function getMountData(_arg_1:int, _arg_2:int):Object
        {
            var _local_4:*;
            var _local_5:Object;
            var _local_6:int;
            var _local_3:Object = _core.data.gameDataIndex[GamePredef.TBL_MOUNT][_arg_2];
            for (_local_4 in _local_3)
            {
                if (((_local_3[_local_4]) && (int(_local_3[_local_4].level) == _arg_1)))
                {
                    return (_local_3[_local_4]);
                };
            };
            _local_5 = new Object();
            _local_6 = 0;
            while (_local_6 < 6)
            {
                _local_5[AddProNumArray[_local_6]] = 0;
                _local_5[AddProPerArray[_local_6]] = 0;
                _local_6++;
            };
            return (_local_5);
        }

        public function set mountImgInGrowCanvas(_arg_1:Image):void
        {
            var _local_2:Object = this._1351538778mountImgInGrowCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1351538778mountImgInGrowCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountImgInGrowCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get expBar():PropertyBar
        {
            return (this._1289197386expBar);
        }

        public function set addPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692635addPro1;
            if (_local_2 !== _arg_1)
            {
                this._1148692635addPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro1", _local_2, _arg_1));
            };
        }

        public function set addPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692633addPro3;
            if (_local_2 !== _arg_1)
            {
                this._1148692633addPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro3", _local_2, _arg_1));
            };
        }

        public function set addPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692631addPro5;
            if (_local_2 !== _arg_1)
            {
                this._1148692631addPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro5", _local_2, _arg_1));
            };
        }

        public function set addPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692632addPro4;
            if (_local_2 !== _arg_1)
            {
                this._1148692632addPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro4", _local_2, _arg_1));
            };
        }

        public function ___MountPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            showRule(1);
        }

        public function updateDressAddPro(_arg_1:Object):void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:int;
            var _local_2:int;
            while (_local_2 < 6)
            {
                dressAddProNum[AddProNumArray[_local_2]] = 0;
                dressAddProPer[AddProPerArray[_local_2]] = 0;
                _local_2++;
            };
            for (_local_3 in _arg_1)
            {
                _local_4 = GameData.d[GamePredef.TBL_MOUNT_DRESS][int(_arg_1[_local_3])];
                if (_local_4)
                {
                    _local_5 = 0;
                    while (_local_5 < 6)
                    {
                        dressAddProNum[AddProNumArray[_local_5]] = (dressAddProNum[AddProNumArray[_local_5]] + Number(_local_4[AddProNumArray[_local_5]]));
                        dressAddProPer[AddProPerArray[_local_5]] = (dressAddProPer[AddProPerArray[_local_5]] + Number(_local_4[AddProPerArray[_local_5]]));
                        _local_5++;
                    };
                };
            };
            updateMountInfoView(true, true);
        }

        public function set mountLev2(_arg_1:Label):void
        {
            var _local_2:Object = this._456826222mountLev2;
            if (_local_2 !== _arg_1)
            {
                this._456826222mountLev2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountLev2", _local_2, _arg_1));
            };
        }

        public function set nextLevPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1421002863nextLevPro2;
            if (_local_2 !== _arg_1)
            {
                this._1421002863nextLevPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPro2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get advancedGrowBtn():BasicGlowButton
        {
            return (this._466731719advancedGrowBtn);
        }

        public function showMountUpLevCanvas():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get levPro1():Label
        {
            return (this._69165793levPro1);
        }

        [Bindable(event="propertyChange")]
        public function get levPro2():Label
        {
            return (this._69165794levPro2);
        }

        public function set addPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692630addPro6;
            if (_local_2 !== _arg_1)
            {
                this._1148692630addPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro6", _local_2, _arg_1));
            };
        }

        public function set addPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1148692634addPro2;
            if (_local_2 !== _arg_1)
            {
                this._1148692634addPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addPro2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levPro5():Label
        {
            return (this._69165797levPro5);
        }

        public function set basicPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273613basicPro2;
            if (_local_2 !== _arg_1)
            {
                this._1699273613basicPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro2", _local_2, _arg_1));
            };
        }

        public function set nextLevPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._1421002864nextLevPro3;
            if (_local_2 !== _arg_1)
            {
                this._1421002864nextLevPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPro3", _local_2, _arg_1));
            };
        }

        public function set basicPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273612basicPro3;
            if (_local_2 !== _arg_1)
            {
                this._1699273612basicPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro3", _local_2, _arg_1));
            };
        }

        public function __mountDataList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set basicPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273611basicPro4;
            if (_local_2 !== _arg_1)
            {
                this._1699273611basicPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro4", _local_2, _arg_1));
            };
        }

        private function initPageSelector():void
        {
            pageSelector.lastBtnLabel = Language.PAGE_SELECTOR[2];
            pageSelector.nextBtnLabel = Language.PAGE_SELECTOR[3];
            pageSelector.btnLastPage.width = 32;
            pageSelector.btnNextPage.width = 32;
            pageSelector.onPageChanged = updateShopView;
            pageSelector.initPageSeletor(this.MountDressBuyArr.length, PAGE_MAX_DRESS_NUM);
        }

        [Bindable(event="propertyChange")]
        public function get levPro6():Label
        {
            return (this._69165798levPro6);
        }

        private function _MountPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = MountPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get mountImg():Image
        {
            return (this._123813654mountImg);
        }

        public function tabClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            var _local_2:* = 0;
            while (_local_2 <= 3)
            {
                this[("tabBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("tabBtn" + _arg_1)].selected = true;
        }

        public function set basicPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273609basicPro6;
            if (_local_2 !== _arg_1)
            {
                this._1699273609basicPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro6", _local_2, _arg_1));
            };
        }

        public function beginMount(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                if (((!(mountDressAc.length)) || (mountDataList.selectedIndex > (mountDressAc.length - 1))))
                {
                    return;
                };
                if (mountDataList.selectedIndex < 0)
                {
                    mountDataList.selectedIndex = 0;
                };
            }
            else
            {
                if (this.selectedDress >= 0)
                {
                    mountDataList.selectedIndex = selectedDress;
                }
                else
                {
                    mountDataList.selectedIndex = 0;
                };
            };
            var _local_2:Object = mountDressAc.getItemAt(mountDataList.selectedIndex);
            if (((_local_2) && (_local_2.id)))
            {
                _core.player.beginMounting(_local_2.id);
                _core.view.getUI(ViewManager.MAIN_LONGBUFF).useMountDress = Number(_local_2.id);
            };
        }

        public function set mountUpPro(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1285315961mountUpPro;
            if (_local_2 !== _arg_1)
            {
                this._1285315961mountUpPro = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountUpPro", _local_2, _arg_1));
            };
        }

        public function set nextLevPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._1421002865nextLevPro4;
            if (_local_2 !== _arg_1)
            {
                this._1421002865nextLevPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPro4", _local_2, _arg_1));
            };
        }

        public function set normalGrowBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1726777758normalGrowBtn;
            if (_local_2 !== _arg_1)
            {
                this._1726777758normalGrowBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "normalGrowBtn", _local_2, _arg_1));
            };
        }

        public function set nextLevPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1421002862nextLevPro1;
            if (_local_2 !== _arg_1)
            {
                this._1421002862nextLevPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPro1", _local_2, _arg_1));
            };
        }

        public function set basicPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273610basicPro5;
            if (_local_2 !== _arg_1)
            {
                this._1699273610basicPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levPro3():Label
        {
            return (this._69165795levPro3);
        }

        public function set basicPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._1699273614basicPro1;
            if (_local_2 !== _arg_1)
            {
                this._1699273614basicPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicPro1", _local_2, _arg_1));
            };
        }

        public function set nextLevPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._1421002867nextLevPro6;
            if (_local_2 !== _arg_1)
            {
                this._1421002867nextLevPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPro6", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabClick(2);
        }

        public function set mountImg1(_arg_1:Image):void
        {
            var _local_2:Object = this._456744071mountImg1;
            if (_local_2 !== _arg_1)
            {
                this._456744071mountImg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountImg1", _local_2, _arg_1));
            };
        }

        public function ___MountPanel_Canvas11_show(_arg_1:FlexEvent):void
        {
            showMountUpLevCanvas();
        }

        public function set mountImg2(_arg_1:Image):void
        {
            var _local_2:Object = this._456744072mountImg2;
            if (_local_2 !== _arg_1)
            {
                this._456744072mountImg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountImg2", _local_2, _arg_1));
            };
        }

        public function set mountTime(_arg_1:Label):void
        {
            var _local_2:Object = this._457068166mountTime;
            if (_local_2 !== _arg_1)
            {
                this._457068166mountTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountTime", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function advancedMount():void
        {
            var _local_3:*;
            var _local_5:int;
            var _local_1:Object = _core.data.gameDataIndex[GamePredef.TBL_MOUNT][2];
            var _local_2:int;
            for (_local_3 in _local_1)
            {
                if (_local_1[_local_3])
                {
                    _local_2++;
                };
            };
            if (this.mountData.upLv >= (_local_2 - 1))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.MOUNTPANEL_U[53], "", Alert.YES, null, null);
                return;
            };
            var _local_4:Object = getMountData(this.mountData.upLv, 2);
            if (!_local_4)
            {
                return;
            };
            if (this.mountData.upLv < 8)
            {
                _local_5 = _core.getItemNum(29, GamePredef.MOUNT_UPLEV_ITEM).num;
            }
            else
            {
                _local_5 = _core.getItemNum(29, GamePredef.ADV_MOUNT_UPLEV_ITEM).num;
            };
            if (_local_5 < _local_4.itemNum)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.MOUNTPANEL_U[46], "", Alert.YES, null, null);
                return;
            };
            _core.remote.call("addMountUpExp", null, null);
        }

        [Bindable(event="propertyChange")]
        public function get nextUpLv():Label
        {
            return (this._1424435992nextUpLv);
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

        public function feedMount(_arg_1:int):*
        {
            var _local_2:Object = getMountData(this.mountData.upLv, 2);
            if (!_local_2)
            {
                return;
            };
            if (this.mountData.lev >= _local_2.mountLevLimit)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.MOUNTPANEL_U[52], "", Alert.YES, null, null);
                return;
            };
            var _local_3:int = _core.getItemNum(29, GamePredef.MOUNT_LEV_ITEM).num;
            var _local_4:int = 1;
            if (_arg_1 != 1)
            {
                _local_4 = 10;
            };
            if (_local_3 < _local_4)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.MOUNTPANEL_U[45], "", Alert.YES, null, null);
                return;
            };
            _core.remote.call("addMountExp", null, _arg_1);
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

        [Bindable(event="propertyChange")]
        public function get itemNum3():Label
        {
            return (this._1177350944itemNum3);
        }

        public function setMountData(_arg_1:Object):void
        {
            var _local_2:*;
            for (_local_2 in MountInfoArr)
            {
                if (_arg_1.hasOwnProperty(MountInfoArr[_local_2]))
                {
                    mountData[MountInfoArr[_local_2]] = _arg_1[MountInfoArr[_local_2]];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get curUpExp():Label
        {
            return (this._548908834curUpExp);
        }

        [Bindable(event="propertyChange")]
        public function get itemNum1():Label
        {
            return (this._1177350942itemNum1);
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levPro4():Label
        {
            return (this._69165796levPro4);
        }

        [Bindable(event="propertyChange")]
        public function get itemNum2():Label
        {
            return (this._1177350943itemNum2);
        }

        public function set rideBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1197693508rideBtn;
            if (_local_2 !== _arg_1)
            {
                this._1197693508rideBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rideBtn", _local_2, _arg_1));
            };
        }

        public function set renewBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._493431665renewBtn;
            if (_local_2 !== _arg_1)
            {
                this._493431665renewBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "renewBtn", _local_2, _arg_1));
            };
        }

        public function stopMount():void
        {
            _core.player.stopMounting();
        }

        public function set nextLevPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._1421002866nextLevPro5;
            if (_local_2 !== _arg_1)
            {
                this._1421002866nextLevPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevPro5", _local_2, _arg_1));
            };
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

        public function initDressBuyList():void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:String;
            var _local_1:int;
            MountDressBuyArr = new ArrayCollection();
            MountDressBuyList = new Object();
            var _local_2:Object = _core.data.gameDataIndex[GamePredef.TBL_MOUNT_DRESS][2];
            for (_local_3 in _local_2)
            {
                if (!mountDressList[_local_2[_local_3]["id"]])
                {
                    _local_4 = new Object();
                    _local_4.id = _local_2[_local_3]["id"];
                    _local_4.name = _local_2[_local_3]["name"];
                    if (DressResMap[_local_2[_local_3]["iconCode"]])
                    {
                        _local_5 = DressResMap[_local_2[_local_3]["iconCode"]];
                    }
                    else
                    {
                        _local_5 = ResManager.hash(ResManager.getIconUrlNoHash(_local_2[_local_3]["iconCode"]));
                    };
                    _local_4.url = _local_5;
                    _local_4.price = _local_2[_local_3]["gold"];
                    _local_4.sort1 = _local_4.id;
                    MountDressBuyArr.addItem(_local_4);
                    MountDressBuyList[_local_2[_local_3]["id"]] = _local_4;
                };
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

        public function set mountDataList(_arg_1:List):void
        {
            var _local_2:Object = this._2057263455mountDataList;
            if (_local_2 !== _arg_1)
            {
                this._2057263455mountDataList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountDataList", _local_2, _arg_1));
            };
        }

        public function showMountLevelCanvas():void
        {
            if (this.selectedDress > (this.mountDressAc.length - 1))
            {
                return;
            };
            var _local_1:Object = this.mountDressAc.getItemAt(this.selectedDress);
            var _local_2:* = "";
            if (DressResMap[_local_1.iconCode])
            {
                _local_2 = DressResMap[_local_1.iconCode];
            }
            else
            {
                _local_2 = ResManager.hash(ResManager.getIconUrlNoHash(_local_1.iconCode));
            };
            mountImgInGrowCanvas.source = _local_2;
        }

        [Bindable(event="propertyChange")]
        public function get upExpBar():PropertyBar
        {
            return (this._456180529upExpBar);
        }

        [Bindable(event="propertyChange")]
        public function get mountExp():Label
        {
            return (this._123817148mountExp);
        }

        [Bindable(event="propertyChange")]
        public function get restBtnInGrowCanvasBtn():BasicGlowButton
        {
            return (this._1472058084restBtnInGrowCanvasBtn);
        }

        public function set upExpBar(_arg_1:PropertyBar):void
        {
            var _local_2:Object = this._456180529upExpBar;
            if (_local_2 !== _arg_1)
            {
                this._456180529upExpBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upExpBar", _local_2, _arg_1));
            };
        }

        public function ___MountPanel_LinkButton3_click(_arg_1:MouseEvent):void
        {
            showRule(3);
        }

        public function onClickMountDress():void
        {
            var _local_2:String;
            if (mountDataList.selectedIndex > (mountDressAc.length - 1))
            {
                return;
            };
            var _local_1:Object = mountDressAc.getItemAt(mountDataList.selectedIndex);
            if (DressResMap[_local_1.iconCode])
            {
                _local_2 = DressResMap[_local_1.iconCode];
            }
            else
            {
                _local_2 = ResManager.hash(ResManager.getIconUrlNoHash(_local_1.iconCode));
            };
            mountImg.source = _local_2;
            var _local_3:Number = dressTimeObj[mountDressAc.getItemAt(mountDataList.selectedIndex).id];
            setOverdueTime(_local_3);
            selectedDress = mountDataList.selectedIndex;
        }

        [Bindable(event="propertyChange")]
        public function get addPro4():Label
        {
            return (this._1148692632addPro4);
        }

        [Bindable(event="propertyChange")]
        public function get addPro5():Label
        {
            return (this._1148692631addPro5);
        }

        [Bindable(event="propertyChange")]
        public function get addPro3():Label
        {
            return (this._1148692633addPro3);
        }

        [Bindable(event="propertyChange")]
        public function get addPro6():Label
        {
            return (this._1148692630addPro6);
        }

        public function set expBar(_arg_1:PropertyBar):void
        {
            var _local_2:Object = this._1289197386expBar;
            if (_local_2 !== _arg_1)
            {
                this._1289197386expBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expBar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mountUpPro():DataGrid
        {
            return (this._1285315961mountUpPro);
        }

        public function updateDressBuyList(_arg_1:Object, _arg_2:int):void
        {
            var _local_3:Sort;
            if (!this.tabBtn3.visible)
            {
                return;
            };
            if (!MountDressBuyList)
            {
                return;
            };
            if (_arg_2 == 1)
            {
                if (MountDressBuyList[_arg_1.id])
                {
                    return;
                };
                MountDressBuyArr.addItem(_arg_1);
                MountDressBuyList[_arg_1.id] = _arg_1;
                _local_3 = new Sort();
                _local_3.fields = [new SortField("sort1", true, false, true)];
                MountDressBuyArr.sort = _local_3;
                MountDressBuyArr.refresh();
            }
            else
            {
                if (!MountDressBuyList[_arg_1.id])
                {
                    return;
                };
                MountDressBuyArr.removeItemAt(MountDressBuyArr.getItemIndex(MountDressBuyList[_arg_1.id]));
                delete MountDressBuyList[_arg_1.id];
            };
            pageSelector.initPageSeletor(MountDressBuyArr.length, PAGE_MAX_DRESS_NUM);
            pageSelector.pageNo = 0;
            updateShopView();
        }

        [Bindable(event="propertyChange")]
        public function get mountLev2():Label
        {
            return (this._456826222mountLev2);
        }

        [Bindable(event="propertyChange")]
        public function get addPro1():Label
        {
            return (this._1148692635addPro1);
        }

        [Bindable(event="propertyChange")]
        public function get addPro2():Label
        {
            return (this._1148692634addPro2);
        }

        public function renewMount():void
        {
            var selectedItem:Object;
            var func:Function;
            var tData:Object;
            if (((!(mountDressAc.length)) || (mountDataList.selectedIndex > (mountDressAc.length - 1))))
            {
                return;
            };
            if (mountDataList.selectedIndex < 0)
            {
                mountDataList.selectedIndex = 0;
            };
            if (this.selectedDress >= 0)
            {
                mountDataList.selectedIndex = selectedDress;
            }
            else
            {
                mountDataList.selectedIndex = 0;
            };
            selectedItem = mountDressAc.getItemAt(mountDataList.selectedIndex);
            if (((selectedItem) && (selectedItem.id)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("renewMount", new Responder(refreshMountOvertimeDate), selectedItem.id);
                    };
                };
                tData = GameData.d[GamePredef.TBL_MOUNT_DRESS][selectedItem.id];
                if (((tData) && (tData.gold > 0)))
                {
                    Alert.show(Language.MOUNTPANEL_U[71].toString().replace("{gold}", tData.gold).replace("{name}", tData.name), "", (Alert.YES | Alert.NO), null, func);
                };
            };
        }

        public function updateMountList(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_7:String;
            var _local_8:Object;
            var _local_9:Object;
            if (!this.initialized)
            {
                return;
            };
            if (!_arg_1)
            {
                return;
            };
            this.visible = true;
            mountDressAc = new ArrayCollection();
            for (_local_2 in _arg_1.mountList)
            {
                _local_8 = GameData.d[GamePredef.TBL_MOUNT_DRESS][int(_arg_1.mountList[_local_2])];
                if (_local_8)
                {
                    _local_9 = new Object();
                    _local_9.id = _arg_1.mountList[_local_2];
                    _local_9.name = _local_8.name;
                    if (_arg_1.mountList[_local_2] == _arg_1.useDress)
                    {
                        _local_9.name = ("Đang cưỡi " + _local_9.name);
                        rideIndex = _local_2;
                    };
                    mountDressList[_local_9.id] = _local_9.id;
                    _local_9.iconCode = Number(_local_8.iconCode);
                    mountDressAc.addItem(_local_9);
                    dressTimeObj[_arg_1.mountList[_local_2]] = _arg_1.mountOverdueList[_local_2];
                };
            };
            _local_3 = GameData.d[GamePredef.TBL_MOUNT_DRESS];
            if (_local_3)
            {
                PAGE_MAX_DRESS_NUM = 0;
                for each (_local_9 in _local_3)
                {
                    if (_local_9.type == 2)
                    {
                        PAGE_MAX_DRESS_NUM++;
                    };
                };
            };
            if (!mountDressAc.length)
            {
                return;
            };
            mountDataList.dataProvider = mountDressAc;
            var _local_4:Number = mountDressAc.getItemAt(rideIndex).iconCode;
            mountDataList.selectedIndex = rideIndex;
            var _local_5:Number = dressTimeObj[_arg_1.mountList[rideIndex]];
            var _local_6:Date = new Date(_local_5);
            setOverdueTime(_local_5);
            if (DressResMap[_local_4])
            {
                _local_7 = DressResMap[_local_4];
            }
            else
            {
                _local_7 = ResManager.hash(ResManager.getIconUrlNoHash(_local_4));
            };
            mountImg.source = _local_7;
            updateDressAddPro(mountDressList);
            updateMountView(_arg_1);
            if (this.tabBtn3.visible)
            {
                showMountDressShop();
            };
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).useMountDress = Number(_arg_1.mountList[rideIndex]);
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).dressTimeObj = dressTimeObj;
            _core.view.getUI(ViewManager.MAIN_LONGBUFF).resetMountDressTimer();
        }

        public function __normalGrowBtn_click(_arg_1:MouseEvent):void
        {
            feedMount(1);
        }

        public function updateMountView(_arg_1:Object):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:ArrayCollection;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:String;
            var _local_13:Object;
            var _local_14:Object;
            var _local_15:String;
            if (!this.initialized)
            {
                return;
            };
            setMountData(_arg_1);
            var _local_2:Boolean;
            var _local_3:Boolean;
            if (_arg_1.hasOwnProperty("exp"))
            {
                _local_2 = true;
            };
            if (_arg_1.hasOwnProperty("addRate"))
            {
                _local_3 = true;
            };
            if (mountLev)
            {
                updateMountInfoView(_local_2, _local_3);
            };
            if (((stExp) && (_arg_1.addExp)))
            {
                if (Number(_arg_1.addExp) == 10)
                {
                    stExp.setValue(_arg_1.addExp, "May mắn", " điểm kinh nghiệm!");
                }
                else
                {
                    stExp.setValue(_arg_1.addExp, "", " điểm kinh nghiệm");
                };
            };
            if (((mountLev2) && (_local_2)))
            {
                mountLev2.text = Language.MOUNTPANEL_U[6].replace("{level}", mountData.lev);
                _local_4 = getMountData(mountData.lev, 1);
                _local_5 = getMountData((mountData.lev + 1), 1);
                if (((!(_local_4)) || (!(_local_5))))
                {
                    return;
                };
                _local_6 = 1;
                while (_local_6 <= 6)
                {
                    this[("levPro" + _local_6)].text = (((MountProArray[(_local_6 - 1)] + ((MountProArray[(_local_6 - 1)].toString().length <= 4) ? "  " : "")) + " +") + _local_4[AddProNumArray[(_local_6 - 1)]]);
                    this[("nextLevPro" + _local_6)].text = (((MountProArray[(_local_6 - 1)] + ((MountProArray[(_local_6 - 1)].toString().length <= 4) ? "  " : "")) + " +") + _local_5[AddProNumArray[(_local_6 - 1)]]);
                    _local_6++;
                };
                mountExp.text = ((Language.MOUNTPANEL_U[26] + " ") + mountData.exp);
                expBar.valueMax = _local_4.exp;
                expBar.value = mountData.exp;
                itemNum1.text = (Language.MOUNTPANEL_U[50] + _core.getItemNum(29, GamePredef.MOUNT_LEV_ITEM).num);
            };
            if (((curUpLv) && (_local_3)))
            {
                curUpLv.text = (this.mountData.upLv + Language.MOUNTPANEL_U[38]);
                curUpExp.text = ((Language.MOUNTPANEL_U[33] + " ") + this.mountData.addRate);
                _local_7 = getMountData(this.mountData.upLv, 2);
                _local_8 = getMountData((this.mountData.upLv + 1), 2);
                _local_9 = new ArrayCollection();
                _local_10 = 0;
                while (_local_10 < 6)
                {
                    _local_13 = new Object();
                    _local_13.name = MountProArray[_local_10];
                    _local_13.curPro = (_local_7[AddProPerArray[_local_10]] + "%");
                    if (((_local_8) && (_local_8.dressId)))
                    {
                        _local_13.nextPro = (_local_8[AddProPerArray[_local_10]] + "%");
                    };
                    _local_9.addItem(_local_13);
                    _local_10++;
                };
                mountUpPro.dataProvider = _local_9;
                upExpBar.valueMax = ToolKit.minus(10000, _local_7.exp);
                upExpBar.value = mountData.addRate;
                if (this.mountData.upLv < 8)
                {
                    upCostInfo.text = Language.MOUNTPANEL_U[44].replace("{num}", _local_7.itemNum);
                }
                else
                {
                    upCostInfo.text = Language.MOUNTPANEL_U[74].replace("{num}", _local_7.itemNum);
                };
                _local_11 = GameData.d[GamePredef.TBL_MOUNT_DRESS][_local_7.dressId];
                _local_12 = "";
                if (((_local_11) && (DressResMap[_local_11.iconCode])))
                {
                    _local_12 = DressResMap[_local_11.iconCode];
                }
                else
                {
                    _local_12 = ResManager.hash(ResManager.getIconUrlNoHash(_local_11.iconCode));
                };
                mountImg1.source = _local_12;
                if (((_local_8) && (_local_8.dressId)))
                {
                    _local_14 = GameData.d[GamePredef.TBL_MOUNT_DRESS][_local_8.dressId];
                    _local_15 = "";
                    if (DressResMap[_local_14.iconCode])
                    {
                        _local_15 = DressResMap[_local_14.iconCode];
                    }
                    else
                    {
                        _local_15 = ResManager.hash(ResManager.getIconUrlNoHash(_local_14.iconCode));
                    };
                    mountImg2.source = _local_15;
                    nextUpLv.text = ((this.mountData.upLv + 1) + Language.MOUNTPANEL_U[38]);
                }
                else
                {
                    mountImg2.source = null;
                    nextUpLv.text = "";
                };
                itemNum2.text = (Language.MOUNTPANEL_U[51] + _core.getItemNum(29, GamePredef.MOUNT_UPLEV_ITEM).num);
                itemNum3.text = (Language.MOUNTPANEL_U[73] + _core.getItemNum(29, GamePredef.ADV_MOUNT_UPLEV_ITEM).num);
            };
        }

        override public function initialize():void
        {
            var target:MountPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MountPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MountPanelWatcherSetupUtil");
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

        public function showRule(_arg_1:int):void
        {
            var _local_2:* = "";
            if (_arg_1 == 1)
            {
                _local_2 = Language.MOUNTPANEL_U[48];
            }
            else
            {
                if (_arg_1 == 2)
                {
                    _local_2 = Language.MOUNTPANEL_U[49];
                }
                else
                {
                    if (_arg_1 == 3)
                    {
                        _local_2 = Language.MOUNTPANEL_U[72];
                    };
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            _alert = Alert.show(_local_2, "", Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        public function set advancedGrowBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._466731719advancedGrowBtn;
            if (_local_2 !== _arg_1)
            {
                this._466731719advancedGrowBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "advancedGrowBtn", _local_2, _arg_1));
            };
        }

        public function updateMountInfoView(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_6:String;
            var _local_7:String;
            var _local_3:Object = getMountData(mountData.lev, 1);
            var _local_4:Object = getMountData(mountData.upLv, 2);
            if (((!(_local_3)) || (!(_local_3))))
            {
                return;
            };
            var _local_5:int = 1;
            while (_local_5 <= 6)
            {
                if (_arg_1)
                {
                    _local_6 = (((MountProArray[(_local_5 - 1)] + ((MountProArray[(_local_5 - 1)].toString().length <= 4) ? "  " : "")) + " +") + _local_3[AddProNumArray[(_local_5 - 1)]]);
                    if (this.tabBtn3.visible)
                    {
                        _local_6 = (_local_6 + (("(+" + dressAddProNum[AddProNumArray[(_local_5 - 1)]]) + ")"));
                    };
                    this[("basicPro" + _local_5)].text = _local_6;
                };
                if (_arg_2)
                {
                    _local_7 = ((((MountProArray[(_local_5 - 1)] + ((MountProArray[(_local_5 - 1)].toString().length <= 4) ? "  " : "")) + " +") + _local_4[AddProPerArray[(_local_5 - 1)]]) + "%");
                    if (this.tabBtn3.visible)
                    {
                        _local_7 = (_local_7 + (("(+" + dressAddProPer[AddProPerArray[(_local_5 - 1)]]) + "%)"));
                    };
                    this[("addPro" + _local_5)].text = _local_7;
                };
                _local_5++;
            };
            mountLev.text = Language.MOUNTPANEL_U[6].replace("{level}", mountData.lev);
        }

        public function set upCostInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._1845920214upCostInfo;
            if (_local_2 !== _arg_1)
            {
                this._1845920214upCostInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upCostInfo", _local_2, _arg_1));
            };
        }

        public function set rideInGrowCanvasBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._934637100rideInGrowCanvasBtn;
            if (_local_2 !== _arg_1)
            {
                this._934637100rideInGrowCanvasBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rideInGrowCanvasBtn", _local_2, _arg_1));
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get mountLev():Label
        {
            return (this._123811004mountLev);
        }

        public function __renewBtn_click(_arg_1:MouseEvent):void
        {
            renewMount();
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelector
        {
            return (this._607339634pageSelector);
        }

        public function set feedBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._976038946feedBtn;
            if (_local_2 !== _arg_1)
            {
                this._976038946feedBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "feedBtn", _local_2, _arg_1));
            };
        }

        public function __rideInGrowCanvasBtn_click(_arg_1:MouseEvent):void
        {
            beginMount(2);
        }

        public function set levPro2(_arg_1:Label):void
        {
            var _local_2:Object = this._69165794levPro2;
            if (_local_2 !== _arg_1)
            {
                this._69165794levPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levPro2", _local_2, _arg_1));
            };
        }

        public function set levPro1(_arg_1:Label):void
        {
            var _local_2:Object = this._69165793levPro1;
            if (_local_2 !== _arg_1)
            {
                this._69165793levPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levPro1", _local_2, _arg_1));
            };
        }

        public function set curUpLv(_arg_1:Label):void
        {
            var _local_2:Object = this._1126085605curUpLv;
            if (_local_2 !== _arg_1)
            {
                this._1126085605curUpLv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curUpLv", _local_2, _arg_1));
            };
        }

        private function setOverdueTime(_arg_1:Number):*
        {
            var _local_2:Date;
            if (_arg_1 == 1)
            {
                mountTime.visible = false;
                renewBtn.visible = false;
            }
            else
            {
                _local_2 = new Date(_arg_1);
                mountTime.visible = true;
                renewBtn.visible = true;
                mountTime.htmlText = Language.MOUNTPANEL_U[69].toString().replace("{year}", _local_2.getFullYear()).replace("{month}", (_local_2.getMonth() + 1)).replace("{day}", _local_2.getDate()).replace("{hour}", _local_2.getHours()).replace("{minute}", _local_2.getMinutes());
            };
        }

        public function set levPro3(_arg_1:Label):void
        {
            var _local_2:Object = this._69165795levPro3;
            if (_local_2 !== _arg_1)
            {
                this._69165795levPro3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levPro3", _local_2, _arg_1));
            };
        }

        public function set levPro5(_arg_1:Label):void
        {
            var _local_2:Object = this._69165797levPro5;
            if (_local_2 !== _arg_1)
            {
                this._69165797levPro5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levPro5", _local_2, _arg_1));
            };
        }

        public function set levPro6(_arg_1:Label):void
        {
            var _local_2:Object = this._69165798levPro6;
            if (_local_2 !== _arg_1)
            {
                this._69165798levPro6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levPro6", _local_2, _arg_1));
            };
        }

        public function set mountImg(_arg_1:Image):void
        {
            var _local_2:Object = this._123813654mountImg;
            if (_local_2 !== _arg_1)
            {
                this._123813654mountImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mountImg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upCostInfo():Label
        {
            return (this._1845920214upCostInfo);
        }

        public function set levPro4(_arg_1:Label):void
        {
            var _local_2:Object = this._69165796levPro4;
            if (_local_2 !== _arg_1)
            {
                this._69165796levPro4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levPro4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rideInGrowCanvasBtn():BasicGlowButton
        {
            return (this._934637100rideInGrowCanvasBtn);
        }

        override public function initView():void
        {
            if (!this.initialized)
            {
                this.visible = true;
                return;
            };
            _core.remote.call("getMountList", new Responder(updateMountList), null);
        }

        [Bindable(event="propertyChange")]
        public function get feedBtn():DelayButton
        {
            return (this._976038946feedBtn);
        }

        [Bindable(event="propertyChange")]
        public function get curUpLv():Label
        {
            return (this._1126085605curUpLv);
        }

        public function __rideBtn_click(_arg_1:MouseEvent):void
        {
            beginMount(1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

