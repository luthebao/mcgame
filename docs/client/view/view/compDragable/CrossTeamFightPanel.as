// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossTeamFightPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.CrossTeamFightResultInfo;
    import mx.controls.Label;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.CrossTeamFightAwardRect;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.ShopSlot;
    import com.qeedoo.ui.view.comp.TeamCrossFightWinnerModel;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.controls.LinkButton;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.containers.Canvas;
    import mx.containers.VBox;
    import mx.core.Repeater;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.controls.Text;
    import mx.controls.TextInput;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ButtonTree;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.CrossTeamFightActiveLine;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.TextEvent;
    import mx.managers.PopUpManager;
    import mx.events.FlexEvent;
    import flash.events.Event;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.view.comp.Currency;
    import mx.events.ListEvent;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.binding.Binding;
    import mx.binding.RepeatableBinding;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.core.ClassFactory;
    import flash.utils.setTimeout;
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

    public class CrossTeamFightPanel extends DragableCanvas implements IBindingClient 
    {

        public static var tabSelect:String = "A";
        private static var WANT_ENROLL:int = 0;
        private static var LOOK_AWARD:int = 1;
        private static var WORSHIP_CHAMPION:int = 2;
        private static var GOOD_EVENTS:int = 3;
        private static var ACTIVE_INFO:int = 4;
        public static const TEAM_CROSSPK_NUM_MIN:int = 3;
        public static const TEAM_CROSSPK_NUM_MAX:int = 4;
        public static var BET_BASIC_AWARD_GOLD:int = 1000;
        public static var original_server_id:int = 0;
        public static var TEAM_CROSSPK_STATE:int = 0;
        public static var TEAM_CROSSPK_GROUP:String = "";
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3586r4:CrossTeamFightResultInfo;
        private var _2105887624enterTxt:Label;
        private var _95838b40:Image;
        private var _1405038217award4:CrossTeamFightAwardRect;
        private var _3773vs:ViewStack;
        private var _741819080mobaiItem3:ShopSlot;
        private var _3585r3:CrossTeamFightResultInfo;
        private var _1349781458winner1:TeamCrossFightWinnerModel;
        public var _CrossTeamFightPanel_Label10:Label;
        public var _CrossTeamFightPanel_Label11:Label;
        public var _CrossTeamFightPanel_Label12:Label;
        public var _CrossTeamFightPanel_Label13:Label;
        public var _CrossTeamFightPanel_Label14:Label;
        public var _CrossTeamFightPanel_Label15:Label;
        public var _CrossTeamFightPanel_Label16:Label;
        public var _CrossTeamFightPanel_Label17:Label;
        private var myTeamName:String = "";
        private var _1349781460winner3:TeamCrossFightWinnerModel;
        private var _1527580306betAwardItem1:ItemSlot;
        private var _93627085bet40:CharactorShowCanvas;
        private var _95839b41:Image;
        private var _3584r2:CrossTeamFightResultInfo;
        public var _CrossTeamFightPanel_IntroText1:IntroText;
        private var _1943366614enrollBtn:DelayButton;
        public var _CrossTeamFightPanel_LinkButton2:LinkButton;
        private var _606510598awardVs:ViewStack;
        public var _CrossTeamFightPanel_DataGridColumn1:DataGridColumn;
        public var _CrossTeamFightPanel_DataGridColumn2:DataGridColumn;
        public var _CrossTeamFightPanel_DataGridColumn3:DataGridColumn;
        public var _CrossTeamFightPanel_DataGridColumn4:DataGridColumn;
        public var _CrossTeamFightPanel_DataGridColumn5:DataGridColumn;
        public var _CrossTeamFightPanel_DataGridColumn6:DataGridColumn;
        private var _95840b42:Image;
        public var _CrossTeamFightPanel_LinkButton1:LinkButton;
        private var _95776b20:Image;
        private var _3583r1:CrossTeamFightResultInfo;
        private var _1061804302activeTitle:Image;
        private var _995049767newEvents:Canvas;
        private var betTopData:Object;
        private var _1202542159_CrossTeamFightPanel_VBox1:VBox;
        private var activeInfoDataIndex:int = 0;
        private var _1405038216award5:CrossTeamFightAwardRect;
        private var _1069198439activeLines:Repeater;
        private var _931102315right1:Image;
        private var _3582r0:CrossTeamFightResultInfo;
        private var _95841b43:Image;
        private var _93627086bet41:CharactorShowCanvas;
        public var _CrossTeamFightPanel_Image24:Image;
        private var _95807b30:Image;
        private var _helpAlert:Alert;
        private var _1349781459winner2:TeamCrossFightWinnerModel;
        private var _1076583778basicBetAwardBtn:BasicDelayButton;
        public var _CrossTeamFightPanel_Label1:Label;
        public var _CrossTeamFightPanel_Label7:Label;
        public var _CrossTeamFightPanel_Label8:Label;
        private var pkList:Object;
        private var TEAM_MOBAI_AWARD1_ID:int = 3980;
        private var _1668760952teamName:Label;
        private var _1625641593activeInfo3Link:Text;
        private var _1691059654enrollLeftTime:Label;
        private var _1071827490activeInfo2:Canvas;
        private var _2024477937tnameTxt:TextInput;
        private var _1405038221award0:CrossTeamFightAwardRect;
        private var _95808b31:Image;
        private var betAwardItem:Array;
        private var _956155768crossFightTitle:BasicTitleCanvas;
        private var _3591r9:CrossTeamFightResultInfo;
        private var _1405038215award6:CrossTeamFightAwardRect;
        private var _93627087bet42:CharactorShowCanvas;
        private var TEAM_MOBAI_AWARD2_ID:int = 3981;
        private var _931102314right2:Image;
        private var _111121r10:CrossTeamFightResultInfo;
        private var _741819082mobaiItem1:ShopSlot;
        private var _1115713974horizontalCenterPre:Image;
        private var _1152106799timeNowActive:Label;
        private var _3590r8:CrossTeamFightResultInfo;
        private var _93627054bet30:CharactorShowCanvas;
        private var _1732790552activeLookBeforeBtn:DelayButton;
        private var _492833031totalGoldAward:DataGrid;
        private var _1527580307betAwardItem2:ItemSlot;
        private var TEAM_MOBAI_AWARD3_ID:int = 3982;
        private var _781771656newEvents1:Canvas;
        private var _111122r11:CrossTeamFightResultInfo;
        private var _1165556831worshipChampion:Canvas;
        private var _1405038220award1:CrossTeamFightAwardRect;
        private var _93627088bet43:CharactorShowCanvas;
        private var _3552079tabD:BasicGlowButton;
        private var _959684357timeStartActive:Label;
        private var _613486105worshipChampionTitle2:Label;
        private var _1405038214award7:CrossTeamFightAwardRect;
        private var askAlert:Alert;
        private var _1679899599awardMapTxt:Label;
        private var _1313061411goldAward:DataGrid;
        private var _2024469518tnameLab:Label;
        private var _111123r12:CrossTeamFightResultInfo;
        private var _931102313right3:Image;
        private var betOpen:Boolean = false;
        private var awardsData:Object;
        private var _93627055bet31:CharactorShowCanvas;
        private var activelookBefore:Boolean = false;
        private var _1342671666activeLinesVbox:VBox;
        private var _112396935vote1:BasicDelayButton;
        private var _1313943351timeNow:Label;
        private var awardMaps:Array;
        private var _1405038219award2:CrossTeamFightAwardRect;
        private var _1436101625rightIMG:Image;
        private var _672450494leftTreeTeam:Canvas;
        private var _1071827491activeInfo1:Canvas;
        private var _850743920betAwardBtn:BasicDelayButton;
        private var _1527580305betAwardItem0:ItemSlot;
        private var _3552078tabC:BasicGlowButton;
        private var _111124r13:CrossTeamFightResultInfo;
        private var betAwardItems:Array;
        private var betView:CrossTeamFightBetPanel;
        private var _951530617content:Canvas;
        private var _1102515966lookAward:Canvas;
        private var _741819081mobaiItem2:ShopSlot;
        private var nextBattleTime:Number = 0;
        private var _227466196horizontalCenterNext:Image;
        private var _112396936vote2:BasicDelayButton;
        private var TEAM_MOBAI_COST1:int = 200000;
        private var TEAM_MOBAI_COST3:int = 100;
        private var _1071827489activeInfo3:Canvas;
        private var _111125r14:CrossTeamFightResultInfo;
        private var _1534883038newEventsBG:Image;
        private var _1824931916betAward:BasicGlowButton;
        private var _3552077tabB:BasicGlowButton;
        private var _3589r7:CrossTeamFightResultInfo;
        private var _781771655newEvents2:Canvas;
        private var _25573781timeStart:Label;
        private var TEAM_MOBAI_COST2:int = 10;
        private var betTeamData:Object;
        private var _93627023bet20:CharactorShowCanvas;
        private var _1405038218award3:CrossTeamFightAwardRect;
        private var _1349781457winner0:TeamCrossFightWinnerModel;
        private var _1386162971treeTeam:ButtonTree;
        public var _CrossTeamFightPanel_CrossTeamFightActiveLine1:Array;
        private var pkFinalList:Object;
        private var _1849065287newEventsImg1:Image;
        private var _3588r6:CrossTeamFightResultInfo;
        private var _973530507gameAward:BasicGlowButton;
        private var _1668897621teamInfo:Label;
        private var _2025761775activeInfo3Txt:Image;
        private var _2105905052enterBtn:DelayButton;
        private var _1527580308betAwardItem3:ItemSlot;
        public var _CrossTeamFightPanel_Image1:Image;
        public var _CrossTeamFightPanel_Image2:Image;
        public var _CrossTeamFightPanel_Image3:Image;
        public var _CrossTeamFightPanel_Image4:Image;
        public var _CrossTeamFightPanel_Image5:Image;
        public var _CrossTeamFightPanel_Image6:Image;
        private var _112396937vote3:BasicDelayButton;
        private var _3552076tabA:BasicGlowButton;
        private var _1133086745activeInfoBG:Image;
        private var _3587r5:CrossTeamFightResultInfo;
        private var _613486104worshipChampionTitle1:Label;
        private var betData:Object;
        private var _2043634900activeInfo:Canvas;
        private var _752368938wantEnroll:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":800,
                    "height":560,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"crossFightTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"leftTreeTeam",
                        "stylesFactory":function ():void
                        {
                            this.top = "50";
                            this.left = "12";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"RoundedGradientBorder",
                                "height":465,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_CrossTeamFightPanel_Image1"
                                }), new UIComponentDescriptor({
                                    "type":ButtonTree,
                                    "id":"treeTeam",
                                    "events":{"itemClick":"__treeTeam_itemClick"},
                                    "stylesFactory":function ():void
                                    {
                                        this.borderStyle = "none";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":105,
                                            "x":10,
                                            "height":270,
                                            "y":25
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"content",
                        "stylesFactory":function ():void
                        {
                            this.top = "50";
                            this.left = "120";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":680,
                                "height":508,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"vs",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":660,
                                            "height":0x0200,
                                            "x":10,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"wantEnroll",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":500,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_CrossTeamFightPanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 18;
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":398,
                                                                    "height":32,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":435,
                                                                    "x":10,
                                                                    "y":30,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossTeamFightPanel_Image2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_CrossTeamFightPanel_IntroText1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":612,
                                                                                "height":330,
                                                                                "y":15,
                                                                                "visible":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"tnameLab",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 18;
                                                                            this.color = 0xFFFF00;
                                                                            this.fontWeight = "bold";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":25,
                                                                                "y":350,
                                                                                "width":160
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"tnameTxt",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":165,
                                                                                "y":350,
                                                                                "width":300,
                                                                                "maxChars":8,
                                                                                "enabled":true
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"enrollBtn",
                                                                        "events":{"click":"__enrollBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "y":380,
                                                                                "width":95
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"enterTxt",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":350,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"enterBtn",
                                                                        "events":{"click":"__enterBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "y":380,
                                                                                "width":95
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"teamName",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.color = 0xFFFF00;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":350,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"teamInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.color = 0xFFFF00;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":380,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"enrollLeftTime",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontWeight = "bold";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":410,
                                                                                "percentWidth":100
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
                                                "id":"lookAward",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"gameAward",
                                                            "events":{"click":"__gameAward_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":true,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"betAward",
                                                            "events":{"click":"__betAward_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "85";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ViewStack,
                                                            "id":"awardVs",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":435,
                                                                    "x":10,
                                                                    "y":30,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":0,
                                                                                "y":0,
                                                                                "styleName":"CanvasBorder",
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_CrossTeamFightPanel_Image3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":2,
                                                                                            "y":2
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label7",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 18;
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":398,
                                                                                            "height":32,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label8",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontWeight = "bold";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.left = "15";
                                                                                        this.top = "42";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award0",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "65";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":0});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "135";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":1});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.right = "30";
                                                                                        this.top = "65";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":2});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.right = "30";
                                                                                        this.top = "135";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":3});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"awardMapTxt",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontWeight = "bold";
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.left = "30";
                                                                                        this.textAlign = "left";
                                                                                        this.top = "205";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":610});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label10",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontWeight = "bold";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.left = "15";
                                                                                        this.top = "230";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "253";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":4});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award5",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "30";
                                                                                        this.top = "323";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":5});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label11",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontWeight = "bold";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.left = "15";
                                                                                        this.top = "300";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award6",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.right = "30";
                                                                                        this.top = "253";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":6});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CrossTeamFightAwardRect,
                                                                                    "id":"award7",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.right = "30";
                                                                                        this.top = "323";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"index":7});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "x":0,
                                                                                "y":0,
                                                                                "styleName":"CanvasBorder",
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_CrossTeamFightPanel_Image4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":2,
                                                                                            "y":2
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label12",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 18;
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":398,
                                                                                            "height":32,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label13",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF00;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":200,
                                                                                            "height":32,
                                                                                            "x":15,
                                                                                            "y":42
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":15,
                                                                                            "y":70,
                                                                                            "width":380,
                                                                                            "height":210,
                                                                                            "styleName":"CanvasBorder",
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "verticalScrollPolicy":"off",
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":DataGrid,
                                                                                                "id":"goldAward",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "selectable":false,
                                                                                                        "x":5,
                                                                                                        "y":5,
                                                                                                        "width":370,
                                                                                                        "height":200,
                                                                                                        "verticalScrollPolicy":"off",
                                                                                                        "columns":[_CrossTeamFightPanel_DataGridColumn1_i(), _CrossTeamFightPanel_DataGridColumn2_i(), _CrossTeamFightPanel_DataGridColumn3_i(), _CrossTeamFightPanel_DataGridColumn4_i(), _CrossTeamFightPanel_DataGridColumn5_i()]
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
                                                                                            "x":400,
                                                                                            "y":80,
                                                                                            "width":156,
                                                                                            "height":60,
                                                                                            "styleName":"CanvasBorder",
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "verticalScrollPolicy":"off",
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":DataGrid,
                                                                                                "id":"totalGoldAward",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 14;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "selectable":false,
                                                                                                        "x":5,
                                                                                                        "y":5,
                                                                                                        "width":370,
                                                                                                        "height":190,
                                                                                                        "verticalScrollPolicy":"off",
                                                                                                        "columns":[_CrossTeamFightPanel_DataGridColumn6_i()]
                                                                                                    });
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"betAwardBtn",
                                                                                    "events":{"click":"__betAwardBtn_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "x":400,
                                                                                            "y":150,
                                                                                            "width":75,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label14",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "percentWidth":100,
                                                                                            "height":32,
                                                                                            "y":285
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label15",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "15";
                                                                                        this.color = 0xFFFF00;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":398,
                                                                                            "height":32,
                                                                                            "y":310
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":15,
                                                                                            "y":338,
                                                                                            "width":270,
                                                                                            "height":48,
                                                                                            "styleName":"CanvasBorder",
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "verticalScrollPolicy":"off",
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_CrossTeamFightPanel_Label16",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.verticalCenter = "0";
                                                                                                    this.color = 0xFFFFFF;
                                                                                                    this.fontWeight = "bold";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"x":15});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":ItemSlot,
                                                                                                "id":"betAwardItem0",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.verticalCenter = "0";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":100,
                                                                                                        "movable":false
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":ItemSlot,
                                                                                                "id":"betAwardItem1",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.verticalCenter = "0";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":135,
                                                                                                        "movable":false
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":ItemSlot,
                                                                                                "id":"betAwardItem2",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.verticalCenter = "0";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":170,
                                                                                                        "movable":false
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":ItemSlot,
                                                                                                "id":"betAwardItem3",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.verticalCenter = "0";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":205,
                                                                                                        "movable":false
                                                                                                    });
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"basicBetAwardBtn",
                                                                                    "events":{"click":"__basicBetAwardBtn_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnNormalBlue",
                                                                                            "x":306,
                                                                                            "y":368,
                                                                                            "width":75,
                                                                                            "height":20
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_CrossTeamFightPanel_Label17",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":446,
                                                                                            "height":32,
                                                                                            "x":15,
                                                                                            "y":390
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_CrossTeamFightPanel_LinkButton1",
                                                            "events":{"click":"___CrossTeamFightPanel_LinkButton1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textDecoration = "underline";
                                                                this.right = "30";
                                                                this.bottom = "5";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":73,
                                                                    "height":17
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"worshipChampion",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"tabA",
                                                            "events":{"click":"__tabA_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "15";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":true,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"tabB",
                                                            "events":{"click":"__tabB_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "85";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"tabC",
                                                            "events":{"click":"__tabC_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "155";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"tabD",
                                                            "events":{"click":"__tabD_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "225";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "selected":false,
                                                                    "styleName":"HorizontalTab",
                                                                    "width":68,
                                                                    "y":8
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":435,
                                                                    "x":10,
                                                                    "y":30,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"_CrossTeamFightPanel_Image5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":2,
                                                                                "y":2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.top = "3";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":286,
                                                                                "height":100,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_CrossTeamFightPanel_Image6",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":0});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"worshipChampionTitle1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textAlign = "center";
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.fontSize = 14;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":130,
                                                                                            "y":40
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"worshipChampionTitle2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textAlign = "center";
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "percentWidth":100,
                                                                                            "y":80
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
                                                                                "percentWidth":100,
                                                                                "height":340,
                                                                                "x":0,
                                                                                "y":0,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":TeamCrossFightWinnerModel,
                                                                                    "id":"winner2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":25,
                                                                                            "y":35
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":TeamCrossFightWinnerModel,
                                                                                    "id":"winner3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":440,
                                                                                            "y":35
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":TeamCrossFightWinnerModel,
                                                                                    "id":"winner1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":320,
                                                                                            "y":150
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":TeamCrossFightWinnerModel,
                                                                                    "id":"winner0",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":137,
                                                                                            "y":150
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
                                                                                "percentWidth":100,
                                                                                "x":0,
                                                                                "y":360,
                                                                                "height":95,
                                                                                "horizontalScrollPolicy":"off",
                                                                                "verticalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ShopSlot,
                                                                                    "id":"mobaiItem1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-200";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":0});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ShopSlot,
                                                                                    "id":"mobaiItem2",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":0});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ShopSlot,
                                                                                    "id":"mobaiItem3",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "200";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":0});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"vote1",
                                                                                    "events":{"click":"__vote1_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-200";
                                                                                        this.bottom = "30";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "enabled":false,
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":90
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"vote2",
                                                                                    "events":{"click":"__vote2_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.bottom = "30";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "enabled":false,
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":90
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"vote3",
                                                                                    "events":{"click":"__vote3_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "200";
                                                                                        this.bottom = "30";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "enabled":false,
                                                                                            "styleName":"BtnNormalRed",
                                                                                            "width":90
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkButton,
                                                            "id":"_CrossTeamFightPanel_LinkButton2",
                                                            "events":{"click":"___CrossTeamFightPanel_LinkButton2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textDecoration = "underline";
                                                                this.right = "30";
                                                                this.bottom = "5";
                                                                this.color = 0xFFFFFF;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":73,
                                                                    "height":17
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"newEvents",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":435,
                                                                    "x":10,
                                                                    "y":30,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"newEventsBG",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "id":"newEvents1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"newEventsImg1"
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "id":"newEvents2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"right1",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "8";
                                                                                        this.top = "8";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"right3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":0,
                                                                                            "y":0
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"right2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":462,
                                                                                            "y":106
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"rightIMG",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.top = "5";
                                                                                        this.right = "5";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"timeNow",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.bottom = "10";
                                                                                        this.right = "20";
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":120});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"timeStart",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.bottom = "30";
                                                                                        this.right = "20";
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":120});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r0",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r1",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":63
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r2",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":117
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r3",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":167
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r4",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":222
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r5",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":273
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r6",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":326
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r7",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":10,
                                                                                                        "y":377
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r8",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":214,
                                                                                                        "y":37
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r9",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":214,
                                                                                                        "y":142
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r10",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":214,
                                                                                                        "y":248
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r11",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":214,
                                                                                                        "y":353
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r12",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":392,
                                                                                                        "y":90
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r13",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":392,
                                                                                                        "y":301
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":CrossTeamFightResultInfo,
                                                                                                "id":"r14",
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "x":488,
                                                                                                        "y":195
                                                                                                    });
                                                                                                }
                                                                                            })]});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet40",
                                                                                    "events":{"click":"__bet40_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "-160";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet41",
                                                                                    "events":{"click":"__bet41_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "-56";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet42",
                                                                                    "events":{"click":"__bet42_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "49";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet43",
                                                                                    "events":{"click":"__bet43_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "156";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet30",
                                                                                    "events":{"click":"__bet30_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "35";
                                                                                        this.verticalCenter = "-105";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet31",
                                                                                    "events":{"click":"__bet31_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "35";
                                                                                        this.verticalCenter = "105";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CharactorShowCanvas,
                                                                                    "id":"bet20",
                                                                                    "events":{"click":"__bet20_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "125";
                                                                                        this.verticalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "height":35,
                                                                                            "width":45,
                                                                                            "visible":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b40",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "-160";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b41",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "-56";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b42",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "49";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b43",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-142";
                                                                                        this.verticalCenter = "156";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b30",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "35";
                                                                                        this.verticalCenter = "-105";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b31",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "35";
                                                                                        this.verticalCenter = "105";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"b20",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "125";
                                                                                        this.verticalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"visible":false});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"activeInfo",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "height":435,
                                                                    "x":10,
                                                                    "y":30,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"activeInfoBG"
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "id":"activeInfo1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "percentWidth":100,
                                                                                "percentHeight":100,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":DelayButton,
                                                                                    "id":"activeLookBeforeBtn",
                                                                                    "events":{"click":"__activeLookBeforeBtn_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.verticalCenter = "70";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "enabled":false,
                                                                                            "visible":false,
                                                                                            "clickDelay":3000,
                                                                                            "styleName":"CrystalYellowButton"
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"timeNowActive",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "30";
                                                                            this.right = "0";
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":120});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"timeStartActive",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.top = "10";
                                                                            this.right = "0";
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"width":120});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "id":"activeInfo2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"activeTitle",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-50";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":2,
                                                                                            "y":2
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"horizontalCenterPre",
                                                                                    "events":{"click":"__horizontalCenterPre_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "-250";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":10,
                                                                                            "buttonMode":true
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"horizontalCenterNext",
                                                                                    "events":{"click":"__horizontalCenterNext_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "150";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":10,
                                                                                            "buttonMode":true
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.borderColor = 2982535;
                                                                                        this.borderThickness = 3;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":636,
                                                                                            "height":350,
                                                                                            "x":10,
                                                                                            "y":70,
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":VBox,
                                                                                                "id":"activeLinesVbox",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.horizontalGap = 0;
                                                                                                    this.right = "0";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "percentWidth":100,
                                                                                                        "y":0,
                                                                                                        "percentHeight":100,
                                                                                                        "horizontalScrollPolicy":"off",
                                                                                                        "verticalScrollPolicy":"off",
                                                                                                        "childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":Repeater,
                                                                                                            "id":"activeLines",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                                        "type":CrossTeamFightActiveLine,
                                                                                                                        "id":"_CrossTeamFightPanel_CrossTeamFightActiveLine1"
                                                                                                                    })]});
                                                                                                            }
                                                                                                        })]
                                                                                                    });
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                })]});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "id":"activeInfo3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_CrossTeamFightPanel_Image24",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":0,
                                                                                            "y":0
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"activeInfo3Txt",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.verticalCenter = "-50";
                                                                                        this.horizontalCenter = "0";
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Text,
                                                                                    "id":"activeInfo3Link",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.verticalCenter = "0";
                                                                                        this.horizontalCenter = "0";
                                                                                        this.textAlign = "center";
                                                                                    }
                                                                                })]});
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
                    })]
                });
            }
        });
        private var tabKey:Array = ["A", "B", "C", "D"];
        private var _core:Core = Core.getInstance();
        private var _1258317735awardData:ArrayCollection = new ArrayCollection();
        private var _577663548totalGold:ArrayCollection = new ArrayCollection();
        private var activeInfoData:Object = {};
        private var activeInfoNum:Object = {};
        private var activeInfoIMGArr:Array = [4130220000244, 4130220000241, 4130220000245, 4130220000246, 4130220000247, 4130220000248, 4130220000249, 4130220000250, 4130220000251, 4130220000252];
        private var activeInfoIMGArrFinal:Array = [4130220000253, 4130220000254, 4130220000255, 4130220000256, 4130220000257, 4130220000258, 4130220000259, 4130220000260, 4130220000261, 4130220000262];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossTeamFightPanel()
        {
            mx_internal::_document = this;
            this.width = 800;
            this.height = 560;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = false;
            this.addEventListener("creationComplete", ___CrossTeamFightPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossTeamFightPanel._watcherSetupUtil = _arg_1;
        }


        public function set r2(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3584r2;
            if (_local_2 !== _arg_1)
            {
                this._3584r2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r2", _local_2, _arg_1));
            };
        }

        public function set r4(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3586r4;
            if (_local_2 !== _arg_1)
            {
                this._3586r4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r4", _local_2, _arg_1));
            };
        }

        private function toVote(index:int):void
        {
            var cost:int;
            cost = 0;
            if (index == 0)
            {
                cost = TEAM_MOBAI_COST1;
            }
            else
            {
                if (index == 1)
                {
                    cost = TEAM_MOBAI_COST2;
                }
                else
                {
                    if (index == 2)
                    {
                        cost = TEAM_MOBAI_COST3;
                    }
                    else
                    {
                        return;
                    };
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    if (index == 0)
                    {
                        if (_core.player.money < cost)
                        {
                            Alert.show(Language.GUILDCONTRIBPANEL_U[2]);
                        };
                    }
                    else
                    {
                        if (_core.player.gold < cost)
                        {
                            Alert.show(Language.GUILDCONTRIBPANEL_U[1]);
                        };
                    };
                    _core.remote.call("teamCrossPKMobai", new Responder(onBuy), index);
                };
            };
            var str:String = Language.CROSS_FIGHT_PANEL_U[36];
            var name:String = Language.CROSS_FIGHT_PANEL_U[37];
            if (index > 0)
            {
                name = Language.GAMEPREDEF_S[49];
            };
            str = str.replace("{num}", cost).replace("{name}", name);
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        public function set r5(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3587r5;
            if (_local_2 !== _arg_1)
            {
                this._3587r5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r5", _local_2, _arg_1));
            };
        }

        private function awardTab(_arg_1:int):void
        {
            if (((_arg_1 == 1) && (!(betOpen))))
            {
                Alert.show(Language.CROSS_FIGHT_PANEL_U[172], Language.CROSS_FIGHT_PANEL_U[172].toString(), Alert.YES, null, null);
                return;
            };
            gameAward.selected = (_arg_1 == 0);
            betAward.selected = (_arg_1 == 1);
            awardVs.selectedIndex = _arg_1;
            if (_arg_1 == 1)
            {
                _core.remote.call("teamCrossPKGetBetData", new Responder(onGetBetData));
            };
        }

        public function set r6(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3588r6;
            if (_local_2 !== _arg_1)
            {
                this._3588r6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r6", _local_2, _arg_1));
            };
        }

        public function set r3(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3585r3;
            if (_local_2 !== _arg_1)
            {
                this._3585r3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r3", _local_2, _arg_1));
            };
        }

        public function set r7(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3589r7;
            if (_local_2 !== _arg_1)
            {
                this._3589r7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r7", _local_2, _arg_1));
            };
        }

        public function set r0(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3582r0;
            if (_local_2 !== _arg_1)
            {
                this._3582r0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r0", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossTeamFightPanel_DataGridColumn5 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "award";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossTeamFightPanel_DataGridColumn5", _CrossTeamFightPanel_DataGridColumn5);
            return (_local_1);
        }

        public function set r9(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3591r9;
            if (_local_2 !== _arg_1)
            {
                this._3591r9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r9", _local_2, _arg_1));
            };
        }

        public function __bet20_click(_arg_1:MouseEvent):void
        {
            toBet(2, 0);
        }

        [Bindable(event="propertyChange")]
        public function get activeInfo3Txt():Image
        {
            return (this._2025761775activeInfo3Txt);
        }

        public function set r8(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3590r8;
            if (_local_2 !== _arg_1)
            {
                this._3590r8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r8", _local_2, _arg_1));
            };
        }

        public function set rightIMG(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1436101625rightIMG;
            if (_local_2 !== _arg_1)
            {
                this._1436101625rightIMG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightIMG", _local_2, _arg_1));
            };
        }

        public function __bet31_click(_arg_1:MouseEvent):void
        {
            toBet(3, 1);
        }

        [Bindable(event="propertyChange")]
        public function get activeInfoBG():Image
        {
            return (this._1133086745activeInfoBG);
        }

        private function toBet(_arg_1:int, _arg_2:int):void
        {
            if (((((!(activeInfoData)) || (!(activeInfoData[TEAM_CROSSPK_GROUP]))) || (!(activeInfoData[TEAM_CROSSPK_GROUP][_arg_1]))) || (!(activeInfoData[TEAM_CROSSPK_GROUP][_arg_1][_arg_2]))))
            {
                return;
            };
            var _local_3:Object = activeInfoData[TEAM_CROSSPK_GROUP][_arg_1][_arg_2];
            var _local_4:Object = ViewManager.getInstance().getUI(ViewManager.PANEL_CROSS_TEAM_FIGHT_BET);
            if (_local_4)
            {
                _local_4.open(_local_3, nextBattleTime, TEAM_CROSSPK_STATE);
            };
        }

        [Bindable(event="propertyChange")]
        public function get rightIMG():Image
        {
            return (this._1436101625rightIMG);
        }

        private function getData():void
        {
            _core.remote.call("teamCrossPKGetData", new Responder(onGetData));
        }

        public function set activeInfo3Txt(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._2025761775activeInfo3Txt;
            if (_local_2 !== _arg_1)
            {
                this._2025761775activeInfo3Txt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfo3Txt", _local_2, _arg_1));
            };
        }

        private function onBuy(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:String = Language.CROSS_FIGHT_PANEL_U[_arg_1];
            _core.sysMsg(_local_2);
        }

        public function set r13(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._111124r13;
            if (_local_2 !== _arg_1)
            {
                this._111124r13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r13", _local_2, _arg_1));
            };
        }

        public function set r10(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._111121r10;
            if (_local_2 !== _arg_1)
            {
                this._111121r10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r10", _local_2, _arg_1));
            };
        }

        public function set r14(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._111125r14;
            if (_local_2 !== _arg_1)
            {
                this._111125r14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r14", _local_2, _arg_1));
            };
        }

        public function set r11(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._111122r11;
            if (_local_2 !== _arg_1)
            {
                this._111122r11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get horizontalCenterNext():Image
        {
            return (this._227466196horizontalCenterNext);
        }

        public function set r12(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._111123r12;
            if (_local_2 !== _arg_1)
            {
                this._111123r12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tnameLab():Label
        {
            return (this._2024469518tnameLab);
        }

        [Bindable(event="propertyChange")]
        public function get awardMapTxt():Label
        {
            return (this._1679899599awardMapTxt);
        }

        public function set activeInfoBG(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1133086745activeInfoBG;
            if (_local_2 !== _arg_1)
            {
                this._1133086745activeInfoBG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfoBG", _local_2, _arg_1));
            };
        }

        public function set tnameLab(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2024469518tnameLab;
            if (_local_2 !== _arg_1)
            {
                this._2024469518tnameLab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tnameLab", _local_2, _arg_1));
            };
        }

        public function set worshipChampionTitle1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._613486104worshipChampionTitle1;
            if (_local_2 !== _arg_1)
            {
                this._613486104worshipChampionTitle1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "worshipChampionTitle1", _local_2, _arg_1));
            };
        }

        private function onEnter(_arg_1:Object):void
        {
        }

        public function set b20(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95776b20;
            if (_local_2 !== _arg_1)
            {
                this._95776b20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b20", _local_2, _arg_1));
            };
        }

        public function set worshipChampionTitle2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._613486105worshipChampionTitle2;
            if (_local_2 !== _arg_1)
            {
                this._613486105worshipChampionTitle2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "worshipChampionTitle2", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossTeamFightPanel_DataGridColumn4 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "bet";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossTeamFightPanel_DataGridColumn4", _CrossTeamFightPanel_DataGridColumn4);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get betAward():BasicGlowButton
        {
            return (this._1824931916betAward);
        }

        public function set horizontalCenterNext(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._227466196horizontalCenterNext;
            if (_local_2 !== _arg_1)
            {
                this._227466196horizontalCenterNext = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalCenterNext", _local_2, _arg_1));
            };
        }

        public function __basicBetAwardBtn_click(_arg_1:MouseEvent):void
        {
            getBetBasicAward();
        }

        [Bindable(event="propertyChange")]
        public function get worshipChampion():Canvas
        {
            return (this._1165556831worshipChampion);
        }

        [Bindable(event="propertyChange")]
        public function get enterBtn():DelayButton
        {
            return (this._2105905052enterBtn);
        }

        public function __bet42_click(_arg_1:MouseEvent):void
        {
            toBet(4, 2);
        }

        public function set awardMapTxt(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1679899599awardMapTxt;
            if (_local_2 !== _arg_1)
            {
                this._1679899599awardMapTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardMapTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get leftTreeTeam():Canvas
        {
            return (this._672450494leftTreeTeam);
        }

        public function __vote3_click(_arg_1:MouseEvent):void
        {
            toVote(2);
        }

        public function set enrollLeftTime(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1691059654enrollLeftTime;
            if (_local_2 !== _arg_1)
            {
                this._1691059654enrollLeftTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enrollLeftTime", _local_2, _arg_1));
            };
        }

        public function __tabD_click(_arg_1:MouseEvent):void
        {
            groupTab(3);
        }

        [Bindable(event="propertyChange")]
        public function get content():Canvas
        {
            return (this._951530617content);
        }

        [Bindable(event="propertyChange")]
        public function get enterTxt():Label
        {
            return (this._2105887624enterTxt);
        }

        public function set b31(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95808b31;
            if (_local_2 !== _arg_1)
            {
                this._95808b31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get newEvents1():Canvas
        {
            return (this._781771656newEvents1);
        }

        [Bindable(event="propertyChange")]
        public function get crossFightTitle():BasicTitleCanvas
        {
            return (this._956155768crossFightTitle);
        }

        public function set leftTreeTeam(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._672450494leftTreeTeam;
            if (_local_2 !== _arg_1)
            {
                this._672450494leftTreeTeam = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftTreeTeam", _local_2, _arg_1));
            };
        }

        public function onGetEnroll(_arg_1:Object):void
        {
            var _local_3:String;
            if (TEAM_CROSSPK_STATE >= 5)
            {
                enrollLeftTime.text = Language.CROSS_FIGHT_PANEL_U[167].toString().replace("{group}", TEAM_CROSSPK_GROUP);
            }
            else
            {
                enrollLeftTime.text = Language.CROSS_FIGHT_PANEL_U[119].toString().replace("{group}", TEAM_CROSSPK_GROUP);
            };
            var _local_2:int = -1;
            if (_arg_1)
            {
                if (_arg_1.type == 1)
                {
                    myTeamName = "";
                    if (_arg_1.tName)
                    {
                        myTeamName = _arg_1.tName;
                    };
                    if (((myTeamName == null) || (myTeamName.length == 0)))
                    {
                        _local_2 = 0;
                    }
                    else
                    {
                        _local_2 = 1;
                    };
                }
                else
                {
                    if ((((_arg_1.type == 3) || (_arg_1.type == 6)) || (_arg_1.type == 5)))
                    {
                        _local_2 = 2;
                    };
                };
            };
            if (_local_2 == 0)
            {
                tnameLab.visible = true;
                tnameTxt.visible = true;
                enrollBtn.visible = true;
                teamName.text = "";
                teamName.visible = false;
                teamInfo.visible = false;
                enterTxt.visible = false;
                enterBtn.visible = false;
            }
            else
            {
                if (_local_2 == 1)
                {
                    tnameLab.visible = false;
                    tnameTxt.visible = false;
                    enrollBtn.visible = false;
                    _local_3 = Language.CROSS_FIGHT_PANEL_U[122];
                    _local_3 = _local_3.replace("{name}", myTeamName);
                    teamName.text = _local_3;
                    teamName.visible = true;
                    teamInfo.visible = true;
                    enterTxt.visible = false;
                    enterBtn.visible = false;
                }
                else
                {
                    if (_local_2 == 2)
                    {
                        tnameLab.visible = false;
                        tnameTxt.visible = false;
                        enrollBtn.visible = false;
                        enterTxt.visible = true;
                        enterBtn.visible = true;
                        teamName.visible = false;
                        teamInfo.visible = false;
                    }
                    else
                    {
                        tnameLab.visible = false;
                        tnameTxt.visible = false;
                        enrollBtn.visible = false;
                        enterTxt.visible = false;
                        enterBtn.visible = false;
                        teamName.visible = false;
                        teamInfo.visible = true;
                    };
                };
            };
        }

        private function groupTab(_arg_1:int):void
        {
            tabA.selected = (_arg_1 == 0);
            tabB.selected = (_arg_1 == 1);
            tabC.selected = (_arg_1 == 2);
            tabD.selected = (_arg_1 == 3);
            tabSelect = tabKey[_arg_1];
            if (vs.selectedIndex == 2)
            {
                refreshChampionInfo();
            }
            else
            {
                if (vs.selectedIndex == 3)
                {
                    refreshFinalInfo();
                }
                else
                {
                    if (vs.selectedIndex == 4)
                    {
                        activeInfoDataIndex = 0;
                        activelookBefore = false;
                        refreshActiveSubInfo();
                    };
                };
            };
        }

        private function enroll():void
        {
            var tname:String;
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("teamCrossPKEnroll", new Responder(onEnroll), tname);
                };
            };
            if (!_core.player.inGroup)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[84]);
                return;
            };
            if (!_core.player.isLeader)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[85]);
                return;
            };
            var num:int = _core.player.groupAC.length;
            if (num < TEAM_CROSSPK_NUM_MIN)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[86]);
                return;
            };
            if (num > TEAM_CROSSPK_NUM_MAX)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[87]);
                return;
            };
            tname = tnameTxt.text;
            if ((((tname) && (tname.length == 0)) || (tname.length > 8)))
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[71]);
                return;
            };
            if (num == TEAM_CROSSPK_NUM_MAX)
            {
                Alert.show(Language.CROSS_FIGHT_PANEL_U[88], "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                if (num < TEAM_CROSSPK_NUM_MAX)
                {
                    Alert.show(Language.CROSS_FIGHT_PANEL_U[146], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    _core.remote.call("teamCrossPKEnroll", new Responder(onEnroll), tname);
                };
            };
        }

        public function set b30(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95807b30;
            if (_local_2 !== _arg_1)
            {
                this._95807b30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b30", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossTeamFightPanel_DataGridColumn3 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 50;
            _local_1.sortable = false;
            _local_1.dataField = "result";
            _local_1.itemRenderer = _CrossTeamFightPanel_ClassFactory1_c();
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossTeamFightPanel_DataGridColumn3", _CrossTeamFightPanel_DataGridColumn3);
            return (_local_1);
        }

        public function set _CrossTeamFightPanel_VBox1(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._1202542159_CrossTeamFightPanel_VBox1;
            if (_local_2 !== _arg_1)
            {
                this._1202542159_CrossTeamFightPanel_VBox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_CrossTeamFightPanel_VBox1", _local_2, _arg_1));
            };
        }

        private function rand3(_arg_1:Object):Object
        {
            var _local_3:String;
            var _local_2:Array = [];
            for (_local_3 in _arg_1)
            {
                _local_2.push(_arg_1[_local_3]);
            };
            return (_local_2[Math.floor((Math.random() * _local_2.length))]);
        }

        public function set horizontalCenterPre(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1115713974horizontalCenterPre;
            if (_local_2 !== _arg_1)
            {
                this._1115713974horizontalCenterPre = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalCenterPre", _local_2, _arg_1));
            };
        }

        public function set betAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1824931916betAward;
            if (_local_2 !== _arg_1)
            {
                this._1824931916betAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "betAward", _local_2, _arg_1));
            };
        }

        public function set b41(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95839b41;
            if (_local_2 !== _arg_1)
            {
                this._95839b41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b41", _local_2, _arg_1));
            };
        }

        private function refreshAwardsInfo():void
        {
            var _local_1:Object = _core.data.gameData[GamePredef.TBL_MAP][awardMaps[0]];
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_MAP][awardMaps[1]];
            var _local_3:Object = _core.data.gameData[GamePredef.TBL_MAP][awardMaps[2]];
            var _local_4:Object = _core.data.gameData[GamePredef.TBL_MAP][awardMaps[3]];
            awardMapTxt.text = Language.CROSS_FIGHT_PANEL_U[103].toString().replace("{map1}", _local_1.name).replace("{map2}", _local_2.name).replace("{map3}", _local_3.name).replace("{map4}", _local_4.name);
            var _local_5:int;
            while (_local_5 < 8)
            {
                this[("award" + _local_5)].refreshItems(awardsData, pkList, pkFinalList);
                _local_5++;
            };
        }

        public function set b40(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95838b40;
            if (_local_2 !== _arg_1)
            {
                this._95838b40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b40", _local_2, _arg_1));
            };
        }

        public function set worshipChampion(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1165556831worshipChampion;
            if (_local_2 !== _arg_1)
            {
                this._1165556831worshipChampion = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "worshipChampion", _local_2, _arg_1));
            };
        }

        public function set enterBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._2105905052enterBtn;
            if (_local_2 !== _arg_1)
            {
                this._2105905052enterBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterBtn", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossTeamFightPanel_DataGridColumn2 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 50;
            _local_1.sortable = false;
            _local_1.dataField = "turn";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossTeamFightPanel_DataGridColumn2", _CrossTeamFightPanel_DataGridColumn2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get newEvents2():Canvas
        {
            return (this._781771655newEvents2);
        }

        public function set b42(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95840b42;
            if (_local_2 !== _arg_1)
            {
                this._95840b42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b42", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeNow():Label
        {
            return (this._1313943351timeNow);
        }

        public function set b43(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95841b43;
            if (_local_2 !== _arg_1)
            {
                this._95841b43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "b43", _local_2, _arg_1));
            };
        }

        private function initTree():void
        {
            var _local_1:ArrayCollection = new ArrayCollection();
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[1],
                "type":WANT_ENROLL
            });
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[2],
                "type":LOOK_AWARD
            });
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[3],
                "type":WORSHIP_CHAMPION
            });
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[65],
                "type":GOOD_EVENTS
            });
            _local_1.addItem({
                "label":Language.CROSS_FIGHT_PANEL_U[66],
                "type":ACTIVE_INFO
            });
            var _local_2:ArrayCollection = new ArrayCollection();
            var _local_3:int;
            while (_local_3 < _local_1.length)
            {
                _local_2.addItem(_local_1.getItemAt(_local_3));
                _local_3++;
            };
            treeTeam.dataProvider = _local_1;
            refreshItems();
            _local_3 = 0;
            while (_local_3 < 15)
            {
                this[("r" + _local_3)].index = _local_3;
                _local_3++;
            };
            activeInfo3Link.addEventListener(TextEvent.LINK, gotoFinal);
            _local_3 = 0;
            while (_local_3 < 4)
            {
                this[("winner" + _local_3)].init(_local_3);
                _local_3++;
            };
        }

        private function howToPlay(_arg_1:int):void
        {
            var _local_2:String;
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            if (_arg_1 == 0)
            {
                if (gameAward.selected)
                {
                    _local_2 = Language.CROSS_FIGHT_PANEL_U[108].toString();
                }
                else
                {
                    _local_2 = Language.CROSS_FIGHT_PANEL_U[170].toString();
                };
            }
            else
            {
                if (_arg_1 == 1)
                {
                    _local_2 = Language.CROSS_FIGHT_PANEL_U[171].toString();
                };
            };
            if (_local_2)
            {
                _helpAlert = Alert.show(_local_2, Language.ASTROLOGIC_PANEL_U[38].toString(), Alert.YES, null, null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get teamInfo():Label
        {
            return (this._1668897621teamInfo);
        }

        public function ___CrossTeamFightPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initTree();
        }

        [Bindable(event="propertyChange")]
        public function get activeInfo():Canvas
        {
            return (this._2043634900activeInfo);
        }

        [Bindable(event="propertyChange")]
        public function get activeLinesVbox():VBox
        {
            return (this._1342671666activeLinesVbox);
        }

        public function __bet30_click(_arg_1:MouseEvent):void
        {
            toBet(3, 0);
        }

        public function set betAwardBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._850743920betAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._850743920betAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "betAwardBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get newEventsBG():Image
        {
            return (this._1534883038newEventsBG);
        }

        private function treeClick2(_arg_1:Event):void
        {
            var _local_2:Object = treeTeam.selectedItem;
            if (!_local_2)
            {
                return;
            };
            changeView(_local_2);
        }

        private function onGetPKList():void
        {
            var _local_2:String;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Number;
            var _local_12:Number;
            var _local_13:Object;
            var _local_14:Object;
            var _local_15:Object;
            var _local_16:Object;
            var _local_17:Object;
            var _local_18:Object;
            activeInfoData = {};
            activeInfoNum = {};
            refreshFinalInfo();
            refreshActiveSubInfo(true);
            var _local_1:int;
            while (_local_1 < tabKey.length)
            {
                _local_2 = tabKey[_local_1];
                activeInfoData[_local_2] = [];
                if ((((pkFinalList) && (pkFinalList.list)) && (pkFinalList.list[_local_2])))
                {
                    _local_3 = pkFinalList;
                }
                else
                {
                    if ((((pkList) && (pkList.list)) && (pkList.list[_local_2])))
                    {
                        _local_3 = pkList;
                    };
                };
                if (_local_3)
                {
                    if (_local_3.teamNum)
                    {
                        activeInfoNum[_local_2] = ((_local_3.teamNum[_local_2]) || ({}));
                    };
                    _local_4 = _local_3.team;
                    _local_5 = _local_3.list;
                    _local_6 = _local_5[_local_2];
                    if (_local_6)
                    {
                        for (_local_7 in _local_6)
                        {
                            _local_8 = _local_6[_local_7];
                            if (_local_8)
                            {
                                activeInfoData[_local_2][_local_7] = [];
                                for (_local_9 in _local_8)
                                {
                                    _local_10 = _local_8[_local_9];
                                    if (_local_10)
                                    {
                                        _local_11 = _local_10[1];
                                        _local_12 = _local_10[2];
                                        _local_13 = _local_4[_local_2][_local_11];
                                        _local_14 = _local_4[_local_2][_local_12];
                                        _local_15 = {};
                                        _local_15.status = _local_10.status;
                                        _local_15.win = _local_10.win;
                                        _local_15.bid = _local_9;
                                        if (_local_13)
                                        {
                                            _local_15.team1 = {};
                                            _local_15.team1["teamName"] = _local_13.tname;
                                            _local_15.team1["area"] = _local_13.sid;
                                            if ((((_local_13.members) && (_local_13.members[_local_13.leader])) && (_local_13.members[_local_13.leader].cname)))
                                            {
                                                _local_15.team1["leaderName"] = _local_13.members[_local_13.leader].cname;
                                                _local_15.team1["leaderId"] = _local_13.leader;
                                            };
                                            _local_17 = {};
                                            for (_local_16 in _local_13.members)
                                            {
                                                _local_17[_local_16] = _local_13.members[_local_16];
                                            };
                                            _local_15.team1["members"] = _local_17;
                                        };
                                        if (_local_14)
                                        {
                                            _local_15.team2 = {};
                                            _local_15.team2["teamName"] = _local_14.tname;
                                            _local_15.team2["area"] = _local_14.sid;
                                            if ((((_local_14.members) && (_local_14.members[_local_14.leader])) && (_local_14.members[_local_14.leader].cname)))
                                            {
                                                _local_15.team2["leaderName"] = _local_14.members[_local_14.leader].cname;
                                                _local_15.team2["leaderId"] = _local_14.leader;
                                            };
                                            _local_18 = {};
                                            for (_local_16 in _local_14.members)
                                            {
                                                _local_18[_local_16] = _local_14.members[_local_16];
                                            };
                                            _local_15.team2["members"] = _local_18;
                                        };
                                        activeInfoData[_local_2][_local_7].push(_local_15);
                                    };
                                };
                            };
                        };
                    };
                };
                _local_1++;
            };
            activeTitle.source = ResManager.getIconUrl(4130220000241);
            refreshFinalInfo();
            refreshActiveSubInfo();
        }

        public function set activeInfo3Link(_arg_1:Text):void
        {
            var _local_2:Object;
            _local_2 = this._1625641593activeInfo3Link;
            if (_local_2 !== _arg_1)
            {
                this._1625641593activeInfo3Link = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfo3Link", _local_2, _arg_1));
            };
        }

        public function __bet41_click(_arg_1:MouseEvent):void
        {
            toBet(4, 1);
        }

        [Bindable(event="propertyChange")]
        public function get timeStartActive():Label
        {
            return (this._959684357timeStartActive);
        }

        public function set enterTxt(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2105887624enterTxt;
            if (_local_2 !== _arg_1)
            {
                this._2105887624enterTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterTxt", _local_2, _arg_1));
            };
        }

        public function set content(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._951530617content;
            if (_local_2 !== _arg_1)
            {
                this._951530617content = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "content", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            if (this.visible)
            {
                return;
            };
            getData();
            treeTeam.expandItem(treeTeam.selectedItem, (!(treeTeam.isItemOpen(treeTeam.selectedItem))));
            this.visible = true;
            setRandName();
        }

        private function _CrossTeamFightPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossTeamFightPanel_DataGridColumn1 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 160;
            _local_1.sortable = false;
            _local_1.dataField = "teamName";
            _local_1.setStyle("textAlign", "center");
            BindingManager.executeBindings(this, "_CrossTeamFightPanel_DataGridColumn1", _CrossTeamFightPanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tnameTxt():TextInput
        {
            return (this._2024477937tnameTxt);
        }

        public function set vote1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._112396935vote1;
            if (_local_2 !== _arg_1)
            {
                this._112396935vote1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vote1", _local_2, _arg_1));
            };
        }

        public function set crossFightTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._956155768crossFightTitle;
            if (_local_2 !== _arg_1)
            {
                this._956155768crossFightTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "crossFightTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeLookBeforeBtn():DelayButton
        {
            return (this._1732790552activeLookBeforeBtn);
        }

        public function set vote3(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._112396937vote3;
            if (_local_2 !== _arg_1)
            {
                this._112396937vote3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vote3", _local_2, _arg_1));
            };
        }

        public function set newEvents1(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._781771656newEvents1;
            if (_local_2 !== _arg_1)
            {
                this._781771656newEvents1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newEvents1", _local_2, _arg_1));
            };
        }

        public function set newEvents2(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._781771655newEvents2;
            if (_local_2 !== _arg_1)
            {
                this._781771655newEvents2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newEvents2", _local_2, _arg_1));
            };
        }

        public function set betAwardItem0(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1527580305betAwardItem0;
            if (_local_2 !== _arg_1)
            {
                this._1527580305betAwardItem0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "betAwardItem0", _local_2, _arg_1));
            };
        }

        public function set betAwardItem1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1527580306betAwardItem1;
            if (_local_2 !== _arg_1)
            {
                this._1527580306betAwardItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "betAwardItem1", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[0];
            _local_1 = ResManager.getIconUrl(4130220000235);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[67];
            _local_1 = ResManager.getIconUrl(4130220000233);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[68];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[69];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[70];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[120];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[121];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[123];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[119];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[97];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[98];
            _local_1 = ResManager.getIconUrl(4130220000233);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[92];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[93];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[99];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[100];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[101];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[102];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[103];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[94];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[104];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[105];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[174];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[106];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[107];
            _local_1 = ResManager.getIconUrl(4130220000233);
            _local_1 = Language.CROSS_FIGHT_PANEL_U[92];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[98];
            _local_1 = awardData;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[112];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[113];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[114];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[115];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[116];
            _local_1 = totalGold;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[117];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[96];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[109];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[110];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[118];
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Slot.SLOT_BAG;
            _local_1 = Language.CROSS_FIGHT_PANEL_U[96];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[111];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[18];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[19];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[20];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[21];
            _local_1 = ResManager.getIconUrl(4130220000232);
            _local_1 = ResManager.getIconUrl(4130220000283);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[29];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[30];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[31];
            _local_1 = null;
            _local_1 = null;
            _local_1 = null;
            _local_1 = Language.ASTROLOGIC_PANEL_U[38];
            _local_1 = ResManager.getIconUrl(4130220000263);
            _local_1 = ResManager.getIconUrl(4130220000269);
            _local_1 = ResManager.getIconUrl(4130220000264);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getResUrl(2060090400041);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000297);
            _local_1 = ResManager.getIconUrl(4130220000234);
            _local_1 = [GamePredef.FILTER_TITLE];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[141];
            _local_1 = ResManager.getIconUrl(4130220000239);
            _local_1 = ResManager.getIconUrl(4130220000238);
            _local_1 = activeLines.currentItem;
            _local_1 = ResManager.getIconUrl(4130220000263);
        }

        public function set bet20(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627023bet20;
            if (_local_2 !== _arg_1)
            {
                this._93627023bet20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet20", _local_2, _arg_1));
            };
        }

        public function set betAwardItem3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1527580308betAwardItem3;
            if (_local_2 !== _arg_1)
            {
                this._1527580308betAwardItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "betAwardItem3", _local_2, _arg_1));
            };
        }

        public function __vote2_click(_arg_1:MouseEvent):void
        {
            toVote(1);
        }

        public function set betAwardItem2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1527580307betAwardItem2;
            if (_local_2 !== _arg_1)
            {
                this._1527580307betAwardItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "betAwardItem2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mobaiItem1():ShopSlot
        {
            return (this._741819082mobaiItem1);
        }

        public function set teamName(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1668760952teamName;
            if (_local_2 !== _arg_1)
            {
                this._1668760952teamName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mobaiItem3():ShopSlot
        {
            return (this._741819080mobaiItem3);
        }

        public function onGetData(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.oid)
            {
                original_server_id = _arg_1.oid;
            };
            nextBattleTime = _arg_1.nextb;
            betOpen = _arg_1.betOpen;
            awardsData = _arg_1.awards;
            awardMaps = _arg_1.awardMap;
            betAwardItems = _arg_1.betAwardsItems;
            TEAM_CROSSPK_GROUP = _arg_1.group;
            TEAM_CROSSPK_STATE = _arg_1.state;
            onGetEnroll(_arg_1.enroll);
            pkList = _arg_1.pk;
            pkFinalList = _arg_1.finalPk;
            onGetPKList();
            refreshAwardsInfo();
            if (((treeTeam.selectedItem) && (treeTeam.selectedItem.type == LOOK_AWARD)))
            {
                if (!gameAward.selected)
                {
                    if (betAward.selected)
                    {
                        _core.remote.call("teamCrossPKGetBetData", new Responder(onGetBetData));
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeNowActive():Label
        {
            return (this._1152106799timeNowActive);
        }

        public function __tabC_click(_arg_1:MouseEvent):void
        {
            groupTab(2);
        }

        public function set bet30(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627054bet30;
            if (_local_2 !== _arg_1)
            {
                this._93627054bet30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet30", _local_2, _arg_1));
            };
        }

        public function set teamInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1668897621teamInfo;
            if (_local_2 !== _arg_1)
            {
                this._1668897621teamInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamInfo", _local_2, _arg_1));
            };
        }

        public function set bet31(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627055bet31;
            if (_local_2 !== _arg_1)
            {
                this._93627055bet31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get basicBetAwardBtn():BasicDelayButton
        {
            return (this._1076583778basicBetAwardBtn);
        }

        [Bindable(event="propertyChange")]
        public function get mobaiItem2():ShopSlot
        {
            return (this._741819081mobaiItem2);
        }

        [Bindable(event="propertyChange")]
        public function get award0():CrossTeamFightAwardRect
        {
            return (this._1405038221award0);
        }

        [Bindable(event="propertyChange")]
        public function get award1():CrossTeamFightAwardRect
        {
            return (this._1405038220award1);
        }

        [Bindable(event="propertyChange")]
        public function get award2():CrossTeamFightAwardRect
        {
            return (this._1405038219award2);
        }

        [Bindable(event="propertyChange")]
        public function get award4():CrossTeamFightAwardRect
        {
            return (this._1405038217award4);
        }

        [Bindable(event="propertyChange")]
        public function get award5():CrossTeamFightAwardRect
        {
            return (this._1405038216award5);
        }

        [Bindable(event="propertyChange")]
        public function get award6():CrossTeamFightAwardRect
        {
            return (this._1405038215award6);
        }

        [Bindable(event="propertyChange")]
        public function get award7():CrossTeamFightAwardRect
        {
            return (this._1405038214award7);
        }

        public function set vs(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        public function set vote2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._112396936vote2;
            if (_local_2 !== _arg_1)
            {
                this._112396936vote2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vote2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get gameAward():BasicGlowButton
        {
            return (this._973530507gameAward);
        }

        [Bindable(event="propertyChange")]
        public function get right1():Image
        {
            return (this._931102315right1);
        }

        [Bindable(event="propertyChange")]
        public function get right2():Image
        {
            return (this._931102314right2);
        }

        [Bindable(event="propertyChange")]
        public function get right3():Image
        {
            return (this._931102313right3);
        }

        [Bindable(event="propertyChange")]
        public function get award3():CrossTeamFightAwardRect
        {
            return (this._1405038218award3);
        }

        public function set timeNow(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1313943351timeNow;
            if (_local_2 !== _arg_1)
            {
                this._1313943351timeNow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeNow", _local_2, _arg_1));
            };
        }

        public function set bet40(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627085bet40;
            if (_local_2 !== _arg_1)
            {
                this._93627085bet40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet40", _local_2, _arg_1));
            };
        }

        public function set bet42(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627087bet42;
            if (_local_2 !== _arg_1)
            {
                this._93627087bet42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet42", _local_2, _arg_1));
            };
        }

        public function set activeLinesVbox(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._1342671666activeLinesVbox;
            if (_local_2 !== _arg_1)
            {
                this._1342671666activeLinesVbox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeLinesVbox", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get timeStart():Label
        {
            return (this._25573781timeStart);
        }

        private function refreshItems():void
        {
            var _local_1:Object = {};
            _local_1.money = TEAM_MOBAI_COST1;
            _local_1.type = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1.itemId = TEAM_MOBAI_AWARD1_ID;
            _local_1.gt = 1;
            _local_1.pType1 = Currency.TYPE_MONEY_BIND;
            _local_1.pNum1 = TEAM_MOBAI_COST1;
            mobaiItem1.type = GamePredef.TBL_ITEM_TEMPLATE;
            mobaiItem1.giid = TEAM_MOBAI_AWARD1_ID;
            mobaiItem1.st = 0;
            mobaiItem1.slotData = _local_1;
            mobaiItem1.enabled = true;
            _local_1 = {};
            _local_1.gold = TEAM_MOBAI_COST2;
            _local_1.type = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1.itemId = TEAM_MOBAI_AWARD2_ID;
            _local_1.gt = 1;
            _local_1.pType1 = Currency.TYPE_GOLD_BIND;
            _local_1.pNum1 = TEAM_MOBAI_COST2;
            mobaiItem2.type = GamePredef.TBL_ITEM_TEMPLATE;
            mobaiItem2.giid = TEAM_MOBAI_AWARD2_ID;
            mobaiItem2.st = 0;
            mobaiItem2.slotData = _local_1;
            mobaiItem2.enabled = true;
            _local_1 = {};
            _local_1.gold = TEAM_MOBAI_COST3;
            _local_1.type = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1.itemId = TEAM_MOBAI_AWARD3_ID;
            _local_1.gt = 1;
            _local_1.pType1 = Currency.TYPE_GOLD_BIND;
            _local_1.pNum1 = TEAM_MOBAI_COST3;
            mobaiItem3.type = GamePredef.TBL_ITEM_TEMPLATE;
            mobaiItem3.giid = TEAM_MOBAI_AWARD1_ID;
            mobaiItem3.st = 0;
            mobaiItem3.slotData = _local_1;
            mobaiItem3.enabled = true;
        }

        public function set bet43(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627088bet43;
            if (_local_2 !== _arg_1)
            {
                this._93627088bet43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet43", _local_2, _arg_1));
            };
        }

        public function set bet41(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._93627086bet41;
            if (_local_2 !== _arg_1)
            {
                this._93627086bet41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bet41", _local_2, _arg_1));
            };
        }

        private function refreshFinalData(_arg_1:Object):void
        {
            var _local_7:Object;
            var _local_2:int;
            var _local_3:Object = (((_arg_1) && (_arg_1[4])) || ({}));
            var _local_4:Object = (((_arg_1) && (_arg_1[3])) || ({}));
            var _local_5:Object = (((_arg_1) && (_arg_1[2])) || ({}));
            var _local_6:Object = (((_arg_1) && (_arg_1[1])) || ({}));
            if (((!(activelookBefore)) && (TEAM_CROSSPK_GROUP == tabSelect)))
            {
                rightIMG.source = ResManager.getIconUrl((((TEAM_CROSSPK_STATE == 1) || (TEAM_CROSSPK_STATE >= 5)) ? 4130220000268 : 4130220000267));
            }
            else
            {
                rightIMG.source = ResManager.getIconUrl(4130220000268);
            };
            if (_local_5[0])
            {
                right3.x = 388;
                right3.y = 86;
                right3.source = ResManager.getIconUrl(4130220000272);
            }
            else
            {
                if (_local_4[0])
                {
                    right3.x = 211;
                    right3.y = 34;
                    right3.source = ResManager.getIconUrl(4130220000271);
                }
                else
                {
                    if (_local_3[0])
                    {
                        right3.x = 8;
                        right3.y = 9;
                        right3.source = ResManager.getIconUrl(4130220000270);
                    }
                    else
                    {
                        right3.source = null;
                    };
                };
            };
            _local_2 = 0;
            while (_local_2 < 15)
            {
                this[("r" + _local_2)].init();
                _local_2++;
            };
            if ((((pkFinalList) && (pkFinalList.list)) && (pkFinalList.list[tabSelect])))
            {
                _local_7 = pkFinalList.list[tabSelect];
            };
            _local_2 = 0;
            while (_local_2 < 8)
            {
                this[("r" + _local_2)].refresh(_local_3[int((_local_2 / 2))], _local_7);
                _local_2++;
            };
            _local_2 = 8;
            while (_local_2 < 12)
            {
                this[("r" + _local_2)].refresh(_local_4[int(((_local_2 - 8) / 2))], _local_7);
                _local_2++;
            };
            _local_2 = 12;
            while (_local_2 < 14)
            {
                this[("r" + _local_2)].refresh(_local_5[int(((_local_2 - 12) / 2))], _local_7);
                _local_2++;
            };
            if ((((_local_5[0]) && (_local_5[0].win)) && (_local_5[0].team1)))
            {
                this["r14"].refresh({
                    "team1":_local_5[0].team1,
                    "team2":_local_5[0].team2,
                    "win":_local_5[0].win
                }, _local_7);
                if (TEAM_CROSSPK_GROUP == tabSelect)
                {
                    right2.source = ResManager.getIconUrl((((TEAM_CROSSPK_STATE == 1) || (TEAM_CROSSPK_STATE >= 5)) ? 4130220000266 : 4130220000265));
                }
                else
                {
                    right2.source = ResManager.getIconUrl(4130220000266);
                };
                right3.source = null;
            }
            else
            {
                this["r14"].init();
                right2.source = ResManager.getIconUrl(4130220000264);
            };
            refreshBetBtns();
        }

        public function __bet40_click(_arg_1:MouseEvent):void
        {
            toBet(4, 0);
        }

        public function set activeInfo(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._2043634900activeInfo;
            if (_local_2 !== _arg_1)
            {
                this._2043634900activeInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfo", _local_2, _arg_1));
            };
        }

        public function set newEvents(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._995049767newEvents;
            if (_local_2 !== _arg_1)
            {
                this._995049767newEvents = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newEvents", _local_2, _arg_1));
            };
        }

        public function set newEventsBG(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1534883038newEventsBG;
            if (_local_2 !== _arg_1)
            {
                this._1534883038newEventsBG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newEventsBG", _local_2, _arg_1));
            };
        }

        private function activePre():void
        {
            if (activeInfoDataIndex > 0)
            {
                activeInfoDataIndex--;
                refreshActiveSubInfo();
            };
        }

        public function set wantEnroll(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._752368938wantEnroll;
            if (_local_2 !== _arg_1)
            {
                this._752368938wantEnroll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "wantEnroll", _local_2, _arg_1));
            };
        }

        private function getBetAward():void
        {
            _core.remote.call("teamCrossPKBetGetFinalAward", new Responder(onGetBetAward));
        }

        [Bindable(event="propertyChange")]
        private function get totalGold():ArrayCollection
        {
            return (this._577663548totalGold);
        }

        public function __enterBtn_click(_arg_1:MouseEvent):void
        {
            enter();
        }

        private function gotoFinal(_arg_1:TextEvent):void
        {
            var _local_3:Object;
            if (int(_arg_1.text) == GOOD_EVENTS)
            {
                removeTabs();
                newEvents.addChild(tabA);
                newEvents.addChild(tabB);
                newEvents.addChild(tabC);
                newEvents.addChild(tabD);
                refreshFinalInfo();
            }
            else
            {
                if (int(_arg_1.text) == ACTIVE_INFO)
                {
                    removeTabs();
                    activeInfo.addChild(tabA);
                    activeInfo.addChild(tabB);
                    activeInfo.addChild(tabC);
                    activeInfo.addChild(tabD);
                    activeInfoDataIndex = 0;
                    refreshActiveSubInfo();
                };
            };
            vs.selectedIndex = int(_arg_1.text);
            var _local_2:ArrayCollection = (treeTeam.dataProvider as ArrayCollection);
            for each (_local_3 in _local_2)
            {
                if (int(_local_3.type) == int(_arg_1.text))
                {
                    treeTeam.selectedItem = _local_3;
                    treeTeam.expandItem(treeTeam.selectedItem, (!(treeTeam.isItemOpen(treeTeam.selectedItem))));
                    break;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeInfo1():Canvas
        {
            return (this._1071827491activeInfo1);
        }

        [Bindable(event="propertyChange")]
        public function get activeInfo3():Canvas
        {
            return (this._1071827489activeInfo3);
        }

        public function set activeTitle(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1061804302activeTitle;
            if (_local_2 !== _arg_1)
            {
                this._1061804302activeTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeInfo2():Canvas
        {
            return (this._1071827490activeInfo2);
        }

        public function set tnameTxt(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._2024477937tnameTxt;
            if (_local_2 !== _arg_1)
            {
                this._2024477937tnameTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tnameTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get goldAward():DataGrid
        {
            return (this._1313061411goldAward);
        }

        public function __vote1_click(_arg_1:MouseEvent):void
        {
            toVote(0);
        }

        public function __treeTeam_itemClick(_arg_1:ListEvent):void
        {
            treeClick2(_arg_1);
        }

        public function __gameAward_click(_arg_1:MouseEvent):void
        {
            awardTab(0);
        }

        public function __tabB_click(_arg_1:MouseEvent):void
        {
            groupTab(1);
        }

        public function set totalGoldAward(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._492833031totalGoldAward;
            if (_local_2 !== _arg_1)
            {
                this._492833031totalGoldAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalGoldAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardVs():ViewStack
        {
            return (this._606510598awardVs);
        }

        [Bindable(event="propertyChange")]
        public function get r2():CrossTeamFightResultInfo
        {
            return (this._3584r2);
        }

        [Bindable(event="propertyChange")]
        public function get r3():CrossTeamFightResultInfo
        {
            return (this._3585r3);
        }

        [Bindable(event="propertyChange")]
        public function get r4():CrossTeamFightResultInfo
        {
            return (this._3586r4);
        }

        public function set lookAward(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1102515966lookAward;
            if (_local_2 !== _arg_1)
            {
                this._1102515966lookAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lookAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r0():CrossTeamFightResultInfo
        {
            return (this._3582r0);
        }

        [Bindable(event="propertyChange")]
        public function get r1():CrossTeamFightResultInfo
        {
            return (this._3583r1);
        }

        [Bindable(event="propertyChange")]
        public function get r9():CrossTeamFightResultInfo
        {
            return (this._3591r9);
        }

        [Bindable(event="propertyChange")]
        public function get r5():CrossTeamFightResultInfo
        {
            return (this._3587r5);
        }

        [Bindable(event="propertyChange")]
        public function get r7():CrossTeamFightResultInfo
        {
            return (this._3589r7);
        }

        private function refreshActiveSubInfo(_arg_1:Boolean=false):void
        {
            activeInfo1.visible = false;
            activeInfo2.visible = true;
            timeStartActive.visible = false;
            timeNowActive.visible = false;
            var _local_2:int = int(activeInfoNum[tabSelect]);
            var _local_3:int = int((Math.ceil((Math.log(_local_2) / Math.log(2))) + 1));
            _local_3 = (_local_3 - activeInfoDataIndex);
            if ((((tabSelect == TEAM_CROSSPK_GROUP) && (TEAM_CROSSPK_STATE == 1)) && (!(activelookBefore))))
            {
                activeInfo1.visible = true;
                activeInfo2.visible = false;
                activeInfo3.visible = false;
                activeLines.dataProvider = null;
                horizontalCenterPre.visible = false;
                horizontalCenterNext.visible = false;
                activeTitle.source = "";
                rightIMG.source = "";
                activeInfoBG.source = ResManager.getIconUrl(4130220000277);
                if ((((!(activeInfoData)) || (!(activeInfoData[tabSelect]))) || (!(activeInfoData[tabSelect][_local_3]))))
                {
                    activeLookBeforeBtn.visible = false;
                    activeLookBeforeBtn.enabled = false;
                }
                else
                {
                    activeLookBeforeBtn.visible = true;
                    activeLookBeforeBtn.enabled = true;
                };
                return;
            };
            if ((((!(_arg_1)) && (_local_3 <= 4)) && (_local_3 > 0)))
            {
                if (tabSelect == TEAM_CROSSPK_GROUP)
                {
                    activeInfo3Txt.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? 4130220000273 : 4130220000274));
                }
                else
                {
                    activeInfo3Txt.source = ResManager.getIconUrl(4130220000273);
                };
                activeInfo3Link.htmlText = Language.CROSS_FIGHT_PANEL_U[142];
                activeInfo3Link.mouseEnabled = true;
                activeInfo1.visible = false;
                activeInfo2.visible = false;
                activeInfo3.visible = true;
                return;
            };
            if ((((!(activeInfoData)) || (!(activeInfoData[tabSelect]))) || (!(activeInfoData[tabSelect][_local_3]))))
            {
                activeInfo2.visible = false;
                activeInfoBG.source = ResManager.getIconUrl(4130220000277);
                activeInfo3.visible = false;
                return;
            };
            activeInfo1.visible = false;
            activeInfo2.visible = true;
            if (tabSelect == TEAM_CROSSPK_GROUP)
            {
                activeInfoBG.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? 4130220000242 : 4130220000234));
            }
            else
            {
                activeInfoBG.source = ResManager.getIconUrl(4130220000242);
            };
            if (!activelookBefore)
            {
                if (nextBattleTime == 0)
                {
                    if (TEAM_CROSSPK_STATE >= 5)
                    {
                        timeStartActive.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:08");
                    }
                    else
                    {
                        timeStartActive.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:05");
                    };
                }
                else
                {
                    timeStartActive.text = (Language.CROSS_FIGHT_PANEL_U[134] + getNextBattleTime());
                };
                timeNowActive.text = (Language.CROSS_FIGHT_PANEL_U[133] + getSetverTime());
                timeStartActive.visible = true;
                timeNowActive.visible = true;
            };
            activeInfo3.visible = false;
            if (tabSelect == TEAM_CROSSPK_GROUP)
            {
                activeTitle.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? activeInfoIMGArrFinal[activeInfoDataIndex] : activeInfoIMGArr[activeInfoDataIndex]));
            }
            else
            {
                activeTitle.source = ResManager.getIconUrl(activeInfoIMGArrFinal[activeInfoDataIndex]);
            };
            rightIMG.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? 4130220000268 : 4130220000267));
            var _local_4:Object = activeInfoData[tabSelect][_local_3];
            activeLines.dataProvider = _local_4;
            if (((activeInfoDataIndex == 0) || (!(activeInfoData[tabSelect][(_local_3 + 1)]))))
            {
                horizontalCenterPre.visible = false;
            }
            else
            {
                horizontalCenterPre.visible = true;
            };
            if (activeInfoData[tabSelect][(_local_3 - 1)])
            {
                horizontalCenterNext.visible = true;
            }
            else
            {
                horizontalCenterNext.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get r10():CrossTeamFightResultInfo
        {
            return (this._111121r10);
        }

        [Bindable(event="propertyChange")]
        public function get r13():CrossTeamFightResultInfo
        {
            return (this._111124r13);
        }

        [Bindable(event="propertyChange")]
        public function get r14():CrossTeamFightResultInfo
        {
            return (this._111125r14);
        }

        public function set timeStartActive(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._959684357timeStartActive;
            if (_local_2 !== _arg_1)
            {
                this._959684357timeStartActive = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeStartActive", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get r12():CrossTeamFightResultInfo
        {
            return (this._111123r12);
        }

        [Bindable(event="propertyChange")]
        public function get r6():CrossTeamFightResultInfo
        {
            return (this._3588r6);
        }

        [Bindable(event="propertyChange")]
        public function get r8():CrossTeamFightResultInfo
        {
            return (this._3590r8);
        }

        [Bindable(event="propertyChange")]
        public function get worshipChampionTitle1():Label
        {
            return (this._613486104worshipChampionTitle1);
        }

        private function removeTabs():void
        {
            if (tabA.parent)
            {
                tabA.parent.removeChild(tabA);
            };
            if (tabB.parent)
            {
                tabB.parent.removeChild(tabB);
            };
            if (tabC.parent)
            {
                tabC.parent.removeChild(tabC);
            };
            if (tabD.parent)
            {
                tabD.parent.removeChild(tabD);
            };
        }

        [Bindable(event="propertyChange")]
        public function get b20():Image
        {
            return (this._95776b20);
        }

        [Bindable(event="propertyChange")]
        public function get worshipChampionTitle2():Label
        {
            return (this._613486105worshipChampionTitle2);
        }

        [Bindable(event="propertyChange")]
        public function get r11():CrossTeamFightResultInfo
        {
            return (this._111122r11);
        }

        public function set activeLookBeforeBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1732790552activeLookBeforeBtn;
            if (_local_2 !== _arg_1)
            {
                this._1732790552activeLookBeforeBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeLookBeforeBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get enrollLeftTime():Label
        {
            return (this._1691059654enrollLeftTime);
        }

        [Bindable(event="propertyChange")]
        public function get b30():Image
        {
            return (this._95807b30);
        }

        [Bindable(event="propertyChange")]
        public function get b31():Image
        {
            return (this._95808b31);
        }

        public function set treeTeam(_arg_1:ButtonTree):void
        {
            var _local_2:Object;
            _local_2 = this._1386162971treeTeam;
            if (_local_2 !== _arg_1)
            {
                this._1386162971treeTeam = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "treeTeam", _local_2, _arg_1));
            };
        }

        public function ___CrossTeamFightPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            howToPlay(1);
        }

        [Bindable(event="propertyChange")]
        public function get _CrossTeamFightPanel_VBox1():VBox
        {
            return (this._1202542159_CrossTeamFightPanel_VBox1);
        }

        [Bindable(event="propertyChange")]
        public function get horizontalCenterPre():Image
        {
            return (this._1115713974horizontalCenterPre);
        }

        public function onTeamCrossPKBet(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                basicBetAwardBtn.enabled = false;
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[164]);
            }
            else
            {
                if (_arg_1.data)
                {
                    _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[_arg_1.data]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get b41():Image
        {
            return (this._95839b41);
        }

        private function getSetverTime():String
        {
            var _local_1:Date = new Date();
            _local_1.setTime(((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet));
            return (TimeUtil.dateFormatter.format(_local_1));
        }

        [Bindable(event="propertyChange")]
        public function get b40():Image
        {
            return (this._95838b40);
        }

        [Bindable(event="propertyChange")]
        public function get b42():Image
        {
            return (this._95840b42);
        }

        [Bindable(event="propertyChange")]
        public function get b43():Image
        {
            return (this._95841b43);
        }

        public function onGetBetAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[158].toString().replace("{num}", _arg_1.num));
            }
            else
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[159]);
            };
        }

        public function set mobaiItem1(_arg_1:ShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._741819082mobaiItem1;
            if (_local_2 !== _arg_1)
            {
                this._741819082mobaiItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mobaiItem1", _local_2, _arg_1));
            };
        }

        private function refreshBetBtns():void
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:Object;
            resethBetBtns();
            var _local_1:int;
            if (((TEAM_CROSSPK_STATE == 6) || (TEAM_CROSSPK_STATE == 5)))
            {
                _local_1 = 1;
            }
            else
            {
                if (((TEAM_CROSSPK_STATE == 3) || (TEAM_CROSSPK_STATE == 2)))
                {
                    _local_1 = 2;
                };
            };
            if (((((_local_1 == 0) || (!(TEAM_CROSSPK_GROUP == tabSelect))) || (!(activeInfoData))) || (!(activeInfoData[tabSelect]))))
            {
                return;
            };
            var _local_2:int;
            while (_local_2 < activeInfoData[tabSelect].length)
            {
                if (!(((_local_2 > 4) || (_local_2 < 2)) || (!(activeInfoData[tabSelect][_local_2]))))
                {
                    _local_3 = activeInfoData[tabSelect][_local_2];
                    _local_4 = 0;
                    while (_local_4 < _local_3.length)
                    {
                        _local_5 = _local_3[_local_4];
                        if (((_local_5) && (_local_5.status == 0)))
                        {
                            if (((_local_1 == 1) && (betOpen)))
                            {
                                this[(("bet" + _local_2) + _local_4)].visible = true;
                            }
                            else
                            {
                                this[(("bet" + _local_2) + _local_4)].visible = false;
                            };
                            if (_local_1 == 2)
                            {
                                this[(("b" + _local_2) + _local_4)].visible = true;
                            };
                        };
                        _local_4++;
                    };
                };
                _local_2++;
            };
        }

        private function changeView(_arg_1:Object):void
        {
            if (_arg_1.type == WANT_ENROLL)
            {
                vs.selectedIndex = 0;
            }
            else
            {
                if (_arg_1.type == LOOK_AWARD)
                {
                    refreshAwardsInfo();
                    vs.selectedIndex = 1;
                }
                else
                {
                    if (_arg_1.type == WORSHIP_CHAMPION)
                    {
                        removeTabs();
                        worshipChampion.addChild(tabA);
                        worshipChampion.addChild(tabB);
                        worshipChampion.addChild(tabC);
                        worshipChampion.addChild(tabD);
                        refreshChampionInfo();
                        vs.selectedIndex = 2;
                    }
                    else
                    {
                        if (_arg_1.type == GOOD_EVENTS)
                        {
                            removeTabs();
                            newEvents.addChild(tabA);
                            newEvents.addChild(tabB);
                            newEvents.addChild(tabC);
                            newEvents.addChild(tabD);
                            refreshFinalInfo();
                            vs.selectedIndex = 3;
                        }
                        else
                        {
                            if (_arg_1.type == ACTIVE_INFO)
                            {
                                removeTabs();
                                activeInfo.addChild(tabA);
                                activeInfo.addChild(tabB);
                                activeInfo.addChild(tabC);
                                activeInfo.addChild(tabD);
                                vs.selectedIndex = 4;
                                activelookBefore = false;
                                refreshActiveSubInfo();
                            };
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get betAwardBtn():BasicDelayButton
        {
            return (this._850743920betAwardBtn);
        }

        public function set mobaiItem2(_arg_1:ShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._741819081mobaiItem2;
            if (_local_2 !== _arg_1)
            {
                this._741819081mobaiItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mobaiItem2", _local_2, _arg_1));
            };
        }

        public function set mobaiItem3(_arg_1:ShopSlot):void
        {
            var _local_2:Object;
            _local_2 = this._741819080mobaiItem3;
            if (_local_2 !== _arg_1)
            {
                this._741819080mobaiItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mobaiItem3", _local_2, _arg_1));
            };
        }

        private function resetBetView():void
        {
            betAwardItem0.type = GamePredef.TBL_ITEM_TEMPLATE;
            betAwardItem0.giid = 0;
            betAwardItem0.enabled = true;
            betAwardItem0.acceptable = false;
            betAwardItem = null;
            totalGold.removeAll();
            awardData.removeAll();
        }

        public function onGetBetBasicAward(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[160]);
            }
            else
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[161]);
            };
        }

        private function getBetBasicAward():void
        {
            _core.remote.call("teamCrossPKBetGetBasicAward", new Responder(onGetBetBasicAward));
        }

        [Bindable(event="propertyChange")]
        public function get betAwardItem1():ItemSlot
        {
            return (this._1527580306betAwardItem1);
        }

        [Bindable(event="propertyChange")]
        public function get betAwardItem2():ItemSlot
        {
            return (this._1527580307betAwardItem2);
        }

        public function set newEventsImg1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1849065287newEventsImg1;
            if (_local_2 !== _arg_1)
            {
                this._1849065287newEventsImg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newEventsImg1", _local_2, _arg_1));
            };
        }

        private function resethBetBtns():void
        {
            var _local_3:int;
            var _local_1:int = 1;
            var _local_2:int = 2;
            while (_local_2 < 5)
            {
                _local_3 = 0;
                while (_local_3 < _local_1)
                {
                    this[(("bet" + _local_2) + _local_3)].visible = false;
                    this[(("b" + _local_2) + _local_3)].visible = false;
                    _local_3++;
                };
                _local_1 = (_local_1 * 2);
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get teamName():Label
        {
            return (this._1668760952teamName);
        }

        [Bindable(event="propertyChange")]
        public function get betAwardItem0():ItemSlot
        {
            return (this._1527580305betAwardItem0);
        }

        [Bindable(event="propertyChange")]
        public function get activeInfo3Link():Text
        {
            return (this._1625641593activeInfo3Link);
        }

        public function set tabC(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._3552078tabC;
            if (_local_2 !== _arg_1)
            {
                this._3552078tabC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabC", _local_2, _arg_1));
            };
        }

        public function set tabA(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._3552076tabA;
            if (_local_2 !== _arg_1)
            {
                this._3552076tabA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabA", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vote2():BasicDelayButton
        {
            return (this._112396936vote2);
        }

        private function _CrossTeamFightPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                crossFightTitle.text = _arg_1;
            }, "crossFightTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000235));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image1.source = _arg_1;
            }, "_CrossTeamFightPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label1.text = _arg_1;
            }, "_CrossTeamFightPanel_Label1.text");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000233));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image2.source = _arg_1;
            }, "_CrossTeamFightPanel_Image2.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[68];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_IntroText1.htmlText = _arg_1;
            }, "_CrossTeamFightPanel_IntroText1.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tnameLab.text = _arg_1;
            }, "tnameLab.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                enrollBtn.label = _arg_1;
            }, "enrollBtn.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[120];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                enterTxt.text = _arg_1;
            }, "enterTxt.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[121];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                enterBtn.label = _arg_1;
            }, "enterBtn.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[123];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                teamInfo.text = _arg_1;
            }, "teamInfo.text");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[119];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                enrollLeftTime.text = _arg_1;
            }, "enrollLeftTime.text");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                gameAward.label = _arg_1;
            }, "gameAward.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[98];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                betAward.label = _arg_1;
            }, "betAward.label");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000233));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image3.source = _arg_1;
            }, "_CrossTeamFightPanel_Image3.source");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[92];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label7.text = _arg_1;
            }, "_CrossTeamFightPanel_Label7.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[93];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label8.text = _arg_1;
            }, "_CrossTeamFightPanel_Label8.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[99];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award0.titleTxt = _arg_1;
            }, "award0.titleTxt");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[100];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award1.titleTxt = _arg_1;
            }, "award1.titleTxt");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[101];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award2.titleTxt = _arg_1;
            }, "award2.titleTxt");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[102];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award3.titleTxt = _arg_1;
            }, "award3.titleTxt");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[103];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardMapTxt.text = _arg_1;
            }, "awardMapTxt.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[94];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label10.text = _arg_1;
            }, "_CrossTeamFightPanel_Label10.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[104];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award4.titleTxt = _arg_1;
            }, "award4.titleTxt");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[105];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award5.titleTxt = _arg_1;
            }, "award5.titleTxt");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[174];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label11.text = _arg_1;
            }, "_CrossTeamFightPanel_Label11.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[106];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award6.titleTxt = _arg_1;
            }, "award6.titleTxt");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[107];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                award7.titleTxt = _arg_1;
            }, "award7.titleTxt");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000233));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image4.source = _arg_1;
            }, "_CrossTeamFightPanel_Image4.source");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[92];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label12.text = _arg_1;
            }, "_CrossTeamFightPanel_Label12.text");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[98];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label13.text = _arg_1;
            }, "_CrossTeamFightPanel_Label13.text");
            result[29] = binding;
            binding = new Binding(this, function ():Object
            {
                return (awardData);
            }, function (_arg_1:Object):void
            {
                goldAward.dataProvider = _arg_1;
            }, "goldAward.dataProvider");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[112];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_DataGridColumn1.headerText = _arg_1;
            }, "_CrossTeamFightPanel_DataGridColumn1.headerText");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[113];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_DataGridColumn2.headerText = _arg_1;
            }, "_CrossTeamFightPanel_DataGridColumn2.headerText");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[114];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_DataGridColumn3.headerText = _arg_1;
            }, "_CrossTeamFightPanel_DataGridColumn3.headerText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[115];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_DataGridColumn4.headerText = _arg_1;
            }, "_CrossTeamFightPanel_DataGridColumn4.headerText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[116];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_DataGridColumn5.headerText = _arg_1;
            }, "_CrossTeamFightPanel_DataGridColumn5.headerText");
            result[35] = binding;
            binding = new Binding(this, function ():Object
            {
                return (totalGold);
            }, function (_arg_1:Object):void
            {
                totalGoldAward.dataProvider = _arg_1;
            }, "totalGoldAward.dataProvider");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[117];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_DataGridColumn6.headerText = _arg_1;
            }, "_CrossTeamFightPanel_DataGridColumn6.headerText");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                betAwardBtn.label = _arg_1;
            }, "betAwardBtn.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[109];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label14.text = _arg_1;
            }, "_CrossTeamFightPanel_Label14.text");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[110];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label15.text = _arg_1;
            }, "_CrossTeamFightPanel_Label15.text");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[118];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label16.text = _arg_1;
            }, "_CrossTeamFightPanel_Label16.text");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                betAwardItem0.slotType = _arg_1;
            }, "betAwardItem0.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                betAwardItem1.slotType = _arg_1;
            }, "betAwardItem1.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                betAwardItem2.slotType = _arg_1;
            }, "betAwardItem2.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_BAG);
            }, function (_arg_1:int):void
            {
                betAwardItem3.slotType = _arg_1;
            }, "betAwardItem3.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                basicBetAwardBtn.label = _arg_1;
            }, "basicBetAwardBtn.label");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[111];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_Label17.text = _arg_1;
            }, "_CrossTeamFightPanel_Label17.text");
            result[47] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightPanel_LinkButton1.setStyle("overSkin", _arg_1);
            }, "_CrossTeamFightPanel_LinkButton1.overSkin");
            result[48] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightPanel_LinkButton1.setStyle("upSkin", _arg_1);
            }, "_CrossTeamFightPanel_LinkButton1.upSkin");
            result[49] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightPanel_LinkButton1.setStyle("downSkin", _arg_1);
            }, "_CrossTeamFightPanel_LinkButton1.downSkin");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_LinkButton1.label = _arg_1;
            }, "_CrossTeamFightPanel_LinkButton1.label");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabA.label = _arg_1;
            }, "tabA.label");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabB.label = _arg_1;
            }, "tabB.label");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabC.label = _arg_1;
            }, "tabC.label");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabD.label = _arg_1;
            }, "tabD.label");
            result[55] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000232));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image5.source = _arg_1;
            }, "_CrossTeamFightPanel_Image5.source");
            result[56] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000283));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image6.source = _arg_1;
            }, "_CrossTeamFightPanel_Image6.source");
            result[57] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                worshipChampionTitle1.filters = _arg_1;
            }, "worshipChampionTitle1.filters");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vote1.label = _arg_1;
            }, "vote1.label");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vote2.label = _arg_1;
            }, "vote2.label");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vote3.label = _arg_1;
            }, "vote3.label");
            result[61] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightPanel_LinkButton2.setStyle("overSkin", _arg_1);
            }, "_CrossTeamFightPanel_LinkButton2.overSkin");
            result[62] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightPanel_LinkButton2.setStyle("upSkin", _arg_1);
            }, "_CrossTeamFightPanel_LinkButton2.upSkin");
            result[63] = binding;
            binding = new Binding(this, function ():Class
            {
                return (null);
            }, function (_arg_1:Class):void
            {
                _CrossTeamFightPanel_LinkButton2.setStyle("downSkin", _arg_1);
            }, "_CrossTeamFightPanel_LinkButton2.downSkin");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ASTROLOGIC_PANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightPanel_LinkButton2.label = _arg_1;
            }, "_CrossTeamFightPanel_LinkButton2.label");
            result[65] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000263));
            }, function (_arg_1:Object):void
            {
                newEventsBG.source = _arg_1;
            }, "newEventsBG.source");
            result[66] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000269));
            }, function (_arg_1:Object):void
            {
                right1.source = _arg_1;
            }, "right1.source");
            result[67] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000264));
            }, function (_arg_1:Object):void
            {
                right2.source = _arg_1;
            }, "right2.source");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet40.url = _arg_1;
            }, "bet40.url");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet41.url = _arg_1;
            }, "bet41.url");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet42.url = _arg_1;
            }, "bet42.url");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet43.url = _arg_1;
            }, "bet43.url");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet30.url = _arg_1;
            }, "bet30.url");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet31.url = _arg_1;
            }, "bet31.url");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ResManager.getResUrl(2060090400041);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bet20.url = _arg_1;
            }, "bet20.url");
            result[75] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b40.source = _arg_1;
            }, "b40.source");
            result[76] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b41.source = _arg_1;
            }, "b41.source");
            result[77] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b42.source = _arg_1;
            }, "b42.source");
            result[78] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b43.source = _arg_1;
            }, "b43.source");
            result[79] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b30.source = _arg_1;
            }, "b30.source");
            result[80] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b31.source = _arg_1;
            }, "b31.source");
            result[81] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000297));
            }, function (_arg_1:Object):void
            {
                b20.source = _arg_1;
            }, "b20.source");
            result[82] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000234));
            }, function (_arg_1:Object):void
            {
                activeInfoBG.source = _arg_1;
            }, "activeInfoBG.source");
            result[83] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_TITLE]);
            }, function (_arg_1:Array):void
            {
                activeLookBeforeBtn.filters = _arg_1;
            }, "activeLookBeforeBtn.filters");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[141];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                activeLookBeforeBtn.label = _arg_1;
            }, "activeLookBeforeBtn.label");
            result[85] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000239));
            }, function (_arg_1:Object):void
            {
                horizontalCenterPre.source = _arg_1;
            }, "horizontalCenterPre.source");
            result[86] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000238));
            }, function (_arg_1:Object):void
            {
                horizontalCenterNext.source = _arg_1;
            }, "horizontalCenterNext.source");
            result[87] = binding;
            binding = new RepeatableBinding(this, function (_arg_1:Array, _arg_2:Array):Object
            {
                return (activeLines.mx_internal::getItemAt(_arg_2[0]));
            }, function (_arg_1:Object, _arg_2:Array):void
            {
                _CrossTeamFightPanel_CrossTeamFightActiveLine1[_arg_2[0]].refreshData = _arg_1;
            }, "_CrossTeamFightPanel_CrossTeamFightActiveLine1.refreshData");
            result[88] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000263));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightPanel_Image24.source = _arg_1;
            }, "_CrossTeamFightPanel_Image24.source");
            result[89] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get betAwardItem3():ItemSlot
        {
            return (this._1527580308betAwardItem3);
        }

        private function activeLookBefore():void
        {
            activelookBefore = true;
            activeInfo1.visible = false;
            activeInfo2.visible = true;
            activeInfo3.visible = false;
            var _local_1:int = int(activeInfoNum[tabSelect]);
            var _local_2:int = int((Math.ceil((Math.log(_local_1) / Math.log(2))) + 1));
            _local_2 = (_local_2 - activeInfoDataIndex);
            if (((_local_2 <= 4) && (_local_2 > 0)))
            {
                activeInfo3Txt.source = ResManager.getIconUrl(4130220000273);
                activeInfo3Link.htmlText = Language.CROSS_FIGHT_PANEL_U[142];
                activeInfo3Link.mouseEnabled = true;
                activeInfo1.visible = false;
                activeInfo2.visible = false;
                activeInfo3.visible = true;
                return;
            };
            if ((((!(activeInfoData)) || (!(activeInfoData[tabSelect]))) || (!(activeInfoData[tabSelect][_local_2]))))
            {
                activeInfo1.visible = true;
                activeInfo2.visible = false;
                if (tabSelect == TEAM_CROSSPK_GROUP)
                {
                    activeInfoBG.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? 4130220000278 : 4130220000277));
                }
                else
                {
                    activeInfoBG.source = ResManager.getIconUrl(4130220000278);
                };
                activeInfo3.visible = false;
                return;
            };
            activeInfo1.visible = false;
            activeInfo2.visible = true;
            activeInfoBG.source = ResManager.getIconUrl((((TEAM_CROSSPK_STATE == 1) || (TEAM_CROSSPK_STATE >= 5)) ? 4130220000242 : 4130220000234));
            if (nextBattleTime == 0)
            {
                if (TEAM_CROSSPK_STATE >= 5)
                {
                    timeStartActive.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:08");
                }
                else
                {
                    timeStartActive.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:05");
                };
            }
            else
            {
                timeStartActive.text = (Language.CROSS_FIGHT_PANEL_U[134] + getNextBattleTime());
            };
            timeNowActive.text = (Language.CROSS_FIGHT_PANEL_U[133] + getSetverTime());
            activeInfo3.visible = false;
            activeTitle.source = ResManager.getIconUrl((((TEAM_CROSSPK_STATE == 1) || (TEAM_CROSSPK_STATE >= 5)) ? activeInfoIMGArrFinal[activeInfoDataIndex] : activeInfoIMGArr[activeInfoDataIndex]));
            rightIMG.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? 4130220000268 : 4130220000267));
            var _local_3:Object = activeInfoData[tabSelect][_local_2];
            activeLines.dataProvider = _local_3;
            if (((activeInfoDataIndex == 0) || (!(activeInfoData[tabSelect][(_local_2 + 1)]))))
            {
                horizontalCenterPre.visible = false;
            }
            else
            {
                horizontalCenterPre.visible = true;
            };
            if (activeInfoData[tabSelect][(_local_2 - 1)])
            {
                horizontalCenterNext.visible = true;
            }
            else
            {
                horizontalCenterNext.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get bet20():CharactorShowCanvas
        {
            return (this._93627023bet20);
        }

        private function refreshFinalInfo():void
        {
            var _local_1:Object;
            if ((((!(activeInfoData)) || (!(activeInfoData[tabSelect]))) || ((((!(activeInfoData[tabSelect][4])) && (!(activeInfoData[tabSelect][3]))) && (!(activeInfoData[tabSelect][2]))) && (!(activeInfoData[tabSelect][1])))))
            {
                newEventsImg1.source = ResManager.getIconUrl(((TEAM_CROSSPK_STATE >= 5) ? 4130220000276 : 4130220000275));
                newEvents1.visible = true;
                newEvents2.visible = false;
            }
            else
            {
                newEvents1.visible = false;
                newEvents2.visible = true;
                if (nextBattleTime == 0)
                {
                    if (TEAM_CROSSPK_STATE >= 5)
                    {
                        timeStart.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:08");
                    }
                    else
                    {
                        timeStart.text = (Language.CROSS_FIGHT_PANEL_U[134] + "20:05");
                    };
                }
                else
                {
                    timeStart.text = (Language.CROSS_FIGHT_PANEL_U[134] + getNextBattleTime());
                };
                timeNow.text = (Language.CROSS_FIGHT_PANEL_U[133] + getSetverTime());
                _local_1 = activeInfoData[tabSelect];
                refreshFinalData(_local_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get vote3():BasicDelayButton
        {
            return (this._112396937vote3);
        }

        public function set tabD(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._3552079tabD;
            if (_local_2 !== _arg_1)
            {
                this._3552079tabD = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabD", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bet31():CharactorShowCanvas
        {
            return (this._93627055bet31);
        }

        public function __tabA_click(_arg_1:MouseEvent):void
        {
            groupTab(0);
        }

        public function set tabB(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._3552077tabB;
            if (_local_2 !== _arg_1)
            {
                this._3552077tabB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get bet30():CharactorShowCanvas
        {
            return (this._93627054bet30);
        }

        public function set basicBetAwardBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1076583778basicBetAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1076583778basicBetAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "basicBetAwardBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        [Bindable(event="propertyChange")]
        public function get bet40():CharactorShowCanvas
        {
            return (this._93627085bet40);
        }

        [Bindable(event="propertyChange")]
        public function get bet41():CharactorShowCanvas
        {
            return (this._93627086bet41);
        }

        [Bindable(event="propertyChange")]
        public function get bet42():CharactorShowCanvas
        {
            return (this._93627087bet42);
        }

        [Bindable(event="propertyChange")]
        public function get bet43():CharactorShowCanvas
        {
            return (this._93627088bet43);
        }

        public function set timeNowActive(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1152106799timeNowActive;
            if (_local_2 !== _arg_1)
            {
                this._1152106799timeNowActive = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeNowActive", _local_2, _arg_1));
            };
        }

        private function setRandName():void
        {
            var _local_3:String;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            var _local_1:Object = _core.data.gameDataIndex[80];
            var _local_2:Array = [];
            for (_local_3 in _local_1)
            {
                if (_local_3 != "0")
                {
                    _local_2.push(_local_1[_local_3]);
                };
            };
            _local_1 = _local_2[Math.floor((Math.random() * _local_2.length))];
            _local_4 = rand3(_local_1);
            if (((!(_local_4)) || (((!(ToolKit.isEqual(_local_4.type, 32))) && (String(_local_4.name).length < 6)) && (Math.random() > 0.3))))
            {
                _local_5 = rand3(_local_1);
                while (((_local_4.id == _local_5.id) || (String((_local_4.name + _local_5.name)).length > 12)))
                {
                    _local_5 = rand3(_local_1);
                };
            };
            if (((_local_5) && (Math.floor((_local_4.type / 10)) == 2)))
            {
                tnameTxt.text = ((_local_4.name + "·") + _local_5.name);
            }
            else
            {
                tnameTxt.text = (_local_4.name + ((_local_5) ? _local_5.name : ""));
            };
            if (Math.random() > 0.7)
            {
                _local_6 = rand3(_core.data.gameDataIndex[80][0]).name;
                if (_local_6)
                {
                    tnameTxt.text = ((_local_6 + tnameTxt.text) + _local_6);
                };
            };
            if (String(Language.GAMEPREDEF_S[338]).indexOf(tnameTxt.text) > 0)
            {
                tnameTxt.text = "";
                setRandName();
            };
        }

        private function enter():void
        {
            _core.remote.call("crossPKTransport", new Responder(onEnter));
        }

        [Bindable(event="propertyChange")]
        public function get vote1():BasicDelayButton
        {
            return (this._112396935vote1);
        }

        public function onGetFinalAward(_arg_1:Object, _arg_2:int):void
        {
            var _local_3:CrossTeamFightAwardRect = this[("award" + (_arg_2 - 1))];
            if (_local_3)
            {
                _local_3.onGetFinalAward(_arg_1);
            };
        }

        private function championInfoReset():void
        {
            vote1.enabled = false;
            vote2.enabled = false;
            vote3.enabled = false;
            var _local_1:int;
            while (_local_1 < 4)
            {
                this[("winner" + _local_1)].resetModel();
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get newEvents():Canvas
        {
            return (this._995049767newEvents);
        }

        public function onGetBetData(_arg_1:Object):void
        {
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:Object;
            var _local_14:String;
            if ((((!(_arg_1)) || (!(_arg_1.data))) || (!(_arg_1.team))))
            {
                basicBetAwardBtn.enabled = false;
                totalGold.removeAll();
                return;
            };
            resetBetView();
            var _local_2:Boolean = _arg_1.basicOpen;
            var _local_3:Boolean = _arg_1.basicGet;
            betData = _arg_1.data;
            betTeamData = _arg_1.team;
            awardData.removeAll();
            var _local_4:int;
            var _local_5:int;
            var _local_6:String = TEAM_CROSSPK_GROUP;
            if (TEAM_CROSSPK_STATE < 6)
            {
                _local_6 = tabKey[((tabKey.indexOf(_local_6) + 3) % tabKey.length)];
            };
            var _local_7:int;
            if ((((pkFinalList) && (pkFinalList.state)) && (pkFinalList.state[_local_6])))
            {
                _local_7 = pkFinalList.state[_local_6].state;
            };
            var _local_8:int = 4;
            while (_local_8 > 1)
            {
                if (_local_7 < _local_8)
                {
                    _local_9 = betData[_local_8];
                    if (_local_9)
                    {
                        _local_10 = pkFinalList.list[_local_6][_local_8];
                        for (_local_11 in _local_9)
                        {
                            _local_12 = _local_9[_local_11];
                            _local_13 = betTeamData[_local_11];
                            if (((_local_12) && (_local_13)))
                            {
                                _local_4 = (_local_4 + int(_local_12.award));
                                _local_5 = (_local_5 + int(_local_12.bet));
                                _local_14 = getResultFromList(_local_10, Number(_local_11));
                                awardData.addItem({
                                    "teamName":_local_13.tname,
                                    "turn":Language.CROSS_FIGHT_PANEL_U[(145 + _local_8)],
                                    "result":_local_14,
                                    "bet":_local_12.bet,
                                    "award":_local_12.award
                                });
                            };
                        };
                    };
                };
                _local_8--;
            };
            totalGold.removeAll();
            totalGold.addItem({"num":_local_4});
            betAwardBtn.enabled = ((TEAM_CROSSPK_STATE == 7) || ((TEAM_CROSSPK_STATE >= 1) && (TEAM_CROSSPK_STATE <= 5)));
            if (((_local_2) && (!(_local_3))))
            {
                basicBetAwardBtn.enabled = ((_local_5 - _local_4) >= BET_BASIC_AWARD_GOLD);
                _local_8 = 0;
                while (_local_8 < betAwardItems.length)
                {
                    if ((_local_5 - _local_4) >= betAwardItems[_local_8][0])
                    {
                        betAwardItem = betAwardItems[_local_8];
                    }
                    else
                    {
                        break;
                    };
                    _local_8++;
                };
                if (((betAwardItem) && (betAwardItem[1])))
                {
                    betAwardItem0.type = GamePredef.TBL_ITEM_TEMPLATE;
                    betAwardItem0.giid = betAwardItem[1];
                    betAwardItem0.enabled = true;
                    betAwardItem0.acceptable = false;
                }
                else
                {
                    betAwardItem0.type = GamePredef.TBL_ITEM_TEMPLATE;
                    betAwardItem0.giid = 0;
                    betAwardItem0.enabled = true;
                    betAwardItem0.acceptable = false;
                };
            }
            else
            {
                betAwardItem0.type = GamePredef.TBL_ITEM_TEMPLATE;
                betAwardItem0.giid = 0;
                betAwardItem0.enabled = true;
                betAwardItem0.acceptable = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get wantEnroll():Canvas
        {
            return (this._752368938wantEnroll);
        }

        public function set award0(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038221award0;
            if (_local_2 !== _arg_1)
            {
                this._1405038221award0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award0", _local_2, _arg_1));
            };
        }

        public function set award1(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038220award1;
            if (_local_2 !== _arg_1)
            {
                this._1405038220award1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award1", _local_2, _arg_1));
            };
        }

        public function set award2(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038219award2;
            if (_local_2 !== _arg_1)
            {
                this._1405038219award2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award2", _local_2, _arg_1));
            };
        }

        public function set award5(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038216award5;
            if (_local_2 !== _arg_1)
            {
                this._1405038216award5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award5", _local_2, _arg_1));
            };
        }

        public function set award3(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038218award3;
            if (_local_2 !== _arg_1)
            {
                this._1405038218award3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get activeTitle():Image
        {
            return (this._1061804302activeTitle);
        }

        public function set award7(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038214award7;
            if (_local_2 !== _arg_1)
            {
                this._1405038214award7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award7", _local_2, _arg_1));
            };
        }

        public function set award4(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038217award4;
            if (_local_2 !== _arg_1)
            {
                this._1405038217award4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get totalGoldAward():DataGrid
        {
            return (this._492833031totalGoldAward);
        }

        public function ___CrossTeamFightPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay(0);
        }

        [Bindable(event="propertyChange")]
        public function get lookAward():Canvas
        {
            return (this._1102515966lookAward);
        }

        public function set award6(_arg_1:CrossTeamFightAwardRect):void
        {
            var _local_2:Object;
            _local_2 = this._1405038215award6;
            if (_local_2 !== _arg_1)
            {
                this._1405038215award6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "award6", _local_2, _arg_1));
            };
        }

        public function __betAwardBtn_click(_arg_1:MouseEvent):void
        {
            getBetAward();
        }

        [Bindable(event="propertyChange")]
        public function get treeTeam():ButtonTree
        {
            return (this._1386162971treeTeam);
        }

        public function set gameAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._973530507gameAward;
            if (_local_2 !== _arg_1)
            {
                this._973530507gameAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "gameAward", _local_2, _arg_1));
            };
        }

        public function set right1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._931102315right1;
            if (_local_2 !== _arg_1)
            {
                this._931102315right1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right1", _local_2, _arg_1));
            };
        }

        public function set right3(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._931102313right3;
            if (_local_2 !== _arg_1)
            {
                this._931102313right3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right3", _local_2, _arg_1));
            };
        }

        private function activeNext():void
        {
            activeInfoDataIndex++;
            refreshActiveSubInfo();
        }

        private function refreshChampionInfo():void
        {
            var _local_2:Object;
            var _local_4:int;
            worshipChampionTitle2.text = Language.CROSS_FIGHT_PANEL_U[153].toString().replace("{group}", tabSelect);
            worshipChampionTitle1.text = "";
            if (((!(pkFinalList)) || (!(pkFinalList.team))))
            {
                championInfoReset();
                return;
            };
            var _local_1:Object = pkFinalList.list;
            if (((((!(_local_1)) || (!(_local_1[tabSelect]))) || (!(_local_1[tabSelect][2]))) || (!(_local_1[tabSelect][2][0]))))
            {
                championInfoReset();
                return;
            };
            var _local_3:Object = _local_1[tabSelect][2][0];
            if (_local_3.status == 3)
            {
                _local_2 = pkFinalList.team[tabSelect][_local_3[1]];
            }
            else
            {
                if (!_local_3.win)
                {
                    championInfoReset();
                    return;
                };
                _local_2 = pkFinalList.team[tabSelect][_local_3.win];
            };
            if (!_local_2)
            {
                championInfoReset();
            }
            else
            {
                worshipChampionTitle1.text = _local_2.tname;
                vote1.enabled = true;
                vote2.enabled = true;
                vote3.enabled = true;
                _local_4 = 0;
                while (_local_4 < 4)
                {
                    this[("winner" + _local_4)].refresh(pkFinalList, tabSelect);
                    _local_4++;
                };
            };
        }

        public function set activeLines(_arg_1:Repeater):void
        {
            var _local_2:Object;
            _local_2 = this._1069198439activeLines;
            if (_local_2 !== _arg_1)
            {
                this._1069198439activeLines = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeLines", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabB():BasicGlowButton
        {
            return (this._3552077tabB);
        }

        [Bindable(event="propertyChange")]
        public function get tabA():BasicGlowButton
        {
            return (this._3552076tabA);
        }

        [Bindable(event="propertyChange")]
        public function get tabC():BasicGlowButton
        {
            return (this._3552078tabC);
        }

        private function _CrossTeamFightPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CrossTeamFightPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function set timeStart(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._25573781timeStart;
            if (_local_2 !== _arg_1)
            {
                this._25573781timeStart = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeStart", _local_2, _arg_1));
            };
        }

        private function set awardData(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1258317735awardData;
            if (_local_2 !== _arg_1)
            {
                this._1258317735awardData = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardData", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabD():BasicGlowButton
        {
            return (this._3552079tabD);
        }

        [Bindable(event="propertyChange")]
        public function get newEventsImg1():Image
        {
            return (this._1849065287newEventsImg1);
        }

        public function onEnroll(_arg_1:Object):void
        {
            var _local_2:String;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                onGetEnroll({
                    "type":1,
                    "tName":_arg_1.tname
                });
            }
            else
            {
                if (_arg_1.data)
                {
                    if (_arg_1.data == 0)
                    {
                        _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[73]);
                    }
                    else
                    {
                        if (((_arg_1.data == 1) || (_arg_1.data == 2)))
                        {
                            _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[71]);
                        }
                        else
                        {
                            if (_arg_1.data == 3)
                            {
                                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[72]);
                            }
                            else
                            {
                                if (_arg_1.data == 4)
                                {
                                    _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[74]);
                                }
                                else
                                {
                                    if (_arg_1.data == 5)
                                    {
                                        _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[168]);
                                    }
                                    else
                                    {
                                        if (_arg_1.data == 11)
                                        {
                                            if (_arg_1.name)
                                            {
                                                _local_2 = Language.CROSS_FIGHT_PANEL_U[75];
                                                _local_2 = _local_2.replace("{name}", _arg_1.name);
                                                _core.sysMsg(_local_2);
                                            }
                                            else
                                            {
                                                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[76]);
                                            };
                                        }
                                        else
                                        {
                                            if (_arg_1.data == -1)
                                            {
                                                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[77]);
                                            }
                                            else
                                            {
                                                if (_arg_1.data == -2)
                                                {
                                                    _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[79]);
                                                }
                                                else
                                                {
                                                    if (_arg_1.data == -3)
                                                    {
                                                        _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[80]);
                                                    }
                                                    else
                                                    {
                                                        if (_arg_1.data == -4)
                                                        {
                                                            _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[81]);
                                                        }
                                                        else
                                                        {
                                                            if (_arg_1.data == -5)
                                                            {
                                                                _local_2 = Language.CROSS_FIGHT_PANEL_U[82];
                                                                _local_2 = _local_2.replace("{name}", _arg_1.name);
                                                                _core.sysMsg(_local_2);
                                                                if (askAlert)
                                                                {
                                                                    PopUpManager.removePopUp(askAlert);
                                                                    askAlert = null;
                                                                };
                                                            }
                                                            else
                                                            {
                                                                if (_arg_1.data == -6)
                                                                {
                                                                    _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[83]);
                                                                }
                                                                else
                                                                {
                                                                    if (_arg_1.data == -7)
                                                                    {
                                                                        _local_2 = Language.CROSS_FIGHT_PANEL_U[89];
                                                                        _local_2 = _local_2.replace("{group}", _arg_1.name);
                                                                        _core.sysMsg(_local_2);
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        public function __horizontalCenterPre_click(_arg_1:MouseEvent):void
        {
            activePre();
        }

        public function onTeamCrossPKAskMember(name:String):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("teamCrossPKMemberAgree", null, true);
                }
                else
                {
                    _core.remote.call("teamCrossPKMemberAgree", null, false);
                };
            };
            var timeHandler:Function = function ():void
            {
                if (askAlert)
                {
                    PopUpManager.removePopUp(askAlert);
                    askAlert = null;
                };
            };
            var str:String = Language.CROSS_FIGHT_PANEL_U[78];
            str = str.replace("{name}", name);
            askAlert = Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
            setTimeout(timeHandler, 30000);
        }

        public function __bet43_click(_arg_1:MouseEvent):void
        {
            toBet(4, 3);
        }

        private function set totalGold(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._577663548totalGold;
            if (_local_2 !== _arg_1)
            {
                this._577663548totalGold = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalGold", _local_2, _arg_1));
            };
        }

        public function set right2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._931102314right2;
            if (_local_2 !== _arg_1)
            {
                this._931102314right2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right2", _local_2, _arg_1));
            };
        }

        public function __horizontalCenterNext_click(_arg_1:MouseEvent):void
        {
            activeNext();
        }

        override public function initialize():void
        {
            var target:CrossTeamFightPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossTeamFightPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossTeamFightPanelWatcherSetupUtil");
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
        public function get activeLines():Repeater
        {
            return (this._1069198439activeLines);
        }

        private function getResultFromList(_arg_1:Object, _arg_2:Number):String
        {
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:Number;
            var _local_6:Number;
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                return (Language.CROSS_FIGHT_PANEL_U[175]);
            };
            for (_local_3 in _arg_1)
            {
                _local_4 = _arg_1[_local_3];
                if (_local_4)
                {
                    _local_5 = _local_4[1];
                    _local_6 = _local_4[2];
                    if (!((!(_local_5 == _arg_2)) && (!(_local_6 == _arg_2))))
                    {
                        if (_local_4.win)
                        {
                            if (_local_4.win == _arg_2)
                            {
                                return (Language.CROSS_FIGHT_PANEL_U[150]);
                            };
                            return (Language.CROSS_FIGHT_PANEL_U[151]);
                        };
                        return (Language.CROSS_FIGHT_PANEL_U[175]);
                    };
                };
            };
            return (Language.CROSS_FIGHT_PANEL_U[175]);
        }

        public function set winner1(_arg_1:TeamCrossFightWinnerModel):void
        {
            var _local_2:Object;
            _local_2 = this._1349781458winner1;
            if (_local_2 !== _arg_1)
            {
                this._1349781458winner1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winner1", _local_2, _arg_1));
            };
        }

        public function set enrollBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1943366614enrollBtn;
            if (_local_2 !== _arg_1)
            {
                this._1943366614enrollBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enrollBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get awardData():ArrayCollection
        {
            return (this._1258317735awardData);
        }

        public function set winner3(_arg_1:TeamCrossFightWinnerModel):void
        {
            var _local_2:Object;
            _local_2 = this._1349781460winner3;
            if (_local_2 !== _arg_1)
            {
                this._1349781460winner3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winner3", _local_2, _arg_1));
            };
        }

        public function set winner0(_arg_1:TeamCrossFightWinnerModel):void
        {
            var _local_2:Object;
            _local_2 = this._1349781457winner0;
            if (_local_2 !== _arg_1)
            {
                this._1349781457winner0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winner0", _local_2, _arg_1));
            };
        }

        public function __betAward_click(_arg_1:MouseEvent):void
        {
            awardTab(1);
        }

        public function set activeInfo1(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1071827491activeInfo1;
            if (_local_2 !== _arg_1)
            {
                this._1071827491activeInfo1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfo1", _local_2, _arg_1));
            };
        }

        public function set activeInfo3(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1071827489activeInfo3;
            if (_local_2 !== _arg_1)
            {
                this._1071827489activeInfo3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfo3", _local_2, _arg_1));
            };
        }

        public function __activeLookBeforeBtn_click(_arg_1:MouseEvent):void
        {
            activeLookBefore();
        }

        public function set winner2(_arg_1:TeamCrossFightWinnerModel):void
        {
            var _local_2:Object;
            _local_2 = this._1349781459winner2;
            if (_local_2 !== _arg_1)
            {
                this._1349781459winner2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winner2", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossTeamFightPanel_DataGridColumn6 = _local_1;
            _local_1.resizable = false;
            _local_1.draggable = false;
            _local_1.width = 70;
            _local_1.sortable = false;
            _local_1.dataField = "num";
            _local_1.setStyle("textAlign", "center");
            _local_1.setStyle("fontSize", 16);
            _local_1.setStyle("color", 0xFFFF00);
            _local_1.setStyle("fontWeight", "bold");
            BindingManager.executeBindings(this, "_CrossTeamFightPanel_DataGridColumn6", _CrossTeamFightPanel_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get winner0():TeamCrossFightWinnerModel
        {
            return (this._1349781457winner0);
        }

        public function set goldAward(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._1313061411goldAward;
            if (_local_2 !== _arg_1)
            {
                this._1313061411goldAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "goldAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get winner2():TeamCrossFightWinnerModel
        {
            return (this._1349781459winner2);
        }

        public function set activeInfo2(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1071827490activeInfo2;
            if (_local_2 !== _arg_1)
            {
                this._1071827490activeInfo2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activeInfo2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get enrollBtn():DelayButton
        {
            return (this._1943366614enrollBtn);
        }

        [Bindable(event="propertyChange")]
        public function get winner1():TeamCrossFightWinnerModel
        {
            return (this._1349781458winner1);
        }

        [Bindable(event="propertyChange")]
        public function get winner3():TeamCrossFightWinnerModel
        {
            return (this._1349781460winner3);
        }

        private function getNextBattleTime():String
        {
            if (isNaN(nextBattleTime))
            {
                return ("");
            };
            var _local_1:Date = new Date();
            _local_1.setTime(nextBattleTime);
            return (TimeUtil.dateFormatter.format(_local_1));
        }

        public function set awardVs(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._606510598awardVs;
            if (_local_2 !== _arg_1)
            {
                this._606510598awardVs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardVs", _local_2, _arg_1));
            };
        }

        public function set r1(_arg_1:CrossTeamFightResultInfo):void
        {
            var _local_2:Object;
            _local_2 = this._3583r1;
            if (_local_2 !== _arg_1)
            {
                this._3583r1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "r1", _local_2, _arg_1));
            };
        }

        public function __enrollBtn_click(_arg_1:MouseEvent):void
        {
            enroll();
        }


    }
}//package com.qeedoo.ui.view.compDragable

