// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.NewServerActPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.DataGrid;
    import mx.controls.List;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.containers.ViewStack;
    import mx.core.UIComponentDescriptor;
    import mx.controls.VRule;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.FlexEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererItemArray;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.RendererItemButton;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.collections.ArrayCollection;
    import mx.events.ListEvent;
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

    public class NewServerActPanel extends DragableCanvas implements IBindingClient 
    {

        public static const NEW_ICON:Class = NewServerActPanel_NEW_ICON;
        public static const LEVEL_ICON:Class = NewServerActPanel_LEVEL_ICON;
        public static const ACTIVE_ICON:Class = NewServerActPanel_ACTIVE_ICON;
        public static const GUILD_ICON:Class = NewServerActPanel_GUILD_ICON;
        public static const ACH_RANK_ICON:Class = NewServerActPanel_ACH_RANK_ICON;
        public static const MONEY_RANK_ICON:Class = NewServerActPanel_MONEY_RANK_ICON;
        public static const BATTLE_ICON:Class = NewServerActPanel_BATTLE_ICON;
        public static const TB_RANK_ICON:Class = NewServerActPanel_TB_RANK_ICON;
        public static const POP_RANK_ICON:Class = NewServerActPanel_POP_RANK_ICON;
        public static const LEVEL_UP_ICON:Class = NewServerActPanel_LEVEL_UP_ICON;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var lastSelectedIndex:int = -1;
        private var _1258276178awardBtn1:BasicGlowButton;
        private var _873453349title3:IntroText;
        private var _1258276182awardBtn5:BasicGlowButton;
        private var _1422987715actDG2:DataGrid;
        private var _873453352title0:IntroText;
        private var _1759725291idViewLists:List;
        private var _1422987709actDG8:DataGrid;
        private var _1258276184awardBtn7:BasicGlowButton;
        private var _873453346title6:IntroText;
        private var _1422987712actDG5:DataGrid;
        private var _1020731909myLevel3:Label;
        private var _1020731907myLevel5:Label;
        private var _1020731905myLevel7:Label;
        private var _873453343title9:IntroText;
        private var _1258276186awardBtn9:BasicGlowButton;
        public var _NewServerActPanel_Image1:Image;
        public var _NewServerActPanel_Image3:Image;
        public var _NewServerActPanel_Image5:Image;
        public var _NewServerActPanel_Image7:Image;
        public var _NewServerActPanel_Image2:Image;
        public var _NewServerActPanel_Image4:Image;
        public var _NewServerActPanel_Image6:Image;
        public var _NewServerActPanel_Image8:Image;
        private var _1422987717actDG0:DataGrid;
        public var _NewServerActPanel_Image9:Image;
        private var _1020731912myLevel0:Label;
        private var _1020731903myLevel9:Label;
        private var _1020731910myLevel2:Label;
        private var _873453348title4:IntroText;
        private var _873453351title1:IntroText;
        private var _1258276177awardBtn0:BasicGlowButton;
        private var _1422987714actDG3:DataGrid;
        private var _1258276181awardBtn4:BasicGlowButton;
        private var _1422987708actDG9:DataGrid;
        private var _873453345title7:IntroText;
        private var _1577918118myLevel13:Label;
        public var _NewServerActPanel_DataGridColumn1:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn2:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn3:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn4:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn8:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn5:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn6:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn7:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn9:DataGridColumn;
        private var _1422987711actDG6:DataGrid;
        public var _NewServerActPanel_DataGridColumn10:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn11:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn12:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn13:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn14:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn15:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn16:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn17:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn18:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn19:DataGridColumn;
        private var actIndex:Array;
        private var _1422987716actDG1:DataGrid;
        private var _1307250054title13:IntroText;
        public var _NewServerActPanel_DataGridColumn20:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn21:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn22:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn23:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn24:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn25:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn26:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn27:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn28:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn29:DataGridColumn;
        public var _NewServerActPanel_Image10:Image;
        public var _NewServerActPanel_Image11:Image;
        private var _1258276183awardBtn6:BasicGlowButton;
        private var _1258276185awardBtn8:BasicGlowButton;
        private var _1020731908myLevel4:Label;
        private var _1020731906myLevel6:Label;
        public var _NewServerActPanel_DataGridColumn30:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn31:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn32:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn33:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn35:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn36:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn37:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn38:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn39:DataGridColumn;
        private var _873453347title5:IntroText;
        public var _NewServerActPanel_DataGridColumn34:DataGridColumn;
        private var _1020731911myLevel1:Label;
        public var isInited:Boolean = false;
        private var _1020731904myLevel8:Label;
        private var _1422987713actDG4:DataGrid;
        public var _NewServerActPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1162946185actDG13:DataGrid;
        public var _NewServerActPanel_DataGridColumn40:DataGridColumn;
        public var _NewServerActPanel_DataGridColumn41:DataGridColumn;
        private var _873453350title2:IntroText;
        private var _1644172819idViews:ViewStack;
        private var wlListItemArr:Array;
        private var _1258276180awardBtn3:BasicGlowButton;
        private var _873453344title8:IntroText;
        private var _1422987710actDG7:DataGrid;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":672,
                    "height":444,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_NewServerActPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":List,
                        "id":"idViewLists",
                        "events":{
                            "change":"__idViewLists_change",
                            "creationComplete":"__idViewLists_creationComplete"
                        },
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.bottom = "10";
                            this.backgroundAlpha = 0;
                            this.fontSize = 12;
                            this.fontWeight = "bold";
                            this.left = "9";
                            this.textRollOverColor = 16366965;
                            this.textSelectedColor = 1961723;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":107});
                        }
                    }), new UIComponentDescriptor({
                        "type":VRule,
                        "stylesFactory":function ():void
                        {
                            this.top = "40";
                            this.bottom = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"x":120});
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"idViews",
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "10";
                            this.top = "40";
                            this.left = "130";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___NewServerActPanel_Canvas1_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn0",
                                                            "events":{"click":"__awardBtn0_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn1_i(), _NewServerActPanel_DataGridColumn2_i(), _NewServerActPanel_DataGridColumn3_i(), _NewServerActPanel_DataGridColumn4_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas3_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn1",
                                                            "events":{"click":"__awardBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "variableRowHeight":true,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn5_i(), _NewServerActPanel_DataGridColumn6_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas5_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "175";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "variableRowHeight":true,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn7_i(), _NewServerActPanel_DataGridColumn8_i(), _NewServerActPanel_DataGridColumn9_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas7_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn3",
                                                            "events":{"click":"__awardBtn3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "variableRowHeight":true,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn10_i(), _NewServerActPanel_DataGridColumn11_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas9_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn4",
                                                            "events":{"click":"__awardBtn4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn12_i(), _NewServerActPanel_DataGridColumn13_i(), _NewServerActPanel_DataGridColumn14_i(), _NewServerActPanel_DataGridColumn15_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas11_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image6",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn5",
                                                            "events":{"click":"__awardBtn5_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn16_i(), _NewServerActPanel_DataGridColumn17_i(), _NewServerActPanel_DataGridColumn18_i(), _NewServerActPanel_DataGridColumn19_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas13_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image7",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn6",
                                                            "events":{"click":"__awardBtn6_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn20_i(), _NewServerActPanel_DataGridColumn21_i(), _NewServerActPanel_DataGridColumn22_i(), _NewServerActPanel_DataGridColumn23_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas15_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn7",
                                                            "events":{"click":"__awardBtn7_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn24_i(), _NewServerActPanel_DataGridColumn25_i(), _NewServerActPanel_DataGridColumn26_i(), _NewServerActPanel_DataGridColumn27_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas17_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn8",
                                                            "events":{"click":"__awardBtn8_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn28_i(), _NewServerActPanel_DataGridColumn29_i(), _NewServerActPanel_DataGridColumn30_i(), _NewServerActPanel_DataGridColumn31_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas19_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":410,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"awardBtn9",
                                                            "events":{"click":"__awardBtn9_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":430,
                                                                    "y":147,
                                                                    "height":25,
                                                                    "styleName":"BtnStdRed",
                                                                    "enabled":false,
                                                                    "width":80
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG9",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn32_i(), _NewServerActPanel_DataGridColumn33_i(), _NewServerActPanel_DataGridColumn34_i(), _NewServerActPanel_DataGridColumn35_i()]
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
                                    "events":{"show":"___NewServerActPanel_Canvas21_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "0";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_NewServerActPanel_Image11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":5,
                                                                    "width":500,
                                                                    "height":75
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"title13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":85,
                                                                    "width":500,
                                                                    "height":60
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"myLevel13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":150,
                                                                    "width":500,
                                                                    "height":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"actDG13",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingTop = 1;
                                                                this.paddingBottom = 1;
                                                                this.left = "10";
                                                                this.top = "180";
                                                                this.right = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "variableRowHeight":true,
                                                                    "draggableColumns":false,
                                                                    "columns":[_NewServerActPanel_DataGridColumn36_i(), _NewServerActPanel_DataGridColumn37_i(), _NewServerActPanel_DataGridColumn38_i(), _NewServerActPanel_DataGridColumn39_i(), _NewServerActPanel_DataGridColumn40_i(), _NewServerActPanel_DataGridColumn41_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]});
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var allActArr:Array = [Language.SERVERACTPANEL_S[0], Language.SERVERACTPANEL_S[1], Language.SERVERACTPANEL_S[2], Language.SERVERACTPANEL_S[3], Language.SERVERACTPANEL_S[4], Language.SERVERACTPANEL_S[5], Language.SERVERACTPANEL_S[6], Language.SERVERACTPANEL_S[7], Language.SERVERACTPANEL_S[8], Language.SERVERACTPANEL_S[9], Language.SERVERACTPANEL_S[35], Language.SERVERACTPANEL_S[36], Language.SERVERACTPANEL_S[34], Language.SERVERACTPANEL_S[49], Language.GAMEINTROPANEL_U[51]];
        private var fieldList:Object = {
            "memberNum":Language.SERVERACTPANEL_S[25],
            "actPoint":Language.SERVERACTPANEL_S[24],
            "exp":Language.SERVERACTPANEL_S[21],
            "achPoint":Language.SERVERACTPANEL_S[28],
            "money":Language.SERVERACTPANEL_S[29],
            "expBattle":Language.SERVERACTPANEL_S[30],
            "totalBp":Language.SERVERACTPANEL_S[31],
            "pop":Language.SERVERACTPANEL_S[32],
            "pet":Language.SERVERACTPANEL_S[33]
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function NewServerActPanel()
        {
            mx_internal::_document = this;
            this.width = 672;
            this.height = 444;
            this.styleName = "StandardContent";
            this.x = 135;
            this.y = 308;
            this.addEventListener("creationComplete", ___NewServerActPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            NewServerActPanel._watcherSetupUtil = _arg_1;
        }


        public function ___NewServerActPanel_Canvas13_show(_arg_1:FlexEvent):void
        {
            initActPanel(6);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel4():Label
        {
            return (this._1020731908myLevel4);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel5():Label
        {
            return (this._1020731907myLevel5);
        }

        public function set myLevel3(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731909myLevel3;
            if (_local_2 !== _arg_1)
            {
                this._1020731909myLevel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myLevel7():Label
        {
            return (this._1020731905myLevel7);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel0():Label
        {
            return (this._1020731912myLevel0);
        }

        public function __awardBtn7_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(7);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel2():Label
        {
            return (this._1020731910myLevel2);
        }

        public function set myLevel1(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731911myLevel1;
            if (_local_2 !== _arg_1)
            {
                this._1020731911myLevel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel1", _local_2, _arg_1));
            };
        }

        public function set myLevel6(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731906myLevel6;
            if (_local_2 !== _arg_1)
            {
                this._1020731906myLevel6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel6", _local_2, _arg_1));
            };
        }

        public function set myLevel7(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731905myLevel7;
            if (_local_2 !== _arg_1)
            {
                this._1020731905myLevel7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myLevel8():Label
        {
            return (this._1020731904myLevel8);
        }

        public function set myLevel4(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731908myLevel4;
            if (_local_2 !== _arg_1)
            {
                this._1020731908myLevel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get myLevel1():Label
        {
            return (this._1020731911myLevel1);
        }

        public function set myLevel5(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731907myLevel5;
            if (_local_2 !== _arg_1)
            {
                this._1020731907myLevel5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get idViews():ViewStack
        {
            return (this._1644172819idViews);
        }

        public function set title8(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453344title8;
            if (_local_2 !== _arg_1)
            {
                this._873453344title8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title8", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn3 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn3", _NewServerActPanel_DataGridColumn3);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn20_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn20 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn20", _NewServerActPanel_DataGridColumn20);
            return (_local_1);
        }

        public function set myLevel8(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731904myLevel8;
            if (_local_2 !== _arg_1)
            {
                this._1020731904myLevel8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel8", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn28_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn28 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn28", _NewServerActPanel_DataGridColumn28);
            return (_local_1);
        }

        private function _NewServerActPanel_ClassFactory8_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel9():Label
        {
            return (this._1020731903myLevel9);
        }

        public function set myLevel9(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731903myLevel9;
            if (_local_2 !== _arg_1)
            {
                this._1020731903myLevel9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel9", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_NewServerActPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (wlListItemArr);
            }, function (_arg_1:Object):void
            {
                idViewLists.dataProvider = _arg_1;
            }, "idViewLists.dataProvider");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (NEW_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image1.source = _arg_1;
            }, "_NewServerActPanel_Image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title0.text = _arg_1;
            }, "title0.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel0.text = _arg_1;
            }, "myLevel0.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn0.label = _arg_1;
            }, "awardBtn0.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn1.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn1.headerText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn2.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn2.headerText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn3.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn3.headerText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn4.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn4.headerText");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (LEVEL_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image2.source = _arg_1;
            }, "_NewServerActPanel_Image2.source");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title1.text = _arg_1;
            }, "title1.text");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel1.text = _arg_1;
            }, "myLevel1.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn1.label = _arg_1;
            }, "awardBtn1.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn5.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn5.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn6.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn6.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ACTIVE_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image3.source = _arg_1;
            }, "_NewServerActPanel_Image3.source");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title2.text = _arg_1;
            }, "title2.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel2.text = _arg_1;
            }, "myLevel2.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn7.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn7.headerText");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn8.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn8.headerText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn9.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn9.headerText");
            result[21] = binding;
            binding = new Binding(this, function ():Object
            {
                return (GUILD_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image4.source = _arg_1;
            }, "_NewServerActPanel_Image4.source");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title3.text = _arg_1;
            }, "title3.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel3.text = _arg_1;
            }, "myLevel3.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn3.label = _arg_1;
            }, "awardBtn3.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn10.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn10.headerText");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn11.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn11.headerText");
            result[27] = binding;
            binding = new Binding(this, function ():Object
            {
                return (NEW_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image5.source = _arg_1;
            }, "_NewServerActPanel_Image5.source");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title4.text = _arg_1;
            }, "title4.text");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel4.text = _arg_1;
            }, "myLevel4.text");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn4.label = _arg_1;
            }, "awardBtn4.label");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn12.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn12.headerText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn13.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn13.headerText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn14.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn14.headerText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn15.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn15.headerText");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ACH_RANK_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image6.source = _arg_1;
            }, "_NewServerActPanel_Image6.source");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title5.text = _arg_1;
            }, "title5.text");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel5.text = _arg_1;
            }, "myLevel5.text");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn5.label = _arg_1;
            }, "awardBtn5.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn16.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn16.headerText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn17.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn17.headerText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn18.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn18.headerText");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn19.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn19.headerText");
            result[43] = binding;
            binding = new Binding(this, function ():Object
            {
                return (MONEY_RANK_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image7.source = _arg_1;
            }, "_NewServerActPanel_Image7.source");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title6.text = _arg_1;
            }, "title6.text");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel6.text = _arg_1;
            }, "myLevel6.text");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn6.label = _arg_1;
            }, "awardBtn6.label");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn20.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn20.headerText");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn21.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn21.headerText");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn22.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn22.headerText");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn23.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn23.headerText");
            result[51] = binding;
            binding = new Binding(this, function ():Object
            {
                return (BATTLE_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image8.source = _arg_1;
            }, "_NewServerActPanel_Image8.source");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title7.text = _arg_1;
            }, "title7.text");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel7.text = _arg_1;
            }, "myLevel7.text");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn7.label = _arg_1;
            }, "awardBtn7.label");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn24.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn24.headerText");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn25.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn25.headerText");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn26.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn26.headerText");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn27.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn27.headerText");
            result[59] = binding;
            binding = new Binding(this, function ():Object
            {
                return (TB_RANK_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image9.source = _arg_1;
            }, "_NewServerActPanel_Image9.source");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title8.text = _arg_1;
            }, "title8.text");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel8.text = _arg_1;
            }, "myLevel8.text");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn8.label = _arg_1;
            }, "awardBtn8.label");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn28.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn28.headerText");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn29.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn29.headerText");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn30.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn30.headerText");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn31.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn31.headerText");
            result[67] = binding;
            binding = new Binding(this, function ():Object
            {
                return (POP_RANK_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image10.source = _arg_1;
            }, "_NewServerActPanel_Image10.source");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title9.text = _arg_1;
            }, "title9.text");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel9.text = _arg_1;
            }, "myLevel9.text");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn9.label = _arg_1;
            }, "awardBtn9.label");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn32.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn32.headerText");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn33.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn33.headerText");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn34.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn34.headerText");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn35.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn35.headerText");
            result[75] = binding;
            binding = new Binding(this, function ():Object
            {
                return (LEVEL_UP_ICON);
            }, function (_arg_1:Object):void
            {
                _NewServerActPanel_Image11.source = _arg_1;
            }, "_NewServerActPanel_Image11.source");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title13.text = _arg_1;
            }, "title13.text");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                myLevel13.text = _arg_1;
            }, "myLevel13.text");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn36.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn36.headerText");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn37.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn37.headerText");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn38.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn38.headerText");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn39.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn39.headerText");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn40.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn40.headerText");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.SERVERACTPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _NewServerActPanel_DataGridColumn41.headerText = _arg_1;
            }, "_NewServerActPanel_DataGridColumn41.headerText");
            result[84] = binding;
            return (result);
        }

        private function _NewServerActPanel_ClassFactory13_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemButton;
            return (_local_1);
        }

        public function set idViewLists(_arg_1:List):void
        {
            var _local_2:Object = this._1759725291idViewLists;
            if (_local_2 !== _arg_1)
            {
                this._1759725291idViewLists = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idViewLists", _local_2, _arg_1));
            };
        }

        public function set idViews(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._1644172819idViews;
            if (_local_2 !== _arg_1)
            {
                this._1644172819idViews = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idViews", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn31_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn31 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory10_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn31", _NewServerActPanel_DataGridColumn31);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get actDG0():DataGrid
        {
            return (this._1422987717actDG0);
        }

        [Bindable(event="propertyChange")]
        public function get actDG2():DataGrid
        {
            return (this._1422987715actDG2);
        }

        private function _NewServerActPanel_DataGridColumn39_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn39 = _local_1;
            _local_1.dataField = "goldbind";
            _local_1.width = 40;
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn39", _NewServerActPanel_DataGridColumn39);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get actDG5():DataGrid
        {
            return (this._1422987712actDG5);
        }

        [Bindable(event="propertyChange")]
        public function get actDG6():DataGrid
        {
            return (this._1422987711actDG6);
        }

        [Bindable(event="propertyChange")]
        public function get actDG7():DataGrid
        {
            return (this._1422987710actDG7);
        }

        [Bindable(event="propertyChange")]
        public function get actDG1():DataGrid
        {
            return (this._1422987716actDG1);
        }

        public function __awardBtn4_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(4);
        }

        [Bindable(event="propertyChange")]
        public function get actDG4():DataGrid
        {
            return (this._1422987713actDG4);
        }

        [Bindable(event="propertyChange")]
        public function get actDG8():DataGrid
        {
            return (this._1422987709actDG8);
        }

        private function _NewServerActPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn2 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn2", _NewServerActPanel_DataGridColumn2);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn27_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn27 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory9_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn27", _NewServerActPanel_DataGridColumn27);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn16_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn16 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn16", _NewServerActPanel_DataGridColumn16);
            return (_local_1);
        }

        public function ___NewServerActPanel_Canvas9_show(_arg_1:FlexEvent):void
        {
            initActPanel(4);
        }

        [Bindable(event="propertyChange")]
        public function get actDG9():DataGrid
        {
            return (this._1422987708actDG9);
        }

        private function _NewServerActPanel_ClassFactory7_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get actDG3():DataGrid
        {
            return (this._1422987714actDG3);
        }

        private function _NewServerActPanel_ClassFactory12_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        public function ___NewServerActPanel_Canvas17_show(_arg_1:FlexEvent):void
        {
            initActPanel(8);
        }

        private function _NewServerActPanel_DataGridColumn30_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn30 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn30", _NewServerActPanel_DataGridColumn30);
            return (_local_1);
        }

        public function set actDG2(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987715actDG2;
            if (_local_2 !== _arg_1)
            {
                this._1422987715actDG2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG2", _local_2, _arg_1));
            };
        }

        public function __awardBtn1_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(1);
        }

        public function set actDG3(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987714actDG3;
            if (_local_2 !== _arg_1)
            {
                this._1422987714actDG3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG3", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn15_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn15 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory6_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn15", _NewServerActPanel_DataGridColumn15);
            return (_local_1);
        }

        public function set actDG1(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987716actDG1;
            if (_local_2 !== _arg_1)
            {
                this._1422987716actDG1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG1", _local_2, _arg_1));
            };
        }

        public function set actDG5(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987712actDG5;
            if (_local_2 !== _arg_1)
            {
                this._1422987712actDG5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title13():IntroText
        {
            return (this._1307250054title13);
        }

        public function set actDG6(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987711actDG6;
            if (_local_2 !== _arg_1)
            {
                this._1422987711actDG6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG6", _local_2, _arg_1));
            };
        }

        public function __awardBtn9_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(9);
        }

        private function _NewServerActPanel_DataGridColumn38_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn38 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 220;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory12_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn38", _NewServerActPanel_DataGridColumn38);
            return (_local_1);
        }

        public function set actDG8(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987709actDG8;
            if (_local_2 !== _arg_1)
            {
                this._1422987709actDG8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG8", _local_2, _arg_1));
            };
        }

        public function set actDG9(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987708actDG9;
            if (_local_2 !== _arg_1)
            {
                this._1422987708actDG9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG9", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn1 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn1", _NewServerActPanel_DataGridColumn1);
            return (_local_1);
        }

        public function set actDG4(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987713actDG4;
            if (_local_2 !== _arg_1)
            {
                this._1422987713actDG4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG4", _local_2, _arg_1));
            };
        }

        public function set actDG0(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987717actDG0;
            if (_local_2 !== _arg_1)
            {
                this._1422987717actDG0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG0", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn9 = _local_1;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory4_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn9", _NewServerActPanel_DataGridColumn9);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn26_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn26 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn26", _NewServerActPanel_DataGridColumn26);
            return (_local_1);
        }

        public function toggleLists():void
        {
            var _local_1:Object;
            if (((actIndex[idViewLists.selectedIndex] > 9) && (!(actIndex[idViewLists.selectedIndex] == 13))))
            {
                _local_1 = _core.view.getUI(ViewManager.PANEL_GAMEINTRO);
                if (_local_1)
                {
                    _local_1.visible = true;
                    _local_1.newServerActLink(actIndex[idViewLists.selectedIndex]);
                };
                if (lastSelectedIndex)
                {
                    idViewLists.selectedIndex = lastSelectedIndex;
                };
            }
            else
            {
                if (actIndex[idViewLists.selectedIndex] == 13)
                {
                    idViews.selectedIndex = 10;
                    if (lastSelectedIndex != idViewLists.selectedIndex)
                    {
                        lastSelectedIndex = idViewLists.selectedIndex;
                    };
                }
                else
                {
                    idViews.selectedIndex = actIndex[idViewLists.selectedIndex];
                    if (lastSelectedIndex != idViewLists.selectedIndex)
                    {
                        lastSelectedIndex = idViewLists.selectedIndex;
                    };
                };
            };
        }

        public function set awardBtn9(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276186awardBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1258276186awardBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn9", _local_2, _arg_1));
            };
        }

        public function set awardBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276183awardBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1258276183awardBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn6", _local_2, _arg_1));
            };
        }

        public function takeSectionAward(_arg_1:int, _arg_2:int):void
        {
            _core.remote.call("takeSectionAward", null, _arg_1, (_arg_2 - 1));
        }

        public function ___NewServerActPanel_Canvas3_show(_arg_1:FlexEvent):void
        {
            initActPanel(1);
        }

        public function set awardBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276177awardBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1258276177awardBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn0", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn14 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn14", _NewServerActPanel_DataGridColumn14);
            return (_local_1);
        }

        public function set awardBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276184awardBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1258276184awardBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn7", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_ClassFactory6_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        public function ___NewServerActPanel_Canvas11_show(_arg_1:FlexEvent):void
        {
            initActPanel(5);
        }

        private function _NewServerActPanel_DataGridColumn41_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn41 = _local_1;
            _local_1.width = 100;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory13_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn41", _NewServerActPanel_DataGridColumn41);
            return (_local_1);
        }

        public function __awardBtn6_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(6);
        }

        public function set actDG7(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1422987710actDG7;
            if (_local_2 !== _arg_1)
            {
                this._1422987710actDG7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG7", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_ClassFactory11_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        public function set awardBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276182awardBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1258276182awardBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn5", _local_2, _arg_1));
            };
        }

        public function set awardBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276178awardBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1258276178awardBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn1", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn8 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 300;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn8", _NewServerActPanel_DataGridColumn8);
            return (_local_1);
        }

        public function set awardBtn8(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276185awardBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1258276185awardBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn8", _local_2, _arg_1));
            };
        }

        public function ___NewServerActPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set awardBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276181awardBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1258276181awardBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title0():IntroText
        {
            return (this._873453352title0);
        }

        [Bindable(event="propertyChange")]
        public function get title1():IntroText
        {
            return (this._873453351title1);
        }

        [Bindable(event="propertyChange")]
        public function get title3():IntroText
        {
            return (this._873453349title3);
        }

        [Bindable(event="propertyChange")]
        public function get title5():IntroText
        {
            return (this._873453347title5);
        }

        private function _NewServerActPanel_DataGridColumn37_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn37 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 50;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn37", _NewServerActPanel_DataGridColumn37);
            return (_local_1);
        }

        public function set awardBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1258276180awardBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1258276180awardBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn3", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn25_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn25 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 50;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn25", _NewServerActPanel_DataGridColumn25);
            return (_local_1);
        }

        private function _NewServerActPanel_ClassFactory5_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function _NewServerActPanel_ClassFactory10_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get title8():IntroText
        {
            return (this._873453344title8);
        }

        [Bindable(event="propertyChange")]
        public function get title9():IntroText
        {
            return (this._873453343title9);
        }

        public function set title13(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1307250054title13;
            if (_local_2 !== _arg_1)
            {
                this._1307250054title13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title13", _local_2, _arg_1));
            };
        }

        public function set actDG13(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1162946185actDG13;
            if (_local_2 !== _arg_1)
            {
                this._1162946185actDG13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actDG13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title6():IntroText
        {
            return (this._873453346title6);
        }

        private function _NewServerActPanel_DataGridColumn40_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn40 = _local_1;
            _local_1.dataField = "remain";
            _local_1.width = 80;
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn40", _NewServerActPanel_DataGridColumn40);
            return (_local_1);
        }

        public function set myLevel13(_arg_1:Label):void
        {
            var _local_2:Object = this._1577918118myLevel13;
            if (_local_2 !== _arg_1)
            {
                this._1577918118myLevel13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel13", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn13 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 50;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn13", _NewServerActPanel_DataGridColumn13);
            return (_local_1);
        }

        public function __awardBtn3_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(3);
        }

        [Bindable(event="propertyChange")]
        public function get title4():IntroText
        {
            return (this._873453348title4);
        }

        public function __idViewLists_creationComplete(_arg_1:FlexEvent):void
        {
            idViewLists.selectedIndex = 0;
        }

        private function timeToDate2(_arg_1:Number):String
        {
            var _local_2:Date = new Date();
            if (_arg_1)
            {
                _local_2 = new Date(_arg_1);
            };
            return (((((((_local_2.getMonth() + 1) + "/") + _local_2.getDate()) + " ") + ((_local_2.getHours() < 10) ? ("0" + _local_2.getHours()) : _local_2.getHours())) + ":") + ((_local_2.getMinutes() < 10) ? ("0" + _local_2.getMinutes()) : _local_2.getMinutes()));
        }

        [Bindable(event="propertyChange")]
        public function get title2():IntroText
        {
            return (this._873453350title2);
        }

        private function _NewServerActPanel_DataGridColumn36_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn36 = _local_1;
            _local_1.dataField = "end";
            _local_1.width = 80;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn36", _NewServerActPanel_DataGridColumn36);
            return (_local_1);
        }

        public function changeTakeBtnState(_arg_1:String, _arg_2:Object):*
        {
            var _local_7:String;
            var _local_3:* = "";
            if (((!(_arg_1 == "2")) && (!(_arg_1 == "13"))))
            {
                _local_3 = "awardBtn";
            };
            if (_local_3 != "")
            {
                if (_arg_2.isTaken)
                {
                    this[(_local_3 + _arg_1)].enabled = false;
                    this[(_local_3 + _arg_1)].label = Language.SERVERACTPANEL_S[14];
                }
                else
                {
                    if (_arg_2.canTake)
                    {
                        this[(_local_3 + _arg_1)].enabled = true;
                    }
                    else
                    {
                        this[(_local_3 + _arg_1)].enabled = false;
                    };
                    this[(_local_3 + _arg_1)].label = Language.SERVERACTPANEL_S[13];
                };
            };
            var _local_4:* = "";
            var _local_5:* = "";
            if ((((!(_arg_1 == "13")) && (_arg_2.showRank)) && (_arg_2.rank)))
            {
                _local_4 = (_local_4 + Language.SERVERACTPANEL_S[18].replace("{rank}", ((_arg_2.rank < 0) ? Language.SERVERACTPANEL_S[15] : _arg_2.rank)));
            };
            if (((!(_arg_1 == "13")) && ((_local_4.indexOf(Language.SERVERACTPANEL_S[15]) < 0) || (_local_4 == ""))))
            {
                _local_5 = Language.SERVERACTPANEL_S[12].replace("{name}", fieldList[_arg_2.label]).replace("{num}", _arg_2.point);
                _local_4 = (_local_4 + _local_5);
            };
            if (_arg_1 == "2")
            {
                _local_4 = (_local_4 + Language.SERVERACTPANEL_S[44]);
            }
            else
            {
                if (_arg_1 == "13")
                {
                    _local_4 = (_local_4 + Language.SERVERACTPANEL_S[12].replace("{name}", Language.SERVERACTPANEL_S[21]).replace("{num}", _arg_2.point));
                    _local_4 = (_local_4 + Language.SERVERACTPANEL_S[55].replace("{time1}", timeToDate(_arg_2.startTime)).replace("{time2}", timeToDate(_arg_2.closeTime)));
                }
                else
                {
                    if (_local_5 != "")
                    {
                        _local_4 = (_local_4 + "，");
                    };
                    if (_arg_2.awardTime)
                    {
                        _local_4 = (_local_4 + Language.SERVERACTPANEL_S[47].replace("{time1}", timeToDate(_arg_2.startTime)).replace("{time2}", timeToDate(_arg_2.endTime)).replace("{time3}", timeToDate(_arg_2.awardTime)).replace("{time4}", timeToDate(_arg_2.closeTime)));
                    }
                    else
                    {
                        _local_4 = (_local_4 + Language.SERVERACTPANEL_S[19].replace("{time1}", timeToDate(_arg_2.startTime)).replace("{time2}", timeToDate(_arg_2.endTime)).replace("{time3}", timeToDate(_arg_2.closeTime)));
                    };
                };
            };
            var _local_6:int = ToolKit.getSpliceIndex(_local_4, 380);
            if (((_local_6 > 0) && (!(_arg_1 == "13"))))
            {
                _local_7 = (_local_4.substr(0, _local_6) + "\n");
                _local_4 = (_local_7 + _local_4.substring(_local_6, _local_4.length));
            };
            if (_arg_1 == "13")
            {
                _local_4 = (_local_4 + Language.SERVERACTPANEL_S[57]);
            };
            this[("myLevel" + _arg_1)].text = _local_4;
        }

        public function init():void
        {
            _core.remote.call("getStartingActList", new Responder(onGetStartingActList), null);
        }

        private function _NewServerActPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn7 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 80;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn7", _NewServerActPanel_DataGridColumn7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get idViewLists():List
        {
            return (this._1759725291idViewLists);
        }

        private function _NewServerActPanel_DataGridColumn24_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn24 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn24", _NewServerActPanel_DataGridColumn24);
            return (_local_1);
        }

        private function _NewServerActPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemButton;
            return (_local_1);
        }

        public function ___NewServerActPanel_Canvas15_show(_arg_1:FlexEvent):void
        {
            initActPanel(7);
        }

        private function _NewServerActPanel_DataGridColumn35_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn35 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory11_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn35", _NewServerActPanel_DataGridColumn35);
            return (_local_1);
        }

        public function __awardBtn0_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(0);
        }

        public function takeActRankAward(_arg_1:int):*
        {
            _core.remote.call("takeActRankAward", null, _arg_1);
        }

        private function _NewServerActPanel_DataGridColumn23_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn23 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory8_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn23", _NewServerActPanel_DataGridColumn23);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn6():BasicGlowButton
        {
            return (this._1258276183awardBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn1():BasicGlowButton
        {
            return (this._1258276178awardBtn1);
        }

        private function _NewServerActPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        public function __awardBtn8_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(8);
        }

        private function _NewServerActPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn12 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn12", _NewServerActPanel_DataGridColumn12);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn6 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn6", _NewServerActPanel_DataGridColumn6);
            return (_local_1);
        }

        public function ___NewServerActPanel_Canvas1_show(_arg_1:FlexEvent):void
        {
            initActPanel(0);
        }

        public function ___NewServerActPanel_Canvas7_show(_arg_1:FlexEvent):void
        {
            initActPanel(3);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn9():BasicGlowButton
        {
            return (this._1258276186awardBtn9);
        }

        [Bindable(event="propertyChange")]
        public function get actDG13():DataGrid
        {
            return (this._1162946185actDG13);
        }

        private function _NewServerActPanel_DataGridColumn19_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn19 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory7_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn19", _NewServerActPanel_DataGridColumn19);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn4():BasicGlowButton
        {
            return (this._1258276181awardBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn5():BasicGlowButton
        {
            return (this._1258276182awardBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get myLevel13():Label
        {
            return (this._1577918118myLevel13);
        }

        private function _NewServerActPanel_DataGridColumn34_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn34 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn34", _NewServerActPanel_DataGridColumn34);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn0():BasicGlowButton
        {
            return (this._1258276177awardBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn3():BasicGlowButton
        {
            return (this._1258276180awardBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn7():BasicGlowButton
        {
            return (this._1258276184awardBtn7);
        }

        override public function initialize():void
        {
            var target:NewServerActPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _NewServerActPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_NewServerActPanelWatcherSetupUtil");
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

        private function _NewServerActPanel_DataGridColumn22_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn22 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn22", _NewServerActPanel_DataGridColumn22);
            return (_local_1);
        }

        public function __awardBtn5_click(_arg_1:MouseEvent):void
        {
            takeActRankAward(5);
        }

        private function _NewServerActPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn5", _NewServerActPanel_DataGridColumn5);
            return (_local_1);
        }

        private function _NewServerActPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn8():BasicGlowButton
        {
            return (this._1258276185awardBtn8);
        }

        public function updateActAwardInfo(_arg_1:Object):void
        {
            var _local_2:ArrayCollection;
            var _local_3:int;
            var _local_4:*;
            var _local_5:Object;
            if (_arg_1)
            {
                if (_arg_1.actInfo)
                {
                    _local_2 = new ArrayCollection();
                    _local_3 = 0;
                    for (_local_4 in _arg_1.actInfo)
                    {
                        _local_5 = new Object();
                        _local_5.index = (_local_3 + 1);
                        switch (_arg_1.type)
                        {
                            case 0:
                            case 4:
                            case 5:
                            case 6:
                            case 7:
                            case 8:
                            case 9:
                                _local_5.rank = ((_arg_1.actInfo[_local_4]["value"]) ? _arg_1.actInfo[_local_4]["value"] : "");
                                _local_5.name = ((_arg_1.actInfo[_local_4]["key"]) ? _arg_1.actInfo[_local_4]["key"] : "");
                                break;
                            case 1:
                                _local_5.name = Language.SERVERACTPANEL_S[10].replace("{num}", _arg_1.actInfo[_local_4]["limit"]);
                                break;
                            case 3:
                                _local_5.name = Language.SERVERACTPANEL_S[16].replace("{num}", _arg_1.actInfo[_local_4]["limit"]);
                                break;
                            case 2:
                                _local_5.name = Language.SERVERACTPANEL_S[26].replace("{num}", _arg_1.actInfo[_local_4]["limit"]);
                                break;
                            case 13:
                                _local_5.name = Language.SERVERACTPANEL_S[56].replace("{num}", _arg_1.actInfo[_local_4]["limit"]);
                                _local_5.remain = ((((_arg_1.actInfo[_local_4]["remain"] > 0) ? _arg_1.actInfo[_local_4]["remain"] : 0) + "/") + _arg_1.actInfo[_local_4]["total"]);
                                _local_5.end = timeToDate2(_arg_1.actInfo[_local_4]["end"]);
                                _local_5.goldbind = _arg_1.actInfo[_local_4]["goldbind"];
                                if (_arg_1.actInfo[_local_4]["canTake"])
                                {
                                    _local_5.score = _arg_1.actInfo[_local_4]["limit"];
                                    _local_5.limit = _arg_1.actInfo[_local_4]["limit"];
                                }
                                else
                                {
                                    _local_5.score = 0;
                                };
                                break;
                        };
                        if (_arg_1.actInfo[_local_4]["limit"])
                        {
                            _local_5.limit = _arg_1.actInfo[_local_4]["limit"];
                        };
                        if (((_arg_1.type == 2) || (_arg_1.type == 13)))
                        {
                            _local_5.onClick = this.takeSectionAward;
                            if (_arg_1.type == 2)
                            {
                                _local_5.score = _arg_1.myInfo.point;
                            };
                            _local_5.isTaken = ((_arg_1.actInfo[_local_4]["isTaken"]) ? _arg_1.actInfo[_local_4]["isTaken"] : false);
                            _local_5.canTake = ((_arg_1.actInfo[_local_4]["canTake"]) ? _arg_1.actInfo[_local_4]["canTake"] : false);
                            _local_5.type = _arg_1.type;
                        };
                        _local_3++;
                        _local_5.array = _arg_1.actInfo[_local_4]["award"];
                        _local_2.addItem(_local_5);
                    };
                    this[("actDG" + _arg_1.type)].dataProvider = _local_2;
                };
            };
            changeTakeBtnState(String(_arg_1.type), _arg_1.myInfo);
        }

        public function set title2(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453350title2;
            if (_local_2 !== _arg_1)
            {
                this._873453350title2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title2", _local_2, _arg_1));
            };
        }

        public function set title3(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453349title3;
            if (_local_2 !== _arg_1)
            {
                this._873453349title3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title3", _local_2, _arg_1));
            };
        }

        public function set title0(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453352title0;
            if (_local_2 !== _arg_1)
            {
                this._873453352title0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title0", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn10 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 80;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn10", _NewServerActPanel_DataGridColumn10);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn33_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn33 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 50;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn33", _NewServerActPanel_DataGridColumn33);
            return (_local_1);
        }

        public function set title6(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453346title6;
            if (_local_2 !== _arg_1)
            {
                this._873453346title6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title6", _local_2, _arg_1));
            };
        }

        public function set title7(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453345title7;
            if (_local_2 !== _arg_1)
            {
                this._873453345title7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title7", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn11 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory5_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn11", _NewServerActPanel_DataGridColumn11);
            return (_local_1);
        }

        private function _NewServerActPanel_DataGridColumn18_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn18 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "name";
            _local_1.width = 90;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn18", _NewServerActPanel_DataGridColumn18);
            return (_local_1);
        }

        public function set title1(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453351title1;
            if (_local_2 !== _arg_1)
            {
                this._873453351title1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title1", _local_2, _arg_1));
            };
        }

        public function set title4(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453348title4;
            if (_local_2 !== _arg_1)
            {
                this._873453348title4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title4", _local_2, _arg_1));
            };
        }

        public function initActPanel(_arg_1:int):void
        {
            _core.remote.call("getActAwardInfo", null, _arg_1);
        }

        private function _NewServerActPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn4 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 200;
            _local_1.itemRenderer = _NewServerActPanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn4", _NewServerActPanel_DataGridColumn4);
            return (_local_1);
        }

        public function set title9(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453343title9;
            if (_local_2 !== _arg_1)
            {
                this._873453343title9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title9", _local_2, _arg_1));
            };
        }

        public function set title5(_arg_1:IntroText):void
        {
            var _local_2:Object = this._873453347title5;
            if (_local_2 !== _arg_1)
            {
                this._873453347title5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title5", _local_2, _arg_1));
            };
        }

        public function ___NewServerActPanel_Canvas19_show(_arg_1:FlexEvent):void
        {
            initActPanel(9);
        }

        private function _NewServerActPanel_DataGridColumn21_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn21 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 70;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn21", _NewServerActPanel_DataGridColumn21);
            return (_local_1);
        }

        private function _NewServerActPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get title7():IntroText
        {
            return (this._873453345title7);
        }

        private function _NewServerActPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.SERVERACTPANEL_S[27];
            _local_1 = wlListItemArr;
            _local_1 = NEW_ICON;
            _local_1 = Language.SERVERACTPANEL_S[11];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[21];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = LEVEL_ICON;
            _local_1 = Language.SERVERACTPANEL_S[38];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[21];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = ACTIVE_ICON;
            _local_1 = Language.SERVERACTPANEL_S[39];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[24];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = GUILD_ICON;
            _local_1 = Language.SERVERACTPANEL_S[40];
            _local_1 = Language.SERVERACTPANEL_S[45];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[21];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = NEW_ICON;
            _local_1 = Language.SERVERACTPANEL_S[11];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[33];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = ACH_RANK_ICON;
            _local_1 = Language.SERVERACTPANEL_S[41];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[28];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = MONEY_RANK_ICON;
            _local_1 = Language.SERVERACTPANEL_S[42];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[29];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = BATTLE_ICON;
            _local_1 = Language.SERVERACTPANEL_S[43];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[30];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = TB_RANK_ICON;
            _local_1 = Language.SERVERACTPANEL_S[48];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[31];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = POP_RANK_ICON;
            _local_1 = Language.SERVERACTPANEL_S[11];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[13];
            _local_1 = Language.SERVERACTPANEL_S[20];
            _local_1 = Language.SERVERACTPANEL_S[32];
            _local_1 = Language.SERVERACTPANEL_S[22];
            _local_1 = Language.SERVERACTPANEL_S[23];
            _local_1 = LEVEL_UP_ICON;
            _local_1 = Language.SERVERACTPANEL_S[50];
            _local_1 = Language.SERVERACTPANEL_S[46];
            _local_1 = Language.SERVERACTPANEL_S[54];
            _local_1 = Language.SERVERACTPANEL_S[21];
            _local_1 = Language.SERVERACTPANEL_S[52];
            _local_1 = Language.SERVERACTPANEL_S[51];
            _local_1 = Language.SERVERACTPANEL_S[53];
            _local_1 = Language.SERVERACTPANEL_S[13];
        }

        private function _NewServerActPanel_DataGridColumn29_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn29 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 50;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn29", _NewServerActPanel_DataGridColumn29);
            return (_local_1);
        }

        public function ___NewServerActPanel_Canvas5_show(_arg_1:FlexEvent):void
        {
            initActPanel(2);
        }

        private function _NewServerActPanel_ClassFactory9_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        public function set myLevel0(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731912myLevel0;
            if (_local_2 !== _arg_1)
            {
                this._1020731912myLevel0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel0", _local_2, _arg_1));
            };
        }

        public function set myLevel2(_arg_1:Label):void
        {
            var _local_2:Object = this._1020731910myLevel2;
            if (_local_2 !== _arg_1)
            {
                this._1020731910myLevel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLevel2", _local_2, _arg_1));
            };
        }

        private function _NewServerActPanel_DataGridColumn32_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn32 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "index";
            _local_1.width = 30;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn32", _NewServerActPanel_DataGridColumn32);
            return (_local_1);
        }

        public function onGetStartingActList(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:int;
            wlListItemArr = new Array();
            actIndex = new Array();
            for (_local_2 in _arg_1)
            {
                if (((_arg_1[_local_2]) && (Number(_local_2) < 100)))
                {
                    wlListItemArr.push(allActArr[_local_2]);
                    actIndex.push(Number(_local_2));
                };
            };
            if (actIndex.length > 0)
            {
                _local_3 = ((idViewLists.selectedIndex < 0) ? 0 : idViewLists.selectedIndex);
                idViewLists.dataProvider = wlListItemArr;
                idViewLists.selectedIndex = _local_3;
                if (actIndex[idViewLists.selectedIndex] < idViews.numChildren)
                {
                    idViews.selectedIndex = actIndex[idViewLists.selectedIndex];
                    initActPanel(((idViews.selectedIndex == 10) ? 13 : idViews.selectedIndex));
                };
            };
        }

        public function __idViewLists_change(_arg_1:ListEvent):void
        {
            toggleLists();
        }

        [Bindable(event="propertyChange")]
        public function get myLevel3():Label
        {
            return (this._1020731909myLevel3);
        }

        public function ___NewServerActPanel_Canvas21_show(_arg_1:FlexEvent):void
        {
            initActPanel(13);
        }

        private function timeToDate(_arg_1:Number):String
        {
            var _local_2:Date = new Date();
            if (_arg_1)
            {
                _local_2 = new Date(_arg_1);
            };
            return ((((((((_local_2.getFullYear() + "/") + (_local_2.getMonth() + 1)) + "/") + _local_2.getDate()) + "/") + ((_local_2.getHours() < 10) ? ("0" + _local_2.getHours()) : _local_2.getHours())) + ":") + ((_local_2.getMinutes() < 10) ? ("0" + _local_2.getMinutes()) : _local_2.getMinutes()));
        }

        [Bindable(event="propertyChange")]
        public function get myLevel6():Label
        {
            return (this._1020731906myLevel6);
        }

        private function _NewServerActPanel_DataGridColumn17_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _NewServerActPanel_DataGridColumn17 = _local_1;
            _local_1.sortable = true;
            _local_1.dataField = "rank";
            _local_1.width = 50;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_NewServerActPanel_DataGridColumn17", _NewServerActPanel_DataGridColumn17);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

