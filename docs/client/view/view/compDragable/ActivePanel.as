// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ActivePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.TextInput;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.DataGrid;
    import mx.controls.Button;
    import mx.controls.Text;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.PageSelector;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.binding.BindingManager;
    import mx.events.ListEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import mx.core.ClassFactory;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ChatPanelUtil;
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

    public class ActivePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const NUM_PER_PAGE:int = 12;
        private const REFRESH_PAGE_NUM:int = 4;
        public var _ActivePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _816022719nineBossPageIndicator:TextInput;
        private var _2126478649bossRank:ViewStack;
        private var _3628011vsBp:ViewStack;
        private var _haveNineBossCrossRankTime:Number = 0;
        private var _1383795005bpBtn1:BasicGlowButton;
        private var _395304649popGrid:DataGrid;
        private var _1863324747bangBtn9:BasicGlowButton;
        private var _1466456834lastWeekBpGrid:DataGrid;
        private var _1863324750bangBtn6:BasicGlowButton;
        private var _1863324754bangBtn2:BasicGlowButton;
        private var _797224958nineBossBtnLastPage:Button;
        private var _151627115popMonthGrid:DataGrid;
        private var _112481876vsPop:ViewStack;
        private var _1477210508txtFlush:Text;
        private var _1863324753bangBtn3:BasicGlowButton;
        public var _ActivePanel_DataGridColumn10:DataGridColumn;
        public var _ActivePanel_DataGridColumn11:DataGridColumn;
        public var _ActivePanel_DataGridColumn12:DataGridColumn;
        public var _ActivePanel_DataGridColumn13:DataGridColumn;
        public var _ActivePanel_DataGridColumn14:DataGridColumn;
        private var _1513983672treasureHuntGrid:DataGrid;
        public var _ActivePanel_DataGridColumn16:DataGridColumn;
        public var _ActivePanel_DataGridColumn18:DataGridColumn;
        public var _ActivePanel_DataGridColumn19:DataGridColumn;
        private var _1857819888achPointGrid:DataGrid;
        public var _ActivePanel_DataGridColumn15:DataGridColumn;
        private var _395451577popBtn2:BasicGlowButton;
        public var _ActivePanel_DataGridColumn17:DataGridColumn;
        private var _862864693popWeekGrid:DataGrid;
        public var _ActivePanel_DataGridColumn20:DataGridColumn;
        public var _ActivePanel_DataGridColumn21:DataGridColumn;
        private var _haveNineBossRankTime:Number = 0;
        public var _ActivePanel_DataGridColumn23:DataGridColumn;
        public var _ActivePanel_DataGridColumn25:DataGridColumn;
        public var _ActivePanel_DataGridColumn26:DataGridColumn;
        public var _ActivePanel_DataGridColumn27:DataGridColumn;
        public var _ActivePanel_DataGridColumn28:DataGridColumn;
        public var _ActivePanel_DataGridColumn22:DataGridColumn;
        private var _1310248189expGrid:DataGrid;
        public var _ActivePanel_DataGridColumn24:DataGridColumn;
        public var _ActivePanel_DataGridColumn29:DataGridColumn;
        public var _ActivePanel_DataGridColumn30:DataGridColumn;
        public var _ActivePanel_DataGridColumn31:DataGridColumn;
        public var _ActivePanel_DataGridColumn32:DataGridColumn;
        public var _ActivePanel_DataGridColumn33:DataGridColumn;
        public var _ActivePanel_DataGridColumn34:DataGridColumn;
        public var _ActivePanel_DataGridColumn35:DataGridColumn;
        public var _ActivePanel_DataGridColumn36:DataGridColumn;
        public var _ActivePanel_DataGridColumn37:DataGridColumn;
        public var _ActivePanel_DataGridColumn38:DataGridColumn;
        public var _ActivePanel_DataGridColumn39:DataGridColumn;
        private var _505391835guildWarGrid:DataGrid;
        private var _2086588895nineBossBtnNextPage:Button;
        public var _ActivePanel_DataGridColumn40:DataGridColumn;
        public var _ActivePanel_DataGridColumn41:DataGridColumn;
        public var _ActivePanel_DataGridColumn42:DataGridColumn;
        public var _ActivePanel_DataGridColumn43:DataGridColumn;
        public var _ActivePanel_DataGridColumn44:DataGridColumn;
        public var _ActivePanel_DataGridColumn45:DataGridColumn;
        public var _ActivePanel_DataGridColumn46:DataGridColumn;
        public var _ActivePanel_DataGridColumn47:DataGridColumn;
        public var _ActivePanel_DataGridColumn48:DataGridColumn;
        public var _ActivePanel_DataGridColumn49:DataGridColumn;
        private var _68580084bossAll:BasicGlowButton;
        private var crossRankData:ArrayCollection;
        private var _1562237018bossAllGrid:DataGrid;
        private var _1227196136totalBpGrid:DataGrid;
        private var _808459627vsBang:ViewStack;
        private var _1863324749bangBtn7:BasicGlowButton;
        private var _395451578popBtn1:BasicGlowButton;
        private var _1863324752bangBtn4:BasicGlowButton;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1647418760pageSelectorMarriage:PageSelector;
        private var _1491193854bossLocal:BasicGlowButton;
        private var crossRankNum:Number = 0;
        private var coupleData:Array;
        private var _902145509expBattleGrid:DataGrid;
        private var _395451579popBtn0:BasicGlowButton;
        private var _880039084txtFlushCouple:Text;
        private var _1937743972bossLocalGrid:DataGrid;
        private var _1863324748bangBtn8:BasicGlowButton;
        private var _1863324751bangBtn5:BasicGlowButton;
        private var _1713913818moneyGrid:DataGrid;
        private var _1383795006bpBtn0:BasicGlowButton;
        private var _1863324755bangBtn1:BasicGlowButton;
        public var _ActivePanel_DataGridColumn1:DataGridColumn;
        public var _ActivePanel_DataGridColumn2:DataGridColumn;
        public var _ActivePanel_DataGridColumn3:DataGridColumn;
        public var _ActivePanel_DataGridColumn8:DataGridColumn;
        public var _ActivePanel_DataGridColumn4:DataGridColumn;
        public var _ActivePanel_DataGridColumn7:DataGridColumn;
        public var _ActivePanel_DataGridColumn9:DataGridColumn;
        public var _ActivePanel_DataGridColumn5:DataGridColumn;
        public var _ActivePanel_DataGridColumn6:DataGridColumn;
        private var _595248336marriageGrid:DataGrid;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":390,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ActivePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":20,
                                "percentWidth":100,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn0",
                                    "events":{"click":"__bangBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "labelPlacement":"bottom",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn1",
                                    "events":{"click":"__bangBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn2",
                                    "events":{"click":"__bangBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn3",
                                    "events":{"click":"__bangBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn4",
                                    "events":{"click":"__bangBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn5",
                                    "events":{"click":"__bangBtn5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn6",
                                    "events":{"click":"__bangBtn6_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn7",
                                    "events":{"click":"__bangBtn7_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn8",
                                    "events":{"click":"__bangBtn8_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":51
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsBang",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "82";
                            this.bottom = "15";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas1_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Hornor",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"expBattleGrid",
                                                "events":{"itemDoubleClick":"__expBattleGrid_itemDoubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_ActivePanel_DataGridColumn1_i(), _ActivePanel_DataGridColumn2_i(), _ActivePanel_DataGridColumn3_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas2_show"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 3172697;
                                        this.borderStyle = "solid";
                                        this.borderThickness = 1;
                                        this.borderColor = 0;
                                        this.cornerRadius = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Level",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"expGrid",
                                                "events":{"itemDoubleClick":"__expGrid_itemDoubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_ActivePanel_DataGridColumn4_i(), _ActivePanel_DataGridColumn5_i(), _ActivePanel_DataGridColumn6_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas3_show"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 3172697;
                                        this.borderStyle = "solid";
                                        this.borderThickness = 1;
                                        this.borderColor = 0;
                                        this.cornerRadius = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Wealth",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"moneyGrid",
                                                "events":{"itemDoubleClick":"__moneyGrid_itemDoubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_ActivePanel_DataGridColumn7_i(), _ActivePanel_DataGridColumn8_i(), _ActivePanel_DataGridColumn9_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas4_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"Pop",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":3,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"popBtn0",
                                                            "events":{"click":"__popBtn0_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "selected":true,
                                                                    "width":48,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"popBtn1",
                                                            "events":{"click":"__popBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "width":48,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"popBtn2",
                                                            "events":{"click":"__popBtn2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "width":48,
                                                                    "height":20
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"vsPop",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":25,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___ActivePanel_Canvas5_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"popAll",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"popGrid",
                                                                        "events":{"itemDoubleClick":"__popGrid_itemDoubleClick"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn10_i(), _ActivePanel_DataGridColumn11_i(), _ActivePanel_DataGridColumn12_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___ActivePanel_Canvas6_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"popMonth",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"popMonthGrid",
                                                                        "events":{"itemDoubleClick":"__popMonthGrid_itemDoubleClick"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn13_i(), _ActivePanel_DataGridColumn14_i(), _ActivePanel_DataGridColumn15_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___ActivePanel_Canvas7_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"popWeek",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"popWeekGrid",
                                                                        "events":{"itemDoubleClick":"__popWeekGrid_itemDoubleClick"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn16_i(), _ActivePanel_DataGridColumn17_i(), _ActivePanel_DataGridColumn18_i()]
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
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas8_show"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 3172697;
                                        this.borderStyle = "solid";
                                        this.borderThickness = 1;
                                        this.borderColor = 0;
                                        this.cornerRadius = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Marriage",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"marriageGrid",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":false,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "columns":[_ActivePanel_DataGridColumn19_i(), _ActivePanel_DataGridColumn20_i(), _ActivePanel_DataGridColumn21_i(), _ActivePanel_DataGridColumn22_i(), _ActivePanel_DataGridColumn23_i()]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PageSelector,
                                                "id":"pageSelectorMarriage",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":270});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"txtFlush",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 13901886;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "selectable":false,
                                                        "x":187,
                                                        "y":234,
                                                        "width":106
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas9_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"Bp",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":3,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"bpBtn0",
                                                            "events":{"click":"__bpBtn0_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "selected":true,
                                                                    "width":48,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"bpBtn1",
                                                            "events":{"click":"__bpBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "width":48,
                                                                    "height":20
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"vsBp",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":25,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___ActivePanel_Canvas10_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"Bp",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"totalBpGrid",
                                                                        "events":{"itemDoubleClick":"__totalBpGrid_itemDoubleClick"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn24_i(), _ActivePanel_DataGridColumn25_i(), _ActivePanel_DataGridColumn26_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___ActivePanel_Canvas11_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"BpWeek",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"lastWeekBpGrid",
                                                                        "events":{"itemDoubleClick":"__lastWeekBpGrid_itemDoubleClick"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn27_i(), _ActivePanel_DataGridColumn28_i(), _ActivePanel_DataGridColumn29_i()]
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
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas12_show"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 3172697;
                                        this.borderStyle = "solid";
                                        this.borderThickness = 1;
                                        this.borderColor = 0;
                                        this.cornerRadius = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"Wealth",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"achPointGrid",
                                                "events":{"itemDoubleClick":"__achPointGrid_itemDoubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_ActivePanel_DataGridColumn30_i(), _ActivePanel_DataGridColumn31_i(), _ActivePanel_DataGridColumn32_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas13_show"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 3172697;
                                        this.borderStyle = "solid";
                                        this.borderThickness = 1;
                                        this.borderColor = 0;
                                        this.cornerRadius = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"GuildWar",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"guildWarGrid",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "columns":[_ActivePanel_DataGridColumn33_i(), _ActivePanel_DataGridColumn34_i(), _ActivePanel_DataGridColumn35_i(), _ActivePanel_DataGridColumn36_i(), _ActivePanel_DataGridColumn37_i(), _ActivePanel_DataGridColumn38_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas14_show"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "label":"9Boss",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":HBox,
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":20,
                                                        "y":3,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"bossLocal",
                                                            "events":{"click":"__bossLocal_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "selected":true,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"bossAll",
                                                            "events":{"click":"__bossAll_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"SmallTab",
                                                                    "height":20
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"bossRank",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":25,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"9BossLocalLabel",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"bossLocalGrid",
                                                                        "events":{"itemDoubleClick":"__bossLocalGrid_itemDoubleClick"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn39_i(), _ActivePanel_DataGridColumn40_i(), _ActivePanel_DataGridColumn41_i(), _ActivePanel_DataGridColumn42_i()]
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
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "label":"9BossAllLabel",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"bossAllGrid",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "columns":[_ActivePanel_DataGridColumn43_i(), _ActivePanel_DataGridColumn44_i(), _ActivePanel_DataGridColumn45_i(), _ActivePanel_DataGridColumn46_i()]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HBox,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.verticalAlign = "middle";
                                                                            this.horizontalGap = 5;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":165,
                                                                                "y":250,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Button,
                                                                                    "id":"nineBossBtnLastPage",
                                                                                    "events":{"click":"__nineBossBtnLastPage_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"LastPage",
                                                                                            "autoRepeat":true,
                                                                                            "label":"Trước",
                                                                                            "width":45,
                                                                                            "useHandCursor":true
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":TextInput,
                                                                                    "id":"nineBossPageIndicator",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textAlign = "center";
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.fontSize = 12;
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"PageNoIndicator",
                                                                                            "width":50,
                                                                                            "height":16,
                                                                                            "text":"0",
                                                                                            "y":2.5,
                                                                                            "editable":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Button,
                                                                                    "id":"nineBossBtnNextPage",
                                                                                    "events":{"click":"__nineBossBtnNextPage_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.right = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"NextPage",
                                                                                            "autoRepeat":true,
                                                                                            "label":"Sau",
                                                                                            "width":45,
                                                                                            "useHandCursor":true,
                                                                                            "y":0
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
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{"show":"___ActivePanel_Canvas17_show"},
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundColor = 3172697;
                                        this.borderStyle = "solid";
                                        this.borderThickness = 1;
                                        this.borderColor = 0;
                                        this.cornerRadius = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "label":"TreasureHunt",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":DataGrid,
                                                "id":"treasureHuntGrid",
                                                "events":{"itemDoubleClick":"__treasureHuntGrid_itemDoubleClick"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "resizableColumns":false,
                                                        "draggableColumns":false,
                                                        "doubleClickEnabled":true,
                                                        "columns":[_ActivePanel_DataGridColumn47_i(), _ActivePanel_DataGridColumn48_i(), _ActivePanel_DataGridColumn49_i()]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"txtFlushCouple",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "15";
                            this.color = 13901886;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selectable":false,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"bangBtn9",
                        "events":{"click":"__bangBtn9_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"HorizontalTab",
                                "selected":true,
                                "labelPlacement":"bottom",
                                "width":78,
                                "x":20,
                                "y":62
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1470382258pageCoupleArr:Array = [];
        private var flag:Object = {};
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ActivePanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 390;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___ActivePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ActivePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get nineBossBtnLastPage():Button
        {
            return (this._797224958nineBossBtnLastPage);
        }

        public function set nineBossBtnLastPage(_arg_1:Button):void
        {
            var _local_2:Object = this._797224958nineBossBtnLastPage;
            if (_local_2 !== _arg_1)
            {
                this._797224958nineBossBtnLastPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nineBossBtnLastPage", _local_2, _arg_1));
            };
        }

        public function __bangBtn4_click(_arg_1:MouseEvent):void
        {
            bangSele(4);
        }

        private function _ActivePanel_DataGridColumn23_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn23 = _local_1;
            _local_1.dataField = "timeLable";
            _local_1.width = 70;
            _local_1.itemRenderer = _ActivePanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn23", _ActivePanel_DataGridColumn23);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn46_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn46 = _local_1;
            _local_1.dataField = "exp";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn46", _ActivePanel_DataGridColumn46);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get moneyGrid():DataGrid
        {
            return (this._1713913818moneyGrid);
        }

        public function __popBtn0_click(_arg_1:MouseEvent):void
        {
            popSele(0);
        }

        private function _ActivePanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn11 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn11", _ActivePanel_DataGridColumn11);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn34_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn34 = _local_1;
            _local_1.dataField = "level";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn34", _ActivePanel_DataGridColumn34);
            return (_local_1);
        }

        public function set expBattleGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._902145509expBattleGrid;
            if (_local_2 !== _arg_1)
            {
                this._902145509expBattleGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expBattleGrid", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn4", _ActivePanel_DataGridColumn4);
            return (_local_1);
        }

        public function __popGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        private function _ActivePanel_DataGridColumn45_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn45 = _local_1;
            _local_1.dataField = "roundNum";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn45", _ActivePanel_DataGridColumn45);
            return (_local_1);
        }

        public function set moneyGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1713913818moneyGrid;
            if (_local_2 !== _arg_1)
            {
                this._1713913818moneyGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moneyGrid", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn22_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn22 = _local_1;
            _local_1.dataField = "luxtime";
            _local_1.width = 50;
            _local_1.headerRenderer = _ActivePanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn22", _ActivePanel_DataGridColumn22);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bossAllGrid():DataGrid
        {
            return (this._1562237018bossAllGrid);
        }

        public function __bangBtn9_click(_arg_1:MouseEvent):void
        {
            bangSele(9);
        }

        [Bindable(event="propertyChange")]
        public function get bossLocalGrid():DataGrid
        {
            return (this._1937743972bossLocalGrid);
        }

        private function _ActivePanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn10 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn10", _ActivePanel_DataGridColumn10);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn33_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn33 = _local_1;
            _local_1.dataField = "gid";
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn33", _ActivePanel_DataGridColumn33);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn3", _ActivePanel_DataGridColumn3);
            return (_local_1);
        }

        public function ___ActivePanel_Canvas6_show(_arg_1:FlexEvent):void
        {
            getInfo("popMonth");
        }

        private function _ActivePanel_DataGridColumn21_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn21 = _local_1;
            _local_1.dataField = "level";
            _local_1.width = 55;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn21", _ActivePanel_DataGridColumn21);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn44_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn44 = _local_1;
            _local_1.dataField = "bossIndex";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn44", _ActivePanel_DataGridColumn44);
            return (_local_1);
        }

        public function set vsPop(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._112481876vsPop;
            if (_local_2 !== _arg_1)
            {
                this._112481876vsPop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsPop", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn32_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn32 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn32", _ActivePanel_DataGridColumn32);
            return (_local_1);
        }

        public function __bossAll_click(_arg_1:MouseEvent):void
        {
            getNineBossRankView(1);
        }

        private function _ActivePanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn2", _ActivePanel_DataGridColumn2);
            return (_local_1);
        }

        private function bpSele(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < 2)
            {
                this[("bpBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("bpBtn" + _arg_1)].selected = true;
            vsBp.selectedIndex = _arg_1;
        }

        public function set bossAllGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1562237018bossAllGrid;
            if (_local_2 !== _arg_1)
            {
                this._1562237018bossAllGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossAllGrid", _local_2, _arg_1));
            };
        }

        private function getNineBossRankView(_arg_1:int):void
        {
            bossRank.selectedIndex = _arg_1;
        }

        public function set bossLocalGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1937743972bossLocalGrid;
            if (_local_2 !== _arg_1)
            {
                this._1937743972bossLocalGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossLocalGrid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get pageCoupleArr():Array
        {
            return (this._1470382258pageCoupleArr);
        }

        private function _ActivePanel_DataGridColumn20_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn20 = _local_1;
            _local_1.dataField = "femaleName";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn20", _ActivePanel_DataGridColumn20);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn43_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn43 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn43", _ActivePanel_DataGridColumn43);
            return (_local_1);
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            bangSele(3);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (_arg_1)
            {
                setFlushStr();
            };
        }

        public function set txtFlush(_arg_1:Text):void
        {
            var _local_2:Object = this._1477210508txtFlush;
            if (_local_2 !== _arg_1)
            {
                this._1477210508txtFlush = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtFlush", _local_2, _arg_1));
            };
        }

        public function __bpBtn1_click(_arg_1:MouseEvent):void
        {
            bpSele(1);
        }

        private function _ActivePanel_DataGridColumn31_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn31 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn31", _ActivePanel_DataGridColumn31);
            return (_local_1);
        }

        private function onInitGuildWarRank(_arg_1:Object):void
        {
            var _local_2:ArrayCollection;
            var _local_3:*;
            var _local_4:*;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (_arg_1)
            {
                _local_2 = new ArrayCollection();
                for (_local_3 in _arg_1)
                {
                    _local_4 = new Object();
                    _local_4.gid = _arg_1[_local_3].gid;
                    _local_4.guildName = _arg_1[_local_3].guildName;
                    _local_4.level = _arg_1[_local_3].level;
                    _local_4.leaderName = _arg_1[_local_3].ln;
                    _local_4.value = _arg_1[_local_3].totalTime;
                    _local_4.winNum = _arg_1[_local_3].winNum;
                    _local_5 = (_arg_1[_local_3].totalTime % 60);
                    _local_6 = int(Math.floor((_arg_1[_local_3].totalTime / 3600)));
                    if (_local_6 > 0)
                    {
                        _arg_1[_local_3].totalTime = (_arg_1[_local_3].totalTime - (_local_6 * 3600));
                    };
                    _local_7 = int(Math.floor((_arg_1[_local_3].totalTime / 60)));
                    _local_4.totalTime = ((((_local_6 > 0) ? (_local_6 + "h") : "") + ((_local_7 > 0) ? (_local_7 + "m") : "")) + ((_local_5 > 0) ? (_local_5 + "s") : ""));
                    _local_2.addItem(_local_4);
                };
                this.guildWarGrid.dataProvider = _local_2;
            };
        }

        private function _ActivePanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn1", _ActivePanel_DataGridColumn1);
            return (_local_1);
        }

        public function set pageSelectorMarriage(_arg_1:PageSelector):void
        {
            var _local_2:Object = this._1647418760pageSelectorMarriage;
            if (_local_2 !== _arg_1)
            {
                this._1647418760pageSelectorMarriage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelectorMarriage", _local_2, _arg_1));
            };
        }

        private function onInitCoupleRank(_arg_1:Object):void
        {
            var _local_2:Object;
            flag["marriage"] = true;
            coupleData = new Array();
            for each (_local_2 in _arg_1.data)
            {
                if (_local_2.type == 1)
                {
                    _local_2.level = Language.ACTIVEPANEL_S[42];
                }
                else
                {
                    if (_local_2.type == 2)
                    {
                        _local_2.level = Language.ACTIVEPANEL_S[43];
                    }
                    else
                    {
                        if (_local_2.type == 3)
                        {
                            _local_2.level = Language.ACTIVEPANEL_S[44];
                        }
                        else
                        {
                            _local_2.level = "";
                        };
                    };
                };
                _local_2.timeLable = String(_local_2.time).substr(0, 10);
            };
            coupleData = _arg_1.data;
            pageSelectorMarriage.onPageChanged = setCoupleRank;
            pageSelectorMarriage.onPageCleared = clearPage;
            pageSelectorMarriage.initPageSeletor(_arg_1.num, NUM_PER_PAGE);
        }

        [Bindable(event="propertyChange")]
        public function get lastWeekBpGrid():DataGrid
        {
            return (this._1466456834lastWeekBpGrid);
        }

        public function ___ActivePanel_Canvas10_show(_arg_1:FlexEvent):void
        {
            getInfo("totalBp");
        }

        public function updateTreasureHuntState():void
        {
            if (((this.initialized) && (flag["treasureHunt"])))
            {
                flag["treasureHunt"] = false;
            };
        }

        private function _ActivePanel_DataGridColumn42_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn42 = _local_1;
            _local_1.dataField = "exp";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn42", _ActivePanel_DataGridColumn42);
            return (_local_1);
        }

        private function _ActivePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ActivePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn4.label = _arg_1;
            }, "bangBtn4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn5.label = _arg_1;
            }, "bangBtn5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn6.label = _arg_1;
            }, "bangBtn6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn7.label = _arg_1;
            }, "bangBtn7.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn8.label = _arg_1;
            }, "bangBtn8.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn1.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn1.headerText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn2.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn2.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn3.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn3.headerText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn4.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn4.headerText");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn5.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn5.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn6.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn6.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn7.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn7.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn8.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn8.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn9.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn9.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                popBtn0.label = _arg_1;
            }, "popBtn0.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                popBtn1.label = _arg_1;
            }, "popBtn1.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                popBtn2.label = _arg_1;
            }, "popBtn2.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn10.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn10.headerText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn11.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn11.headerText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn12.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn12.headerText");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn13.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn13.headerText");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn14.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn14.headerText");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn15.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn15.headerText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn16.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn16.headerText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn17.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn17.headerText");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn18.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn18.headerText");
            result[30] = binding;
            binding = new Binding(this, function ():Object
            {
                return (pageCoupleArr);
            }, function (_arg_1:Object):void
            {
                marriageGrid.dataProvider = _arg_1;
            }, "marriageGrid.dataProvider");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn19.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn19.headerText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn20.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn20.headerText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn21.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn21.headerText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn22.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn22.headerText");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn23.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn23.headerText");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bpBtn0.label = _arg_1;
            }, "bpBtn0.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bpBtn1.label = _arg_1;
            }, "bpBtn1.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn24.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn24.headerText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn25.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn25.headerText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn26.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn26.headerText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn27.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn27.headerText");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn28.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn28.headerText");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn29.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn29.headerText");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn30.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn30.headerText");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn31.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn31.headerText");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn32.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn32.headerText");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[66];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn33.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn33.headerText");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn34.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn34.headerText");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[63];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn35.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn35.headerText");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn36.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn36.headerText");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[64];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn37.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn37.headerText");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[65];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn38.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn38.headerText");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bossLocal.label = _arg_1;
            }, "bossLocal.label");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[77];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bossAll.label = _arg_1;
            }, "bossAll.label");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn39.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn39.headerText");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn40.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn40.headerText");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn41.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn41.headerText");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn42.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn42.headerText");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn43.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn43.headerText");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[73];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn44.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn44.headerText");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[74];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn45.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn45.headerText");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn46.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn46.headerText");
            result[63] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                nineBossPageIndicator.filters = _arg_1;
            }, "nineBossPageIndicator.filters");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn47.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn47.headerText");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[87];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn48.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn48.headerText");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[88];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ActivePanel_DataGridColumn49.headerText = _arg_1;
            }, "_ActivePanel_DataGridColumn49.headerText");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_S[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtFlushCouple.text = _arg_1;
            }, "txtFlushCouple.text");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACTIVEPANEL_U[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn9.label = _arg_1;
            }, "bangBtn9.label");
            result[69] = binding;
            return (result);
        }

        public function init():void
        {
            getInfo("expBattle");
        }

        [Bindable(event="propertyChange")]
        public function get totalBpGrid():DataGrid
        {
            return (this._1227196136totalBpGrid);
        }

        public function autoClick(_arg_1:int):void
        {
            bangSele(_arg_1);
            if (((_arg_1 == 5) && (!(flag["totalBp"]))))
            {
                getInfo("totalBp");
            };
        }

        public function __expBattleGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        private function getInfo(_arg_1:String):void
        {
            if (!flag[_arg_1])
            {
                if (_arg_1 == "marriage")
                {
                    _core.remote.call("getCoupleRank", new Responder(onInitCoupleRank), 0);
                }
                else
                {
                    if (_arg_1 == "guildWarRank")
                    {
                        _core.remote.call("getGuildWarRank", new Responder(onInitGuildWarRank), null);
                    }
                    else
                    {
                        _core.remote.call("rankGet", new Responder(onInfo), _arg_1);
                    };
                };
            };
        }

        private function _ActivePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.ACTIVEPANEL_U[11];
            _local_1 = Language.ACTIVEPANEL_U[5];
            _local_1 = Language.ACTIVEPANEL_U[6];
            _local_1 = Language.ACTIVEPANEL_U[7];
            _local_1 = Language.ACTIVEPANEL_U[8];
            _local_1 = Language.ACTIVEPANEL_U[44];
            _local_1 = Language.ACTIVEPANEL_U[42];
            _local_1 = Language.ACTIVEPANEL_U[45];
            _local_1 = Language.ACTIVEPANEL_U[46];
            _local_1 = Language.ACTIVEPANEL_U[47];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[20];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[21];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[22];
            _local_1 = Language.ACTIVEPANEL_S[23];
            _local_1 = Language.ACTIVEPANEL_S[24];
            _local_1 = Language.ACTIVEPANEL_S[25];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[26];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[26];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[26];
            _local_1 = pageCoupleArr;
            _local_1 = Language.ACTIVEPANEL_S[45];
            _local_1 = Language.ACTIVEPANEL_S[46];
            _local_1 = Language.ACTIVEPANEL_S[47];
            _local_1 = Language.ACTIVEPANEL_S[48];
            _local_1 = Language.ACTIVEPANEL_S[49];
            _local_1 = Language.ACTIVEPANEL_S[23];
            _local_1 = Language.ACTIVEPANEL_S[25];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[40];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[40];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[19];
            _local_1 = Language.ACTIVEPANEL_S[53];
            _local_1 = Language.ACTIVEPANEL_S[66];
            _local_1 = Language.ACTIVEPANEL_S[67];
            _local_1 = Language.ACTIVEPANEL_S[63];
            _local_1 = Language.ACTIVEPANEL_S[68];
            _local_1 = Language.ACTIVEPANEL_S[64];
            _local_1 = Language.ACTIVEPANEL_S[65];
            _local_1 = Language.ACTIVEPANEL_S[76];
            _local_1 = Language.ACTIVEPANEL_S[77];
            _local_1 = Language.ACTIVEPANEL_S[71];
            _local_1 = Language.ACTIVEPANEL_S[73];
            _local_1 = Language.ACTIVEPANEL_S[74];
            _local_1 = Language.ACTIVEPANEL_S[75];
            _local_1 = Language.ACTIVEPANEL_S[71];
            _local_1 = Language.ACTIVEPANEL_S[73];
            _local_1 = Language.ACTIVEPANEL_S[74];
            _local_1 = Language.ACTIVEPANEL_S[75];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.ACTIVEPANEL_S[18];
            _local_1 = Language.ACTIVEPANEL_S[87];
            _local_1 = Language.ACTIVEPANEL_S[88];
            _local_1 = Language.ACTIVEPANEL_S[54];
            _local_1 = Language.ACTIVEPANEL_U[54];
        }

        public function set popMonthGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._151627115popMonthGrid;
            if (_local_2 !== _arg_1)
            {
                this._151627115popMonthGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popMonthGrid", _local_2, _arg_1));
            };
        }

        public function __moneyGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function __bangBtn8_click(_arg_1:MouseEvent):void
        {
            bangSele(8);
        }

        private function _ActivePanel_DataGridColumn30_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn30 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn30", _ActivePanel_DataGridColumn30);
            return (_local_1);
        }

        public function set vsBang(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._808459627vsBang;
            if (_local_2 !== _arg_1)
            {
                this._808459627vsBang = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsBang", _local_2, _arg_1));
            };
        }

        public function ___ActivePanel_Canvas7_show(_arg_1:FlexEvent):void
        {
            getInfo("popWeek");
        }

        [Bindable(event="propertyChange")]
        public function get popGrid():DataGrid
        {
            return (this._395304649popGrid);
        }

        [Bindable(event="propertyChange")]
        public function get bossRank():ViewStack
        {
            return (this._2126478649bossRank);
        }

        private function popSele(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < 3)
            {
                this[("popBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("popBtn" + _arg_1)].selected = true;
            vsPop.selectedIndex = _arg_1;
        }

        public function ___ActivePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _ActivePanel_DataGridColumn41_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn41 = _local_1;
            _local_1.dataField = "roundNum";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn41", _ActivePanel_DataGridColumn41);
            return (_local_1);
        }

        public function reset():void
        {
            flag = new Object();
        }

        [Bindable(event="propertyChange")]
        public function get treasureHuntGrid():DataGrid
        {
            return (this._1513983672treasureHuntGrid);
        }

        public function __popMonthGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function ___ActivePanel_Canvas17_show(_arg_1:FlexEvent):void
        {
            getInfo("treasureHunt");
        }

        public function ___ActivePanel_Canvas1_show(_arg_1:FlexEvent):void
        {
            getInfo("expBattle");
        }

        public function __bossLocalGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function set bpBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1383795006bpBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1383795006bpBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bpBtn0", _local_2, _arg_1));
            };
        }

        public function set bpBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1383795005bpBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1383795005bpBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bpBtn1", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn40_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn40 = _local_1;
            _local_1.dataField = "bossIndex";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn40", _ActivePanel_DataGridColumn40);
            return (_local_1);
        }

        private function set pageCoupleArr(_arg_1:Array):void
        {
            var _local_2:Object = this._1470382258pageCoupleArr;
            if (_local_2 !== _arg_1)
            {
                this._1470382258pageCoupleArr = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageCoupleArr", _local_2, _arg_1));
            };
        }

        public function set popWeekGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._862864693popWeekGrid;
            if (_local_2 !== _arg_1)
            {
                this._862864693popWeekGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popWeekGrid", _local_2, _arg_1));
            };
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            bangSele(2);
        }

        private function bangSele(_arg_1:int):void
        {
            var _local_2:int = 10;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("bangBtn" + _local_3)].selected = false;
                _local_3++;
            };
            this[("bangBtn" + _arg_1)].selected = true;
            vsBang.selectedIndex = _arg_1;
            if (_arg_1 == 4)
            {
                txtFlush.visible = false;
                txtFlushCouple.visible = true;
            }
            else
            {
                txtFlush.visible = true;
                txtFlushCouple.visible = false;
            };
        }

        public function ___ActivePanel_Canvas11_show(_arg_1:FlexEvent):void
        {
            getInfo("lastWeekBp");
        }

        public function __bpBtn0_click(_arg_1:MouseEvent):void
        {
            bpSele(0);
        }

        public function set guildWarGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._505391835guildWarGrid;
            if (_local_2 !== _arg_1)
            {
                this._505391835guildWarGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guildWarGrid", _local_2, _arg_1));
            };
        }

        public function ___ActivePanel_Canvas8_show(_arg_1:FlexEvent):void
        {
            getInfo("marriage");
        }

        public function __lastWeekBpGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function __popWeekGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get nineBossBtnNextPage():Button
        {
            return (this._2086588895nineBossBtnNextPage);
        }

        private function gridClick(_arg_1:ListEvent):void
        {
            var _local_2:Object = _arg_1.itemRenderer.data;
            var _local_3:Number = _local_2.id;
            var _local_4:String = _local_2.name;
            var _local_5:Array = [{
                "label":GamePredef.MENU_WISPER,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_P2PWISPER,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_INFO,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.CHAR_MENU_INVITE_T,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.CHAR_MENU_TRADE,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_ADDF,
                "id":_local_3,
                "name":_local_4
            }, {
                "label":GamePredef.MENU_ADDB,
                "id":_local_3,
                "name":_local_4
            }];
            var _local_6:Menu = CustomMenu.createMenu(null, _local_5);
            _local_6.show((stage.mouseX + 25), ((stage.mouseY > 390) ? 390 : stage.mouseY));
            _local_6.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function __bangBtn7_click(_arg_1:MouseEvent):void
        {
            bangSele(7);
        }

        public function set bossAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._68580084bossAll;
            if (_local_2 !== _arg_1)
            {
                this._68580084bossAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossAll", _local_2, _arg_1));
            };
        }

        public function set lastWeekBpGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1466456834lastWeekBpGrid;
            if (_local_2 !== _arg_1)
            {
                this._1466456834lastWeekBpGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lastWeekBpGrid", _local_2, _arg_1));
            };
        }

        public function ___ActivePanel_Canvas2_show(_arg_1:FlexEvent):void
        {
            getInfo("exp");
        }

        public function __treasureHuntGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        private function setCoupleRank(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int;
            var _local_5:Array;
            var _local_3:int = _arg_1;
            if (!coupleData[_arg_1])
            {
                _core.remote.call("getCoupleRank", new Responder(onAddCoupleData), Math.floor((pageSelectorMarriage.pageNo / REFRESH_PAGE_NUM)));
            }
            else
            {
                _local_4 = 0;
                _local_5 = [];
                while (((_local_4 < NUM_PER_PAGE) && (coupleData[(_arg_1 + _local_4)])))
                {
                    _local_5[_local_4] = coupleData[(_arg_1 + _local_4)];
                    _local_4++;
                };
                pageCoupleArr = _local_5;
            };
        }

        private function showCrossRank(_arg_1:int):*
        {
            var _local_2:* = (Math.floor((crossRankNum / 10)) + 1);
            if (_local_2 > 1)
            {
                nineBossPageIndicator.text = ((_arg_1 + "/") + 2);
            }
            else
            {
                if (_arg_1 == 2)
                {
                    return;
                };
                nineBossPageIndicator.text = ((_arg_1 + "/") + 1);
            };
            var _local_3:ArrayCollection = new ArrayCollection();
            var _local_4:* = (1 + (10 * (_arg_1 - 1)));
            while (_local_4 <= (10 * _arg_1))
            {
                if (((crossRankData) && (crossRankNum >= _local_4)))
                {
                    _local_3.addItem(crossRankData[(_local_4 - 1)]);
                };
                _local_4++;
            };
            this.bossAllGrid.dataProvider = _local_3;
        }

        private function valueSortFunc(_arg_1:Object, _arg_2:Object):int
        {
            if (((_arg_1) && (_arg_2)))
            {
                if (Number(_arg_1.value) < Number(_arg_2.value))
                {
                    return (-1);
                };
                if (Number(_arg_1.value) > Number(_arg_2.value))
                {
                    return (1);
                };
            };
            return (0);
        }

        public function set expGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1310248189expGrid;
            if (_local_2 !== _arg_1)
            {
                this._1310248189expGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expGrid", _local_2, _arg_1));
            };
        }

        public function __expGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get expBattleGrid():DataGrid
        {
            return (this._902145509expBattleGrid);
        }

        public function set achPointGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1857819888achPointGrid;
            if (_local_2 !== _arg_1)
            {
                this._1857819888achPointGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achPointGrid", _local_2, _arg_1));
            };
        }

        public function __totalBpGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function __bossLocal_click(_arg_1:MouseEvent):void
        {
            getNineBossRankView(0);
        }

        public function set totalBpGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1227196136totalBpGrid;
            if (_local_2 !== _arg_1)
            {
                this._1227196136totalBpGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalBpGrid", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn19_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn19 = _local_1;
            _local_1.dataField = "maleName";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn19", _ActivePanel_DataGridColumn19);
            return (_local_1);
        }

        public function ___ActivePanel_Canvas12_show(_arg_1:FlexEvent):void
        {
            getInfo("achPoint");
        }

        private function _ActivePanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = ActivePanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get vsPop():ViewStack
        {
            return (this._112481876vsPop);
        }

        public function ___ActivePanel_Canvas9_show(_arg_1:FlexEvent):void
        {
            getInfo("totalBp");
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            bangSele(1);
        }

        private function sortAc(_arg_1:ArrayCollection, _arg_2:int):ArrayCollection
        {
            var _local_3:Sort = new Sort();
            switch (_arg_2)
            {
                case 1:
                    _local_3.fields = [new SortField("rank")];
                    break;
                case 2:
                    _local_3.fields = [new SortField("totalSec", true, true)];
                    break;
            };
            _arg_1.sort = _local_3;
            _arg_1.refresh();
            return (_arg_1);
        }

        public function set marriageGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._595248336marriageGrid;
            if (_local_2 !== _arg_1)
            {
                this._595248336marriageGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "marriageGrid", _local_2, _arg_1));
            };
        }

        public function set popGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._395304649popGrid;
            if (_local_2 !== _arg_1)
            {
                this._395304649popGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popGrid", _local_2, _arg_1));
            };
        }

        public function set bossRank(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._2126478649bossRank;
            if (_local_2 !== _arg_1)
            {
                this._2126478649bossRank = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossRank", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtFlush():Text
        {
            return (this._1477210508txtFlush);
        }

        private function _ActivePanel_DataGridColumn18_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn18 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn18", _ActivePanel_DataGridColumn18);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get pageSelectorMarriage():PageSelector
        {
            return (this._1647418760pageSelectorMarriage);
        }

        private function clearPage():void
        {
            pageCoupleArr = new Array();
        }

        private function getNineBossRank():void
        {
            var _local_1:* = (new Date().getTime() + _core.timeLag);
            _core.remote.call("getNineBossRankByClient", new Responder(onGetNineBossRank), _local_1, _haveNineBossRankTime, _haveNineBossCrossRankTime);
        }

        public function set nineBossPageIndicator(_arg_1:TextInput):void
        {
            var _local_2:Object = this._816022719nineBossPageIndicator;
            if (_local_2 !== _arg_1)
            {
                this._816022719nineBossPageIndicator = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nineBossPageIndicator", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = ActivePanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set popBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._395451579popBtn0;
            if (_local_2 !== _arg_1)
            {
                this._395451579popBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popBtn0", _local_2, _arg_1));
            };
        }

        public function set popBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._395451578popBtn1;
            if (_local_2 !== _arg_1)
            {
                this._395451578popBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popBtn1", _local_2, _arg_1));
            };
        }

        public function set popBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._395451577popBtn2;
            if (_local_2 !== _arg_1)
            {
                this._395451577popBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popBtn2", _local_2, _arg_1));
            };
        }

        public function set treasureHuntGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1513983672treasureHuntGrid;
            if (_local_2 !== _arg_1)
            {
                this._1513983672treasureHuntGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "treasureHuntGrid", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get popMonthGrid():DataGrid
        {
            return (this._151627115popMonthGrid);
        }

        private function _ActivePanel_DataGridColumn29_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn29 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn29", _ActivePanel_DataGridColumn29);
            return (_local_1);
        }

        public function __bangBtn6_click(_arg_1:MouseEvent):void
        {
            bangSele(6);
        }

        [Bindable(event="propertyChange")]
        public function get vsBang():ViewStack
        {
            return (this._808459627vsBang);
        }

        public function ___ActivePanel_Canvas3_show(_arg_1:FlexEvent):void
        {
            getInfo("money");
        }

        private function onGetNineBossRank(_arg_1:Object):void
        {
            var _local_2:ArrayCollection;
            var _local_3:*;
            var _local_4:*;
            if (_arg_1)
            {
                if (_arg_1[1])
                {
                    if (_arg_1[1].type == 1)
                    {
                        _haveNineBossRankTime = _arg_1[1].time;
                        _local_2 = new ArrayCollection();
                        for (_local_3 in _arg_1[1].rankObj)
                        {
                            if (_arg_1[1].rankObj[_local_3])
                            {
                                if (_arg_1[1].rankObj[_local_3].rank)
                                {
                                    _arg_1[1].rankObj[_local_3].rank = Number(_arg_1[1].rankObj[_local_3].rank);
                                };
                                _local_2.addItem(_arg_1[1].rankObj[_local_3]);
                            };
                        };
                        _local_2 = sortAc(_local_2, 1);
                        this.bossLocalGrid.dataProvider = _local_2;
                    };
                };
                if (_arg_1[2])
                {
                    if (_arg_1[2].type == 2)
                    {
                        _haveNineBossCrossRankTime = _arg_1[2].time;
                        crossRankData = new ArrayCollection();
                        _local_4 = 1;
                        for (_local_3 in _arg_1[2].rankObj)
                        {
                            if (_arg_1[2].rankObj[_local_3])
                            {
                                if (_arg_1[2].rankObj[_local_3].totalSec)
                                {
                                    _arg_1[2].rankObj[_local_3].totalSec = Number(_arg_1[2].rankObj[_local_3].totalSec);
                                };
                                crossRankData.addItem(_arg_1[2].rankObj[_local_3]);
                                _local_4++;
                            };
                        };
                        crossRankData = sortAc(crossRankData, 2);
                        crossRankNum = (_local_4 - 1);
                        showCrossRank(1);
                    };
                };
            };
        }

        public function set txtFlushCouple(_arg_1:Text):void
        {
            var _local_2:Object = this._880039084txtFlushCouple;
            if (_local_2 !== _arg_1)
            {
                this._880039084txtFlushCouple = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtFlushCouple", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn17_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn17 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn17", _ActivePanel_DataGridColumn17);
            return (_local_1);
        }

        public function __popBtn2_click(_arg_1:MouseEvent):void
        {
            popSele(2);
        }

        [Bindable(event="propertyChange")]
        public function get bpBtn0():BasicGlowButton
        {
            return (this._1383795006bpBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get bpBtn1():BasicGlowButton
        {
            return (this._1383795005bpBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get popWeekGrid():DataGrid
        {
            return (this._862864693popWeekGrid);
        }

        private function _ActivePanel_DataGridColumn28_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn28 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn28", _ActivePanel_DataGridColumn28);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get guildWarGrid():DataGrid
        {
            return (this._505391835guildWarGrid);
        }

        public function ___ActivePanel_Canvas13_show(_arg_1:FlexEvent):void
        {
            getInfo("guildWarRank");
        }

        [Bindable(event="propertyChange")]
        public function get bossAll():BasicGlowButton
        {
            return (this._68580084bossAll);
        }

        private function _ActivePanel_DataGridColumn39_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn39 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn39", _ActivePanel_DataGridColumn39);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn16_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn16 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn16", _ActivePanel_DataGridColumn16);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn9", _ActivePanel_DataGridColumn9);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get expGrid():DataGrid
        {
            return (this._1310248189expGrid);
        }

        private function setFlushStr():void
        {
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:uint;
            var _local_1:String = Language.ACTIVEPANEL_S[51];
            var _local_2:uint = new Date().getDate();
            var _local_3:uint = (new Date().getMonth() + 1);
            var _local_4:uint = new Date().getHours();
            if (_local_4 >= 14)
            {
                _local_5 = new Date((new Date().getTime() + 86400000)).getDate();
                _local_6 = (new Date((new Date().getTime() + 86400000)).getMonth() + 1);
                _local_1 = _local_1.replace("{month1}", _local_3).replace("{date1}", _local_2).replace("{month2}", _local_6).replace("{date2}", _local_5).replace("{hour1}", 14).replace("{hour2}", 0);
            }
            else
            {
                _local_7 = new Date((new Date().getTime() - 86400000)).getDate();
                _local_8 = (new Date((new Date().getTime() - 86400000)).getMonth() + 1);
                _local_1 = _local_1.replace("{month1}", _local_3).replace("{date1}", _local_2).replace("{month2}", _local_3).replace("{date2}", _local_2).replace("{hour1}", 0).replace("{hour2}", 14);
            };
            txtFlush.text = _local_1;
        }

        [Bindable(event="propertyChange")]
        public function get achPointGrid():DataGrid
        {
            return (this._1857819888achPointGrid);
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            bangSele(0);
        }

        private function _ActivePanel_DataGridColumn27_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn27 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn27", _ActivePanel_DataGridColumn27);
            return (_local_1);
        }

        public function __nineBossBtnLastPage_click(_arg_1:MouseEvent):void
        {
            showCrossRank(1);
        }

        private function onInfo(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Date;
            flag[_arg_1.name] = true;
            if (_arg_1.name == "level")
            {
                for each (_local_2 in _arg_1.data)
                {
                    _local_2.value = _core.basic.expToLevel(_local_2.value);
                };
            }
            else
            {
                if (_arg_1.name == "treasureHunt")
                {
                    for each (_local_2 in _arg_1.data)
                    {
                        if (_local_2)
                        {
                            _local_3 = new Date(_local_2.time);
                            _local_2.time = ((((_local_3.hours + ":") + _local_3.minutes) + ":") + _local_3.seconds);
                        };
                    };
                };
            };
            this[(_arg_1.name + "Grid")].dataProvider = _arg_1.data;
        }

        [Bindable(event="propertyChange")]
        public function get marriageGrid():DataGrid
        {
            return (this._595248336marriageGrid);
        }

        private function _ActivePanel_DataGridColumn15_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn15 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn15", _ActivePanel_DataGridColumn15);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn38_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn38 = _local_1;
            _local_1.dataField = "totalTime";
            _local_1.width = 100;
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn38", _ActivePanel_DataGridColumn38);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn8", _ActivePanel_DataGridColumn8);
            return (_local_1);
        }

        public function ___ActivePanel_Canvas4_show(_arg_1:FlexEvent):void
        {
            getInfo("pop");
        }

        [Bindable(event="propertyChange")]
        public function get nineBossPageIndicator():TextInput
        {
            return (this._816022719nineBossPageIndicator);
        }

        [Bindable(event="propertyChange")]
        public function get popBtn0():BasicGlowButton
        {
            return (this._395451579popBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get popBtn1():BasicGlowButton
        {
            return (this._395451578popBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get popBtn2():BasicGlowButton
        {
            return (this._395451577popBtn2);
        }

        public function __nineBossBtnNextPage_click(_arg_1:MouseEvent):void
        {
            showCrossRank(2);
        }

        private function _ActivePanel_DataGridColumn26_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn26 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn26", _ActivePanel_DataGridColumn26);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn49_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn49 = _local_1;
            _local_1.dataField = "time";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn49", _ActivePanel_DataGridColumn49);
            return (_local_1);
        }

        public function set bangBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324756bangBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1863324756bangBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtFlushCouple():Text
        {
            return (this._880039084txtFlushCouple);
        }

        public function set bangBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324754bangBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1863324754bangBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn2", _local_2, _arg_1));
            };
        }

        public function set bangBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324753bangBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1863324753bangBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn3", _local_2, _arg_1));
            };
        }

        public function set bangBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324752bangBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1863324752bangBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn4", _local_2, _arg_1));
            };
        }

        public function __bangBtn5_click(_arg_1:MouseEvent):void
        {
            bangSele(5);
        }

        public function set bangBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324751bangBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1863324751bangBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn5", _local_2, _arg_1));
            };
        }

        public function set bangBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324750bangBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1863324750bangBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn6", _local_2, _arg_1));
            };
        }

        public function set bangBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324749bangBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1863324749bangBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn7", _local_2, _arg_1));
            };
        }

        public function set bangBtn8(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324748bangBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1863324748bangBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn8", _local_2, _arg_1));
            };
        }

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        public function set bangBtn9(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324747bangBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1863324747bangBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn9", _local_2, _arg_1));
            };
        }

        public function __popBtn1_click(_arg_1:MouseEvent):void
        {
            popSele(1);
        }

        private function _ActivePanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn14 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn14", _ActivePanel_DataGridColumn14);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn37_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn37 = _local_1;
            _local_1.dataField = "winNum";
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn37", _ActivePanel_DataGridColumn37);
            return (_local_1);
        }

        private function onAddCoupleData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:*;
            var _local_4:int;
            var _local_5:Array;
            for each (_local_2 in _arg_1.data)
            {
                if (_local_2.type == 1)
                {
                    _local_2.level = Language.ACTIVEPANEL_S[42];
                }
                else
                {
                    if (_local_2.type == 2)
                    {
                        _local_2.level = Language.ACTIVEPANEL_S[43];
                    }
                    else
                    {
                        if (_local_2.type == 3)
                        {
                            _local_2.level = Language.ACTIVEPANEL_S[44];
                        }
                        else
                        {
                            _local_2.level = "";
                        };
                    };
                };
                _local_2.timeLable = String(_local_2.time).substr(0, 10);
            };
            if (_arg_1.num != pageSelectorMarriage.totalItemCount)
            {
                pageSelectorMarriage.initPageSeletor(_arg_1.num, NUM_PER_PAGE);
                flag["marriage"] = false;
            };
            for (_local_3 in _arg_1.data)
            {
                coupleData[(_arg_1.start + _local_3)] = _arg_1.data[_local_3];
            };
            _local_4 = 0;
            _local_5 = [];
            while (((_local_4 < NUM_PER_PAGE) && (_arg_1.data[_local_4])))
            {
                _local_5[_local_4] = _arg_1.data[_local_4];
                _local_4++;
            };
            pageCoupleArr = _local_5;
        }

        public function ___ActivePanel_Canvas14_show(_arg_1:FlexEvent):void
        {
            getNineBossRank();
        }

        override public function initialize():void
        {
            var target:ActivePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ActivePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ActivePanelWatcherSetupUtil");
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
        public function get bangBtn0():BasicGlowButton
        {
            return (this._1863324756bangBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn1():BasicGlowButton
        {
            return (this._1863324755bangBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn2():BasicGlowButton
        {
            return (this._1863324754bangBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn3():BasicGlowButton
        {
            return (this._1863324753bangBtn3);
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            if (_arg_1.label == GamePredef.MENU_WISPER)
            {
                _core.view.getUI(ViewManager.MAIN_SYS).wisperChat(_arg_1.item.name);
            }
            else
            {
                if (_arg_1.label == GamePredef.MENU_P2PWISPER)
                {
                    ChatPanelUtil.createChatPanel(_arg_1.item.id);
                }
                else
                {
                    if (_arg_1.label == GamePredef.MENU_INFO)
                    {
                        _core.view.getUI(ViewManager.PANEL_CHARACTORINFO).showChaInfo(_arg_1.item.id);
                    }
                    else
                    {
                        if (_arg_1.label == GamePredef.CHAR_MENU_INVITE_T)
                        {
                            _core.remote.groupInvite(_arg_1.item.id);
                        }
                        else
                        {
                            if (_arg_1.label == GamePredef.CHAR_MENU_TRADE)
                            {
                                _core.view.getUI(ViewManager.PANEL_TRADE).newTrade(_arg_1.item.id, _arg_1.item.name);
                            }
                            else
                            {
                                if (_arg_1.label == GamePredef.MENU_ADDF)
                                {
                                    _core.addFriend(_arg_1.item.name);
                                }
                                else
                                {
                                    if (_arg_1.label == GamePredef.MENU_ADDB)
                                    {
                                        _core.addBlack(_arg_1.item.name);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn5():BasicGlowButton
        {
            return (this._1863324751bangBtn5);
        }

        private function _ActivePanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn13 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn13", _ActivePanel_DataGridColumn13);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn36_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn36 = _local_1;
            _local_1.dataField = "leaderName";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn36", _ActivePanel_DataGridColumn36);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn8():BasicGlowButton
        {
            return (this._1863324748bangBtn8);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn9():BasicGlowButton
        {
            return (this._1863324747bangBtn9);
        }

        private function _ActivePanel_DataGridColumn48_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn48 = _local_1;
            _local_1.dataField = "rank";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn48", _ActivePanel_DataGridColumn48);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn4():BasicGlowButton
        {
            return (this._1863324752bangBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn6():BasicGlowButton
        {
            return (this._1863324750bangBtn6);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn7():BasicGlowButton
        {
            return (this._1863324749bangBtn7);
        }

        public function set nineBossBtnNextPage(_arg_1:Button):void
        {
            var _local_2:Object = this._2086588895nineBossBtnNextPage;
            if (_local_2 !== _arg_1)
            {
                this._2086588895nineBossBtnNextPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nineBossBtnNextPage", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn25_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn25 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn25", _ActivePanel_DataGridColumn25);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn6", _ActivePanel_DataGridColumn6);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn7", _ActivePanel_DataGridColumn7);
            return (_local_1);
        }

        public function __achPointGrid_itemDoubleClick(_arg_1:ListEvent):void
        {
            gridClick(_arg_1);
        }

        public function ___ActivePanel_Canvas5_show(_arg_1:FlexEvent):void
        {
            getInfo("pop");
        }

        public function set vsBp(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._3628011vsBp;
            if (_local_2 !== _arg_1)
            {
                this._3628011vsBp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsBp", _local_2, _arg_1));
            };
        }

        private function _ActivePanel_DataGridColumn24_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn24 = _local_1;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn24", _ActivePanel_DataGridColumn24);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn47_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn47 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn47", _ActivePanel_DataGridColumn47);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn12 = _local_1;
            _local_1.dataField = "value";
            _local_1.sortCompareFunction = valueSortFunc;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn12", _ActivePanel_DataGridColumn12);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn35_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn35 = _local_1;
            _local_1.dataField = "guildName";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn35", _ActivePanel_DataGridColumn35);
            return (_local_1);
        }

        private function _ActivePanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _ActivePanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "guild";
            BindingManager.executeBindings(this, "_ActivePanel_DataGridColumn5", _ActivePanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get vsBp():ViewStack
        {
            return (this._3628011vsBp);
        }

        public function set bossLocal(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1491193854bossLocal;
            if (_local_2 !== _arg_1)
            {
                this._1491193854bossLocal = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossLocal", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bossLocal():BasicGlowButton
        {
            return (this._1491193854bossLocal);
        }


    }
}//package com.qeedoo.ui.view.compDragable

