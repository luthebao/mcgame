// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionTotalPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.DataGrid;
    import mx.controls.Image;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.LinkButton;
    import mx.containers.ViewStack;
    import flash.display.Loader;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Alert;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.core.UIComponent;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.predef.GamePredef;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import flash.display.MovieClip;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.ListEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.managers.PopUpManager;
    import mx.binding.Binding;
    import flash.net.URLRequest;
    import flash.utils.getDefinitionByName;
    import mx.core.ClassFactory;
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

    public class CrossContentionTotalPanel extends DragableCanvas implements IBindingClient 
    {

        public static var _ORIGINAL_SERVER_ID:int = 0;
        public static var LEVLE_TYPE:int = 1;
        public static const CROSS_CONTENTION_MAX_INDEX:Number = 10000;
        public static var giveup:Boolean = false;
        public static const CROSS_CONTENTION_UINT_ID_START:int = 600000;
        public static var CROSS_CONTENTION_UINT_ID:Object = null;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _976080868pvpnum:RoundedLabel;
        private var _62409574ContentionSingleState:DataGrid;
        private var _336959867banner1:Image;
        private var _3046233cav1:Canvas;
        private var _3034455btn3:BasicGlowButton;
        public var _CrossContentionTotalPanel_LinkButton1:LinkButton;
        private var _2132384574btnPointsAward:BasicGlowButton;
        private var _2092975032bornImg2:Image;
        private var _1739283322btnFirstOccupyAward:BasicGlowButton;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _114581tab:ViewStack;
        private var _861747740ContentionTotalState:DataGrid;
        private var isOpen:Boolean = false;
        private var _976408569pvenum:RoundedLabel;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _3034454btn2:BasicGlowButton;
        private var _788655404btnAreaAward:BasicGlowButton;
        public var _CrossContentionTotalPanel_RoundedLabel1:RoundedLabel;
        public var _CrossContentionTotalPanel_RoundedLabel2:RoundedLabel;
        public var _CrossContentionTotalPanel_RoundedLabel3:RoundedLabel;
        private var _910732927ContentionServerState:DataGrid;
        public var _CrossContentionTotalPanel_RoundedLabel6:RoundedLabel;
        public var _CrossContentionTotalPanel_RoundedLabel7:RoundedLabel;
        public var _CrossContentionTotalPanel_RoundedLabel8:RoundedLabel;
        private var load:Loader;
        private var res_load_state:int = 0;
        public var _CrossContentionTotalPanel_BasicDelayButton1:BasicDelayButton;
        public var _CrossContentionTotalPanel_BasicDelayButton2:BasicDelayButton;
        private var _3034453btn1:BasicGlowButton;
        private var _helpAlert:Alert;
        private var _3046235cav3:Canvas;
        private var _336959866banner2:Image;
        public var _CrossContentionTotalPanel_DataGridColumn1:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn2:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn3:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn4:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn5:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn6:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn7:DataGridColumn;
        public var _CrossContentionTotalPanel_DataGridColumn8:DataGridColumn;
        private var _2092975031bornImg1:Image;
        private var _193568521pvptime:RoundedLabel;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _145245136container1:UIComponent;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _3046234cav2:Canvas;
        private var inited:Boolean = false;
        private var _203727252pvetime:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":955,
                    "height":600,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":39,
                                "percentWidth":100,
                                "height":535,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":760,
                                            "height":535,
                                            "styleName":"CanvasBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":UIComponent,
                                                "id":"container1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"bornImg1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"bornImg2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"banner1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"banner2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "visible":false,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":770,
                                            "y":5,
                                            "styleName":"HTabWrapper",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtn0",
                                                "events":{"click":"__tabBtn0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":55,
                                                        "styleName":"HorizontalTab",
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
                                                        "width":55,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtn2",
                                                "events":{"click":"__tabBtn2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":55,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tab",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":30,
                                            "width":175,
                                            "height":355,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"cav1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"ContentionTotalState",
                                                            "events":{
                                                                "itemClick":"__ContentionTotalState_itemClick",
                                                                "rollOut":"__ContentionTotalState_rollOut",
                                                                "itemRollOver":"__ContentionTotalState_itemRollOver"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.left = "5";
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "columns":[_CrossContentionTotalPanel_DataGridColumn1_i(), _CrossContentionTotalPanel_DataGridColumn2_i(), _CrossContentionTotalPanel_DataGridColumn3_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"cav2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"ContentionServerState",
                                                            "events":{
                                                                "itemClick":"__ContentionServerState_itemClick",
                                                                "rollOut":"__ContentionServerState_rollOut",
                                                                "itemRollOver":"__ContentionServerState_itemRollOver"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "50";
                                                                this.left = "5";
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "columns":[_CrossContentionTotalPanel_DataGridColumn4_i(), _CrossContentionTotalPanel_DataGridColumn5_i(), _CrossContentionTotalPanel_DataGridColumn6_i()]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btnFirstOccupyAward",
                                                            "events":{"click":"__btnFirstOccupyAward_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "30";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"styleName":"BtnStdRed"});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"cav3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"ContentionSingleState",
                                                            "events":{
                                                                "itemClick":"__ContentionSingleState_itemClick",
                                                                "rollOut":"__ContentionSingleState_rollOut",
                                                                "itemRollOver":"__ContentionSingleState_itemRollOver"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "50";
                                                                this.left = "5";
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "columns":[_CrossContentionTotalPanel_DataGridColumn7_i(), _CrossContentionTotalPanel_DataGridColumn8_i()]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btnAreaAward",
                                                            "events":{"click":"__btnAreaAward_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "30";
                                                                this.horizontalCenter = "-40";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":70,
                                                                    "styleName":"BtnStdRed"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"btnPointsAward",
                                                            "events":{"click":"__btnPointsAward_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "30";
                                                                this.horizontalCenter = "40";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":70,
                                                                    "styleName":"BtnStdRed"
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
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":385,
                                            "width":175,
                                            "height":150,
                                            "styleName":"RoundedGradientBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionTotalPanel_RoundedLabel1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":4,
                                                        "width":241
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionTotalPanel_RoundedLabel2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":24,
                                                        "width":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionTotalPanel_RoundedLabel3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":44,
                                                        "width":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pvenum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0x8000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "htmlText":"",
                                                        "x":115,
                                                        "y":24,
                                                        "width":53
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pvetime",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0x8000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "htmlText":"",
                                                        "x":115,
                                                        "y":44,
                                                        "width":53
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionTotalPanel_RoundedLabel6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFF00;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":63,
                                                        "width":241
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionTotalPanel_RoundedLabel7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":83,
                                                        "width":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionTotalPanel_RoundedLabel8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":103,
                                                        "width":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pvpnum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0x8000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "htmlText":"",
                                                        "x":115,
                                                        "y":83,
                                                        "width":53
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"pvptime",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 12;
                                                    this.color = 0x8000;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "htmlText":"",
                                                        "x":115,
                                                        "y":103,
                                                        "width":53
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_CrossContentionTotalPanel_BasicDelayButton1",
                                                "events":{"click":"___CrossContentionTotalPanel_BasicDelayButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "-40";
                                                    this.bottom = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":78
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicDelayButton,
                                                "id":"_CrossContentionTotalPanel_BasicDelayButton2",
                                                "events":{"click":"___CrossContentionTotalPanel_BasicDelayButton2_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "40";
                                                    this.bottom = "3";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "width":78
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
                        "id":"btn1",
                        "events":{"click":"__btn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "55";
                            this.bottom = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":55,
                                "styleName":"HorizontalTab",
                                "selected":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn2",
                        "events":{"click":"__btn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "115";
                            this.bottom = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":55,
                                "styleName":"HorizontalTab",
                                "selected":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btn3",
                        "events":{"click":"__btn3_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "175";
                            this.bottom = "5";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":55,
                                "styleName":"HorizontalTab",
                                "selected":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_CrossContentionTotalPanel_LinkButton1",
                        "events":{"click":"___CrossContentionTotalPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "5";
                            this.color = 0xFFE600;
                            this.textDecoration = "underline";
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1265899029totalStateList:ArrayCollection = new ArrayCollection();
        private var _1101683508serverStateList:ArrayCollection = new ArrayCollection();
        private var _684659581myStateList:ArrayCollection = new ArrayCollection();
        private var ALL_MAP_NAME:Object = GamePredef.CROSS_CONTENTION_MAP;
        private var areas:Array = [];
        private var mcs:Array = [];
        private var mapData:Object = {};
        private var mcPositions:Array = [[0, 0], [319, 176.95], [226.35, 171.95], [332, 171], [137.95, 121.5], [404.45, 135.95], [349.05, 250.4], [155.95, 243.55], [63, 141.85], [117.1, 32.35], [378.35, 35], [530, 94], [493.15, 256.1], [273.6, 356.15], [73, 377.95], [41.1, 261.85], [-2.1, 176.35], [-2.1, 116.4], [-2, 48.9], [-1.65, -2.65], [89.1, -1.5], [212.95, -2.6], [365.85, -1.6], [452.9, -2.5], [519.85, -1.65], [568, 79.35], [670.05, 118.05], [661, 187.85], [625.95, 251.85], [642.8, 331.25], [536.9, 402.95], [470, 438.25], [389.35, 460.5], [266, 446.05], [94.95, 469.55], [-2.1, 455.15], [-1.9, 439], [-1.9, 363.5], [-2.1, 301], [-2.1, 249]];
        private var bornPositions:Array = [[0, 0], [370, 220], [276, 222], [382, 221], [188, 172], [454, 186], [400, 300], [200, 293], [113, 190], [160, 82], [430, 85], [580, 144], [550, 300], [320, 406], [123, 420], [90, 300], [9, 194], [0, 175], [61, 109], [0, 0], [123, 29], [218, 0], [390, -9], [476, 45], [547, 61], [611, 70], [671, 168], [676, 225], [628, 282], [670, 323], [547, 403], [503, 432], [417, 480], [291, 485], [126, 485], [13, 485], [0, 461], [4, 401], [0, 369], [-4, 297]];
        private var bornPositions2:Array = [[0, 0], [370, 220], [276, 222], [382, 221], [188, 172], [454, 186], [400, 300], [200, 293], [113, 190], [160, 82], [430, 85], [580, 144], [550, 300], [320, 406], [123, 420], [90, 300], [51, 219], [29, 138], [5, 36], [80, 29], [176, 0], [353, 0], [444, 1], [602, 20], [705, 35], [689, 94], [705, 119], [702, 176], [687, 260], [695, 366], [669, 409], [678, 466], [607, 475], [373, 442], [233, 460], [110, 440], [51, 415], [59, 357], [24, 309], [31, 236]];
        private var bornIcons:Object = {
            "1":4130220000309,
            "2":4130220000311,
            "6":4130220000322,
            "26":4130220000313,
            "25":4130220000323
        };
        private var malaiServer:Object = {
            "520":true,
            "521":true,
            "522":true,
            "523":true,
            "524":true,
            "525":true,
            "527":true,
            "529":true,
            "530":true,
            "531":true,
            "532":true
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionTotalPanel()
        {
            mx_internal::_document = this;
            this.width = 955;
            this.height = 600;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionTotalPanel_DragableCanvas1_creationComplete);
        }

        public static function getUnitServersName(_arg_1:Number):String
        {
            var _local_3:Object;
            var _local_4:String;
            var _local_2:* = "";
            for (_local_3 in CROSS_CONTENTION_UINT_ID)
            {
                if (Number(CROSS_CONTENTION_UINT_ID[_local_3]) == _arg_1)
                {
                    if (_local_2.length > 1)
                    {
                        _local_2 = (_local_2 + "，");
                    };
                    _local_4 = getServerName(Number(_local_3));
                    _local_2 = (_local_2 + Language.CROSS_CONTENTION_PANEL_U[18].toString().replace("{osid}", _local_4));
                };
            };
            return (_local_2);
        }

        public static function _crossContentionGetPridMid(_arg_1:Number):int
        {
            return (Math.floor((_arg_1 / CROSS_CONTENTION_MAX_INDEX)));
        }

        public static function _crossContentionGetPridRid(_arg_1:Number):int
        {
            return (_arg_1 % CROSS_CONTENTION_MAX_INDEX);
        }

        public static function getServerName(_arg_1:Number):String
        {
            var _local_2:int;
            if (_arg_1 >= CROSS_CONTENTION_UINT_ID_START)
            {
                _local_2 = ((_arg_1 + 1) % CROSS_CONTENTION_UINT_ID_START);
                return (Language.CROSS_CONTENTION_PANEL_U[161] + _local_2);
            };
            if (((_arg_1 >= 500) && (_arg_1 <= 799)))
            {
                return (GamePredef.CROSS_CONTENTION_UNITED_SERVER_NAME[_arg_1]);
            };
            if ((((_arg_1 >= 0) && (_arg_1 < 500)) || (_arg_1 >= 800)))
            {
                return (_arg_1.toString());
            };
            return ("");
        }

        public static function getUnitServersId(_arg_1:Number):Array
        {
            var _local_3:Object;
            var _local_2:Array = [];
            for (_local_3 in CROSS_CONTENTION_UINT_ID)
            {
                if (Number(CROSS_CONTENTION_UINT_ID[_local_3]) == _arg_1)
                {
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionTotalPanel._watcherSetupUtil = _arg_1;
        }


        private function getPointsAward():void
        {
            _core.remote.call("crossContentionShowScoreAward", null);
        }

        private function getBornMid(_arg_1:int):int
        {
            var _local_3:Object;
            var _local_4:Array;
            var _local_5:int;
            var _local_2:int;
            for (_local_3 in GamePredef.CROSS_CONTENTION_MAP_ENTRANCE)
            {
                _local_4 = GamePredef.CROSS_CONTENTION_MAP_ENTRANCE[_local_3];
                if (_local_4)
                {
                    _local_5 = _local_4.indexOf(_arg_1);
                    if (_local_5 > -1)
                    {
                        _local_2 = int(_local_3);
                        break;
                    };
                };
            };
            return (_local_2);
        }

        private function showBoss():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:MovieClip;
            var _local_5:int;
            showAreaClear();
            if (btn1.selected)
            {
                btn1.selected = false;
                return;
            };
            showBtnClear();
            btn1.selected = true;
            var _local_1:Object = mapData.boss;
            if (!_local_1)
            {
                return;
            };
            for (_local_2 in _local_1)
            {
                _local_3 = _local_1[_local_2];
                _local_4 = mcs[_local_2];
                _local_5 = _local_3.bIndex;
                if (((((((_local_3) && (_local_3.data)) && (_local_3.data[_local_5])) && (!(int(_local_3.data[_local_5].state) == 2))) && (!(_local_3.data[_local_5].osid))) && (_local_4)))
                {
                    _local_4.visible = true;
                    _local_4.gotoAndStop(1);
                };
            };
        }

        public function set pvenum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._976408569pvenum;
            if (_local_2 !== _arg_1)
            {
                this._976408569pvenum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvenum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pvenum():RoundedLabel
        {
            return (this._976408569pvenum);
        }

        private function showFirstOccupyAward():void
        {
            _core.remote.call("crossContentionShowFirstOccupyAward", null);
        }

        [Bindable(event="propertyChange")]
        public function get ContentionTotalState():DataGrid
        {
            return (this._861747740ContentionTotalState);
        }

        private function mcMouseOut(_arg_1:MouseEvent):void
        {
            hideUnitBanner();
        }

        private function mcMouseOver(_arg_1:MouseEvent):void
        {
            var _local_5:MovieClip;
            var _local_2:Object = _arg_1.currentTarget;
            var _local_3:int = -1;
            var _local_4:int = 1;
            while (_local_4 <= 39)
            {
                _local_5 = areas[_local_4];
                if (_local_5)
                {
                    if (_local_2 == _local_5)
                    {
                        _local_3 = _local_4;
                    };
                };
                _local_4++;
            };
            showUnitBanner(_local_3);
        }

        public function ___CrossContentionTotalPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        [Bindable(event="propertyChange")]
        public function get pvpnum():RoundedLabel
        {
            return (this._976080868pvpnum);
        }

        private function getCrossContentionServerState():void
        {
            _core.remote.call("getCrossContentionServerState", null);
        }

        public function __btnAreaAward_click(_arg_1:MouseEvent):void
        {
            getAreaAward();
        }

        private function _CrossContentionTotalPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn1 = _local_1;
            _local_1.width = 55;
            _local_1.dataField = "areaname";
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn1", _CrossContentionTotalPanel_DataGridColumn1);
            return (_local_1);
        }

        public function __ContentionTotalState_rollOut(_arg_1:MouseEvent):void
        {
            onItemRollOut(_arg_1);
        }

        public function set ContentionTotalState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._861747740ContentionTotalState;
            if (_local_2 !== _arg_1)
            {
                this._861747740ContentionTotalState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionTotalState", _local_2, _arg_1));
            };
        }

        private function loadComplete(_arg_1:Event):void
        {
            var _local_5:String;
            var _local_6:Class;
            var _local_7:MovieClip;
            var _local_8:String;
            var _local_9:Class;
            var _local_10:MovieClip;
            var _local_2:Class = (load.contentLoaderInfo.applicationDomain.getDefinition("map") as Class);
            var _local_3:MovieClip = new (_local_2)();
            container1.addChild(_local_3);
            var _local_4:int = 1;
            while (_local_4 <= 39)
            {
                _local_5 = ("area_" + _local_4);
                if (load.contentLoaderInfo.applicationDomain.hasDefinition(_local_5))
                {
                    _local_6 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_5) as Class);
                    _local_7 = new (_local_6)();
                    container1.addChild(_local_7);
                    _local_7.x = mcPositions[_local_4][0];
                    _local_7.y = mcPositions[_local_4][1];
                    _local_7.gotoAndStop(1);
                    _local_7.addEventListener(MouseEvent.CLICK, mcClick);
                    _local_7.addEventListener(MouseEvent.ROLL_OVER, mcMouseOver);
                    _local_7.addEventListener(MouseEvent.ROLL_OUT, mcMouseOut);
                    areas[_local_4] = _local_7;
                };
                _local_4++;
            };
            _local_4 = 1;
            while (_local_4 <= 39)
            {
                _local_8 = ("mc_" + _local_4);
                if (load.contentLoaderInfo.applicationDomain.hasDefinition(_local_8))
                {
                    _local_9 = (load.contentLoaderInfo.applicationDomain.getDefinition(_local_8) as Class);
                    _local_10 = new (_local_9)();
                    container1.addChild(_local_10);
                    _local_10.x = mcPositions[_local_4][0];
                    _local_10.y = mcPositions[_local_4][1];
                    _local_10.gotoAndStop(1);
                    _local_10.mouseEnabled = false;
                    _local_10.visible = false;
                    mcs[_local_4] = _local_10;
                };
                _local_4++;
            };
            res_load_state = 2;
            load.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadComplete);
            load.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
            refreshAreas();
        }

        private function onTotalStateItemClickHandler(_arg_1:ListEvent):void
        {
            var _local_2:int = _arg_1.itemRenderer.data.id;
            var _local_3:* = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_SINGLE_INFO);
            if (_local_3)
            {
                _local_3.showPanel(_local_2);
            };
        }

        public function set pvpnum(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._976080868pvpnum;
            if (_local_2 !== _arg_1)
            {
                this._976080868pvpnum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvpnum", _local_2, _arg_1));
            };
        }

        private function _CrossContentionTotalPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn8 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "occupynum";
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn8", _CrossContentionTotalPanel_DataGridColumn8);
            return (_local_1);
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            btnClick(0);
        }

        [Bindable(event="propertyChange")]
        public function get pvetime():RoundedLabel
        {
            return (this._203727252pvetime);
        }

        [Bindable(event="propertyChange")]
        public function get ContentionServerState():DataGrid
        {
            return (this._910732927ContentionServerState);
        }

        public function __ContentionTotalState_itemRollOver(_arg_1:ListEvent):void
        {
            onItemRollOver(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get banner2():Image
        {
            return (this._336959866banner2);
        }

        public function __btn3_click(_arg_1:MouseEvent):void
        {
            showServerOwn();
        }

        public function __ContentionSingleState_itemRollOver(_arg_1:ListEvent):void
        {
            onItemRollOver(_arg_1);
        }

        private function btnClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            activatePanel(_arg_1);
            var _local_2:int;
            while (_local_2 <= (tab.numChildren - 1))
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
        }

        public function __ContentionServerState_itemClick(_arg_1:ListEvent):void
        {
            onTotalStateItemClickHandler(_arg_1);
        }

        public function onGetCrossContentionServerState(_arg_1:Object):void
        {
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        public function onShowFirstOccupyAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_FIRST_AWARD);
            if (_local_2)
            {
                _local_2.open(_arg_1.data);
            };
        }

        public function ___CrossContentionTotalPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            showRank();
        }

        public function set btnPointsAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2132384574btnPointsAward;
            if (_local_2 !== _arg_1)
            {
                this._2132384574btnPointsAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPointsAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ContentionSingleState():DataGrid
        {
            return (this._62409574ContentionSingleState);
        }

        private function onItemRollOver(_arg_1:ListEvent):void
        {
            var _local_4:MovieClip;
            refreshAreas();
            var _local_2:int = _arg_1.itemRenderer.data.id;
            var _local_3:int = 1;
            while (_local_3 <= 39)
            {
                _local_4 = areas[_local_3];
                if (_local_4)
                {
                    if (_local_2 == _local_3)
                    {
                        _local_4.gotoAndStop(3);
                    };
                };
                _local_3++;
            };
            showUnitBanner(_local_2);
        }

        [Bindable(event="propertyChange")]
        private function get myStateList():ArrayCollection
        {
            return (this._684659581myStateList);
        }

        public function __btnFirstOccupyAward_click(_arg_1:MouseEvent):void
        {
            showFirstOccupyAward();
        }

        private function showUnitBanner(_arg_1:int):void
        {
            var _local_4:int;
            var _local_5:Number;
            var _local_6:int;
            hideUnitBanner();
            if (((!(GamePredef.CROSS_CONTENTION_MAP_ENTRANCE)) || (!(GamePredef.CROSS_CONTENTION_MAP_ENTRANCE[_arg_1]))))
            {
                return;
            };
            if (_arg_1 == getBornMid(_ORIGINAL_SERVER_ID))
            {
                return;
            };
            var _local_2:Array = GamePredef.CROSS_CONTENTION_MAP_ENTRANCE[_arg_1];
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3];
                _local_5 = bornIcons[_local_4];
                _local_6 = getBornMid(_local_4);
                if (((_local_5) && (this[("banner" + (_local_3 + 1))])))
                {
                    this[("banner" + (_local_3 + 1))].source = ResManager.getIconUrl(_local_5);
                    if (_local_3 == 0)
                    {
                        this[("banner" + (_local_3 + 1))].x = bornPositions[_local_6][0];
                        this[("banner" + (_local_3 + 1))].y = bornPositions[_local_6][1];
                    }
                    else
                    {
                        this[("banner" + (_local_3 + 1))].x = bornPositions2[_local_6][0];
                        this[("banner" + (_local_3 + 1))].y = bornPositions2[_local_6][1];
                    };
                    this[("banner" + (_local_3 + 1))].visible = true;
                };
                _local_3++;
            };
        }

        public function set btn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034453btn1;
            if (_local_2 !== _arg_1)
            {
                this._3034453btn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn1", _local_2, _arg_1));
            };
        }

        private function hideUnitBanner():void
        {
            banner1.visible = false;
            banner2.visible = false;
        }

        public function set cav2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046234cav2;
            if (_local_2 !== _arg_1)
            {
                this._3046234cav2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav2", _local_2, _arg_1));
            };
        }

        public function set btn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034455btn3;
            if (_local_2 !== _arg_1)
            {
                this._3034455btn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn3", _local_2, _arg_1));
            };
        }

        public function set cav3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046235cav3;
            if (_local_2 !== _arg_1)
            {
                this._3046235cav3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav3", _local_2, _arg_1));
            };
        }

        public function set cav1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046233cav1;
            if (_local_2 !== _arg_1)
            {
                this._3046233cav1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav1", _local_2, _arg_1));
            };
        }

        private function _CrossContentionTotalPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn7 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "lordname";
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn7", _CrossContentionTotalPanel_DataGridColumn7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get banner1():Image
        {
            return (this._336959867banner1);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:* = "";
            var _local_2:int = int(_ORIGINAL_SERVER_ID);
            if (malaiServer[_local_2])
            {
                _local_1 = Language.CROSS_CONTENTION_PANEL_U[177].toString();
                _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[177].toString(), Alert.YES, null, null);
            }
            else
            {
                _local_1 = Language.CROSS_CONTENTION_PANEL_U[130].toString();
                _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[130].toString(), Alert.YES, null, null);
            };
        }

        private function _CrossContentionTotalPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (totalStateList);
            }, function (_arg_1:Object):void
            {
                ContentionTotalState.dataProvider = _arg_1;
            }, "ContentionTotalState.dataProvider");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn1.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn1.headerText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn2.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn2.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn3.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn3.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (serverStateList);
            }, function (_arg_1:Object):void
            {
                ContentionServerState.dataProvider = _arg_1;
            }, "ContentionServerState.dataProvider");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn4.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn4.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn5.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn5.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn6.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn6.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFirstOccupyAward.label = _arg_1;
            }, "btnFirstOccupyAward.label");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (myStateList);
            }, function (_arg_1:Object):void
            {
                ContentionSingleState.dataProvider = _arg_1;
            }, "ContentionSingleState.dataProvider");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn7.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn7.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_DataGridColumn8.headerText = _arg_1;
            }, "_CrossContentionTotalPanel_DataGridColumn8.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnAreaAward.label = _arg_1;
            }, "btnAreaAward.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPointsAward.label = _arg_1;
            }, "btnPointsAward.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[155];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_RoundedLabel1.htmlText = _arg_1;
            }, "_CrossContentionTotalPanel_RoundedLabel1.htmlText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_RoundedLabel2.htmlText = _arg_1;
            }, "_CrossContentionTotalPanel_RoundedLabel2.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_RoundedLabel3.htmlText = _arg_1;
            }, "_CrossContentionTotalPanel_RoundedLabel3.htmlText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[156];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_RoundedLabel6.htmlText = _arg_1;
            }, "_CrossContentionTotalPanel_RoundedLabel6.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_RoundedLabel7.htmlText = _arg_1;
            }, "_CrossContentionTotalPanel_RoundedLabel7.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_RoundedLabel8.htmlText = _arg_1;
            }, "_CrossContentionTotalPanel_RoundedLabel8.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[159];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_BasicDelayButton1.label = _arg_1;
            }, "_CrossContentionTotalPanel_BasicDelayButton1.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[162];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_BasicDelayButton2.label = _arg_1;
            }, "_CrossContentionTotalPanel_BasicDelayButton2.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[123];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn1.label = _arg_1;
            }, "btn1.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[124];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2.label = _arg_1;
            }, "btn2.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[125];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn3.label = _arg_1;
            }, "btn3.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionTotalPanel_LinkButton1.label = _arg_1;
            }, "_CrossContentionTotalPanel_LinkButton1.label");
            result[29] = binding;
            return (result);
        }

        private function loadError(_arg_1:IOErrorEvent):void
        {
            trace(" load Error ");
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        public function __ContentionServerState_itemRollOver(_arg_1:ListEvent):void
        {
            onItemRollOver(_arg_1);
        }

        private function showServerOwn():void
        {
            var _local_2:Object;
            var _local_3:MovieClip;
            showAreaClear();
            if (btn3.selected)
            {
                btn3.selected = false;
                return;
            };
            showBtnClear();
            btn3.selected = true;
            if (!CROSS_CONTENTION_UINT_ID)
            {
                return;
            };
            var _local_1:int = CROSS_CONTENTION_UINT_ID[_ORIGINAL_SERVER_ID];
            for (_local_2 in ALL_MAP_NAME)
            {
                if ((((mapData) && (mapData.own)) && (int(mapData.own[_local_2]) == _local_1)))
                {
                    _local_3 = mcs[_local_2];
                    if (_local_3)
                    {
                        _local_3.visible = true;
                        _local_3.gotoAndStop(3);
                    };
                };
            };
        }

        private function showRank():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_RANK);
            if (((((_local_1) && (mapData)) && (mapData.own)) && (mapData.ownInfo)))
            {
                _local_1.open(mapData.own, mapData.ownInfo);
            };
        }

        [Bindable(event="propertyChange")]
        private function get serverStateList():ArrayCollection
        {
            return (this._1101683508serverStateList);
        }

        public function set btn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._3034454btn2;
            if (_local_2 !== _arg_1)
            {
                this._3034454btn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2", _local_2, _arg_1));
            };
        }

        private function activatePanel(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case 0:
                    _core.remote.call("getCrossContentionTotalState", null);
                    return;
                case 1:
                    return;
                case 2:
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnAreaAward():BasicGlowButton
        {
            return (this._788655404btnAreaAward);
        }

        public function set pvetime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._203727252pvetime;
            if (_local_2 !== _arg_1)
            {
                this._203727252pvetime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvetime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if ((((_arg_1) && (_core.player)) && (_core.player.level < 50)))
            {
                return;
            };
            if (_arg_1)
            {
                initView();
            };
        }

        private function getCrossContentionMyState():void
        {
            _core.remote.call("getCrossContentionMyState", null);
        }

        public function __ContentionSingleState_itemClick(_arg_1:ListEvent):void
        {
            onTotalStateItemClickHandler(_arg_1);
        }

        private function _CrossContentionTotalPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn6 = _local_1;
            _local_1.width = 25;
            _local_1.dataField = "occupynum";
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn6", _CrossContentionTotalPanel_DataGridColumn6);
            return (_local_1);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            btnClick(2);
        }

        public function set btnFirstOccupyAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1739283322btnFirstOccupyAward;
            if (_local_2 !== _arg_1)
            {
                this._1739283322btnFirstOccupyAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFirstOccupyAward", _local_2, _arg_1));
            };
        }

        public function set ContentionServerState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._910732927ContentionServerState;
            if (_local_2 !== _arg_1)
            {
                this._910732927ContentionServerState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionServerState", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pvptime():RoundedLabel
        {
            return (this._193568521pvptime);
        }

        private function set myStateList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._684659581myStateList;
            if (_local_2 !== _arg_1)
            {
                this._684659581myStateList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStateList", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        public function set banner1(_arg_1:Image):void
        {
            var _local_2:Object = this._336959867banner1;
            if (_local_2 !== _arg_1)
            {
                this._336959867banner1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "banner1", _local_2, _arg_1));
            };
        }

        public function __ContentionSingleState_rollOut(_arg_1:MouseEvent):void
        {
            onItemRollOut(_arg_1);
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

        public function onCrossContentionLookBattleInfo(_arg_1:Object):void
        {
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_BATTLE_INFO);
            if (_local_2)
            {
                _local_2.open(_arg_1);
            };
        }

        public function onCrossContentionBattleInfo(_arg_1:Object):void
        {
            if ((((((((!(_arg_1)) || (!(_arg_1.om))) || (!(_arg_1.bm))) || (!(_arg_1.t))) || (!(_arg_1.mid))) || (!(_arg_1.rid))) || (!(_arg_1.bm.leader))))
            {
                return;
            };
            var _local_2:Object = _arg_1.om;
            var _local_3:String = _arg_1.bm.leader;
            var _local_4:Number = _arg_1.t;
            var _local_5:Number = _arg_1.mid;
            var _local_6:Number = _arg_1.rid;
            var _local_7:Number = _arg_1.bosid;
            var _local_8:String = Language.CROSS_CONTENTION_PANEL_U[158];
            if (!GamePredef.CROSS_CONTENTION_MAP[_local_5])
            {
                return;
            };
            var _local_9:String = GamePredef.CROSS_CONTENTION_MAP[_local_5].name;
            var _local_10:int = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[_local_5]][_local_6].p;
            var _local_11:String = ((Language.CROSS_CONTENTION_PANEL_U[(67 + _local_10)] + "-") + _local_6);
            var _local_12:String = CrossContentionTotalPanel.getServerName(_local_7);
            var _local_13:Date = new Date(_local_4);
            var _local_14:String = ((_local_13.getHours() + ":") + _local_13.getMinutes());
            _local_8 = _local_8.replace("{mname}", _local_9).replace("{rname}", _local_11).replace("{time}", _local_14).replace("{bosid}", _local_12).replace("{leader}", _local_3);
            _core.sysMsg(_local_8);
            _local_8 = Language.CROSS_CONTENTION_PANEL_U[160];
            _local_8 = _local_8.replace("{mname}", _local_9).replace("{rname}", _local_11).replace("{time}", _local_14);
            _core.sysMidNote(_local_8);
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

        private function getAreaAward():void
        {
            _core.remote.call("crossContentionShowTimeAward", null);
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

        public function set banner2(_arg_1:Image):void
        {
            var _local_2:Object = this._336959866banner2;
            if (_local_2 !== _arg_1)
            {
                this._336959866banner2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "banner2", _local_2, _arg_1));
            };
        }

        public function onGetCrossContentionTotalState(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:int;
            var _local_9:Object;
            if (!_arg_1)
            {
                return;
            };
            _ORIGINAL_SERVER_ID = _arg_1.originalServerId;
            if (_arg_1.born)
            {
                GamePredef.CROSS_CONTENTION_MAP_ENTRANCE = _arg_1.born;
                CROSS_CONTENTION_UINT_ID = _arg_1.unit;
                setBornPoint();
            };
            if (!inited)
            {
                getRes();
                inited = true;
            };
            mapData = _arg_1;
            if (_arg_1.lvlType)
            {
                CrossContentionTotalPanel.LEVLE_TYPE = _arg_1.lvlType;
            };
            if (_arg_1.open)
            {
                isOpen = _arg_1.open;
            };
            if (_arg_1.giveup)
            {
                giveup = _arg_1.giveup;
            };
            totalStateList.removeAll();
            serverStateList.removeAll();
            myStateList.removeAll();
            refreshAreas();
            for (_local_2 in ALL_MAP_NAME)
            {
                _local_5 = {};
                _local_5.id = _local_2;
                _local_5.areaname = ALL_MAP_NAME[_local_2].name;
                if ((((_arg_1) && (_arg_1.own)) && (_arg_1.own[_local_2])))
                {
                    _local_5.lordname = Number(_arg_1.own[_local_2]);
                };
                if (((((_arg_1) && (_arg_1.ownInfo)) && (_arg_1.ownInfo[_local_2])) && (_arg_1.ownInfo[_local_2][_ORIGINAL_SERVER_ID])))
                {
                    _local_5.occupynum = _arg_1.ownInfo[_local_2][_ORIGINAL_SERVER_ID];
                }
                else
                {
                    _local_5.occupynum = "0";
                };
                totalStateList.addItem(_local_5);
                if (Number(_local_5.occupynum) > 0)
                {
                    serverStateList.addItem(_local_5);
                };
            };
            _local_3 = {};
            if (((_arg_1) && (_arg_1.my)))
            {
                for (_local_6 in _arg_1.my)
                {
                    _local_7 = _crossContentionGetPridMid(Number(_local_6));
                    _local_8 = _crossContentionGetPridRid(Number(_local_6));
                    _local_9 = _arg_1.my[_local_6];
                    if (!_local_3[_local_7])
                    {
                        _local_3[_local_7] = {"num":0};
                    };
                    if (((_local_9) && (_local_9.state == 1)))
                    {
                        _local_3[_local_7].num++;
                    };
                };
            };
            for (_local_4 in _local_3)
            {
                myStateList.addItem({
                    "id":_local_4,
                    "lordname":ALL_MAP_NAME[_local_4].name,
                    "occupynum":_local_3[_local_4].num
                });
            };
            if (_arg_1.flag)
            {
                setBattleCD(_arg_1.flag);
            };
            super.visible = true;
        }

        public function __btnPointsAward_click(_arg_1:MouseEvent):void
        {
            getPointsAward();
        }

        private function _CrossContentionTotalPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn5 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "lordname";
            _local_1.itemRenderer = _CrossContentionTotalPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn5", _CrossContentionTotalPanel_DataGridColumn5);
            return (_local_1);
        }

        private function lookLastBattleInfo():void
        {
            _core.remote.call("crossContentionLookBattleInfo", null);
        }

        [Bindable(event="propertyChange")]
        public function get btnPointsAward():BasicGlowButton
        {
            return (this._2132384574btnPointsAward);
        }

        public function __btn2_click(_arg_1:MouseEvent):void
        {
            showAttack();
        }

        private function _CrossContentionTotalPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[0];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[1];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[73];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[74];
            _local_1 = totalStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[4];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[5];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[6];
            _local_1 = serverStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[4];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[5];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[6];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[7];
            _local_1 = myStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[4];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[67];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[8];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[9];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[155];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[52];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[53];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[156];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[52];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[53];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[159];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[162];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[123];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[124];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[125];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[27];
        }

        private function showAreaClear():void
        {
            var _local_2:MovieClip;
            var _local_1:int;
            while (_local_1 < mcs.length)
            {
                _local_2 = mcs[_local_1];
                if (_local_2)
                {
                    _local_2.visible = false;
                };
                _local_1++;
            };
        }

        public function ___CrossContentionTotalPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            lookLastBattleInfo();
        }

        public function set ContentionSingleState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._62409574ContentionSingleState;
            if (_local_2 !== _arg_1)
            {
                this._62409574ContentionSingleState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionSingleState", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn1():BasicGlowButton
        {
            return (this._3034453btn1);
        }

        [Bindable(event="propertyChange")]
        public function get btn2():BasicGlowButton
        {
            return (this._3034454btn2);
        }

        [Bindable(event="propertyChange")]
        public function get btn3():BasicGlowButton
        {
            return (this._3034455btn3);
        }

        [Bindable(event="propertyChange")]
        public function get cav1():Canvas
        {
            return (this._3046233cav1);
        }

        [Bindable(event="propertyChange")]
        public function get cav2():Canvas
        {
            return (this._3046234cav2);
        }

        [Bindable(event="propertyChange")]
        public function get cav3():Canvas
        {
            return (this._3046235cav3);
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

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        private function _CrossContentionTotalPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn4 = _local_1;
            _local_1.width = 55;
            _local_1.dataField = "areaname";
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn4", _CrossContentionTotalPanel_DataGridColumn4);
            return (_local_1);
        }

        private function getRes():void
        {
            if (res_load_state != 0)
            {
                return;
            };
            if (!load)
            {
                load = new Loader();
                load.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadError);
                load.load(new URLRequest(ResManager.getResUrl(2060090400042)));
                res_load_state = 1;
            };
        }

        private function refreshAreas():void
        {
            var _local_1:Object;
            var _local_2:MovieClip;
            resetAreas();
            for (_local_1 in ALL_MAP_NAME)
            {
                if ((((mapData) && (mapData.own)) && (mapData.own[_local_1])))
                {
                    _local_2 = areas[_local_1];
                    if (_local_2)
                    {
                        _local_2.gotoAndStop(2);
                    };
                };
            };
        }

        public function set bornImg2(_arg_1:Image):void
        {
            var _local_2:Object = this._2092975032bornImg2;
            if (_local_2 !== _arg_1)
            {
                this._2092975032bornImg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bornImg2", _local_2, _arg_1));
            };
        }

        private function showBtnClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                if (this[("btn" + _local_1)])
                {
                    this[("btn" + _local_1)].selected = false;
                };
                _local_1++;
            };
        }

        private function resetAreas():void
        {
            var _local_2:MovieClip;
            var _local_1:int = 1;
            while (_local_1 <= 39)
            {
                _local_2 = areas[_local_1];
                if (_local_2)
                {
                    _local_2.gotoAndStop(1);
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnFirstOccupyAward():BasicGlowButton
        {
            return (this._1739283322btnFirstOccupyAward);
        }

        public function onShowTimeAward(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1.data))))
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_TIME_AWARD);
            if (_local_2)
            {
                _local_2.open(_arg_1.data);
            };
        }

        public function set bornImg1(_arg_1:Image):void
        {
            var _local_2:Object = this._2092975031bornImg1;
            if (_local_2 !== _arg_1)
            {
                this._2092975031bornImg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bornImg1", _local_2, _arg_1));
            };
        }

        public function onShowScoreAward(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (!(_arg_1.data))))
            {
                return;
            };
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_SCORE_AWARD);
            if (_local_2)
            {
                _local_2.open(_arg_1.data);
            };
        }

        public function onGetCrossContentionConfigData(_arg_1:Object):void
        {
            _ORIGINAL_SERVER_ID = _arg_1.originalServerId;
            getCrossContentionTotalState();
            setBornPoint();
        }

        private function setBornPoint():void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:Array;
            bornImg1.visible = false;
            bornImg2.visible = false;
            var _local_1:int = CROSS_CONTENTION_UINT_ID[_ORIGINAL_SERVER_ID];
            var _local_2:Array = getUnitServersId(_local_1);
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_5 = _local_2[_local_3];
                this[("bornImg" + (_local_3 + 1))].source = ResManager.getIconUrl(bornIcons[_local_5]);
                _local_6 = getBornMid(_ORIGINAL_SERVER_ID);
                if (_local_3 == 0)
                {
                    _local_7 = bornPositions;
                }
                else
                {
                    _local_7 = bornPositions2;
                };
                if (_local_7[_local_6])
                {
                    this[("bornImg" + (_local_3 + 1))].x = _local_7[_local_6][0];
                    this[("bornImg" + (_local_3 + 1))].y = _local_7[_local_6][1];
                };
                this[("bornImg" + (_local_3 + 1))].visible = true;
                _local_3++;
            };
            var _local_4:int = int(_ORIGINAL_SERVER_ID);
            if (malaiServer[_local_4])
            {
                btn1.visible = false;
                btn2.visible = false;
                btn3.visible = false;
            }
            else
            {
                btn1.visible = true;
                btn2.visible = true;
                btn3.visible = true;
            };
        }

        override public function initialize():void
        {
            var target:CrossContentionTotalPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionTotalPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionTotalPanelWatcherSetupUtil");
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

        private function mcClick(_arg_1:MouseEvent):void
        {
            var _local_4:MovieClip;
            var _local_5:*;
            var _local_2:MovieClip = (_arg_1.currentTarget as MovieClip);
            var _local_3:int = 1;
            while (_local_3 <= 39)
            {
                _local_4 = areas[_local_3];
                if (_local_4)
                {
                    if (_local_2 == _local_4)
                    {
                        _local_5 = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_SINGLE_INFO);
                        if (_local_5)
                        {
                            _local_5.showPanel(_local_3);
                        };
                        return;
                    };
                };
                _local_3++;
            };
        }

        private function setBattleCD(_arg_1:Object):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:Date;
            var _local_9:Number;
            var _local_10:Number;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = CrossContentionFightPanel.PVP_NUM;
            var _local_3:int = CrossContentionFightPanel.PVE_NUM;
            pvenum.htmlText = String(_local_3);
            pvpnum.htmlText = String(_local_2);
            if ((((((_arg_1) && (_arg_1.PVP)) && (_arg_1.PVP.timenow)) && (_arg_1.PVP.timestr)) && (String(_arg_1.PVP.timenow) == String(_arg_1.PVP.timestr))))
            {
                _local_4 = int(_arg_1.PVP.validnum);
                _local_5 = 0;
                if (_arg_1.PVP.fightnum != null)
                {
                    _local_5 = int(_arg_1.PVP.fightnum);
                };
                this.pvpnum.htmlText = String((_local_4 - _local_5));
                _local_6 = 0;
                if ((((_arg_1) && (_arg_1.PVP)) && (_arg_1.PVP.cdnum)))
                {
                    _local_6 = int(_arg_1.PVP.cdnum);
                };
                if (_local_6 == 0)
                {
                    _local_7 = Number(0);
                    if ((((_arg_1) && (_arg_1.PVP)) && (_arg_1.PVP.fighttime)))
                    {
                        _local_7 = (Number(_arg_1.PVP.fighttime) + CrossContentionFightPanel.CD_TIME);
                        _local_8 = new Date(_local_7);
                        _local_9 = _local_8.getTime();
                        if (_local_9 > new Date().getTime())
                        {
                        };
                    };
                };
            };
            if ((((((_arg_1) && (_arg_1.PVE)) && (_arg_1.PVE.timenow)) && (_arg_1.PVE.timestr)) && (String(_arg_1.PVE.timenow) == String(_arg_1.PVE.timestr))))
            {
                _local_4 = int(_arg_1.PVE.validnum);
                _local_5 = 0;
                if (_arg_1.PVE.fightnum != null)
                {
                    _local_5 = int(_arg_1.PVE.fightnum);
                };
                this.pvenum.htmlText = String((_local_4 - _local_5));
                _local_6 = 0;
                if ((((_arg_1) && (_arg_1.PVE)) && (_arg_1.PVE.cdnum)))
                {
                    _local_6 = int(_arg_1.PVE.cdnum);
                };
                if (_local_6 == 0)
                {
                    _local_7 = Number(0);
                    if ((((_arg_1) && (_arg_1.PVE)) && (_arg_1.PVE.fighttime)))
                    {
                        _local_7 = (Number(_arg_1.PVE.fighttime) + CrossContentionFightPanel.CD_TIME);
                        _local_8 = new Date(_local_7);
                        _local_10 = _local_8.getTime();
                        if (_local_10 > new Date().getTime())
                        {
                        };
                    };
                };
            };
        }

        private function onItemRollOut(_arg_1:MouseEvent):void
        {
            refreshAreas();
            hideUnitBanner();
        }

        public function set container1(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._145245136container1;
            if (_local_2 !== _arg_1)
            {
                this._145245136container1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container1", _local_2, _arg_1));
            };
        }

        private function showAttack():void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Array;
            var _local_9:int;
            var _local_10:int;
            var _local_11:MovieClip;
            showAreaClear();
            if (btn2.selected)
            {
                btn2.selected = false;
                return;
            };
            showBtnClear();
            btn2.selected = true;
            if (!CROSS_CONTENTION_UINT_ID)
            {
                return;
            };
            var _local_1:int = CROSS_CONTENTION_UINT_ID[_ORIGINAL_SERVER_ID];
            var _local_2:int = getBornMid(_ORIGINAL_SERVER_ID);
            var _local_3:Array = [];
            for (_local_4 in ALL_MAP_NAME)
            {
                if ((((mapData) && (mapData.own)) && (int(mapData.own[_local_4]) == _local_1)))
                {
                    _local_3.push(_local_4);
                };
            };
            _local_5 = {};
            _local_6 = 0;
            while (_local_6 < _local_3.length)
            {
                _local_7 = _local_3[_local_6];
                _local_8 = GamePredef.CROSS_CONTENTION_MAP_LINK[_local_7];
                _local_9 = 0;
                while (_local_9 < _local_8.length)
                {
                    _local_10 = _local_8[_local_9];
                    if (_local_10)
                    {
                        _local_5[_local_10] = true;
                    };
                    _local_9++;
                };
                _local_6++;
            };
            _local_6 = 0;
            while (_local_6 < mcs.length)
            {
                _local_11 = mcs[_local_6];
                if (_local_11)
                {
                    if ((((_local_2 == _local_6) || (_local_3.indexOf(_local_6) > -1)) || (_local_5[_local_6])))
                    {
                        _local_11.visible = true;
                        _local_11.gotoAndStop(2);
                    };
                };
                _local_6++;
            };
        }

        private function getCrossContentionTotalState():void
        {
            showAreaClear();
            showBtnClear();
            _core.remote.call("getCrossContentionTotalState", null);
        }

        private function set serverStateList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1101683508serverStateList;
            if (_local_2 !== _arg_1)
            {
                this._1101683508serverStateList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "serverStateList", _local_2, _arg_1));
            };
        }

        private function _CrossContentionTotalPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn3 = _local_1;
            _local_1.width = 25;
            _local_1.dataField = "occupynum";
            _local_1.setStyle("textAlign", "left");
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn3", _CrossContentionTotalPanel_DataGridColumn3);
            return (_local_1);
        }

        public function __ContentionTotalState_itemClick(_arg_1:ListEvent):void
        {
            onTotalStateItemClickHandler(_arg_1);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            btnClick(1);
        }

        private function _CrossContentionTotalPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CrossContentionTotalPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bornImg1():Image
        {
            return (this._2092975031bornImg1);
        }

        [Bindable(event="propertyChange")]
        public function get bornImg2():Image
        {
            return (this._2092975032bornImg2);
        }

        public function set btnAreaAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._788655404btnAreaAward;
            if (_local_2 !== _arg_1)
            {
                this._788655404btnAreaAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnAreaAward", _local_2, _arg_1));
            };
        }

        public function onGetCrossContentionMyState():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get container1():UIComponent
        {
            return (this._145245136container1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                return;
            };
            getCrossContentionTotalState();
        }

        private function set totalStateList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1265899029totalStateList;
            if (_local_2 !== _arg_1)
            {
                this._1265899029totalStateList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalStateList", _local_2, _arg_1));
            };
        }

        private function _CrossContentionTotalPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionTotalPanel_DataGridColumn2 = _local_1;
            _local_1.width = 35;
            _local_1.dataField = "lordname";
            _local_1.itemRenderer = _CrossContentionTotalPanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_CrossContentionTotalPanel_DataGridColumn2", _CrossContentionTotalPanel_DataGridColumn2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get totalStateList():ArrayCollection
        {
            return (this._1265899029totalStateList);
        }

        public function __ContentionServerState_rollOut(_arg_1:MouseEvent):void
        {
            onItemRollOut(_arg_1);
        }

        private function _CrossContentionTotalPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CrossContentionTotalPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set pvptime(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._193568521pvptime;
            if (_local_2 !== _arg_1)
            {
                this._193568521pvptime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pvptime", _local_2, _arg_1));
            };
        }

        public function ___CrossContentionTotalPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function __btn1_click(_arg_1:MouseEvent):void
        {
            showBoss();
        }


    }
}//package com.qeedoo.ui.view.compDragable

