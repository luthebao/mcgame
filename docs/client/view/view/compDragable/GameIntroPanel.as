// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GameIntroPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import com.qeedoo.game.config.Language;
    import flash.utils.Timer;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.containers.ViewStack;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.TextInput;
    import mx.controls.DataGrid;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.RoundedButton;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import flash.net.URLLoader;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.collections.ArrayCollection;
    import com.qeedoo.ui.view.comp.PentagonCanvas;
    import mx.controls.dataGridClasses.DataGridColumn;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.List;
    import com.qeedoo.ui.view.comp.LinkTextArea;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.RadioButtonGroup;
    import mx.controls.TextArea;
    import mx.controls.RadioButton;
    import mx.controls.LinkButton;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.VRule;
    import com.qeedoo.game.system.Core;
    import mx.collections.Sort;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.binding.BindingManager;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.utils.TimeUtil;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RendererItemArray;
    import flash.net.Responder;
    import mx.events.ListEvent;
    import mx.events.ItemClickEvent;
    import com.qeedoo.game.view.ViewManager;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.adobe.crypto.MD5;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.net.URLRequest;
    import com.qeedoo.ui.view.comp.ActivityDetail;
    import flash.utils.getDefinitionByName;
    import flash.events.TimerEvent;
    import mx.collections.SortField;
    import mx.utils.ObjectUtil;
    import mx.controls.dataGridClasses.DataGridItemRenderer;
    import flash.net.navigateToURL;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.ui.view.comp.RendererItemSlot;
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

    public class GameIntroPanel extends DragableCanvas implements IBindingClient 
    {

        private static const DateArr:Array = [Language.ACTIVEPANEL_U[33], Language.ACTIVEPANEL_U[34], Language.ACTIVEPANEL_U[35], Language.ACTIVEPANEL_U[36], Language.ACTIVEPANEL_U[37], Language.ACTIVEPANEL_U[38], Language.ACTIVEPANEL_U[39]];
        private static var onlineTimer:Timer;
        private static var initDate:Number = 0;
        private static var timerDate:Number = 0;
        private static const PRE_1:String = "N";
        private static const PRE_2:String = "G";
        private static const PRE_3:String = "D";
        private static const PRE_A:String = "A";
        private static const PRE_O:String = "O";
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const PET_CAN_USE_COLOR:uint = 0xFFFFFF;
        private const INIT_SYS_AWARD_INTERVAL:int = 300000;
        private const PET_CAN_NOT_USE_COLOR:uint = 0xFF0000;
        private var _692413227classImg:Image;
        private var _1091882814factor1:RoundedLabel;
        private var _3773vs:ViewStack;
        private var _1554141552tabBtn7:BasicGlowButton;
        private var _110351504ti_tz:TextInput;
        private var _464115109petLevel:RoundedLabel;
        private var _804284629consumeActivity:DataGrid;
        private var _839070479consumeActDate5:IntroText;
        private var _836980328consumeActivity3:DataGrid;
        private var _112496008vs_fl:ViewStack;
        private var _1656558897selectACar:RoundedButton;
        private var _1742477111currentFestTxt:DescriptionLabel;
        private var _1632084556StageConsumeBtn2:BasicDelayButton;
        private var _529071784trolleyDG:DataGrid;
        private var noticeLoader0:URLLoader;
        private var _1596220963skillSlot2:ItemSlot;
        private var noticeLoader1:URLLoader;
        private var _1978100422selectB:RoundedButton;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _296859264activityItemList:ArrayCollection;
        private var _805962357propertyPentagon:PentagonCanvas;
        private var _1198028873dailySlot:ItemSlot;
        private var _939851608actAward3:ItemSlot;
        private var _411634733getConsumeAwardBtn2:BasicDelayButton;
        private var _1269814196noticeBtn0:BasicGlowButton;
        private var _1197257913getAwardsFromNet:BasicDelayButton;
        private var _1686904016consumeAcMsg3:String = "";
        public var _GameIntroPanel_DataGridColumn10:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn11:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn12:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn13:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn14:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn15:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn16:DataGridColumn;
        private var _344383225DG_diary:DataGrid;
        public var _GameIntroPanel_DataGridColumn18:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn19:DataGridColumn;
        private var selectedID:Number;
        private var _839070484consumeActDate0:IntroText;
        private var _425076048getAwardsByCode:BasicDelayButton;
        private var _1858597720sportActiveList:ArrayCollection;
        public var _GameIntroPanel_DataGridColumn20:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn21:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn22:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn23:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn24:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn25:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn26:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn27:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn29:DataGridColumn;
        public var _GameIntroPanel_BasicTxtButton10:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton11:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton12:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton13:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton14:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton15:BasicTxtButton;
        public var _GameIntroPanel_DataGridColumn28:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn30:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn31:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn17:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn33:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn34:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn35:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn36:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn37:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn38:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn32:DataGridColumn;
        private var _1846619111List_fl:List;
        private var _885700253consumeAcMsg:String = "";
        private var _1162960632actBtn2:BasicGlowButton;
        private var _1091882811factor4:RoundedLabel;
        private var _839070480consumeActDate4:IntroText;
        public var _GameIntroPanel_RoundedLabel2:RoundedLabel;
        public var _GameIntroPanel_RoundedLabel3:RoundedLabel;
        public var _GameIntroPanel_RoundedLabel4:RoundedLabel;
        public var _GameIntroPanel_RoundedLabel5:RoundedLabel;
        public var _GameIntroPanel_RoundedLabel6:RoundedLabel;
        private var _3701ti:TextInput;
        public var _GameIntroPanel_DataGridColumn1:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn3:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn4:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn5:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn6:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn7:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn2:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn8:DataGridColumn;
        public var _GameIntroPanel_DataGridColumn9:DataGridColumn;
        private var _1950825047DG_boss:DataGrid;
        private var _404225515contiSlot:ItemSlot;
        private var _939851609actAward2:ItemSlot;
        private var _1554141554tabBtn5:BasicGlowButton;
        public var _GameIntroPanel_LinkTextArea1:LinkTextArea;
        private var sportVbInitFlag:Boolean = false;
        private var _1281920134fbList:ArrayCollection;
        public var carStyle:int = 0;
        private var _1554912757vb_earnMoney:VBox;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _836980327consumeActivity2:DataGrid;
        private var _411634732getConsumeAwardBtn1:BasicDelayButton;
        private var _1632084555StageConsumeBtn3:BasicDelayButton;
        private var _836980330consumeActivity5:DataGrid;
        private var _1686904017consumeAcMsg2:String = "";
        private var _1002706919simplecanvas1:SimpleCanvas;
        private var _939851610actAward1:ItemSlot;
        private var _1510655195getContiBtn:BasicGlowButton;
        private var _808640669levelUpActiveList:ArrayCollection;
        private var _1176746971getDiscountBtn:BasicGlowButton;
        private var _267684296rgActives:RadioButtonGroup;
        private var _3310i7:ItemSlot;
        private var eqtVbInitFlag:Boolean = false;
        private var _1185079624img_fb:Image;
        private var _634901781airBossList:ArrayCollection;
        public var itemShowStyle:int = 0;
        private var _438810531ta_festDesc:IntroText;
        private var _570251182groundBossList:ArrayCollection;
        private var activeVbInitFlag:Boolean = false;
        private var pets_load:Boolean = false;
        private var _1162960634actBtn0:BasicGlowButton;
        private var _839070483consumeActDate1:IntroText;
        private var _1191222340nextConti:int = 0;
        private var _1091882813factor2:RoundedLabel;
        private var _1596220964skillSlot3:ItemSlot;
        public var _GameIntroPanel_BasicDelayButton3:BasicDelayButton;
        private var _436537771_selectedDesc:TextArea;
        private var _1554141551tabBtn8:BasicGlowButton;
        private var _536153440vs_stageConsume:ViewStack;
        private var _itemIcon:Image;
        private var _1733959322lb_festdesc:DescriptionLabel;
        private var _934044862rgBoss:RadioButtonGroup;
        private var _1978100421selectA:RoundedButton;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _939851611actAward0:ItemSlot;
        private var selectedName:String;
        private var _2118150722DG_active:DataGrid;
        public var _GameIntroPanel_BasicTxtButton3:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton4:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton5:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton6:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton1:BasicTxtButton;
        public var _GameIntroPanel_BasicTxtButton2:BasicTxtButton;
        private var pointsCar:ArrayCollection;
        public var _GameIntroPanel_BasicTxtButton8:BasicTxtButton;
        private var _1233647451getConsumeAwardBtn:BasicDelayButton;
        private var _74227366getFestBtn:BasicGlowButton;
        private var _411634736getConsumeAwardBtn5:BasicDelayButton;
        private var seletedItem:Object;
        public var _GameIntroPanel_RoundedButton3:RoundedButton;
        private var _1686904018consumeAcMsg1:String = "";
        private var _2088576552equiptActiveList:ArrayCollection;
        private var _836980326consumeActivity1:DataGrid;
        private var _1132705419continueDay:int = 0;
        private var _110351242ti_ll:TextInput;
        private var _713858815DiscountSlot:ItemSlot;
        private var _1632084558StageConsumeBtn0:BasicDelayButton;
        private var _1142482604earnMoneyActiveList:ArrayCollection;
        private var _1632084554StageConsumeBtn4:BasicDelayButton;
        private var _1162960631actBtn3:BasicGlowButton;
        public var _GameIntroPanel_Image4:Image;
        private var _79606734TA_fb:LinkTextArea;
        public var _GameIntroPanel_RadioButton1:RadioButton;
        public var _GameIntroPanel_RadioButton2:RadioButton;
        public var _GameIntroPanel_RadioButton3:RadioButton;
        public var _GameIntroPanel_RadioButton4:RadioButton;
        private var lastInitTime:Number = 0;
        public var _GameIntroPanel_BasicGlowButton12:BasicGlowButton;
        public var _GameIntroPanel_BasicGlowButton13:BasicGlowButton;
        private var _58843066xmlActivity:XML;
        private var _719803452consumeActDate:IntroText;
        private var _1809115815enableActiveList:ArrayCollection;
        private var _933747994tabBtn10:BasicGlowButton;
        private var _534379936_haveDiaryAwarded:Boolean = false;
        private var _1064241878getGiftBtn:BasicGlowButton;
        private var _1803236098img_active:Image;
        private var points:ArrayCollection;
        public var _GameIntroPanel_IntroText1:IntroText;
        public var _GameIntroPanel_IntroText2:IntroText;
        public var _GameIntroPanel_IntroText4:IntroText;
        public var _GameIntroPanel_IntroText5:IntroText;
        public var _GameIntroPanel_IntroText6:IntroText;
        public var _GameIntroPanel_IntroText7:IntroText;
        private var obj:Object;
        public var _GameIntroPanel_RoundedLabel12:RoundedLabel;
        private var _1091882815factor0:RoundedLabel;
        private var _2096601730Btn_AllFest:LinkButton;
        private var _1554141553tabBtn6:BasicGlowButton;
        private var _32480112petItemList:ArrayCollection;
        private var _575917863elementImg:Image;
        private var _65009144DG_fb:DataGrid;
        public var _GameIntroPanel_LinkButton2:LinkButton;
        public var _GameIntroPanel_LinkButton3:LinkButton;
        private var earnMoneyVbInitFlag:Boolean = false;
        private var _839070482consumeActDate2:IntroText;
        private var _110502745toCar:RoundedButton;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _411634735getConsumeAwardBtn4:BasicDelayButton;
        private var _110351271ti_mj:TextInput;
        private var _1686904014consumeAcMsg5:String = "";
        private var giftCount:int = 0;
        private var _1596220962skillSlot1:ItemSlot;
        private var _1686904019consumeAcMsg0:String = "";
        private var _579057063petDataList:List;
        private var _1083063779getStageConsumeAwardBtn0:BasicDelayButton;
        private var _110351676ti_zl:TextInput;
        private var _1596220965skillSlot4:ItemSlot;
        private var _1269814195noticeBtn1:BasicGlowButton;
        private var _1162960633actBtn1:BasicGlowButton;
        private var _836980325consumeActivity0:DataGrid;
        private var _1091882812factor3:RoundedLabel;
        private var _836980329consumeActivity4:DataGrid;
        private var _1632084557StageConsumeBtn1:BasicDelayButton;
        private var _1632084553StageConsumeBtn5:BasicDelayButton;
        private var _3311i8:ItemSlot;
        private var _1554141550tabBtn9:BasicGlowButton;
        private var _1521020673diaryList:ArrayCollection;
        public var _GameIntroPanel_DescriptionLabel3:DescriptionLabel;
        public var _GameIntroPanel_DescriptionLabel4:DescriptionLabel;
        public var _GameIntroPanel_DescriptionLabel5:DescriptionLabel;
        public var _GameIntroPanel_DescriptionLabel6:DescriptionLabel;
        private var _642554749systemInfo:LinkTextArea;
        private var _1554141555tabBtn4:BasicGlowButton;
        private var _732738989sysInfoCanvas:Canvas;
        private var _1656529106selectBCar:RoundedButton;
        private var panelConfig_load:Boolean = false;
        private var _411634734getConsumeAwardBtn3:BasicDelayButton;
        private var _896341983vb_sport:VBox;
        private var _1686904015consumeAcMsg4:String = "";
        private var _839070481consumeActDate3:IntroText;
        private var _110351187ti_js:TextInput;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _322625876vb_levelUp:VBox;
        private var _849924434totalAct:BasicTxtButton;
        private var _1162960630actBtn4:BasicGlowButton;
        private var _1637688324SC_boss:CharactorShowCanvas;
        private var _823291595vb_eqt:VBox;
        private var _755507832xmlPet:XML;
        private var _939851607actAward4:ItemSlot;
        private var _1367571722cashDG:DataGrid;
        private var _223647102festSlot:ItemSlot;
        private var _401544427_selectedURL:CharactorShowCanvas;
        private var _807442945TA_boss:LinkTextArea;
        private var _115591369idTimerText:BasicTxtButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":650,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn0",
                        "events":{"click":"__tabBtn0_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":14,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn1",
                        "events":{"click":"__tabBtn1_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":66,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn2",
                        "events":{"click":"__tabBtn2_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":118,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn3",
                        "events":{"click":"__tabBtn3_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn4",
                        "events":{"click":"__tabBtn4_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":222,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn5",
                        "events":{"click":"__tabBtn5_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":274,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn6",
                        "events":{"click":"__tabBtn6_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":326,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn7",
                        "events":{"click":"__tabBtn7_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":378,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn8",
                        "events":{"click":"__tabBtn8_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":430,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn9",
                        "events":{"click":"__tabBtn9_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":534,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"tabBtn10",
                        "events":{"click":"__tabBtn10_click"},
                        "stylesFactory":function ():void
                        {
                            this.top = "46";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":482,
                                "width":51,
                                "selected":true,
                                "styleName":"HorizontalTab",
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"vs",
                        "stylesFactory":function ():void
                        {
                            this.bottom = "20";
                            this.left = "10";
                            this.right = "10";
                            this.top = "65";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "198";
                                                    this.left = "10";
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RadioButton,
                                                            "id":"_GameIntroPanel_RadioButton1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":1,
                                                                    "width":75,
                                                                    "groupName":"rgActives",
                                                                    "selected":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RadioButton,
                                                            "id":"_GameIntroPanel_RadioButton2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":86,
                                                                    "y":1,
                                                                    "width":100,
                                                                    "groupName":"rgActives",
                                                                    "selected":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"DG_active",
                                                            "events":{"itemClick":"__DG_active_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "20";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_GameIntroPanel_DataGridColumn1_i(), _GameIntroPanel_DataGridColumn2_i(), _GameIntroPanel_DataGridColumn3_i(), _GameIntroPanel_DataGridColumn4_i(), _GameIntroPanel_DataGridColumn5_i()]
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
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":180,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"_GameIntroPanel_LinkTextArea1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.fontSize = 12;
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"height":197});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_active",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10,
                                                                    "width":160,
                                                                    "height":120
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
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.bottom = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"x":136});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"petDataList",
                                                "events":{
                                                    "itemClick":"__petDataList_itemClick",
                                                    "mouseDown":"__petDataList_mouseDown"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.backgroundAlpha = 0;
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                    this.left = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "width":120,
                                                        "itemRenderer":_GameIntroPanel_ClassFactory1_c()
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":400,
                                                        "width":220,
                                                        "height":145,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":TextArea,
                                                            "id":"_selectedDesc",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.borderStyle = "none";
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CSSBorder",
                                                                    "editable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":10,
                                                        "height":145,
                                                        "width":241,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":CharactorShowCanvas,
                                                            "id":"_selectedURL",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.verticalCenter = "57";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":10,
                                                                    "width":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"classImg",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":7,
                                                                    "y":6,
                                                                    "width":16,
                                                                    "height":16
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"elementImg",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":24.35,
                                                                    "y":6,
                                                                    "width":16,
                                                                    "height":16
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"petLevel",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "4";
                                                                this.textAlign = "right";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":5});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GameIntroPanel_RoundedLabel2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":175,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GameIntroPanel_RoundedLabel3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":201,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GameIntroPanel_RoundedLabel4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":227,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GameIntroPanel_RoundedLabel5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":253,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_GameIntroPanel_RoundedLabel6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":145,
                                                        "y":279,
                                                        "width":60
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"ti_ll",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":206,
                                                        "y":173,
                                                        "width":180,
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"ti_mj",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":206,
                                                        "y":199,
                                                        "width":180,
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"ti_tz",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":206,
                                                        "y":225,
                                                        "width":180,
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"ti_zl",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":206,
                                                        "y":251,
                                                        "width":180,
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":TextInput,
                                                "id":"ti_js",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":206,
                                                        "y":277,
                                                        "width":180,
                                                        "editable":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SimpleCanvas,
                                                "id":"simplecanvas1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":405,
                                                        "y":182,
                                                        "width":111,
                                                        "height":111,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_GameIntroPanel_Image4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"factor0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.textAlign = "center";
                                                                this.color = 15361583;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":2});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"factor1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "91";
                                                                this.color = 14689269;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":36});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"factor2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "75";
                                                                this.color = 16081443;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":88});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"factor3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "75";
                                                                this.color = 2329845;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":88});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"factor4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.right = "92";
                                                                this.color = 9301547;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":36});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":PentagonCanvas,
                                                "id":"propertyPentagon",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":405,
                                                        "y":182,
                                                        "width":111,
                                                        "height":111,
                                                        "lineShow":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.bottom = "66";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":100,
                                                        "height":117,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"skillSlot1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":13,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"skillSlot2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":33,
                                                                    "x":53,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"skillSlot3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":73,
                                                                    "x":13,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"skillSlot4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":73,
                                                                    "x":53,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"_GameIntroPanel_RoundedLabel12",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "x":10,
                                                                    "y":5.5
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GameIntroPanel_BasicGlowButton12",
                                                "events":{"click":"___GameIntroPanel_BasicGlowButton12_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "156.15";
                                                    this.paddingTop = 1;
                                                    this.bottom = "20";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalYellowButton",
                                                        "labelPlacement":"bottom",
                                                        "width":75,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"_GameIntroPanel_BasicGlowButton13",
                                                "events":{"click":"___GameIntroPanel_BasicGlowButton13_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "239.15";
                                                    this.paddingTop = 1;
                                                    this.bottom = "20";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CrystalYellowButton",
                                                        "labelPlacement":"bottom",
                                                        "width":75,
                                                        "height":25,
                                                        "visible":false
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
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"vb_levelUp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 1;
                                                                this.right = "0";
                                                                this.left = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            }
                                                        })]
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
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"vb_earnMoney",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 1;
                                                                this.right = "0";
                                                                this.left = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            }
                                                        })]
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
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"vb_eqt",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 1;
                                                                this.right = "0";
                                                                this.left = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            }
                                                        })]
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
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "10";
                                                    this.right = "10";
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "id":"vb_sport",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalGap = 1;
                                                                this.right = "0";
                                                                this.left = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            }
                                                        })]
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
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                    this.left = "10";
                                                    this.right = "198";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"DG_fb",
                                                            "events":{"itemClick":"__DG_fb_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_GameIntroPanel_DataGridColumn6_i(), _GameIntroPanel_DataGridColumn7_i(), _GameIntroPanel_DataGridColumn8_i(), _GameIntroPanel_DataGridColumn9_i()]
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
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":180,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"img_fb",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":10,
                                                                    "width":160,
                                                                    "height":120
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"TA_fb",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.fontSize = 12;
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"height":192});
                                                            }
                                                        })]
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
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                    this.left = "10";
                                                    this.right = "198";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"DG_boss",
                                                            "events":{"itemClick":"__DG_boss_itemClick"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "20";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_GameIntroPanel_DataGridColumn10_i(), _GameIntroPanel_DataGridColumn11_i(), _GameIntroPanel_DataGridColumn12_i(), _GameIntroPanel_DataGridColumn13_i()]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RadioButton,
                                                            "id":"_GameIntroPanel_RadioButton3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":1,
                                                                    "width":75,
                                                                    "groupName":"rgBoss",
                                                                    "selected":true
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RadioButton,
                                                            "id":"_GameIntroPanel_RadioButton4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":86,
                                                                    "y":1,
                                                                    "width":100,
                                                                    "groupName":"rgBoss",
                                                                    "selected":false
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
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":180,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":CharactorShowCanvas,
                                                            "id":"SC_boss",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                                this.verticalCenter = "-50";
                                                                this.horizontalCenter = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":10,
                                                                    "width":10
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"TA_boss",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.fontSize = 12;
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.color = 0xFFFFFF;
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "height":182,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off"
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
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"CanvasBorder",
                                            "label":"loginAward",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":List,
                                                "id":"List_fl",
                                                "events":{
                                                    "change":"__List_fl_change",
                                                    "creationComplete":"__List_fl_creationComplete"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderSides = "0";
                                                    this.backgroundAlpha = 0;
                                                    this.fontWeight = "normal";
                                                    this.fontFamily = "Arial";
                                                    this.left = "4";
                                                    this.textRollOverColor = 16366965;
                                                    this.textSelectedColor = 1961723;
                                                    this.top = "10";
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"width":113});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.top = "5";
                                                    this.bottom = "5";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"x":120});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"vs_fl",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "10";
                                                    this.bottom = "10";
                                                    this.top = "10";
                                                    this.left = "130";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"getGiftBtn",
                                                                        "events":{"click":"__getGiftBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":47.5,
                                                                                "y":74,
                                                                                "styleName":"BtnStdRed2",
                                                                                "enabled":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"getDiscountBtn",
                                                                        "events":{"click":"__getDiscountBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":257.5,
                                                                                "y":74,
                                                                                "styleName":"BtnStdRed2",
                                                                                "enabled":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"getContiBtn",
                                                                        "events":{"click":"__getContiBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":47.5,
                                                                                "y":193,
                                                                                "styleName":"BtnStdRed2",
                                                                                "enabled":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"getFestBtn",
                                                                        "events":{"click":"__getFestBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":47.5,
                                                                                "y":302,
                                                                                "styleName":"BtnStdRed2",
                                                                                "enabled":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_GameIntroPanel_IntroText1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                            this.textAlign = "center";
                                                                            this.fontSize = 12;
                                                                            this.borderThickness = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":127.5,
                                                                                "y":36,
                                                                                "width":105,
                                                                                "height":60,
                                                                                "styleName":"CanvasBorder"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_GameIntroPanel_IntroText2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                            this.textAlign = "center";
                                                                            this.fontSize = 12;
                                                                            this.borderThickness = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":315.5,
                                                                                "y":36,
                                                                                "width":127,
                                                                                "height":60,
                                                                                "styleName":"CanvasBorder"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"dailySlot",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56.5,
                                                                                "y":34,
                                                                                "movable":false,
                                                                                "stackNum":1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"festSlot",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56.5,
                                                                                "y":262,
                                                                                "stackNum":1,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"currentFestTxt",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":229,
                                                                                "width":152,
                                                                                "height":22,
                                                                                "x":135.5
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"ta_festDesc",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontStyle = "normal";
                                                                            this.fontWeight = "bold";
                                                                            this.fontSize = 12;
                                                                            this.borderThickness = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":127.5,
                                                                                "y":248,
                                                                                "width":314,
                                                                                "height":65,
                                                                                "styleName":"CanvasBorder"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":LinkButton,
                                                                        "id":"Btn_AllFest",
                                                                        "events":{"click":"__Btn_AllFest_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"DescriptionText",
                                                                                "x":295.5,
                                                                                "y":228,
                                                                                "width":154,
                                                                                "height":22
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"lb_festdesc",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":135.5,
                                                                                "width":314,
                                                                                "height":20,
                                                                                "y":315
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"DiscountSlot",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":267.5,
                                                                                "y":34,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"contiSlot",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":56.5,
                                                                                "y":151,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_GameIntroPanel_DescriptionLabel3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":133.5,
                                                                                "y":121,
                                                                                "width":128,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_GameIntroPanel_DescriptionLabel4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":269.5,
                                                                                "y":121,
                                                                                "width":185,
                                                                                "height":37
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_GameIntroPanel_IntroText4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.fontWeight = "bold";
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":127.5,
                                                                                "y":147,
                                                                                "width":314,
                                                                                "height":80,
                                                                                "styleName":"CanvasBorder"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_GameIntroPanel_BasicTxtButton1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":35.5,
                                                                                "y":7,
                                                                                "width":90,
                                                                                "height":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_GameIntroPanel_BasicTxtButton2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":247.5,
                                                                                "y":7,
                                                                                "width":90,
                                                                                "height":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_GameIntroPanel_BasicTxtButton3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":35.5,
                                                                                "y":121,
                                                                                "width":90,
                                                                                "height":19
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_GameIntroPanel_BasicTxtButton4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":35.5,
                                                                                "y":235,
                                                                                "width":90,
                                                                                "height":19
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___GameIntroPanel_Canvas22_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"ti",
                                                                        "events":{"mouseDown":"__ti_mouseDown"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.backgroundAlpha = 0;
                                                                            this.cornerRadius = 0;
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":237,
                                                                                "y":72,
                                                                                "width":135,
                                                                                "height":20,
                                                                                "maxChars":12
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"i7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":290.5,
                                                                                "y":167
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"i8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":290.5,
                                                                                "y":278
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"getAwardsByCode",
                                                                        "events":{"click":"__getAwardsByCode_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":60000,
                                                                                "x":386.4,
                                                                                "y":69,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":58.1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"getAwardsFromNet",
                                                                        "events":{"click":"__getAwardsFromNet_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":60000,
                                                                                "x":386.4,
                                                                                "y":172,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":58.1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"_GameIntroPanel_BasicDelayButton3",
                                                                        "events":{"click":"___GameIntroPanel_BasicDelayButton3_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":60000,
                                                                                "x":386.4,
                                                                                "y":283,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":58.1
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_GameIntroPanel_IntroText5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":45.5,
                                                                                "y":24,
                                                                                "width":149.5,
                                                                                "height":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_GameIntroPanel_IntroText6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":45.5,
                                                                                "y":133,
                                                                                "width":149.5,
                                                                                "height":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":IntroText,
                                                                        "id":"_GameIntroPanel_IntroText7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":45.5,
                                                                                "y":236,
                                                                                "width":149.5,
                                                                                "height":85
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___GameIntroPanel_Canvas23_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "label":"BtnSysCash",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.right = "10";
                                                                            this.top = "10";
                                                                            this.bottom = "35";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"RoundedGradientBorder",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":DataGrid,
                                                                                    "id":"cashDG",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "resizableColumns":false,
                                                                                            "draggableColumns":false,
                                                                                            "columns":[_GameIntroPanel_DataGridColumn14_i(), _GameIntroPanel_DataGridColumn15_i(), _GameIntroPanel_DataGridColumn16_i(), _GameIntroPanel_DataGridColumn17_i(), _GameIntroPanel_DataGridColumn18_i()]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_GameIntroPanel_LinkButton2",
                                                                                    "events":{"click":"___GameIntroPanel_LinkButton2_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 0xFF0000;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":332,
                                                                                            "y":268
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_GameIntroPanel_DescriptionLabel5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":54,
                                                                                "y":315
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedButton,
                                                                        "id":"selectA",
                                                                        "events":{"click":"__selectA_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "205";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnRed",
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedButton,
                                                                        "id":"selectB",
                                                                        "events":{"click":"__selectB_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "157";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnRed",
                                                                                "width":40
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RoundedButton,
                                                                        "id":"_GameIntroPanel_RoundedButton3",
                                                                        "events":{"click":"___GameIntroPanel_RoundedButton3_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "10";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"styleName":"BtnRed"});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "events":{"show":"___GameIntroPanel_Canvas25_show"},
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
                                                                            this.left = "10";
                                                                            this.right = "10";
                                                                            this.top = "10";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"RoundedGradientBorder",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":DataGrid,
                                                                                    "id":"trolleyDG",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "resizableColumns":false,
                                                                                            "draggableColumns":false,
                                                                                            "columns":[_GameIntroPanel_DataGridColumn19_i(), _GameIntroPanel_DataGridColumn20_i(), _GameIntroPanel_DataGridColumn21_i(), _GameIntroPanel_DataGridColumn22_i()]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RoundedButton,
                                                                                    "id":"selectACar",
                                                                                    "events":{"click":"__selectACar_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":164,
                                                                                            "y":284,
                                                                                            "styleName":"BtnRed",
                                                                                            "width":40
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RoundedButton,
                                                                                    "id":"selectBCar",
                                                                                    "events":{"click":"__selectBCar_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":220,
                                                                                            "y":284,
                                                                                            "styleName":"BtnRed",
                                                                                            "width":40
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RoundedButton,
                                                                                    "id":"toCar",
                                                                                    "events":{"click":"__toCar_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":279,
                                                                                            "y":284,
                                                                                            "styleName":"BtnRed",
                                                                                            "width":60
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":LinkButton,
                                                                                    "id":"_GameIntroPanel_LinkButton3",
                                                                                    "events":{"click":"___GameIntroPanel_LinkButton3_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.textDecoration = "underline";
                                                                                        this.color = 0xFF0000;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":340,
                                                                                            "y":284
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":DescriptionLabel,
                                                                                    "id":"_GameIntroPanel_DescriptionLabel6",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":44,
                                                                                            "y":307
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
                                                            "events":{"show":"___GameIntroPanel_Canvas27_show"},
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
                                                                            this.left = "10";
                                                                            this.right = "10";
                                                                            this.top = "10";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"RoundedGradientBorder",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":DataGrid,
                                                                                    "id":"consumeActivity",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.bottom = "120";
                                                                                        this.paddingTop = 4;
                                                                                        this.paddingBottom = 4;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "resizableColumns":false,
                                                                                            "variableRowHeight":true,
                                                                                            "draggableColumns":false,
                                                                                            "columns":[_GameIntroPanel_DataGridColumn23_i(), _GameIntroPanel_DataGridColumn24_i()]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":IntroText,
                                                                                    "id":"consumeActDate",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":46,
                                                                                            "y":220,
                                                                                            "width":350,
                                                                                            "height":60
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"getConsumeAwardBtn",
                                                                                    "events":{"click":"__getConsumeAwardBtn_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "clickDelay":60000,
                                                                                            "x":160,
                                                                                            "y":285,
                                                                                            "height":19,
                                                                                            "styleName":"BtnStdRed",
                                                                                            "enabled":true,
                                                                                            "width":50
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
                                                            "events":{"show":"___GameIntroPanel_Canvas29_show"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "label":"",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"StageConsumeBtn0",
                                                                        "events":{"click":"__StageConsumeBtn0_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":1000,
                                                                                "x":10,
                                                                                "y":5,
                                                                                "height":19,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":true,
                                                                                "visible":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"StageConsumeBtn1",
                                                                        "events":{"click":"__StageConsumeBtn1_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":1000,
                                                                                "x":70,
                                                                                "y":5,
                                                                                "height":19,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":true,
                                                                                "visible":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"StageConsumeBtn2",
                                                                        "events":{"click":"__StageConsumeBtn2_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":1000,
                                                                                "x":130,
                                                                                "y":5,
                                                                                "height":19,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":true,
                                                                                "visible":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"StageConsumeBtn3",
                                                                        "events":{"click":"__StageConsumeBtn3_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":1000,
                                                                                "x":190,
                                                                                "y":5,
                                                                                "height":19,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":true,
                                                                                "visible":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"StageConsumeBtn4",
                                                                        "events":{"click":"__StageConsumeBtn4_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":1000,
                                                                                "x":250,
                                                                                "y":5,
                                                                                "height":19,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":true,
                                                                                "visible":false,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"StageConsumeBtn5",
                                                                        "events":{"click":"__StageConsumeBtn5_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":1000,
                                                                                "x":310,
                                                                                "y":5,
                                                                                "height":19,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":true,
                                                                                "visible":false,
                                                                                "width":90
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.right = "10";
                                                                            this.top = "30";
                                                                            this.bottom = "10";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"RoundedGradientBorder",
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ViewStack,
                                                                                    "id":"vs_stageConsume",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":DataGrid,
                                                                                                            "id":"consumeActivity0",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.bottom = "120";
                                                                                                                this.paddingTop = 4;
                                                                                                                this.paddingBottom = 4;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "resizableColumns":false,
                                                                                                                    "variableRowHeight":true,
                                                                                                                    "draggableColumns":false,
                                                                                                                    "columns":[_GameIntroPanel_DataGridColumn25_i(), _GameIntroPanel_DataGridColumn26_i()]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":IntroText,
                                                                                                            "id":"consumeActDate0",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":46,
                                                                                                                    "y":220,
                                                                                                                    "width":350,
                                                                                                                    "height":60
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":BasicDelayButton,
                                                                                                            "id":"getStageConsumeAwardBtn0",
                                                                                                            "events":{"click":"__getStageConsumeAwardBtn0_click"},
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "clickDelay":6000,
                                                                                                                    "x":160,
                                                                                                                    "y":282,
                                                                                                                    "height":19,
                                                                                                                    "styleName":"BtnStdRed",
                                                                                                                    "enabled":true,
                                                                                                                    "width":50
                                                                                                                });
                                                                                                            }
                                                                                                        })]});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":DataGrid,
                                                                                                            "id":"consumeActivity1",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.bottom = "120";
                                                                                                                this.paddingTop = 4;
                                                                                                                this.paddingBottom = 4;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "resizableColumns":false,
                                                                                                                    "variableRowHeight":true,
                                                                                                                    "draggableColumns":false,
                                                                                                                    "columns":[_GameIntroPanel_DataGridColumn27_i(), _GameIntroPanel_DataGridColumn28_i()]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":IntroText,
                                                                                                            "id":"consumeActDate1",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":46,
                                                                                                                    "y":220,
                                                                                                                    "width":350,
                                                                                                                    "height":60
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":BasicDelayButton,
                                                                                                            "id":"getConsumeAwardBtn1",
                                                                                                            "events":{"click":"__getConsumeAwardBtn1_click"},
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "clickDelay":6000,
                                                                                                                    "x":160,
                                                                                                                    "y":282,
                                                                                                                    "height":19,
                                                                                                                    "styleName":"BtnStdRed",
                                                                                                                    "enabled":true,
                                                                                                                    "width":50
                                                                                                                });
                                                                                                            }
                                                                                                        })]});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":DataGrid,
                                                                                                            "id":"consumeActivity2",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.bottom = "120";
                                                                                                                this.paddingTop = 4;
                                                                                                                this.paddingBottom = 4;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "resizableColumns":false,
                                                                                                                    "variableRowHeight":true,
                                                                                                                    "draggableColumns":false,
                                                                                                                    "columns":[_GameIntroPanel_DataGridColumn29_i(), _GameIntroPanel_DataGridColumn30_i()]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":IntroText,
                                                                                                            "id":"consumeActDate2",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":46,
                                                                                                                    "y":220,
                                                                                                                    "width":350,
                                                                                                                    "height":60
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":BasicDelayButton,
                                                                                                            "id":"getConsumeAwardBtn2",
                                                                                                            "events":{"click":"__getConsumeAwardBtn2_click"},
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "clickDelay":6000,
                                                                                                                    "x":160,
                                                                                                                    "y":282,
                                                                                                                    "height":19,
                                                                                                                    "styleName":"BtnStdRed",
                                                                                                                    "enabled":true,
                                                                                                                    "width":50
                                                                                                                });
                                                                                                            }
                                                                                                        })]});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":DataGrid,
                                                                                                            "id":"consumeActivity3",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.bottom = "120";
                                                                                                                this.paddingTop = 4;
                                                                                                                this.paddingBottom = 4;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "resizableColumns":false,
                                                                                                                    "variableRowHeight":true,
                                                                                                                    "draggableColumns":false,
                                                                                                                    "columns":[_GameIntroPanel_DataGridColumn31_i(), _GameIntroPanel_DataGridColumn32_i()]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":IntroText,
                                                                                                            "id":"consumeActDate3",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":46,
                                                                                                                    "y":220,
                                                                                                                    "width":350,
                                                                                                                    "height":60
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":BasicDelayButton,
                                                                                                            "id":"getConsumeAwardBtn3",
                                                                                                            "events":{"click":"__getConsumeAwardBtn3_click"},
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "clickDelay":6000,
                                                                                                                    "x":160,
                                                                                                                    "y":282,
                                                                                                                    "height":19,
                                                                                                                    "styleName":"BtnStdRed",
                                                                                                                    "enabled":true,
                                                                                                                    "width":50
                                                                                                                });
                                                                                                            }
                                                                                                        })]});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":DataGrid,
                                                                                                            "id":"consumeActivity4",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.bottom = "120";
                                                                                                                this.paddingTop = 4;
                                                                                                                this.paddingBottom = 4;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "resizableColumns":false,
                                                                                                                    "variableRowHeight":true,
                                                                                                                    "draggableColumns":false,
                                                                                                                    "columns":[_GameIntroPanel_DataGridColumn33_i(), _GameIntroPanel_DataGridColumn34_i()]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":IntroText,
                                                                                                            "id":"consumeActDate4",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":46,
                                                                                                                    "y":220,
                                                                                                                    "width":350,
                                                                                                                    "height":60
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":BasicDelayButton,
                                                                                                            "id":"getConsumeAwardBtn4",
                                                                                                            "events":{"click":"__getConsumeAwardBtn4_click"},
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "clickDelay":6000,
                                                                                                                    "x":160,
                                                                                                                    "y":282,
                                                                                                                    "height":19,
                                                                                                                    "styleName":"BtnStdRed",
                                                                                                                    "enabled":true,
                                                                                                                    "width":50
                                                                                                                });
                                                                                                            }
                                                                                                        })]});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":DataGrid,
                                                                                                            "id":"consumeActivity5",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.bottom = "120";
                                                                                                                this.paddingTop = 4;
                                                                                                                this.paddingBottom = 4;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "resizableColumns":false,
                                                                                                                    "variableRowHeight":true,
                                                                                                                    "draggableColumns":false,
                                                                                                                    "columns":[_GameIntroPanel_DataGridColumn35_i()]
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":IntroText,
                                                                                                            "id":"consumeActDate5",
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":46,
                                                                                                                    "y":95,
                                                                                                                    "width":350,
                                                                                                                    "height":185
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":BasicDelayButton,
                                                                                                            "id":"getConsumeAwardBtn5",
                                                                                                            "events":{"click":"__getConsumeAwardBtn5_click"},
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "clickDelay":6000,
                                                                                                                    "x":160,
                                                                                                                    "y":282,
                                                                                                                    "height":19,
                                                                                                                    "styleName":"BtnStdRed",
                                                                                                                    "enabled":true,
                                                                                                                    "width":50
                                                                                                                });
                                                                                                            }
                                                                                                        })]});
                                                                                                }
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
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "events":{
                                        "show":"___GameIntroPanel_Canvas37_show",
                                        "hide":"___GameIntroPanel_Canvas37_hide"
                                    },
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
                                                        "y":10,
                                                        "width":420,
                                                        "height":345,
                                                        "styleName":"CanvasBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"DG_diary",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "columns":[_GameIntroPanel_DataGridColumn36_i(), _GameIntroPanel_DataGridColumn37_i(), _GameIntroPanel_DataGridColumn38_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "events":{"creationComplete":"___GameIntroPanel_Canvas39_creationComplete"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":435,
                                                        "y":10,
                                                        "width":184,
                                                        "height":345,
                                                        "styleName":"CanvasBorder",
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_GameIntroPanel_BasicTxtButton5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.fontSize = 16;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":5,
                                                                    "mouseEnabled":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_GameIntroPanel_BasicTxtButton6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":33
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"totalAct",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":135,
                                                                    "y":33,
                                                                    "text":"0"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_GameIntroPanel_BasicTxtButton8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "y":56,
                                                                    "width":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"idTimerText",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFF0000;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":72,
                                                                    "y":56,
                                                                    "width":70
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":VBox,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":5,
                                                                    "y":80,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"actAward0",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":5,
                                                                                            "type":29,
                                                                                            "giid":3255
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_GameIntroPanel_BasicTxtButton10",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":50,
                                                                                            "y":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"actBtn0",
                                                                                    "events":{"click":"__actBtn0_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "x":135,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                })]});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"actAward1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":5,
                                                                                            "type":29,
                                                                                            "giid":3256
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_GameIntroPanel_BasicTxtButton11",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":50,
                                                                                            "y":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"actBtn1",
                                                                                    "events":{"click":"__actBtn1_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "x":135,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                })]});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"actAward2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":5,
                                                                                            "type":29,
                                                                                            "giid":3257
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_GameIntroPanel_BasicTxtButton12",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":50,
                                                                                            "y":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"actBtn2",
                                                                                    "events":{"click":"__actBtn2_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "x":135,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                })]});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"actAward3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":5,
                                                                                            "type":29,
                                                                                            "giid":3258
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_GameIntroPanel_BasicTxtButton13",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":50,
                                                                                            "y":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"actBtn3",
                                                                                    "events":{"click":"__actBtn3_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "x":135,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                })]});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"actAward4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":5,
                                                                                            "type":29,
                                                                                            "giid":3259
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_GameIntroPanel_BasicTxtButton14",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":50,
                                                                                            "y":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"actBtn4",
                                                                                    "events":{"click":"__actBtn4_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdRed",
                                                                                            "x":135,
                                                                                            "y":5
                                                                                        });
                                                                                    }
                                                                                })]});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_GameIntroPanel_BasicTxtButton15",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "0";
                                                                this.color = 0xFFFFFF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":282,
                                                                    "height":53
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
                                    "events":{"creationComplete":"___GameIntroPanel_Canvas45_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"sysInfoCanvas",
                                                "stylesFactory":function ():void
                                                {
                                                    this.right = "20";
                                                    this.left = "20";
                                                    this.bottom = "20";
                                                    this.top = "20";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"PanelAnnouncement",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":LinkTextArea,
                                                            "id":"systemInfo",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFFFF;
                                                                this.backgroundAlpha = 0;
                                                                this.borderStyle = "none";
                                                                this.left = "20";
                                                                this.right = "20";
                                                                this.top = "20";
                                                                this.bottom = "20";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "text":"",
                                                                    "selectable":false,
                                                                    "editable":false
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"noticeBtn0",
                                                "events":{"click":"__noticeBtn0_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "230";
                                                    this.paddingTop = 1;
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed2",
                                                        "labelPlacement":"bottom",
                                                        "width":75,
                                                        "height":25
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"noticeBtn1",
                                                "events":{"click":"__noticeBtn1_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "325";
                                                    this.paddingTop = 1;
                                                    this.bottom = "10";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed2",
                                                        "labelPlacement":"bottom",
                                                        "width":75,
                                                        "height":25
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
        private var flag:Object = {};
        private var CONTI_GIFT_DAY:Array = [8, 18, 28, 48, 68, 88, 108, 128, 158, 188, 218, 258, 308, 358, 408];
        private var flListItemArr:Array = [Language.GAMEINTROPANEL_U[19], Language.GAMEINTROPANEL_U[20], Language.GAMEINTROPANEL_U[21], Language.GAMEINTROPANEL_U[22], Language.GAMEINTROPANEL_U[49], Language.GAMEINTROPANEL_U[51]];
        private var spec_skill:Object = {
            "1672":6365,
            "2145":6712,
            "2221":6839,
            "2246":6891,
            "2249":6920,
            "2273":6950
        };
        private var _975828627activityDescription:String = Language.ACTIVEPANEL_S[8];
        private var _sortForDiary:Sort = new Sort();
        private var dailyActOnlineObj:Object = {
            "time":0,
            "times":0
        };
        private var noticeDataArr:Array = [null, null];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GameIntroPanel()
        {
            mx_internal::_document = this;
            this.width = 650;
            this.height = 450;
            this.styleName = "StandardContent";
            _GameIntroPanel_RadioButtonGroup1_i();
            _GameIntroPanel_RadioButtonGroup2_i();
            _GameIntroPanel_XML1_i();
            _GameIntroPanel_XML2_i();
            this.addEventListener("creationComplete", ___GameIntroPanel_DragableCanvas1_creationComplete);
        }

        public static function GetDateTime(_arg_1:String):Date
        {
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:Array;
            if (_arg_1.length > 0)
            {
                _local_2 = _arg_1.split(" ");
                _local_3 = _local_2[0].split("-");
                _local_4 = _local_2[1].split(":");
                return (new Date(_local_3[0], (int(_local_3[1]) - 1), _local_3[2], _local_4[0], _local_4[1], _local_4[2]));
            };
            return (new Date(1970, 1, 1));
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GameIntroPanel._watcherSetupUtil = _arg_1;
        }


        public function __selectACar_click(_arg_1:MouseEvent):void
        {
            carItemShow(0);
        }

        public function set SC_boss(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1637688324SC_boss;
            if (_local_2 !== _arg_1)
            {
                this._1637688324SC_boss = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "SC_boss", _local_2, _arg_1));
            };
        }

        private function onGetDailyAward(_arg_1:Object):void
        {
            if (_arg_1)
            {
                dailySlot.stackNum = 1;
                dailySlot.giid = 0;
                getGiftBtn.enabled = false;
            };
            changeMiniMapMsgBtnStyle();
        }

        [Bindable(event="propertyChange")]
        public function get vb_sport():VBox
        {
            return (this._896341983vb_sport);
        }

        private function _GameIntroPanel_DataGridColumn18_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn18 = _local_1;
            _local_1.dataField = "";
            _local_1.width = 40;
            _local_1.labelFunction = timeLimitCheck;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory5_c();
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn18", _GameIntroPanel_DataGridColumn18);
            return (_local_1);
        }

        public function ___GameIntroPanel_Canvas25_show(_arg_1:FlexEvent):void
        {
            initTrolley();
        }

        private function levelSortCompareFunction(_arg_1:Object, _arg_2:Object):int
        {
            var _local_3:RegExp = /\d+/;
            var _local_4:Number = Number(_local_3.exec(_arg_1.Level)[0]);
            var _local_5:Number = Number(_local_3.exec(_arg_2.Level)[0]);
            if (_local_4 > _local_5)
            {
                return (-1);
            };
            if (_local_4 == _local_5)
            {
                return (0);
            };
            return (1);
        }

        private function initPenalConfig():void
        {
            var _local_1:XML;
            var _local_2:XMLList;
            var _local_3:XML;
            var _local_4:Boolean;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:Array;
            var _local_10:Array;
            var _local_11:Array;
            var _local_12:int;
            var _local_13:int;
            var _local_14:String;
            var _local_15:String;
            var _local_16:String;
            var _local_17:String;
            var _local_18:String;
            var _local_19:String;
            var _local_20:String;
            var _local_21:String;
            var _local_22:Object;
            var _local_23:String;
            var _local_24:Object;
            var _local_25:Object;
            var _local_26:Object;
            var _local_27:Object;
            var _local_28:Object;
            if (!panelConfig_load)
            {
                activityItemList = new ArrayCollection();
                enableActiveList = new ArrayCollection();
                levelUpActiveList = new ArrayCollection();
                earnMoneyActiveList = new ArrayCollection();
                equiptActiveList = new ArrayCollection();
                sportActiveList = new ArrayCollection();
                groundBossList = new ArrayCollection();
                airBossList = new ArrayCollection();
                fbList = new ArrayCollection();
                _local_1 = new XML(xmlActivity);
                _local_2 = _local_1.Node;
                for each (_local_3 in _local_2.Activity)
                {
                    _local_4 = false;
                    _local_5 = new Object();
                    _local_5.idx = parseInt(_local_3.@idx.toString());
                    _local_5.Name = _local_3.@Name.toString();
                    _local_5.NPC = _local_3.@NPC.toString();
                    _local_5.Level = _local_3.@Level.toString();
                    _local_5.Line = _local_3.@LINE.toString();
                    _local_5.Description = _local_3.@Description.toString();
                    _local_5.url = ResManager.getIconUrl(parseInt(_local_3.@resCode.toString()));
                    _local_6 = _local_3.@NID.toString();
                    _local_7 = _local_3.@MID.toString();
                    _local_8 = _local_3.@HID.toString();
                    _local_9 = ((_local_6 == "") ? new Array() : _local_6.split(","));
                    _local_10 = ((_local_7 == "") ? new Array() : _local_7.split(","));
                    _local_11 = ((_local_8 == "") ? new Array() : _local_8.split(","));
                    _local_12 = 0;
                    while (_local_12 < _local_9.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_14 = (("|npc" + _local_13) + "|");
                        _local_15 = ((GameData.d[GamePredef.TBL_NPC][_local_9[_local_12]]) ? GameData.d[GamePredef.TBL_NPC][_local_9[_local_12]].name : "系统");
                        _local_16 = (((((('<font color="#FF0000"> <a href="event:L_N|' + _local_9[_local_12]) + "|") + _local_15) + '">[') + _local_15) + "]</a></font>");
                        _local_5.Description = _local_5.Description.replace(_local_14, _local_16);
                        _local_12++;
                    };
                    _local_12 = 0;
                    while (_local_12 < _local_10.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_17 = (("|map" + _local_13) + "|");
                        _local_18 = GameData.d[GamePredef.TBL_MAP][_local_10[_local_12]].name;
                        _local_19 = (((((('<font color="#0000FF"> <a href="event:L_MA|' + _local_10[_local_12]) + "|") + _local_18) + '">[') + _local_18) + "]</a></font>");
                        _local_5.Description = _local_5.Description.replace(_local_17, _local_19);
                        _local_12++;
                    };
                    _local_12 = 0;
                    while (_local_12 < _local_11.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_20 = (("|help" + _local_13) + "|");
                        _local_18 = Language.ACTIVEPANEL_S[41];
                        _local_21 = (((((('<font color="#00FF00"><a href="event:L_HELP|' + _local_11[_local_12]) + "|") + _local_5.Name) + '">[') + _local_18) + "]</a></font>");
                        _local_5.Description = _local_5.Description.replace(_local_20, _local_21);
                        _local_12++;
                    };
                    _local_5.Time = TimeUtil.getTimeStr(_local_3.@Time.toString());
                    activityItemList.addItem(_local_5);
                };
                for each (_local_3 in _local_2.Boss)
                {
                    _local_22 = new Object();
                    _local_22.id = parseInt(_local_3.@NID.toString());
                    _local_22.level = _local_3.@Level.toString();
                    _local_22.line = _local_3.@LINE.toString();
                    _local_22.desc = _local_3.@Description.toString();
                    _local_22.colorCode = GameData.d[GamePredef.TBL_NPC][_local_22.id].colorCode;
                    _local_22.name = _local_3.@Name.toString();
                    _local_22.url = ResManager.getResUrl(GameData.d[GamePredef.TBL_NPC][_local_22.id].resCode);
                    _local_22.map = "";
                    _local_22.layer = GameData.d[GamePredef.TBL_NPC][_local_22.id].layer;
                    _local_23 = _local_3.@MID.toString();
                    _local_10 = _local_23.split(",");
                    _local_12 = 0;
                    while (_local_12 < _local_10.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_17 = (("|map" + _local_13) + "|");
                        _local_18 = GameData.d[GamePredef.TBL_MAP][_local_10[_local_12]].name;
                        _local_19 = (((((('<font color="#87d708"> <a href="event:L_MA|' + _local_10[_local_12]) + "|") + _local_18) + '">[') + _local_18) + "]</a></font>");
                        _local_22.desc = _local_22.desc.replace(_local_17, _local_19);
                        if (_local_12 == 0)
                        {
                            _local_22.map = (_local_22.map + _local_19);
                        }
                        else
                        {
                            _local_22.map = (_local_22.map + ("," + _local_19));
                        };
                        _local_12++;
                    };
                    if (_local_22.layer == 3)
                    {
                        airBossList.addItem(_local_22);
                    }
                    else
                    {
                        groundBossList.addItem(_local_22);
                    };
                };
                for each (_local_3 in _local_2.FB)
                {
                    _local_24 = new Object();
                    _local_24.id = parseInt(_local_3.@NID.toString());
                    _local_24.level = _local_3.@Level.toString();
                    _local_24.desc = _local_3.@Description.toString();
                    _local_24.name = _local_3.@Name.toString();
                    _local_24.npcId = parseInt(_local_3.@NID.toString());
                    _local_24.npcName = GameData.d[GamePredef.TBL_NPC][_local_24.id].name;
                    _local_24.url = ResManager.getIconUrl(parseInt(_local_3.@resCode.toString()));
                    _local_24.map = "";
                    _local_16 = (((((('<font color="#fe6464"> <a href="event:L_N|' + _local_24.npcId) + "|") + _local_24.npcName) + '">[') + _local_24.npcName) + "]</a></font>");
                    _local_24.desc = _local_24.desc.replace("|npc|", _local_16);
                    _local_24.npcStr = _local_16;
                    _local_23 = _local_3.@MID.toString();
                    _local_10 = _local_23.split(",");
                    _local_12 = 0;
                    while (_local_12 < _local_10.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_17 = (("|map" + _local_13) + "|");
                        _local_18 = GameData.d[GamePredef.TBL_MAP][_local_10[_local_12]].name;
                        _local_19 = (((((('<font color="#0000FF"> <a href="event:L_MA|' + _local_10[_local_12]) + "|") + _local_18) + '">[') + _local_18) + "]</a></font>");
                        _local_24.desc = _local_24.desc.replace(_local_17, _local_19);
                        if (_local_12 == 0)
                        {
                            _local_24.map = (_local_24.map + _local_18);
                        }
                        else
                        {
                            _local_24.map = (_local_24.map + ("," + _local_18));
                        };
                        _local_12++;
                    };
                    fbList.addItem(_local_24);
                };
                for each (_local_3 in _local_2.LevelUp)
                {
                    _local_25 = new Object();
                    _local_25.name = _local_3.@Name.toString();
                    _local_25.hard = parseInt(_local_3.@Hard.toString());
                    _local_25.exp = parseInt(_local_3.@Exp.toString());
                    _local_25.money = parseInt(_local_3.@Money.toString());
                    _local_25.sx = parseInt(_local_3.@Sx.toString());
                    _local_25.desc = _local_3.@Description.toString();
                    _local_25.resCode = parseInt(_local_3.@ResCode.toString());
                    _local_25.timeStr = TimeUtil.getTimeStr(_local_3.@Time.toString());
                    _local_6 = _local_3.@NID.toString();
                    _local_9 = ((_local_6 == "") ? new Array() : _local_6.split(","));
                    _local_12 = 0;
                    while (_local_12 < _local_9.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_14 = (("|npc" + _local_13) + "|");
                        _local_15 = GameData.d[GamePredef.TBL_NPC][_local_9[_local_12]].name;
                        _local_16 = (((((('<font color="#FF0000"> <a href="event:L_N|' + _local_9[_local_12]) + "|") + _local_15) + '">[') + _local_15) + "]</a></font>");
                        _local_25.desc = _local_25.desc.replace(_local_14, _local_16);
                        _local_12++;
                    };
                    levelUpActiveList.addItem(_local_25);
                };
                for each (_local_3 in _local_2.EarnMoney)
                {
                    _local_26 = new Object();
                    _local_26.name = _local_3.@Name.toString();
                    _local_26.hard = parseInt(_local_3.@Hard.toString());
                    _local_26.exp = parseInt(_local_3.@Exp.toString());
                    _local_26.money = parseInt(_local_3.@Money.toString());
                    _local_26.resCode = parseInt(_local_3.@ResCode.toString());
                    _local_26.desc = _local_3.@Description.toString();
                    _local_26.timeStr = TimeUtil.getTimeStr(_local_3.@Time.toString());
                    _local_6 = _local_3.@NID.toString();
                    _local_9 = ((_local_6 == "") ? new Array() : _local_6.split(","));
                    _local_12 = 0;
                    while (_local_12 < _local_9.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_14 = (("|npc" + _local_13) + "|");
                        _local_15 = GameData.d[GamePredef.TBL_NPC][_local_9[_local_12]].name;
                        _local_16 = (((((('<font color="#FF0000"> <a href="event:L_N|' + _local_9[_local_12]) + "|") + _local_15) + '">[') + _local_15) + "]</a></font>");
                        _local_26.desc = _local_26.desc.replace(_local_14, _local_16);
                        _local_12++;
                    };
                    earnMoneyActiveList.addItem(_local_26);
                };
                for each (_local_3 in _local_2.Treasure)
                {
                    _local_27 = new Object();
                    _local_27.name = _local_3.@Name.toString();
                    _local_27.hard = parseInt(_local_3.@Hard.toString());
                    _local_27.quality = parseInt(_local_3.@Quality.toString());
                    _local_27.exp = parseInt(_local_3.@Exp.toString());
                    _local_27.sx = parseInt(_local_3.@Sx.toString());
                    _local_27.resCode = parseInt(_local_3.@ResCode.toString());
                    _local_27.desc = _local_3.@Description.toString();
                    _local_27.timeStr = TimeUtil.getTimeStr(_local_3.@Time.toString());
                    _local_7 = _local_3.@MID.toString();
                    _local_6 = _local_3.@NID.toString();
                    _local_9 = ((_local_6 == "") ? new Array() : _local_6.split(","));
                    _local_10 = ((_local_7 == "") ? new Array() : _local_7.split(","));
                    _local_12 = 0;
                    while (_local_12 < _local_9.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_14 = (("|npc" + _local_13) + "|");
                        _local_15 = GameData.d[GamePredef.TBL_NPC][_local_9[_local_12]].name;
                        _local_16 = (((((('<font color="#FF0000"> <a href="event:L_N|' + _local_9[_local_12]) + "|") + _local_15) + '">[') + _local_15) + "]</a></font>");
                        _local_27.desc = _local_27.desc.replace(_local_14, _local_16);
                        _local_12++;
                    };
                    _local_12 = 0;
                    while (_local_12 < _local_10.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_17 = (("|map" + _local_13) + "|");
                        _local_18 = GameData.d[GamePredef.TBL_MAP][_local_10[_local_12]].name;
                        _local_19 = (((((('<font color="#0000FF"> <a href="event:L_MA|' + _local_10[_local_12]) + "|") + _local_18) + '">[') + _local_18) + "]</a></font>");
                        _local_27.desc = _local_27.desc.replace(_local_17, _local_19);
                        _local_12++;
                    };
                    equiptActiveList.addItem(_local_27);
                };
                for each (_local_3 in _local_2.Sports)
                {
                    _local_28 = new Object();
                    _local_28.name = _local_3.@Name.toString();
                    _local_28.hard = parseInt(_local_3.@Hard.toString());
                    _local_28.quality = parseInt(_local_3.@Quality.toString());
                    _local_28.money = parseInt(_local_3.@Money.toString());
                    _local_28.sx = parseInt(_local_3.@Sx.toString());
                    _local_28.resCode = parseInt(_local_3.@ResCode.toString());
                    _local_28.desc = _local_3.@Description.toString();
                    _local_28.timeStr = TimeUtil.getTimeStr(_local_3.@Time.toString());
                    _local_7 = _local_3.@MID.toString();
                    _local_6 = _local_3.@NID.toString();
                    _local_9 = ((_local_6 == "") ? new Array() : _local_6.split(","));
                    _local_10 = ((_local_7 == "") ? new Array() : _local_7.split(","));
                    _local_12 = 0;
                    while (_local_12 < _local_9.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_14 = (("|npc" + _local_13) + "|");
                        _local_15 = GameData.d[GamePredef.TBL_NPC][_local_9[_local_12]].name;
                        _local_16 = (((((('<font color="#FF0000"> <a href="event:L_N|' + _local_9[_local_12]) + "|") + _local_15) + '">[') + _local_15) + "]</a></font>");
                        _local_28.desc = _local_28.desc.replace(_local_14, _local_16);
                        _local_12++;
                    };
                    _local_12 = 0;
                    while (_local_12 < _local_10.length)
                    {
                        _local_13 = (_local_12 + 1);
                        _local_17 = (("|map" + _local_13) + "|");
                        _local_18 = GameData.d[GamePredef.TBL_MAP][_local_10[_local_12]].name;
                        _local_19 = (((((('<font color="#0000FF"> <a href="event:L_MA|' + _local_10[_local_12]) + "|") + _local_18) + '">[') + _local_18) + "]</a></font>");
                        _local_28.desc = _local_28.desc.replace(_local_17, _local_19);
                        _local_12++;
                    };
                    sportActiveList.addItem(_local_28);
                };
                panelConfig_load = true;
                DG_active.dataProvider = activityItemList;
                DG_boss.dataProvider = groundBossList;
                DG_fb.dataProvider = fbList;
            };
            initDefaultViews();
        }

        private function _GameIntroPanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn2 = _local_1;
            _local_1.width = 100;
            _local_1.dataField = "NPC";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn2", _GameIntroPanel_DataGridColumn2);
            return (_local_1);
        }

        public function ___GameIntroPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set vb_sport(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._896341983vb_sport;
            if (_local_2 !== _arg_1)
            {
                this._896341983vb_sport = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb_sport", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_ClassFactory11_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function _GameIntroPanel_DataGridColumn29_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn29 = _local_1;
            _local_1.sortable = true;
            _local_1.sortCompareFunction = sortConsumeAwardList;
            _local_1.dataField = "key";
            _local_1.width = 200;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn29", _GameIntroPanel_DataGridColumn29);
            return (_local_1);
        }

        private function _GameIntroPanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = GameIntroPanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get groundBossList():ArrayCollection
        {
            return (this._570251182groundBossList);
        }

        public function set getConsumeAwardBtn1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._411634732getConsumeAwardBtn1;
            if (_local_2 !== _arg_1)
            {
                this._411634732getConsumeAwardBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getConsumeAwardBtn1", _local_2, _arg_1));
            };
        }

        public function set getDiscountBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1176746971getDiscountBtn;
            if (_local_2 !== _arg_1)
            {
                this._1176746971getDiscountBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getDiscountBtn", _local_2, _arg_1));
            };
        }

        public function set getConsumeAwardBtn2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._411634733getConsumeAwardBtn2;
            if (_local_2 !== _arg_1)
            {
                this._411634733getConsumeAwardBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getConsumeAwardBtn2", _local_2, _arg_1));
            };
        }

        public function set getConsumeAwardBtn3(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._411634734getConsumeAwardBtn3;
            if (_local_2 !== _arg_1)
            {
                this._411634734getConsumeAwardBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getConsumeAwardBtn3", _local_2, _arg_1));
            };
        }

        public function set getConsumeAwardBtn4(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._411634735getConsumeAwardBtn4;
            if (_local_2 !== _arg_1)
            {
                this._411634735getConsumeAwardBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getConsumeAwardBtn4", _local_2, _arg_1));
            };
        }

        public function set getConsumeAwardBtn5(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._411634736getConsumeAwardBtn5;
            if (_local_2 !== _arg_1)
            {
                this._411634736getConsumeAwardBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getConsumeAwardBtn5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xmlActivity():XML
        {
            return (this._58843066xmlActivity);
        }

        public function __actBtn1_click(_arg_1:MouseEvent):void
        {
            getActAward(_arg_1);
        }

        private function set nextConti(_arg_1:int):void
        {
            var _local_2:Object;
            _local_2 = this._1191222340nextConti;
            if (_local_2 !== _arg_1)
            {
                this._1191222340nextConti = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextConti", _local_2, _arg_1));
            };
        }

        private function onGetFestToday(_arg_1:Object):void
        {
            var _local_2:Object;
            if (_arg_1.id > 0)
            {
                _local_2 = GameData.d[GamePredef.TBL_FEAST][_arg_1.id];
                if (((_arg_1.data) && (_arg_1.data.aw)))
                {
                    _local_2 = _arg_1.data;
                };
                if (_local_2)
                {
                    if (_arg_1.enable == 1)
                    {
                        festSlot.giid = _local_2.aw;
                        getFestBtn.enabled = true;
                    };
                    ta_festDesc.text = _local_2.inf;
                    ta_festDesc.visible = true;
                    ta_festDesc.content.verticalScrollPolicy = "off";
                    ta_festDesc.content.horizontalScrollPolicy = "off";
                    currentFestTxt.text = Language.ACTIVEPANEL_S[4].toString().replace("{festv.na}", _local_2.na);
                    currentFestTxt.y = 230;
                    Btn_AllFest.y = 228;
                    lb_festdesc.y = 320;
                }
                else
                {
                    currentFestTxt.text = Language.ACTIVEPANEL_S[5];
                    currentFestTxt.y = 261;
                    Btn_AllFest.y = 260;
                    lb_festdesc.y = 314;
                };
            }
            else
            {
                ta_festDesc.visible = false;
                currentFestTxt.text = Language.ACTIVEPANEL_S[5];
                currentFestTxt.y = 261;
                Btn_AllFest.y = 260;
                lb_festdesc.y = 314;
            };
        }

        public function set xmlActivity(_arg_1:XML):void
        {
            var _local_2:Object;
            _local_2 = this._58843066xmlActivity;
            if (_local_2 !== _arg_1)
            {
                this._58843066xmlActivity = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xmlActivity", _local_2, _arg_1));
            };
        }

        private function initFestToday():void
        {
            _core.remote.call("getCurrentFeast", new Responder(onGetFestToday));
        }

        public function onSerchForGift(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (_arg_1)
            {
                _itemIcon = new Image();
                _local_2 = _core.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, 2059, false);
                if (_local_2)
                {
                    _itemIcon.source = ResManager.getIconUrl(_local_2.iconCode);
                    ResManager.setColorCode(_itemIcon, _local_2.colorCode);
                    i8.addChild(_itemIcon);
                };
            };
        }

        public function __DG_active_itemClick(_arg_1:ListEvent):void
        {
            onActItemClickHandler(_arg_1);
        }

        private function onDiaryItemClickHandler(_arg_1:ListEvent):void
        {
        }

        private function _GameIntroPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup;
            _local_1 = new RadioButtonGroup();
            rgActives = _local_1;
            _local_1.addEventListener("itemClick", __rgActives_itemClick);
            _local_1.initialized(this, "rgActives");
            return (_local_1);
        }

        public function set noticeBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1269814196noticeBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1269814196noticeBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noticeBtn0", _local_2, _arg_1));
            };
        }

        public function set noticeBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1269814195noticeBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1269814195noticeBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noticeBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get actAward0():ItemSlot
        {
            return (this._939851611actAward0);
        }

        [Bindable(event="propertyChange")]
        public function get actAward1():ItemSlot
        {
            return (this._939851610actAward1);
        }

        [Bindable(event="propertyChange")]
        public function get actAward2():ItemSlot
        {
            return (this._939851609actAward2);
        }

        [Bindable(event="propertyChange")]
        public function get actAward3():ItemSlot
        {
            return (this._939851608actAward3);
        }

        [Bindable(event="propertyChange")]
        public function get actAward4():ItemSlot
        {
            return (this._939851607actAward4);
        }

        private function carItemShow(_arg_1:int=0):void
        {
            var _local_5:Object;
            carStyle = _arg_1;
            selectACar.selected = (_arg_1 == 0);
            selectBCar.selected = (_arg_1 == 1);
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:ArrayCollection = new ArrayCollection();
            for each (_local_5 in pointsCar)
            {
                if (_local_5)
                {
                    if (((!(_local_2)) && (_local_5.group == 0)))
                    {
                        _local_2 = true;
                    };
                    if (((!(_local_3)) && (_local_5.group == 1)))
                    {
                        _local_3 = true;
                    };
                    if (((_local_5.group == null) || (_local_5.group == carStyle)))
                    {
                        _local_4.addItem(_local_5);
                    };
                };
            };
            if (((_local_2) && (_local_3)))
            {
                selectACar.visible = true;
                selectBCar.visible = true;
                selectACar.enabled = true;
                selectBCar.enabled = true;
            }
            else
            {
                selectACar.visible = false;
                selectBCar.visible = false;
                selectACar.enabled = false;
                selectBCar.enabled = false;
            };
            trolleyDG.dataProvider = _local_4;
        }

        [Bindable(event="propertyChange")]
        public function get getConsumeAwardBtn():BasicDelayButton
        {
            return (this._1233647451getConsumeAwardBtn);
        }

        private function itemShow(_arg_1:int=0):void
        {
            var _local_5:Object;
            itemShowStyle = _arg_1;
            selectA.selected = (_arg_1 == 0);
            selectB.selected = (_arg_1 == 1);
            var _local_2:Boolean;
            var _local_3:Boolean;
            var _local_4:ArrayCollection = new ArrayCollection();
            for each (_local_5 in points)
            {
                if (_local_5)
                {
                    if (((!(_local_2)) && (_local_5.group == 0)))
                    {
                        _local_2 = true;
                    };
                    if (((!(_local_3)) && (_local_5.group == 1)))
                    {
                        _local_3 = true;
                    };
                    if (((_local_5.group == null) || (_local_5.group == itemShowStyle)))
                    {
                        _local_4.addItem(_local_5);
                    };
                };
            };
            if (((_local_2) && (_local_3)))
            {
                selectA.visible = true;
                selectB.visible = true;
                selectA.enabled = true;
                selectB.enabled = true;
            }
            else
            {
                selectA.visible = false;
                selectB.visible = false;
                selectA.enabled = false;
                selectB.enabled = false;
            };
            cashDG.dataProvider = _local_4;
        }

        private function _GameIntroPanel_DataGridColumn16_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn16 = _local_1;
            _local_1.dataField = "binded";
            _local_1.labelFunction = pointAwardBinded;
            _local_1.width = 80;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn16", _GameIntroPanel_DataGridColumn16);
            return (_local_1);
        }

        private function set groundBossList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._570251182groundBossList;
            if (_local_2 !== _arg_1)
            {
                this._570251182groundBossList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groundBossList", _local_2, _arg_1));
            };
        }

        private function timeLimitCheck(_arg_1:Object, _arg_2:DataGridColumn):String
        {
            return (((_arg_1.start == undefined) || (_arg_1.start == 0)) ? Language.GAMEPREDEF_S[1] : Language.GAMEPREDEF_S[0]);
        }

        [Bindable(event="propertyChange")]
        public function get factor1():RoundedLabel
        {
            return (this._1091882814factor1);
        }

        [Bindable(event="propertyChange")]
        public function get factor2():RoundedLabel
        {
            return (this._1091882813factor2);
        }

        private function changeActivesArr(_arg_1:ItemClickEvent):void
        {
            var _local_2:*;
            if (_arg_1.index == 0)
            {
                DG_active.dataProvider = activityItemList;
            }
            else
            {
                enableActiveList.removeAll();
                for (_local_2 in activityItemList)
                {
                    if (activityItemList.getItemAt(_local_2).Level <= _core.player.level)
                    {
                        enableActiveList.addItem(activityItemList.getItemAt(_local_2));
                    };
                };
                DG_active.dataProvider = enableActiveList;
            };
        }

        [Bindable(event="propertyChange")]
        public function get factor0():RoundedLabel
        {
            return (this._1091882815factor0);
        }

        private function _GameIntroPanel_DataGridColumn27_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn27 = _local_1;
            _local_1.sortable = true;
            _local_1.sortCompareFunction = sortConsumeAwardList;
            _local_1.dataField = "key";
            _local_1.width = 200;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn27", _GameIntroPanel_DataGridColumn27);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get factor4():RoundedLabel
        {
            return (this._1091882811factor4);
        }

        public function __DG_fb_itemClick(_arg_1:ListEvent):void
        {
            onFbItemClickHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get factor3():RoundedLabel
        {
            return (this._1091882812factor3);
        }

        public function __getDiscountBtn_click(_arg_1:MouseEvent):void
        {
            buyDiscountGift();
        }

        public function __getConsumeAwardBtn5_click(_arg_1:MouseEvent):void
        {
            getStageConsumeAward(5);
        }

        public function ___GameIntroPanel_Canvas45_creationComplete(_arg_1:FlexEvent):void
        {
            loadSystemInfo();
        }

        private function initDailyAct():void
        {
            _core.remote.call("getTodayOnlineTime", new Responder(onGetTodayOnlineTime));
        }

        private function _GameIntroPanel_DataGridColumn38_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn38 = _local_1;
            _local_1.width = 65;
            _local_1.dataField = "_numStr";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn38", _GameIntroPanel_DataGridColumn38);
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            closeTimer();
            if (_arg_1)
            {
                initLoginAward();
                if (vs.selectedIndex == 9)
                {
                    initDailyAct();
                };
            };
        }

        public function autoClickForWordMsg(_arg_1:int):void
        {
            var _local_2:*;
            tabBtnClick(0);
            for (_local_2 in activityItemList)
            {
                if (activityItemList.getItemAt(_local_2).idx == _arg_1)
                {
                    DG_active.selectedIndex = _local_2;
                    DG_active.scrollToIndex(_local_2);
                    activityDescription = (("<font color='#FFFFFF'>" + DG_active.selectedItem.Description) + "</font>");
                    break;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get actBtn2():BasicGlowButton
        {
            return (this._1162960632actBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get actBtn3():BasicGlowButton
        {
            return (this._1162960631actBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get DG_diary():DataGrid
        {
            return (this._344383225DG_diary);
        }

        public function __rgActives_itemClick(_arg_1:ItemClickEvent):void
        {
            changeActivesArr(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get actBtn1():BasicGlowButton
        {
            return (this._1162960633actBtn1);
        }

        public function __selectBCar_click(_arg_1:MouseEvent):void
        {
            carItemShow(1);
        }

        [Bindable(event="propertyChange")]
        public function get actBtn4():BasicGlowButton
        {
            return (this._1162960630actBtn4);
        }

        public function set ti_tz(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._110351504ti_tz;
            if (_local_2 !== _arg_1)
            {
                this._110351504ti_tz = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti_tz", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get actBtn0():BasicGlowButton
        {
            return (this._1162960634actBtn0);
        }

        private function _GameIntroPanel_DataGridColumn14_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn14 = _local_1;
            _local_1.dataField = "key";
            _local_1.width = 110;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn14", _GameIntroPanel_DataGridColumn14);
            return (_local_1);
        }

        private function doBuyPet(result:Boolean):void
        {
            var bagpanel:Object;
            var view:ConsumPanel;
            var gold:int;
            var func:Function;
            var showString:String;
            if (result)
            {
                if (!seletedItem.shopSlot)
                {
                    return;
                };
                bagpanel = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((bagpanel) && (bagpanel.goldSelected)))
                {
                    bagpanel.goldLockFlag = false;
                };
                view = ConsumPanel(_core.view.getUI(ViewManager.MAIN_CONSUMP));
                gold = seletedItem.shopSlot.gold;
                if (seletedItem.shopSlot.id)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("buySystemItemClient", new Responder(onBuyDisc), seletedItem.shopSlot.id, 1);
                        };
                    };
                    showString = Language.ACTIVEPANEL_S[2];
                    showString = showString.replace("{gold}", gold);
                    showString = showString.replace("{selectedName}", selectedName);
                    Alert.show(showString, Language.ACTIVEPANEL_S[3], (Alert.YES | Alert.NO), this, func);
                };
            };
        }

        public function ___GameIntroPanel_RoundedButton3_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_EXCHANGE);
        }

        [Bindable(event="propertyChange")]
        public function get vb_eqt():VBox
        {
            return (this._823291595vb_eqt);
        }

        public function set actAward0(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._939851611actAward0;
            if (_local_2 !== _arg_1)
            {
                this._939851611actAward0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actAward0", _local_2, _arg_1));
            };
        }

        private function set petItemList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._32480112petItemList;
            if (_local_2 !== _arg_1)
            {
                this._32480112petItemList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petItemList", _local_2, _arg_1));
            };
        }

        public function set actAward2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._939851609actAward2;
            if (_local_2 !== _arg_1)
            {
                this._939851609actAward2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actAward2", _local_2, _arg_1));
            };
        }

        private function onGetFlagDisc(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (_arg_1 <= 0)))
            {
                getDiscountBtn.enabled = false;
                return;
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_PLAN][_arg_1];
            if (_local_2)
            {
                DiscountSlot.type = _local_2.ti;
                DiscountSlot.giid = _local_2.ii;
                DiscountSlot.stackNum = _local_2.n;
                getDiscountBtn.enabled = true;
            };
        }

        public function set getConsumeAwardBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1233647451getConsumeAwardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1233647451getConsumeAwardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getConsumeAwardBtn", _local_2, _arg_1));
            };
        }

        public function set actAward1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._939851610actAward1;
            if (_local_2 !== _arg_1)
            {
                this._939851610actAward1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actAward1", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn25_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn25 = _local_1;
            _local_1.sortable = true;
            _local_1.sortCompareFunction = sortConsumeAwardList;
            _local_1.dataField = "key";
            _local_1.width = 200;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn25", _GameIntroPanel_DataGridColumn25);
            return (_local_1);
        }

        public function set actAward4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._939851607actAward4;
            if (_local_2 !== _arg_1)
            {
                this._939851607actAward4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actAward4", _local_2, _arg_1));
            };
        }

        public function set actAward3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._939851608actAward3;
            if (_local_2 !== _arg_1)
            {
                this._939851608actAward3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actAward3", _local_2, _arg_1));
            };
        }

        private function buyContiGift():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuyContiGift), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuyContiGift(true);
            };
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg():String
        {
            return (this._885700253consumeAcMsg);
        }

        public function ___GameIntroPanel_Canvas27_show(_arg_1:FlexEvent):void
        {
            initConsumeAward();
        }

        [Bindable(event="propertyChange")]
        private function get activityDescription():String
        {
            return (this._975828627activityDescription);
        }

        [Bindable(event="propertyChange")]
        private function get continueDay():int
        {
            return (this._1132705419continueDay);
        }

        private function _GameIntroPanel_DataGridColumn36_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn36 = _local_1;
            _local_1.width = 150;
            _local_1.dataField = "name";
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory15_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn36", _GameIntroPanel_DataGridColumn36);
            return (_local_1);
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(4);
        }

        public function set factor0(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882815factor0;
            if (_local_2 !== _arg_1)
            {
                this._1091882815factor0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor0", _local_2, _arg_1));
            };
        }

        private function getLoginGift():void
        {
            if (((dailySlot.giid) && (dailySlot.giid > 0)))
            {
                _core.remote.call("getLoginAward", new Responder(onGetDailyAward));
            };
        }

        public function __ti_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set factor2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882813factor2;
            if (_local_2 !== _arg_1)
            {
                this._1091882813factor2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor2", _local_2, _arg_1));
            };
        }

        public function set factor3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882812factor3;
            if (_local_2 !== _arg_1)
            {
                this._1091882812factor3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor3", _local_2, _arg_1));
            };
        }

        public function set factor4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882811factor4;
            if (_local_2 !== _arg_1)
            {
                this._1091882811factor4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor4", _local_2, _arg_1));
            };
        }

        public function set factor1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1091882814factor1;
            if (_local_2 !== _arg_1)
            {
                this._1091882814factor1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "factor1", _local_2, _arg_1));
            };
        }

        private function doBuyContiGift(result:Boolean):void
        {
            var bagpanel:Object;
            var shopSlot:Object;
            var i:int;
            var func:Function;
            var item:Object;
            var showString:String;
            if (result)
            {
                bagpanel = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((bagpanel) && (bagpanel.goldSelected)))
                {
                    bagpanel.goldLockFlag = false;
                };
                shopSlot = new Object();
                i = 0;
                while (i <= GameData.d[GamePredef.TBL_SHOP_SLOT].length)
                {
                    if ((((((((GameData.d[GamePredef.TBL_SHOP_SLOT][i]) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].type == contiSlot.type)) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].itemId == contiSlot.giid)) && (!(GameData.d[GamePredef.TBL_SHOP_SLOT][i].st == 5))) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].money <= 0)) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].gold > 0)) && (!(GameData.d[GamePredef.TBL_SHOP_SLOT][i].sid == GamePredef.VIP_SHOP_ID))))
                    {
                        shopSlot = GameData.d[GamePredef.TBL_SHOP_SLOT][i];
                        break;
                    };
                    i = (i + 1);
                };
                if (shopSlot.id)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("buyContiGift", new Responder(onBuyConti), shopSlot.id);
                        };
                    };
                    item = GameData.d[contiSlot.type][contiSlot.giid];
                    if (item)
                    {
                        showString = Language.ACTIVEPANEL_S[7];
                        if (shopSlot.gold > 0)
                        {
                            showString = showString.replace("{shopSlot.gold}", shopSlot.gold);
                            showString = showString.replace("{item.name}", item.name);
                        }
                        else
                        {
                            showString = showString.replace("{shopSlot.gold}", item.gold);
                            showString = showString.replace("{item.name}", item.name);
                        };
                        Alert.show(showString, "", (Alert.YES | Alert.NO), this, func);
                    };
                };
            };
        }

        public function showStagePlatform(_arg_1:int):void
        {
            vs_stageConsume.selectedIndex = _arg_1;
        }

        private function _GameIntroPanel_bindingsSetup():Array
        {
            var result:Array;
            var binding:Binding;
            result = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn5.label = _arg_1;
            }, "tabBtn5.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn6.label = _arg_1;
            }, "tabBtn6.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn7.label = _arg_1;
            }, "tabBtn7.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn8.label = _arg_1;
            }, "tabBtn8.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn9.label = _arg_1;
            }, "tabBtn9.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn10.label = _arg_1;
            }, "tabBtn10.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RadioButton1.label = _arg_1;
            }, "_GameIntroPanel_RadioButton1.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RadioButton2.label = _arg_1;
            }, "_GameIntroPanel_RadioButton2.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn1.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn1.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn2.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn2.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn3.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn3.headerText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn4.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn4.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn5.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn5.headerText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = activityDescription;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_LinkTextArea1.htmlText = _arg_1;
            }, "_GameIntroPanel_LinkTextArea1.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (petItemList);
            }, function (_arg_1:Object):void
            {
                petDataList.dataProvider = _arg_1;
            }, "petDataList.dataProvider");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel2.text = _arg_1;
            }, "_GameIntroPanel_RoundedLabel2.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel3.text = _arg_1;
            }, "_GameIntroPanel_RoundedLabel3.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel4.text = _arg_1;
            }, "_GameIntroPanel_RoundedLabel4.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel5.text = _arg_1;
            }, "_GameIntroPanel_RoundedLabel5.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel6.text = _arg_1;
            }, "_GameIntroPanel_RoundedLabel6.text");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.PET_PENTAGON);
            }, function (_arg_1:Object):void
            {
                _GameIntroPanel_Image4.source = _arg_1;
            }, "_GameIntroPanel_Image4.source");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARSELECTCANVAS_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor0.text = _arg_1;
            }, "factor0.text");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor0.filters = _arg_1;
            }, "factor0.filters");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARSELECTCANVAS_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor1.text = _arg_1;
            }, "factor1.text");
            result[29] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor1.filters = _arg_1;
            }, "factor1.filters");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARSELECTCANVAS_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor2.text = _arg_1;
            }, "factor2.text");
            result[31] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor2.filters = _arg_1;
            }, "factor2.filters");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARSELECTCANVAS_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor3.text = _arg_1;
            }, "factor3.text");
            result[33] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor3.filters = _arg_1;
            }, "factor3.filters");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.CHARSELECTCANVAS_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                factor4.text = _arg_1;
            }, "factor4.text");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                factor4.filters = _arg_1;
            }, "factor4.filters");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel12.text = _arg_1;
            }, "_GameIntroPanel_RoundedLabel12.text");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedLabel12.toolTip = _arg_1;
            }, "_GameIntroPanel_RoundedLabel12.toolTip");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicGlowButton12.label = _arg_1;
            }, "_GameIntroPanel_BasicGlowButton12.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicGlowButton13.label = _arg_1;
            }, "_GameIntroPanel_BasicGlowButton13.label");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn6.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn6.headerText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn7.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn7.headerText");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn8.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn8.headerText");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn9.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn9.headerText");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn10.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn10.headerText");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn11.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn11.headerText");
            result[46] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn12.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn12.headerText");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn13.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn13.headerText");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RadioButton3.label = _arg_1;
            }, "_GameIntroPanel_RadioButton3.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RadioButton4.label = _arg_1;
            }, "_GameIntroPanel_RadioButton4.label");
            result[50] = binding;
            binding = new Binding(this, function ():Object
            {
                return (flListItemArr);
            }, function (_arg_1:Object):void
            {
                List_fl.dataProvider = _arg_1;
            }, "List_fl.dataProvider");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getGiftBtn.label = _arg_1;
            }, "getGiftBtn.label");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getDiscountBtn.label = _arg_1;
            }, "getDiscountBtn.label");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getContiBtn.label = _arg_1;
            }, "getContiBtn.label");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getFestBtn.label = _arg_1;
            }, "getFestBtn.label");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_IntroText1.text = _arg_1;
            }, "_GameIntroPanel_IntroText1.text");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_IntroText2.text = _arg_1;
            }, "_GameIntroPanel_IntroText2.text");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                dailySlot.type = _arg_1;
            }, "dailySlot.type");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (GamePredef.TBL_ITEM_TEMPLATE);
            }, function (_arg_1:int):void
            {
                festSlot.type = _arg_1;
            }, "festSlot.type");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                Btn_AllFest.label = _arg_1;
            }, "Btn_AllFest.label");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lb_festdesc.text = _arg_1;
            }, "lb_festdesc.text");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[13].toString().replace("{continueDay}", continueDay);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DescriptionLabel3.text = _arg_1;
            }, "_GameIntroPanel_DescriptionLabel3.text");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[14].toString().replace("{nextConti}", nextConti);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DescriptionLabel4.text = _arg_1;
            }, "_GameIntroPanel_DescriptionLabel4.text");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_IntroText4.text = _arg_1;
            }, "_GameIntroPanel_IntroText4.text");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton1.label = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton1.label");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton2.label = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton2.label");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton3.label = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton3.label");
            result[67] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton4.label = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton4.label");
            result[68] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWARDALL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwardsByCode.label = _arg_1;
            }, "getAwardsByCode.label");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWARDALL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getAwardsFromNet.label = _arg_1;
            }, "getAwardsFromNet.label");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.SYSTEMSHOPPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicDelayButton3.toolTip = _arg_1;
            }, "_GameIntroPanel_BasicDelayButton3.toolTip");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWARDALL_S[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicDelayButton3.label = _arg_1;
            }, "_GameIntroPanel_BasicDelayButton3.label");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWARDALL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_IntroText5.text = _arg_1;
            }, "_GameIntroPanel_IntroText5.text");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWARDALL_S[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_IntroText6.text = _arg_1;
            }, "_GameIntroPanel_IntroText6.text");
            result[74] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.AWARDALL_S[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_IntroText7.text = _arg_1;
            }, "_GameIntroPanel_IntroText7.text");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn14.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn14.headerText");
            result[76] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn15.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn15.headerText");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn16.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn16.headerText");
            result[78] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn17.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn17.headerText");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn18.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn18.headerText");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[69];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_LinkButton2.label = _arg_1;
            }, "_GameIntroPanel_LinkButton2.label");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DescriptionLabel5.text = _arg_1;
            }, "_GameIntroPanel_DescriptionLabel5.text");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selectA.label = _arg_1;
            }, "selectA.label");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selectB.label = _arg_1;
            }, "selectB.label");
            result[84] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_RoundedButton3.label = _arg_1;
            }, "_GameIntroPanel_RoundedButton3.label");
            result[85] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn19.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn19.headerText");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[55];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn20.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn20.headerText");
            result[87] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn21.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn21.headerText");
            result[88] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn22.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn22.headerText");
            result[89] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selectACar.label = _arg_1;
            }, "selectACar.label");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selectBCar.label = _arg_1;
            }, "selectBCar.label");
            result[91] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.SYSTEMSHOPPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                toCar.label = _arg_1;
            }, "toCar.label");
            result[92] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[70];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_LinkButton3.label = _arg_1;
            }, "_GameIntroPanel_LinkButton3.label");
            result[93] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DescriptionLabel6.text = _arg_1;
            }, "_GameIntroPanel_DescriptionLabel6.text");
            result[94] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn23.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn23.headerText");
            result[95] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn24.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn24.headerText");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate.text = _arg_1;
            }, "consumeActDate.text");
            result[97] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getConsumeAwardBtn.label = _arg_1;
            }, "getConsumeAwardBtn.label");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                StageConsumeBtn0.label = _arg_1;
            }, "StageConsumeBtn0.label");
            result[99] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[49];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                StageConsumeBtn1.label = _arg_1;
            }, "StageConsumeBtn1.label");
            result[100] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[50];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                StageConsumeBtn2.label = _arg_1;
            }, "StageConsumeBtn2.label");
            result[101] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[51];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                StageConsumeBtn3.label = _arg_1;
            }, "StageConsumeBtn3.label");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                StageConsumeBtn4.label = _arg_1;
            }, "StageConsumeBtn4.label");
            result[103] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[53];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                StageConsumeBtn5.label = _arg_1;
            }, "StageConsumeBtn5.label");
            result[104] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn25.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn25.headerText");
            result[105] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn26.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn26.headerText");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg0;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate0.text = _arg_1;
            }, "consumeActDate0.text");
            result[107] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getStageConsumeAwardBtn0.label = _arg_1;
            }, "getStageConsumeAwardBtn0.label");
            result[108] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn27.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn27.headerText");
            result[109] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn28.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn28.headerText");
            result[110] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg1;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate1.text = _arg_1;
            }, "consumeActDate1.text");
            result[111] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getConsumeAwardBtn1.label = _arg_1;
            }, "getConsumeAwardBtn1.label");
            result[112] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn29.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn29.headerText");
            result[113] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn30.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn30.headerText");
            result[114] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg2;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate2.text = _arg_1;
            }, "consumeActDate2.text");
            result[115] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getConsumeAwardBtn2.label = _arg_1;
            }, "getConsumeAwardBtn2.label");
            result[116] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn31.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn31.headerText");
            result[117] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn32.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn32.headerText");
            result[118] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg3;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate3.text = _arg_1;
            }, "consumeActDate3.text");
            result[119] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getConsumeAwardBtn3.label = _arg_1;
            }, "getConsumeAwardBtn3.label");
            result[120] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn33.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn33.headerText");
            result[121] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn34.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn34.headerText");
            result[122] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg4;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate4.text = _arg_1;
            }, "consumeActDate4.text");
            result[123] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getConsumeAwardBtn4.label = _arg_1;
            }, "getConsumeAwardBtn4.label");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_S[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn35.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn35.headerText");
            result[125] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = consumeAcMsg5;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                consumeActDate5.text = _arg_1;
            }, "consumeActDate5.text");
            result[126] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.ACTIVEPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                getConsumeAwardBtn5.label = _arg_1;
            }, "getConsumeAwardBtn5.label");
            result[127] = binding;
            binding = new Binding(this, function ():Object
            {
                return (diaryList);
            }, function (_arg_1:Object):void
            {
                DG_diary.dataProvider = _arg_1;
            }, "DG_diary.dataProvider");
            result[128] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn36.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn36.headerText");
            result[129] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn37.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn37.headerText");
            result[130] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_DataGridColumn38.headerText = _arg_1;
            }, "_GameIntroPanel_DataGridColumn38.headerText");
            result[131] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[39];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton5.label = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton5.label");
            result[132] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton6.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton6.text");
            result[133] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton8.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton8.text");
            result[134] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 30);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton10.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton10.text");
            result[135] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn0.label = _arg_1;
            }, "actBtn0.label");
            result[136] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 30));
            }, function (_arg_1:Boolean):void
            {
                actBtn0.enabled = _arg_1;
            }, "actBtn0.enabled");
            result[137] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 60);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton11.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton11.text");
            result[138] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn1.label = _arg_1;
            }, "actBtn1.label");
            result[139] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 60));
            }, function (_arg_1:Boolean):void
            {
                actBtn1.enabled = _arg_1;
            }, "actBtn1.enabled");
            result[140] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 120);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton12.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton12.text");
            result[141] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn2.label = _arg_1;
            }, "actBtn2.label");
            result[142] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 120));
            }, function (_arg_1:Boolean):void
            {
                actBtn2.enabled = _arg_1;
            }, "actBtn2.enabled");
            result[143] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 210);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton13.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton13.text");
            result[144] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn3.label = _arg_1;
            }, "actBtn3.label");
            result[145] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 210));
            }, function (_arg_1:Boolean):void
            {
                actBtn3.enabled = _arg_1;
            }, "actBtn3.enabled");
            result[146] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 360);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton14.text = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton14.text");
            result[147] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn4.label = _arg_1;
            }, "actBtn4.label");
            result[148] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 360));
            }, function (_arg_1:Boolean):void
            {
                actBtn4.enabled = _arg_1;
            }, "actBtn4.enabled");
            result[149] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[40];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GameIntroPanel_BasicTxtButton15.htmlText = _arg_1;
            }, "_GameIntroPanel_BasicTxtButton15.htmlText");
            result[150] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                noticeBtn0.label = _arg_1;
            }, "noticeBtn0.label");
            result[151] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.GAMEINTROPANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                noticeBtn1.label = _arg_1;
            }, "noticeBtn1.label");
            result[152] = binding;
            return (result);
        }

        public function __StageConsumeBtn4_click(_arg_1:MouseEvent):void
        {
            showStagePlatform(4);
        }

        public function initLoginAward():void
        {
            if (!flag["loginAward"])
            {
                _core.remote.call("getTodayAward", new Responder(onGetTodayAward));
                initFestToday();
            };
            flag["loginAward"] = true;
            changeMiniMapMsgBtnStyle();
        }

        private function _GameIntroPanel_DataGridColumn12_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn12 = _local_1;
            _local_1.width = 100;
            _local_1.dataField = "line";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn12", _GameIntroPanel_DataGridColumn12);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get _selectedDesc():TextArea
        {
            return (this._436537771_selectedDesc);
        }

        public function __petDataList_itemClick(_arg_1:ListEvent):void
        {
            onPetItemClickHandler(_arg_1);
        }

        public function __tabBtn9_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(9);
        }

        public function set getContiBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1510655195getContiBtn;
            if (_local_2 !== _arg_1)
            {
                this._1510655195getContiBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getContiBtn", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn23_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn23 = _local_1;
            _local_1.sortable = true;
            _local_1.sortCompareFunction = sortConsumeAwardList;
            _local_1.dataField = "key";
            _local_1.width = 160;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn23", _GameIntroPanel_DataGridColumn23);
            return (_local_1);
        }

        public function set consumeActDate0(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._839070484consumeActDate0;
            if (_local_2 !== _arg_1)
            {
                this._839070484consumeActDate0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate0", _local_2, _arg_1));
            };
        }

        public function set consumeActDate4(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._839070480consumeActDate4;
            if (_local_2 !== _arg_1)
            {
                this._839070480consumeActDate4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate4", _local_2, _arg_1));
            };
        }

        public function set consumeActDate1(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._839070483consumeActDate1;
            if (_local_2 !== _arg_1)
            {
                this._839070483consumeActDate1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate1", _local_2, _arg_1));
            };
        }

        public function set consumeActDate3(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._839070481consumeActDate3;
            if (_local_2 !== _arg_1)
            {
                this._839070481consumeActDate3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate3", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn34_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn34 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory13_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn34", _GameIntroPanel_DataGridColumn34);
            return (_local_1);
        }

        public function set consumeActDate5(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._839070479consumeActDate5;
            if (_local_2 !== _arg_1)
            {
                this._839070479consumeActDate5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate5", _local_2, _arg_1));
            };
        }

        public function set i8(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3311i8;
            if (_local_2 !== _arg_1)
            {
                this._3311i8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i8", _local_2, _arg_1));
            };
        }

        public function set consumeActDate2(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._839070482consumeActDate2;
            if (_local_2 !== _arg_1)
            {
                this._839070482consumeActDate2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate2", _local_2, _arg_1));
            };
        }

        public function ___GameIntroPanel_LinkButton2_click(_arg_1:MouseEvent):void
        {
            linkbutton_clickHandler(1);
        }

        public function set DG_diary(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._344383225DG_diary;
            if (_local_2 !== _arg_1)
            {
                this._344383225DG_diary = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "DG_diary", _local_2, _arg_1));
            };
        }

        public function set actBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1162960632actBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1162960632actBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actBtn2", _local_2, _arg_1));
            };
        }

        private function changeBossArr(_arg_1:ItemClickEvent):void
        {
            if (_arg_1.index == 0)
            {
                DG_boss.dataProvider = groundBossList;
            }
            else
            {
                DG_boss.dataProvider = airBossList;
            };
        }

        public function set actBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1162960631actBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1162960631actBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actBtn3", _local_2, _arg_1));
            };
        }

        public function set actBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1162960634actBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1162960634actBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actBtn0", _local_2, _arg_1));
            };
        }

        public function set actBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1162960630actBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1162960630actBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actBtn4", _local_2, _arg_1));
            };
        }

        public function set actBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1162960633actBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1162960633actBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "actBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get contiSlot():ItemSlot
        {
            return (this._404225515contiSlot);
        }

        [Bindable(event="propertyChange")]
        public function get getStageConsumeAwardBtn0():BasicDelayButton
        {
            return (this._1083063779getStageConsumeAwardBtn0);
        }

        public function set i7(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._3310i7;
            if (_local_2 !== _arg_1)
            {
                this._3310i7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "i7", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn10_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn10 = _local_1;
            _local_1.width = 70;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn10", _GameIntroPanel_DataGridColumn10);
            return (_local_1);
        }

        private function set airBossList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._634901781airBossList;
            if (_local_2 !== _arg_1)
            {
                this._634901781airBossList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "airBossList", _local_2, _arg_1));
            };
        }

        private function getFestGift():void
        {
            _core.remote.call("takeFeastGift", new Responder(onGetFestGift));
        }

        public function __actBtn4_click(_arg_1:MouseEvent):void
        {
            getActAward(_arg_1);
        }

        private function onPetItemClickHandler(_arg_1:ListEvent):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_18:Object;
            var _local_19:*;
            var _local_20:*;
            if (_selectedURL.url != _arg_1.itemRenderer.data.URL)
            {
                _selectedURL.url = _arg_1.itemRenderer.data.URL;
            };
            _selectedDesc.text = _arg_1.itemRenderer.data.Description;
            selectedID = _arg_1.itemRenderer.data.ID;
            seletedItem = _arg_1.itemRenderer.data;
            selectedName = _arg_1.itemRenderer.data.text;
            if (_arg_1.itemRenderer.data.ID == "-1")
            {
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_CREATURE][_arg_1.itemRenderer.data.cid];
            var _local_5:int = Math.round((_local_2.aptStrength * 0.8));
            var _local_6:int = Math.round((_local_2.aptStrength * 1.2));
            if (_local_5 >= 1000)
            {
                _local_3 = _local_5.toString();
            }
            else
            {
                _local_3 = (_local_5.toString() + " ");
            };
            if (_local_6 >= 1000)
            {
                _local_4 = _local_6.toString();
            }
            else
            {
                _local_4 = (_local_6.toString() + " ");
            };
            ti_ll.text = Language.GAMEINTROPANEL_U[23].toString().replace("{min}", _local_3).replace("{max}", _local_4);
            var _local_7:int = Math.round((_local_2.aptAgility * 0.8));
            var _local_8:int = Math.round((_local_2.aptAgility * 1.2));
            if (_local_7 >= 1000)
            {
                _local_3 = _local_7.toString();
            }
            else
            {
                _local_3 = (_local_7.toString() + " ");
            };
            if (_local_8 >= 1000)
            {
                _local_4 = _local_8.toString();
            }
            else
            {
                _local_4 = (_local_8.toString() + " ");
            };
            ti_mj.text = Language.GAMEINTROPANEL_U[23].toString().replace("{min}", _local_3).replace("{max}", _local_4);
            var _local_9:int = Math.round((_local_2.aptStamina * 0.8));
            var _local_10:int = Math.round((_local_2.aptStamina * 1.2));
            if (_local_9 >= 1000)
            {
                _local_3 = _local_9.toString();
            }
            else
            {
                _local_3 = (_local_9.toString() + " ");
            };
            if (_local_10 >= 1000)
            {
                _local_4 = _local_10.toString();
            }
            else
            {
                _local_4 = (_local_10.toString() + " ");
            };
            ti_tz.text = Language.GAMEINTROPANEL_U[23].toString().replace("{min}", _local_3).replace("{max}", _local_4);
            var _local_11:int = Math.round((_local_2.aptIntelligence * 0.8));
            var _local_12:int = Math.round((_local_2.aptIntelligence * 1.2));
            if (_local_11 >= 1000)
            {
                _local_3 = _local_11.toString();
            }
            else
            {
                _local_3 = (_local_11.toString() + " ");
            };
            if (_local_12 >= 1000)
            {
                _local_4 = _local_12.toString();
            }
            else
            {
                _local_4 = (_local_12.toString() + " ");
            };
            ti_zl.text = Language.GAMEINTROPANEL_U[23].toString().replace("{min}", _local_3).replace("{max}", _local_4);
            var _local_13:int = Math.round((_local_2.aptEnergy * 0.8));
            var _local_14:int = Math.round((_local_2.aptEnergy * 1.2));
            if (_local_13 >= 1000)
            {
                _local_3 = _local_13.toString();
            }
            else
            {
                _local_3 = (_local_13.toString() + " ");
            };
            if (_local_14 >= 1000)
            {
                _local_4 = _local_14.toString();
            }
            else
            {
                _local_4 = (_local_14.toString() + " ");
            };
            ti_js.text = Language.GAMEINTROPANEL_U[23].toString().replace("{min}", _local_3).replace("{max}", _local_4);
            classImg.source = ResManager.CREATURE_CLASS[_local_2.classId];
            classImg.toolTip = (GamePredef.CREATURE_QLEVEL[_local_2.qLevel] + GamePredef.CREATURE_CLASS_INFO[_local_2.classId]);
            elementImg.source = ResManager.ELEMENT_KIND[_local_2.element];
            elementImg.toolTip = GamePredef.ELEMENT_INFO[_local_2.element];
            petLevel.text = Language.TIPCRE_S[11].toString().replace("{vo.useLv}", _local_2.useLv);
            if (_core.player.level >= _local_2.useLv)
            {
                petLevel.setStyle("color", PET_CAN_USE_COLOR);
            }
            else
            {
                petLevel.setStyle("color", PET_CAN_NOT_USE_COLOR);
            };
            propertyPentagon.setName = ["　", "　", "　", "　", "　"];
            propertyPentagon.showProperty(10000, [Math.round((_local_2.aptStrength * 0.8)), Math.round((_local_2.aptAgility * 0.8)), Math.round((_local_2.aptStamina * 0.8)), Math.round((_local_2.aptIntelligence * 0.8)), Math.round((_local_2.aptEnergy * 0.8))], [Math.round((_local_2.aptStrength * 1.2)), Math.round((_local_2.aptAgility * 1.2)), Math.round((_local_2.aptStamina * 1.2)), Math.round((_local_2.aptIntelligence * 1.2)), Math.round((_local_2.aptEnergy * 1.2))]);
            var _local_15:Object = _core.data.gameDataIndex[GamePredef.TBL_CREATURE_SKILL][_arg_1.itemRenderer.data.cid];
            var _local_16:int = 1;
            var _local_17:int = 1;
            while (_local_17 < 5)
            {
                this[("skillSlot" + _local_17)].clean();
                _local_17++;
            };
            for each (_local_18 in _local_15)
            {
                this[("skillSlot" + _local_16)].giid = _local_18.sid;
                this[("skillSlot" + _local_16)].type = GamePredef.TBL_SKILL;
                if (_core.data.hasData(GamePredef.TBL_SKILL, _local_18.sid))
                {
                    _local_20 = _core.data.getGameData(GamePredef.TBL_SKILL, _local_18.id);
                    this[("skillSlot" + _local_16)].slotData = _local_20;
                };
                _local_16++;
            };
            for (_local_19 in spec_skill)
            {
                if (ToolKit.isEqual(_arg_1.itemRenderer.data.cid, _local_19))
                {
                    this[("skillSlot" + _local_16)].giid = Number(spec_skill[_local_19]);
                    this[("skillSlot" + _local_16)].type = GamePredef.TBL_SKILL;
                    if (_core.data.hasData(GamePredef.TBL_SKILL, Number(spec_skill[_local_19])))
                    {
                        _local_20 = _core.data.getGameData(GamePredef.TBL_SKILL, Number(spec_skill[_local_19]));
                        this[("skillSlot" + _local_16)].slotData = _local_20;
                    };
                    _local_16++;
                };
            };
        }

        private function _GameIntroPanel_DataGridColumn21_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn21 = _local_1;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory6_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn21", _GameIntroPanel_DataGridColumn21);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get DG_active():DataGrid
        {
            return (this._2118150722DG_active);
        }

        private function setAwardSlotColr():void
        {
            var _local_1:int;
            var _local_2:ItemSlot;
            _local_1 = 0;
            while (_local_1 <= 4)
            {
                _local_2 = this[("actAward" + _local_1)];
                if (_local_2)
                {
                    _local_2.setStyleName(_local_1);
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get sysInfoCanvas():Canvas
        {
            return (this._732738989sysInfoCanvas);
        }

        public function __getConsumeAwardBtn3_click(_arg_1:MouseEvent):void
        {
            getStageConsumeAward(3);
        }

        public function canGetDiaryAward():Boolean
        {
            if ((((totalAct) && (totalAct.text)) && (Number(totalAct.text) >= 30)))
            {
                if (!_haveDiaryAwarded)
                {
                    return (true);
                };
            };
            return (false);
        }

        private function getActAward(event:Event):void
        {
            var func:Function;
            var btn:Object = event.currentTarget;
            var id:Number = Number(String(btn.id).substr(-1));
            func = function (_arg_1:Object):void
            {
                if (_arg_1)
                {
                    _haveDiaryAwarded = _arg_1.f;
                };
            };
            _core.remote.call("getDailyActAward", new Responder(func), id);
        }

        private function _GameIntroPanel_DataGridColumn32_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn32 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory12_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn32", _GameIntroPanel_DataGridColumn32);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get _haveDiaryAwarded():Boolean
        {
            return (this._534379936_haveDiaryAwarded);
        }

        public function __List_fl_creationComplete(_arg_1:FlexEvent):void
        {
            List_fl.selectedIndex = 0;
        }

        public function set vb_eqt(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._823291595vb_eqt;
            if (_local_2 !== _arg_1)
            {
                this._823291595vb_eqt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb_eqt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get propertyPentagon():PentagonCanvas
        {
            return (this._805962357propertyPentagon);
        }

        private function _GameIntroPanel_XML2_i():XML
        {
            var _local_1:XML;
            _local_1 = <PetList><Pet Name="Kỳ Kỳ" ID="3624" CID="1270" Description="Kỳ Kỳ là một tinh linh của tộc người Naga truyền thuyết, nắm giữ sức mạnh hắc ám vô biên của vùng biển cổ xưa và chỉ có Kỳ Kỳ mới có khả năng thi triển năng lực huyền bí của tộc Naga"></Pet><Pet Name="Camy" ID="3254" CID="1088" Description="Camy là truyền nhân của dòng tộc ác ma. Nhờ vào những ca khúc 《Linh Hồn Khúc》 ai oán, thần bí mà có thể trói buộc được linh hồn của đối phương, làm kẻ thù mất đi khả năng tự hồi phục và trị liệu. Đây cũng là kỹ năng làm cho người khác khiếp sợ trong hệ Ác Ma."></Pet><Pet Name="Linh Long" ID="3615" CID="902" Description="Linh Long, một cô gái năng động của dòng dõi nhà Rồng, rất thích được cùng em gái ra tay nghĩa hiệp, trừ gian diệt bạo. Linh Long không những có thể làm kẻ địch phải khốn đốn mà còn có cách tự bảo vệ bản thân mình."></Pet><Pet Name="Tiểu Linh Long" ID="3616" CID="921" Description="Cô em gái, Tiểu Linh Long, rất giống chị mình, thừa hưởng sức mạnh thần kỳ, có khả năng chống sát thương thấp nhất."></Pet><Pet Name="Pony" ID="3402" CID="1177" Description="Pony là một truyền nhân nhí dễ thương của gia tộc Ngựa Một Sừng, luôn mong muốn đem lại hòa bình cho thế giới. Sở hữu ma pháp trị liệu thần thánh của gia tộc và rất ghét chiến tranh."></Pet><Pet Name="Loni" ID="3312" CID="1151" Description="Loni vốn là con gái của Đông Hải Long Vương, thông minh đáng yêu, hiền lành, tốt bụng, và đặc biệt luôn hiếu kỳ với cuộc sống của nhân gian. Sở hữu kỹ năng ma pháp bí chú lợi hại, nhưng do tuổi còn quá nhỏ, công lực bí chú chưa được phát huy ổn định."></Pet><Pet Name="Nấm Điện" ID="2815" CID="953" Description="Nấm Điện xuất thân từ vương quốc nấm xa xôi, nghe nói bọn yêu ma từng dụ dỗ Nấm Điện chống lại các gia tộc, nhưng Nấm Điện chính nghĩa đã không nghe theo. Nấm Điện có đòn tấn công sát thương quy mô lớn, là pet thích hợp dùng để luyện cấp 50 - 80."></Pet><Pet Name="Thỏ Baby" ID="2789" CID="903" Description="Tuy có vẻ ngoài vô cùng đáng yêu nhưng sức chiến đấu của pet này thật sự rất đáng nể. Với bản chất thông minh, kế thừa và phát huy được các ưu thế của pet hệ người, ngoài ra còn sở hữu 2 kỹ năng tấn công ma pháp liên tục và ngăn chặn sát thương, Thỏ Baby thực sự là một đối thủ đáng gờm trên chiến trường."></Pet><Pet Name="Nhím Xanh" ID="2516" CID="876" Description="Nhím Xanh là tinh linh cao cấp, tuy vẻ ngoài đáng yêu và có chút yếu ớt nhưng bên trong lại có sức mạnh kinh hồn mà bản thân chưa biết. Có thể học được tất cả kỹ năng hệ thực vật. Hai kỹ năng đặc biệt nhất là Tiêu Nhược và Phản Xạ. Khi lâm vào hoàn cảnh sinh tử, Nhím Xanh sẽ phát huy tối đa sức mạnh của mình."></Pet><Pet Name="Momo" ID="2262" CID="776" Description="Là người thừa kế duy nhất của hoàng tộc vương quốc máy móc, vẻ mặt đáng yêu thánh thiện, Momo sở hữu những kỹ năng sử dụng năng lượng sóng điện như Mê Tâm hay Khóa Mục Tiêu, khiến đối thương trúng sát thương trong chớp mắt. Ngoài ra các kỹ năng hệ máy như Da Kháng Tính, Tự Hồi Phục cũng khiến Momo trở thành một pet đáng yêu nhưng không kém phần nguy hiểm."></Pet><Pet Name="Kim Hổ" ID="2128" CID="735" Description="Chúa sơn lâm đã xuất hiện! Đừng nhìn vẻ bề ngoài đáng yêu của pet mà xem thường nhé. Các kỹ năng hấp thu HP của Kim Hổ tạo sát thương cực mạnh, khiến cho pet này có năng lực chiến đấu mạnh mẽ trên chiến trường và sức chịu đựng bền bỉ."></Pet><Pet Name="Dứa Mật" ID="1532" CID="488" Description="Không nên xem thường quả dứa bé nhỏ này, chất độc trên người nó khiến cho loài rồng cũng phải kiêng dè. Các kỹ năng độc và hồi HP của pet này đều rất đáng nể."></Pet><Pet Name="Hoàng Tử Thiên Sứ" ID="2084" CID="721" Description="Hoàng Tử Thiên Sứ là niềm tự hào của Tộc Thiên Sứ, có khả năng dẫn dắt sức mạnh thần thánh, bảo vệ và tăng sức chiến đấu cho bản thân và đồng đội."></Pet><Pet Name="Công Chúa Ác Ma" ID="2085" CID="722" Description="Đừng để vẻ đẹp của Công Chúa Ác Ma đánh lừa bạn, khả năng phá hoại của cô ấy khiến cho Ma Vương cũng phải ngán ngẩm, bản lĩnh dẫn dắt sức mạnh ma giới sẽ tạo sát thương cực mạnh cho kẻ địch."></Pet><Pet Name="Thần Long Viễn Cổ" ID="1529" CID="487" Description="Long tộc là chủng tộc pet cao quý trên Vô Ưu Đại Lục, khả năng miễn 70% sát thương khiến cho kẻ địch phải chùn bước. Nếu có thêm các kỹ năng hỗ trợ, pet rồng sẽ khiến cho kẻ nào dám đương đầu đều sẽ hối hận!"></Pet><Pet Name="Thiên Sứ Mít Ướt" ID="1326" CID="19" Description="Thiên Sứ Mít Ướt là hóa thân của thần Tình Yêu, vì thế có nhiều kỹ năng rất kỳ diệu. Nếu sở hữu Hào Quang Ái Thần, pet sẽ có khả năng trị liệu cho nhiều người, nếu có kỹ năng Mũi Tên Cupid, pet sẽ khiến cho nhiều địch thủ rơi vào trạng thái hỗn loạn, đặc biệt là kỹ năng Lời Ngọt Ngào có thể cùng lúc gây sát thương cho 10 mục tiêu, là kỹ năng cực kỳ lợi hại khi luyện cấp."></Pet><Pet Name="Ác Ma Quấy Phá" ID="1326" CID="20" Description="Ác Ma Quấy Phá có năng lực phá hoại cực mạnh. Nếu sở hữu Ác Ma Chi Kích, pet sẽ có năng lực sát thương cực mạnh, nếu có Tình Yêu Ngụy Kế, pet sẽ tạo sát thương cho số đông, đặc biệt là kỹ năng Lời Ngọt Ngào có thể cùng lúc gây sát thương cho 10 mục tiêu, là kỹ năng cực kỳ lợi hại khi luyện cấp."></Pet><Pet Name="Kim Ngưu" ID="1178" CID="367" Description="Thực lực của Kim Ngưu là quá rõ ràng, các điểm tư chất cao, sức tấn công mạnh và lượng HP dồi dào, cộng thêm vẻ ngoài đáng sợ đã khiến Kim Ngưu trở thành 1 trong những pet đáng gờm trên Vô Ưu Đại Lục. Một pet Kim Ngưu có kỹ năng Dã Thú Cuồng Vũ chính là mục tiêu mà nhiều người muốn đạt đến."></Pet><Pet Name="Đinh Long" ID="1877" CID="486" Description="Long tộc là chủng tộc pet cao quý trên Vô Ưu Đại Lục, khả năng miễn 70% sát thương khiến cho kẻ địch phải chùn bước. Nếu có thêm các kỹ năng hỗ trợ, pet rồng sẽ khiến cho kẻ nào dám đương đầu đều sẽ hối hận!"></Pet><Pet Name="Y Tá MM" ID="2019" CID="71" Description="Y Tá MM là một y tá đẳng cấp của gia tộc Đông Huyền, vừa tận tâm, vừa ôn hòa, dễ mến. Bằng tài năng và sự chân thành, có Y Tá MM bên cạnh, mọi vết thương trên người đều sẽ được trị khỏi. Tuy nhiên trong những cuộc chiến sinh tử, Y Tá MM luôn có năng lực sinh tồn hơn bất kỳ ai cả.Đây là đặc điểm khiến cho đối thủ phải e dè."></Pet><Pet Name="Tinh Linh Hộ Thú" ID="1398" CID="447" Description="Tinh Linh Hộ Thú tuy không sở hữu sức tấn công mạnh mẽ, cũng không có ma pháp huyền diệu, nhưng độ trung thành của pet này là không thể xem thường. Khả năng liều mình ngăn chặn tấn công vật lý cho chủ nhân và đồng đội chắc chắn sẽ khiến bạn yên tâm trên bước đường chiến đấu."></Pet><Pet Name="Hổ Bì Dương" ID="1310" CID="91" Description="Chú dê con bé nhỏ này rất thích hợp cho những người chơi mới do có sức tấn công mạnh, tốc độ nhanh, bạo kích cao, lại có thuộc tính ám hỗ trợ, điểm yếu là lượng HP tương đối thấp và dễ bị pet thuộc tính quang khắc chế."></Pet><Pet Name="Chim Ưng" ID="3574" CID="91" Description="Loài chim có sức mạnh phi thường, khi săn mồi có tốc độ nhanh như chớp làm đối phương không kịp né tránh~"></Pet><Pet Name="Hắc Nhân Mã" ID="4190" CID="1672" Description="Thần thú trong truyền thuyết, là đứa con tụ hợp sức mạnh của đất trời"></Pet><Pet Name="Đại Thánh Chí Tôn" ID="5937" CID="2145" Description="Tề Thiên Đại Thánh, nhất thế chí tôn, đi nam về bắc, lên trời xuống đất, thần kỳ bách biến."></Pet><Pet Name="Moltres" ID="6132" CID="2221" Description="Chim phượng hoàng sinh là từ ngọn lửa bất tử phương nam. Mỗi lần chết đi, quanh thân sẽ xuất hiện vòng lửa, sau đó tiếp tiếp tục từ lửa mà tái sinh, đồng thời sức mạnh càng tăng gấp bội phần"></Pet><Pet Name="Võ Sĩ Shiba" ID="6297" CID="2246" Description="Vì tấm lòng yêu thương nhân loại, Shiba được xem là sứ giả hòa bình may mắn"></Pet></PetList>
            ;
            xmlPet = _local_1;
            return (_local_1);
        }

        private function clickNotice(_arg_1:uint):void
        {
            var _local_2:URLLoader;
            var _local_3:String;
            var _local_4:Date;
            noticeBtn0.selected = false;
            noticeBtn1.selected = false;
            this[("noticeBtn" + _arg_1)].selected = true;
            if (noticeDataArr[_arg_1])
            {
                systemInfo.htmlText = noticeDataArr[_arg_1];
                systemInfo.verticalScrollPosition = 0;
            }
            else
            {
                _local_2 = new URLLoader();
                _local_2.addEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
                _local_2.addEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
                _local_2.addEventListener(Event.COMPLETE, loadCompleteHandler);
                if (_arg_1 == 0)
                {
                    _local_3 = GamePredef.PATH_INFO;
                }
                else
                {
                    _local_4 = new Date();
                    _local_3 = ((GamePredef.PATH_ACTIVITY_NOTICE + "?v=") + _local_4.getTime());
                };
                _local_2.load(new URLRequest(_local_3));
                this[("noticeLoader" + _arg_1)] = _local_2;
            };
        }

        private function _GameIntroPanel_DataGridColumn9_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn9 = _local_1;
            _local_1.width = 120;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn9", _GameIntroPanel_DataGridColumn9);
            return (_local_1);
        }

        public function set ti_zl(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._110351676ti_zl;
            if (_local_2 !== _arg_1)
            {
                this._110351676ti_zl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti_zl", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_ClassFactory9_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function loadProgressHandler(_arg_1:ProgressEvent):void
        {
            systemInfo.text = (((Language.LOGINCANVAS_S[2] + _arg_1.bytesLoaded) + "/") + _arg_1.bytesTotal);
        }

        private function initVBox(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:ActivityDetail;
            switch (_arg_1)
            {
                case 2:
                    if (!activeVbInitFlag)
                    {
                        _local_2 = 0;
                        while (_local_2 < levelUpActiveList.length)
                        {
                            _local_3 = new ActivityDetail();
                            _local_3.prop = levelUpActiveList.getItemAt(_local_2);
                            vb_levelUp.addChild(_local_3);
                            _local_2++;
                        };
                        activeVbInitFlag = true;
                    };
                    return;
                case 3:
                    if (!earnMoneyVbInitFlag)
                    {
                        _local_2 = 0;
                        while (_local_2 < earnMoneyActiveList.length)
                        {
                            _local_3 = new ActivityDetail();
                            _local_3.prop = earnMoneyActiveList.getItemAt(_local_2);
                            vb_earnMoney.addChild(_local_3);
                            _local_2++;
                        };
                        earnMoneyVbInitFlag = true;
                    };
                    return;
                case 4:
                    if (!eqtVbInitFlag)
                    {
                        _local_2 = 0;
                        while (_local_2 < equiptActiveList.length)
                        {
                            _local_3 = new ActivityDetail();
                            _local_3.prop = equiptActiveList.getItemAt(_local_2);
                            vb_eqt.addChild(_local_3);
                            _local_2++;
                        };
                        eqtVbInitFlag = true;
                    };
                    return;
                case 5:
                    if (!sportVbInitFlag)
                    {
                        _local_2 = 0;
                        while (_local_2 < sportActiveList.length)
                        {
                            _local_3 = new ActivityDetail();
                            _local_3.prop = sportActiveList.getItemAt(_local_2);
                            vb_sport.addChild(_local_3);
                            _local_2++;
                        };
                        sportVbInitFlag = true;
                    };
                    return;
                case 9:
                    if (!flag["diary"])
                    {
                        clearDiaryProgress();
                        _core.remote.call("getCharDiaryData", new Responder(onGetDiaryData));
                        flag["diary"] = true;
                    };
                    return;
            };
        }

        public function ___GameIntroPanel_Canvas29_show(_arg_1:FlexEvent):void
        {
            initStageConsumeAward();
        }

        public function initStageConsumeAward():*
        {
            _core.remote.getStageConsumeAwardList();
        }

        private function pointAwardBinded(_arg_1:Object, _arg_2:DataGridColumn):String
        {
            return (((_arg_1.binded == undefined) || (_arg_1.binded == 1)) ? Language.ACTIVEPANEL_S[56] : Language.ACTIVEPANEL_S[57]);
        }

        public function flTabBtnClick(_arg_1:int):void
        {
            List_fl.selectedIndex = _arg_1;
            vs_fl.selectedIndex = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        [Bindable(event="propertyChange")]
        private function get enableActiveList():ArrayCollection
        {
            return (this._1809115815enableActiveList);
        }

        [Bindable(event="propertyChange")]
        public function get getAwardsByCode():BasicDelayButton
        {
            return (this._425076048getAwardsByCode);
        }

        private function onGetContiDay(_arg_1:Array):void
        {
            var _local_2:int;
            var _local_3:Object;
            continueDay = _arg_1[0];
            if (_arg_1[0] >= 408)
            {
                nextConti = (30 - ((_arg_1[0] - 408) % 30));
            }
            else
            {
                _local_2 = 0;
                while (_local_2 < CONTI_GIFT_DAY.length)
                {
                    if (CONTI_GIFT_DAY[_local_2] > _arg_1[0])
                    {
                        nextConti = (CONTI_GIFT_DAY[_local_2] - _arg_1[0]);
                        break;
                    };
                    _local_2++;
                };
            };
            if (_arg_1[1] > 0)
            {
                _local_3 = GameData.d[GamePredef.TBL_PLAN][_arg_1[1]];
                contiSlot.type = _local_3.ti;
                contiSlot.giid = _local_3.ii;
                contiSlot.stackNum = _local_3.n;
                getContiBtn.enabled = true;
            };
        }

        public function set vs_stageConsume(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._536153440vs_stageConsume;
            if (_local_2 !== _arg_1)
            {
                this._536153440vs_stageConsume = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs_stageConsume", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selectA():RoundedButton
        {
            return (this._1978100421selectA);
        }

        [Bindable(event="propertyChange")]
        public function get selectB():RoundedButton
        {
            return (this._1978100422selectB);
        }

        private function set consumeAcMsg(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._885700253consumeAcMsg;
            if (_local_2 !== _arg_1)
            {
                this._885700253consumeAcMsg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg", _local_2, _arg_1));
            };
        }

        public function __tabBtn10_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(10);
        }

        private function onGetDiaryData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Boolean;
            var _local_4:String;
            if (_arg_1)
            {
                _local_2 = _core.data.gameData[GamePredef.TBL_DIARY];
                _local_3 = false;
                for (_local_4 in _arg_1)
                {
                    if (((_arg_1[_local_4]) && (_local_2.hasOwnProperty(_local_4))))
                    {
                        _local_2[_local_4]._num = _arg_1[_local_4];
                        if (_local_2[_local_4].max > 0)
                        {
                            _local_2[_local_4]._numStr = ((_local_2[_local_4]._num + "/") + _local_2[_local_4].max);
                        }
                        else
                        {
                            _local_2[_local_4]._numStr = ((_local_2[_local_4]._num + "/") + Language.GAMEINTROPANEL_U[41]);
                        };
                        if (_local_2[_local_4]._num == _local_2[_local_4].max)
                        {
                            _local_2[_local_4]._st = 1;
                            _local_3 = true;
                        };
                    };
                };
                if (_local_3)
                {
                    diaryList.sort = _sortForDiary;
                    diaryList.refresh();
                };
                DG_diary.dataProvider = diaryList;
                if (((_arg_1.act) && (_arg_1.act > 0)))
                {
                    totalAct.text = String(_arg_1.act);
                };
                _haveDiaryAwarded = Boolean(_arg_1.ad);
            };
        }

        [Bindable(event="propertyChange")]
        public function get selectACar():RoundedButton
        {
            return (this._1656558897selectACar);
        }

        private function _GameIntroPanel_DataGridColumn30_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn30 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory11_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn30", _GameIntroPanel_DataGridColumn30);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get getGiftBtn():BasicGlowButton
        {
            return (this._1064241878getGiftBtn);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn10():BasicGlowButton
        {
            return (this._933747994tabBtn10);
        }

        private function onGetFestGift(_arg_1:Object):void
        {
            if (_arg_1)
            {
                festSlot.giid = 0;
                getFestBtn.enabled = false;
            };
            changeMiniMapMsgBtnStyle();
        }

        private function set continueDay(_arg_1:int):void
        {
            var _local_2:Object;
            _local_2 = this._1132705419continueDay;
            if (_local_2 !== _arg_1)
            {
                this._1132705419continueDay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "continueDay", _local_2, _arg_1));
            };
        }

        private function set activityDescription(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._975828627activityDescription;
            if (_local_2 !== _arg_1)
            {
                this._975828627activityDescription = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activityDescription", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        private function dateFormatter2(_arg_1:Number):String
        {
            if (!_arg_1)
            {
                return ("");
            };
            var _local_2:Date = new Date((_arg_1 * 1000));
            return ((((((((((_local_2.getFullYear() + "-") + (_local_2.getMonth() + 1)) + "-") + _local_2.getDate()) + " ") + _local_2.getHours()) + ":") + _local_2.getMinutes()) + ":") + _local_2.getSeconds());
        }

        public function onGiftRemain():void
        {
            i8.addChild(_itemIcon);
        }

        public function __noticeBtn1_click(_arg_1:MouseEvent):void
        {
            clickNotice(1);
        }

        [Bindable(event="propertyChange")]
        public function get img_active():Image
        {
            return (this._1803236098img_active);
        }

        public function set Btn_AllFest(_arg_1:LinkButton):void
        {
            var _local_2:Object;
            _local_2 = this._2096601730Btn_AllFest;
            if (_local_2 !== _arg_1)
            {
                this._2096601730Btn_AllFest = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Btn_AllFest", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn7_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn7 = _local_1;
            _local_1.width = 65;
            _local_1.dataField = "level";
            _local_1.sortCompareFunction = levelSortCompareFunction2;
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn7", _GameIntroPanel_DataGridColumn7);
            return (_local_1);
        }

        public function set festSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._223647102festSlot;
            if (_local_2 !== _arg_1)
            {
                this._223647102festSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "festSlot", _local_2, _arg_1));
            };
        }

        public function set vs_fl(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._112496008vs_fl;
            if (_local_2 !== _arg_1)
            {
                this._112496008vs_fl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs_fl", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_ClassFactory7_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = GameIntroPanel_inlineComponent5;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get _selectedURL():CharactorShowCanvas
        {
            return (this._401544427_selectedURL);
        }

        public function set xmlPet(_arg_1:XML):void
        {
            var _local_2:Object;
            _local_2 = this._755507832xmlPet;
            if (_local_2 !== _arg_1)
            {
                this._755507832xmlPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xmlPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cashDG():DataGrid
        {
            return (this._1367571722cashDG);
        }

        private function onGetFlagAward(_arg_1:Object):void
        {
            if (((!(_arg_1)) || (_arg_1 <= 0)))
            {
                getGiftBtn.enabled = false;
                return;
            };
            var _local_2:Object = GameData.d[GamePredef.TBL_PLAN][_arg_1];
            if (_local_2)
            {
                dailySlot.type = _local_2.ti;
                dailySlot.giid = _local_2.ii;
                dailySlot.stackNum = _local_2.n;
                getGiftBtn.enabled = true;
            };
        }

        public function __StageConsumeBtn2_click(_arg_1:MouseEvent):void
        {
            showStagePlatform(2);
        }

        [Bindable(event="propertyChange")]
        public function get classImg():Image
        {
            return (this._692413227classImg);
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg0():String
        {
            return (this._1686904019consumeAcMsg0);
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg1():String
        {
            return (this._1686904018consumeAcMsg1);
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg2():String
        {
            return (this._1686904017consumeAcMsg2);
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg4():String
        {
            return (this._1686904015consumeAcMsg4);
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg5():String
        {
            return (this._1686904014consumeAcMsg5);
        }

        public function iniGift():void
        {
            _core.remote.call("serchForGift", new Responder(onSerchForGift));
            getGameGift();
        }

        public function __tabBtn7_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(7);
        }

        [Bindable(event="propertyChange")]
        private function get consumeAcMsg3():String
        {
            return (this._1686904016consumeAcMsg3);
        }

        [Bindable(event="propertyChange")]
        public function get rgBoss():RadioButtonGroup
        {
            return (this._934044862rgBoss);
        }

        [Bindable(event="propertyChange")]
        public function get getAwardsFromNet():BasicDelayButton
        {
            return (this._1197257913getAwardsFromNet);
        }

        public function set petLevel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object;
            _local_2 = this._464115109petLevel;
            if (_local_2 !== _arg_1)
            {
                this._464115109petLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petLevel", _local_2, _arg_1));
            };
        }

        public function set petDataList(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._579057063petDataList;
            if (_local_2 !== _arg_1)
            {
                this._579057063petDataList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petDataList", _local_2, _arg_1));
            };
        }

        public function set DG_boss(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._1950825047DG_boss;
            if (_local_2 !== _arg_1)
            {
                this._1950825047DG_boss = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "DG_boss", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ti_js():TextInput
        {
            return (this._110351187ti_js);
        }

        public function set _selectedDesc(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._436537771_selectedDesc;
            if (_local_2 !== _arg_1)
            {
                this._436537771_selectedDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selectedDesc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get sportActiveList():ArrayCollection
        {
            return (this._1858597720sportActiveList);
        }

        [Bindable(event="propertyChange")]
        public function get toCar():RoundedButton
        {
            return (this._110502745toCar);
        }

        public function ___GameIntroPanel_BasicGlowButton12_click(_arg_1:MouseEvent):void
        {
            _core.deal();
        }

        public function set StageConsumeBtn0(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1632084558StageConsumeBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1632084558StageConsumeBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "StageConsumeBtn0", _local_2, _arg_1));
            };
        }

        public function set StageConsumeBtn1(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1632084557StageConsumeBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1632084557StageConsumeBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "StageConsumeBtn1", _local_2, _arg_1));
            };
        }

        public function set StageConsumeBtn2(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1632084556StageConsumeBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1632084556StageConsumeBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "StageConsumeBtn2", _local_2, _arg_1));
            };
        }

        public function set StageConsumeBtn4(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1632084554StageConsumeBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1632084554StageConsumeBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "StageConsumeBtn4", _local_2, _arg_1));
            };
        }

        public function makeGiftCount(_arg_1:Object):void
        {
            var _local_2:*;
            if (obj)
            {
                for (_local_2 in _arg_1)
                {
                    delete obj[_local_2];
                    if (giftCount <= 0)
                    {
                        giftCount = 0;
                    }
                    else
                    {
                        giftCount = (giftCount - 1);
                    };
                };
            };
            if (giftCount > 0)
            {
                _core.sysMidMsg(Language.AWARDCODEPANEL_S[3].toString().replace("{num}", giftCount));
            }
            else
            {
                _core.sysMidMsg(Language.AWARDCODEPANEL_S[2]);
                i7.removeAllChildren();
            };
        }

        public function set StageConsumeBtn5(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1632084553StageConsumeBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1632084553StageConsumeBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "StageConsumeBtn5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get fbList():ArrayCollection
        {
            return (this._1281920134fbList);
        }

        [Bindable(event="propertyChange")]
        public function get systemInfo():LinkTextArea
        {
            return (this._642554749systemInfo);
        }

        public function set StageConsumeBtn3(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1632084555StageConsumeBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1632084555StageConsumeBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "StageConsumeBtn3", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn5 = _local_1;
            _local_1.width = 40;
            _local_1.dataField = "Level";
            _local_1.sortCompareFunction = levelSortCompareFunction;
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn5", _GameIntroPanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get ti_ll():TextInput
        {
            return (this._110351242ti_ll);
        }

        private function _GameIntroPanel_ClassFactory14_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function _GameIntroPanel_ClassFactory5_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = GameIntroPanel_inlineComponent4;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        override public function initialize():void
        {
            var target:GameIntroPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GameIntroPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GameIntroPanelWatcherSetupUtil");
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

        public function moveGiftToBag():void
        {
            if (giftCount == 0)
            {
                return;
            };
            if (obj)
            {
                _core.remote.call("getGameGift", null, obj);
            };
        }

        private function setOnlineActiveTimerText():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:String;
            _local_1 = Math.floor((dailyActOnlineObj.time / 60));
            _local_1 = ((_local_1) ? _local_1 : 0);
            _local_2 = (dailyActOnlineObj.time - (_local_1 * 60));
            _local_2 = ((_local_2) ? _local_2 : 0);
            _local_3 = (((_local_1 + Language.GAMEINTROPANEL_U[44]) + _local_2) + Language.GAMEINTROPANEL_U[45]);
            idTimerText.text = _local_3;
        }

        public function ___GameIntroPanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            systemAward();
        }

        [Bindable(event="propertyChange")]
        public function get ti_mj():TextInput
        {
            return (this._110351271ti_mj);
        }

        private function onActItemClickHandler(_arg_1:ListEvent):void
        {
            activityDescription = _arg_1.itemRenderer.data.Description;
            img_active.source = _arg_1.itemRenderer.data.url;
        }

        public function __actBtn2_click(_arg_1:MouseEvent):void
        {
            getActAward(_arg_1);
        }

        public function __selectA_click(_arg_1:MouseEvent):void
        {
            itemShow(0);
        }

        private function buyDiscountGift():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuyDiscountGift), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuyDiscountGift(true);
            };
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate():IntroText
        {
            return (this._719803452consumeActDate);
        }

        [Bindable(event="propertyChange")]
        public function get TA_fb():LinkTextArea
        {
            return (this._79606734TA_fb);
        }

        public function __getConsumeAwardBtn1_click(_arg_1:MouseEvent):void
        {
            getStageConsumeAward(1);
        }

        [Bindable(event="propertyChange")]
        public function get List_fl():List
        {
            return (this._1846619111List_fl);
        }

        public function set DG_fb(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._65009144DG_fb;
            if (_local_2 !== _arg_1)
            {
                this._65009144DG_fb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "DG_fb", _local_2, _arg_1));
            };
        }

        private function onGetTodayOnlineTime(_arg_1:Object):void
        {
            dailyActOnlineObj.time = _arg_1.t;
            dailyActOnlineObj.times = ((_arg_1.f != undefined) ? _arg_1.f : 0);
            setOnlineActiveTimerText();
            closeTimer();
            onlineTimer = new Timer(60000);
            onlineTimer.addEventListener(TimerEvent.TIMER, onTimer, false, 0, false);
            onlineTimer.start();
        }

        [Bindable(event="propertyChange")]
        public function get SC_boss():CharactorShowCanvas
        {
            return (this._1637688324SC_boss);
        }

        private function _GameIntroPanel_DataGridColumn19_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn19 = _local_1;
            _local_1.dataField = "key";
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn19", _GameIntroPanel_DataGridColumn19);
            return (_local_1);
        }

        public function set TA_boss(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._807442945TA_boss;
            if (_local_2 !== _arg_1)
            {
                this._807442945TA_boss = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TA_boss", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn3 = _local_1;
            _local_1.width = 193;
            _local_1.dataField = "Time";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn3", _GameIntroPanel_DataGridColumn3);
            return (_local_1);
        }

        public function set vb_earnMoney(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._1554912757vb_earnMoney;
            if (_local_2 !== _arg_1)
            {
                this._1554912757vb_earnMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb_earnMoney", _local_2, _arg_1));
            };
        }

        public function setGameAwardGiftState(_arg_1:Boolean):void
        {
            var _local_2:Object;
            if (((_arg_1 == 1) || (_arg_1 == "1")))
            {
                _itemIcon = new Image();
                _local_2 = _core.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, 2059, false);
                _itemIcon.source = ResManager.getIconUrl(_local_2.iconCode);
                ResManager.setColorCode(_itemIcon, _local_2.colorCode);
                i8.addChild(_itemIcon);
            };
        }

        private function _GameIntroPanel_ClassFactory12_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function _GameIntroPanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = GameIntroPanel_inlineComponent3;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get getDiscountBtn():BasicGlowButton
        {
            return (this._1176746971getDiscountBtn);
        }

        private function loadErrorHandler(_arg_1:IOErrorEvent):void
        {
            _arg_1.currentTarget.removeEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
            _arg_1.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            _arg_1.currentTarget.removeEventListener(Event.COMPLETE, loadCompleteHandler);
            systemInfo.text = Language.LOGINCANVAS_S[3];
        }

        [Bindable(event="propertyChange")]
        public function get getConsumeAwardBtn1():BasicDelayButton
        {
            return (this._411634732getConsumeAwardBtn1);
        }

        private function closeTimer():void
        {
            if (onlineTimer != undefined)
            {
                onlineTimer.stop();
                onlineTimer.removeEventListener(TimerEvent.TIMER, onTimer);
                onlineTimer = null;
            };
        }

        [Bindable(event="propertyChange")]
        public function get getConsumeAwardBtn4():BasicDelayButton
        {
            return (this._411634735getConsumeAwardBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get getConsumeAwardBtn5():BasicDelayButton
        {
            return (this._411634736getConsumeAwardBtn5);
        }

        public function set contiSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._404225515contiSlot;
            if (_local_2 !== _arg_1)
            {
                this._404225515contiSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contiSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get getConsumeAwardBtn2():BasicDelayButton
        {
            return (this._411634733getConsumeAwardBtn2);
        }

        private function initTrolley():void
        {
            _core.remote.call("getShopAward", new Responder(onGetShopAward));
        }

        public function set getStageConsumeAwardBtn0(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1083063779getStageConsumeAwardBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1083063779getStageConsumeAwardBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getStageConsumeAwardBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get getConsumeAwardBtn3():BasicDelayButton
        {
            return (this._411634734getConsumeAwardBtn3);
        }

        public function set skillSlot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220963skillSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1596220963skillSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot2", _local_2, _arg_1));
            };
        }

        public function set skillSlot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220964skillSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1596220964skillSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot3", _local_2, _arg_1));
            };
        }

        public function set skillSlot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220965skillSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1596220965skillSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot4", _local_2, _arg_1));
            };
        }

        public function set skillSlot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1596220962skillSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1596220962skillSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillSlot1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get noticeBtn0():BasicGlowButton
        {
            return (this._1269814196noticeBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get noticeBtn1():BasicGlowButton
        {
            return (this._1269814195noticeBtn1);
        }

        private function set equiptActiveList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._2088576552equiptActiveList;
            if (_local_2 !== _arg_1)
            {
                this._2088576552equiptActiveList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equiptActiveList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get nextConti():int
        {
            return (this._1191222340nextConti);
        }

        private function _GameIntroPanel_RadioButtonGroup2_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup;
            _local_1 = new RadioButtonGroup();
            rgBoss = _local_1;
            _local_1.addEventListener("itemClick", __rgBoss_itemClick);
            _local_1.initialized(this, "rgBoss");
            return (_local_1);
        }

        private function changeMiniMapMsgBtnStyle():void
        {
            var _local_1:int;
            if (getFestBtn.enabled == true)
            {
                _local_1 = 1;
            };
            if (((_core.player.level < 30) && (_local_1 == 1)))
            {
                getFestBtn.enabled = false;
            };
            if (((_core.player.level < 30) && (_local_1 == 1)))
            {
                getFestBtn.enabled = true;
            };
        }

        private function initCash():void
        {
            _core.remote.call("getPointAward", new Responder(onGetPoint));
        }

        private function initPets():void
        {
            var _local_1:int;
            var _local_2:XML;
            var _local_3:XML;
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:int;
            if (!pets_load)
            {
                _local_1 = 67;
                petItemList = new ArrayCollection();
                _local_2 = new XML(xmlPet);
                for each (_local_3 in _local_2.Pet)
                {
                    _local_4 = new Object();
                    _local_4.text = _local_3.@Name.toString();
                    _local_4.ID = _local_3.@ID.toString();
                    _local_4.Level = _local_3.@Level.toString();
                    _local_4.Description = _local_3.@Description.toString();
                    _local_4.cid = parseInt(_local_3.@CID.toString());
                    _local_4.URL = ResManager.getResUrl(GameData.d[GamePredef.TBL_CREATURE][_local_3.@CID.toString()].resCode);
                    _local_4.icon = ResManager.ICON_PET_STANDBY;
                    _local_5 = new Object();
                    _local_6 = 0;
                    while (_local_6 <= GameData.d[GamePredef.TBL_SHOP_SLOT].length)
                    {
                        if (((((((GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6]) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6].type == GamePredef.TBL_ITEM_TEMPLATE)) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6].itemId == _local_4.ID)) && (!(GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6].st == 5))) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6].sid == _local_1)) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6].gold >= 0)))
                        {
                            _local_4.shopSlot = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_6];
                            petItemList.addItem(_local_4);
                        };
                        _local_6++;
                    };
                    if (_local_4.ID == "-1")
                    {
                        _local_4.shopSlot = null;
                        petItemList.addItem(_local_4);
                    };
                };
                pets_load = true;
            };
        }

        private function _GameIntroPanel_DataGridColumn17_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn17 = _local_1;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory4_c();
            _local_1.width = 80;
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn17", _GameIntroPanel_DataGridColumn17);
            return (_local_1);
        }

        private function onFbItemClickHandler(_arg_1:ListEvent):void
        {
            img_fb.source = _arg_1.itemRenderer.data.url;
            TA_fb.htmlText = _arg_1.itemRenderer.data.desc;
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        private function _GameIntroPanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn1 = _local_1;
            _local_1.width = 85;
            _local_1.dataField = "Name";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn1", _GameIntroPanel_DataGridColumn1);
            return (_local_1);
        }

        public function set DG_active(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._2118150722DG_active;
            if (_local_2 !== _arg_1)
            {
                this._2118150722DG_active = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "DG_active", _local_2, _arg_1));
            };
        }

        private function take():void
        {
            if (!_core.player.enoughBag(1))
            {
                _core.sysMidNote(Language.AWARDCODEPANEL_S[0]);
                return;
            };
            var _local_1:String = ti.text.slice(0, 1);
            if ((((ti.text) && (ti.text.length)) && (((((((_local_1 == PRE_1) || (_local_1 == PRE_2)) || (_local_1 == PRE_3)) || (_local_1 == PRE_A)) || (_local_1 == PRE_O)) || (ti.text.length == 9)) > 0)))
            {
                _core.remote.uc(ti.text);
            };
            ti.text = "";
        }

        private function _GameIntroPanel_ClassFactory10_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function _GameIntroPanel_DataGridColumn28_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn28 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory10_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn28", _GameIntroPanel_DataGridColumn28);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get ti_tz():TextInput
        {
            return (this._110351504ti_tz);
        }

        private function _GameIntroPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = GameIntroPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get petItemList():ArrayCollection
        {
            return (this._32480112petItemList);
        }

        public function __StageConsumeBtn0_click(_arg_1:MouseEvent):void
        {
            showStagePlatform(0);
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            var _local_2:Date;
            _local_2 = new Date();
            timerDate = _local_2.getDate();
            if (initDate != timerDate)
            {
                dailyActOnlineObj = {
                    "time":0,
                    "times":0
                };
                initDate = timerDate;
            };
            dailyActOnlineObj.time = (dailyActOnlineObj.time + 1);
            setOnlineActiveTimerText();
        }

        public function set rgActives(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object;
            _local_2 = this._267684296rgActives;
            if (_local_2 !== _arg_1)
            {
                this._267684296rgActives = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rgActives", _local_2, _arg_1));
            };
        }

        public function ___GameIntroPanel_Canvas37_show(_arg_1:FlexEvent):void
        {
            initDailyAct();
        }

        public function set sysInfoCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._732738989sysInfoCanvas;
            if (_local_2 !== _arg_1)
            {
                this._732738989sysInfoCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sysInfoCanvas", _local_2, _arg_1));
            };
        }

        public function __tabBtn5_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(5);
        }

        private function dateFormatter(_arg_1:int):String
        {
            if (!_arg_1)
            {
                return ("");
            };
            var _local_2:Date = new Date((_arg_1 * 1000));
            return (((((((_local_2.getMonth() + 1) + "-") + _local_2.getDate()) + " ") + _local_2.getHours()) + ":") + _local_2.getMinutes());
        }

        private function buyPet():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuyPet), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuyPet(true);
            };
        }

        public function __getStageConsumeAwardBtn0_click(_arg_1:MouseEvent):void
        {
            getStageConsumeAward(0);
        }

        private function set _haveDiaryAwarded(_arg_1:Boolean):void
        {
            var _local_2:Object;
            _local_2 = this._534379936_haveDiaryAwarded;
            if (_local_2 !== _arg_1)
            {
                this._534379936_haveDiaryAwarded = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_haveDiaryAwarded", _local_2, _arg_1));
            };
        }

        public function set consumeActivity0(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._836980325consumeActivity0;
            if (_local_2 !== _arg_1)
            {
                this._836980325consumeActivity0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity0", _local_2, _arg_1));
            };
        }

        public function set consumeActivity3(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._836980328consumeActivity3;
            if (_local_2 !== _arg_1)
            {
                this._836980328consumeActivity3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity3", _local_2, _arg_1));
            };
        }

        public function set consumeActivity4(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._836980329consumeActivity4;
            if (_local_2 !== _arg_1)
            {
                this._836980329consumeActivity4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity4", _local_2, _arg_1));
            };
        }

        private function initConsume():*
        {
            _core.remote.call("getConsume", new Responder(onGetConsume));
        }

        public function set consumeActivity2(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._836980327consumeActivity2;
            if (_local_2 !== _arg_1)
            {
                this._836980327consumeActivity2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity2", _local_2, _arg_1));
            };
        }

        public function set consumeActivity1(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._836980326consumeActivity1;
            if (_local_2 !== _arg_1)
            {
                this._836980326consumeActivity1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity1", _local_2, _arg_1));
            };
        }

        public function __StageConsumeBtn5_click(_arg_1:MouseEvent):void
        {
            showStagePlatform(5);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate0():IntroText
        {
            return (this._839070484consumeActDate0);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate1():IntroText
        {
            return (this._839070483consumeActDate1);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate2():IntroText
        {
            return (this._839070482consumeActDate2);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate3():IntroText
        {
            return (this._839070481consumeActDate3);
        }

        private function initConsumeAward():*
        {
            _core.remote.getConsumeAwardList();
        }

        private function _GameIntroPanel_DataGridColumn15_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn15 = _local_1;
            _local_1.dataField = "value";
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn15", _GameIntroPanel_DataGridColumn15);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get getContiBtn():BasicGlowButton
        {
            return (this._1510655195getContiBtn);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate4():IntroText
        {
            return (this._839070480consumeActDate4);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActDate5():IntroText
        {
            return (this._839070479consumeActDate5);
        }

        private function loadSystemInfo():void
        {
            clickNotice(0);
        }

        [Bindable(event="propertyChange")]
        public function get i7():ItemSlot
        {
            return (this._3310i7);
        }

        [Bindable(event="propertyChange")]
        public function get i8():ItemSlot
        {
            return (this._3311i8);
        }

        public function set propertyPentagon(_arg_1:PentagonCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._805962357propertyPentagon;
            if (_local_2 !== _arg_1)
            {
                this._805962357propertyPentagon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propertyPentagon", _local_2, _arg_1));
            };
        }

        public function set consumeActivity5(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._836980330consumeActivity5;
            if (_local_2 !== _arg_1)
            {
                this._836980330consumeActivity5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity5", _local_2, _arg_1));
            };
        }

        private function set activityItemList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._296859264activityItemList;
            if (_local_2 !== _arg_1)
            {
                this._296859264activityItemList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activityItemList", _local_2, _arg_1));
            };
        }

        public function init():void
        {
            var _local_1:Date = new Date();
            initDate = _local_1.getDate();
            initPets();
            initPenalConfig();
            _sortForDiary.fields = [new SortField("_st", false, false, true), new SortField("pos", false, false, true), new SortField("id", false, false, true)];
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get airBossList():ArrayCollection
        {
            return (this._634901781airBossList);
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set ti(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._3701ti;
            if (_local_2 !== _arg_1)
            {
                this._3701ti = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn26_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn26 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory9_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn26", _GameIntroPanel_DataGridColumn26);
            return (_local_1);
        }

        public function set tabBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        public function set tabBtn6(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141553tabBtn6;
            if (_local_2 !== _arg_1)
            {
                this._1554141553tabBtn6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn6", _local_2, _arg_1));
            };
        }

        public function autoClick(_arg_1:int):void
        {
            tabBtnClick(_arg_1);
            if (_arg_1 == 7)
            {
                flTabBtnClick(0);
            };
        }

        public function set tabBtn8(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141551tabBtn8;
            if (_local_2 !== _arg_1)
            {
                this._1554141551tabBtn8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn8", _local_2, _arg_1));
            };
        }

        public function set tabBtn9(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141550tabBtn9;
            if (_local_2 !== _arg_1)
            {
                this._1554141550tabBtn9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn9", _local_2, _arg_1));
            };
        }

        public function getStageConsumeAward(_arg_1:int):*
        {
            var _local_4:Number;
            var _local_5:Number;
            var _local_2:Date = new Date();
            var _local_3:Number = (_local_2.getTime() / 1000);
            if (((this[("consumeActivity" + _arg_1)].dataProvider) && (this[("consumeActivity" + _arg_1)].dataProvider.getItemAt(0))))
            {
                _local_4 = this[("consumeActivity" + _arg_1)].dataProvider.getItemAt(0).end;
                _local_5 = this[("consumeActivity" + _arg_1)].dataProvider.getItemAt(0).start;
                if ((((_local_3 > _local_4) && (_arg_1 < 5)) || ((_local_3 > _local_5) && (_arg_1 == 5))))
                {
                    _core.remote.takeStageConsumeAward(_arg_1);
                }
                else
                {
                    Alert.show(Language.SYSTEMSHOPPANEL_U[62], "", Alert.YES, null, null);
                };
            }
            else
            {
                Alert.show(Language.SYSTEMSHOPPANEL_U[63], "", Alert.YES, null, null);
            };
        }

        private function _GameIntroPanel_DataGridColumn37_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn37 = _local_1;
            _local_1.width = 65;
            _local_1.dataField = "act";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn37", _GameIntroPanel_DataGridColumn37);
            return (_local_1);
        }

        public function set tabBtn5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141554tabBtn5;
            if (_local_2 !== _arg_1)
            {
                this._1554141554tabBtn5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn5", _local_2, _arg_1));
            };
        }

        public function newServerActLink(_arg_1:int):void
        {
            tabBtnClick(8);
            if (_arg_1 == 14)
            {
                flTabBtnClick((_arg_1 - 9));
            }
            else
            {
                flTabBtnClick((_arg_1 - 8));
            };
        }

        public function set lb_festdesc(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1733959322lb_festdesc;
            if (_local_2 !== _arg_1)
            {
                this._1733959322lb_festdesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lb_festdesc", _local_2, _arg_1));
            };
        }

        public function set tabBtn7(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1554141552tabBtn7;
            if (_local_2 !== _arg_1)
            {
                this._1554141552tabBtn7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn7", _local_2, _arg_1));
            };
        }

        public function ___GameIntroPanel_LinkButton3_click(_arg_1:MouseEvent):void
        {
            linkbutton_clickHandler(2);
        }

        [Bindable(event="propertyChange")]
        public function get ti_zl():TextInput
        {
            return (this._110351676ti_zl);
        }

        public function __actBtn0_click(_arg_1:MouseEvent):void
        {
            getActAward(_arg_1);
        }

        public function __toCar_click(_arg_1:MouseEvent):void
        {
            openShopTrolley();
        }

        public function __getContiBtn_click(_arg_1:MouseEvent):void
        {
            buyContiGift();
        }

        public function set getFestBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._74227366getFestBtn;
            if (_local_2 !== _arg_1)
            {
                this._74227366getFestBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getFestBtn", _local_2, _arg_1));
            };
        }

        public function __getConsumeAwardBtn_click(_arg_1:MouseEvent):void
        {
            getConsumeAward();
        }

        public function reset():void
        {
            if (!initialized)
            {
                return;
            };
            flag = new Object();
            dailySlot.clean();
            DiscountSlot.clean();
            contiSlot.clean();
            festSlot.clean();
            getGiftBtn.enabled = false;
            getDiscountBtn.enabled = false;
            getContiBtn.enabled = false;
            getFestBtn.enabled = false;
            _haveDiaryAwarded = false;
            totalAct.text = "0";
        }

        private function set enableActiveList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1809115815enableActiveList;
            if (_local_2 !== _arg_1)
            {
                this._1809115815enableActiveList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enableActiveList", _local_2, _arg_1));
            };
        }

        public function __rgBoss_itemClick(_arg_1:ItemClickEvent):void
        {
            changeBossArr(_arg_1);
        }

        public function set totalAct(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._849924434totalAct;
            if (_local_2 !== _arg_1)
            {
                this._849924434totalAct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totalAct", _local_2, _arg_1));
            };
        }

        public function set trolleyDG(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._529071784trolleyDG;
            if (_local_2 !== _arg_1)
            {
                this._529071784trolleyDG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trolleyDG", _local_2, _arg_1));
            };
        }

        public function set getAwardsByCode(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._425076048getAwardsByCode;
            if (_local_2 !== _arg_1)
            {
                this._425076048getAwardsByCode = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwardsByCode", _local_2, _arg_1));
            };
        }

        private function onBossItemClickHandler(_arg_1:ListEvent):void
        {
            if (SC_boss.url != _arg_1.itemRenderer.data.url)
            {
                SC_boss.url = _arg_1.itemRenderer.data.url;
            };
            TA_boss.htmlText = _arg_1.itemRenderer.data.desc;
            SC_boss.color = _arg_1.itemRenderer.data.colorCode;
        }

        private function _GameIntroPanel_DataGridColumn13_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn13 = _local_1;
            _local_1.width = 100;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn13", _GameIntroPanel_DataGridColumn13);
            return (_local_1);
        }

        private function systemAward():void
        {
            _core.remote.gtg();
            i8.removeAllChildren();
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        public function set img_fb(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1185079624img_fb;
            if (_local_2 !== _arg_1)
            {
                this._1185079624img_fb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_fb", _local_2, _arg_1));
            };
        }

        public function getStageConsumeAwardList(_arg_1:Object, _arg_2:Object):*
        {
            var _local_4:int;
            var _local_5:ArrayCollection;
            var _local_6:*;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:String;
            var _local_10:int;
            var _local_3:* = Number(_arg_1.stageNum);
            _local_4 = _local_3;
            while (_local_4 <= 5)
            {
                this[("StageConsumeBtn" + _local_4)].visible = false;
                _local_4++;
            };
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                this[("StageConsumeBtn" + _local_4)].visible = true;
                _local_5 = new ArrayCollection();
                if (((_arg_1[_local_4]) && (_arg_1[_local_4].awardList)))
                {
                    for (_local_6 in _arg_1[_local_4].awardList)
                    {
                        _local_7 = _arg_1[_local_4].awardList[_local_6];
                        _local_8 = new Object();
                        _local_8.id = int(_local_6);
                        if (_local_7.max <= 0)
                        {
                            _local_8.key = (Language.SYSTEMSHOPPANEL_U[56] + _local_7.min);
                        }
                        else
                        {
                            _local_8.key = ((((_local_7.min + "<=") + Language.SYSTEMSHOPPANEL_U[55]) + "<=") + _local_7.max);
                        };
                        _local_8.start = Number(_arg_1[_local_4].start);
                        _local_8.end = Number(_arg_1[_local_4].end);
                        _local_8.array = _local_7.award;
                        _local_8.point = _local_7.point;
                        _local_8.i = int(_local_7.min);
                        _local_5.addItem(_local_8);
                    };
                    if (((_arg_1[_local_4].start) && (_arg_1[_local_4].end)))
                    {
                        _local_9 = Language.ACTIVEPANEL_S[60].replace("{start}", dateFormatter2(_arg_1[_local_4].start));
                        _local_9 = _local_9.replace("{end}", dateFormatter2(_arg_1[_local_4].end));
                        if ((((((((_arg_2) && (_arg_2[_local_4])) && (_arg_2[_local_4].total)) && (_arg_2[_local_4].start)) && (Number(_arg_2[_local_4].start) == Number(_arg_1[_local_4].start))) && (_arg_2[_local_4].end)) && (Number(_arg_2[_local_4].end) == Number(_arg_1[_local_4].end))))
                        {
                            _local_9 = _local_9.replace("{money}", _arg_2[_local_4].total);
                        }
                        else
                        {
                            _local_9 = _local_9.replace("{money}", 0);
                        };
                        if (((_arg_1[5]) && (_arg_1[5].end)))
                        {
                            _local_9 = (_local_9 + Language.ACTIVEPANEL_S[85].replace("{time}", dateFormatter2(_arg_1[5].end)));
                        }
                        else
                        {
                            _local_9 = (_local_9 + Language.ACTIVEPANEL_S[62]);
                        };
                        if ((((((_arg_1[5]) && (_arg_1[5].awardList)) && (_arg_1[5].awardList[0])) && (_arg_1[5].awardList[0].award)) && (_arg_1[5].awardList[0].award[0])))
                        {
                            _local_9 = (_local_9 + Language.ACTIVEPANEL_S[80].replace("{money}", _arg_1[_local_4].limit));
                        };
                        this[("consumeAcMsg" + _local_4)] = _local_9;
                        this[("consumeActDate" + _local_4)].text = this[("consumeAcMsg" + _local_4)];
                    }
                    else
                    {
                        this[("consumeActDate" + _local_4)].text = (Language.SYSTEMSHOPPANEL_U[52] + Language.ACTIVEPANEL_S[62]);
                    };
                };
                this[("consumeActivity" + _local_4)].dataProvider = _local_5;
                _local_4++;
            };
            _local_5 = new ArrayCollection();
            if ((((((_arg_1[5]) && (_arg_1[5].awardList)) && (_arg_1[5].awardList[0])) && (_arg_1[5].awardList[0].award)) && (_arg_1[5].awardList[0].award[0])))
            {
                this["StageConsumeBtn5"].visible = true;
                for (_local_6 in _arg_1[5].awardList)
                {
                    _local_7 = _arg_1[5].awardList[_local_6];
                    _local_8 = new Object();
                    _local_8.id = int(_local_6);
                    _local_8.start = Number(_arg_1[5].start);
                    _local_8.end = Number(_arg_1[5].end);
                    _local_8.array = _local_7.award;
                    _local_8.point = _local_7.point;
                    _local_5.addItem(_local_8);
                };
                if (_arg_1[5].enable)
                {
                    _local_9 = Language.ACTIVEPANEL_S[82];
                    _local_10 = 0;
                    while (_local_10 < _local_3)
                    {
                        _local_9 = (_local_9 + Language.ACTIVEPANEL_S[81].replace("{num}", (_local_10 + 1)).replace("{money}", _arg_1[_local_10].limit));
                        _local_10++;
                    };
                    _local_9 = (_local_9 + Language.ACTIVEPANEL_S[83]);
                    _local_10 = 0;
                    while (_local_10 < _local_3)
                    {
                        if (((((((_arg_2) && (_arg_2[_local_10])) && (_arg_2[_local_10].start)) && (Number(_arg_2[_local_10].start) == Number(_arg_1[_local_10].start))) && (_arg_2[_local_10].end)) && (Number(_arg_2[_local_10].end) == Number(_arg_1[_local_10].end))))
                        {
                            _local_9 = (_local_9 + Language.ACTIVEPANEL_S[84].replace("{num}", (_local_10 + 1)).replace("{money}", _arg_2[_local_10].total));
                        }
                        else
                        {
                            _local_9 = (_local_9 + Language.ACTIVEPANEL_S[84].replace("{num}", (_local_10 + 1)).replace("{money}", 0));
                        };
                        _local_10++;
                    };
                    if ((((_arg_1[5]) && (_arg_1[5].end)) && (_arg_1[5].start)))
                    {
                        _local_9 = (_local_9 + Language.ACTIVEPANEL_S[86].replace("{time1}", dateFormatter2(_arg_1[5].start)).replace("{time2}", dateFormatter2(_arg_1[5].end)));
                    };
                    this["consumeAcMsg5"] = _local_9;
                    this["consumeActDate5"].text = this["consumeAcMsg5"];
                };
            };
            this["consumeActivity5"].dataProvider = _local_5;
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

        [Bindable(event="propertyChange")]
        public function get vs_stageConsume():ViewStack
        {
            return (this._536153440vs_stageConsume);
        }

        [Bindable(event="propertyChange")]
        public function get Btn_AllFest():LinkButton
        {
            return (this._2096601730Btn_AllFest);
        }

        private function _GameIntroPanel_DataGridColumn24_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn24 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory8_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn24", _GameIntroPanel_DataGridColumn24);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get festSlot():ItemSlot
        {
            return (this._223647102festSlot);
        }

        [Bindable(event="propertyChange")]
        public function get vs_fl():ViewStack
        {
            return (this._112496008vs_fl);
        }

        public function set selectA(_arg_1:RoundedButton):void
        {
            var _local_2:Object;
            _local_2 = this._1978100421selectA;
            if (_local_2 !== _arg_1)
            {
                this._1978100421selectA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectA", _local_2, _arg_1));
            };
        }

        public function set selectB(_arg_1:RoundedButton):void
        {
            var _local_2:Object;
            _local_2 = this._1978100422selectB;
            if (_local_2 !== _arg_1)
            {
                this._1978100422selectB = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectB", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get xmlPet():XML
        {
            return (this._755507832xmlPet);
        }

        public function set selectACar(_arg_1:RoundedButton):void
        {
            var _local_2:Object;
            _local_2 = this._1656558897selectACar;
            if (_local_2 !== _arg_1)
            {
                this._1656558897selectACar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectACar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petLevel():RoundedLabel
        {
            return (this._464115109petLevel);
        }

        public function __getConsumeAwardBtn4_click(_arg_1:MouseEvent):void
        {
            getStageConsumeAward(4);
        }

        private function _GameIntroPanel_DataGridColumn35_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn35 = _local_1;
            _local_1.sortable = false;
            _local_1.width = 340;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory14_c();
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn35", _GameIntroPanel_DataGridColumn35);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get DG_boss():DataGrid
        {
            return (this._1950825047DG_boss);
        }

        public function set getGiftBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1064241878getGiftBtn;
            if (_local_2 !== _arg_1)
            {
                this._1064241878getGiftBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getGiftBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petDataList():List
        {
            return (this._579057063petDataList);
        }

        [Bindable(event="propertyChange")]
        public function get StageConsumeBtn0():BasicDelayButton
        {
            return (this._1632084558StageConsumeBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get StageConsumeBtn1():BasicDelayButton
        {
            return (this._1632084557StageConsumeBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get StageConsumeBtn3():BasicDelayButton
        {
            return (this._1632084555StageConsumeBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get StageConsumeBtn4():BasicDelayButton
        {
            return (this._1632084554StageConsumeBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get StageConsumeBtn5():BasicDelayButton
        {
            return (this._1632084553StageConsumeBtn5);
        }

        public function getGameGift():void
        {
            _core.remote.searchGameGift();
        }

        public function sortConsumeAwardList(_arg_1:Object, _arg_2:Object):*
        {
            var _local_3:int = int(_arg_1.id);
            var _local_4:int = int(_arg_2.id);
            return (ObjectUtil.numericCompare(_local_3, _local_4));
        }

        public function clearDiaryProgress():void
        {
            var _local_3:String;
            var _local_4:Sort;
            var _local_5:Object;
            var _local_6:Object;
            var _local_1:ArrayCollection = new ArrayCollection();
            var _local_2:Object = _core.data.gameData[GamePredef.TBL_DIARY];
            for (_local_3 in _local_2)
            {
                _local_5 = _local_2[_local_3];
                if (_local_5)
                {
                    _local_6 = _local_5;
                    if (_local_5.max > 0)
                    {
                        _local_6._numStr = ("0/" + _local_5.max);
                    }
                    else
                    {
                        _local_6._numStr = ("0/" + Language.GAMEINTROPANEL_U[41]);
                    };
                    _local_6._num = 0;
                    _local_6._st = 0;
                    _local_1.addItem(_local_6);
                };
            };
            _local_4 = new Sort();
            _local_4.fields = [new SortField("pos", false, false, true), new SortField("id", false, false, true)];
            _local_1.sort = _local_4;
            _local_1.refresh();
            diaryList = _local_1;
        }

        public function set vb_levelUp(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._322625876vb_levelUp;
            if (_local_2 !== _arg_1)
            {
                this._322625876vb_levelUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb_levelUp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get StageConsumeBtn2():BasicDelayButton
        {
            return (this._1632084556StageConsumeBtn2);
        }

        public function set tabBtn10(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747994tabBtn10;
            if (_local_2 !== _arg_1)
            {
                this._933747994tabBtn10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn10", _local_2, _arg_1));
            };
        }

        public function onGetShopAward(_arg_1:Object):void
        {
            var _local_5:*;
            var _local_6:Object;
            var _local_7:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            var _local_3:Date = new Date();
            var _local_4:int = int((_local_3.getTime() / 1000));
            for (_local_5 in _arg_1)
            {
                _local_6 = _arg_1[_local_5];
                if (_local_5 != "firstTime")
                {
                    if (_local_5 != "information")
                    {
                        if (((((_local_6.start == undefined) || (_local_6.end == undefined)) || ((_local_6.start == 0) && (_local_6.end == 0))) || ((_local_4 >= _local_6.start) && ((_local_4 <= _local_6.end) || (_local_6.end == 0)))))
                        {
                            _local_7 = new Object();
                            _local_7.id = int(_local_5);
                            if (_local_6.j <= 0)
                            {
                                _local_7.key = (Language.SYSTEMSHOPPANEL_U[43] + _local_6.i);
                            }
                            else
                            {
                                _local_7.key = ((((_local_6.i + "<=") + Language.SYSTEMSHOPPANEL_U[42]) + "<") + _local_6.j);
                            };
                            _local_7.type = _local_6.itemType;
                            _local_7.itemId = _local_6.itemId;
                            _local_7.binded = _local_6.binded;
                            _local_7.start = _local_6.start;
                            _local_7.group = 0;
                            if (_local_6.group)
                            {
                                _local_7.group = _local_6.group;
                            };
                            if (_local_6.start)
                            {
                                _local_7.timeRange = (((Language.SYSTEMSHOPPANEL_U[53] + dateFormatter(_local_7.start)) + " ") + Language.SYSTEMSHOPPANEL_U[51]);
                                _local_7.timeRange = (_local_7.timeRange + ((_local_6.end) ? dateFormatter(_local_6.end) : Language.SYSTEMSHOPPANEL_U[54]));
                            }
                            else
                            {
                                _local_7.timeRange = Language.SYSTEMSHOPPANEL_U[52];
                            };
                            _local_7.q = _local_6.quality;
                            _local_2.addItem(_local_7);
                        };
                    };
                };
            };
            pointsCar = _local_2;
            carItemShow();
        }

        private function set earnMoneyActiveList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1142482604earnMoneyActiveList;
            if (_local_2 !== _arg_1)
            {
                this._1142482604earnMoneyActiveList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "earnMoneyActiveList", _local_2, _arg_1));
            };
        }

        private function initDefaultViews():void
        {
            var _local_1:Object = activityItemList.getItemAt(0);
            var _local_2:ListEvent = new ListEvent(ListEvent.ITEM_CLICK);
            _local_2.itemRenderer = new DataGridItemRenderer();
            _local_2.itemRenderer.data = _local_1;
            onActItemClickHandler(_local_2);
            var _local_3:Object = fbList.getItemAt(0);
            var _local_4:ListEvent = new ListEvent(ListEvent.ITEM_CLICK);
            _local_4.itemRenderer = new DataGridItemRenderer();
            _local_4.itemRenderer.data = _local_3;
            onFbItemClickHandler(_local_4);
            var _local_5:Object = groundBossList.getItemAt(0);
            var _local_6:ListEvent = new ListEvent(ListEvent.ITEM_CLICK);
            _local_6.itemRenderer = new DataGridItemRenderer();
            _local_6.itemRenderer.data = _local_5;
            onBossItemClickHandler(_local_6);
            var _local_7:Object = petItemList.getItemAt(0);
            var _local_8:ListEvent = new ListEvent(ListEvent.ITEM_CLICK);
            _local_8.itemRenderer = new DataGridItemRenderer();
            _local_8.itemRenderer.data = _local_7;
            onPetItemClickHandler(_local_8);
        }

        private function _GameIntroPanel_DataGridColumn11_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn11 = _local_1;
            _local_1.width = 70;
            _local_1.dataField = "level";
            _local_1.sortCompareFunction = levelSortCompareFunction2;
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn11", _GameIntroPanel_DataGridColumn11);
            return (_local_1);
        }

        public function set cashDG(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._1367571722cashDG;
            if (_local_2 !== _arg_1)
            {
                this._1367571722cashDG = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cashDG", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vb_earnMoney():VBox
        {
            return (this._1554912757vb_earnMoney);
        }

        [Bindable(event="propertyChange")]
        public function get DG_fb():DataGrid
        {
            return (this._65009144DG_fb);
        }

        public function set DiscountSlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._713858815DiscountSlot;
            if (_local_2 !== _arg_1)
            {
                this._713858815DiscountSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "DiscountSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get TA_boss():LinkTextArea
        {
            return (this._807442945TA_boss);
        }

        private function set diaryList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1521020673diaryList;
            if (_local_2 !== _arg_1)
            {
                this._1521020673diaryList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "diaryList", _local_2, _arg_1));
            };
        }

        public function set img_active(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1803236098img_active;
            if (_local_2 !== _arg_1)
            {
                this._1803236098img_active = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img_active", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn22_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn22 = _local_1;
            _local_1.dataField = "";
            _local_1.width = 40;
            _local_1.labelFunction = timeLimitCheck;
            _local_1.itemRenderer = _GameIntroPanel_ClassFactory7_c();
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn22", _GameIntroPanel_DataGridColumn22);
            return (_local_1);
        }

        private function loadCompleteHandler(_arg_1:Event):void
        {
            var _local_2:String;
            _arg_1.currentTarget.removeEventListener(ProgressEvent.PROGRESS, loadProgressHandler);
            _arg_1.currentTarget.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
            _arg_1.currentTarget.removeEventListener(Event.COMPLETE, loadCompleteHandler);
            _local_2 = (("<font color='#FFFFFF'>" + _arg_1.currentTarget.data) + "</font>");
            systemInfo.htmlText = _local_2;
            systemInfo.verticalScrollPosition = 0;
            if (_arg_1.currentTarget == noticeLoader0)
            {
                noticeDataArr[0] = _local_2;
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot3():ItemSlot
        {
            return (this._1596220964skillSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot4():ItemSlot
        {
            return (this._1596220965skillSlot4);
        }

        private function _GameIntroPanel_DataGridColumn33_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn33 = _local_1;
            _local_1.sortable = true;
            _local_1.sortCompareFunction = sortConsumeAwardList;
            _local_1.dataField = "key";
            _local_1.width = 200;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn33", _GameIntroPanel_DataGridColumn33);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get equiptActiveList():ArrayCollection
        {
            return (this._2088576552equiptActiveList);
        }

        public function set _selectedURL(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._401544427_selectedURL;
            if (_local_2 !== _arg_1)
            {
                this._401544427_selectedURL = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_selectedURL", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot1():ItemSlot
        {
            return (this._1596220962skillSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get skillSlot2():ItemSlot
        {
            return (this._1596220963skillSlot2);
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        public function getConsumeAward():*
        {
            var _local_3:Number;
            var _local_1:Date = new Date();
            var _local_2:Number = (_local_1.getTime() / 1000);
            if (((consumeActivity.dataProvider) && (consumeActivity.dataProvider.getItemAt(0))))
            {
                _local_3 = consumeActivity.dataProvider.getItemAt(0).end;
                if (_local_2 > _local_3)
                {
                    _core.remote.takeConsumeAward();
                }
                else
                {
                    Alert.show(Language.SYSTEMSHOPPANEL_U[62], "", Alert.YES, null, null);
                };
            }
            else
            {
                Alert.show(Language.SYSTEMSHOPPANEL_U[63], "", Alert.YES, null, null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get rgActives():RadioButtonGroup
        {
            return (this._267684296rgActives);
        }

        public function initSystemAward():void
        {
            iniGift();
        }

        private function linkbutton_clickHandler(_arg_1:int):void
        {
            if (_arg_1 == 1)
            {
                navigateToURL(new URLRequest("http://vuaphapthuat.go.vn/bai-viet/huong-dan-tham-gia-su-kien-nap/4189.html"), "_blank");
            }
            else
            {
                if (_arg_1 == 2)
                {
                    navigateToURL(new URLRequest("http://vuaphapthuat.go.vn/bai-viet/huong-dan-tham-gia-su-kien-xe-hang/4188.html"), "_blank");
                };
            };
        }

        public function set classImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._692413227classImg;
            if (_local_2 !== _arg_1)
            {
                this._692413227classImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classImg", _local_2, _arg_1));
            };
        }

        public function onGetGameGift(_arg_1:String):void
        {
            var _local_3:Object;
            obj = com.adobe.serialization.json.JSON.decode(_arg_1);
            var _local_2:ArrayCollection = new ArrayCollection();
            for each (_local_3 in obj)
            {
                giftCount = (giftCount + 1);
                _local_2.addItem(_local_3);
            };
            if (giftCount == 0)
            {
                return;
            };
            _itemIcon = new Image();
            var _local_4:Object = _core.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, _local_2[0].giftid, false);
            if (_local_4)
            {
                _itemIcon.source = ResManager.getIconUrl(_local_4.iconCode);
                ResManager.setColorCode(_itemIcon, _local_4.colorCode);
                i7.addChild(_itemIcon);
            };
        }

        private function set consumeAcMsg0(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._1686904019consumeAcMsg0;
            if (_local_2 !== _arg_1)
            {
                this._1686904019consumeAcMsg0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg0", _local_2, _arg_1));
            };
        }

        private function onBuyDisc(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                DiscountSlot.giid = 0;
                getDiscountBtn.enabled = false;
            };
        }

        public function set consumeActivity(_arg_1:DataGrid):void
        {
            var _local_2:Object;
            _local_2 = this._804284629consumeActivity;
            if (_local_2 !== _arg_1)
            {
                this._804284629consumeActivity = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActivity", _local_2, _arg_1));
            };
        }

        public function __StageConsumeBtn3_click(_arg_1:MouseEvent):void
        {
            showStagePlatform(3);
        }

        private function set consumeAcMsg4(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._1686904015consumeAcMsg4;
            if (_local_2 !== _arg_1)
            {
                this._1686904015consumeAcMsg4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg4", _local_2, _arg_1));
            };
        }

        public function set selectBCar(_arg_1:RoundedButton):void
        {
            var _local_2:Object;
            _local_2 = this._1656529106selectBCar;
            if (_local_2 !== _arg_1)
            {
                this._1656529106selectBCar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectBCar", _local_2, _arg_1));
            };
        }

        private function set consumeAcMsg5(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._1686904014consumeAcMsg5;
            if (_local_2 !== _arg_1)
            {
                this._1686904014consumeAcMsg5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity0():DataGrid
        {
            return (this._836980325consumeActivity0);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity3():DataGrid
        {
            return (this._836980328consumeActivity3);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity4():DataGrid
        {
            return (this._836980329consumeActivity4);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity5():DataGrid
        {
            return (this._836980330consumeActivity5);
        }

        private function set consumeAcMsg1(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._1686904018consumeAcMsg1;
            if (_local_2 !== _arg_1)
            {
                this._1686904018consumeAcMsg1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity1():DataGrid
        {
            return (this._836980326consumeActivity1);
        }

        public function __petDataList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        public function set currentFestTxt(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1742477111currentFestTxt;
            if (_local_2 !== _arg_1)
            {
                this._1742477111currentFestTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentFestTxt", _local_2, _arg_1));
            };
        }

        public function __getAwardsFromNet_click(_arg_1:MouseEvent):void
        {
            moveGiftToBag();
        }

        private function set consumeAcMsg3(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._1686904016consumeAcMsg3;
            if (_local_2 !== _arg_1)
            {
                this._1686904016consumeAcMsg3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg3", _local_2, _arg_1));
            };
        }

        public function cancel():void
        {
            hide();
        }

        public function ___GameIntroPanel_Canvas22_show(_arg_1:FlexEvent):void
        {
            initSystemAward();
        }

        [Bindable(event="propertyChange")]
        public function get ti():TextInput
        {
            return (this._3701ti);
        }

        public function set idTimerText(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._115591369idTimerText;
            if (_local_2 !== _arg_1)
            {
                this._115591369idTimerText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "idTimerText", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity2():DataGrid
        {
            return (this._836980327consumeActivity2);
        }

        private function set consumeAcMsg2(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._1686904017consumeAcMsg2;
            if (_local_2 !== _arg_1)
            {
                this._1686904017consumeAcMsg2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeAcMsg2", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_DataGridColumn20_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn20 = _local_1;
            _local_1.dataField = "binded";
            _local_1.labelFunction = pointAwardBinded;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn20", _GameIntroPanel_DataGridColumn20);
            return (_local_1);
        }

        public function set elementImg(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._575917863elementImg;
            if (_local_2 !== _arg_1)
            {
                this._575917863elementImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "elementImg", _local_2, _arg_1));
            };
        }

        public function __tabBtn8_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(8);
        }

        public function set rgBoss(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object;
            _local_2 = this._934044862rgBoss;
            if (_local_2 !== _arg_1)
            {
                this._934044862rgBoss = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rgBoss", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicGlowButton
        {
            return (this._1554141555tabBtn4);
        }

        public function __getFestBtn_click(_arg_1:MouseEvent):void
        {
            getFestGift();
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn7():BasicGlowButton
        {
            return (this._1554141552tabBtn7);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn8():BasicGlowButton
        {
            return (this._1554141551tabBtn8);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn9():BasicGlowButton
        {
            return (this._1554141550tabBtn9);
        }

        [Bindable(event="propertyChange")]
        public function get lb_festdesc():DescriptionLabel
        {
            return (this._1733959322lb_festdesc);
        }

        public function set getAwardsFromNet(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1197257913getAwardsFromNet;
            if (_local_2 !== _arg_1)
            {
                this._1197257913getAwardsFromNet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "getAwardsFromNet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn6():BasicGlowButton
        {
            return (this._1554141553tabBtn6);
        }

        public function ___GameIntroPanel_BasicGlowButton13_click(_arg_1:MouseEvent):void
        {
            buyPet();
        }

        private function _GameIntroPanel_DataGridColumn31_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn31 = _local_1;
            _local_1.sortable = true;
            _local_1.sortCompareFunction = sortConsumeAwardList;
            _local_1.dataField = "key";
            _local_1.width = 200;
            _local_1.setStyle("fontSize", 12);
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn31", _GameIntroPanel_DataGridColumn31);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get getFestBtn():BasicGlowButton
        {
            return (this._74227366getFestBtn);
        }

        [Bindable(event="propertyChange")]
        public function get trolleyDG():DataGrid
        {
            return (this._529071784trolleyDG);
        }

        [Bindable(event="propertyChange")]
        public function get vb_levelUp():VBox
        {
            return (this._322625876vb_levelUp);
        }

        public function set ti_js(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._110351187ti_js;
            if (_local_2 !== _arg_1)
            {
                this._110351187ti_js = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti_js", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get totalAct():BasicTxtButton
        {
            return (this._849924434totalAct);
        }

        public function set toCar(_arg_1:RoundedButton):void
        {
            var _local_2:Object;
            _local_2 = this._110502745toCar;
            if (_local_2 !== _arg_1)
            {
                this._110502745toCar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toCar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get earnMoneyActiveList():ArrayCollection
        {
            return (this._1142482604earnMoneyActiveList);
        }

        private function set sportActiveList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1858597720sportActiveList;
            if (_local_2 !== _arg_1)
            {
                this._1858597720sportActiveList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sportActiveList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img_fb():Image
        {
            return (this._1185079624img_fb);
        }

        [Bindable(event="propertyChange")]
        private function get activityItemList():ArrayCollection
        {
            return (this._296859264activityItemList);
        }

        private function _GameIntroPanel_XML1_i():XML
        {
            var _local_1:XML;
            _local_1 = <Panel><Node name="Activity"><Activity Name="Mê Trận" linkType="2" resCode="3130090000062" idx="" NID="881" NPC="Hệ Thống" MID="2007" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="120" Description="Người chơi nhấp chọn Icon trên cùng để mở giao diện Mê Trận. Theo truyền thuyết, đây là 1 hang động thần bí được phát hiện tại Mã Thạch Tuyết, bên trong chứa nhiều kho báu giá trị! Tuy nhiên, các cạm bẫy, cơ quan ở đây cũng thuộc loại nguy hiểm nhất Đại Lục. Hãy cẩn thận!" Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200170016','description':'Công trạng'},'2':{'itemId':'-1','iconCode':'4030200180205','description':'Vật Phẩm liên quan đến Thú Cưỡi
Ấn Chương, Nguyên Tố Quả Thực'}}"></Activity><Activity Name="Ma Binh Giáng Thế" linkType="4" resCode="3130090000060" idx="" NID="" NPC="Thiên Đường Thần Thánh" MID="71" LINE="6-7" Time="-1|00:00-23:59" Level="120" Description="Trong thời gian sự kiện, tại |map1| sẽ xuất hiện 1 đám ma binh, người chơi sau khi chuyển sinh có thể đánh bại bọn ma binh này (đề nghị lập nhọm người), sau khi đánh bại chúng sẽ nhận được Nguyên Tố Quả Thực và phần thưởng công trạng. Mọi người hãy có gắng nhé!" Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu'},'2':{'itemId':'-1','iconCode':'4030200170016','description':'Công trạng'},'3':{'itemId':'-1','iconCode':'4030200180205','description':'Nguyên Tố Quả Thực'}}"></Activity><Activity Name="Chiến Trường Dũng Sĩ" linkType="2" resCode="3130090000058" idx="" NID="861" NPC="Hệ Thống" MID="" LINE="Kênh 1" HID="1405" Time="4|21:00-22:00" Level="50" Description="Chiến Trường Dũng Sĩ là sự kiện thi đấu 3v3 giữa những dũng sĩ sức mạnh vô song của Đại Lục Vô Ưu. Phần thưởng sự kiện có thể đến Shop Điểm Thưởng Giác Đấu Đông Huyền Thành(296,160) để nhận. Ngoài ra còn có những danh hiệu vinh danh dũng sĩ xuất sắc, chi tiết có thể nhấn |help1| để xem." Award="{'0':{'itemId':'-1','iconCode':'4030200180041','description':'Đá Tẩy Luyện'}}"></Activity><Activity Name="BOSS Thế Giới" linkType="3" resCode="3130090000037" idx="" NID="" NPC="Hệ Thống" MID="3" LINE="Kênh 3" Time="1,3,5|14:30-15:00" Level="50" Description="Ngày Tận Thế đã gần kề! Một lần nữa tai họa lại ập xuống Đại Lục Vô Ưu, các dũng sĩ cấp độ 50 trở lên hãy mau đến kênh 3 Đăng Vân Địa để tiêu diệt BOSS Thế Giới Hydra!" Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu'},'2':{'itemId':'-1','iconCode':'4030200170016','description':'Chiến tích'},'3':{'itemId':'-1','iconCode':'4030200180205','description':'Vật phẩm phong phú: Thẻ Biến Hình độc đáo
Bảo Thạch, Nội Đơn Nhiên Thiêu'}}"></Activity><Activity Name="Võ Đài Đông Huyền" linkType="1" resCode="3130090000036" idx="" NID="1799" NPC="Vệ Sĩ Gia Tộc" MID="9" LINE="Kênh 7" HID="1404" Time="0|19:00-20:00" Level="50" Description="Từng tốp quái vật lũ lượt xâm nhập vào Đại Lục Vô Ưu, cần phải có năng lực siêu phàm mới có thể tiêu diệt được đám quái vật này. Tộc Trưởng Bối Tư đã chia thành 2 đội quân để quyết đấu cùng bọn chúng, hãy đến |map1| gặp |npc1| để tham gia, thông tin chi tiết nhấn |help1|." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200170015','description':'Kim phiếu'}}"></Activity><Activity Name="Chu Ma Điện" linkType="1" resCode="3130090000035" idx="" NID="1776" NPC="Sứ Giả Ma Điện" MID="61" LINE="7" Time="-1|13:00-14:00" Level="120" Description="Trong thời gian sự kiện, các cư dân có thể đến |map1| gặp |npc1| để tham gia sự kiện. Đánh bại các quái vật trong Chu Ma Điện sẽ nhận được vô số phần thường giá trị." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu'},'2':{'itemId':'-1','iconCode':'4030200180205','description':'Vật phẩm phong phú: các loại Linh Hồn Thạch, Cánh Ánh Sáng, vật phẩm liên quan đến cánh.'}}"></Activity><Activity Name="Cường đạo bang hội" linkType="3" resCode="3130090000033" idx="" NID="949" NPC="Hệ Thống" MID="" LINE="Kênh 2" Time="-1|12:00-22:00" Level="30" Description="Khi có 5 bang hội cấp 3 trở lên trong server, sau một khoảng thời gian nhất định hệ thống sẽ chọn ngẫu nhiên một đám cường đạo quấy phá. Bang hội phải có ít nhất nhóm 3 người mới có thể đánh đuổi được cường đạo. Đánh đuổi thành công sẽ nhận được các phần thưởng cống hiến cho bang hội. Sau 1 giờ vẫn không đánh đuổi được chúng xem như thất bại và bị trừ mất một số tiền." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200170015','description':'Cống hiến bang'}}"></Activity><Activity Name="Đấu trường Pet" linkType="2" resCode="3130090000032" idx="" NID="834" NPC="Hệ Thống" MID="" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="35" Description="rong thời gian sự kiện, người chơi có cấp độ 35 trở lên đều có thể tham gia đấu trường pet liên server. Người chiến thắng có thể nhận được điểm thưởng cho pet và đổi được kinh nghiệm." Award="{'0':{'itemId':'-1','iconCode':'4030200170054','description':'Điểm thưởng đấu pet, có thể dùng để mua
các loại sách kỹ năng siêu cấp'}}"></Activity><Activity Name="Thi câu cá" linkType="1" resCode="3130090000031" idx="" NID="1572" NPC="Sứ Giả Thi Câu Cá" MID="9" LINE="Kênh 1" Time="6|14:00-15:00" Level="50" Description="Trong thời gian sự kiện người chơi có thể đến |map1| gặp |npc1| vào Nơi Thi Câu Cá, phải đổi điểm thưởng thi câu trong thời gian quy định. 3 người có điểm cao nhất sẽ nhận được phần thưởng." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu'},'2':{'itemId':'-1','iconCode':'4030200170016','description':'Danh hiệu câu cá đặc biệt
có thể gia tăng thuộc tính'}}"></Activity><Activity Name="Đoạt bảo kỳ binh" linkType="1" resCode="3130090000006" idx="" NID="47" NPC="Sứ Giả Đoạt Bảo" MID="9" LINE="Kênh 3-7" HID="1403" Time="5|19:00-20:10" Level="40" Description="Trong Đấu Trường Đoạt Bảo có rất nhiều mỏ khoáng trữ lượng lớn, các cổ vật của những dũng sĩ năm xưa còn sót lại cũng rất nhiều, đang chờ đợi người có duyên đến sở hữu. Hiện tại đấu trường đã mở cửa cho các thành viên vào khám phá. Có thể đến |map1| gặp |npc1| để vào. Chi tiết vui lòng nhấn |help1| để biết thêm." Award="{'0':{'itemId':'-1','iconCode':'4030200180205','description':'Các nguyên liệu cao cấp
và pet thần thú, còn có cơ hội
nhận trang bị cam.'}}"></Activity><Activity Name="Đố vui có thưởng" linkType="2" resCode="3130090000002" idx="" NID="825" NPC="Hệ Thống" MID="" LINE="Tất cả kênh" Time="1,3,5|20:00-20:20" Level="10" Description="Trong thời gian sự kiện sẽ tổ chức cuộc thi trả lời câu hỏi trên toàn server, tất cả người chơi online đều có thể đăng ký tham gia, tùy vào số điểm nhận được mà người chơi sẽ nhận được phần thưởng kinh nghiệm tương ứng." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200170016','description':'Phần thưởng thành tựu dành riêng sự kiện.'}}"></Activity><Activity Name="Tiệm thuốc Đông Huyền" linkType="1" resCode="3130090000030" idx="" NID="412" NPC="Tiệm thuốc Bác Sĩ Vương" MID="9" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Ở |map1|, |npc1| cần thêm một số dược liệu quý hiếm cho tiệm thuốc, người chơi cần giúp ông ấy thu thập, sau khi hoàn thành nhiệm vụ sẽ nhận được phần thưởng kinh nghiệm hậu hĩnh. Mỗi ngày có thể làm 2 lần." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'}}"></Activity><Activity Name="Nông trường pháp thuật" linkType="1" esCode="3130090000029" idx="" NID="1263" NPC="Nông Dân" MID="57" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Ở |map1|, |npc1| cần một lượng nông sản, người chơi cần giúp ông ấy trồng thêm một số nông sản, sau khi hoàn thành nhiệm vụ sẽ nhận được phần thưởng kinh nghiệm hậu hĩnh, còn có xác suất nhận được hạt giống quý hiếm và vật phẩm nhuộm. Mỗi ngày có thể làm 2 lần." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180293','description':'Phần thưởng nhuộm màu cho pet và nhân vật'}}"></Activity><Activity Name="Hồ Đông Huyền" linkType="1" resCode="3130090000025" idx="" NID="280" NPC="Tiệm Pet Tôn Lệ" MID="9" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Tại |map1|, |npc1| cần làm đẹp các ao hồ ở Đông Huyền Thành, người chơi cần giúp đỡ thu thập các loại cá cảnh, sau khi hoàn thành nhiệm vụ sẽ nhận được kinh nghiệm và dụng cụ bắt cá. Mỗi ngày có thể làm 2 lần." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'}}"></Activity><Activity Name="Nhiệm vụ 200 vòng" linkType="1" resCode="3130090000001" idx="" NID="48" NPC="Trưởng Lão Quyến Cố" MID="30" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="70" Description="Người chơi có thể đến |map1| gặp |npc1| trả một lượng bạc nhất định (tùy thuộc cấp độ nhân vật) và nhận nhiệm vụ, sau khi hoàn thành sẽ nhận được kinh nghiệm và vật phẩm quý (chẳng hạn như nội đơn pet cao cấp, ma thú yếu quyết cho pet cao cấp). Nếu bỏ cuộc giữa chừng hoặc đã làm xong 200 vòng thì cần chờ 72 giờ sau mới có thể nhận lại." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Các loại nội đơn pet cao cấp và
yếu quyết ma thú cao cấp'}}"></Activity><Activity Name="Nhiệm vụ gia tộc" linkType="-1" resCode="3130090000022" idx="" NID="310,311,312,427,489,639" NPC="Đạo Sư Gia Tộc" MID="" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="20" Description="Giúp Đạo Sư (Chiến Binh:|npc1|, Danh Y:|npc2|, Nhạc Cộng:|npc3|, Thợ Săn:|npc4|, Xạ Thủ:|npc5|, Hiệp Sĩ:|npc6|) hoàn thành các loại nhiệm vụ tìm người, bắt pet, tìm vật, tuần tra để nhận phần thưởng, mỗi ngày có thể hoàn thành 2 vòng (mỗi vòng 10 nhiệm vụ). Khi hoàn thành nhiệm vụ thứ 10 sẽ nhận được Bảo Rương Thần Bí." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Bảo Rương Thần Bí'}}"></Activity><Activity Name="Cây Ước Nguyện" linkType="1" resCode="3130090000027" idx="" NID="387" NPC="Cây Ước Nguyện" MID="34" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="10" Description="Tại vùng đất |map1| tươi đẹp có 1 |npc1| thần kỳ, tương truyền chỉ cần đến đây treo Kết Ước Nguyện lên cây thì sẽ có thể nhận được vật phẩm mà mình mơ ước, cơ hội nhận được vật phẩm, trang bị và pet tùy thuộc vào cách người chơi ước nguyện. Người chơi mỗi ngày có thể ước miễn phí 5 lần. Kết Ước Nguyện có thể nhận được khi đánh quái." Award="{'0':{'itemId':'-1','iconCode':'4030200180205','description':'Các vật phẩm, trang bị,
pet và thần khí quý hiếm'}}"></Activity><Activity Name="Bang hội chiến" linkType="1" resCode="3130090000034" idx="" NID="211,211" NPC="Quản Lý Bang Hội Chiến" MID="9,9" LINE="Kênh 2" HID="0904" Time="4|20:00-21:00" Level="30" Description="Bang hội chiến là hình thức PK theo nhóm được tiến hành sau khi các thành viên của các bang hội đăng ký tham gia và được chia nhóm, từ thứ 2 đến thứ 5 hàng tuần, bang chủ có thể đến kênh 2 |map1| gặp |npc1| để đăng ký tham gia. Đến kênh 2 |map1| gặp |npc1| để vào. Sau khi chiến thắng sẽ nhận được phần thưởng kinh nghiệm và vật phẩm. Nhấn vào |help1| để xem thông tin chi tiết." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm nhân vật và
kinh nghiệm bang'},'1':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu'},'2':{'itemId':'-1','iconCode':'4030200170015','description':'điểm cống hiến bang'},'3':{'itemId':'-1','iconCode':'4030200180205','description':'Thăng Tinh Thạch và
các loại sách kỹ năng, pet thần thú'}}"></Activity><Activity Name="Giác đấu Đông Huyền" linkType="1" resCode="3130090000005" idx="3" NID="1514" NPC="Hướng Dẫn Giác Đấu" MID="9" LINE="Kênh 6" HID="1401" Time="6|20:00-21:00" Level="30" Description="Đấu trường Đông Huyền là sự kiện để người chơi thi đấu với nhau, đặc điểm chính của sự kiện này là hệ thống sẽ tự sắp xếp đối thủ thích hợp cho người chơi, việc này sẽ đảm bảo được tính công bằng khi thi đấu, người chơi ở mọi cấp độ đều có thể tìm thấy niềm vui nơi đây. Đã sẵn sàng rồi chứ? Hãy mau đến |map1| gặp |npc1| để vào. Điểm thưởng và huy chương sau khi nhận được có thể đến Đông Huyền Thành (296,160) gặp Cửa Hàng Điểm Thưởng Giác Đấu để đổi lấy phần thưởng. Nhấn vào |help1| để xem thêm thông tin chi tiết." Award="{'0':{'itemId':'-1','iconCode':'4030200170054','description':'Điểm thưởng giác đấu, huy chương
Có thể dùng để đổi các bảo thạch kháng,
thần khí phụ và cánh ánh sáng.'}}"></Activity><Activity Name="Đấu trường Achilles" linkType="1" resCode="3130090000011" idx="4" NID="1522" NPC="Quản Lý Đấu Liên Server" MID="30" LINE="Kênh 1" HID="1402" Time="5|19:00-22:00" Level="50" Description="Đấu trường Achilles là sự kiện thi đấu liên server, người chơi ở các server khác nhau có thể đến đây so tài với nhau, từ đó nhận được điểm thưởng và Huy chương Achilles. Đã sẵn sàng rồi chứ? Hãy mau đến |map1| gặp |npc1| để vào. Điểm thưởng và huy chương sau khi nhận được có thể đến Đông Huyền Thành (296,160) gặp Cửa Hàng Điểm Thưởng Giác Đấu để đổi lấy phần thưởng. Nhấn vào |help1| để xem thêm thông tin chi tiết." Award="{'0':{'itemId':'-1','iconCode':'4030200170054','description':'Điểm thưởng và huy chương
Có thể dùng để đổi các bảo thạch kháng,
thần khí phụ và cánh ánh sáng.'}}"></Activity><Activity Name="Nhiệm Vụ Trừ Ma" linkType="1" resCode="3130090000007" idx="" NID="3" NPC="Quan Quân Nhu" MID="9" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Có thể đến |map1| gặp |npc1| để nhận nhiệm vụ, mỗi ngày thực hiện 1 vòng nhiệm vụ (1 vòng là 10 nhiệm vụ), mỗi lần hoàn thành nhiệm vụ sẽ có cơ hội nhận thần khí chính, Thâm Hồng Tinh, Hoán Thần Thạch. Hoàn thành 3 nhiệm vụ sẽ có cơ hội nhận Kết Tinh Trí Thạch, dùng để đổi trang bị pet ở Tiệm Pet Tôn Lệ. Hoàn thành nhiệm vụ thứ 5, 10 sẽ nhận được Bảo Rương Thần Bí, hoàn thành nhiệm vụ thứ 10 sẽ nhận được Ấn Chương Bất Khuất, xác suất nhận Ấn Chương Huy Nguyệt." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Trang bị pet, thần khí chính, Thầm Hồng Tinh
Hoán Thần Thạch, Bảo Rương Thần Bí, Ấn Chương Bất Khuất, Ấn Chương Huy Nguyệt'}}"></Activity><Activity Name="Không Gian Đa Chiều" linkType="1" resCode="3130090000019" idx="" NID="1166" NPC="Reck" MID="55" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Có thể đến |map1| gặp |npc1| nhận nhiệm vụ. Điêu Linh Thôn dạo này phát ra một khe năng lượng vô cùng thần bí. Nghe nói bên trong khe năng lượng ấy là vô vàn kỳ trân dị bảo！Reck - Cháu Trai Thôn Trưởng có thể giúp bạn đến không gian kỳ diệu này để thám hiểm, hãy nhớ mang theo vật phẩm ohi hành nhé." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm,'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Phần thưởng'}}"></Activity><Activity Name="Nhiệm Vụ Thần Tu" linkType="1" resCode="3130090000018" idx="" NID="929" NPC="Thành Chủ Quyến Cố" MID="30" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Người chơi có thể tự mình hoặc lập nhóm đến |map1| gặp |npc1| để nhận nhiệm vụ， căn cứ vào chỉ thị hãy tìm và tiêu diệt 72 ma thần của Solomon. Hoàn thành nhiệm vụ sẽ nhận được rất nhiều điểm thần tu." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200160012','description':'Điểm thần tu'},'2':{'itemId':'-1','iconCode':'4030200180205','description':'Kết Tinh Thần Tu'}}"></Activity><Activity Name="Nhiệm Vụ Trị An" linkType="1" resCode="3130090000008" idx="" NID="277" NPC="Trưởng Cận Vệ Đông Huyền" MID="9" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="30" Description="Có thể đến |map1| gặp |npc1| để nhận nhiệm vụ, mỗi thực hiện 1 vòng nhiệm vụ (1 vòng là 10 nhiệm vụ), dựa vào chỉ thị trên Mật Lệnh Hải Tặc để tìm và tiêu diệt quái vật. Sau khi hoàn thành nhiệm vụ, nếu may mắn bạn sẽ nhận được Bản Đồ Kho Báu và Bản Đồ Kho Báu Cao Cấp. Hoàn thành nhiệm vụ thứ 3 sẽ nhận được chiến tích. Hoàn thành nhiệm vụ thứ 5, 10 sẽ nhận được Bảo Rương Thần Bí. Hoàn thành nhiệm vụ thứ 10 còn được nhận Ấn Chương Bất Khuất." Award="{'0':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu, Bạc'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Bản Đồ Kho Báu, Bản Đồ Kho Báu Cao Cấp, Bảo Rương Thần Bí,
Ấn Chương Bất Khuất'}}"></Activity><Activity Name="Luyện Pet" linkType="1" resCode="3130090000025" idx="" NID="280" NPC="Tiệm Pet Tôn Lệ" MID="9" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="50" Description="Tại |map1|, |npc1| đang huấn luyện pet, chỉ cần giúp cô ấy làm 1 số nhiệm vụ, cô ấy sẽ giúp pet của bạn tinh anh hơn. Mỗi ngày có thể làm 1 vòng nhiệm vụ (tương đương 20 nhiệm vụ). Hoàn thành nhiệm vụ 10, 20 sẽ nhận được Bảo Rương Thần Bí." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Bảo Rương Thần Bí'}}"></Activity><Activity Name="Nhiệm Vụ Tu Hành" linkType="1" resCode="3130090000020" idx="" NID="434" NPC="Trưởng Lão Vô Ưu Tộc" MID="4" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="70" Description="Đến |map1| gặp |npc1| để nhận nhiệm vụ. Mỗi ngày có thể làm 1 vòng nhiệm vụ (tương đương 20 nhiệm vụ). Hoàn thành nhiệm vụ 10, 20 sẽ nhận được Bảo Rương Thần Bí." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Bảo Rương Thần Bí'}}"></Activity><Activity Name="Nhiệm Vụ Treo Thưởng" linkType="1" resCode="3130090000021" idx="" NID="568,569" NPC="Bảng Nhiệm Vụ Treo Thưởng" MID="9,10" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="10" Description="Hãy đến |map1| tìm |npc1| và đến |map2| tìm |npc2|, ở đây có rất nhiều nhiệm vụ treo thưởng với độ khó và phần thưởng khác nhau, nếu hoàn thành sẽ nhận được phần thưởng kinh nghiệm hậu hĩnh, hoàn thành các nhiệm vụ cấp 30 trở lên còn có thể nhận được Lệnh Bài Treo Thưởng và nguyên liệu chế tạo. Mỗi ngày có thể làm miễn phí 10 lần, có thể dùng Đông Huyền Lệnh Kỳ để làm mới bảng nhiệm vụ, tối đa có thể làm mới 4 lần." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'}}"></Activity><Activity Name="Truyền thuyết thủ hộ" linkType="1" resCode="3130090000003" idx="" NID="936" NPC="Vệ Sĩ Quyến Cố" MID="30" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="20" Description="Vô Ưu Đại Lục từng là một mảnh đất tràn đầy linh khí, nhưng gần đây do yêu ma xâm nhập mà linh khí nơi đây bị suy giảm, ảnh hưởng đến sự tu luyện của các thành viên. Vì thế, để giúp cho các thành viên mới có thể dễ dàng luyện cấp, trách nhiệm của các thành viên cấp độ cao là phải đánh bại Yêu thú ở các bản đồ. Mỗi ngày có thể đến |map1| gặp |npc1| để nhận 5 lần nhiệm vụ “Khiêu chiến Yêu thú”. Tại mỗi bản đồ hoang dã đều có 1 Yêu thú, đánh bại Yêu thú nơi nào sẽ trở thành Thủ hộ của nơi đó. Cấp độ tối thiểu để khiêu chiến Yêu thú = Cấp độ tối thiểu vào bản đồ + 20, cấp độ tối đa để khiêu chiến Yêu thú = cấp độ tối thiểu vào bản đồ + 40, có thể xem cấp độ tối thiểu vào bản đồ trên bản đồ thế giới. Có thể khiêu chiến 1 người hoặc lập nhóm 2 người. Mỗi khi tiêu diệt Yêu thú đều có xác suất nhận được Linh Hồn Thạch." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Sau khi hoàn thành nhiệm vụ sẽ nhận
các loại Linh Hồn Thạch.'}}"></Activity><Activity Name="Thương Nhân Đạo Cụ" linkType="1" resCode="3130090000017" idx="" NID="411" NPC="Thương Nhân Đạo Cụ" MID="" LINE="Tất cả kênh" Time="-1|00:00-23:59" Level="10" Description="Thương Nhân Đạo Cụ là người có hành tung bất định, thích phiêu dạt khắp nơi, muốn gặp được ông ta không phải là chuyện dễ dàng. Rất nhiều người muốn gặp được ông ấy do ông ta luôn mang theo bên mình rất nhiều bảo thạch quý giá. Chỉ cần gặp được ông ấy, bạn sẽ có thể đổi miễn phí bảo thạch với ông ấy. Gần đây mọi người còn đồn đại ông ấy đang mở một dịch vụ buôn bán mới, đó là dùng vàng mua vật phẩm bán đổi lấy bạc." Award="{'0':{'itemId':'-1','iconCode':'4030200180205','description':'Các loại sách kỹ năng pet,
các loại bảo thạch, còn được tham gia
nhiệm vụ đổi bảo thạch.'}}"></Activity><Activity Name="Bảo Vệ Vô Ưu" linkType="4" resCode="3130090000010" idx="" NID="" NPC="Liên Minh Tà Ác" MID="11,12,13,15,25,32,39" LINE="Kênh 3-5" Time="0,1,2,3,4|19:00-20:00" Level="30" Description="Trong thời gian sự kiện，tại |map1|，|map2|，|map3|，|map4|，|map5|，|map6|，|map7| sẽ xuất hiện 1 đám hải tặc quấy phá. Tiêu diệt được chúng sẽ nhận được'Kinh nghiệm'và nhiều phần thưởng quý." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180205','description':'Có cơ hội nhận Bản Đồ Kho Báu,
Ngũ Sắc Thần Thạch và
nhiều vật phẩm khác'}}"></Activity><Activity Name="Hái nấm và trái cây" linkType="1" resCode="3130090000013" idx="" NID="376" NPC="Nhà Hàng Âu Dương" MID="9" LINE="Kênh 3-5" Time="0,2,4,6|15:00-15:30" Level="20" Description="Sau những trận mưa rào, ở các khu vực màu mỡ như Đông Xuất Vân, Lê Dương Bắc, Lê Dương Đảo... sẽ xuất hiện rất nhiều nấm và trái cây, khi ấy |npc1| ở |map1| sẽ nhờ người giúp đi thu thập, nếu muốn kiếm thêm chút thu nhập thì hãy nhanh đến đó báo danh đi! Có lúc sẽ có bọn cướp đến cướp trái cây và nấm, vì thế nếu muốn yên tâm hái nấm thì trước tiên nên đuổi bọn cướp đi trước, có thể còn có cơ hội nhận được nhiều vật phẩm quý trên người bọn cướp đấy." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200180041','description':'Ngân phiếu'}}"></Activity><Activity Name="Ác Linh Hiện Thế" linkType="4" resCode="3130090000009" idx="" NID="" NPC="Ác Linh" MID="14,14,42" LINE="Kênh 3-5" Time="6|19:00-20:00" Level="50" Description="|map1| luôn là nơi tụ tập của bọn cô hồn dạ quỷ! Các tộc trưởng phải tốn nhiều công sức mỗi năm phong ấn lại nơi này. Nhưng lúc này tại kênh 3, 4, 5 map |map2|, phong ấn bị phá vỡ và bọn chúng đã chạy thoát đến |map3| chuẩn bị làm loạn! Hãy nhanh chóng thu phục chúng." Award="{'0':{'itemId':'-1','iconCode':'4030200180347','description':'Kinh nghiệm'},'1':{'itemId':'-1','iconCode':'4030200020001','description':'Phần thưởng nguyên liệu.'}}"></Activity></Node><Node name="Boss"><Boss Name="Thất Sắc Kê" NID="706" MID="3" LINE="Tất cả kênh" Level="5" Description="Giới thiệu BOSS: Lông đuôi của loại Thất Kê Sắc này có 7 màu sặc sỡ, là loại quái có mức độ nguy hiểm giống như Kê Vương ở Vân Đài.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Thỏ Điên Răng Vổ" NID="707" MID="2" LINE="Tất cả kênh" Level="10" Description="Giới thiệu BOSS: Thỏ Răng Vố vốn là một sinh vật nhỏ bé đáng yêu ở Vô Ưu Đại Lục, nhưng từ khi bị tác động của một sức mạnh thần bí nào đó, chúng ngày càng trở nên điên cuồng, chúng thường tấn công người qua đường một cách hung tợn, dần dần, mọi người gọi chúng là Thỏ Điên.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Trưởng Lão Sơn Quái" NID="708" MID="4" LINE="Tất cả kênh" Level="15" Description="Giới thiệu BOSS: Thật ra loại tiểu quái độc nhãn này không phải là quái vật, chúng vốn là các Tinh Linh Nham Thạch tu hành trong núi, sống thành quần thể trong rừng sâu, mỗi quần thể do một vị trưởng lão dẫn đầu. Loại tinh linh này không thích tấn công, nhưng lại có ý thức mạnh mẽ về lãnh địa, chúng sẽ dồn hết sức tấn công con người nếu họ xâm chiếm lãnh địa của chúng.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ma Vương Bát Giác" NID="709" MID="15" LINE="Tất cả kênh" Level="20" Description="Giới thiệu BOSS: Người thống trị toàn bộ Lê Dương Hồ chính là bộ tộc Bạch Tuộc, tộc trưởng của họ là một con Bạch Tuộc khổng lồ tự xưng là Ma Vương Bát Giác, tên này có dã tâm vô cùng to lớn, hắn không chỉ xưng bá ở Lê Dương Hồ mà còn tuyên bố muốn thống trị thế giới dưới nước ở trên toàn Đại Lục.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Quân Sư Cẩu Đầu" NID="710" MID="40" LINE="Tất cả kênh" Level="20" Description="Giới thiệu BOSS: Nhóm Đạo Tặc Sa Mạc tàn sát bừa bãi ở phía Tây của Vô Ưu Đại Lục, là cơn ác mộng của mọi thương nhân, hai tên Quân Sư Cẩu Đầu của chúng là những kẻ rất biết bày mưu tính kế, chúng đã thống lĩnh nhóm đạo tặc chiếm cứ Thiên Lục Châu duy nhất trên sa mạc.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Gấu Tuyết Tàn Bạo" NID="713" MID="33" LINE="Tất cả kênh" Level="25" Description="Giới thiệu BOSS: Gấu Tuyết Tàn Bạo chính là vương giả trong Lạp Tuyết Địa, lớp da lông dày đã tạo nên khả năng phòng ngự tuyệt vời cho chúng, những cái vuốt sắc bén chính là vũ khí tấn công tạo ra sức sát thương cao nhất.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ốc Giáo Quan" NID="711" MID="17" LINE="Tất cả kênh" Level="30" Description="Giới thiệu BOSS: Tập đoàn Ốc là kẻ bám đuôi bộ tộc Bạch Tuộc tren Lê Dương Hồ, Ốc Giáo Quan lợi dụng ưu thế của lớp vỏ cứng cáp vốn có của ốc để huấn luyện ra nhiều nhóm Cận Vệ giỏi cho Đại Vương Bạch Tuộc.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Cổ Thụ Lão Yêu" NID="712" MID="26" LINE="Tất cả kênh" Level="30" Description="Giới thiệu BOSS: Sống trong rừng cổ thụ ở Quang Bình Nguyên, có một số cổ thụ lâu đời đã hóa thành tinh, nhưng bản tính của những cổ thụ này vốn rất ôn hòa, chỉ khi nào gặp nguy hiểm mới tấn công.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Chiến Thần Sói" NID="714" MID="41" LINE="Tất cả kênh" Level="35" Description="Giới thiệu BOSS: Sói là một sinh vật hung tàn và khát máu, nhưng Sói cũng có nguyên tắc riêng của Sói, chúng tôn thờ sức mạnh, chúng sẽ phục tùng cho sức mạnh lớn hơn chúng, vì vậy phải có một con đứng đầu trong bộ tộc Sói, đây là con sói mạnh mẽ nhất, được gọi là Chiến Thần Sói.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Miêu Vương" NID="716" MID="34" LINE="Tất cả kênh" Level="35" Description="Giới thiệu BOSS: Miêu Vương là một Tinh Linh thoắt ẩn thoắt hiện mà thiên nhiên ban cho Anh Vũ Cảnh, nó rất hiền lành và không xảo trá, khi bạn gặp nguy hiểm, nó sẽ âm thầm giúp đỡ bạn, nhưng khi tính trẻ con trỗi dậy thì nó cũng sẽ lén true chọc bạn đấy.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Nấm Yêu Huyết Hồng" NID="717" MID="27" LINE="Tất cả kênh" Level="40" Description="Giới thiệu BOSS: Đây là loại Nấm Yêu được tạo thành do hấp thụ khí tà ác, toàn thân có màu đỏ rực, độc của nó không có gì so sánh được, nó luôn sử dụng những màu sắc sặc sỡ, bắt mắt để cám dỗ người qua đường để họ trở thành miếng mồi ngon giúp nó tiến hóa.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Hấp Huyết Hoa Yêu" NID="719" MID="34" LINE="Tất cả kênh" Level="40" Description="Giới thiệu BOSS: Loại hoa khổng lồ này vốn không phải là yêu quái, nhưng thức ăn của nó là máu, nó luôn ẩn nấp trong rừng cây để săn bắt những loài động vật nhỏ để sinh sống, do sợ hãi nên con người đã gọi chúng là Hấp Huyết Hoa Yêu.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Gấu Đen" NID="715" MID="27" LINE="Tất cả kênh" Level="45" Description="Giới thiệu BOSS: Gấu Đen là một loại mạnh nhất trong họ Gấu, sức mạnh của nó cao hơn 5 lần so với Gấu Tuyết, nếu bạn không địch lại Gấu Tuyết mà muốn khiêu chiến với Gấu Đen thì chẳng khác nào tự tìm cái chết.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Dạ Xoa Vương" NID="718" MID="8" LINE="Tất cả kênh" Level="45" Description="Giới thiệu BOSS: Dạ Xoa là yêu quái bóng đêm, chúng thường đi loanh quanh khắp nơi trong đêm tối, mỗi khi ăn được thịt người thì chúng rất vui, Dạ Xoa Vương là kẻ duy nhất có hai cánh trong lũ Dạ Xoa, nó có thể bay lên trời cao.
BOSSVật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Thủy Tinh Bào" NID="822" MID="5" LINE="Tất cả kênh" Level="55" Description="Giới thiệu BOSS: Tuy Thủy Tinh Bào sống ở Lê Dương Hồ, nhưng nó không hề lệ thuộc vào Bạch Tuộc Vương, nó là một loại sinh vật sống đan xen giữa động vật và thực vật, sở hữu một sức mạnh không thể tưởng tượng nổi.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Cự Nhân Ma" NID="823" MID="14" LINE="Tất cả kênh" Level="60" Description="Giới thiệu BOSS: Tộc Cự Nhân là Man tộc sinh sống trong sa mạc từ thời viễn cổ đến nay, Cự Nhân Ma là người đứng đầu tộc, chiến tranh và  thảo phạt chính là ý nghĩa cuộc sống của họ.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Hải Tinh Phệ Hồn" NID="824" MID="6" LINE="Tất cả kênh" Level="65" Description="Giới thiệu BOSS: Hải Tinh Phệ Hồn là đại phù thủy của bộ tộc Bạch Tuộc trong Lê Dương Thôn, ma lực phù phép của nó có thể giúp cho các chiến sĩ của đại quân Bạch Tuộc không biết mệt mỏi, không sợ mất mạng để chiến đấu tới cùng.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ác Ma Thượng Cổ" NID="825" MID="42" LINE="Tất cả kênh" Level="70" Description="Giới thiệu BOSS: Vào thời viễn cổ, Thái Thản của tộc người khổng lồ gây ra tội nghiệt và bị đày đến địa ngục, hóa thân thành Ác Ma, nó sở hữu sức mạnh to lớn từ sự căm phẫn đủ để hủy diệt mọi thứ.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ong Cửu Li Kịch Độc" NID="826" MID="16" LINE="Tất cả kênh" Level="75" Description="Giới thiệu BOSS: Ong Cửu Li Kịch Độc được đặt tên dựa vào độc tính của nó, tương truyền rằng chỉ cần bị gai độc của nó làm bị thương thì phải sau thời gian đủ để đi hết 9 dặm đường, độc tính của nó mới phát tác và gây tử vong, trong thời gian đó, cơ thể sẽ phải chịu nhiều giày vò, đau đớn.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Thần Cuồng Bạo" NID="827" MID="35" LINE="Tất cả kênh" Level="75" Description="Giới thiệu BOSS: Vị thần bị ác ma Abate nô dịch và điều khiển, Abate đã cải tạo hắn, giúp hắn có được sức mạnh to lớn, nhưng hắn phải mất đi tất cả lý trí và chỉ nghe lệnh của Abate mà thôi.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ác Hổ Ma Giới" NID="828" MID="28" LINE="Tất cả kênh" Level="80" Description="Giới thiệu BOSS: Đây là nhóm binh sĩ mạnh mẽ dưới trướng của Tử Thần, có hình dạng như hổ nhưng thật ra không phải hổ, hình dạng hổ của chúng được tạo thành bằng cách tập hợp những linh hồn ai oán ở sâu dưới địa ngục, nhưng chúng rất hiếm khí xuất hiện ở thế giới loài người.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Băng Cung Chiến Thần" NID="829" MID="22" LINE="Tất cả kênh" Level="85" Description="Giới thiệu BOSS: Là chiến sĩ có sức chiến đấu mạnh mẽ nhất trong thế giới băng tuyết, toàn thân được bao bọc bởi một lớp băng cứng, tay cầm Búa khổng lồ, là totem tinh thần cho các sinh linh trong thế giới  băng tuyết.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Yêu Quái Ẩn Trúc" NID="1545" MID="7" LINE="Tất cả kênh" Level="90" Description="Giới thiệu BOSS: Là loại Trúc Yêu ẩn thân ở Quân Cổ Đạo, tuy nó có vẻ ốm yếu nhưng lại có sức mạnh tinh thần vô cùng to lớn, nếu không có sự kiên định mạnh mẽ thì sẽ dễ dàng bị nó khống chế.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Cự Ma Ảo Thạch" NID="1546" MID="18" LINE="Tất cả kênh" Level="95" Description="Giới thiệu BOSS: Là loại quái vật khổng lồ sở hữu sức mạnh của trái đất, nó là biểu tượng của thế lực ma quái, trên thế gian hiếm có ai chịu được một đòn tấn công của nó.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ma Cát Chỉ Phong" NID="1547" MID="21" LINE="Tất cả kênh" Level="95" Description="Giới thiệu BOSS: Là loại quái vật kỳ dị sở hữu sức mạnh cuồng phong, nó không có hình dáng cụ thể, lúc ẩn lúc hiện, vì vậy sức phá hủy vật lý của nó không mạnh lắm, có điều sức mạnh ma pháp của nó đủ để làm cho người khác phải khiếp sợ.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Siêu Nhân Gấu Trúc" NID="1548" MID="19" LINE="Tất cả kênh" Level="100" Description="Giới thiệu BOSS: Không ai biết loài gấu trúc đáng yêu này đã đi đến Vô Ưu Đại Lục vào lúc nào, tuy có dáng vẻ ngây thơ, nhưng nó lại được kế thừa võ thuật thần bí của một quốc gia phương Đông nào đó.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Tư Tế Ma Cốc" NID="1549" MID="23" LINE="Tất cả kênh" Level="105" Description="Giới thiệu BOSS: Là Đại Tư Tế duy nhất trên thế gian của Ma Vương Abate, trấn thủ ở sâu bên trong Ma Cốc, hắn luôn nghĩ đủ cách để giải phong ấn cho Abate, vì vậy hắn đã đến trần gian một lần nữa.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="U Hồn Mê Quang" NID="1550" MID="29" LINE="Tất cả kênh" Level="110" Description="Giới thiệu BOSS: Được tạo ra từ năng lượng nguyên tố tích tụ trong Mê Quang Tự, nó có khả năng điều khiển 4 nguyên tố để tạo thành trận pháp bảo vệ bản thân.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Bóng Đen Thủ Hộ" NID="1551" MID="24" LINE="Tất cả kênh" Level="115" Description="Giới thiệu BOSS: Là linh hồn lưu lạc trong chiến trường cổ ở Thủ Hộ Địa, nó không có suy nghĩ và ý thức, chỉ mang đầy ý niệm thù hận và bảo vệ, sẽ tiêu diệt tất cả những ai có ý muốn tiếp cận với nó.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Lôi Nộ Chiến Ma" NID="1552" MID="61" LINE="Tất cả kênh" Level="115" Description="Giới thiệu BOSS: Lôi Nộ Chiến Ma vốn là con người, sau đó được các vị thần chọn làm người phán quyết, ban cho sức mạnh của sấm chớp, trở thành cỗ máy chuyên đi tiêu diệt những kẻ tà ác.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Đoạt Mộng Ma Linh" NID="1553" MID="36" LINE="Tất cả kênh" Level="120" Description="Giới thiệu BOSS: Là quái vật lạ lấy giấc mơ của con người làm thức ăn, chỉ cần đặt chân vào Thần Di Cảnh thì sẽ bị Ma Linh chiếm đoạt, nó chính là nguồn gốc của giấc mơ của con người.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Phệ Quang Dạ Ma" NID="1606" MID="67" LINE="Tất cả kênh" Level="121" Description="Giới thiệu BOSS: Là một loại ma xà xuất hiện ở Vĩnh Dạ Cảng, vô cùng hung ác, sống trong bóng tối, ma lực vô biên làm cho con người khiếp đảm trong bóng tối.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Phù Thủy Thánh Ước" NID="1554" MID="20" LINE="Tất cả kênh" Level="125" Description="Giới thiệu BOSS: Vốn là sứ giả lập khế ước với Thần, sau đó do khát khao sức mạnh ma pháp nên đã đi vào thế giới hắc ám, trở thành phù thủy, sự tồn tại của nó tượng trưng cho sự dung hợp giữa hai thế lực sáng và tối.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Ma Vương Cực Địa" NID="1555" MID="43" LINE="Tất cả kênh" Level="130" Description="Giới thiệu BOSS: Kẻ thống trị Đoạn Cốc, dã tâm của hắn rất lớn, huấn luyện Ma Binh ở Đoạn Cốc, tăng cường thực lực, mưu đồ lật đổ Abate để trở thành Ma Đế mới, thống lĩnh tam giới.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Yêu Quái Mị Hoặc" NID="1556" MID="56" LINE="Tất cả kênh" Level="140" Description="Giới thiệu BOSS: Mị Hoặc Lâm vốn là quê hương của Ảo Thuật Sư, trong một lần xảy ra kiếp nạn, các Ảo Thuật Sư ở trong rừng đã bị vong mạng, các vong hồn cứ lưu lại không chịu tan đi, rồi biến thành yêu quái cứ mãi ẩn dật trong rừng sâu.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Kỵ Sĩ Cơ Giáp" NID="1695" MID="44" LINE="Tất cả kênh" Level="145" Description="Giới thiệu BOSS: Đã từng là kỵ sĩ bảo vệ Vô Ưu nhưng trong đại chiến ác ma, đã bị nhiễm độc ma làm biến chất trái tim người dũng sĩ.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Phản Quân Cổ Thành" NID="1697" MID="37" LINE="Tất cả kênh" Level="150" Description="Giới thiệu BOSS: Mãnh tướng dưới trướng Thành Chủ, được xưng tụng là thần chết Cổ Thành, không biết bao nhiêu dũng sĩ đã chết dưới tay tên thủ ác này.
Vật phẩm rớt: nguyên liệu, bảo thạch, thần khí phụ ..."></Boss><Boss Name="Chiến Thần" NID="182" MID="42" LINE="Kênh 1" Level="60" Description="Giới thiệu BOSS: 1 trong số ngũ đại yêu ma đối đầu với phe chính nghĩa, khi xuất hiện thì toàn thân tỏa ra ngọn lửa yêu ma quái dị, chân tướng thật sự đến nay vẫn chưa ai biết."></Boss><Boss Name="Ma Thần" NID="183" MID="35" LINE="Kênh 1" Level="70" Description="Giới thiệu BOSS: 1 trong số ngũ đại yêu ma đối đầu với phe chính nghĩa, khi xuất hiện thì toàn thân tỏa ra ngọn lửa yêu ma quái dị, chân tướng thật sự đến nay vẫn chưa ai biết."></Boss><Boss Name="Tà Thần" NID="184" MID="22" LINE="Kênh 1" Level="80" Description="Giới thiệu BOSS: 1 trong số ngũ đại yêu ma đối đầu với phe chính nghĩa, khi xuất hiện thì toàn thân tỏa ra ngọn lửa yêu ma quái dị, chân tướng thật sự đến nay vẫn chưa ai biết."></Boss><Boss Name="Tử Thần" NID="185" MID="23" LINE="Kênh 1" Level="90" Description="Giới thiệu BOSS: 1 trong số ngũ đại yêu ma đối đầu với phe chính nghĩa, khi xuất hiện thì toàn thân tỏa ra ngọn lửa yêu ma quái dị, chân tướng thật sự đến nay vẫn chưa ai biết."></Boss><Boss Name="Ác Thần" NID="920" MID="29" LINE="Kênh 1" Level="120" Description="Giới thiệu BOSS: 1 trong số ngũ đại yêu ma đối đầu với phe chính nghĩa, khi xuất hiện thì toàn thân tỏa ra ngọn lửa yêu ma quái dị, chân tướng thật sự đến nay vẫn chưa ai biết."></Boss><Boss Name="Thạch Yêu" NID="923" MID="18" LINE="Kênh 1" Level="90" Description="Giới thiệu BOSS: Quái vật cực mạnh hình thành nhờ hấp thu sức mạnh hắc ám của trời đất, có thân hình cứng như đá và cực kỳ hung hãn, tốt nhất đừng nên chọc giận hắn."></Boss><Boss Name="Bách Thảo Tinh" NID="169" MID="19" LINE="Kênh 1" Level="95" Description="Giới thiệu BOSS: Vua thực vật sinh sống tại Linh Lan, cực mạnh và đầy quyền lực, gần đây hắn đang triệu tập lực lượng để chống lại các gia tộc."></Boss><Boss Name="Phủ Ma" NID="170" MID="21" LINE="Kênh 1" Level="95" Description="Giới thiệu BOSS: Yêu thú hấp thụ sự hắc ám, vẻ ngoài cực kỳ hung ác khiến cho không ai dám đến gần, khi hắn vung chiếc rìu khổng lồ trên tay là lúc Vô Ưu Đại Lục đối diện với đạn nạn."></Boss><Boss Name="Ma Chiến" NID="171" MID="23" LINE="Kênh 1" Level="110" Description="Giới thiệu BOSS: Ma chiến sĩ có thể điều khiển được hiện thực và giấc mơ, tính cách kỳ dị, pháp thuật vô biên."></Boss><Boss Name="Quỷ Vương" NID="918" MID="24" LINE="Kênh 1" Level="120" Description="Giới thiệu BOSS: Yêu ma trong truyền thuyết đã từng hoành hành khắp Vô Ưu Đại Lục mấy trăm năm trước, sau đó bị các dũng sĩ Vô Ưu phong ấn lại. Thời gian trôi qua, phong ấn ngày càng yếu đi, với sức mạnh của mình, hắn đã phá vỡ phong ấn và quay lại quấy phá đại lục."></Boss><Boss Name="Avatar" NID="1132" MID="36" LINE="Kênh 1" Level="130" Description="Giới thiệu BOSS: Sứ giả thần bí từ một thế giới thần bí vượt không gian đến đây, có sức mạnh kỳ lạ và có ý thù địch với cư dân Vô Ưu Đại Lục."></Boss><Boss Name="Atula Vương" NID="1151" MID="20" LINE="Kênh 1" Level="135" Description="Giới thiệu BOSS: Hiếu chiến, khát máu, muốn nuốt chửng tất cả, Atula Vương đại diện cho bóng tối, cho sự độc ác."></Boss><Boss Name="Solomon" NID="1163" MID="56" LINE="Kênh 1" Level="140" Description="Giới thiệu BOSS: Vua ma thần vĩ đại, không chỉ cực mạnh mà còn là kẻ đứng đầu ma giới, lãnh đạo 72 ma thần."></Boss><Boss Name="Mehdi" NID="1747" MID="37" LINE="Kênh 1" Level="150" Description="Giới thiệu BOSS: Đây là con trai của thần Sấm Sét, vì bị thần Hắc Ám đầu độc nên cùng với đứa em trai của mình - thần Sức Mạnh liên kết giết chết cha ruột của mình và sai khiến Solomon hủy diệt Đại Lục Vô Ưu."></Boss><Boss Name="Gấu Siêu Mập" NID="1638" MID="6" LINE="Tất cả kênh" Level="65" Description="Giới thiệu BOSS： Là loại gấu xuất thân từ vùng thảo nguyên xa xôi, dưới trướng của Ma Tinh, có sức mạnh phi thường và khả năng bay lượn.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ...."></Boss><Boss Name="Thầy Tế Lễ" NID="1639" MID="42" LINE="Tất cả kênh" Level="70" Description="Giới thiệu BOSS： Sinh thời là thầy tế ở Vô Ưu, khi chết đi ma tâm oán hờn nhân gian nên thường lởn vởn trên không trung tấn công người khác.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ...."></Boss><Boss Name="Yêu Bướm Mộng Ma" NID="1640" MID="16" LINE="Tất cả kênh" Level="75" Description="Giới thiệu BOSS：Là thuộc hạ của Phong Điệp Cuồng Vũ. Tương truyền mấy ngàn năm trước, đây là biến thân của bươm bướm bị nguyền rủa. Vẻ bề ngoài xinh đẹp nhưng lại là một loại mộng ma đáng sợ.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Băng Thạch Tuyết Thần" NID="1641" MID="35" LINE="Tất cả kênh" Level="80" Description="Giới thiệu BOSS： Là quái vật có sức mạnh Băng Tuyết và Tuyết Nguyên lớn mạnh. Tính tình nóng nảy, thường xuyên tạo sấm sét.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Bá Chủ Bù Nhìn" NID="1642" MID="28" LINE="Tất cả kênh" Level="85" Description="Giới thiệu BOSS： Là bù nhìn được từ sức mạnh thần thánh, có thể cử động linh hoạt, có sức mạnh cực lớn.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Băng Xuyên Thủ Hộ" NID="1643" MID="22" LINE="Tất cả kênh" Level="90" Description="Giới thiệu BOSS： Là người canh giữ trung thành, không ngại khó, tính tình ôn hòa nhưng chỉ cần có người đột nhập vào Tuyết Lâm thì sẽ phải chịu sự trừng phạt khủng khiếp.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Thần Chết" NID="1644" MID="7" LINE="Tất cả kênh" Level="95" Description="Giới thiệu BOSS： Có khả năng làm cho người chết đi sống lại bằng các oán khí của linh hồn. Cho nên nơi đây phủ đầy ám khí.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Tên Tan Sương Mù" NID="1645" MID="18" LINE="Tất cả kênh" Level="97" Description="Giới thiệu BOSS： Là thủ hạ của Abate, cung pháp vượt trội. Những linh hồn trúng phải mũi tên này đều bị tiêu diệt.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Pháp Khí Apollo" NID="1646" MID="21" LINE="Tất cả kênh" Level="100" Description="Giới thiệu BOSS： Là pháp khí ánh sáng của Apollo. Khi rớt xuống trần bị vẩn đục ma khí, dẫn dắt ma linh tạo nên ma lực cực lớn.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Đại Sư Hổ Vô" NID="1647" MID="19" LINE="Tất cả kênh" Level="105" Description="Giới thiệu BOSS： Tồn tại trong không gian thần bí ở Linh Lan. Khi 2 khoảng không giao hòa sẽ xuất hiện không gian hư không.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Thanatos" NID="1648" MID="23" LINE="Tất cả kênh" Level="110" Description="Giới thiệu BOSS： Còn gọi là Vị thần bóng đêm, thích sự tối tăm, kỳ dị, thường hay lấy mạng người khác vào đêm khuya nên được gọi là Thần chết.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Ánh Sáng Thanh Khiết" NID="1649" MID="29" LINE="Tất cả kênh" Level="115" Description="Giới thiệu BOSS： Được biến thân từ vết nứt ánh sáng mê ảo và trở thành quái vật đáng sợ.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Vị Thần Sa Ngã" NID="1650" MID="24" LINE="Tất cả kênh" Level="117" Description="Giới thiệu BOSS： Là vị thần nắm giữ pháp luật tối cáo nhưng bị ma giới quyến rũ lầm đường lạc lối, trở thành sinh vật khát máu đáng sợ.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Thầy Mo Nghịch Pháp" NID="1651" MID="61" LINE="Tất cả kênh" Level="120" Description="Giới thiệu BOSS： Là người canh giữ cổ xưa nhất, do học những ma pháp kỳ quái nên bị đuổi khỏi sư môn. Từ đó hắn hút máu người mà sống, luôn ấp ủ mưu đồ tiêu diệt Vô Ưu。Giới thiệu BOSS： Là người canh giữ cổ xưa nhất, do học những ma pháp kỳ quái nên bị đuổi khỏi sư môn. Từ đó hắn hút máu người mà sống, luôn ấp ủ mưu đồ tiêu diệt Vô Ưu.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Diệt Thần Chi Thủ" NID="1652" MID="36" LINE="Tất cả kênh" Level="125" Description="Giới thiệu BOSS： Là vị thần bị vứt bỏ, oán hận chất chồng, luôn muốn phá hủy mọi thứ. Ngay cả Abate còn phải nể hắn 3 phần.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Nữ Vương Phá Hoại" NID="1656" MID="67" LINE="Tất cả kênh" Level="127" Description="Giới thiệu BOSS： Nữ Vương đã nguyền rủa Vĩnh Dạ Cảng mãi mãi chìm vào bóng tối, phá hoại là sở thích của ả. Thậm chí ả còn lập cả đội quân trên không mưu đồ thôn tính Vô Ưu.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Ma Linh Dị Thú" NID="1653" MID="20" LINE="Tất cả kênh" Level="130" Description="Giới thiệu BOSS： Là pet yêu quý nhất của Atula Vương. Theo truyền thuyết, có một thần thú kỳ dị xuất hiện đại diện cho tội ác, có khả năng chiến đấu trên không
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Ảo Mộng Nữ Yêu" NID="1654" MID="43" LINE="Tất cả kênh" Level="135" Description="Giới thiệu BOSS： Là nữ yêu được sinh ra trong băng tuyết, có năng lực làm người khác thần siêu phách lạc.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="harrell Omnic" NID="1655" MID="56" LINE="Tất cả kênh" Level="140" Description="Giới thiệu BOSS： Là thuộc hạ đắc lực của Solomon, có thể chinh phục được hết các vũ khí ở Vô Ưu Đại Lục.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Cự Ma Thạch Tượng" NID="1694" MID="44" LINE="Tất cả kênh" Level="145" Description="Giới thiệu BOSS: Solomon đã dùng tà khí của mình để truyền vào 1 tảng đá lớn, khiến nó trở nên cứng rắn, đao thương bất nhập. Tính cách của tên yêu quái này vô cùng tàn bạo và hiếu chiến.
Vật phẩm rớt: nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss><Boss Name="Vong Linh Ma Thuẫn" NID="1696" MID="37" LINE="Tất cả kênh" Level="150" Description="Giới thiệu BOSS: Vốn là cánh tay đắc lực của Vua Cổ Thành, nhưng vì hút phải quá nhiều ma khí, cuối cùng sa ngã trở thành linh hồn ác quỷ, quái vật ác độc nhất ở Cổ Thành.
Vật phẩm rớt:nguyên liệu, lông vũ, cánh, thần khí phụ ..."></Boss></Node><Node name="FB"><FB Name="Mê Huyễn Động" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="50" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc|để nhận. Lão yêu quái ở Mê Huyễn Động đã sinh ra nhiều biến dị yêu quái cực mạnh. Đánh bại chúng, Mê Huyễn Động sẽ trở về vẻ thanh bình vốn có."></FB><FB Name="Ảo Ma Tháp" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="60" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc| để nhận. Trong Ảo Ma Tháp có rất nhiều quái vật cực mạnh, những người có năng lực có thể vào đây để thử thách bản thân, từ đó nâng cao tài nghệ."></FB><FB Name="Kho Báu Đại Mạc" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="60" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc| để nhận. Trong kho báu ở Hư Không Mạc từ lâu đã ẩn chứa vô vàn báu vật cũng như các yêu ma nguy hiểm, trải qua nhiều năm, Pharaoh bị phong ấn tại đây cũng dần dần thức tỉnh, mưu đồ thống lĩnh yêu ma làm loạn. Các dũng sĩ hãy mau đến đó thám hiểm 1 phen."></FB><FB Name="Lục Tiên Cảnh" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="80" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc| để nhận. Ẩn sâu trong vùng đất băng giá là một ốc đảo xanh tươi rực rỡ! Đây chính là lời đồn thổi được lan truyền khắp đại lục, nơi đó rốt cuộc ẩn chứa bí mật gì, hãy mau đi tìm hiểu thôi nào."></FB><FB Name="Liệt Diễm Thâm Uyên" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="90" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc| để nhận. Sâu trong Liệt Diễm Thâm Uyên là thế lực ác ma bị phong ấn, gần đây một thế lực đặc biệt đã hóa giải phong ấn, giải thoát cho Ma Vương Abate. Người chơi cần phải vào trong hang, tiêu diệt Ma Vương, ngăn chặn âm mưu xâm chiếm thế giới của hắn."></FB><FB Name="Trở Về Lang Huyệt" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="100" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc| để nhận. Tương truyền sâu trong hang động ở Vân Lộc Sơn có 1 con Sói Phù Thủy và rất nhiều yêu ma tu luyện ngàn năm. Gần đây Sói Phù Thủy tập hợp thuộc hạ làm loạn ở Vân Lộc Sơn, khiến cho người dân lo lắng... Người chơi muốn dẹp loạn cần lập nhóm và hỗ trợ nhau để hoàn thành nhiệm vụ."></FB><FB Name="Quỷ Hút Máu" NID="200" NPC="Sứ Giả Mở Phụ Bản" MID="31" Level="120" resCode="3130090000026" Description="Người chơi có thể đến |map1| gặp |npc| nhận nhiệm vụ. Nơi thâm sâu, u tối nhất của Vĩnh Dạ Cảng là vùng đất ngự trị bởi lũ quỷ hút máu. Chúng không ngừng tìm cách xưng bá Đại Lục Vô Ưu, gieo rắc bện tật. Phải vất vả lắm những thợ săn muỗi dũng cảm mới có thể lần ra sào huyệt của chúng. Ông hy vọng rằng các chiến sĩ có thể giúp ông tiêu diệt tận gốc lũ quỷ độc ác này."></FB></Node><Node name="LevelUp"><LevelUp Name="Đố vui có thưởng" Level="10" NID="" Time="1,3,5|20:00-20:20" Exp="4" Money="0" Hard="2" ResCode="4130220000007" Description="Người chơi cấp 10 trở lên có thể đến gặp |npc1| để tham gia. Trả lời đúng sẽ nhận được điểm thưởng dùng để đổi kinh nghiệm."></LevelUp><LevelUp Name="Tiệm thuốc Đông Huyền" Level="50" NID="412" Time="-1|00:00-23:59" Exp="3" Money="0" Hard="3" ResCode="4130220000004" Description="Người chơi cấp 50 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ thu thập, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm."></LevelUp><LevelUp Name="Hồ Đông Huyền" Level="50" NID="280" Time="-1|00:00-23:59" Exp="3" Money="0" Hard="3" ResCode="4130220000004" Description="Người chơi cấp 50 trở lên có thể đến gặp |npc1| để nhận nhiệm vụ. Hoàn thành nhiệm vụ sẽ nhận được kinh nghiệm."></LevelUp><LevelUp Name="Nông trường pháp thuật" Level="50" NID="1263" Time="-1|00:00-23:59" Exp="3" Money="0" Hard="3" ResCode="4130220000004" Description="Người chơi cấp 50 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ trồng trọt, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm."></LevelUp><LevelUp Name="Nhiệm vụ treo thưởng" Level="10" NID="568,569" Time="-1|00:00-23:59" Exp="4" Money="0" Hard="2" ResCode="4130220000006" Description="Người chơi cấp 10 trở lên mỗi ngày có thể đến Đông Huyền Thành gặp|npc1| hoặc đến Tinh Linh Thành gặp |npc2|nhận nhiệm vụ, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm."></LevelUp><LevelUp Name="Nhiệm vụ gia tộc" Level="20" NID="" Time="-1|00:00-23:59" Exp="3" Money="3" Hard="1" ResCode="4130220000004" Description="Người chơi cấp 20 trở lên có thể đến gặp đạo sư của gia tộc mình để nhận nhiệm vụ. Hoàn thành nhiệm vụ sẽ nhận được kinh nghiệm."></LevelUp><LevelUp Name="Truyền thuyết thủ hộ" Level="20" NID="936" Time="-1|00:00-23:59" Exp="3" Money="0" Hard="3" ResCode="4130220000003" Description="Người chơi cấp 20 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ giết yêu thú, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm, Linh Hồn Thạch."></LevelUp><LevelUp Name="Nhiệm Vụ Trị An" Level="30" NID="277" Time="-1|00:00-23:59" Exp="3" Money="0" Hard="2" ResCode="4130220000009" Description="Người chơi cấp 30 trở lên, mỗi ngày, có thể đến gặp |npc1| để nhận nhiệm vu. Hoàn thành nhiệm vụ sẽ nhận được kinh nghiệm."></LevelUp><LevelUp Name="Nhiệm Vụ Trừ Ma" Level="50" NID="3" Time="-1|00:00-23:59" Exp="3" Money="0" Hard="2" ResCode="4130220000003" Description="Người chơi cấp 50 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ. Sau khi hoàn thành nhiệm vụ sẽ nhận được kinh nghiệm."></LevelUp><LevelUp Name="Nhiệm Vụ Thần Tu" Level="50" NID="929" Time="-1|00:00-23:59" Sx="5" Money="0" Hard="3" ResCode="4130220000001" Description="Người chơi cấp 50 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ. Sau khi hoàn thành nhiệm vụ sẽ nhận được điểm thần tu."></LevelUp><LevelUp Name="Luyện pet" Level="50" NID="280" Time="-1|00:00-23:59" Exp="5" Money="0" Hard="3" ResCode="4130220000012" Description="Người chơi cấp 50 trở lên mỗi ngày có thể đến gặp |npc1| nhận nhiệm vụ. sau khi hoàn thành sẽ nhận được điểm kinh nghiệm pet."></LevelUp><LevelUp Name="Nhiệm vụ tu hành" Level="70" NID="434" Time="-1|00:00-23:59" Exp="4" Money="0" Hard="3" ResCode="4130220000001" Description="Người chơi cấp 70 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm."></LevelUp><LevelUp Name="Nhiệm vụ 200 vòng" Level="70" NID="48" Time="-1|00:00-23:59" Exp="5" Money="0" Hard="5" ResCode="4130220000006" Description="Người chơi cấp 70 trở lên cứ cách 3 ngày có thể đến gặp |npc1| nhận nhiệm vụ liên tục, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm."></LevelUp><LevelUp Name="Ảo Ma Tháp" Level="60" NID="1135" Time="-1|00:00-23:59" Exp="5" Money="0" Hard="4" ResCode="4130220000003" Description="Người chơi cấp 60 trở lên có thể đến gặp |npc1| nhận nhiệm vụ tiêu diệt Ma Ảnh Thủ Hộ, sau khi hoàn thành sẽ nhận được điểm kinh nghiệm."></LevelUp></Node><Node name="EarnMoney"><EarnMoney Name="Hái nấm và trái cây" Level="20" NID="376" MID="9" Time="0,2,4,6|15:00-15:30" Exp="4" Money="4" Hard="1" ResCode="4130220000008" Description="Sau khi sự kiện bắt đầu, người chơi cấp 20 trở lên có thể đến gặp |npc1| để nhận nhiệm vụ thu thập nấm và trái cây, sau khi hoàn thành sẽ nhận được ngân phiếu."></EarnMoney><EarnMoney Name="Nhiệm Vụ Trị An" Level="30" NID="277" MID="9" Time="-1|00:00-23:59" Exp="1" Money="4" Hard="2" ResCode="4130220000009" Description="Người chơi cấp 30 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ. Sau khi hoàn thành nhiệm vụ sẽ nhận được Ngân phiếu và Bạc."></EarnMoney><EarnMoney Name="Thi Câu Cá" Level="50" NID="1572" MID="9" Time="6|14:00-15:00" Exp="3" Money="3" Hard="1" ResCode="4130220000008" Description="Người chơi cấp 50 trong thời gian sự kiện ngoài việc câu cá bình thường có thể câu được những loại cá đặc biệt, sử dụng chúng sẽ nhận được ngân phiếu."></EarnMoney></Node><Node name="Treasure"><Treasure Name="Thương nhân đạo cụ" Level="10" NID="" MID="" Time="-1|00:00-23:59" Quality="4" Exp="0" Hard="3" ResCode="4130220000006" Description="Thương Nhân Đạo Cụ cứ cách một khoảng thời gian sẽ xuất hiện ở các bản đồ hoang dã, có thể gặp ông ấy để đổi bảo thạch cần thiết hoặc dùng bạc để mua 1 số vật phẩm vốn chỉ bán trên shop."></Treasure><Treasure Name="Cây Ước Nguyện" Level="10" NID="387" MID="34" Time="-1|00:00-23:59" Quality="5" Exp="0" Hard="1" ResCode="4130220000010" Description="Người chơi có thể đến chỗ |npc1| và dùng các hình thức ước nguyện để nhận được các thần khí chính cao cấp, Ma Thú Yếu Quyết, các công thức kỹ năng sinh hoạt..."></Treasure><Treasure Name="Bảo Vệ Vô Ưu" Level="30" NID="" MID="11,12,13,15,25,32,39" Time="0,1,2,3,4|19:00-20:00" Quality="4" Exp="3" Hard="4" ResCode="4130220000009" Description="Trong thời gian sự kiện，tại |map1|，|map2|，|map3|，|map4|，|map5|，|map6|，|map7| sẽ xuất hiện 1 đám hải tặc quấy phá. Tiêu diệt được chúng sẽ nhận được'Kinh nghiệm'và nhiều phần thưởng quý."></Treasure><Treasure Name="Nhiệm Vụ Trừ Ma" Level="50" NID="3" MID="10,31,38" Time="-1|00:00-23:59" Quality="4" Exp="2" Hard="4" ResCode="4130220000003" Description="Người chơi cấp 50 trở lên mỗi ngày có thể đến gặp |npc1| để nhận nhiệm vụ. Hoàn thành nhiệm vụ có cơ họi nhận Kết Tinh Trí Thạch dùng để đổi lấy trang bị pet."></Treasure><Treasure Name="Không Gian Đa Chiều" Level="50" NID="1166" MID="55" Time="-1|00:00-23:59" Quality="3" Exp="1" Hard="3" ResCode="4130220000005" Description="Người chơi có thể đến |map1| gặp |npc1| để nhận nhiệm vụ. Ở gần Điêu Linh Thôn có 1 hang động sâu hun hút, bên trong có rất nhiều quái vật bay lượn kỳ dị, đánh bại chúng sẽ nhận được các bảo thạch thần kỳ, chỉ cần mang theo 1 tấm bản đồ đặc biệt là có thể bay vào đó thám hiểm. Nhớ là phải có vật phẩm bay thì mới có thể đấu với các quái vật bay lượn."></Treasure><Treasure Name="Ác Linh Hiện Thế" Level="50" NID="" MID="14,42" Time="5|15:00-16:00#6|19:00-20:00" Quality="3" Exp="3" Hard="4" ResCode="4130220000001" Description="Khi sự kiện bắt đầu, người chơi cấp 50 trở lên có thể tìm tiêu diệt ác linh tại |map1| và |map2|, kênh 3 4 5. Sau khi hoàn thành nhiệm vụ sẽ nhận được nhiều phần thưởng."></Treasure><Treasure Name="Nhiệm Vụ 200 vòng" Level="70" NID="48" MID="" Time="-1|00:00-23:59" Quality="5" Exp="5" Hard="5" ResCode="4130220000006" Description="Người chơi cấp 70 trở lên, cứ cách 3 ngày thì có thể đến gặp |npc1| để nhận chuỗi nhiệm vụ, sau khi hoàn thành sẽ nhận được kinh nghiệm, có xác suất nhận được nguyên liệu cao cấp, bảo thạch và Ma Thú Yếu Quyết."></Treasure></Node><Node name="Sports"><Sports Name="Đấu Trường Pet" Level="35" NID="" MID="" Time="-1|00:00-23:59" Quality="0" Exp="0" Hard="3" ResCode="4130220000002" Description="Người chơi cấp 35, sau khi ấn nút [Đấu Pet] để tiến hành báo danh tham gia thi đấu trong tuần đó. Nếu pet của bạn thắng có thể đem điểm thưởng nhận được đến Đông Huyền Thành tọa độ(296,160)để đổi phần thưởng."></Sports><Sports Name="Bang Hội Chiến" Level="30" NID="211,211" MID="9,9" Time="4|20:00-21:00" Quality="0" Exp="0" Hard="3" ResCode="4130220000002" Description="Sau khi sự kiện bắt đầu, người chơi cấp 30 trở lên có thể đến kênh 2 tại |map1| và gặp |npc1| để vào."></Sports><Sports Name="Đoạt Bảo Kỳ Binh" Level="40" NID="47" MID="9" Time="5|19:00-20:10" Quality="0" Exp="0" Hard="4" ResCode="4130220000002" Description="Sau khi sự kiện bắt đầu, người chơi cấp 40 trở lên có thể đến |map1| và gặp |npc1| để đăng ký tham gia đấu trường đoạt bảo. Nếu thắng lợi sẽ có quyền đào kho báu trong đấu trường."></Sports><Sports Name="Giác Đấu Đông Huyền" Level="30" NID="1514" MID="9" Time="6|20:00-21:00" Quality="0" Exp="0" Hard="4" ResCode="4130220000002" Description="Sau khi sự kiện bắt đầu, người chơi cấp 30 trở lên có thể đến kênh 6 tại |map1| và gặp |npc1| để vào đấu trường. Sau khi thắng lợi sẽ được nhận điểm thưởng và huy chương, có thể đến Cửa hàng điểm thưởng đấu trường (296,160) ở Đông Huyền Thành để đổi phần thưởng."></Sports><Sports Name="Đấu Trường Achilles" Level="50" NID="1522" MID="30" Time="5|19:00-22:00" Quality="0" Exp="0" Hard="5" ResCode="4130220000002" Description="Sau khi sự kiện bắt đầu, người chơi cấp 50 trở lên có thể đến kênh 1 tại |map1| và gặp |npc1| để vào đấu trường liên server. Sau khi thắng lợi sẽ được nhận điểm thưởng và huy chương, có thể đến Shop điểm thưởng giác đấu (296,160) ở Đông Huyền Thành để đổi phần thưởng."></Sports><Sports Name="Chiến Trường Dũng Sĩ" Level="50" NID="" MID="" Time="4|21:00-22:00" Quality="0" Exp="0" Hard="5" ResCode="4130220000002" Description="Người chơi cấp 50 trở lên, sau khi sự kiện bắt đầu, đến kênh 1 và nhấp vào biểu tượng Chiến Trường Dũng Sĩ để vào chiến trường. Sau khi thi đấu thành công sẽ nhận được huy chương dùng để đổi phần thưởng ở Shop Điểm Thưởng Giác Đấu Đông Huyền Thành (296,160)."></Sports></Node></Panel>
            ;
            xmlActivity = _local_1;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn5():BasicGlowButton
        {
            return (this._1554141554tabBtn5);
        }

        [Bindable(event="propertyChange")]
        public function get vs():ViewStack
        {
            return (this._3773vs);
        }

        public function __getGiftBtn_click(_arg_1:MouseEvent):void
        {
            getLoginGift();
        }

        private function _GameIntroPanel_DataGridColumn8_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn8 = _local_1;
            _local_1.width = 120;
            _local_1.dataField = "map";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn8", _GameIntroPanel_DataGridColumn8);
            return (_local_1);
        }

        private function _GameIntroPanel_ClassFactory8_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function set levelUpActiveList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._808640669levelUpActiveList;
            if (_local_2 !== _arg_1)
            {
                this._808640669levelUpActiveList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelUpActiveList", _local_2, _arg_1));
            };
        }

        public function onGetPoint(_arg_1:Object):void
        {
            var _local_5:*;
            var _local_6:SortField;
            var _local_7:Sort;
            var _local_8:Object;
            var _local_9:Object;
            var _local_10:String;
            var _local_11:Object;
            var _local_2:ArrayCollection = new ArrayCollection();
            var _local_3:Date = new Date();
            var _local_4:Number = (_local_3.getTime() / 1000);
            for (_local_5 in _arg_1)
            {
                _local_8 = _arg_1[_local_5];
                if (_local_8.itemId != undefined)
                {
                    if (_local_5 == "firstTime")
                    {
                        _local_9 = {
                            "id":0,
                            "key":"",
                            "value":"",
                            "type":"",
                            "itemId":"",
                            "timeRange":"",
                            "start":0,
                            "q":0,
                            "binded":1
                        };
                        _local_9.id = 0;
                        if (_local_8.j == 0)
                        {
                            _local_9.key = Language.ACTIVEPANEL_S[32].toString().replace("{pointList_i}", _local_8.i);
                        }
                        else
                        {
                            _local_10 = Language.ACTIVEPANEL_S[33].toString();
                            _local_10 = _local_10.replace("{pointList_i}", _local_8.i);
                            _local_10 = _local_10.replace("{pointList_j}", _local_8.j);
                            _local_9.key = _local_10;
                        };
                        _local_9.value = GameData.d[_local_8.itemType][_local_8.itemId].name;
                        _local_9.type = _local_8.itemType;
                        _local_9.itemId = _local_8.itemId;
                        if (((!(_local_8.start == undefined)) || (!(_local_8.start == 0))))
                        {
                            _local_9.start = _local_8.start;
                            if (_local_8.start != 0)
                            {
                                _local_9.timeRange = ((((Language.SYSTEMSHOPPANEL_U[53] + dateFormatter(_local_9.start)) + " ") + Language.SYSTEMSHOPPANEL_U[51]) + ((_local_8.end) ? dateFormatter(_local_8.end) : Language.SYSTEMSHOPPANEL_U[54]));
                            };
                        }
                        else
                        {
                            _local_9.timeRange = Language.SYSTEMSHOPPANEL_U[52];
                        };
                        _local_9.q = _local_8.quality;
                        _local_2.addItem(_local_9);
                    }
                    else
                    {
                        if (((((_local_8.start == undefined) || (_local_8.end == undefined)) || ((_local_8.start == 0) && (_local_8.end == 0))) || ((_local_4 >= Number(_local_8.start)) && ((_local_4 <= Number(_local_8.end)) || (_local_8.end == 0)))))
                        {
                            _local_11 = {
                                "id":0,
                                "key":"",
                                "value":"",
                                "type":"",
                                "itemId":"",
                                "timeRange":"",
                                "start":0,
                                "q":0,
                                "binded":1,
                                "group":0
                            };
                            _local_11.id = int(_local_5);
                            _local_11.key = _local_8.i;
                            _local_11.value = GameData.d[_local_8.itemType][_local_8.itemId].name;
                            _local_11.type = _local_8.itemType;
                            _local_11.itemId = _local_8.itemId;
                            _local_11.binded = _local_8.binded;
                            _local_11.start = _local_8.start;
                            if (_local_8.group)
                            {
                                _local_11.group = _local_8.group;
                            };
                            if (_local_8.start)
                            {
                                _local_11.timeRange = ((((Language.SYSTEMSHOPPANEL_U[53] + dateFormatter(_local_11.start)) + " ") + Language.SYSTEMSHOPPANEL_U[51]) + ((_local_8.end) ? dateFormatter(_local_8.end) : Language.SYSTEMSHOPPANEL_U[54]));
                            }
                            else
                            {
                                _local_11.timeRange = Language.SYSTEMSHOPPANEL_U[52];
                            };
                            _local_11.q = _local_8.quality;
                            _local_2.addItem(_local_11);
                        };
                    };
                };
            };
            points = _local_2;
            _local_6 = new SortField();
            _local_6.name = "id";
            _local_7 = new Sort();
            _local_7.fields = [_local_6];
            _local_6.numeric = true;
            points.sort = _local_7;
            points.refresh();
            itemShow();
        }

        private function openShopTrolley():void
        {
            var _local_1:Object;
            _local_1 = _core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP_TROLLEY);
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

        public function __List_fl_change(_arg_1:ListEvent):void
        {
            flTabBtnClick(List_fl.selectedIndex);
        }

        public function ___GameIntroPanel_Canvas23_show(_arg_1:FlexEvent):void
        {
            initCash();
        }

        public function __selectB_click(_arg_1:MouseEvent):void
        {
            itemShow(1);
        }

        public function __actBtn3_click(_arg_1:MouseEvent):void
        {
            getActAward(_arg_1);
        }

        private function set fbList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object;
            _local_2 = this._1281920134fbList;
            if (_local_2 !== _arg_1)
            {
                this._1281920134fbList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fbList", _local_2, _arg_1));
            };
        }

        public function set systemInfo(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._642554749systemInfo;
            if (_local_2 !== _arg_1)
            {
                this._642554749systemInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "systemInfo", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get DiscountSlot():ItemSlot
        {
            return (this._713858815DiscountSlot);
        }

        [Bindable(event="propertyChange")]
        private function get diaryList():ArrayCollection
        {
            return (this._1521020673diaryList);
        }

        public function onGetConsume(_arg_1:Object):*
        {
            var _local_2:Date = new Date();
            var _local_3:Number = (_local_2.getTime() / 1000);
            var _local_4:* = "";
            if (_arg_1)
            {
                if (((_arg_1.startTime) && (_arg_1.endTime)))
                {
                    if (_local_3 < _arg_1.startTime)
                    {
                        _local_4 = Language.SYSTEMSHOPPANEL_U[57];
                    }
                    else
                    {
                        if (_local_3 > _arg_1.endTime)
                        {
                            _local_4 = Language.SYSTEMSHOPPANEL_U[58];
                        }
                        else
                        {
                            _local_4 = Language.ACTIVEPANEL_S[60].replace("{start}", dateFormatter2(_arg_1.startTime));
                            _local_4 = _local_4.replace("{end}", dateFormatter2(_arg_1.endTime));
                            _local_4 = _local_4.replace("{money}", Math.abs(Number(_arg_1.gold)));
                        };
                    };
                };
            };
        }

        public function ___GameIntroPanel_Canvas37_hide(_arg_1:FlexEvent):void
        {
            closeTimer();
        }

        public function set ti_ll(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._110351242ti_ll;
            if (_local_2 !== _arg_1)
            {
                this._110351242ti_ll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti_ll", _local_2, _arg_1));
            };
        }

        public function __getConsumeAwardBtn2_click(_arg_1:MouseEvent):void
        {
            getStageConsumeAward(2);
        }

        [Bindable(event="propertyChange")]
        public function get elementImg():Image
        {
            return (this._575917863elementImg);
        }

        [Bindable(event="propertyChange")]
        public function get consumeActivity():DataGrid
        {
            return (this._804284629consumeActivity);
        }

        [Bindable(event="propertyChange")]
        public function get selectBCar():RoundedButton
        {
            return (this._1656529106selectBCar);
        }

        [Bindable(event="propertyChange")]
        public function get currentFestTxt():DescriptionLabel
        {
            return (this._1742477111currentFestTxt);
        }

        public function __DG_boss_itemClick(_arg_1:ListEvent):void
        {
            onBossItemClickHandler(_arg_1);
        }

        public function tabBtnClick(_arg_1:int):void
        {
            vs.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 < 11)
            {
                this[("tabBtn" + _local_2)].selected = false;
                _local_2++;
            };
            this[("tabBtn" + _arg_1)].selected = true;
            initVBox(_arg_1);
        }

        public function updateDiaryData(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            var _local_4:Object;
            var _local_5:Boolean;
            if (!initialized)
            {
                return;
            };
            if (_arg_1)
            {
                _local_4 = _core.data.gameData[GamePredef.TBL_DIARY];
                _local_5 = false;
                if ((((_local_4[_arg_1]) && (_local_4[_arg_1].hasOwnProperty("_num"))) && (!(_local_4[_arg_1]._num == _arg_2))))
                {
                    _local_4[_arg_1]._num = _arg_2;
                    if (_local_4[_arg_1].max > 0)
                    {
                        _local_4[_arg_1]._numStr = ((_local_4[_arg_1]._num + "/") + _local_4[_arg_1].max);
                    }
                    else
                    {
                        _local_4[_arg_1]._numStr = ((_local_4[_arg_1]._num + "/") + Language.GAMEINTROPANEL_U[41]);
                    };
                    if (_local_4[_arg_1]._num == _local_4[_arg_1].max)
                    {
                        _local_4[_arg_1]._st = 1;
                        _local_5 = true;
                    };
                };
                if (_local_5)
                {
                    diaryList.sort = _sortForDiary;
                    diaryList.refresh();
                };
                DG_diary.dataProvider = diaryList;
            };
            if (ToolKit.isBigOrEqual(_arg_3, 0))
            {
                totalAct.text = _arg_3.toString();
            };
        }

        [Bindable(event="propertyChange")]
        public function get idTimerText():BasicTxtButton
        {
            return (this._115591369idTimerText);
        }

        private function _GameIntroPanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn6 = _local_1;
            _local_1.width = 70;
            _local_1.dataField = "name";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn6", _GameIntroPanel_DataGridColumn6);
            return (_local_1);
        }

        public function set ta_festDesc(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._438810531ta_festDesc;
            if (_local_2 !== _arg_1)
            {
                this._438810531ta_festDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ta_festDesc", _local_2, _arg_1));
            };
        }

        public function set ti_mj(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._110351271ti_mj;
            if (_local_2 !== _arg_1)
            {
                this._110351271ti_mj = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ti_mj", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GAMEINTROPANEL_U[0];
            _local_1 = Language.GAMEINTROPANEL_U[1];
            _local_1 = Language.GAMEINTROPANEL_U[2];
            _local_1 = Language.GAMEINTROPANEL_U[3];
            _local_1 = Language.GAMEINTROPANEL_U[4];
            _local_1 = Language.GAMEINTROPANEL_U[24];
            _local_1 = Language.GAMEINTROPANEL_U[28];
            _local_1 = Language.GAMEINTROPANEL_U[5];
            _local_1 = Language.GAMEINTROPANEL_U[6];
            _local_1 = Language.GAMEINTROPANEL_U[8];
            _local_1 = Language.GAMEINTROPANEL_U[31];
            _local_1 = Language.GAMEINTROPANEL_U[42];
            _local_1 = Language.GAMEINTROPANEL_U[9];
            _local_1 = Language.GAMEINTROPANEL_U[10];
            _local_1 = Language.ACTIVEPANEL_S[27];
            _local_1 = Language.ACTIVEPANEL_S[28];
            _local_1 = Language.ACTIVEPANEL_S[29];
            _local_1 = Language.ACTIVEPANEL_S[52];
            _local_1 = Language.ACTIVEPANEL_S[30];
            _local_1 = activityDescription;
            _local_1 = petItemList;
            _local_1 = Language.PETPANEL_U[12];
            _local_1 = Language.PETPANEL_U[13];
            _local_1 = Language.PETPANEL_U[14];
            _local_1 = Language.PETPANEL_U[15];
            _local_1 = Language.PETPANEL_U[16];
            _local_1 = ResManager.PET_PENTAGON;
            _local_1 = Language.CHARSELECTCANVAS_U[17];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[18];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[19];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[20];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.CHARSELECTCANVAS_U[21];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
            _local_1 = Language.GAMEINTROPANEL_U[25];
            _local_1 = Language.GAMEINTROPANEL_S[0];
            _local_1 = Language.ACTIVEPANEL_U[1];
            _local_1 = Language.ACTIVEPANEL_U[2];
            _local_1 = Language.GAMEINTROPANEL_U[11];
            _local_1 = Language.GAMEINTROPANEL_U[12];
            _local_1 = Language.GAMEINTROPANEL_U[14];
            _local_1 = Language.GAMEINTROPANEL_U[15];
            _local_1 = Language.GAMEINTROPANEL_U[11];
            _local_1 = Language.GAMEINTROPANEL_U[12];
            _local_1 = Language.GAMEINTROPANEL_U[13];
            _local_1 = Language.GAMEINTROPANEL_U[14];
            _local_1 = Language.GAMEINTROPANEL_U[29];
            _local_1 = Language.GAMEINTROPANEL_U[30];
            _local_1 = flListItemArr;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_U[4];
            _local_1 = Language.ACTIVEPANEL_U[4];
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_S[9];
            _local_1 = Language.ACTIVEPANEL_S[10];
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = GamePredef.TBL_ITEM_TEMPLATE;
            _local_1 = Language.ACTIVEPANEL_S[11];
            _local_1 = Language.ACTIVEPANEL_S[12];
            _local_1 = Language.ACTIVEPANEL_S[13].toString().replace("{continueDay}", continueDay);
            _local_1 = Language.ACTIVEPANEL_S[14].toString().replace("{nextConti}", nextConti);
            _local_1 = Language.ACTIVEPANEL_S[15];
            _local_1 = Language.ACTIVEPANEL_U[16];
            _local_1 = Language.ACTIVEPANEL_U[17];
            _local_1 = Language.ACTIVEPANEL_U[18];
            _local_1 = Language.ACTIVEPANEL_U[19];
            _local_1 = Language.AWARDALL_S[3];
            _local_1 = Language.AWARDALL_S[3];
            _local_1 = Language.SYSTEMSHOPPANEL_S[14];
            _local_1 = Language.AWARDALL_S[3];
            _local_1 = Language.AWARDALL_S[0];
            _local_1 = Language.AWARDALL_S[1];
            _local_1 = Language.AWARDALL_S[2];
            _local_1 = Language.ACTIVEPANEL_S[34];
            _local_1 = Language.ACTIVEPANEL_S[35];
            _local_1 = Language.ACTIVEPANEL_S[55];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = Language.ACTIVEPANEL_S[59];
            _local_1 = Language.ACTIVEPANEL_S[69];
            _local_1 = Language.ACTIVEPANEL_S[58];
            _local_1 = Language.ACTIVEPANEL_S[78];
            _local_1 = Language.ACTIVEPANEL_S[79];
            _local_1 = Language.ACTIVEPANEL_S[37];
            _local_1 = Language.ACTIVEPANEL_S[39];
            _local_1 = Language.ACTIVEPANEL_S[55];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = Language.ACTIVEPANEL_S[59];
            _local_1 = Language.ACTIVEPANEL_S[78];
            _local_1 = Language.ACTIVEPANEL_S[79];
            _local_1 = Language.SYSTEMSHOPPANEL_U[25];
            _local_1 = Language.ACTIVEPANEL_S[70];
            _local_1 = Language.ACTIVEPANEL_S[58];
            _local_1 = Language.ACTIVEPANEL_S[61];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_U[48];
            _local_1 = Language.ACTIVEPANEL_U[49];
            _local_1 = Language.ACTIVEPANEL_U[50];
            _local_1 = Language.ACTIVEPANEL_U[51];
            _local_1 = Language.ACTIVEPANEL_U[52];
            _local_1 = Language.ACTIVEPANEL_U[53];
            _local_1 = Language.ACTIVEPANEL_S[61];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg0;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_S[61];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg1;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_S[61];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg2;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_S[61];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg3;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_S[61];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg4;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = Language.ACTIVEPANEL_S[36];
            _local_1 = consumeAcMsg5;
            _local_1 = Language.ACTIVEPANEL_U[3];
            _local_1 = diaryList;
            _local_1 = Language.GAMEINTROPANEL_U[32];
            _local_1 = Language.GAMEINTROPANEL_U[34];
            _local_1 = Language.GAMEINTROPANEL_U[33];
            _local_1 = Language.GAMEINTROPANEL_U[39];
            _local_1 = Language.GAMEINTROPANEL_U[36];
            _local_1 = Language.GAMEINTROPANEL_U[43];
            _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 30);
            _local_1 = Language.GAMEINTROPANEL_U[38];
            _local_1 = ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 30));
            _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 60);
            _local_1 = Language.GAMEINTROPANEL_U[38];
            _local_1 = ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 60));
            _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 120);
            _local_1 = Language.GAMEINTROPANEL_U[38];
            _local_1 = ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 120));
            _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 210);
            _local_1 = Language.GAMEINTROPANEL_U[38];
            _local_1 = ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 210));
            _local_1 = Language.GAMEINTROPANEL_U[37].replace("{num}", 360);
            _local_1 = Language.GAMEINTROPANEL_U[38];
            _local_1 = ((_haveDiaryAwarded) ? false : (Number(totalAct.text) >= 360));
            _local_1 = Language.GAMEINTROPANEL_U[40];
            _local_1 = Language.GAMEINTROPANEL_U[46];
            _local_1 = Language.GAMEINTROPANEL_U[47];
        }

        private function _GameIntroPanel_ClassFactory15_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = GameIntroPanel_inlineComponent6;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _GameIntroPanel_ClassFactory6_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        private function levelSortCompareFunction2(_arg_1:Object, _arg_2:Object):int
        {
            var _local_3:RegExp = /\d+/;
            var _local_4:Number = Number(_local_3.exec(_arg_1.level)[0]);
            var _local_5:Number = Number(_local_3.exec(_arg_2.level)[0]);
            if (_local_4 > _local_5)
            {
                return (-1);
            };
            if (_local_4 == _local_5)
            {
                return (0);
            };
            return (1);
        }

        public function __getAwardsByCode_click(_arg_1:MouseEvent):void
        {
            take();
        }

        [Bindable(event="propertyChange")]
        private function get levelUpActiveList():ArrayCollection
        {
            return (this._808640669levelUpActiveList);
        }

        public function set dailySlot(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1198028873dailySlot;
            if (_local_2 !== _arg_1)
            {
                this._1198028873dailySlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dailySlot", _local_2, _arg_1));
            };
        }

        public function getConsumeAwardList(_arg_1:Object, _arg_2:int):*
        {
            var _local_4:*;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:String;
            var _local_3:ArrayCollection = new ArrayCollection();
            if ((((_arg_1) && (_arg_1[0])) && (_arg_1[0].start)))
            {
                for (_local_4 in _arg_1)
                {
                    _local_5 = _arg_1[_local_4];
                    _local_6 = new Object();
                    _local_6.id = int(_local_4);
                    if (_local_5.j <= 0)
                    {
                        _local_6.key = (Language.SYSTEMSHOPPANEL_U[56] + _local_5.i);
                    }
                    else
                    {
                        _local_6.key = ((((_local_5.i + "<=") + Language.SYSTEMSHOPPANEL_U[55]) + "<=") + _local_5.j);
                    };
                    _local_6.start = Number(_local_5.start);
                    _local_6.end = Number(_local_5.end);
                    _local_6.array = _local_5.award;
                    _local_6.point = _local_5.point;
                    _local_6.i = int(_local_5.i);
                    _local_3.addItem(_local_6);
                };
                if (((_arg_1[0].start) && (_arg_1[0].end)))
                {
                    _local_7 = Language.ACTIVEPANEL_S[60].replace("{start}", dateFormatter2(_arg_1[0].start));
                    _local_7 = _local_7.replace("{end}", dateFormatter2(_arg_1[0].end));
                    _local_7 = _local_7.replace("{money}", _arg_2);
                    _local_7 = (_local_7 + Language.ACTIVEPANEL_S[62]);
                    consumeAcMsg = _local_7;
                    consumeActDate.text = consumeAcMsg;
                }
                else
                {
                    consumeActDate.text = (Language.SYSTEMSHOPPANEL_U[52] + Language.ACTIVEPANEL_S[62]);
                };
            };
            consumeActivity.dataProvider = _local_3;
        }

        public function set consumeActDate(_arg_1:IntroText):void
        {
            var _local_2:Object;
            _local_2 = this._719803452consumeActDate;
            if (_local_2 !== _arg_1)
            {
                this._719803452consumeActDate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeActDate", _local_2, _arg_1));
            };
        }

        private function onBuyConti(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                contiSlot.giid = 0;
                getContiBtn.enabled = false;
            };
        }

        public function set TA_fb(_arg_1:LinkTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._79606734TA_fb;
            if (_local_2 !== _arg_1)
            {
                this._79606734TA_fb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "TA_fb", _local_2, _arg_1));
            };
        }

        public function ___GameIntroPanel_Canvas39_creationComplete(_arg_1:FlexEvent):void
        {
            setAwardSlotColr();
        }

        public function __Btn_AllFest_click(_arg_1:MouseEvent):void
        {
            navigateToURL(new URLRequest(GamePredef.SERVER_ADD_FESTIVAL), "_blank");
        }

        private function doBuyDiscountGift(result:Boolean):void
        {
            var bagpanel:Object;
            var shopSlot:Object;
            var i:int;
            var func:Function;
            var item:Object;
            var showString:String;
            if (result)
            {
                bagpanel = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((bagpanel) && (bagpanel.goldSelected)))
                {
                    bagpanel.goldLockFlag = false;
                };
                shopSlot = new Object();
                i = 0;
                while (i <= GameData.d[GamePredef.TBL_SHOP_SLOT].length)
                {
                    if (((((((GameData.d[GamePredef.TBL_SHOP_SLOT][i]) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].type == DiscountSlot.type)) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].itemId == DiscountSlot.giid)) && (!(GameData.d[GamePredef.TBL_SHOP_SLOT][i].st == 5))) && (GameData.d[GamePredef.TBL_SHOP_SLOT][i].gold > 0)) && (!(GameData.d[GamePredef.TBL_SHOP_SLOT][i].sid == GamePredef.VIP_SHOP_ID))))
                    {
                        shopSlot = GameData.d[GamePredef.TBL_SHOP_SLOT][i];
                        break;
                    };
                    i = (i + 1);
                };
                if (shopSlot.id)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("buyDiscountGift", new Responder(onBuyDisc), shopSlot.id);
                        };
                    };
                    item = GameData.d[DiscountSlot.type][DiscountSlot.giid];
                    if (item)
                    {
                        showString = Language.ACTIVEPANEL_S[6].toString();
                        if (shopSlot.gold > 0)
                        {
                            showString = showString.replace("{shopSlot.gold}", shopSlot.gold);
                            showString = showString.replace("{item.name}", item.name);
                        }
                        else
                        {
                            showString = showString.replace("{shopSlot.gold}", item.gold);
                            showString = showString.replace("{item.name}", item.name);
                        };
                        Alert.show(showString, "", (Alert.YES | Alert.NO), this, func);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get ta_festDesc():IntroText
        {
            return (this._438810531ta_festDesc);
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get dailySlot():ItemSlot
        {
            return (this._1198028873dailySlot);
        }

        public function __noticeBtn0_click(_arg_1:MouseEvent):void
        {
            clickNotice(0);
        }

        private function _GameIntroPanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn;
            _local_1 = new DataGridColumn();
            _GameIntroPanel_DataGridColumn4 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "Line";
            BindingManager.executeBindings(this, "_GameIntroPanel_DataGridColumn4", _GameIntroPanel_DataGridColumn4);
            return (_local_1);
        }

        public function set List_fl(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._1846619111List_fl;
            if (_local_2 !== _arg_1)
            {
                this._1846619111List_fl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "List_fl", _local_2, _arg_1));
            };
        }

        private function _GameIntroPanel_ClassFactory13_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemArray;
            return (_local_1);
        }

        private function _GameIntroPanel_ClassFactory4_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = RendererItemSlot;
            return (_local_1);
        }

        public function __StageConsumeBtn1_click(_arg_1:MouseEvent):void
        {
            showStagePlatform(1);
        }

        public function set simplecanvas1(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1002706919simplecanvas1;
            if (_local_2 !== _arg_1)
            {
                this._1002706919simplecanvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas1():SimpleCanvas
        {
            return (this._1002706919simplecanvas1);
        }

        private function onGetTodayAward(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1["dailyAward"])
                {
                    onGetFlagAward(_arg_1["dailyAward"]);
                };
                if (_arg_1["dailyDisc"])
                {
                    onGetFlagDisc(_arg_1["dailyDisc"]);
                };
                if (_arg_1["contiLoginDay"])
                {
                    onGetContiDay(_arg_1["contiLoginDay"]);
                };
            };
        }

        public function __tabBtn6_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(6);
        }


    }
}//package com.qeedoo.ui.view.compDragable

