// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.WorldCupPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.WorldCupShopSlot;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.controls.DataGrid;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.WorldCupCanvas;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.IntroText;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.config.Language;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import flash.net.Responder;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.BindingManager;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.utils.TimeUtil;
    import com.qeedoo.game.data.GameData;
    import mx.managers.PopUpManager;
    import mx.core.IUITextField;
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

    public class WorldCupPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2003077507lab6_B_0:Label;
        private var _2006772552lab2_A_0:Label;
        private var _735133884img4_A_0:Image;
        private var _320271553btnLastPage:Button;
        private var _1178662790item18:WorldCupShopSlot;
        private var _1178662762item25:WorldCupShopSlot;
        private var _2002148220lab7_H_0:Label;
        private var _732359477img7_E_0:Image;
        private var _2012833818yLab5_D:Label;
        private var _2012833820yLab5_B:Label;
        private var _1917162409btnLastPageShopGold:Button;
        private var _2012832857yLab6_D:Label;
        private var _1178662795item13:WorldCupShopSlot;
        private var _1178662767item20:WorldCupShopSlot;
        public var _WorldCupPanel_LinkButton1:LinkButton;
        private var _2004001028lab5_B_0:Label;
        private var _732357554img7_G_1:Image;
        private var _1110415956labg_1:Label;
        private var _click:Number = -1;
        public var _WorldCupPanel_Image39:Image;
        private var _1178662789item19:WorldCupShopSlot;
        public var _WorldCupPanel_Image40:Image;
        private var _1863324754bangBtn2:BasicGlowButton;
        public var _WorldCupPanel_Image50:Image;
        public var _WorldCupPanel_Image51:Image;
        public var _WorldCupPanel_Image52:Image;
        private var _967394996btnNextPageShop:Button;
        private var _1378849180btn7_H:DelayButton;
        public var _WorldCupPanel_DelayButton1:DelayButton;
        public var _WorldCupPanel_DelayButton2:DelayButton;
        private var _688048726imgg_2_2:Image;
        private var _defaultMaxIndex:Number = 8;
        private var _732362360img7_B_0:Image;
        private var _1378850147btn6_B:DelayButton;
        private var _1378849185btn7_C:DelayButton;
        private var _732359476img7_E_1:Image;
        private var _255677842rankGrid:DataGrid;
        private var _734208441img5_C_0:Image;
        private var _1378851109btn5_A:DelayButton;
        private var _2002153986lab7_B_0:Label;
        private var _2089469638txtPageIndicatorShop:TextInput;
        private var _733284920img6_C_0:Image;
        private var _1863324753bangBtn3:BasicGlowButton;
        private var _1178662760item27:WorldCupShopSlot;
        private var _732361399img7_C_0:Image;
        private var _2012835743yLab3_A:Label;
        private var _2002150142lab7_F_0:Label;
        private var _2012832854yLab6_G:Label;
        private var _2012834782yLab4_A:Label;
        private var _1178662793item15:WorldCupShopSlot;
        private var _1178662765item22:WorldCupShopSlot;
        private var _119152xz2:WorldCupCanvas;
        private var _shopIndex:Number = 1;
        private var _1957841314labg_1_1:Image;
        private var _timeAward:String = "";
        private var _2005849031lab3_A_0:Label;
        private var _1178662759item28:WorldCupShopSlot;
        private var _2012832859yLab6_B:Label;
        private var _clickgState:Number = -1;
        private var _1178662798item10:WorldCupShopSlot;
        private var _733286842img6_A_0:Image;
        private var _2002153985lab7_B_1:Label;
        private var _2003072702lab6_G_0:Label;
        private var _733283959img6_D_0:Image;
        public var _checkTime:Number = 0;
        private var _737904447img1_A_0:Image;
        private var _808459627vsBang:ViewStack;
        private var _2002152064lab7_D_0:Label;
        private var _1378850145btn6_D:DelayButton;
        private var _1378849183btn7_E:DelayButton;
        private var _1863324752bangBtn4:BasicGlowButton;
        private var _119154xz4:WorldCupCanvas;
        private var _2002150141lab7_F_1:Label;
        private var _732361398img7_C_1:Image;
        private var _736980926img2_A_0:Image;
        private var _701799496_myTeamSc:Number = 0;
        private var _733280115img6_H_0:Image;
        private var _734210363img5_A_0:Image;
        private var _873453351title1:Image;
        private var _2004925510lab4_A_0:Label;
        private var _582286198introCon:IntroText;
        private var _1957841313labg_1_2:Image;
        private var _2003074624lab6_E_0:Label;
        private var _2004001989lab5_A_0:Label;
        public var _WorldCupPanel_Image1:Image;
        public var _WorldCupPanel_Image2:Image;
        public var _WorldCupPanel_Image3:Image;
        public var _WorldCupPanel_Image4:Image;
        private var _732356594img7_H_0:Image;
        private var _1178662791item17:WorldCupShopSlot;
        private var _1178662763item24:WorldCupShopSlot;
        private var _119156xz6:WorldCupCanvas;
        private var _2002152063lab7_D_1:Label;
        private var _clickId:Number = -1;
        private var _735132923img4_B_0:Image;
        private var _733282037img6_F_0:Image;
        private var _2012832856yLab6_E:Label;
        public var _WorldCupPanel_DelayButton19:DelayButton;
        private var _version:String = "wc_-1";
        private var GoldScheduleState:Number = 8;
        private var _289667927btnLastPageShop:Button;
        private var _732358516img7_F_0:Image;
        public var _WorldCupPanel_DelayButton20:DelayButton;
        public var _WorldCupPanel_DelayButton21:DelayButton;
        public var _WorldCupPanel_DelayButton22:DelayButton;
        public var _WorldCupPanel_DelayButton23:DelayButton;
        private var _1863324751bangBtn5:BasicGlowButton;
        private var _2004924549lab4_B_0:Label;
        private var _1178662796item12:WorldCupShopSlot;
        public var _WorldCupPanel_DataGridColumn10:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn11:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn12:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn13:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn14:DataGridColumn;
        private var _2003076546lab6_C_0:Label;
        private var _442404173_myOutSc:Number = 0;
        private var _2006771591lab2_B_0:Label;
        private var _1378849181btn7_G:DelayButton;
        private var _clickgGroup:String = "A";
        public var _WorldCupPanel_Label51:Label;
        public var _WorldCupPanel_Label52:Label;
        public var _WorldCupPanel_Label53:Label;
        public var _WorldCupPanel_Label54:Label;
        public var _WorldCupPanel_Label55:Label;
        public var _WorldCupPanel_Label56:Label;
        public var _WorldCupPanel_Label59:Label;
        private var _119158xz8:WorldCupCanvas;
        private var _1378850148btn6_A:DelayButton;
        public var _WorldCupPanel_Label60:Label;
        public var _WorldCupPanel_Label61:Label;
        public var _WorldCupPanel_Label63:Label;
        private var _1378849186btn7_B:DelayButton;
        private var _1378803074btng_2:Button;
        private var _2003999106lab5_D_0:Label;
        private var _alert:Alert;
        private var _2004000067lab5_C_0:Label;
        private var _732356593img7_H_1:Image;
        private var _688049688imgg_1_1:Image;
        private var _1378852070btn4_A:DelayButton;
        private var _2003078468lab6_A_0:Label;
        private var _732358515img7_F_1:Image;
        private var _1863324750bangBtn6:BasicGlowButton;
        private var _shopMaxIndex:Number = 1;
        private var _2002149181lab7_G_0:Label;
        private var _2012832853yLab6_H:Label;
        private var _1178662761item26:WorldCupShopSlot;
        private var _1829757008ginfo_grid:DataGrid;
        private var _defaultIndex:Number = 1;
        public var _WorldCupPanel_DataGridColumn1:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn2:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn3:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn4:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn5:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn6:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn7:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn8:DataGridColumn;
        public var _WorldCupPanel_DataGridColumn9:DataGridColumn;
        private var _2012834781yLab4_B:Label;
        private var _2012833819yLab5_C:Label;
        private var _732363321img7_A_0:Image;
        private var _2012833821yLab5_A:Label;
        private var _732360438img7_D_0:Image;
        private var _734207480img5_D_0:Image;
        private var _1178662794item14:WorldCupShopSlot;
        private var _1178662766item21:WorldCupShopSlot;
        private var _2012832858yLab6_C:Label;
        private var _1110415955labg_2:Label;
        private var _rankVersion:String = "wcr_-1";
        private var _2012832860yLab6_A:Label;
        private var _564183348btnNextPageShopGold:Button;
        private var _1378853992btn2_A:DelayButton;
        private var _734209402img5_B_0:Image;
        private var _688049687imgg_1_2:Image;
        private var _2002154947lab7_A_0:Label;
        private var _119151xz1:WorldCupCanvas;
        private var _1378850146btn6_C:DelayButton;
        private var _1378849184btn7_D:DelayButton;
        private var _736979965img2_B_0:Image;
        private var _2002149180lab7_G_1:Label;
        private var _1957840353labg_2_1:Image;
        private var _2002151103lab7_E_0:Label;
        private var _732363320img7_A_1:Image;
        private var _1378851108btn5_B:DelayButton;
        private var _415230022txtPageIndicatorShopGold:TextInput;
        private var _2002148219lab7_H_1:Label;
        private var _732360437img7_D_1:Image;
        private var _1229795408txtPageIndicator:TextInput;
        private var _733285881img6_B_0:Image;
        private var _2003071741lab6_H_0:Label;
        private var _733282998img6_E_0:Image;
        private var _119153xz3:WorldCupCanvas;
        private var _2012837665yLab1_A:Label;
        private var _2002154946lab7_A_1:Label;
        private var _2002153025lab7_C_0:Label;
        private var _2012832855yLab6_F:Label;
        private var _1863324756bangBtn0:BasicGlowButton;
        private var _1178662792item16:WorldCupShopSlot;
        private var _1178662764item23:WorldCupShopSlot;
        private var _shopGoldMaxIndex:Number = 1;
        private var _736057405img3_A_0:Image;
        public var _WorldCupPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1178662758item29:WorldCupShopSlot;
        private var _1957840352labg_2_2:Image;
        private var _2002151102lab7_E_1:Label;
        private var _732362359img7_B_1:Image;
        private var _1178662797item11:WorldCupShopSlot;
        private var _1607243192endTime:Label;
        private var _2003073663lab6_F_0:Label;
        private var _119155xz5:WorldCupCanvas;
        private var _refreshBtn:Boolean = true;
        private var _2007696073lab1_A_0:Label;
        private var _1378849182btn7_F:DelayButton;
        private var _733281076img6_G_0:Image;
        private var _732357555img7_G_0:Image;
        private var _1378849187btn7_A:DelayButton;
        private var _1378803075btng_1:Button;
        private var _2002153024lab7_C_1:Label;
        private var _1090881890btnNextPage:Button;
        private var _1863324755bangBtn1:BasicGlowButton;
        private var _2003075585lab6_D_0:Label;
        private var _1715068648endTime0:Label;
        private var _119157xz7:WorldCupCanvas;
        private var _688048727imgg_2_1:Image;
        private var _shopGoldIndex:Number = 1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":850,
                    "height":572,
                    "creationPolicy":"all",
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_WorldCupPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 1;
                            this.top = "35";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "percentWidth":100,
                                "height":26,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"bangBtn0",
                                    "events":{"click":"__bangBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "height":26,
                                            "selected":true,
                                            "labelPlacement":"bottom",
                                            "width":61
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
                                            "height":26,
                                            "width":61
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
                                            "height":26,
                                            "width":61
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
                                            "height":26,
                                            "width":61
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
                                            "height":26,
                                            "width":61
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
                                            "height":26,
                                            "width":81
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
                                            "height":26,
                                            "width":81
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"_WorldCupPanel_DelayButton1",
                        "events":{"click":"___WorldCupPanel_DelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":735,
                                "y":35,
                                "clickDelay":3000,
                                "styleName":"BtnStdRed",
                                "width":95
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vsBang",
                        "stylesFactory":function ():void
                        {
                            this.top = "60";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "creationPolicy":"all",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":825,
                                            "height":500,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":805,
                                                        "height":190,
                                                        "x":10.3,
                                                        "y":9.15,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WorldCupPanel_Image1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":1,
                                                                    "y":1,
                                                                    "width":803,
                                                                    "height":188
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___WorldCupPanel_Button1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"duihuanjiangli",
                                                                    "x":0x0202,
                                                                    "y":148,
                                                                    "width":109,
                                                                    "height":34
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
                                                        "width":805,
                                                        "height":264,
                                                        "x":10.3,
                                                        "y":202,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":IntroText,
                                                            "id":"introCon",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":800,
                                                                    "height":254,
                                                                    "x":3,
                                                                    "y":5
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_WorldCupPanel_DelayButton2",
                                                "events":{"click":"___WorldCupPanel_DelayButton2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":367.6,
                                                        "y":470,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":95
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":825,
                                            "height":500,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_WorldCupPanel_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":825,
                                                        "height":500,
                                                        "x":0,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":1,
                                                        "styleName":"RoundedGradientBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":208,
                                                        "styleName":"RoundedGradientBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":415,
                                                        "styleName":"RoundedGradientBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":622,
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":203
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":1,
                                                        "y":251,
                                                        "styleName":"RoundedGradientBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":208,
                                                        "y":251,
                                                        "styleName":"RoundedGradientBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":415,
                                                        "y":251,
                                                        "styleName":"RoundedGradientBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":WorldCupCanvas,
                                                "id":"xz8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":622,
                                                        "y":251,
                                                        "styleName":"RoundedGradientBorder",
                                                        "width":203
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":825,
                                            "height":500,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_WorldCupPanel_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":825,
                                                        "height":500,
                                                        "x":0,
                                                        "y":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_WorldCupPanel_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":155,
                                                        "height":163,
                                                        "x":331,
                                                        "y":-4
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_A_0",
                                                "events":{"click":"__img7_A_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":35,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":48,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_A",
                                                "events":{"click":"__btn7_A_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":53,
                                                        "y":70,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_A_1",
                                                "events":{"click":"__img7_A_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":88,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_A_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":101,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_B_0",
                                                "events":{"click":"__img7_B_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":153,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_B_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":166,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_B",
                                                "events":{"click":"__btn7_B_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":53,
                                                        "y":188,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_B_1",
                                                "events":{"click":"__img7_B_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":210,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_B_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":221,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_C_0",
                                                "events":{"click":"__img7_C_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":281,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_C_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":292,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_C",
                                                "events":{"click":"__btn7_C_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":53,
                                                        "y":316,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_C_1",
                                                "events":{"click":"__img7_C_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":334,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_C_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":348,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_D_0",
                                                "events":{"click":"__img7_D_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":398,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_D_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":411,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_D",
                                                "events":{"click":"__btn7_D_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":53,
                                                        "y":433,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_D_1",
                                                "events":{"click":"__img7_D_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":9,
                                                        "y":453,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_D_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":50,
                                                        "y":466,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_E_0",
                                                "events":{"click":"__img7_E_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":779,
                                                        "y":35,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_E_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":48,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_E",
                                                "events":{"click":"__btn7_E_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":695,
                                                        "y":70,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_E_1",
                                                "events":{"click":"__img7_E_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":88,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_E_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":101,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_F_0",
                                                "events":{"click":"__img7_F_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":153,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_F_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":166,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_F",
                                                "events":{"click":"__btn7_F_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":695,
                                                        "y":188,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_F_1",
                                                "events":{"click":"__img7_F_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":210,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_F_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":221,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_G_0",
                                                "events":{"click":"__img7_G_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":281,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_G_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":292,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_G",
                                                "events":{"click":"__btn7_G_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":695,
                                                        "y":316,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_G_1",
                                                "events":{"click":"__img7_G_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":334,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_G_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":348,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_H_0",
                                                "events":{"click":"__img7_H_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":398,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_H_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":411,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn7_H",
                                                "events":{"click":"__btn7_H_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":695,
                                                        "y":433,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img7_H_1",
                                                "events":{"click":"__img7_H_1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":777,
                                                        "y":449,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab7_H_1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "48";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":466,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_A",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":135,
                                                        "y":35,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_E",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":583,
                                                        "y":38,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_A_0",
                                                "events":{"click":"__img6_A_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":138,
                                                        "y":62,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":74,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn6_A",
                                                "events":{"click":"__btn6_A_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":120,
                                                        "y":130,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_B",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":135,
                                                        "y":227,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_F",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":583,
                                                        "y":228,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_B_0",
                                                "events":{"click":"__img6_B_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":138,
                                                        "y":182,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_B_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":196,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_C",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":138,
                                                        "y":282,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_G",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":585,
                                                        "y":283,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_D",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":138,
                                                        "y":470,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab6_H",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":589,
                                                        "y":470,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_C_0",
                                                "events":{"click":"__img6_C_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":138,
                                                        "y":307,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_C_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":320,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn6_B",
                                                "events":{"click":"__btn6_B_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":120,
                                                        "y":375,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_D_0",
                                                "events":{"click":"__img6_D_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":138,
                                                        "y":427,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_D_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":440,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_E_0",
                                                "events":{"click":"__img6_E_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":639,
                                                        "y":62,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_E_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "188";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":74,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn6_C",
                                                "events":{"click":"__btn6_C_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":628,
                                                        "y":130,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_F_0",
                                                "events":{"click":"__img6_F_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":639,
                                                        "y":182,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_F_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "188";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":196,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_G_0",
                                                "events":{"click":"__img6_G_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":639,
                                                        "y":307,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_G_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "188";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":320,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn6_D",
                                                "events":{"click":"__btn6_D_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":628,
                                                        "y":375,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img6_H_0",
                                                "events":{"click":"__img6_H_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":639,
                                                        "y":427,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab6_H_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "188";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":440,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab5_A",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":213,
                                                        "y":97,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab5_C",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":518,
                                                        "y":97,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab5_D",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":517,
                                                        "y":348,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab5_B",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":213,
                                                        "y":348,
                                                        "width":119,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img5_A_0",
                                                "events":{"click":"__img5_A_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":213,
                                                        "y":120,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab5_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":134,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn5_A",
                                                "events":{"click":"__btn5_A_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":180,
                                                        "y":254,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img5_B_0",
                                                "events":{"click":"__img5_B_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":213,
                                                        "y":372,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab5_B_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0xFF,
                                                        "y":385,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img5_C_0",
                                                "events":{"click":"__img5_C_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":564,
                                                        "y":120,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab5_C_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "264";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":134,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img5_D_0",
                                                "events":{"click":"__img5_D_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":564,
                                                        "y":372,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab5_D_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "264";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":385,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn5_B",
                                                "events":{"click":"__btn5_B_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":560,
                                                        "y":254,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab4_A",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":275,
                                                        "y":0xFF,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab4_B",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":430,
                                                        "y":0xFF,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab3_A",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":332,
                                                        "y":171,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img4_A_0",
                                                "events":{"click":"__img4_A_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":275,
                                                        "y":212,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab4_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":316,
                                                        "y":225,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img4_B_0",
                                                "events":{"click":"__img4_B_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":502,
                                                        "y":212,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab4_B_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "326";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":225,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn4_A",
                                                "events":{"click":"__btn4_A_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":379,
                                                        "y":226,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img3_A_0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":355,
                                                        "y":128,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab3_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":396,
                                                        "y":141,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"yLab1_A",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":355,
                                                        "y":402,
                                                        "width":122,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img2_A_0",
                                                "events":{"click":"__img2_A_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":275,
                                                        "y":279,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab2_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":316,
                                                        "y":294,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img2_B_0",
                                                "events":{"click":"__img2_B_0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":502,
                                                        "y":279,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab2_B_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                    this.right = "326";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":294,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"btn2_A",
                                                "events":{"click":"__btn2_A_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":379,
                                                        "y":291,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":67
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"img1_A_0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "buttonMode":true,
                                                        "useHandCursor":true,
                                                        "x":355,
                                                        "y":358,
                                                        "width":39,
                                                        "height":39
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"lab1_A_0",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":396,
                                                        "y":372,
                                                        "width":77,
                                                        "height":21
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":LinkButton,
                                                "id":"_WorldCupPanel_LinkButton1",
                                                "events":{"click":"___WorldCupPanel_LinkButton1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 16118284;
                                                    this.textDecoration = "underline";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":332,
                                                        "y":438,
                                                        "width":220
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
                                            "width":825,
                                            "height":500,
                                            "x":50,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "y":175,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":815,
                                                        "height":459,
                                                        "x":5,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"rankGrid",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "doubleClickEnabled":true,
                                                                    "height":400,
                                                                    "columns":[_WorldCupPanel_DataGridColumn1_i(), _WorldCupPanel_DataGridColumn2_i(), _WorldCupPanel_DataGridColumn3_i(), _WorldCupPanel_DataGridColumn4_i(), _WorldCupPanel_DataGridColumn5_i(), _WorldCupPanel_DataGridColumn6_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WorldCupPanel_Label51",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37,
                                                        "y":467,
                                                        "width":171,
                                                        "height":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WorldCupPanel_Label52",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":135,
                                                        "y":467,
                                                        "width":171,
                                                        "height":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WorldCupPanel_Label53",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":37,
                                                        "y":467,
                                                        "width":171,
                                                        "height":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WorldCupPanel_Label54",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":235,
                                                        "y":467,
                                                        "width":171,
                                                        "height":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WorldCupPanel_Label55",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":365,
                                                        "y":467,
                                                        "width":171,
                                                        "height":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_WorldCupPanel_Label56",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFD700;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":510,
                                                        "y":467,
                                                        "width":197,
                                                        "height":28
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_WorldCupPanel_DelayButton19",
                                                "events":{"click":"___WorldCupPanel_DelayButton19_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":715,
                                                        "y":467,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":95
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
                                            "width":825,
                                            "height":500,
                                            "x":50,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "y":175,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":805,
                                                        "height":190,
                                                        "x":10.3,
                                                        "y":9.15,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WorldCupPanel_Image39",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":1,
                                                                    "y":1,
                                                                    "width":803,
                                                                    "height":188
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___WorldCupPanel_Button2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"duihuanjiangli",
                                                                    "x":0x0202,
                                                                    "y":148,
                                                                    "width":109,
                                                                    "height":34
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
                                                        "width":805,
                                                        "height":264,
                                                        "x":10.3,
                                                        "y":202,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WorldCupPanel_Image40",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":1,
                                                                    "y":1,
                                                                    "width":803,
                                                                    "height":262
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"title1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":319.95,
                                                                    "width":163,
                                                                    "height":39,
                                                                    "y":5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"imgg_1_1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":18,
                                                                    "y":47,
                                                                    "width":133,
                                                                    "height":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"imgg_1_2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":264,
                                                                    "y":47,
                                                                    "width":133,
                                                                    "height":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"labg_1_1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":23,
                                                                    "y":191.45,
                                                                    "width":120,
                                                                    "height":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"labg_1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 16777015;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":230,
                                                                    "width":207,
                                                                    "height":24
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"imgg_2_1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":408,
                                                                    "y":47,
                                                                    "width":133,
                                                                    "height":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"imgg_2_2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":650,
                                                                    "y":47,
                                                                    "width":133,
                                                                    "height":135
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"labg_2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 16777015;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":510,
                                                                    "y":230,
                                                                    "width":207,
                                                                    "height":24
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
                                                                    "x":328.5,
                                                                    "y":233,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"btnLastPage",
                                                                        "events":{"buttonDown":"__btnLastPage_buttonDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"LastPage",
                                                                                "autoRepeat":true,
                                                                                "label":"上一页",
                                                                                "width":45,
                                                                                "useHandCursor":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"txtPageIndicator",
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
                                                                        "id":"btnNextPage",
                                                                        "events":{"buttonDown":"__btnNextPage_buttonDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"NextPage",
                                                                                "autoRepeat":true,
                                                                                "label":"下一页",
                                                                                "width":45,
                                                                                "useHandCursor":true,
                                                                                "y":0
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"labg_1_2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":273,
                                                                    "y":190,
                                                                    "width":120,
                                                                    "height":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"labg_2_1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":417,
                                                                    "y":190,
                                                                    "width":120,
                                                                    "height":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"labg_2_2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":660,
                                                                    "y":190,
                                                                    "width":120,
                                                                    "height":34
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"btng_1",
                                                            "events":{"click":"__btng_1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"yazhu",
                                                                    "x":206,
                                                                    "y":185.46,
                                                                    "width":61,
                                                                    "height":29
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "id":"btng_2",
                                                            "events":{"click":"__btng_2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"yazhu",
                                                                    "x":596,
                                                                    "y":185.46,
                                                                    "width":61,
                                                                    "height":29
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_WorldCupPanel_DelayButton20",
                                                "events":{"click":"___WorldCupPanel_DelayButton20_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":370.6,
                                                        "y":470,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":95
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
                                            "width":825,
                                            "height":500,
                                            "x":50,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "y":175,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":805,
                                                        "height":190,
                                                        "x":10.3,
                                                        "y":9.15,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WorldCupPanel_Image50",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":1,
                                                                    "y":1,
                                                                    "width":803,
                                                                    "height":188
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___WorldCupPanel_Button7_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"duihuanjiangli",
                                                                    "x":0x0202,
                                                                    "y":148,
                                                                    "width":109,
                                                                    "height":34
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
                                                        "width":805,
                                                        "height":264,
                                                        "x":10.3,
                                                        "y":202,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":795,
                                                                    "height":208,
                                                                    "x":5,
                                                                    "y":28,
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "styleName":"RoundedGradientBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":DataGrid,
                                                                        "id":"ginfo_grid",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":19,
                                                                                "y":30,
                                                                                "resizableColumns":false,
                                                                                "draggableColumns":false,
                                                                                "doubleClickEnabled":true,
                                                                                "height":180,
                                                                                "columns":[_WorldCupPanel_DataGridColumn7_i(), _WorldCupPanel_DataGridColumn8_i(), _WorldCupPanel_DataGridColumn9_i(), _WorldCupPanel_DataGridColumn10_i(), _WorldCupPanel_DataGridColumn11_i(), _WorldCupPanel_DataGridColumn12_i(), _WorldCupPanel_DataGridColumn13_i(), _WorldCupPanel_DataGridColumn14_i()]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WorldCupPanel_Label59",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 15;
                                                                this.color = 0xFFD700;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":18.95,
                                                                    "y":239,
                                                                    "width":285,
                                                                    "height":24
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WorldCupPanel_Label60",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 15;
                                                                this.color = 0xFFD700;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":356,
                                                                    "y":7,
                                                                    "width":123,
                                                                    "height":24
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"_WorldCupPanel_DelayButton21",
                                                            "events":{"click":"___WorldCupPanel_DelayButton21_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":687.6,
                                                                    "y":237,
                                                                    "clickDelay":5000,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":95
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":DelayButton,
                                                "id":"_WorldCupPanel_DelayButton22",
                                                "events":{"click":"___WorldCupPanel_DelayButton22_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":367.6,
                                                        "y":470,
                                                        "clickDelay":3000,
                                                        "styleName":"BtnStdRed",
                                                        "width":95
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":825,
                                            "height":500,
                                            "x":0,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "styleName":"RoundedGradientBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "23";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":805,
                                                        "height":225,
                                                        "x":10,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DelayButton,
                                                            "id":"_WorldCupPanel_DelayButton23",
                                                            "events":{"click":"___WorldCupPanel_DelayButton23_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":698.5,
                                                                    "y":11,
                                                                    "clickDelay":3000,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":95
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item20",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":38
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item21",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168,
                                                                    "y":38
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item22",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":327.5,
                                                                    "y":38
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item23",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":485.5,
                                                                    "y":38
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item24",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":643.5,
                                                                    "y":38
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item25",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":11.5,
                                                                    "y":116
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item26",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":169.5,
                                                                    "y":116
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item27",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":329,
                                                                    "y":116
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item28",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":487,
                                                                    "y":116
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item29",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":645,
                                                                    "y":116
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
                                                                    "x":328.5,
                                                                    "y":196,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"btnLastPageShopGold",
                                                                        "events":{"buttonDown":"__btnLastPageShopGold_buttonDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"LastPage",
                                                                                "autoRepeat":true,
                                                                                "label":"上一页",
                                                                                "width":45,
                                                                                "useHandCursor":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"txtPageIndicatorShopGold",
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
                                                                        "id":"btnNextPageShopGold",
                                                                        "events":{"buttonDown":"__btnNextPageShopGold_buttonDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"NextPage",
                                                                                "autoRepeat":true,
                                                                                "label":"下一页",
                                                                                "width":45,
                                                                                "useHandCursor":true,
                                                                                "y":0
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WorldCupPanel_Image51",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":645,
                                                                    "y":197,
                                                                    "width":20,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WorldCupPanel_Label61",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":672.5,
                                                                    "y":197,
                                                                    "height":20,
                                                                    "width":129.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"endTime",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.color = 16777015;
                                                                this.fontSize = 14;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":297,
                                                                    "y":10,
                                                                    "width":211,
                                                                    "height":23
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "265";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":805,
                                                        "height":225,
                                                        "x":10,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item10",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":41
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item11",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":168,
                                                                    "y":41
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":327.5,
                                                                    "y":41
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item13",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":485.5,
                                                                    "y":41
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item14",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":643.5,
                                                                    "y":41
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item15",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":11.5,
                                                                    "y":119
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item16",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":169.5,
                                                                    "y":119
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item17",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":329,
                                                                    "y":119
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item18",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":487,
                                                                    "y":119
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":WorldCupShopSlot,
                                                            "id":"item19",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":645,
                                                                    "y":119
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
                                                                    "x":328.5,
                                                                    "y":196,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Button,
                                                                        "id":"btnLastPageShop",
                                                                        "events":{"buttonDown":"__btnLastPageShop_buttonDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"LastPage",
                                                                                "autoRepeat":true,
                                                                                "label":"上一页",
                                                                                "width":45,
                                                                                "useHandCursor":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"txtPageIndicatorShop",
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
                                                                        "id":"btnNextPageShop",
                                                                        "events":{"buttonDown":"__btnNextPageShop_buttonDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"NextPage",
                                                                                "autoRepeat":true,
                                                                                "label":"下一页",
                                                                                "width":45,
                                                                                "useHandCursor":true,
                                                                                "y":0
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_WorldCupPanel_Image52",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":645,
                                                                    "y":197,
                                                                    "width":20,
                                                                    "height":20
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_WorldCupPanel_Label63",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":671.5,
                                                                    "y":197,
                                                                    "height":20,
                                                                    "width":129.5
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"endTime0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.color = 16777015;
                                                                this.fontSize = 14;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":297,
                                                                    "y":10,
                                                                    "width":211,
                                                                    "height":23
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
        private var WORLD_CUP_GROUP:Object = {};
        private var WORLD_CUP_ODDS:Object = {};
        private var WORLD_CUP_REQUIRE:Object = {};
        private var WORLD_CUP_TIME_GOLD_LIMIT:Object = {};
        private var WORLD_CUP_LIMIT:Object = {};
        private var WORLD_CUP_LIMIT_1:Object = {};
        private var _worldCupFlag:Object = {};
        private var _vsObject:Object = {};
        private var _charData:Object = {};
        private var _allTeamArr:Object = {};
        private var _choseTeam:Object = {};
        private var WORLD_CUP_ADD:Object = {
            "A":"A",
            "B":"A",
            "C":"B",
            "D":"B",
            "E":"C",
            "F":"C",
            "G":"D",
            "H":"D"
        };
        private var WORLD_CUP_MINUS:Object = {
            "A":"A|B",
            "B":"C|D",
            "C":"E|F",
            "D":"G|H"
        };
        private var _shopData:Array = new Array();
        private var _shopDataGold:Array = new Array();
        private var _showObject:Object = {};
        private var GoldSchedule:Object = {};
        private var saveBtnId:Object = {
            "7":{
                "1":"A",
                "2":"B",
                "3":"C",
                "4":"D",
                "5":"E",
                "6":"F",
                "7":"G",
                "8":"H"
            },
            "6":{
                "1":"A",
                "2":"B",
                "3":"C",
                "4":"D"
            },
            "5":{
                "1":"A",
                "2":"B"
            },
            "4":{"1":"A"},
            "2":{"1":"A"}
        };
        private var GROUP_INDEX_STATE:Object = {
            "8":(32 + Language.WORLD_CUP_PANEL[27]),
            "7":(16 + Language.WORLD_CUP_PANEL[27]),
            "6":(8 + Language.WORLD_CUP_PANEL[27]),
            "5":(4 + Language.WORLD_CUP_PANEL[27]),
            "4":Language.WORLD_CUP_PANEL[25],
            "2":Language.WORLD_CUP_PANEL[26]
        };
        private var _groupNum:Object = {
            "7":16,
            "6":8,
            "5":4,
            "4":2,
            "3":1,
            "2":2,
            "1":1
        };
        private var _groupCanvasId:Object = {
            "A":"xz1",
            "B":"xz2",
            "C":"xz3",
            "D":"xz4",
            "E":"xz5",
            "F":"xz6",
            "G":"xz7",
            "H":"xz8"
        };
        private var jieduan:Object = {
            "7":Language.WORLD_CUP_STATE[7],
            "6":Language.WORLD_CUP_STATE[6],
            "5":Language.WORLD_CUP_STATE[5],
            "4":Language.WORLD_CUP_STATE[4],
            "2":Language.WORLD_CUP_STATE[2]
        };
        private var jieduanImage:Object = {
            "7":"4130220000472",
            "6":"4130220000473",
            "5":"4130220000474",
            "4":"4130220000475",
            "2":"4130220000475"
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function WorldCupPanel()
        {
            mx_internal::_document = this;
            this.width = 850;
            this.height = 572;
            this.styleName = "StandardContent";
            this.creationPolicy = "all";
            this.addEventListener("creationComplete", ___WorldCupPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            WorldCupPanel._watcherSetupUtil = _arg_1;
        }


        public function set img2_B_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._736979965img2_B_0;
            if (_local_2 !== _arg_1)
            {
                this._736979965img2_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2_B_0", _local_2, _arg_1));
            };
        }

        public function ___WorldCupPanel_DelayButton1_click(_arg_1:MouseEvent):void
        {
            tradeAward();
        }

        [Bindable(event="propertyChange")]
        public function get img7_H_0():Image
        {
            return (this._732356594img7_H_0);
        }

        [Bindable(event="propertyChange")]
        public function get img7_H_1():Image
        {
            return (this._732356593img7_H_1);
        }

        public function set img7_H_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732356594img7_H_0;
            if (_local_2 !== _arg_1)
            {
                this._732356594img7_H_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_H_0", _local_2, _arg_1));
            };
        }

        public function set img7_H_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732356593img7_H_1;
            if (_local_2 !== _arg_1)
            {
                this._732356593img7_H_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_H_1", _local_2, _arg_1));
            };
        }

        public function __img7_E_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "E");
        }

        public function __img6_G_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "G");
        }

        public function set yLab4_A(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012834782yLab4_A;
            if (_local_2 !== _arg_1)
            {
                this._2012834782yLab4_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab4_A", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtPageIndicatorShopGold():TextInput
        {
            return (this._415230022txtPageIndicatorShopGold);
        }

        public function set yLab4_B(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012834781yLab4_B;
            if (_local_2 !== _arg_1)
            {
                this._2012834781yLab4_B = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab4_B", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img2_A_0():Image
        {
            return (this._736980926img2_A_0);
        }

        public function __btng_2_click(_arg_1:MouseEvent):void
        {
            showVsPanel(2);
        }

        [Bindable(event="propertyChange")]
        public function get yLab3_A():Label
        {
            return (this._2012835743yLab3_A);
        }

        [Bindable(event="propertyChange")]
        public function get item10():WorldCupShopSlot
        {
            return (this._1178662798item10);
        }

        [Bindable(event="propertyChange")]
        public function get item11():WorldCupShopSlot
        {
            return (this._1178662797item11);
        }

        [Bindable(event="propertyChange")]
        public function get item12():WorldCupShopSlot
        {
            return (this._1178662796item12);
        }

        [Bindable(event="propertyChange")]
        public function get item13():WorldCupShopSlot
        {
            return (this._1178662795item13);
        }

        [Bindable(event="propertyChange")]
        public function get item17():WorldCupShopSlot
        {
            return (this._1178662791item17);
        }

        [Bindable(event="propertyChange")]
        public function get item18():WorldCupShopSlot
        {
            return (this._1178662790item18);
        }

        [Bindable(event="propertyChange")]
        public function get item19():WorldCupShopSlot
        {
            return (this._1178662789item19);
        }

        private function getWorldCupGoldPoint():void
        {
            _core.remote.call("getWorldCupGoldPoint", new Responder(OnGetWorldCupGoldPoint));
        }

        public function set lab3_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2005849031lab3_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2005849031lab3_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab3_A_0", _local_2, _arg_1));
            };
        }

        private function initGoldScheduleCanvas():*
        {
            var _local_2:*;
            var _local_3:Date;
            var _local_4:String;
            var _local_1:Number = 0;
            this["imgg_2_1"].visible = false;
            this["imgg_2_2"].visible = false;
            this["labg_2_1"].visible = false;
            this["labg_2_2"].visible = false;
            this["btng_2"].visible = false;
            this["labg_2"].visible = false;
            this["imgg_1_1"].visible = false;
            this["imgg_1_2"].visible = false;
            this["labg_1_1"].visible = false;
            this["labg_1_2"].visible = false;
            this["btng_1"].visible = false;
            this["labg_1"].visible = false;
            this["title1"].visible = false;
            _showObject = {};
            for (_local_2 in GoldSchedule)
            {
                _local_1++;
                _showObject[_local_1] = GoldSchedule[_local_2];
                if (Math.ceil((_local_1 / 2)) == _defaultIndex)
                {
                    if ((_local_1 % 2) != 0)
                    {
                        this["imgg_1_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][0]["team"]].icon2));
                        this["imgg_1_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][1]["team"]].icon2));
                        _local_3 = new Date(GoldSchedule[_local_2][0]["time"]);
                        _local_4 = ((((((((((_local_3.fullYear + "/") + (_local_3.month + 1)) + "/") + _local_3.date) + " ") + _local_3.hours) + ":") + _local_3.minutes) + ":") + _local_3.seconds);
                        _local_4 = (Language.WORLD_CUP_PANEL[30].replace("{time}", _local_4) + "\n");
                        this["labg_1"].text = _local_4;
                        this["labg_1_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][0]["team"]].icon3));
                        this["labg_1_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][1]["team"]].icon3));
                        this["imgg_1_1"].visible = true;
                        this["imgg_1_2"].visible = true;
                        this["labg_1_1"].visible = true;
                        this["labg_1_2"].visible = true;
                        this["btng_1"].visible = true;
                        this["labg_1"].visible = true;
                        this["title1"].source = ResManager.getIconUrl(parseInt(jieduanImage[GoldSchedule[_local_2][0]["state"]]));
                        this["title1"].visible = true;
                    }
                    else
                    {
                        this["imgg_2_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][0]["team"]].icon2));
                        this["imgg_2_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][1]["team"]].icon2));
                        _local_3 = new Date(GoldSchedule[_local_2][0]["time"]);
                        _local_4 = ((((((((((_local_3.fullYear + "/") + (_local_3.month + 1)) + "/") + _local_3.date) + " ") + _local_3.hours) + ":") + _local_3.minutes) + ":") + _local_3.seconds);
                        _local_4 = (Language.WORLD_CUP_PANEL[30].replace("{time}", _local_4) + "\n");
                        this["labg_2_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][0]["team"]].icon3));
                        this["labg_2_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_2][1]["team"]].icon3));
                        this["labg_2"].text = _local_4;
                        this["imgg_2_1"].visible = true;
                        this["imgg_2_2"].visible = true;
                        this["labg_2_1"].visible = true;
                        this["labg_2_2"].visible = true;
                        this["btng_2"].visible = true;
                        this["labg_2"].visible = true;
                    };
                };
            };
            _defaultMaxIndex = Math.ceil((_local_1 / 2));
            txtPageIndicator.text = ((_defaultIndex + "/") + _defaultMaxIndex);
        }

        public function __btn6_C_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("C", 6);
        }

        [Bindable(event="propertyChange")]
        public function get lab2_B_0():Label
        {
            return (this._2006771591lab2_B_0);
        }

        [Bindable(event="propertyChange")]
        public function get img6_H_0():Image
        {
            return (this._733280115img6_H_0);
        }

        [Bindable(event="propertyChange")]
        public function get item14():WorldCupShopSlot
        {
            return (this._1178662794item14);
        }

        private function _WorldCupPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn12 = _local_1;
            _local_1.dataField = "odds";
            _local_1.width = 70;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn12", _WorldCupPanel_DataGridColumn12);
            return (_local_1);
        }

        private function gotUpOrBack(_arg_1:Boolean):*
        {
            var _local_3:*;
            var _local_4:Date;
            var _local_5:String;
            if (_arg_1)
            {
                if (_defaultIndex >= _defaultMaxIndex)
                {
                    return;
                };
                _defaultIndex++;
            }
            else
            {
                if (_defaultIndex <= 1)
                {
                    return;
                };
                _defaultIndex--;
            };
            this["imgg_2_1"].visible = false;
            this["imgg_2_2"].visible = false;
            this["labg_2_1"].visible = false;
            this["labg_2_2"].visible = false;
            this["btng_2"].visible = false;
            this["labg_2"].visible = false;
            this["imgg_1_1"].visible = false;
            this["imgg_1_2"].visible = false;
            this["labg_1_1"].visible = false;
            this["labg_1_2"].visible = false;
            this["btng_1"].visible = false;
            this["labg_1"].visible = false;
            this["title1"].visible = false;
            var _local_2:Number = 0;
            for (_local_3 in GoldSchedule)
            {
                _local_2++;
                if (Math.ceil((_local_2 / 2)) == _defaultIndex)
                {
                    if ((_local_2 % 2) != 0)
                    {
                        this["imgg_1_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][0]["team"]].icon2));
                        this["imgg_1_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][1]["team"]].icon2));
                        _local_4 = new Date(GoldSchedule[_local_3][0]["time"]);
                        _local_5 = ((((((((((_local_4.fullYear + "/") + (_local_4.month + 1)) + "/") + _local_4.date) + " ") + _local_4.hours) + ":") + _local_4.minutes) + ":") + _local_4.seconds);
                        _local_5 = (Language.WORLD_CUP_PANEL[30].replace("{time}", _local_5) + "\n");
                        this["labg_1"].text = _local_5;
                        this["labg_1_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][0]["team"]].icon3));
                        this["labg_1_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][1]["team"]].icon3));
                        this["imgg_1_1"].visible = true;
                        this["imgg_1_2"].visible = true;
                        this["labg_1_1"].visible = true;
                        this["labg_1_2"].visible = true;
                        this["btng_1"].visible = true;
                        this["labg_1"].visible = true;
                        this["title1"].source = ResManager.getIconUrl(parseInt(jieduanImage[GoldSchedule[_local_3][0]["state"]]));
                        this["title1"].visible = true;
                    }
                    else
                    {
                        this["imgg_2_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][0]["team"]].icon2));
                        this["imgg_2_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][1]["team"]].icon2));
                        _local_4 = new Date(GoldSchedule[_local_3][0]["time"]);
                        _local_5 = ((((((((((_local_4.fullYear + "/") + (_local_4.month + 1)) + "/") + _local_4.date) + " ") + _local_4.hours) + ":") + _local_4.minutes) + ":") + _local_4.seconds);
                        _local_5 = (Language.WORLD_CUP_PANEL[30].replace("{time}", _local_5) + "\n");
                        this["labg_2"].text = _local_5;
                        this["labg_2_1"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][0]["team"]].icon3));
                        this["labg_2_2"].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[GoldSchedule[_local_3][1]["team"]].icon3));
                        this["labg_2"].text = _local_5;
                        this["imgg_2_1"].visible = true;
                        this["imgg_2_2"].visible = true;
                        this["labg_2_1"].visible = true;
                        this["labg_2_2"].visible = true;
                        this["btng_2"].visible = true;
                        this["labg_2"].visible = true;
                    };
                };
            };
            _defaultMaxIndex = Math.ceil((_local_2 / 2));
            txtPageIndicator.text = ((_defaultIndex + "/") + _defaultMaxIndex);
        }

        public function __img5_D_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 5, "D");
        }

        [Bindable(event="propertyChange")]
        public function get item24():WorldCupShopSlot
        {
            return (this._1178662763item24);
        }

        [Bindable(event="propertyChange")]
        public function get item21():WorldCupShopSlot
        {
            return (this._1178662766item21);
        }

        public function set img7_G_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732357555img7_G_0;
            if (_local_2 !== _arg_1)
            {
                this._732357555img7_G_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_G_0", _local_2, _arg_1));
            };
        }

        public function set img7_G_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732357554img7_G_1;
            if (_local_2 !== _arg_1)
            {
                this._732357554img7_G_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_G_1", _local_2, _arg_1));
            };
        }

        public function onUpdateShopAmount():void
        {
            if (initialized)
            {
                bangSele(6);
            };
        }

        [Bindable(event="propertyChange")]
        public function get item26():WorldCupShopSlot
        {
            return (this._1178662761item26);
        }

        [Bindable(event="propertyChange")]
        public function get item27():WorldCupShopSlot
        {
            return (this._1178662760item27);
        }

        [Bindable(event="propertyChange")]
        public function get item20():WorldCupShopSlot
        {
            return (this._1178662767item20);
        }

        [Bindable(event="propertyChange")]
        public function get item22():WorldCupShopSlot
        {
            return (this._1178662765item22);
        }

        [Bindable(event="propertyChange")]
        public function get item23():WorldCupShopSlot
        {
            return (this._1178662764item23);
        }

        [Bindable(event="propertyChange")]
        public function get img7_F_1():Image
        {
            return (this._732358515img7_F_1);
        }

        public function set img2_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._736980926img2_A_0;
            if (_local_2 !== _arg_1)
            {
                this._736980926img2_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2_A_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item28():WorldCupShopSlot
        {
            return (this._1178662759item28);
        }

        [Bindable(event="propertyChange")]
        public function get item29():WorldCupShopSlot
        {
            return (this._1178662758item29);
        }

        private function turnPage(_arg_1:Boolean, _arg_2:Number):void
        {
            if (_arg_1)
            {
                if (((_arg_2 == 1) && (_shopMaxIndex <= _shopIndex)))
                {
                    return;
                };
                if (((_arg_2 == 2) && (_shopGoldMaxIndex <= _shopGoldIndex)))
                {
                    return;
                };
                if (_arg_2 == 1)
                {
                    _shopIndex++;
                    goToShopPage(_shopIndex, _shopData, 1);
                    txtPageIndicatorShop.text = ((_shopIndex + "/") + _shopMaxIndex);
                }
                else
                {
                    _shopGoldIndex++;
                    goToShopPage(_shopGoldIndex, _shopDataGold, 2);
                    txtPageIndicatorShopGold.text = ((_shopGoldIndex + "/") + _shopGoldMaxIndex);
                };
            }
            else
            {
                if (((_arg_2 == 1) && (_shopIndex <= 1)))
                {
                    return;
                };
                if (((_arg_2 == 2) && (_shopGoldIndex <= 1)))
                {
                    return;
                };
                if (_arg_2 == 1)
                {
                    _shopIndex--;
                    goToShopPage(_shopIndex, _shopData, 1);
                    txtPageIndicatorShop.text = ((_shopIndex + "/") + _shopMaxIndex);
                }
                else
                {
                    _shopGoldIndex--;
                    goToShopPage(_shopGoldIndex, _shopDataGold, 2);
                    txtPageIndicatorShopGold.text = ((_shopGoldIndex + "/") + _shopGoldMaxIndex);
                };
            };
        }

        public function __img4_A_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 4, "A");
        }

        public function set btnLastPageShopGold(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1917162409btnLastPageShopGold;
            if (_local_2 !== _arg_1)
            {
                this._1917162409btnLastPageShopGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLastPageShopGold", _local_2, _arg_1));
            };
        }

        public function ___WorldCupPanel_Button1_click(_arg_1:MouseEvent):void
        {
            tradeAward();
        }

        [Bindable(event="propertyChange")]
        public function get item15():WorldCupShopSlot
        {
            return (this._1178662793item15);
        }

        [Bindable(event="propertyChange")]
        public function get img7_F_0():Image
        {
            return (this._732358516img7_F_0);
        }

        public function __btnLastPageShop_buttonDown(_arg_1:FlexEvent):void
        {
            turnPage(false, 1);
        }

        [Bindable(event="propertyChange")]
        public function get img1_A_0():Image
        {
            return (this._737904447img1_A_0);
        }

        [Bindable(event="propertyChange")]
        public function get item25():WorldCupShopSlot
        {
            return (this._1178662762item25);
        }

        public function set txtPageIndicatorShopGold(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._415230022txtPageIndicatorShopGold;
            if (_local_2 !== _arg_1)
            {
                this._415230022txtPageIndicatorShopGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPageIndicatorShopGold", _local_2, _arg_1));
            };
        }

        private function _WorldCupPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_WorldCupPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn0.label = _arg_1;
            }, "bangBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn1.label = _arg_1;
            }, "bangBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn2.label = _arg_1;
            }, "bangBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn3.label = _arg_1;
            }, "bangBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn4.label = _arg_1;
            }, "bangBtn4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn5.label = _arg_1;
            }, "bangBtn5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bangBtn6.label = _arg_1;
            }, "bangBtn6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton1.label = _arg_1;
            }, "_WorldCupPanel_DelayButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000471")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image1.source = _arg_1;
            }, "_WorldCupPanel_Image1.source");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                introCon.htmlText = _arg_1;
            }, "introCon.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton2.label = _arg_1;
            }, "_WorldCupPanel_DelayButton2.label");
            result[11] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000397")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image2.source = _arg_1;
            }, "_WorldCupPanel_Image2.source");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000398")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image3.source = _arg_1;
            }, "_WorldCupPanel_Image3.source");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000431")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image4.source = _arg_1;
            }, "_WorldCupPanel_Image4.source");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_A.label = _arg_1;
            }, "btn7_A.label");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_B.label = _arg_1;
            }, "btn7_B.label");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_C.label = _arg_1;
            }, "btn7_C.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_D.label = _arg_1;
            }, "btn7_D.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_E.label = _arg_1;
            }, "btn7_E.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_F.label = _arg_1;
            }, "btn7_F.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_G.label = _arg_1;
            }, "btn7_G.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn7_H.label = _arg_1;
            }, "btn7_H.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn6_A.label = _arg_1;
            }, "btn6_A.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn6_B.label = _arg_1;
            }, "btn6_B.label");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn6_C.label = _arg_1;
            }, "btn6_C.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn6_D.label = _arg_1;
            }, "btn6_D.label");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn5_A.label = _arg_1;
            }, "btn5_A.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn5_B.label = _arg_1;
            }, "btn5_B.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn4_A.label = _arg_1;
            }, "btn4_A.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btn2_A.label = _arg_1;
            }, "btn2_A.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_LinkButton1.label = _arg_1;
            }, "_WorldCupPanel_LinkButton1.label");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn1.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn1.headerText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn2.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn2.headerText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn3.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn3.headerText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn4.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn4.headerText");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn5.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn5.headerText");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn6.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn6.headerText");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label51.text = _arg_1;
            }, "_WorldCupPanel_Label51.text");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _myTeamSc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label52.text = _arg_1;
            }, "_WorldCupPanel_Label52.text");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label53.text = _arg_1;
            }, "_WorldCupPanel_Label53.text");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label54.text = _arg_1;
            }, "_WorldCupPanel_Label54.text");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _myOutSc;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label55.text = _arg_1;
            }, "_WorldCupPanel_Label55.text");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.WORLD_CUP_PANEL[37] + "") + _core.player.worldCupPoint);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label56.text = _arg_1;
            }, "_WorldCupPanel_Label56.text");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton19.label = _arg_1;
            }, "_WorldCupPanel_DelayButton19.label");
            result[44] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000471")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image39.source = _arg_1;
            }, "_WorldCupPanel_Image39.source");
            result[45] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000470")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image40.source = _arg_1;
            }, "_WorldCupPanel_Image40.source");
            result[46] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txtPageIndicator.filters = _arg_1;
            }, "txtPageIndicator.filters");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton20.label = _arg_1;
            }, "_WorldCupPanel_DelayButton20.label");
            result[48] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(parseInt("4130220000471")));
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image50.source = _arg_1;
            }, "_WorldCupPanel_Image50.source");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn7.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn7.headerText");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn8.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn8.headerText");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn9.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn9.headerText");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn10.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn10.headerText");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn11.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn11.headerText");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[54];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn12.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn12.headerText");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn13.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn13.headerText");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DataGridColumn14.headerText = _arg_1;
            }, "_WorldCupPanel_DataGridColumn14.headerText");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((Language.WORLD_CUP_PANEL[47] + "") + _core.player.worldCupGoldPoint);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label59.text = _arg_1;
            }, "_WorldCupPanel_Label59.text");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label60.text = _arg_1;
            }, "_WorldCupPanel_Label60.text");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton21.label = _arg_1;
            }, "_WorldCupPanel_DelayButton21.label");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton22.label = _arg_1;
            }, "_WorldCupPanel_DelayButton22.label");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_DelayButton23.label = _arg_1;
            }, "_WorldCupPanel_DelayButton23.label");
            result[62] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txtPageIndicatorShopGold.filters = _arg_1;
            }, "txtPageIndicatorShopGold.filters");
            result[63] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_WORLD_CUP_GOLD);
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image51.source = _arg_1;
            }, "_WorldCupPanel_Image51.source");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.worldCupGoldPoint;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label61.text = _arg_1;
            }, "_WorldCupPanel_Label61.text");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                endTime.text = _arg_1;
            }, "endTime.text");
            result[66] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                endTime.filters = _arg_1;
            }, "endTime.filters");
            result[67] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2]);
            }, function (_arg_1:Array):void
            {
                txtPageIndicatorShop.filters = _arg_1;
            }, "txtPageIndicatorShop.filters");
            result[68] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.ICON_WORLD_CUP);
            }, function (_arg_1:Object):void
            {
                _WorldCupPanel_Image52.source = _arg_1;
            }, "_WorldCupPanel_Image52.source");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = _core.player.worldCupPoint;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _WorldCupPanel_Label63.text = _arg_1;
            }, "_WorldCupPanel_Label63.text");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.WORLD_CUP_PANEL[56];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                endTime0.text = _arg_1;
            }, "endTime0.text");
            result[71] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                endTime0.filters = _arg_1;
            }, "endTime0.filters");
            result[72] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_G_0():Label
        {
            return (this._2002149181lab7_G_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_G_1():Label
        {
            return (this._2002149180lab7_G_1);
        }

        public function set yLab3_A(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012835743yLab3_A;
            if (_local_2 !== _arg_1)
            {
                this._2012835743yLab3_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab3_A", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get item16():WorldCupShopSlot
        {
            return (this._1178662792item16);
        }

        public function __bangBtn3_click(_arg_1:MouseEvent):void
        {
            bangSele(3);
        }

        [Bindable(event="propertyChange")]
        public function get title1():Image
        {
            return (this._873453351title1);
        }

        public function set item10(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662798item10;
            if (_local_2 !== _arg_1)
            {
                this._1178662798item10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item10", _local_2, _arg_1));
            };
        }

        public function set item11(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662797item11;
            if (_local_2 !== _arg_1)
            {
                this._1178662797item11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item11", _local_2, _arg_1));
            };
        }

        public function ___WorldCupPanel_DelayButton22_click(_arg_1:MouseEvent):void
        {
            tradeAward();
        }

        public function set item13(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662795item13;
            if (_local_2 !== _arg_1)
            {
                this._1178662795item13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item13", _local_2, _arg_1));
            };
        }

        public function initWorldCupPanel():*
        {
            initView();
            visible = true;
        }

        public function set item17(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662791item17;
            if (_local_2 !== _arg_1)
            {
                this._1178662791item17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item17", _local_2, _arg_1));
            };
        }

        public function set item14(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662794item14;
            if (_local_2 !== _arg_1)
            {
                this._1178662794item14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item14", _local_2, _arg_1));
            };
        }

        public function set item18(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662790item18;
            if (_local_2 !== _arg_1)
            {
                this._1178662790item18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item18", _local_2, _arg_1));
            };
        }

        public function set item15(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662793item15;
            if (_local_2 !== _arg_1)
            {
                this._1178662793item15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item15", _local_2, _arg_1));
            };
        }

        public function set item19(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662789item19;
            if (_local_2 !== _arg_1)
            {
                this._1178662789item19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item19", _local_2, _arg_1));
            };
        }

        public function __img7_A_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "A");
        }

        public function set lab2_B_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2006771591lab2_B_0;
            if (_local_2 !== _arg_1)
            {
                this._2006771591lab2_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab2_B_0", _local_2, _arg_1));
            };
        }

        public function set item16(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662792item16;
            if (_local_2 !== _arg_1)
            {
                this._1178662792item16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get yLab1_A():Label
        {
            return (this._2012837665yLab1_A);
        }

        public function __btn7_A_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("A", 7);
        }

        [Bindable(event="propertyChange")]
        public function get img7_D_0():Image
        {
            return (this._732360438img7_D_0);
        }

        [Bindable(event="propertyChange")]
        public function get img6_F_0():Image
        {
            return (this._733282037img6_F_0);
        }

        public function OnGetWorldCupGoldPoint(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1)
                {
                    _worldCupFlag = _arg_1;
                    _core.player.worldCupGoldPoint = Number(_arg_1.sc_gold);
                }
                else
                {
                    _worldCupFlag = {};
                };
                initCharAugurGoldInfoCanvas();
            };
        }

        private function showChangePanel():void
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_WORLD_CUP_CHANGE);
            if (_local_1)
            {
                _local_1.initWorldCupChangePanel();
            };
        }

        public function set lab7_H_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002148219lab7_H_1;
            if (_local_2 !== _arg_1)
            {
                this._2002148219lab7_H_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_H_1", _local_2, _arg_1));
            };
        }

        public function set item12(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662796item12;
            if (_local_2 !== _arg_1)
            {
                this._1178662796item12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item12", _local_2, _arg_1));
            };
        }

        private function _WorldCupPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn10 = _local_1;
            _local_1.dataField = "trueCity";
            _local_1.width = 105;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn10", _WorldCupPanel_DataGridColumn10);
            return (_local_1);
        }

        public function set img6_H_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733280115img6_H_0;
            if (_local_2 !== _arg_1)
            {
                this._733280115img6_H_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_H_0", _local_2, _arg_1));
            };
        }

        private function initShopCanvas():void
        {
            _initShopCanvas();
        }

        public function set img7_F_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732358516img7_F_0;
            if (_local_2 !== _arg_1)
            {
                this._732358516img7_F_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_F_0", _local_2, _arg_1));
            };
        }

        public function __btnLastPage_buttonDown(_arg_1:FlexEvent):void
        {
            gotUpOrBack(false);
        }

        public function set item20(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662767item20;
            if (_local_2 !== _arg_1)
            {
                this._1178662767item20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item20", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_D_1():Image
        {
            return (this._732360437img7_D_1);
        }

        public function set item21(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662766item21;
            if (_local_2 !== _arg_1)
            {
                this._1178662766item21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item21", _local_2, _arg_1));
            };
        }

        public function set item22(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662765item22;
            if (_local_2 !== _arg_1)
            {
                this._1178662765item22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item22", _local_2, _arg_1));
            };
        }

        public function set item23(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662764item23;
            if (_local_2 !== _arg_1)
            {
                this._1178662764item23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item23", _local_2, _arg_1));
            };
        }

        public function set img7_F_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732358515img7_F_1;
            if (_local_2 !== _arg_1)
            {
                this._732358515img7_F_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_F_1", _local_2, _arg_1));
            };
        }

        public function set item25(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662762item25;
            if (_local_2 !== _arg_1)
            {
                this._1178662762item25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item25", _local_2, _arg_1));
            };
        }

        public function set item26(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662761item26;
            if (_local_2 !== _arg_1)
            {
                this._1178662761item26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item26", _local_2, _arg_1));
            };
        }

        public function set item27(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662760item27;
            if (_local_2 !== _arg_1)
            {
                this._1178662760item27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item27", _local_2, _arg_1));
            };
        }

        public function set item24(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662763item24;
            if (_local_2 !== _arg_1)
            {
                this._1178662763item24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item24", _local_2, _arg_1));
            };
        }

        public function set item28(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662759item28;
            if (_local_2 !== _arg_1)
            {
                this._1178662759item28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item28", _local_2, _arg_1));
            };
        }

        public function __img7_D_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "D");
        }

        public function set lab7_H_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002148220lab7_H_0;
            if (_local_2 !== _arg_1)
            {
                this._2002148220lab7_H_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_H_0", _local_2, _arg_1));
            };
        }

        public function __img6_F_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "F");
        }

        [Bindable(event="propertyChange")]
        public function get lab7_E_0():Label
        {
            return (this._2002151103lab7_E_0);
        }

        [Bindable(event="propertyChange")]
        public function get btnNextPageShopGold():Button
        {
            return (this._564183348btnNextPageShopGold);
        }

        public function __btnNextPageShop_buttonDown(_arg_1:FlexEvent):void
        {
            turnPage(true, 1);
        }

        public function __btn7_F_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("F", 7);
        }

        public function set item29(_arg_1:WorldCupShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1178662758item29;
            if (_local_2 !== _arg_1)
            {
                this._1178662758item29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item29", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab6_G_0():Label
        {
            return (this._2003072702lab6_G_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_E_1():Label
        {
            return (this._2002151102lab7_E_1);
        }

        [Bindable(event="propertyChange")]
        public function get xz1():WorldCupCanvas
        {
            return (this._119151xz1);
        }

        public function __img5_C_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 5, "C");
        }

        [Bindable(event="propertyChange")]
        public function get xz3():WorldCupCanvas
        {
            return (this._119153xz3);
        }

        [Bindable(event="propertyChange")]
        public function get xz4():WorldCupCanvas
        {
            return (this._119154xz4);
        }

        [Bindable(event="propertyChange")]
        public function get xz5():WorldCupCanvas
        {
            return (this._119155xz5);
        }

        [Bindable(event="propertyChange")]
        public function get xz6():WorldCupCanvas
        {
            return (this._119156xz6);
        }

        [Bindable(event="propertyChange")]
        public function get xz7():WorldCupCanvas
        {
            return (this._119157xz7);
        }

        [Bindable(event="propertyChange")]
        public function get xz8():WorldCupCanvas
        {
            return (this._119158xz8);
        }

        public function set lab2_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2006772552lab2_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2006772552lab2_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab2_A_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xz2():WorldCupCanvas
        {
            return (this._119152xz2);
        }

        public function set btnLastPage(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._320271553btnLastPage;
            if (_local_2 !== _arg_1)
            {
                this._320271553btnLastPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLastPage", _local_2, _arg_1));
            };
        }

        public function set img1_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._737904447img1_A_0;
            if (_local_2 !== _arg_1)
            {
                this._737904447img1_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img1_A_0", _local_2, _arg_1));
            };
        }

        public function set lab7_G_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002149181lab7_G_0;
            if (_local_2 !== _arg_1)
            {
                this._2002149181lab7_G_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_G_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_B_0():Image
        {
            return (this._732362360img7_B_0);
        }

        [Bindable(event="propertyChange")]
        public function get img6_D_0():Image
        {
            return (this._733283959img6_D_0);
        }

        public function set img7_E_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732359477img7_E_0;
            if (_local_2 !== _arg_1)
            {
                this._732359477img7_E_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_E_0", _local_2, _arg_1));
            };
        }

        public function set lab7_G_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002149180lab7_G_1;
            if (_local_2 !== _arg_1)
            {
                this._2002149180lab7_G_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_G_1", _local_2, _arg_1));
            };
        }

        public function set img6_G_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733281076img6_G_0;
            if (_local_2 !== _arg_1)
            {
                this._733281076img6_G_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_G_0", _local_2, _arg_1));
            };
        }

        public function set img7_E_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732359476img7_E_1;
            if (_local_2 !== _arg_1)
            {
                this._732359476img7_E_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_E_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_B_1():Image
        {
            return (this._732362359img7_B_1);
        }

        public function ___WorldCupPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            worldCupTimeAward();
        }

        public function set title1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._873453351title1;
            if (_local_2 !== _arg_1)
            {
                this._873453351title1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title1", _local_2, _arg_1));
            };
        }

        private function _WorldCupPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn9 = _local_1;
            _local_1.dataField = "myCity";
            _local_1.width = 105;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn9", _WorldCupPanel_DataGridColumn9);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_C_0():Label
        {
            return (this._2002153025lab7_C_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab6_E_0():Label
        {
            return (this._2003074624lab6_E_0);
        }

        public function set yLab1_A(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012837665yLab1_A;
            if (_local_2 !== _arg_1)
            {
                this._2012837665yLab1_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab1_A", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab7_C_1():Label
        {
            return (this._2002153024lab7_C_1);
        }

        private function update32thCanvas():void
        {
            var _local_1:*;
            var _local_2:String;
            var _local_3:String;
            var _local_4:*;
            var _local_5:*;
            var _local_6:*;
            if (((WORLD_CUP_GROUP) && (WORLD_CUP_GROUP[8])))
            {
                for (_local_1 in WORLD_CUP_GROUP[8])
                {
                    if (WORLD_CUP_GROUP[8][_local_1])
                    {
                        _local_2 = "xz1";
                        if (_groupCanvasId[_local_1])
                        {
                            _local_2 = _groupCanvasId[_local_1];
                        }
                        else
                        {
                            continue;
                        };
                        this[_local_2].group = _local_1;
                        this[_local_2].teamInfo = WORLD_CUP_GROUP[8][_local_1];
                        this[_local_2].teamChar = ((((_charData) && (_charData[8])) && (_charData[8][_local_1])) ? _charData[8][_local_1] : {});
                        _local_3 = "|";
                        if (WORLD_CUP_GROUP[7])
                        {
                            _local_4 = WORLD_CUP_GROUP[8][_local_1].split("|");
                            _local_5 = 0;
                            while (_local_5 < _local_4.length)
                            {
                                if (GamePredef.WORLD_CUP_INFO[_local_4[_local_5]])
                                {
                                    for (_local_6 in WORLD_CUP_GROUP[7])
                                    {
                                        if (WORLD_CUP_GROUP[7][_local_6].indexOf((("|" + _local_4[_local_5]) + "|")) >= 0)
                                        {
                                            _local_3 = ((_local_3 + _local_4[_local_5]) + "|");
                                        };
                                    };
                                };
                                _local_5++;
                            };
                        };
                        this[_local_2].teamRealy = ((_local_3 != "|") ? _local_3 : null);
                        this[_local_2].updateInfo();
                    };
                };
            };
        }

        private function getWorldCupFreePoint():void
        {
            _core.remote.call("getWorldCupFreePoint", null);
        }

        [Bindable(event="propertyChange")]
        public function get imgg_1_1():Image
        {
            return (this._688049688imgg_1_1);
        }

        [Bindable(event="propertyChange")]
        public function get imgg_1_2():Image
        {
            return (this._688049687imgg_1_2);
        }

        public function __img7_H_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "H");
        }

        public function set lab7_F_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002150142lab7_F_0;
            if (_local_2 !== _arg_1)
            {
                this._2002150142lab7_F_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_F_0", _local_2, _arg_1));
            };
        }

        public function __btn6_A_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("A", 6);
        }

        public function set lab6_H_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003071741lab6_H_0;
            if (_local_2 !== _arg_1)
            {
                this._2003071741lab6_H_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_H_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img6_B_0():Image
        {
            return (this._733285881img6_B_0);
        }

        public function set lab7_F_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002150141lab7_F_1;
            if (_local_2 !== _arg_1)
            {
                this._2002150141lab7_F_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_F_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img5_D_0():Image
        {
            return (this._734207480img5_D_0);
        }

        public function set img7_D_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732360438img7_D_0;
            if (_local_2 !== _arg_1)
            {
                this._732360438img7_D_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_D_0", _local_2, _arg_1));
            };
        }

        public function set img6_F_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733282037img6_F_0;
            if (_local_2 !== _arg_1)
            {
                this._733282037img6_F_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_F_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labg_2_2():Image
        {
            return (this._1957840352labg_2_2);
        }

        public function set img7_D_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732360437img7_D_1;
            if (_local_2 !== _arg_1)
            {
                this._732360437img7_D_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_D_1", _local_2, _arg_1));
            };
        }

        public function __img2_B_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 2, "B");
        }

        private function _WorldCupPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.WORLD_CUP_PANEL[0];
            _local_1 = Language.WORLD_CUP_PANEL[7];
            _local_1 = Language.WORLD_CUP_PANEL[8];
            _local_1 = Language.WORLD_CUP_PANEL[9];
            _local_1 = Language.WORLD_CUP_PANEL[10];
            _local_1 = Language.WORLD_CUP_PANEL[35];
            _local_1 = Language.WORLD_CUP_PANEL[36];
            _local_1 = Language.WORLD_CUP_PANEL[53];
            _local_1 = Language.WORLD_CUP_PANEL[50];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000471"));
            _local_1 = Language.WORLD_CUP_PANEL[21];
            _local_1 = Language.WORLD_CUP_PANEL[50];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000397"));
            _local_1 = ResManager.getIconUrl(parseInt("4130220000398"));
            _local_1 = ResManager.getIconUrl(parseInt("4130220000431"));
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[11];
            _local_1 = Language.WORLD_CUP_PANEL[28];
            _local_1 = Language.WORLD_CUP_PANEL[15];
            _local_1 = Language.WORLD_CUP_PANEL[16];
            _local_1 = Language.WORLD_CUP_PANEL[17];
            _local_1 = Language.WORLD_CUP_PANEL[18];
            _local_1 = Language.WORLD_CUP_PANEL[19];
            _local_1 = Language.WORLD_CUP_PANEL[20];
            _local_1 = Language.WORLD_CUP_PANEL[22];
            _local_1 = _myTeamSc;
            _local_1 = Language.WORLD_CUP_PANEL[22];
            _local_1 = Language.WORLD_CUP_PANEL[23];
            _local_1 = _myOutSc;
            _local_1 = ((Language.WORLD_CUP_PANEL[37] + "") + _core.player.worldCupPoint);
            _local_1 = Language.WORLD_CUP_PANEL[38];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000471"));
            _local_1 = ResManager.getIconUrl(parseInt("4130220000470"));
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = Language.WORLD_CUP_PANEL[39];
            _local_1 = ResManager.getIconUrl(parseInt("4130220000471"));
            _local_1 = Language.WORLD_CUP_PANEL[40];
            _local_1 = Language.WORLD_CUP_PANEL[41];
            _local_1 = Language.WORLD_CUP_PANEL[42];
            _local_1 = Language.WORLD_CUP_PANEL[43];
            _local_1 = Language.WORLD_CUP_PANEL[44];
            _local_1 = Language.WORLD_CUP_PANEL[54];
            _local_1 = Language.WORLD_CUP_PANEL[45];
            _local_1 = Language.WORLD_CUP_PANEL[46];
            _local_1 = ((Language.WORLD_CUP_PANEL[47] + "") + _core.player.worldCupGoldPoint);
            _local_1 = Language.WORLD_CUP_PANEL[48];
            _local_1 = Language.WORLD_CUP_PANEL[49];
            _local_1 = Language.WORLD_CUP_PANEL[50];
            _local_1 = Language.WORLD_CUP_PANEL[61];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = ResManager.ICON_WORLD_CUP_GOLD;
            _local_1 = _core.player.worldCupGoldPoint;
            _local_1 = Language.WORLD_CUP_PANEL[55];
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1 = ResManager.ICON_WORLD_CUP;
            _local_1 = _core.player.worldCupPoint;
            _local_1 = Language.WORLD_CUP_PANEL[56];
            _local_1 = [GamePredef.FILTER_TITLE];
        }

        public function onGetWorldCupRank(_arg_1:Array, _arg_2:String):void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:ArrayCollection;
            var _local_7:*;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Number;
            var _local_11:Number;
            var _local_12:int;
            var _local_13:*;
            var _local_14:String;
            if (initialized)
            {
                _rankVersion = _arg_2;
                _local_3 = 0;
                _local_4 = 0;
                _local_5 = 0;
                _local_6 = new ArrayCollection();
                _local_7 = 0;
                while (_local_7 < _arg_1.length)
                {
                    _local_8 = {};
                    _local_9 = _arg_1[_local_7].ci;
                    _local_5++;
                    if (Number(_arg_1[_local_7].t) != _local_4)
                    {
                        _local_4 = Number(_arg_1[_local_7].t);
                        _local_3 = _local_5;
                    };
                    _local_8["rank"] = _local_3;
                    _local_8["name"] = _arg_1[_local_7]["n"];
                    _local_8["sid"] = ToolKit.getServerName(_arg_1[_local_7]["sid"]);
                    _local_10 = 0;
                    _local_11 = 0;
                    _local_12 = 1;
                    for (_local_13 in _local_9)
                    {
                        if (_local_13 != "t")
                        {
                            if (String(_local_13) == "8")
                            {
                                _local_10 = _local_9[_local_13];
                            }
                            else
                            {
                                if (String(_local_13) == "3")
                                {
                                    if (((_local_9[_local_13]) && (ToolKit.isBigThan(_local_9[_local_13], 0))))
                                    {
                                        _local_12 = 3;
                                    };
                                    _local_12 = 2;
                                };
                                _local_11 = ToolKit.add(_local_11, _local_9[_local_13]);
                            };
                        };
                    };
                    _local_8["osc"] = _local_11;
                    _local_8["tsc"] = _local_10;
                    _local_14 = "";
                    if (_local_12 == 2)
                    {
                        _local_14 = Language.WORLD_CUP_PANEL[32];
                    }
                    else
                    {
                        if (_local_12 == 3)
                        {
                            _local_14 = Language.WORLD_CUP_PANEL[31];
                        };
                    };
                    _local_8["g"] = _local_14;
                    _local_6.addItem(_local_8);
                    _local_7++;
                };
                rankGrid.dataProvider = _local_6;
            };
        }

        private function _WorldCupPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn7 = _local_1;
            _local_1.dataField = "vs";
            _local_1.width = 190;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn7", _WorldCupPanel_DataGridColumn7);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get labg_2_1():Image
        {
            return (this._1957840353labg_2_1);
        }

        public function __img7_C_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "C");
        }

        [Bindable(event="propertyChange")]
        public function get lab7_A_0():Label
        {
            return (this._2002154947lab7_A_0);
        }

        public function __img6_E_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "E");
        }

        [Bindable(event="propertyChange")]
        public function get endTime():Label
        {
            return (this._1607243192endTime);
        }

        private function replaceAll(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            return (_arg_1.split(_arg_2).join(_arg_3));
        }

        public function __bangBtn1_click(_arg_1:MouseEvent):void
        {
            bangSele(1);
        }

        public function ___WorldCupPanel_DelayButton20_click(_arg_1:MouseEvent):void
        {
            bangSele(5);
        }

        [Bindable(event="propertyChange")]
        public function get lab6_C_0():Label
        {
            return (this._2003076546lab6_C_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_A_1():Label
        {
            return (this._2002154946lab7_A_1);
        }

        public function __img5_B_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 5, "B");
        }

        public function set lab1_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2007696073lab1_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2007696073lab1_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab1_A_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btng_1():Button
        {
            return (this._1378803075btng_1);
        }

        public function set lab7_E_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002151103lab7_E_0;
            if (_local_2 !== _arg_1)
            {
                this._2002151103lab7_E_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_E_0", _local_2, _arg_1));
            };
        }

        public function set lab6_G_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003072702lab6_G_0;
            if (_local_2 !== _arg_1)
            {
                this._2003072702lab6_G_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_G_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btng_2():Button
        {
            return (this._1378803074btng_2);
        }

        [Bindable(event="propertyChange")]
        public function get img5_B_0():Image
        {
            return (this._734209402img5_B_0);
        }

        public function set lab7_E_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002151102lab7_E_1;
            if (_local_2 !== _arg_1)
            {
                this._2002151102lab7_E_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_E_1", _local_2, _arg_1));
            };
        }

        public function set img6_E_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733282998img6_E_0;
            if (_local_2 !== _arg_1)
            {
                this._733282998img6_E_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_E_0", _local_2, _arg_1));
            };
        }

        public function set btnNextPageShopGold(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._564183348btnNextPageShopGold;
            if (_local_2 !== _arg_1)
            {
                this._564183348btnNextPageShopGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnNextPageShopGold", _local_2, _arg_1));
            };
        }

        public function set img7_C_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732361399img7_C_0;
            if (_local_2 !== _arg_1)
            {
                this._732361399img7_C_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_C_0", _local_2, _arg_1));
            };
        }

        public function __bangBtn6_click(_arg_1:MouseEvent):void
        {
            bangSele(6);
        }

        [Bindable(event="propertyChange")]
        public function get btn6_A():DelayButton
        {
            return (this._1378850148btn6_A);
        }

        private function initCharAugurGoldInfoCanvas():void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:Object;
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:* = 7;
            while (_local_2 >= 1)
            {
                if (jieduan[_local_2])
                {
                    if (_worldCupFlag[_local_2])
                    {
                        for (_local_3 in _worldCupFlag[_local_2])
                        {
                            _local_4 = new Object();
                            _local_5 = checkIsGetResult(_local_2, _local_3);
                            if (_local_5)
                            {
                                _local_4["vs"] = ((GamePredef.WORLD_CUP_INFO[_local_5["vs"][0]].name + " vs ") + GamePredef.WORLD_CUP_INFO[_local_5["vs"][1]].name);
                                _local_4["state"] = jieduan[_local_2];
                                _local_4["myCity"] = GamePredef.WORLD_CUP_INFO[_local_3].name;
                                switch (Number(_local_5["flag"]))
                                {
                                    case 1:
                                        _local_4["trueCity"] = ((_local_5["vs"][0] == _local_3) ? GamePredef.WORLD_CUP_INFO[_local_5["vs"][0]].name : GamePredef.WORLD_CUP_INFO[_local_5["vs"][1]].name);
                                        _local_4["res"] = Language.WORLD_CUP_PANEL[31];
                                        break;
                                    case 2:
                                        _local_4["trueCity"] = ((_local_5["vs"][0] == _local_3) ? GamePredef.WORLD_CUP_INFO[_local_5["vs"][1]].name : GamePredef.WORLD_CUP_INFO[_local_5["vs"][0]].name);
                                        _local_4["res"] = Language.WORLD_CUP_PANEL[32];
                                        break;
                                    case 3:
                                        _local_4["trueCity"] = Language.WORLD_CUP_PANEL[33];
                                        _local_4["res"] = Language.WORLD_CUP_PANEL[33];
                                        break;
                                };
                                _local_4["odds"] = WORLD_CUP_ODDS[_local_2][_local_3];
                                _local_4["goldCost"] = _worldCupFlag[_local_2][_local_3];
                                _local_4["point"] = (((_worldCupFlag[(_local_2 * 10)]) && (_worldCupFlag[(_local_2 * 10)][_local_3])) ? _worldCupFlag[(_local_2 * 10)][_local_3] : 0);
                                _local_1.addItem(_local_4);
                            };
                        };
                    };
                };
                _local_2--;
            };
            ginfo_grid.dataProvider = _local_1;
        }

        [Bindable(event="propertyChange")]
        public function get btn6_C():DelayButton
        {
            return (this._1378850146btn6_C);
        }

        [Bindable(event="propertyChange")]
        public function get btn6_D():DelayButton
        {
            return (this._1378850145btn6_D);
        }

        public function set img7_C_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732361398img7_C_1;
            if (_local_2 !== _arg_1)
            {
                this._732361398img7_C_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_C_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn6_B():DelayButton
        {
            return (this._1378850147btn6_B);
        }

        [Bindable(event="propertyChange")]
        public function get vsBang():ViewStack
        {
            return (this._808459627vsBang);
        }

        private function _WorldCupPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn5 = _local_1;
            _local_1.dataField = "osc";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn5", _WorldCupPanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get _myOutSc():Number
        {
            return (this._442404173_myOutSc);
        }

        [Bindable(event="propertyChange")]
        public function get lab5_C_0():Label
        {
            return (this._2004000067lab5_C_0);
        }

        public function ___WorldCupPanel_DelayButton19_click(_arg_1:MouseEvent):void
        {
            getWorldCupFreePoint();
        }

        [Bindable(event="propertyChange")]
        public function get lab6_A_0():Label
        {
            return (this._2003078468lab6_A_0);
        }

        public function __btn7_D_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("D", 7);
        }

        public function set xz1(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119151xz1;
            if (_local_2 !== _arg_1)
            {
                this._119151xz1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz1", _local_2, _arg_1));
            };
        }

        public function set xz2(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119152xz2;
            if (_local_2 !== _arg_1)
            {
                this._119152xz2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz2", _local_2, _arg_1));
            };
        }

        private function checkIsGetResult(_arg_1:Number, _arg_2:String):Object
        {
            var _local_4:*;
            var _local_5:Number;
            var _local_3:* = "";
            for (_local_4 in WORLD_CUP_GROUP[_arg_1])
            {
                if (WORLD_CUP_GROUP[_arg_1][_local_4].indexOf((("|" + _arg_2) + "|")) >= 0)
                {
                    _local_3 = _local_4;
                    break;
                };
            };
            _local_5 = ToolKit.minus(_arg_1, 1);
            if (!WORLD_CUP_GROUP[_local_5])
            {
                return ({
                    "flag":3,
                    "vs":_vsObject[_arg_1][_arg_2]
                });
            };
            var _local_6:String = _local_3;
            if (_arg_1 < 7)
            {
                _local_6 = WORLD_CUP_ADD[_local_3];
            };
            if (((WORLD_CUP_GROUP[_local_5]) && (WORLD_CUP_GROUP[_local_5][_local_6])))
            {
                if (WORLD_CUP_GROUP[_local_5][_local_6].indexOf((("|" + _arg_2) + "|")) >= 0)
                {
                    return ({
                        "flag":1,
                        "vs":_vsObject[_arg_1][_arg_2]
                    });
                };
                return ({
                    "flag":2,
                    "vs":_vsObject[_arg_1][_arg_2]
                });
            };
            return ({
                "flag":3,
                "vs":_vsObject[_arg_1][_arg_2]
            });
        }

        public function set xz3(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119153xz3;
            if (_local_2 !== _arg_1)
            {
                this._119153xz3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz3", _local_2, _arg_1));
            };
        }

        public function set xz4(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119154xz4;
            if (_local_2 !== _arg_1)
            {
                this._119154xz4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz4", _local_2, _arg_1));
            };
        }

        public function set xz5(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119155xz5;
            if (_local_2 !== _arg_1)
            {
                this._119155xz5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz5", _local_2, _arg_1));
            };
        }

        public function set xz6(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119156xz6;
            if (_local_2 !== _arg_1)
            {
                this._119156xz6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz6", _local_2, _arg_1));
            };
        }

        public function set xz7(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119157xz7;
            if (_local_2 !== _arg_1)
            {
                this._119157xz7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz7", _local_2, _arg_1));
            };
        }

        public function __img7_G_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "G");
        }

        public function set xz8(_arg_1:WorldCupCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._119158xz8;
            if (_local_2 !== _arg_1)
            {
                this._119158xz8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xz8", _local_2, _arg_1));
            };
        }

        public function sortFun(_arg_1:Object, _arg_2:Object):int
        {
            if (Number(_arg_1.pNum1) > Number(_arg_2.pNum1))
            {
                return (-1);
            };
            if (Number(_arg_1.pNum1) == Number(_arg_2.pNum1))
            {
                return (0);
            };
            return (1);
        }

        public function set lab6_F_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003073663lab6_F_0;
            if (_local_2 !== _arg_1)
            {
                this._2003073663lab6_F_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_F_0", _local_2, _arg_1));
            };
        }

        public function __btn5_A_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("A", 5);
        }

        [Bindable(event="propertyChange")]
        public function get img4_B_0():Image
        {
            return (this._735132923img4_B_0);
        }

        public function set lab7_D_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002152064lab7_D_0;
            if (_local_2 !== _arg_1)
            {
                this._2002152064lab7_D_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_D_0", _local_2, _arg_1));
            };
        }

        public function set lab7_D_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002152063lab7_D_1;
            if (_local_2 !== _arg_1)
            {
                this._2002152063lab7_D_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_D_1", _local_2, _arg_1));
            };
        }

        public function set img6_D_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733283959img6_D_0;
            if (_local_2 !== _arg_1)
            {
                this._733283959img6_D_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_D_0", _local_2, _arg_1));
            };
        }

        public function __btnNextPage_buttonDown(_arg_1:FlexEvent):void
        {
            gotUpOrBack(true);
        }

        public function set img7_B_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732362360img7_B_0;
            if (_local_2 !== _arg_1)
            {
                this._732362360img7_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_B_0", _local_2, _arg_1));
            };
        }

        public function set img7_B_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732362359img7_B_1;
            if (_local_2 !== _arg_1)
            {
                this._732362359img7_B_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_B_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btn4_A():DelayButton
        {
            return (this._1378852070btn4_A);
        }

        public function set rankGrid(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._255677842rankGrid;
            if (_local_2 !== _arg_1)
            {
                this._255677842rankGrid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rankGrid", _local_2, _arg_1));
            };
        }

        private function _WorldCupPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn3 = _local_1;
            _local_1.dataField = "sid";
            _local_1.width = 40;
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn3", _WorldCupPanel_DataGridColumn3);
            return (_local_1);
        }

        public function __img7_B_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "B");
        }

        public function onGetWorldCupShopLimitDataTcn(_arg_1:Object):void
        {
            if (initialized)
            {
                if (_arg_1)
                {
                    WORLD_CUP_LIMIT = _arg_1;
                    _initShopCanvas();
                };
            };
        }

        public function __img6_D_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "D");
        }

        public function __img2_A_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 2, "A");
        }

        [Bindable(event="propertyChange")]
        public function get lab5_A_0():Label
        {
            return (this._2004001989lab5_A_0);
        }

        public function ___WorldCupPanel_DelayButton2_click(_arg_1:MouseEvent):void
        {
            tradeAward();
        }

        public function set imgg_2_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._688048727imgg_2_1;
            if (_local_2 !== _arg_1)
            {
                this._688048727imgg_2_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgg_2_1", _local_2, _arg_1));
            };
        }

        public function set imgg_2_2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._688048726imgg_2_2;
            if (_local_2 !== _arg_1)
            {
                this._688048726imgg_2_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgg_2_2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLastPageShop():Button
        {
            return (this._289667927btnLastPageShop);
        }

        public function set labg_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1110415956labg_1;
            if (_local_2 !== _arg_1)
            {
                this._1110415956labg_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labg_1", _local_2, _arg_1));
            };
        }

        public function set labg_2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1110415955labg_2;
            if (_local_2 !== _arg_1)
            {
                this._1110415955labg_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labg_2", _local_2, _arg_1));
            };
        }

        public function __img5_A_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 5, "A");
        }

        public function set lab7_C_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002153025lab7_C_0;
            if (_local_2 !== _arg_1)
            {
                this._2002153025lab7_C_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_C_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get introCon():IntroText
        {
            return (this._582286198introCon);
        }

        private function calculateWorldCupGroupOnKnockOut(_arg_1:Number, _arg_2:Number, _arg_3:String):void
        {
            var _local_5:*;
            var _local_6:*;
            if (((((((!(WORLD_CUP_GROUP[_arg_2])) || (!(WORLD_CUP_GROUP[_arg_2][_arg_3]))) || (!(WORLD_CUP_REQUIRE[_arg_2]))) || (!(WORLD_CUP_REQUIRE[_arg_2]["ft"][_arg_3]))) || (_arg_2 == 3)) || (_arg_2 == 1)))
            {
                return;
            };
            var _local_4:* = new Date().getTime();
            if (Number(WORLD_CUP_GROUP[_arg_2][_arg_3]) <= _local_4)
            {
                return;
            };
            if ((((!(_allTeamArr[_arg_2])) || (!(_allTeamArr[_arg_2][_arg_3]))) || (!(_allTeamArr[_arg_2][_arg_3][_arg_1]))))
            {
                return;
            };
            if (((_arg_2 < 7) && (!(this[((("btn" + _arg_2) + "_") + WORLD_CUP_ADD[_arg_3])].visible))))
            {
                return;
            };
            if (((_arg_2 == 7) && (!(this[((("btn" + _arg_2) + "_") + _arg_3)].visible))))
            {
                return;
            };
            if (((((ToolKit.minus(_local_4, _click) <= 700) && (_clickId == _arg_1)) && (_clickgState == _arg_2)) && (_clickgGroup == _arg_3)))
            {
                _local_5 = _arg_3;
                if (_arg_2 < 7)
                {
                    _local_5 = WORLD_CUP_ADD[_arg_3];
                };
                _local_6 = ToolKit.minus(_arg_2, 1);
                this[(((("img" + _local_6) + "_") + _local_5) + "_0")].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_allTeamArr[_arg_2][_arg_3][_arg_1]].icon));
                this[(((("img" + _local_6) + "_") + _local_5) + "_0")].visible = true;
                this[(((("lab" + _local_6) + "_") + _local_5) + "_0")].text = GamePredef.WORLD_CUP_INFO[_allTeamArr[_arg_2][_arg_3][_arg_1]].name;
                this[(((("lab" + _local_6) + "_") + _local_5) + "_0")].visible = true;
                if (!_choseTeam[_local_6])
                {
                    _choseTeam[_local_6] = {};
                };
                _choseTeam[_local_6][_local_5] = {};
                _choseTeam[_local_6][_local_5][_allTeamArr[_arg_2][_arg_3][_arg_1]] = 1;
            }
            else
            {
                _click = _local_4;
                _clickId = _arg_1;
                _clickgState = _arg_2;
                _clickgGroup = _arg_3;
            };
        }

        public function set lab6_E_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003074624lab6_E_0;
            if (_local_2 !== _arg_1)
            {
                this._2003074624lab6_E_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_E_0", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:WorldCupPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _WorldCupPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_WorldCupPanelWatcherSetupUtil");
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

        public function set img7_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732363321img7_A_0;
            if (_local_2 !== _arg_1)
            {
                this._732363321img7_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_A_0", _local_2, _arg_1));
            };
        }

        public function set lab7_C_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002153024lab7_C_1;
            if (_local_2 !== _arg_1)
            {
                this._2002153024lab7_C_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_C_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_B():Label
        {
            return (this._2012832859yLab6_B);
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_C():Label
        {
            return (this._2012832858yLab6_C);
        }

        public function set img6_C_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733284920img6_C_0;
            if (_local_2 !== _arg_1)
            {
                this._733284920img6_C_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_C_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_F():Label
        {
            return (this._2012832855yLab6_F);
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_G():Label
        {
            return (this._2012832854yLab6_G);
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_A():Label
        {
            return (this._2012832860yLab6_A);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn5():BasicGlowButton
        {
            return (this._1863324751bangBtn5);
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
        public function get bangBtn4():BasicGlowButton
        {
            return (this._1863324752bangBtn4);
        }

        [Bindable(event="propertyChange")]
        private function get _myTeamSc():Number
        {
            return (this._701799496_myTeamSc);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn6():BasicGlowButton
        {
            return (this._1863324750bangBtn6);
        }

        private function _WorldCupPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn1 = _local_1;
            _local_1.dataField = "rank";
            _local_1.width = 65;
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn1", _WorldCupPanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_D():Label
        {
            return (this._2012832857yLab6_D);
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_E():Label
        {
            return (this._2012832856yLab6_E);
        }

        [Bindable(event="propertyChange")]
        public function get lab4_A_0():Label
        {
            return (this._2004925510lab4_A_0);
        }

        public function ___WorldCupPanel_Button2_click(_arg_1:MouseEvent):void
        {
            tradeAward();
        }

        [Bindable(event="propertyChange")]
        public function get btn2_A():DelayButton
        {
            return (this._1378853992btn2_A);
        }

        [Bindable(event="propertyChange")]
        public function get bangBtn3():BasicGlowButton
        {
            return (this._1863324753bangBtn3);
        }

        public function __btn6_D_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("D", 6);
        }

        public function set img7_A_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._732363320img7_A_1;
            if (_local_2 !== _arg_1)
            {
                this._732363320img7_A_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7_A_1", _local_2, _arg_1));
            };
        }

        public function set imgg_1_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._688049688imgg_1_1;
            if (_local_2 !== _arg_1)
            {
                this._688049688imgg_1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgg_1_1", _local_2, _arg_1));
            };
        }

        public function set imgg_1_2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._688049687imgg_1_2;
            if (_local_2 !== _arg_1)
            {
                this._688049687imgg_1_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgg_1_2", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (_core.player.level < 50)
            {
                return;
            };
            _core.remote.call("initWorldCupPanelData", null, _version);
            _core.remote.call("getWorldCupRank", null, _rankVersion);
        }

        [Bindable(event="propertyChange")]
        public function get yLab6_H():Label
        {
            return (this._2012832853yLab6_H);
        }

        public function __img7_F_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "F");
        }

        public function set lab7_B_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002153986lab7_B_0;
            if (_local_2 !== _arg_1)
            {
                this._2002153986lab7_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_B_0", _local_2, _arg_1));
            };
        }

        public function set lab6_D_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003075585lab6_D_0;
            if (_local_2 !== _arg_1)
            {
                this._2003075585lab6_D_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_D_0", _local_2, _arg_1));
            };
        }

        public function __btn4_A_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("A", 4);
        }

        public function set lab7_B_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002153985lab7_B_1;
            if (_local_2 !== _arg_1)
            {
                this._2002153985lab7_B_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_B_1", _local_2, _arg_1));
            };
        }

        public function ___WorldCupPanel_Button7_click(_arg_1:MouseEvent):void
        {
            tradeAward();
        }

        [Bindable(event="propertyChange")]
        public function get img2_B_0():Image
        {
            return (this._736979965img2_B_0);
        }

        public function set img6_B_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733285881img6_B_0;
            if (_local_2 !== _arg_1)
            {
                this._733285881img6_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_B_0", _local_2, _arg_1));
            };
        }

        public function onInitWorldCupPanelData(_arg_1:Object, _arg_2:Object, _arg_3:Object, _arg_4:Object, _arg_5:Object, _arg_6:Object, _arg_7:String, _arg_8:Object):void
        {
            var _local_9:*;
            if (initialized)
            {
                if (_arg_5)
                {
                    WORLD_CUP_GROUP = _arg_5;
                    initVsObject();
                };
                if (_arg_6)
                {
                    WORLD_CUP_REQUIRE = _arg_6;
                };
                if (_arg_2)
                {
                    WORLD_CUP_ODDS = _arg_2;
                };
                if (_arg_1)
                {
                    WORLD_CUP_TIME_GOLD_LIMIT = _arg_1;
                };
                if (_arg_8)
                {
                    _worldCupFlag = _arg_8;
                }
                else
                {
                    _worldCupFlag = {};
                };
                _myTeamSc = 0;
                _myOutSc = 0;
                if (_arg_4)
                {
                    for (_local_9 in _arg_4)
                    {
                        if (String(_local_9) == "8")
                        {
                            _myTeamSc = Number(_arg_4[_local_9]);
                        }
                        else
                        {
                            if (String(_local_9) != "t")
                            {
                                _myOutSc = (_myOutSc + Number(_arg_4[_local_9]));
                            };
                        };
                    };
                };
                _version = _arg_7;
                _charData = _arg_3;
                if (!_arg_3)
                {
                    _charData = {};
                };
            };
            update32thCanvas();
            updateKnockOutCanvas();
            initCharAugurGoldInfoCanvas();
            initGoldScheduleObject();
            initGoldScheduleCanvas();
        }

        public function set img5_D_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._734207480img5_D_0;
            if (_local_2 !== _arg_1)
            {
                this._734207480img5_D_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5_D_0", _local_2, _arg_1));
            };
        }

        public function __bangBtn4_click(_arg_1:MouseEvent):void
        {
            bangSele(4);
        }

        public function ___WorldCupPanel_DelayButton23_click(_arg_1:MouseEvent):void
        {
            showChangePanel();
        }

        [Bindable(event="propertyChange")]
        public function get yLab4_B():Label
        {
            return (this._2012834781yLab4_B);
        }

        [Bindable(event="propertyChange")]
        public function get yLab4_A():Label
        {
            return (this._2012834782yLab4_A);
        }

        public function __img7_A_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "A");
        }

        public function __img6_C_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "C");
        }

        [Bindable(event="propertyChange")]
        public function get lab3_A_0():Label
        {
            return (this._2005849031lab3_A_0);
        }

        private function _WorldCupPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn13 = _local_1;
            _local_1.dataField = "goldCost";
            _local_1.width = 110;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn13", _WorldCupPanel_DataGridColumn13);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get img7_G_0():Image
        {
            return (this._732357555img7_G_0);
        }

        public function __btn7_B_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("B", 7);
        }

        [Bindable(event="propertyChange")]
        public function get img7_G_1():Image
        {
            return (this._732357554img7_G_1);
        }

        public function set labg_2_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1957840353labg_2_1;
            if (_local_2 !== _arg_1)
            {
                this._1957840353labg_2_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labg_2_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLastPageShopGold():Button
        {
            return (this._1917162409btnLastPageShopGold);
        }

        public function set labg_2_2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1957840352labg_2_2;
            if (_local_2 !== _arg_1)
            {
                this._1957840352labg_2_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labg_2_2", _local_2, _arg_1));
            };
        }

        public function set lab7_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002154947lab7_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2002154947lab7_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_A_0", _local_2, _arg_1));
            };
        }

        public function set lab6_C_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003076546lab6_C_0;
            if (_local_2 !== _arg_1)
            {
                this._2003076546lab6_C_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_C_0", _local_2, _arg_1));
            };
        }

        public function set lab7_A_1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2002154946lab7_A_1;
            if (_local_2 !== _arg_1)
            {
                this._2002154946lab7_A_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab7_A_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab7_H_0():Label
        {
            return (this._2002148220lab7_H_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_H_1():Label
        {
            return (this._2002148219lab7_H_1);
        }

        public function __btn7_G_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("G", 7);
        }

        public function set img5_C_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._734208441img5_C_0;
            if (_local_2 !== _arg_1)
            {
                this._734208441img5_C_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5_C_0", _local_2, _arg_1));
            };
        }

        public function set img6_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._733286842img6_A_0;
            if (_local_2 !== _arg_1)
            {
                this._733286842img6_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6_A_0", _local_2, _arg_1));
            };
        }

        public function set endTime(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1607243192endTime;
            if (_local_2 !== _arg_1)
            {
                this._1607243192endTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endTime", _local_2, _arg_1));
            };
        }

        private function getServerTime():Number
        {
            return ((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet);
        }

        private function _WorldCupPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn11 = _local_1;
            _local_1.dataField = "res";
            _local_1.width = 70;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn11", _WorldCupPanel_DataGridColumn11);
            return (_local_1);
        }

        public function set btn7_A(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849187btn7_A;
            if (_local_2 !== _arg_1)
            {
                this._1378849187btn7_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_A", _local_2, _arg_1));
            };
        }

        public function set btn7_B(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849186btn7_B;
            if (_local_2 !== _arg_1)
            {
                this._1378849186btn7_B = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_B", _local_2, _arg_1));
            };
        }

        private function clearnGroupImage():void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:Number;
            var _local_5:String;
            var _local_6:*;
            var _local_7:String;
            var _local_8:Array;
            var _local_9:*;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:*;
            var _local_13:Date;
            var _local_14:String;
            _timeAward = "";
            var _local_1:Number = getServerTime();
            for (_local_2 in saveBtnId)
            {
                for (_local_3 in saveBtnId[_local_2])
                {
                    _local_4 = _local_2;
                    _local_5 = "";
                    _local_6 = saveBtnId[_local_2][_local_3];
                    if (((_local_2 == 5) && (saveBtnId[_local_2][_local_3] == "B")))
                    {
                        _local_6 = "C";
                    };
                    if (((((WORLD_CUP_REQUIRE[_local_2]) && (WORLD_CUP_REQUIRE[_local_2]["ft"])) && (WORLD_CUP_REQUIRE[_local_2]["ft"][_local_6])) && (ToolKit.isSmallThan(_local_1, WORLD_CUP_REQUIRE[_local_2]["ft"][_local_6]))))
                    {
                        this[((("btn" + _local_2) + "_") + saveBtnId[_local_2][_local_3])].visible = true;
                        if (((GROUP_INDEX_STATE[_local_2]) && (WORLD_CUP_GROUP[_local_2])))
                        {
                            _local_7 = Language.WORLD_CUP_PANEL[24];
                            if (_local_2 >= 7)
                            {
                                _local_8 = WORLD_CUP_GROUP[_local_2][saveBtnId[_local_2][_local_3]].split("|");
                                _local_9 = 0;
                                while (_local_9 < _local_8.length)
                                {
                                    if (GamePredef.WORLD_CUP_INFO[_local_8[_local_9]])
                                    {
                                        _local_7 = _local_7.replace("{name}", GamePredef.WORLD_CUP_INFO[_local_8[_local_9]].name);
                                    };
                                    _local_9++;
                                };
                                if (_local_2 == 7)
                                {
                                    _local_12 = "16强";
                                    _local_5 = saveBtnId[_local_2][_local_3];
                                };
                            }
                            else
                            {
                                _local_10 = saveBtnId[_local_2][_local_3];
                                _local_11 = WORLD_CUP_MINUS[_local_10].split("|");
                                _local_12 = 0;
                                while (_local_12 < _local_11.length)
                                {
                                    if (_local_11[0])
                                    {
                                        _local_5 = _local_11[0];
                                    };
                                    _local_8 = WORLD_CUP_GROUP[_local_2][_local_11[_local_12]].split("|");
                                    _local_9 = 0;
                                    while (_local_9 < _local_8.length)
                                    {
                                        if (GamePredef.WORLD_CUP_INFO[_local_8[_local_9]])
                                        {
                                            _local_7 = _local_7.replace("{name}", GamePredef.WORLD_CUP_INFO[_local_8[_local_9]].name);
                                        };
                                        _local_9++;
                                    };
                                    _local_12++;
                                };
                            };
                            if (_local_12 != "")
                            {
                                _local_13 = new Date(WORLD_CUP_REQUIRE[_local_2]["ft"][_local_5]);
                                _local_14 = ((((((((((_local_13.fullYear + "/") + (_local_13.month + 1)) + "/") + _local_13.date) + " ") + _local_13.hours) + ":") + _local_13.minutes) + ":") + _local_13.seconds);
                                _timeAward = ((_timeAward + _local_7.replace("{num}", GROUP_INDEX_STATE[_local_2]).replace("{time}", _local_14)) + "\n");
                            };
                        };
                    }
                    else
                    {
                        this[((("btn" + _local_2) + "_") + saveBtnId[_local_2][_local_3])].visible = false;
                    };
                    this[((("yLab" + ToolKit.minus(_local_2, 1)) + "_") + saveBtnId[_local_2][_local_3])].visible = false;
                };
            };
            for (_local_3 in WORLD_CUP_ADD)
            {
                if (this[(("img6_" + _local_3) + "_0")])
                {
                    this[(("img6_" + _local_3) + "_0")].visible = false;
                    this[(("lab6_" + _local_3) + "_0")].visible = false;
                };
            };
            this["img5_A_0"].visible = false;
            this["img5_B_0"].visible = false;
            this["img5_C_0"].visible = false;
            this["img5_D_0"].visible = false;
            this["img4_A_0"].visible = false;
            this["img4_B_0"].visible = false;
            this["img2_A_0"].visible = false;
            this["img2_B_0"].visible = false;
            this["img3_A_0"].visible = false;
            this["img1_A_0"].visible = false;
            this["lab5_A_0"].visible = false;
            this["lab5_B_0"].visible = false;
            this["lab5_C_0"].visible = false;
            this["lab5_D_0"].visible = false;
            this["lab4_A_0"].visible = false;
            this["lab4_B_0"].visible = false;
            this["lab2_A_0"].visible = false;
            this["lab2_B_0"].visible = false;
            this["lab3_A_0"].visible = false;
            this["lab1_A_0"].visible = false;
        }

        public function set btn7_C(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849185btn7_C;
            if (_local_2 !== _arg_1)
            {
                this._1378849185btn7_C = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_C", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab2_A_0():Label
        {
            return (this._2006772552lab2_A_0);
        }

        public function set btn7_D(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849184btn7_D;
            if (_local_2 !== _arg_1)
            {
                this._1378849184btn7_D = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_D", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLastPage():Button
        {
            return (this._320271553btnLastPage);
        }

        public function set btn7_E(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849183btn7_E;
            if (_local_2 !== _arg_1)
            {
                this._1378849183btn7_E = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_E", _local_2, _arg_1));
            };
        }

        public function set labg_1_2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1957841313labg_1_2;
            if (_local_2 !== _arg_1)
            {
                this._1957841313labg_1_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labg_1_2", _local_2, _arg_1));
            };
        }

        public function set btn7_G(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849181btn7_G;
            if (_local_2 !== _arg_1)
            {
                this._1378849181btn7_G = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_G", _local_2, _arg_1));
            };
        }

        public function set btn7_F(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849182btn7_F;
            if (_local_2 !== _arg_1)
            {
                this._1378849182btn7_F = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_F", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img6_G_0():Image
        {
            return (this._733281076img6_G_0);
        }

        public function set btn7_H(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378849180btn7_H;
            if (_local_2 !== _arg_1)
            {
                this._1378849180btn7_H = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn7_H", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_E_1():Image
        {
            return (this._732359476img7_E_1);
        }

        public function set labg_1_1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1957841314labg_1_1;
            if (_local_2 !== _arg_1)
            {
                this._1957841314labg_1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labg_1_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_E_0():Image
        {
            return (this._732359477img7_E_0);
        }

        private function initShopData():void
        {
            var _local_3:*;
            var _local_4:*;
            _shopData = new Array();
            _shopDataGold = new Array();
            var _local_1:Object = {};
            var _local_2:Object = GameData.d[GamePredef.TBL_SHOP_SLOT];
            for (_local_3 in _local_2)
            {
                if (ToolKit.isEqual(_local_2[_local_3].sid, 107))
                {
                    _local_1[_local_3] = _local_2[_local_3];
                };
            };
            for (_local_4 in _local_1)
            {
                if (_local_1[_local_4].pType1 == 29)
                {
                    _shopData.push(_local_1[_local_4]);
                }
                else
                {
                    _shopDataGold.push(_local_1[_local_4]);
                };
            };
            _shopData = _shopData.sort(sortFun);
            _shopDataGold = _shopDataGold.sort(sortFun);
        }

        public function __img7_E_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "E");
        }

        public function set btng_1(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1378803075btng_1;
            if (_local_2 !== _arg_1)
            {
                this._1378803075btng_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btng_1", _local_2, _arg_1));
            };
        }

        private function updateKnockOutCanvas():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:Number;
            var _local_4:*;
            var _local_5:Array;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:*;
            if (!WORLD_CUP_GROUP[7])
            {
                return;
            };
            clearnGroupImage();
            _allTeamArr = {};
            for (_local_1 in _charData)
            {
                if (ToolKit.isSmallOrEqual(_local_1, 7))
                {
                    for (_local_2 in _charData[_local_1])
                    {
                        if (((_charData[_local_1]) && (_charData[_local_1][_local_2])))
                        {
                            _local_3 = ToolKit.minus(_local_1, 1);
                            for (_local_4 in _charData[_local_1][_local_2])
                            {
                                this[(((("img" + _local_3) + "_") + _local_2) + "_0")].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_local_4].icon));
                                this[(((("lab" + _local_3) + "_") + _local_2) + "_0")].text = GamePredef.WORLD_CUP_INFO[_local_4].name;
                                this[(((("img" + _local_3) + "_") + _local_2) + "_0")].visible = true;
                                this[(((("lab" + _local_3) + "_") + _local_2) + "_0")].visible = true;
                            };
                        };
                    };
                };
            };
            for (_local_1 in WORLD_CUP_GROUP)
            {
                if (((WORLD_CUP_GROUP[_local_1]) && (ToolKit.isSmallOrEqual(_local_1, 7))))
                {
                    _allTeamArr[_local_1] = {};
                    for (_local_2 in WORLD_CUP_GROUP[_local_1])
                    {
                        _allTeamArr[_local_1][_local_2] = {};
                        if (ToolKit.isEqual(_local_1, 7))
                        {
                            _local_5 = WORLD_CUP_GROUP[_local_1][_local_2].split("|");
                            if (_local_5.length == 0) continue;
                            _local_6 = 0;
                            _local_4 = 0;
                            while (_local_4 < _local_5.length)
                            {
                                if (GamePredef.WORLD_CUP_INFO[_local_5[_local_4]])
                                {
                                    this[((((("img" + _local_1) + "_") + _local_2) + "_") + _local_6)].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_local_5[_local_4]].icon));
                                    this[((((("lab" + _local_1) + "_") + _local_2) + "_") + _local_6)].text = GamePredef.WORLD_CUP_INFO[_local_5[_local_4]].name;
                                    this[((((("img" + _local_1) + "_") + _local_2) + "_") + _local_6)].visible = true;
                                    this[((((("lab" + _local_1) + "_") + _local_2) + "_") + _local_6)].visible = true;
                                    _allTeamArr[_local_1][_local_2][_local_6] = _local_5[_local_4];
                                    _local_6++;
                                };
                                _local_4++;
                            };
                        }
                        else
                        {
                            _local_5 = WORLD_CUP_GROUP[_local_1][_local_2].split("|");
                            if (_local_5.length != 0)
                            {
                                _local_6 = 0;
                                _local_4 = 0;
                                while (_local_4 < _local_5.length)
                                {
                                    if (GamePredef.WORLD_CUP_INFO[_local_5[_local_4]])
                                    {
                                        this[((((("img" + _local_1) + "_") + _local_2) + "_") + _local_6)].source = ResManager.getIconUrl(parseInt(GamePredef.WORLD_CUP_INFO[_local_5[_local_4]].icon));
                                        this[((((("img" + _local_1) + "_") + _local_2) + "_") + _local_6)].visible = true;
                                        this[((((("lab" + _local_1) + "_") + _local_2) + "_") + _local_6)].text = GamePredef.WORLD_CUP_INFO[_local_5[_local_4]].name;
                                        this[((((("lab" + _local_1) + "_") + _local_2) + "_") + _local_6)].visible = true;
                                        _local_7 = ToolKit.add(_local_1, 1);
                                        if ((((_charData) && (_charData[_local_7])) && (_charData[_local_7][_local_2])))
                                        {
                                            for (_local_8 in _charData[_local_7][_local_2])
                                            {
                                                if (_local_8 == _local_5[_local_4])
                                                {
                                                    this[((("yLab" + _local_1) + "_") + _local_2)].htmlText = (("<font color='#53FF53'>" + Language.WORLD_CUP_PANEL[12].replace("{name}", GamePredef.WORLD_CUP_INFO[_local_8].name)) + "</font>");
                                                }
                                                else
                                                {
                                                    this[((("yLab" + _local_1) + "_") + _local_2)].htmlText = (("<font color='#FF5809'>" + Language.WORLD_CUP_PANEL[12].replace("{name}", GamePredef.WORLD_CUP_INFO[_local_8].name)) + "</font>");
                                                };
                                                this[((("yLab" + _local_1) + "_") + _local_2)].visible = true;
                                            };
                                        };
                                        _allTeamArr[_local_1][_local_2][_local_6] = _local_5[_local_4];
                                        _local_6++;
                                    };
                                    _local_4++;
                                };
                            };
                        };
                    };
                };
            };
        }

        public function set lab6_B_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003077507lab6_B_0;
            if (_local_2 !== _arg_1)
            {
                this._2003077507lab6_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_B_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab7_F_0():Label
        {
            return (this._2002150142lab7_F_0);
        }

        public function set btng_2(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1378803074btng_2;
            if (_local_2 !== _arg_1)
            {
                this._1378803074btng_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btng_2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab6_H_0():Label
        {
            return (this._2003071741lab6_H_0);
        }

        public function set img5_B_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._734209402img5_B_0;
            if (_local_2 !== _arg_1)
            {
                this._734209402img5_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5_B_0", _local_2, _arg_1));
            };
        }

        public function set lab5_D_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003999106lab5_D_0;
            if (_local_2 !== _arg_1)
            {
                this._2003999106lab5_D_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab5_D_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab7_F_1():Label
        {
            return (this._2002150141lab7_F_1);
        }

        public function set vsBang(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._808459627vsBang;
            if (_local_2 !== _arg_1)
            {
                this._808459627vsBang = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vsBang", _local_2, _arg_1));
            };
        }

        public function __img6_B_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "B");
        }

        public function __btng_1_click(_arg_1:MouseEvent):void
        {
            showVsPanel(1);
        }

        public function __img7_H_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "H");
        }

        public function set btn6_B(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378850147btn6_B;
            if (_local_2 !== _arg_1)
            {
                this._1378850147btn6_B = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn6_B", _local_2, _arg_1));
            };
        }

        public function onUpdateCharWorldCupData(_arg_1:Object):void
        {
            if (((initialized) && (_arg_1)))
            {
                if (!_charData[_arg_1.state])
                {
                    _charData[_arg_1.state] = {};
                };
                if (!_charData[_arg_1.state][_arg_1.group])
                {
                    _charData[_arg_1.state][_arg_1.group] = {};
                };
                _charData[_arg_1.state][_arg_1.group] = _arg_1["info"];
                if (_arg_1.state == 8)
                {
                    update32thCanvasByGroup(_arg_1.group);
                };
            }
            else
            {
                if (initialized)
                {
                    update32thCanvas();
                    updateKnockOutCanvas();
                };
            };
        }

        public function set btn6_C(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378850146btn6_C;
            if (_local_2 !== _arg_1)
            {
                this._1378850146btn6_C = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn6_C", _local_2, _arg_1));
            };
        }

        public function set btn6_D(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378850145btn6_D;
            if (_local_2 !== _arg_1)
            {
                this._1378850145btn6_D = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn6_D", _local_2, _arg_1));
            };
        }

        public function set btn6_A(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378850148btn6_A;
            if (_local_2 !== _arg_1)
            {
                this._1378850148btn6_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn6_A", _local_2, _arg_1));
            };
        }

        public function set btnNextPage(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1090881890btnNextPage;
            if (_local_2 !== _arg_1)
            {
                this._1090881890btnNextPage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnNextPage", _local_2, _arg_1));
            };
        }

        public function __btn6_B_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("B", 6);
        }

        private function goToShopPage(_arg_1:Number, _arg_2:Array, _arg_3:Number):void
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_4:Number = ToolKit.add((ToolKit.minus(_arg_1, 1) * 10), 10);
            var _local_5:Number = (ToolKit.minus(_arg_1, 1) * 10);
            if (_arg_2.length < ToolKit.add(_local_5, 10))
            {
                _local_4 = _arg_2.length;
            };
            cleanShopCanvas(_arg_3);
            if (_arg_3 == 1)
            {
                _local_6 = 0;
                _local_7 = _local_5;
                while (_local_7 < _local_4)
                {
                    this[(("item" + _arg_3) + _local_6)].slotData = _arg_2[_local_7];
                    _local_8 = ((WORLD_CUP_LIMIT_1[_arg_2[_local_7].id]) ? WORLD_CUP_LIMIT_1[_arg_2[_local_7].id] : 0);
                    this[(("item" + _arg_3) + _local_6)].setLimit(_local_8);
                    _local_6++;
                    _local_7++;
                };
            }
            else
            {
                _local_6 = 0;
                _local_7 = _local_5;
                while (_local_7 < _local_4)
                {
                    this[(("item" + _arg_3) + _local_6)].slotData = _arg_2[_local_7];
                    _local_8 = ((WORLD_CUP_LIMIT[_arg_2[_local_7].id]) ? WORLD_CUP_LIMIT[_arg_2[_local_7].id] : 0);
                    this[(("item" + _arg_3) + _local_6)].setLimit(_local_8);
                    _local_6++;
                    _local_7++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_C_0():Image
        {
            return (this._732361399img7_C_0);
        }

        [Bindable(event="propertyChange")]
        public function get img6_E_0():Image
        {
            return (this._733282998img6_E_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab1_A_0():Label
        {
            return (this._2007696073lab1_A_0);
        }

        [Bindable(event="propertyChange")]
        public function get img7_C_1():Image
        {
            return (this._732361398img7_C_1);
        }

        private function saveCalculateResultOnKnockOut(_arg_1:String, _arg_2:Number):void
        {
            if (((((((!(WORLD_CUP_GROUP[_arg_2])) || (!(WORLD_CUP_GROUP[_arg_2][_arg_1]))) || (!(WORLD_CUP_REQUIRE[_arg_2]))) || (!(WORLD_CUP_REQUIRE[_arg_2]["ft"][_arg_1]))) || (_arg_2 == 3)) || (_arg_2 == 1)))
            {
                return;
            };
            var _local_3:* = new Date().getTime();
            if (Number(WORLD_CUP_GROUP[_arg_2][_arg_1]) <= _local_3)
            {
                return;
            };
            var _local_4:* = ToolKit.minus(_arg_2, 1);
            var _local_5:* = (!(_choseTeam[_local_4][_arg_1]));
            if (((_local_4 == 4) && (_arg_1 == "C")))
            {
                _local_5 = false;
            };
            if (((!(_choseTeam[_local_4])) || (_local_5)))
            {
                return;
            };
            var _local_6:Object = new Object();
            _local_6["group"] = _arg_1;
            _local_6["state"] = _arg_2;
            _local_6["info"] = _choseTeam[_local_4][_arg_1];
            if (((_local_4 == 4) && (_arg_1 == "C")))
            {
                _local_6["info"] = _choseTeam[_local_4]["B"];
            };
            _core.remote.call("updateCharWorldCupData", null, _local_6);
        }

        private function set _myOutSc(_arg_1:Number):void
        {
            var _local_2:Object;
            _local_2 = this._442404173_myOutSc;
            if (_local_2 !== _arg_1)
            {
                this._442404173_myOutSc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_myOutSc", _local_2, _arg_1));
            };
        }

        public function set btnNextPageShop(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._967394996btnNextPageShop;
            if (_local_2 !== _arg_1)
            {
                this._967394996btnNextPageShop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnNextPageShop", _local_2, _arg_1));
            };
        }

        public function set lab5_C_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2004000067lab5_C_0;
            if (_local_2 !== _arg_1)
            {
                this._2004000067lab5_C_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab5_C_0", _local_2, _arg_1));
            };
        }

        public function set lab6_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2003078468lab6_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2003078468lab6_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab6_A_0", _local_2, _arg_1));
            };
        }

        public function initVsObject():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:String;
            var _local_4:Array;
            var _local_5:*;
            var _local_6:Object;
            var _local_7:*;
            for (_local_1 in WORLD_CUP_GROUP)
            {
                if (_local_1 <= 7)
                {
                    if (WORLD_CUP_GROUP[_local_1])
                    {
                        if (!_vsObject[_local_1])
                        {
                            _vsObject[_local_1] = {};
                        };
                        if (_local_1 == 7)
                        {
                            for (_local_2 in WORLD_CUP_GROUP[_local_1])
                            {
                                _local_3 = WORLD_CUP_GROUP[_local_1][_local_2].substring(1, (WORLD_CUP_GROUP[_local_1][_local_2].toString().length - 1));
                                _local_4 = _local_3.split("|");
                                _local_5 = 0;
                                while (_local_5 < _local_4.length)
                                {
                                    _vsObject[_local_1][_local_4[_local_5]] = new Array();
                                    _vsObject[_local_1][_local_4[_local_5]] = _local_4;
                                    _local_5++;
                                };
                            };
                        }
                        else
                        {
                            _local_6 = {};
                            for (_local_2 in WORLD_CUP_GROUP[_local_1])
                            {
                                _local_7 = WORLD_CUP_ADD[_local_2];
                                if (!_local_6[_local_7])
                                {
                                    _local_6[_local_7] = WORLD_CUP_GROUP[_local_1][_local_2].substring(1, (WORLD_CUP_GROUP[_local_1][_local_2].toString().length - 1));
                                }
                                else
                                {
                                    _local_6[_local_7] = (_local_6[_local_7] + WORLD_CUP_GROUP[_local_1][_local_2].substring(0, (WORLD_CUP_GROUP[_local_1][_local_2].toString().length - 1)));
                                };
                            };
                            for (_local_2 in _local_6)
                            {
                                _local_4 = _local_6[_local_2].split("|");
                                _local_5 = 0;
                                while (_local_5 < _local_4.length)
                                {
                                    _vsObject[_local_1][_local_4[_local_5]] = new Array();
                                    _vsObject[_local_1][_local_4[_local_5]] = _local_4;
                                    _local_5++;
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab6_F_0():Label
        {
            return (this._2003073663lab6_F_0);
        }

        public function set txtPageIndicatorShop(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._2089469638txtPageIndicatorShop;
            if (_local_2 !== _arg_1)
            {
                this._2089469638txtPageIndicatorShop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPageIndicatorShop", _local_2, _arg_1));
            };
        }

        public function __bangBtn2_click(_arg_1:MouseEvent):void
        {
            bangSele(2);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_D_0():Label
        {
            return (this._2002152064lab7_D_0);
        }

        public function ___WorldCupPanel_DelayButton21_click(_arg_1:MouseEvent):void
        {
            getWorldCupGoldPoint();
        }

        [Bindable(event="propertyChange")]
        public function get rankGrid():DataGrid
        {
            return (this._255677842rankGrid);
        }

        private function bangSele(_arg_1:int):void
        {
            if (((_arg_1 == 2) && (!(WORLD_CUP_GROUP[7]))))
            {
                Alert.show(Language.WORLD_CUP_PANEL[51]);
                return;
            };
            var _local_2:int = 7;
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this[("bangBtn" + _local_3)].selected = false;
                _local_3++;
            };
            if (_arg_1 == 6)
            {
                initShopCanvas();
                _core.remote.call("getWorldCupShopLimitDataTcn", null);
            };
            this[("bangBtn" + _arg_1)].selected = true;
            vsBang.selectedIndex = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get imgg_2_1():Image
        {
            return (this._688048727imgg_2_1);
        }

        [Bindable(event="propertyChange")]
        public function get imgg_2_2():Image
        {
            return (this._688048726imgg_2_2);
        }

        public function set img5_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._734210363img5_A_0;
            if (_local_2 !== _arg_1)
            {
                this._734210363img5_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5_A_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labg_1():Label
        {
            return (this._1110415956labg_1);
        }

        [Bindable(event="propertyChange")]
        public function get labg_2():Label
        {
            return (this._1110415955labg_2);
        }

        public function set btn5_A(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378851109btn5_A;
            if (_local_2 !== _arg_1)
            {
                this._1378851109btn5_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn5_A", _local_2, _arg_1));
            };
        }

        public function set btn5_B(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378851108btn5_B;
            if (_local_2 !== _arg_1)
            {
                this._1378851108btn5_B = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn5_B", _local_2, _arg_1));
            };
        }

        public function onUpdateCharWorldCupFlagData(_arg_1:Number, _arg_2:String, _arg_3:Number):void
        {
            var _local_4:*;
            if (initialized)
            {
                if (!_worldCupFlag[_arg_1])
                {
                    _worldCupFlag[_arg_1] = {};
                };
                if (!_worldCupFlag[_arg_1][_arg_2])
                {
                    _worldCupFlag[_arg_1][_arg_2] = _arg_3;
                }
                else
                {
                    _worldCupFlag[_arg_1][_arg_2] = ToolKit.add(_worldCupFlag[_arg_1][_arg_2], _arg_3);
                };
                initCharAugurGoldInfoCanvas();
                initGoldScheduleObject();
                initGoldScheduleCanvas();
                _local_4 = _core.view.getUI(ViewManager.PANEL_WORLD_CUP_VS);
                if (_local_4)
                {
                    _local_4.updateMyCost(_arg_1, _arg_2, _worldCupFlag[_arg_1][_arg_2]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get img6_C_0():Image
        {
            return (this._733284920img6_C_0);
        }

        [Bindable(event="propertyChange")]
        public function get img7_A_1():Image
        {
            return (this._732363320img7_A_1);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_D_1():Label
        {
            return (this._2002152063lab7_D_1);
        }

        public function set endTime0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1715068648endTime0;
            if (_local_2 !== _arg_1)
            {
                this._1715068648endTime0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "endTime0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img7_A_0():Image
        {
            return (this._732363321img7_A_0);
        }

        public function __img7_D_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "D");
        }

        private function _WorldCupPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn8 = _local_1;
            _local_1.dataField = "state";
            _local_1.width = 85;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn8", _WorldCupPanel_DataGridColumn8);
            return (_local_1);
        }

        public function set lab5_B_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2004001028lab5_B_0;
            if (_local_2 !== _arg_1)
            {
                this._2004001028lab5_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab5_B_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab7_B_0():Label
        {
            return (this._2002153986lab7_B_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab6_D_0():Label
        {
            return (this._2003075585lab6_D_0);
        }

        public function __btn2_A_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("A", 2);
        }

        [Bindable(event="propertyChange")]
        public function get lab7_B_1():Label
        {
            return (this._2002153985lab7_B_1);
        }

        public function __btn7_E_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("E", 7);
        }

        public function set img4_B_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._735132923img4_B_0;
            if (_local_2 !== _arg_1)
            {
                this._735132923img4_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4_B_0", _local_2, _arg_1));
            };
        }

        public function __img6_A_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "A");
        }

        public function set btn4_A(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378852070btn4_A;
            if (_local_2 !== _arg_1)
            {
                this._1378852070btn4_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn4_A", _local_2, _arg_1));
            };
        }

        public function __img7_G_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "G");
        }

        public function __btn5_B_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("B", 5);
        }

        [Bindable(event="propertyChange")]
        public function get img6_A_0():Image
        {
            return (this._733286842img6_A_0);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_A():DelayButton
        {
            return (this._1378849187btn7_A);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_B():DelayButton
        {
            return (this._1378849186btn7_B);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_C():DelayButton
        {
            return (this._1378849185btn7_C);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_D():DelayButton
        {
            return (this._1378849184btn7_D);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_E():DelayButton
        {
            return (this._1378849183btn7_E);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_F():DelayButton
        {
            return (this._1378849182btn7_F);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_G():DelayButton
        {
            return (this._1378849181btn7_G);
        }

        [Bindable(event="propertyChange")]
        public function get btn7_H():DelayButton
        {
            return (this._1378849180btn7_H);
        }

        [Bindable(event="propertyChange")]
        public function get labg_1_1():Image
        {
            return (this._1957841314labg_1_1);
        }

        private function initGoldScheduleObject():void
        {
            var _local_1:Number;
            var _local_2:*;
            var _local_3:String;
            var _local_4:String;
            var _local_5:String;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:*;
            var _local_11:String;
            var _local_12:Number;
            var _local_13:Number;
            var _local_14:String;
            GoldSchedule = {};
            _local_1 = 1;
            while (_local_1 <= 7)
            {
                if (WORLD_CUP_ODDS[_local_1])
                {
                    if (_local_1 != GoldScheduleState)
                    {
                        _refreshBtn = true;
                        _defaultIndex = 1;
                    };
                    GoldScheduleState = _local_1;
                    break;
                };
                _local_1++;
            };
            if (((GoldScheduleState == 2) || (GoldScheduleState == 4)))
            {
                for (_local_2 in WORLD_CUP_GROUP[4])
                {
                    if (((!(WORLD_CUP_GROUP[4]["A"])) || (!(WORLD_CUP_GROUP[4]["B"]))))
                    {
                        return;
                    };
                    if (!WORLD_CUP_ODDS[4])
                    {
                        return;
                    };
                    _local_3 = WORLD_CUP_ADD[_local_2];
                    _local_4 = replaceAll(WORLD_CUP_GROUP[4]["A"], "|", "");
                    _local_5 = replaceAll(WORLD_CUP_GROUP[4]["B"], "|", "");
                    _local_6 = ((WORLD_CUP_ODDS[4][_local_4]) ? WORLD_CUP_ODDS[4][_local_4] : 0);
                    _local_7 = ((WORLD_CUP_ODDS[4][_local_5]) ? WORLD_CUP_ODDS[4][_local_5] : 0);
                    _local_8 = (((WORLD_CUP_TIME_GOLD_LIMIT[4]) && (WORLD_CUP_TIME_GOLD_LIMIT[4][_local_4])) ? WORLD_CUP_TIME_GOLD_LIMIT[4][_local_4] : 999999999999);
                    _local_9 = (((WORLD_CUP_TIME_GOLD_LIMIT[4]) && (WORLD_CUP_TIME_GOLD_LIMIT[4][_local_5])) ? WORLD_CUP_TIME_GOLD_LIMIT[4][_local_5] : 999999999999);
                    if (((_local_6) && (_local_7)))
                    {
                        if (!GoldSchedule["A"])
                        {
                            GoldSchedule["A"] = {};
                            GoldSchedule["A"][0] = {};
                            GoldSchedule["A"][0] = {
                                "goldLimit":_local_8,
                                "odds":_local_6,
                                "state":4,
                                "group":"A",
                                "team":_local_4,
                                "time":WORLD_CUP_REQUIRE[4]["ft"]["A"],
                                "cost":(((_worldCupFlag[4]) && (_worldCupFlag[4][_local_4])) ? _worldCupFlag[4][_local_4] : 0)
                            };
                        }
                        else
                        {
                            GoldSchedule["A"][1] = {};
                            GoldSchedule["A"][1] = {
                                "goldLimit":_local_9,
                                "odds":_local_7,
                                "state":4,
                                "group":"B",
                                "team":_local_5,
                                "time":WORLD_CUP_REQUIRE[4]["ft"]["B"],
                                "cost":(((_worldCupFlag[4]) && (_worldCupFlag[4][_local_5])) ? _worldCupFlag[4][_local_5] : 0)
                            };
                        };
                    };
                };
                for (_local_2 in WORLD_CUP_GROUP[2])
                {
                    if (((!(WORLD_CUP_GROUP[2]["A"])) || (!(WORLD_CUP_GROUP[2]["B"]))))
                    {
                        return;
                    };
                    if (!WORLD_CUP_ODDS[2])
                    {
                        return;
                    };
                    _local_4 = replaceAll(WORLD_CUP_GROUP[2]["A"], "|", "");
                    _local_5 = replaceAll(WORLD_CUP_GROUP[2]["B"], "|", "");
                    _local_6 = ((WORLD_CUP_ODDS[2][_local_4]) ? WORLD_CUP_ODDS[2][_local_4] : 0);
                    _local_7 = ((WORLD_CUP_ODDS[2][_local_5]) ? WORLD_CUP_ODDS[2][_local_5] : 0);
                    _local_8 = (((WORLD_CUP_TIME_GOLD_LIMIT[2]) && (WORLD_CUP_TIME_GOLD_LIMIT[2][_local_4])) ? WORLD_CUP_TIME_GOLD_LIMIT[2][_local_4] : 999999999999);
                    _local_9 = (((WORLD_CUP_TIME_GOLD_LIMIT[2]) && (WORLD_CUP_TIME_GOLD_LIMIT[2][_local_5])) ? WORLD_CUP_TIME_GOLD_LIMIT[2][_local_5] : 999999999999);
                    if (((_local_6) && (_local_7)))
                    {
                        if (!GoldSchedule["B"])
                        {
                            GoldSchedule["B"] = {};
                            GoldSchedule["B"][0] = {};
                            GoldSchedule["B"][0] = {
                                "goldLimit":_local_8,
                                "odds":_local_6,
                                "state":2,
                                "group":"A",
                                "team":_local_4,
                                "time":WORLD_CUP_REQUIRE[2]["ft"]["A"],
                                "cost":(((_worldCupFlag[2]) && (_worldCupFlag[2][_local_4])) ? _worldCupFlag[2][_local_4] : 0)
                            };
                        }
                        else
                        {
                            GoldSchedule["B"][1] = {};
                            GoldSchedule["B"][1] = {
                                "goldLimit":_local_9,
                                "odds":_local_7,
                                "state":2,
                                "group":"B",
                                "team":_local_5,
                                "time":WORLD_CUP_REQUIRE[2]["ft"]["B"],
                                "cost":(((_worldCupFlag[2]) && (_worldCupFlag[2][_local_4])) ? _worldCupFlag[2][_local_4] : 0)
                            };
                        };
                    };
                };
            }
            else
            {
                if (GoldScheduleState == 7)
                {
                    for (_local_2 in WORLD_CUP_GROUP[GoldScheduleState])
                    {
                        _local_10 = WORLD_CUP_GROUP[GoldScheduleState][_local_2].split("|");
                        _local_1 = 0;
                        while (_local_1 < _local_10.length)
                        {
                            if (((GamePredef.WORLD_CUP_INFO[_local_10[_local_1]]) && (WORLD_CUP_ODDS[GoldScheduleState][_local_10[_local_1]])))
                            {
                                _local_11 = _local_10[_local_1];
                                _local_12 = WORLD_CUP_ODDS[GoldScheduleState][_local_10[_local_1]];
                                _local_13 = (((WORLD_CUP_TIME_GOLD_LIMIT[GoldScheduleState]) && (WORLD_CUP_TIME_GOLD_LIMIT[GoldScheduleState][_local_11])) ? WORLD_CUP_TIME_GOLD_LIMIT[GoldScheduleState][_local_11] : 999999999999);
                                if (!GoldSchedule[_local_2])
                                {
                                    GoldSchedule[_local_2] = {};
                                    GoldSchedule[_local_2][0] = {};
                                    GoldSchedule[_local_2][0] = {
                                        "goldLimit":_local_13,
                                        "odds":_local_12,
                                        "state":GoldScheduleState,
                                        "group":_local_2,
                                        "team":_local_10[_local_1],
                                        "time":WORLD_CUP_REQUIRE[GoldScheduleState]["ft"][_local_2],
                                        "cost":(((_worldCupFlag[GoldScheduleState]) && (_worldCupFlag[GoldScheduleState][_local_11])) ? _worldCupFlag[GoldScheduleState][_local_11] : 0)
                                    };
                                }
                                else
                                {
                                    GoldSchedule[_local_2][1] = {};
                                    GoldSchedule[_local_2][1] = {
                                        "goldLimit":_local_13,
                                        "odds":_local_12,
                                        "state":GoldScheduleState,
                                        "group":_local_2,
                                        "team":_local_10[_local_1],
                                        "time":WORLD_CUP_REQUIRE[GoldScheduleState]["ft"][_local_2],
                                        "cost":(((_worldCupFlag[GoldScheduleState]) && (_worldCupFlag[GoldScheduleState][_local_11])) ? _worldCupFlag[GoldScheduleState][_local_11] : 0)
                                    };
                                };
                            };
                            _local_1++;
                        };
                    };
                }
                else
                {
                    if (GoldScheduleState < 7)
                    {
                        for (_local_2 in WORLD_CUP_GROUP[GoldScheduleState])
                        {
                            if (!WORLD_CUP_ODDS[GoldScheduleState])
                            {
                                return;
                            };
                            _local_3 = WORLD_CUP_ADD[_local_2];
                            _local_14 = replaceAll(WORLD_CUP_GROUP[GoldScheduleState][_local_2], "|", "");
                            if (((WORLD_CUP_ODDS[GoldScheduleState]) && (WORLD_CUP_ODDS[GoldScheduleState][_local_14])))
                            {
                                _local_12 = WORLD_CUP_ODDS[GoldScheduleState][_local_14];
                                _local_11 = _local_14;
                                _local_13 = (((WORLD_CUP_TIME_GOLD_LIMIT[GoldScheduleState]) && (WORLD_CUP_TIME_GOLD_LIMIT[GoldScheduleState][_local_11])) ? WORLD_CUP_TIME_GOLD_LIMIT[GoldScheduleState][_local_11] : 999999999999);
                                if (!GoldSchedule[_local_3])
                                {
                                    GoldSchedule[_local_3] = {};
                                    GoldSchedule[_local_3][0] = {};
                                    GoldSchedule[_local_3][0] = {
                                        "goldLimit":_local_13,
                                        "odds":_local_12,
                                        "state":GoldScheduleState,
                                        "group":_local_2,
                                        "team":_local_11,
                                        "time":WORLD_CUP_REQUIRE[GoldScheduleState]["ft"][_local_2],
                                        "cost":(((_worldCupFlag[GoldScheduleState]) && (_worldCupFlag[GoldScheduleState][_local_11])) ? _worldCupFlag[GoldScheduleState][_local_11] : 0)
                                    };
                                }
                                else
                                {
                                    GoldSchedule[_local_3][1] = {};
                                    GoldSchedule[_local_3][1] = {
                                        "goldLimit":_local_13,
                                        "odds":_local_12,
                                        "state":GoldScheduleState,
                                        "group":_local_2,
                                        "team":_local_11,
                                        "time":WORLD_CUP_REQUIRE[GoldScheduleState]["ft"][_local_2],
                                        "cost":(((_worldCupFlag[GoldScheduleState]) && (_worldCupFlag[GoldScheduleState][_local_11])) ? _worldCupFlag[GoldScheduleState][_local_11] : 0)
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get img5_C_0():Image
        {
            return (this._734208441img5_C_0);
        }

        private function _WorldCupPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn6 = _local_1;
            _local_1.dataField = "g";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn6", _WorldCupPanel_DataGridColumn6);
            return (_local_1);
        }

        public function set lab5_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2004001989lab5_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2004001989lab5_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab5_A_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labg_1_2():Image
        {
            return (this._1957841313labg_1_2);
        }

        [Bindable(event="propertyChange")]
        public function get lab6_B_0():Label
        {
            return (this._2003077507lab6_B_0);
        }

        [Bindable(event="propertyChange")]
        public function get lab5_D_0():Label
        {
            return (this._2003999106lab5_D_0);
        }

        public function bangSeleByVsPanel(_arg_1:Number):void
        {
            if (initialized)
            {
                this.visible = true;
                bangSele(_arg_1);
            };
        }

        public function set img4_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._735133884img4_A_0;
            if (_local_2 !== _arg_1)
            {
                this._735133884img4_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4_A_0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnNextPage():Button
        {
            return (this._1090881890btnNextPage);
        }

        public function set btnLastPageShop(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._289667927btnLastPageShop;
            if (_local_2 !== _arg_1)
            {
                this._289667927btnLastPageShop = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLastPageShop", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnNextPageShop():Button
        {
            return (this._967394996btnNextPageShop);
        }

        public function __btnNextPageShopGold_buttonDown(_arg_1:FlexEvent):void
        {
            turnPage(true, 2);
        }

        [Bindable(event="propertyChange")]
        public function get txtPageIndicatorShop():TextInput
        {
            return (this._2089469638txtPageIndicatorShop);
        }

        [Bindable(event="propertyChange")]
        public function get img5_A_0():Image
        {
            return (this._734210363img5_A_0);
        }

        [Bindable(event="propertyChange")]
        public function get btn5_A():DelayButton
        {
            return (this._1378851109btn5_A);
        }

        [Bindable(event="propertyChange")]
        public function get btn5_B():DelayButton
        {
            return (this._1378851108btn5_B);
        }

        [Bindable(event="propertyChange")]
        public function get endTime0():Label
        {
            return (this._1715068648endTime0);
        }

        public function __img7_C_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "C");
        }

        public function set introCon(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._582286198introCon;
            if (_local_2 !== _arg_1)
            {
                this._582286198introCon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "introCon", _local_2, _arg_1));
            };
        }

        private function _WorldCupPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn4 = _local_1;
            _local_1.dataField = "tsc";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn4", _WorldCupPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get lab5_B_0():Label
        {
            return (this._2004001028lab5_B_0);
        }

        public function set lab4_B_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2004924549lab4_B_0;
            if (_local_2 !== _arg_1)
            {
                this._2004924549lab4_B_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab4_B_0", _local_2, _arg_1));
            };
        }

        public function __bangBtn0_click(_arg_1:MouseEvent):void
        {
            bangSele(0);
        }

        private function cleanShopCanvas(_arg_1:Number):void
        {
            var _local_2:Number = 0;
            while (_local_2 < 10)
            {
                this[(("item" + _arg_1) + _local_2)].visible = false;
                _local_2++;
            };
        }

        public function set btn2_A(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1378853992btn2_A;
            if (_local_2 !== _arg_1)
            {
                this._1378853992btn2_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn2_A", _local_2, _arg_1));
            };
        }

        public function __img7_F_1_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(1, 7, "F");
        }

        private function _initShopCanvas():void
        {
            _shopMaxIndex = ((Math.ceil((_shopData.length / 10)) > 0) ? Math.ceil((_shopData.length / 10)) : 1);
            _shopGoldMaxIndex = ((Math.ceil((_shopDataGold.length / 10)) > 0) ? Math.ceil((_shopDataGold.length / 10)) : 1);
            goToShopPage(_shopIndex, _shopData, 1);
            goToShopPage(_shopGoldIndex, _shopDataGold, 2);
            txtPageIndicatorShop.text = ((_shopIndex + "/") + _shopMaxIndex);
            txtPageIndicatorShopGold.text = ((_shopGoldIndex + "/") + _shopGoldMaxIndex);
        }

        public function __img6_H_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 6, "H");
        }

        public function set yLab6_A(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832860yLab6_A;
            if (_local_2 !== _arg_1)
            {
                this._2012832860yLab6_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_A", _local_2, _arg_1));
            };
        }

        public function set yLab6_B(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832859yLab6_B;
            if (_local_2 !== _arg_1)
            {
                this._2012832859yLab6_B = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_B", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img4_A_0():Image
        {
            return (this._735133884img4_A_0);
        }

        public function set yLab6_C(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832858yLab6_C;
            if (_local_2 !== _arg_1)
            {
                this._2012832858yLab6_C = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_C", _local_2, _arg_1));
            };
        }

        public function set yLab6_E(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832856yLab6_E;
            if (_local_2 !== _arg_1)
            {
                this._2012832856yLab6_E = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_E", _local_2, _arg_1));
            };
        }

        public function set yLab6_G(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832854yLab6_G;
            if (_local_2 !== _arg_1)
            {
                this._2012832854yLab6_G = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_G", _local_2, _arg_1));
            };
        }

        public function set yLab6_D(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832857yLab6_D;
            if (_local_2 !== _arg_1)
            {
                this._2012832857yLab6_D = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_D", _local_2, _arg_1));
            };
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

        public function ___WorldCupPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initShopData();
        }

        public function set yLab6_H(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832853yLab6_H;
            if (_local_2 !== _arg_1)
            {
                this._2012832853yLab6_H = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_H", _local_2, _arg_1));
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

        public function set bangBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1863324755bangBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1863324755bangBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bangBtn1", _local_2, _arg_1));
            };
        }

        public function set yLab6_F(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012832855yLab6_F;
            if (_local_2 !== _arg_1)
            {
                this._2012832855yLab6_F = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab6_F", _local_2, _arg_1));
            };
        }

        public function set ginfo_grid(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._1829757008ginfo_grid;
            if (_local_2 !== _arg_1)
            {
                this._1829757008ginfo_grid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ginfo_grid", _local_2, _arg_1));
            };
        }

        private function _WorldCupPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn2 = _local_1;
            _local_1.dataField = "name";
            _local_1.width = 100;
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn2", _WorldCupPanel_DataGridColumn2);
            return (_local_1);
        }

        private function tradeAward():void
        {
            bangSele(6);
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

        public function set lab4_A_0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2004925510lab4_A_0;
            if (_local_2 !== _arg_1)
            {
                this._2004925510lab4_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lab4_A_0", _local_2, _arg_1));
            };
        }

        private function set _myTeamSc(_arg_1:Number):void
        {
            var _local_2:Object;
            _local_2 = this._701799496_myTeamSc;
            if (_local_2 !== _arg_1)
            {
                this._701799496_myTeamSc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_myTeamSc", _local_2, _arg_1));
            };
        }

        public function set txtPageIndicator(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1229795408txtPageIndicator;
            if (_local_2 !== _arg_1)
            {
                this._1229795408txtPageIndicator = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPageIndicator", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lab4_B_0():Label
        {
            return (this._2004924549lab4_B_0);
        }

        public function __btn7_C_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("C", 7);
        }

        private function showVsPanel(_arg_1:Number):void
        {
            var _local_4:*;
            var _local_2:Number = (_arg_1 + (ToolKit.minus(_defaultIndex, 1) * 2));
            var _local_3:Number = getServerTime();
            if (_showObject[_local_2])
            {
                if (ToolKit.isSmallOrEqual(_showObject[_local_2][0]["time"], _local_3))
                {
                    _core.sysMsg(Language.WORLD_CUP_PANEL[34]);
                    return;
                };
                _local_4 = _core.view.getUI(ViewManager.PANEL_WORLD_CUP_VS);
                if (_local_4)
                {
                    _local_4.initWorldCupVSPanel(_showObject[_local_2]);
                };
            };
        }

        public function set img3_A_0(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._736057405img3_A_0;
            if (_local_2 !== _arg_1)
            {
                this._736057405img3_A_0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3_A_0", _local_2, _arg_1));
            };
        }

        private function worldCupTimeAward():void
        {
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            if (_timeAward.indexOf("vs") < 0)
            {
                _timeAward = Language.WORLD_CUP_PANEL[29];
            };
            _alert = Alert.show(_timeAward, null, Alert.YES, null, null);
            var _local_1:IUITextField = _alert.mx_internal::alertForm.mx_internal::textField;
            _local_1.htmlText = _timeAward;
            _local_1.filters = GamePredef.FILTER_TEXT1;
        }

        public function __img4_B_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 4, "B");
        }

        [Bindable(event="propertyChange")]
        public function get ginfo_grid():DataGrid
        {
            return (this._1829757008ginfo_grid);
        }

        [Bindable(event="propertyChange")]
        public function get txtPageIndicator():TextInput
        {
            return (this._1229795408txtPageIndicator);
        }

        public function __btnLastPageShopGold_buttonDown(_arg_1:FlexEvent):void
        {
            turnPage(false, 2);
        }

        public function set yLab5_A(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012833821yLab5_A;
            if (_local_2 !== _arg_1)
            {
                this._2012833821yLab5_A = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab5_A", _local_2, _arg_1));
            };
        }

        public function set yLab5_B(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012833820yLab5_B;
            if (_local_2 !== _arg_1)
            {
                this._2012833820yLab5_B = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab5_B", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img3_A_0():Image
        {
            return (this._736057405img3_A_0);
        }

        public function __btn7_H_click(_arg_1:MouseEvent):void
        {
            saveCalculateResultOnKnockOut("H", 7);
        }

        public function set yLab5_C(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012833819yLab5_C;
            if (_local_2 !== _arg_1)
            {
                this._2012833819yLab5_C = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab5_C", _local_2, _arg_1));
            };
        }

        public function set yLab5_D(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2012833818yLab5_D;
            if (_local_2 !== _arg_1)
            {
                this._2012833818yLab5_D = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yLab5_D", _local_2, _arg_1));
            };
        }

        public function onGetWorldCupShopLimitDataTcnByPve(_arg_1:Object):void
        {
            if (initialized)
            {
                if (_arg_1)
                {
                    WORLD_CUP_LIMIT_1 = _arg_1;
                    _initShopCanvas();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get yLab5_A():Label
        {
            return (this._2012833821yLab5_A);
        }

        [Bindable(event="propertyChange")]
        public function get yLab5_B():Label
        {
            return (this._2012833820yLab5_B);
        }

        [Bindable(event="propertyChange")]
        public function get yLab5_C():Label
        {
            return (this._2012833819yLab5_C);
        }

        [Bindable(event="propertyChange")]
        public function get yLab5_D():Label
        {
            return (this._2012833818yLab5_D);
        }

        public function __img7_B_0_click(_arg_1:MouseEvent):void
        {
            calculateWorldCupGroupOnKnockOut(0, 7, "B");
        }

        private function update32thCanvasByGroup(_arg_1:String):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:String;
            var _local_5:*;
            var _local_6:*;
            var _local_7:*;
            if (((WORLD_CUP_GROUP) && (WORLD_CUP_GROUP[8])))
            {
                if (WORLD_CUP_GROUP[8][_arg_1])
                {
                    _local_2 = _arg_1;
                    _local_3 = "xz1";
                    if (_groupCanvasId[_local_2])
                    {
                        _local_3 = _groupCanvasId[_local_2];
                    }
                    else
                    {
                        return;
                    };
                    this[_local_3].group = _local_2;
                    this[_local_3].teamInfo = WORLD_CUP_GROUP[8][_local_2];
                    this[_local_3].teamChar = ((((_charData) && (_charData[8])) && (_charData[8][_local_2])) ? _charData[8][_local_2] : {});
                    _local_4 = "|";
                    if (WORLD_CUP_GROUP[7])
                    {
                        _local_5 = WORLD_CUP_GROUP[8][_local_2].split("|");
                        _local_6 = 0;
                        while (_local_6 < _local_5.length)
                        {
                            if (GamePredef.WORLD_CUP_INFO[_local_5[_local_6]])
                            {
                                for (_local_7 in WORLD_CUP_GROUP[7])
                                {
                                    if (WORLD_CUP_GROUP[7][_local_7].indexOf((("|" + _local_5[_local_6]) + "|")) >= 0)
                                    {
                                        _local_4 = ((_local_4 + _local_5[_local_6]) + "|");
                                    };
                                };
                            };
                            _local_6++;
                        };
                    };
                    this[_local_3].teamRealy = ((_local_4 != "|") ? _local_4 : null);
                    this[_local_3].updateInfo();
                };
            };
        }

        private function _WorldCupPanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _WorldCupPanel_DataGridColumn14 = _local_1;
            _local_1.dataField = "point";
            _local_1.width = 110;
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_WorldCupPanel_DataGridColumn14", _WorldCupPanel_DataGridColumn14);
            return (_local_1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

