// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.EquiptFuncPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.ItemSlotEquFunc;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.controls.TextInput;
    import mx.controls.NumericStepper;
    import com.qeedoo.ui.view.comp.ItemSlotMaterial;
    import mx.controls.CheckBox;
    import mx.controls.Label;
    import mx.collections.ArrayCollection;
    import mx.controls.List;
    import mx.controls.Alert;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import com.qeedoo.ui.view.comp.DescriptionLabel;
    import com.qeedoo.ui.view.comp.ItemSlotStar;
    import com.qeedoo.ui.view.comp.AutoTextArea;
    import com.qeedoo.ui.view.comp.ProgressBarCanvas;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import mx.containers.Canvas;
    import mx.containers.ViewStack;
    import mx.containers.HBox;
    import mx.controls.TextArea;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.ItemSlotJewel;
    import mx.controls.ComboBox;
    import mx.controls.Tree;
    import com.qeedoo.ui.view.comp.EquipFunc;
    import mx.core.UIComponentDescriptor;
    import mx.containers.VBox;
    import mx.controls.VRule;
    import mx.controls.Spacer;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.game.config.Language;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.predef.GamePredef;
    import mx.events.PropertyChangeEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.ListEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.game.utils.JSONUtil;
    import com.adobe.serialization.json.JSON;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import style.Assets;
    import com.qeedoo.ui.view.comp.Slot;
    import com.adobe.utils.StringUtil;
    import com.qeedoo.ui.event.GameEvent;
    import com.adobe.crypto.MD5;
    import com.qeedoo.ui.view.comp.EquipFuncBag;
    import com.qeedoo.game.ui.ISlot;
    import flash.utils.getDefinitionByName;
    import mx.controls.Menu;
    import mx.events.MenuEvent;
    import flash.utils.setTimeout;
    import mx.core.IUITextField;
    import mx.events.NumericStepperEvent;
    import mx.events.DropdownEvent;
    import com.qeedoo.ui.view.comp.CustomMenu;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.HtmlComboItemRenderer;
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

    public class EquiptFuncPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var levelupReqNum:int = 0;
        private var _933747495tabBtnA3:BasicGlowButton;
        private var _643565254petEquReadyLevelup:ItemSlotEquFunc;
        private var _476789048mwResetProp:ItemSlotEquFunc;
        private var _1885394232sublimeItem:ItemSlot;
        private var _1845096676newPro1:TextInput;
        private var _60073210jewelUpdateNum:NumericStepper;
        private var _1221705316makeInputItem3:ItemSlotMaterial;
        private var _1036064102autoSublime:CheckBox;
        private var _1836581681stageItem:ItemSlot;
        private var _2058846118isFirst:String = "|";
        private var _418363278petEquStarBasic:NumericStepper;
        private var _1563237501petEquLevelupReqNum:Label;
        private var modPreReq:int = 0;
        private var makeListAC:ArrayCollection;
        public var succinctId:int = -1;
        private var _1292150120magEquFuncList:List;
        private var _restrainPet:Alert;
        private var _40388036makePer3:BoxLabel;
        private var _948574959transItemNeed:ItemSlot;
        public var _EquiptFuncPanel_Label2:Label;
        public var _EquiptFuncPanel_Label3:Label;
        private var _933747494tabBtnA4:BasicGlowButton;
        private var _2082390040MWTransFrom:ItemSlotEquFunc;
        public var _EquiptFuncPanel_BasicTxtButton10:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton11:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton12:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton13:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton14:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton15:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton16:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton17:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton18:BasicTxtButton;
        private var _1621769932petEquModColorNeedItem:ItemSlot;
        public var _EquiptFuncPanel_BasicTxtButton19:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton20:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton21:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton22:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton23:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton24:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton25:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton26:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton27:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton28:BasicTxtButton;
        private var _1031382924resetRequireLabel2:DescriptionLabel;
        private var _410852217petEquStarJewel:ItemSlotStar;
        private var _1343807092petEquModPreNeedItem:ItemSlot;
        private var _103145573lock0:CheckBox;
        public var _EquiptFuncPanel_BasicTxtButton31:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton32:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton33:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton34:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton35:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton36:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton37:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton38:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton39:BasicTxtButton;
        private var modColorReqId:int = 0;
        public var jweOffMoney:Number = 1;
        private var _1162960632actBtn2:BasicGlowButton;
        public var _EquiptFuncPanel_BasicTxtButton40:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton41:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton42:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton44:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton45:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton46:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton47:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton49:BasicTxtButton;
        private var _1379509781oldPro1:TextInput;
        private var _60813428MWResetSkill:ItemSlotEquFunc;
        public var _EquiptFuncPanel_BasicTxtButton50:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton51:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton52:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton53:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton54:BasicTxtButton;
        internal var _reAlert:Alert;
        private var _166265644consumeTxt:AutoTextArea;
        private var _1131509414progressBar:ProgressBarCanvas;
        private var _1149285369petEquLevelupBtn:BasicDelayButton;
        private var _2124710308succinctBtn:BasicGlowButton;
        private var modBindReq:int = 0;
        private var _40388035makePer2:BoxLabel;
        private var _858071152MWResolve2:ItemSlot;
        private var _103145574lock1:CheckBox;
        private var _553145794petEquModPreItem:ItemSlot;
        private var skillResetIndex:int = -1;
        private var _1991722883jewelUpdateButtonAll:BasicGlowButton;
        private var modColorRate:int = 0;
        private var _933747493tabBtnA5:BasicGlowButton;
        private var _646631509petEquLevelupMoney:Label;
        private var _217727770makeCanvas:Canvas;
        private var _552846995petEquModPreSucc:Label;
        private var _sublimeAlert:Alert;
        private var _227709248makeButton:BasicGlowButton;
        private var _988812235petEquModColorMoney:Label;
        public var _EquiptFuncPanel_BasicGlowButton10:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton14:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton16:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton17:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton18:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton19:BasicGlowButton;
        private var _1788134104materialMixPer:BasicTxtButton;
        private var _2008127689petEquModBindSucc:Label;
        private var _3552079tabD:ViewStack;
        public var lastLineId:int = -1;
        public var _EquiptFuncPanel_BasicGlowButton20:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton24:BasicGlowButton;
        private var _1799691270petEquReadyModBind:ItemSlotEquFunc;
        public var _EquiptFuncPanel_BasicGlowButton23:BasicGlowButton;
        public var autoMatchSlots:Object;
        private var _2008426488petEquModBindItem:ItemSlot;
        private var _804327583blueStoneNeed:ItemSlot;
        private var _103145575lock2:CheckBox;
        private var _2008432221petEquModBindInfo:Label;
        private var _803512544petEquModReqNum:Label;
        public var _EquiptFuncPanel_BasicGlowButton1:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton7:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton8:BasicGlowButton;
        public var _EquiptFuncPanel_BasicGlowButton9:BasicGlowButton;
        private var _1788135535materialMixNum:NumericStepper;
        private var _638137383sublimeConsume:Label;
        private var _3552078tabC:ViewStack;
        public var _EquiptFuncPanel_HBox2:HBox;
        public var _EquiptFuncPanel_HBox3:HBox;
        public var _EquiptFuncPanel_HBox4:HBox;
        public var _EquiptFuncPanel_HBox5:HBox;
        private var _40388034makePer1:BoxLabel;
        private var _304002869upgradeRequireLabel:DescriptionLabel;
        private var _1031382925resetRequireLabel1:DescriptionLabel;
        private var _843999975maxProp:TextArea;
        private var _43044678petEquReadyModColor:ItemSlotEquFunc;
        private var _1162960634actBtn0:BasicGlowButton;
        private var _1322604301eTitle:BasicTitleCanvas;
        private var _341889337petEquModBindBtn:BasicDelayButton;
        private var _894849577MWRepair:ItemSlotEquFunc;
        private var _510410697autoRestrain:CheckBox;
        private var _1845096675newPro0:TextInput;
        public var _EquiptFuncPanel_Image1:Image;
        public var _EquiptFuncPanel_Image2:Image;
        public var _EquiptFuncPanel_Image3:Image;
        public var _EquiptFuncPanel_Image4:Image;
        public var _EquiptFuncPanel_Image5:Image;
        public var _EquiptFuncPanel_Image6:Image;
        private var _1306166635stageEqu:ItemSlotEquFunc;
        private var _1267649387petEquLevelupRate:BasicTxtButton;
        private var _1678552859sublimeEquip:ItemSlotEquFunc;
        private var _1891128307jewelUpdateItem2:ItemSlotJewel;
        private var _517338458mwSuccinctCanvas:Canvas;
        private var _1784770749restrainBox:ComboBox;
        private var shopData:Object;
        private var _3552076tabA:ViewStack;
        private var _411523705petEquStarInfo1:BasicTxtButton;
        private var starNum:int;
        private var _60074641jewelUpdatePer:BasicTxtButton;
        private var _1926393423petEquStarItem:ItemSlotEquFunc;
        private var _1221705314makeInputItem1:ItemSlotMaterial;
        private var _103075529petEquStarAllBtn:BasicGlowButton;
        private var _1004296629spiritualityLabel:DescriptionLabel;
        private var _1267905437petEquLevelupInfo:Label;
        private var _860877172MWSkills:ComboBox;
        private var _929613692makeRequire3:ItemSlot;
        private var _40519340makeTree:Tree;
        private var eventListenerAdded:Boolean = false;
        private var skillListReady:Boolean = false;
        public var _EquiptFuncPanel_DescriptionLabel1:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel5:DescriptionLabel;
        public var _alert:Alert;
        public var _EquiptFuncPanel_DescriptionLabel8:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel9:DescriptionLabel;
        private var _sublimePet:Alert;
        private var _506894491restrainItem:ItemSlot;
        private var _192885848materialButtonAll:BasicGlowButton;
        public var spirituality:int = 0;
        private var levelupReqId:int = 0;
        private var currentMakeTreeIndex:int = 0;
        private var _273317502MwSuccinct:ItemSlotEquFunc;
        private var _799266457petEquModColorInfo:Label;
        private var _9686830classType:ComboBox;
        private var _1379509780oldPro2:TextInput;
        private var _1658087640stagePropLeft:AutoTextArea;
        private var _1836823818redStoneNeed:ItemSlot;
        private var _1177195105itemInfo:Label;
        private var _1885434308sublimeHint:AutoTextArea;
        public var _EquiptFuncPanel_Canvas5:Canvas;
        public var _EquiptFuncPanel_Canvas6:Canvas;
        public var _EquiptFuncPanel_Canvas7:Canvas;
        public var _EquiptFuncPanel_Canvas8:Canvas;
        public var _EquiptFuncPanel_Canvas9:Canvas;
        private var _664840300maxPropTA:TextArea;
        public var _EquiptFuncPanel_Canvas4:Canvas;
        private var _1482580427creEquFuncList:List;
        private var _506854415restrainHint:Label;
        private var _933747498tabBtnA0:BasicGlowButton;
        private var _1845096677newPro2:TextInput;
        private var _1469908056restrainEquip:ItemSlotEquFunc;
        private var _849134127petEquModPreBtn:BasicDelayButton;
        private var _1690306823sublimeRight:AutoTextArea;
        private var _1908571136equipChange:EquipFunc;
        private var _1238698255makeAward:ItemSlot;
        private var _1359520555blueStoneGet:ItemSlotMaterial;
        private var _1891128306jewelUpdateItem1:ItemSlotJewel;
        private var _929613691makeRequire2:ItemSlot;
        private var newJewelList:Object;
        private var _411523704petEquStarInfo2:BasicTxtButton;
        private var materialMixBasicRate:Number = 20;
        private var _299371090petEquStarOneBtn:BasicGlowButton;
        private var _922290793hintTxt:TextArea;
        private var _933747497tabBtnA1:BasicGlowButton;
        private var _1991736392jewelUpdateButtonOne:BasicGlowButton;
        private var equipBagAdded:Boolean = false;
        private var _40272812makeList:List;
        public var _EquiptFuncPanel_Canvas11:Canvas;
        public var _EquiptFuncPanel_Canvas12:Canvas;
        public var _EquiptFuncPanel_Canvas13:Canvas;
        public var _EquiptFuncPanel_Canvas14:Canvas;
        public var _EquiptFuncPanel_Canvas15:Canvas;
        public var _EquiptFuncPanel_Canvas16:Canvas;
        private var _1221705315makeInputItem2:ItemSlotMaterial;
        private var _1162960633actBtn1:BasicGlowButton;
        private var _1379509782oldPro0:TextInput;
        private var _144551707stagePropRight:AutoTextArea;
        private var _1267899704petEquLevelupItem:ItemSlot;
        private var _163196473MWTransTo:ItemSlotEquFunc;
        private var _799272190petEquModColorItem:ItemSlot;
        private var _1518482858MWChangeLevel:ItemSlotEquFunc;
        public var _EquiptFuncPanel_BasicTxtButton1:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton2:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton3:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton4:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton6:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton7:BasicTxtButton;
        public var _EquiptFuncPanel_BasicTxtButton8:BasicTxtButton;
        private var aliasString:String = "";
        private var _402223208materialMixItem:ItemSlotMaterial;
        private var _192872339materialButtonOne:BasicGlowButton;
        private var _646343081autoBuy:CheckBox;
        public var _EquiptFuncPanel_DescriptionLabel10:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel11:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel12:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel13:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel14:DescriptionLabel;
        public var _EquiptFuncPanel_DescriptionLabel15:DescriptionLabel;
        private var _638827390petEquLevelupItemNeed:ItemSlot;
        private var _442224809transRequireLabel:DescriptionLabel;
        private var _restrainAlert:Alert;
        private var modColorReqNum:int = 0;
        private var _507271213restrainView:Label;
        private var _1885319236sublimeLeft:AutoTextArea;
        private var _933747496tabBtnA2:BasicGlowButton;
        public var _EquiptFuncPanel_Label20:Label;
        public var _EquiptFuncPanel_Label21:Label;
        public var _EquiptFuncPanel_Label23:Label;
        public var _EquiptFuncPanel_Label24:Label;
        public var _EquiptFuncPanel_Label25:Label;
        public var _EquiptFuncPanel_Label27:Label;
        public var _EquiptFuncPanel_Label29:Label;
        private var _553151527petEquModPreInfo:Label;
        private var _255603766petEquReadyPre:ItemSlotEquFunc;
        private var _929613690makeRequire1:ItemSlot;
        private var _2067262411showBag:BasicGlowButton;
        public var _EquiptFuncPanel_Label30:Label;
        private var _303751312curPropTA:TextArea;
        private var _228267838petEquModBindNeedItem:ItemSlot;
        private var _1232558777modBindReqNum:Label;
        public var useEquTypeInfo:Object;
        private var _799522507petEquModColorRate:BasicTxtButton;
        private var _425010661costInfo:Label;
        private var _718512913petEquModColorBtn:BasicDelayButton;
        private var _1748616716resetStoneNeed:ItemSlot;
        private var _1967342366MWResolve:ItemSlotEquFunc;
        private var _1363735427nextPetEqu:ItemSlotEquFunc;
        private var _1252811177modPreReqNum:Label;
        private var _1125939651curProp:TextArea;
        private var _1877517656petEquStarMax:NumericStepper;
        private var _40388037makePer4:BoxLabel;
        private var _657202407petEquLevelupBasic:NumericStepper;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":500,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"eTitle",
                        "events":{"creationComplete":"__eTitle_creationComplete"}
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"tabA",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "width":470,
                                "height":325,
                                "creationPolicy":"auto",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"makeCanvas",
                                    "events":{"creationComplete":"__makeCanvas_creationComplete"},
                                    "stylesFactory":function ():void
                                    {
                                        this.disabledOverlayAlpha = 0.1;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"RoundedGradientBorder",
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Tree,
                                                "id":"makeTree",
                                                "events":{
                                                    "mouseDown":"__makeTree_mouseDown",
                                                    "itemClick":"__makeTree_itemClick",
                                                    "change":"__makeTree_change"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":7,
                                                        "width":96,
                                                        "height":307,
                                                        "y":5,
                                                        "iconField":"myIcon",
                                                        "styleName":"CSSBorder"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":5,
                                                        "height":235,
                                                        "styleName":"CanvasBorder",
                                                        "width":253,
                                                        "x":210,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"makeAward",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":9,
                                                                    "y":36,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"makeRequire1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":9,
                                                                    "y":101,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"makeRequire2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":49,
                                                                    "y":101,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlot,
                                                            "id":"makeRequire3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":101,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotMaterial,
                                                            "id":"makeInputItem1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":9,
                                                                    "y":166,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotMaterial,
                                                            "id":"makeInputItem2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":49,
                                                                    "y":166,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ItemSlotMaterial,
                                                            "id":"makeInputItem3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":166,
                                                                    "movable":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"_EquiptFuncPanel_BasicGlowButton1",
                                                            "events":{"click":"___EquiptFuncPanel_BasicGlowButton1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":10,
                                                                    "styleName":"BtnNormalRed",
                                                                    "y":206,
                                                                    "width":99
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_EquiptFuncPanel_BasicTxtButton1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":12,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_EquiptFuncPanel_BasicTxtButton2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":75,
                                                                    "height":18
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_EquiptFuncPanel_BasicTxtButton3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":8,
                                                                    "y":140,
                                                                    "height":18
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"makeList",
                                                "events":{
                                                    "itemClick":"__makeList_itemClick",
                                                    "mouseDown":"__makeList_mouseDown"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":107,
                                                        "y":5,
                                                        "width":94,
                                                        "height":205,
                                                        "styleName":"CSSBorder",
                                                        "labelField":"name"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderStyle = "none";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":67,
                                                        "y":245,
                                                        "styleName":"CanvasBorder",
                                                        "width":357,
                                                        "x":106,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"makeButton",
                                                            "events":{"click":"__makeButton_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":297,
                                                                    "y":37,
                                                                    "enabled":false,
                                                                    "styleName":"BtnStdRed",
                                                                    "width":50
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ProgressBarCanvas,
                                                            "id":"progressBar",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x212121;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":32,
                                                                    "y":40,
                                                                    "width":205,
                                                                    "showCancelButton":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"makePer1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontWeight = "bold";
                                                                this.textAlign = "right";
                                                                this.color = 0xFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":68,
                                                                    "width":65,
                                                                    "text":"100%",
                                                                    "y":9
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"makePer2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontWeight = "bold";
                                                                this.textAlign = "right";
                                                                this.color = 5954812;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":138,
                                                                    "width":65,
                                                                    "text":"100%",
                                                                    "y":9
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"makePer3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontWeight = "bold";
                                                                this.textAlign = "right";
                                                                this.color = 0xFF00FF;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":208,
                                                                    "width":65,
                                                                    "text":"100%",
                                                                    "y":9
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BoxLabel,
                                                            "id":"makePer4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontWeight = "bold";
                                                                this.textAlign = "right";
                                                                this.color = 0xFFFF00;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":278,
                                                                    "width":65,
                                                                    "text":"100%",
                                                                    "y":9
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":BasicTxtButton,
                                                            "id":"_EquiptFuncPanel_BasicTxtButton4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.paddingLeft = 1;
                                                                this.paddingRight = 1;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":4,
                                                                    "y":10,
                                                                    "width":64,
                                                                    "height":18
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"classType",
                                                "events":{
                                                    "change":"__classType_change",
                                                    "close":"__classType_close"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":107,
                                                        "width":95,
                                                        "editable":false,
                                                        "y":213,
                                                        "rowCount":7
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":EquipFunc,
                                    "id":"equipChange",
                                    "events":{"creationComplete":"__equipChange_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_EquiptFuncPanel_Canvas4",
                                    "events":{"creationComplete":"___EquiptFuncPanel_Canvas4_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_EquiptFuncPanel_Image1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":110});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotMaterial,
                                                "id":"materialMixItem",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":120,
                                                        "movable":false,
                                                        "x":217,
                                                        "haveRequireSlot":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"materialMixNum",
                                                "events":{"change":"__materialMixNum_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":246,
                                                        "minimum":2,
                                                        "maximum":5,
                                                        "x":165,
                                                        "value":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"materialMixPer",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":249,
                                                        "label":"100%",
                                                        "x":267
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"materialButtonAll",
                                                "events":{"click":"__materialButtonAll_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdGreen",
                                                        "x":130,
                                                        "width":80,
                                                        "y":296
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"materialButtonOne",
                                                "events":{"click":"__materialButtonOne_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":260,
                                                        "width":50,
                                                        "y":296
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.horizontalCenter = "-4";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":158,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":165,
                                                        "y":227,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":250,
                                                        "y":226,
                                                        "width":163,
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_EquiptFuncPanel_Canvas5",
                                    "events":{"creationComplete":"___EquiptFuncPanel_Canvas5_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_EquiptFuncPanel_Image2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":110});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotJewel,
                                                "id":"jewelUpdateItem1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":182,
                                                        "movable":false,
                                                        "showStackNum":true,
                                                        "x":112
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ItemSlotJewel,
                                                "id":"jewelUpdateItem2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":181,
                                                        "x":325
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":NumericStepper,
                                                "id":"jewelUpdateNum",
                                                "events":{"change":"__jewelUpdateNum_change"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":268,
                                                        "minimum":2,
                                                        "maximum":5,
                                                        "x":128,
                                                        "value":5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"jewelUpdatePer",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "center";
                                                    this.right = "50";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":269,
                                                        "label":"100%"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"jewelUpdateButtonAll",
                                                "events":{"click":"__jewelUpdateButtonAll_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0x0101,
                                                        "styleName":"BtnStdGreen",
                                                        "x":193,
                                                        "width":80
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"jewelUpdateButtonOne",
                                                "events":{"click":"__jewelUpdateButtonOne_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"BtnStdRed",
                                                        "x":209,
                                                        "width":50,
                                                        "y":296
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.horizontalCenter = "-108";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":143,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton11",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":310,
                                                        "y":143,
                                                        "width":76,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":56,
                                                        "y":270,
                                                        "width":65,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_EquiptFuncPanel_BasicTxtButton13",
                                                "stylesFactory":function ():void
                                                {
                                                    this.paddingLeft = 0;
                                                    this.paddingRight = 0;
                                                    this.right = "96";
                                                    this.textAlign = "right";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":269,
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_EquiptFuncPanel_Canvas6",
                                    "events":{"creationComplete":"___EquiptFuncPanel_Canvas6_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_EquiptFuncPanel_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":185,
                                                        "y":105,
                                                        "width":285,
                                                        "height":220
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"tabD",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":95,
                                                        "width":370,
                                                        "y":5,
                                                        "height":312,
                                                        "creationPolicy":"auto",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"_EquiptFuncPanel_Canvas7",
                                                            "events":{"creationComplete":"___EquiptFuncPanel_Canvas7_creationComplete"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MWChangeLevel",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":173,
                                                                                "movable":false,
                                                                                "x":167
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton7",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton7_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":286
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":227,
                                                                                "y":264
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":132,
                                                                                "y":213
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton14",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":150,
                                                                                "y":147,
                                                                                "width":76,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"spiritualityLabel",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":72,
                                                                                "y":253
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"upgradeRequireLabel",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":202,
                                                                                "y":253
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"_EquiptFuncPanel_Canvas8",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MWResolve",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":178,
                                                                                "movable":false,
                                                                                "x":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"MWResolve2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":250,
                                                                                "movable":false,
                                                                                "x":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotMaterial,
                                                                        "id":"blueStoneGet",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "y":178,
                                                                                "haveRequireSlot":false,
                                                                                "x":248
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton8",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton8_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":187
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton9",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton9_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":258
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton15",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":64,
                                                                                "y":152,
                                                                                "width":76,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton16",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":64,
                                                                                "y":225,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton17",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":227,
                                                                                "y":152,
                                                                                "width":76,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"_EquiptFuncPanel_Canvas9",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MWRepair",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":178,
                                                                                "movable":false,
                                                                                "x":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"blueStoneNeed",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "y":178,
                                                                                "x":248
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton10",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton10_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":286
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton18",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-83";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton19",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "80";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"mwSuccinctCanvas",
                                                            "events":{"creationComplete":"__mwSuccinctCanvas_creationComplete"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MwSuccinct",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":145,
                                                                                "movable":false,
                                                                                "x":7
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"oldPro0",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "editable":false,
                                                                                "x":94,
                                                                                "y":110,
                                                                                "text":"",
                                                                                "width":220,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"oldPro1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "editable":false,
                                                                                "x":94,
                                                                                "y":134,
                                                                                "text":"",
                                                                                "width":220,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"oldPro2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "editable":false,
                                                                                "x":94,
                                                                                "y":158,
                                                                                "text":"",
                                                                                "width":220,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"newPro0",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "editable":false,
                                                                                "x":94,
                                                                                "y":196,
                                                                                "text":"",
                                                                                "width":220,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"newPro1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "editable":false,
                                                                                "x":94,
                                                                                "y":220,
                                                                                "text":"",
                                                                                "width":220,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextInput,
                                                                        "id":"newPro2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "editable":false,
                                                                                "x":94,
                                                                                "y":246,
                                                                                "text":"",
                                                                                "width":220,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 16775802;
                                                                            this.textAlign = "right";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":111
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 16775802;
                                                                            this.textAlign = "right";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":0,
                                                                                "y":201
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"itemInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "25";
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"x":27});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"autoBuy",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.bottom = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":7,
                                                                                "width":96.2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"costInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "25";
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"x":160});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"actBtn0",
                                                                        "events":{"click":"__actBtn0_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "7";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "styleName":"BtnStdRed",
                                                                                "y":110,
                                                                                "width":45,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"actBtn1",
                                                                        "events":{"click":"__actBtn1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "7";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "styleName":"BtnStdRed",
                                                                                "y":134,
                                                                                "width":45,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"actBtn2",
                                                                        "events":{"click":"__actBtn2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "7";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "styleName":"BtnStdRed",
                                                                                "y":158,
                                                                                "width":45,
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"lock0",
                                                                        "events":{"click":"__lock0_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "x":318,
                                                                                "y":110
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"lock1",
                                                                        "events":{"click":"__lock1_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "x":318,
                                                                                "y":134
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":CheckBox,
                                                                        "id":"lock2",
                                                                        "events":{"click":"__lock2_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "x":318,
                                                                                "y":158
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton14",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton14_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":111.2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"succinctBtn",
                                                                        "events":{"click":"__succinctBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.bottom = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":196.2
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton16",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton16_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.right = "15";
                                                                            this.bottom = "0";
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
                                                            "id":"_EquiptFuncPanel_Canvas11",
                                                            "events":{"creationComplete":"___EquiptFuncPanel_Canvas11_creationComplete"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MWResetSkill",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":178,
                                                                                "movable":false,
                                                                                "x":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"redStoneNeed",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "y":178,
                                                                                "x":248
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton17",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton17_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":283
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton20",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-83";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton21",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "80";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"transRequireLabel",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120.5,
                                                                                "y":253
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":51,
                                                                                "y":218
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ComboBox,
                                                                        "id":"MWSkills",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":36,
                                                                                "width":120,
                                                                                "rowCount":4,
                                                                                "y":280
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"_EquiptFuncPanel_Canvas12",
                                                            "events":{"creationComplete":"___EquiptFuncPanel_Canvas12_creationComplete"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MWTransTo",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":178,
                                                                                "movable":false,
                                                                                "x":85
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"MWTransFrom",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":178,
                                                                                "movable":false,
                                                                                "x":248
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"transItemNeed",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "y":178,
                                                                                "x":168
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton18",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton18_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":280
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton22",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-85";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton23",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "79";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton24",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"_EquiptFuncPanel_Canvas13",
                                                            "events":{"creationComplete":"___EquiptFuncPanel_Canvas13_creationComplete"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"mwResetProp",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":178,
                                                                                "movable":false,
                                                                                "x":115
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"resetStoneNeed",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "movable":false,
                                                                                "y":178,
                                                                                "x":208
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton19",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton19_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingBottom = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "x":159,
                                                                                "width":50,
                                                                                "y":286
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton25",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-54";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":151,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton26",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "58";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":151,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextArea,
                                                                        "id":"curPropTA",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "left";
                                                                            this.left = "10";
                                                                            this.color = 1961723;
                                                                            this.backgroundAlpha = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":100,
                                                                                "width":110,
                                                                                "editable":false,
                                                                                "alpha":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextArea,
                                                                        "id":"maxPropTA",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "left";
                                                                            this.right = "10";
                                                                            this.color = 1961723;
                                                                            this.backgroundAlpha = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":152,
                                                                                "height":100,
                                                                                "width":110,
                                                                                "editable":false,
                                                                                "alpha":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"resetRequireLabel1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":137,
                                                                                "y":247
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"resetRequireLabel2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":137,
                                                                                "y":222
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"_EquiptFuncPanel_Canvas14",
                                                            "events":{"creationComplete":"___EquiptFuncPanel_Canvas14_creationComplete"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "-45";
                                                                            this.horizontalAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":115,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_EquiptFuncPanel_BasicTxtButton27"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ItemSlotEquFunc,
                                                                                    "id":"stageEqu",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"movable":false});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":VBox,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "45";
                                                                            this.horizontalAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":115,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":BasicTxtButton,
                                                                                    "id":"_EquiptFuncPanel_BasicTxtButton28"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ItemSlot,
                                                                                    "id":"stageItem",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"movable":false});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextArea,
                                                                        "id":"hintTxt",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.borderStyle = "none";
                                                                            this.horizontalCenter = "0";
                                                                            this.backgroundAlpha = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":195,
                                                                                "width":180,
                                                                                "height":80,
                                                                                "selectable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "id":"_EquiptFuncPanel_Canvas15",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.borderStyle = "none";
                                                                            this.backgroundAlpha = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":182,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":HBox,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalGap = 28;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":AutoTextArea,
                                                                                                "id":"stagePropLeft",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.backgroundAlpha = 0;
                                                                                                    this.borderStyle = "none";
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":AutoTextArea,
                                                                                                "id":"stagePropRight",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.backgroundAlpha = 0;
                                                                                                    this.borderStyle = "none";
                                                                                                }
                                                                                            })]});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Image,
                                                                                    "id":"_EquiptFuncPanel_Image4",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "15";
                                                                                        this.verticalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"rotation":90});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":AutoTextArea,
                                                                        "id":"consumeTxt",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 1961723;
                                                                            this.borderStyle = "none";
                                                                            this.horizontalCenter = "0";
                                                                            this.backgroundAlpha = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":232,
                                                                                "selectable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton20",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton20_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "y":285
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VRule,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":8,
                                                        "height":311
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"magEquFuncList",
                                                "events":{
                                                    "change":"__magEquFuncList_change",
                                                    "creationComplete":"__magEquFuncList_creationComplete"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderSides = "0";
                                                    this.backgroundAlpha = 0;
                                                    this.textRollOverColor = 16366965;
                                                    this.textSelectedColor = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":80,
                                                        "height":310,
                                                        "x":10,
                                                        "y":8
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_EquiptFuncPanel_Canvas16",
                                    "events":{"creationComplete":"___EquiptFuncPanel_Canvas16_creationComplete"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_EquiptFuncPanel_Image5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":120,
                                                        "y":130,
                                                        "width":350,
                                                        "height":195
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"tabC",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":95,
                                                        "width":375,
                                                        "y":8,
                                                        "height":317,
                                                        "creationPolicy":"all",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "label":" ",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"petEquStarItem",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":166,
                                                                                "movable":false,
                                                                                "x":81
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotStar,
                                                                        "id":"petEquStarJewel",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":166,
                                                                                "movable":false,
                                                                                "x":259
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"petEquStarInfo1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.right = "210";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":205,
                                                                                "label":"10"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"petEquStarInfo2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.right = "29";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":205,
                                                                                "label":"100%",
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"petEquStarBasic",
                                                                        "events":{"change":"__petEquStarBasic_change"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":81,
                                                                                "y":0x0101,
                                                                                "value":5,
                                                                                "minimum":1,
                                                                                "maximum":5,
                                                                                "width":50,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"petEquStarMax",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":254,
                                                                                "y":0x0101,
                                                                                "minimum":1,
                                                                                "maximum":10,
                                                                                "width":50,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"petEquStarAllBtn",
                                                                        "events":{"click":"__petEquStarAllBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":157.5,
                                                                                "y":227,
                                                                                "styleName":"BtnStdGreen",
                                                                                "enabled":false,
                                                                                "width":80
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"petEquStarOneBtn",
                                                                        "events":{"click":"__petEquStarOneBtn_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":165.5,
                                                                                "styleName":"BtnStdRed",
                                                                                "enabled":false,
                                                                                "width":50,
                                                                                "y":286
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton31",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":65,
                                                                                "y":136,
                                                                                "width":76,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton32",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":240,
                                                                                "y":136,
                                                                                "width":76,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton33",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.right = "244";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":205,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton34",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.right = "71";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":205,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton35",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":66,
                                                                                "y":231,
                                                                                "width":65,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton36",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":254,
                                                                                "y":231,
                                                                                "width":92,
                                                                                "height":18
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
                                                                    "label":" ",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"petEquReadyLevelup",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":149,
                                                                                "movable":false,
                                                                                "x":69
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"nextPetEqu",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":216,
                                                                                "x":69
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquLevelupItemNeed",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":184,
                                                                                "x":167,
                                                                                "movable":false,
                                                                                "label":"所需材料"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquLevelupItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":183,
                                                                                "x":266,
                                                                                "label":"放入材料"
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton37",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":49,
                                                                                "y":129,
                                                                                "width":75,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton38",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-101";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":193,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton39",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-3";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":160,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton40",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":241,
                                                                                "y":160,
                                                                                "width":90,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton41",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "x":196,
                                                                                "y":253,
                                                                                "width":64,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton42",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "x":205,
                                                                                "y":219,
                                                                                "width":61,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"petEquLevelupRate",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "y":253,
                                                                                "label":"100%",
                                                                                "x":268,
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":NumericStepper,
                                                                        "id":"petEquLevelupBasic",
                                                                        "events":{"change":"__petEquLevelupBasic_change"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0x212121;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "visible":false,
                                                                                "x":271,
                                                                                "y":218,
                                                                                "value":5,
                                                                                "minimum":1,
                                                                                "maximum":5,
                                                                                "width":50,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquLevelupReqNum",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.color = 0xFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":228,
                                                                                "y":222,
                                                                                "width":131,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":29,
                                                                                "y":252,
                                                                                "width":105
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquLevelupMoney",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":253,
                                                                                "width":43
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquLevelupInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":288,
                                                                                "width":140,
                                                                                "x":10
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":35,
                                                                                "y":111,
                                                                                "width":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"petEquLevelupBtn",
                                                                        "events":{"click":"__petEquLevelupBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":5000,
                                                                                "x":153,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":80,
                                                                                "y":286
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
                                                                    "label":" ",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"petEquReadyModColor",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":175,
                                                                                "movable":false,
                                                                                "x":73
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquModColorNeedItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":175,
                                                                                "x":171
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquModColorItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":175,
                                                                                "x":268
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton44",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":54,
                                                                                "y":145,
                                                                                "width":75,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton45",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":151,
                                                                                "y":145,
                                                                                "width":66,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton46",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":246,
                                                                                "y":145,
                                                                                "width":91,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModReqNum",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.color = 0xFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":227,
                                                                                "y":215,
                                                                                "width":131,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton47",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.right = "72";
                                                                            this.textAlign = "right";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":241,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"petEquModColorRate",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.right = "27";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":241,
                                                                                "label":"100%",
                                                                                "width":40,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModColorInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":284,
                                                                                "width":148,
                                                                                "x":10
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":63,
                                                                                "y":246,
                                                                                "width":105
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModColorMoney",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":171,
                                                                                "y":248,
                                                                                "width":43
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":36,
                                                                                "y":215,
                                                                                "width":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"petEquModColorBtn",
                                                                        "events":{"click":"__petEquModColorBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":2000,
                                                                                "x":160,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":60,
                                                                                "y":286
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
                                                                    "label":" ",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"petEquReadyModBind",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":175,
                                                                                "movable":false,
                                                                                "x":73
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquModBindNeedItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":175,
                                                                                "x":171
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquModBindItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":175,
                                                                                "x":268
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"modBindReqNum",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.color = 0xFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":227,
                                                                                "y":215,
                                                                                "width":131,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":36,
                                                                                "y":236,
                                                                                "width":105
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":137,
                                                                                "y":237,
                                                                                "text":"30000",
                                                                                "width":43
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton49",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":54,
                                                                                "y":145,
                                                                                "width":75,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton50",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.horizontalCenter = "-4";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":145,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton51",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":246,
                                                                                "y":145,
                                                                                "width":91,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModBindSucc",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                            this.textAlign = "right";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":0xFF,
                                                                                "width":111.5,
                                                                                "x":45,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModBindInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                            this.textAlign = "left";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":0xFF,
                                                                                "width":155.5,
                                                                                "x":156,
                                                                                "height":35
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":36,
                                                                                "y":215,
                                                                                "width":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"petEquModBindBtn",
                                                                        "events":{"click":"__petEquModBindBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":5000,
                                                                                "x":160,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":60,
                                                                                "y":288
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
                                                                    "label":" ",
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"petEquReadyPre",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":137,
                                                                                "movable":false,
                                                                                "x":161
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquModPreNeedItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":200,
                                                                                "x":127
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"petEquModPreItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":200,
                                                                                "x":196
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"modPreReqNum",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "center";
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                            this.color = 0xFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":146,
                                                                                "y":236,
                                                                                "width":131,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":36,
                                                                                "y":0x0100,
                                                                                "width":105
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":97,
                                                                                "y":0x0101,
                                                                                "text":"30000",
                                                                                "width":43
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton52",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":147,
                                                                                "y":111,
                                                                                "width":75,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton53",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":117,
                                                                                "y":179,
                                                                                "width":66,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicTxtButton,
                                                                        "id":"_EquiptFuncPanel_BasicTxtButton54",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingLeft = 0;
                                                                            this.paddingRight = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":176,
                                                                                "y":179,
                                                                                "width":91,
                                                                                "height":18
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModPreSucc",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                            this.textAlign = "right";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":0xFF,
                                                                                "width":111.5,
                                                                                "x":45,
                                                                                "height":21
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"petEquModPreInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 14026246;
                                                                            this.textAlign = "left";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":0xFF,
                                                                                "width":155.5,
                                                                                "x":156,
                                                                                "height":35
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DescriptionLabel,
                                                                        "id":"_EquiptFuncPanel_DescriptionLabel15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":215,
                                                                                "y":111,
                                                                                "width":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextArea,
                                                                        "id":"curProp",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "left";
                                                                            this.backgroundAlpha = 0;
                                                                            this.color = 1961723;
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":137,
                                                                                "height":107,
                                                                                "width":109,
                                                                                "x":10,
                                                                                "editable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":TextArea,
                                                                        "id":"maxProp",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.textAlign = "left";
                                                                            this.backgroundAlpha = 0;
                                                                            this.color = 1961723;
                                                                            this.borderStyle = "none";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":137,
                                                                                "height":107,
                                                                                "width":109,
                                                                                "x":258,
                                                                                "editable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"petEquModPreBtn",
                                                                        "events":{"click":"__petEquModPreBtn_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.paddingTop = 1;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "clickDelay":5000,
                                                                                "x":160,
                                                                                "styleName":"BtnStdRed",
                                                                                "width":60,
                                                                                "y":280
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label20",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label21",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":204,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"sublimeEquip",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":129,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"sublimeItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":213,
                                                                                "y":129,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "mouseEnabled":false,
                                                                                "mouseChildren":false,
                                                                                "percentWidth":100,
                                                                                "height":80,
                                                                                "y":187,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":AutoTextArea,
                                                                                    "id":"sublimeHint",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF00;
                                                                                        this.borderStyle = "none";
                                                                                        this.horizontalCenter = "0";
                                                                                        this.verticalCenter = "0";
                                                                                        this.backgroundAlpha = 0;
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HBox,
                                                                        "id":"_EquiptFuncPanel_HBox2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalGap = 0;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":35,
                                                                                "y":169,
                                                                                "width":358,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":AutoTextArea,
                                                                                    "id":"sublimeLeft",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.backgroundAlpha = 0;
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"width":128});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "clipContent":false,
                                                                                            "percentHeight":100,
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Spacer,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"width":12});
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Image,
                                                                                                "id":"_EquiptFuncPanel_Image6",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.verticalCenter = "0";
                                                                                                    this.horizontalCenter = "15";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({"rotation":90});
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":AutoTextArea,
                                                                                    "id":"sublimeRight",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.backgroundAlpha = 0;
                                                                                        this.borderStyle = "none";
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"sublimeConsume",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":250,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HBox,
                                                                        "id":"_EquiptFuncPanel_HBox3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.horizontalGap = 2;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":270,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":CheckBox,
                                                                                    "id":"autoSublime"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_EquiptFuncPanel_Label23",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton23",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton23_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "height":23,
                                                                                "y":282
                                                                            });
                                                                        }
                                                                    })]});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label24",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label25",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":204,
                                                                                "y":107
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlotEquFunc,
                                                                        "id":"restrainEquip",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":129,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"restrainItem",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":213,
                                                                                "y":129,
                                                                                "movable":false
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"restrainHint",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":202,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HBox,
                                                                        "id":"_EquiptFuncPanel_HBox4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalGap = 0;
                                                                            this.verticalAlign = "middle";
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":177,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_EquiptFuncPanel_Label27",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":ComboBox,
                                                                                    "id":"restrainBox",
                                                                                    "events":{"change":"__restrainBox_change"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":95,
                                                                                            "rowCount":4,
                                                                                            "itemRenderer":_EquiptFuncPanel_ClassFactory1_c()
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"restrainView",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":202,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_EquiptFuncPanel_Label29",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.textAlign = "center";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":237,
                                                                                "percentWidth":100
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HBox,
                                                                        "id":"_EquiptFuncPanel_HBox5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.horizontalGap = 2;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "y":0x0101,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":CheckBox,
                                                                                    "id":"autoRestrain"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_EquiptFuncPanel_Label30",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_EquiptFuncPanel_BasicGlowButton24",
                                                                        "events":{"click":"___EquiptFuncPanel_BasicGlowButton24_click"},
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdRed",
                                                                                "height":23,
                                                                                "y":282,
                                                                                "width":50
                                                                            });
                                                                        }
                                                                    })]});
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VRule,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":90,
                                                        "y":8,
                                                        "height":311
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":List,
                                                "id":"creEquFuncList",
                                                "events":{
                                                    "change":"__creEquFuncList_change",
                                                    "creationComplete":"__creEquFuncList_creationComplete"
                                                },
                                                "stylesFactory":function ():void
                                                {
                                                    this.borderSides = "0";
                                                    this.backgroundAlpha = 0;
                                                    this.textRollOverColor = 16366965;
                                                    this.textSelectedColor = 1961723;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":80,
                                                        "height":310,
                                                        "x":10,
                                                        "y":8
                                                    });
                                                }
                                            })]
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
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA0",
                                    "events":{"click":"__tabBtnA0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA1",
                                    "events":{"click":"__tabBtnA1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA2",
                                    "events":{"click":"__tabBtnA2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA3",
                                    "events":{"click":"__tabBtnA3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA4",
                                    "events":{"click":"__tabBtnA4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":66
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtnA5",
                                    "events":{"click":"__tabBtnA5_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "width":66
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"showBag",
                        "events":{"click":"__showBag_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":485,
                                "y":125,
                                "height":155,
                                "width":12,
                                "styleName":"EquipBagRight"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        private var tabInitialized:Array = new Array(false, false, false, false, false, false);
        private var _itemList:Object = {
            "val":new Number(-1),
            "type":new Number(-1),
            "idList":new Array()
        };
        public var introText:IntroText = new IntroText();
        public var equipBag:Object = {};
        private var listArr1:Array = [Language.EQUIPTFUNCPANEL_U[158], Language.EQUIPTFUNCPANEL_U[159], Language.EQUIPTFUNCPANEL_U[160], Language.EQUIPTFUNCPANEL_U[205], Language.EQUIPTFUNCPANEL_U[161], Language.EQUIPTFUNCPANEL_U[176], Language.EQUIPTFUNCPANEL_U[188], Language.EQUIPTFUNCPANEL_U[237]];
        private var listArr2:Array = [Language.EQUIPTFUNCPANEL_U[73], Language.EQUIPTFUNCPANEL_U[74], Language.EQUIPTFUNCPANEL_U[75], Language.EQUIPTFUNCPANEL_U[69], Language.EQUIPTFUNCPANEL_U[199], Language.EQUIPTFUNCPANEL_U[272], Language.EQUIPTFUNCPANEL_U[273]];
        private var SKILL_PROVIDER:ArrayCollection = new ArrayCollection([{
            "position":-1,
            "label":Language.EQUIPTFUNCPANEL_S[81]
        }]);
        public var useEquInfo:ArrayCollection = new ArrayCollection();
        public var equiptClassType:Object = {};
        public var oldSuccData:Object = new Object();
        private var introArr3:Array = [46, 48, 50, 51, 72, 57, 63, 73, 36, 39, 161, 171];
        private var introArr1:Array = [90, 91, 92, 143, 93, 96, 112, 144];
        private var introArr2:Array = [87, 88, 89, 98, 142, 175, 176];
        private var lockImg:Class = EquiptFuncPanel_lockImg;
        public var lockDict:Dictionary = new Dictionary();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function EquiptFuncPanel()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.height = 400;
            this.styleName = "StandardContent";
        }

        public static function isPetEqu(_arg_1:Object):Boolean
        {
            return (((ToolKit.isEqual(_arg_1.kind, GamePredef.ITEM_KIND_PETEQU)) && (ToolKit.isBigOrEqual(_arg_1.position, GamePredef.PETEQU_POS_BEGIN))) && (ToolKit.isSmallOrEqual(_arg_1.position, GamePredef.PETEQU_POS_END)));
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            EquiptFuncPanel._watcherSetupUtil = _arg_1;
        }

        public static function isSpecPetEqu(_arg_1:Object):Boolean
        {
            return (((ToolKit.isEqual(_arg_1.kind, GamePredef.ITEM_KIND_PETEQU)) && (ToolKit.isBigOrEqual(_arg_1.position, 56))) && (ToolKit.isSmallOrEqual(_arg_1.position, 57)));
        }


        public function set equipChange(_arg_1:EquipFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1908571136equipChange;
            if (_local_2 !== _arg_1)
            {
                this._1908571136equipChange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "equipChange", _local_2, _arg_1));
            };
        }

        private function tabBtnAUpdate():void
        {
            var _local_1:int;
            var _local_2:int;
            if (tabA)
            {
                _local_1 = tabA.selectedIndex;
            }
            else
            {
                _local_1 = 0;
            };
            resetItemList();
            switch (_local_1)
            {
                case 0:
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (this[("makeRequire" + _local_2)].giid > 0)
                        {
                            _itemList.idList.push(this[("makeRequire" + _local_2)].giid);
                        };
                        _local_2++;
                    };
                    if (_itemList.idList.length > 0)
                    {
                        _itemList.type = 1;
                    }
                    else
                    {
                        _itemList.type = -1;
                    };
                    equipBag.showItem(_local_1, _itemList);
                    return;
                case 1:
                    equipChange.tabBtnBUpdate();
                    return;
                case 2:
                    _itemList.type = -2;
                    _itemList.idList = [GamePredef.ITEM_TYPE_DIAMOND, GamePredef.ITEM_TYPE_METAL, GamePredef.ITEM_TYPE_WOOD, GamePredef.ITEM_TYPE_JADE, GamePredef.ITEM_TYPE_CLOTH, GamePredef.ITEM_TYPE_FUR];
                    equipBag.showItem(_local_1, _itemList);
                    return;
                case 3:
                    _itemList.type = -2;
                    _itemList.idList = [GamePredef.ITEM_TYPE_JEWEL];
                    equipBag.showItem(_local_1, _itemList);
                    return;
                case 4:
                    tabBtnDUpdate();
                    return;
                case 5:
                    tabBtnCUpdate();
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModBindItem():ItemSlot
        {
            return (this._2008426488petEquModBindItem);
        }

        public function set petEquReadyModBind(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1799691270petEquReadyModBind;
            if (_local_2 !== _arg_1)
            {
                this._1799691270petEquReadyModBind = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquReadyModBind", _local_2, _arg_1));
            };
        }

        public function set petEquModBindItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._2008426488petEquModBindItem;
            if (_local_2 !== _arg_1)
            {
                this._2008426488petEquModBindItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModBindItem", _local_2, _arg_1));
            };
        }

        public function set petEquLevelupBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._1149285369petEquLevelupBtn;
            if (_local_2 !== _arg_1)
            {
                this._1149285369petEquLevelupBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupBtn", _local_2, _arg_1));
            };
        }

        public function set restrainHint(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._506854415restrainHint;
            if (_local_2 !== _arg_1)
            {
                this._506854415restrainHint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restrainHint", _local_2, _arg_1));
            };
        }

        public function validateSublime(slotId:Number, itemSid:Number, needGold:int):void
        {
            var popStr:String;
            var closeHandler:Function;
            if (_sublimeAlert)
            {
                PopUpManager.removePopUp(_sublimeAlert);
                _sublimeAlert = null;
            };
            popStr = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[165], {"money":needGold});
            closeHandler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.NO)
                {
                    return;
                };
                _core.remote.call("onValidateSublime", new Responder(equipChange.onSublimeEquip), slotId, itemSid);
            };
            _sublimeAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _sublimeAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        public function __magEquFuncList_creationComplete(_arg_1:FlexEvent):void
        {
            magEquFuncList.selectedIndex = ((tabD) ? tabD.selectedIndex : 0);
        }

        [Bindable(event="propertyChange")]
        public function get restrainView():Label
        {
            return (this._507271213restrainView);
        }

        [Bindable(event="propertyChange")]
        public function get autoRestrain():CheckBox
        {
            return (this._510410697autoRestrain);
        }

        public function __showBag_click(_arg_1:MouseEvent):void
        {
            changeBagVis();
        }

        private function makeInputItemChange(_arg_1:Event):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            if (!makeList.selectedItem)
            {
                return;
            };
            var _local_2:Object = makeList.selectedItem.equData;
            if (_local_2)
            {
                if (canMake())
                {
                    makeButton.enabled = true;
                    _local_3 = {};
                    _local_4 = 1;
                    while (_local_4 <= 3)
                    {
                        if (this[("makeInputItem" + _local_4)].slotData)
                        {
                            _local_5 = {};
                            if (this[("makeInputItem" + _local_4)].tempBagFlag)
                            {
                                _local_5.tempBagFlag = true;
                                _local_5.idx = this[("makeInputItem" + _local_4)].slotData.idx;
                            }
                            else
                            {
                                _local_5.tempBagFlag = false;
                                _local_5.idx = this[("makeInputItem" + _local_4)].slotData.id;
                            };
                            _local_3[_local_4] = _local_5;
                        };
                        _local_4++;
                    };
                    _core.remote.call("getMakeColor", new Responder(onGetMakeColor), _local_3, _local_2.id);
                }
                else
                {
                    makeButton.enabled = false;
                };
            };
        }

        private function tabBtnCClick(_arg_1:int):void
        {
            tabC.selectedIndex = _arg_1;
            introText.htmlText = Language.EQUIPTFUNCPANEL_S[introArr2[_arg_1]];
            tabBtnCUpdate();
        }

        public function set sublimeConsume(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._638137383sublimeConsume;
            if (_local_2 !== _arg_1)
            {
                this._638137383sublimeConsume = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimeConsume", _local_2, _arg_1));
            };
        }

        private function makeViewClear():void
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                this[("makeRequire" + _local_1)].clean();
                this[("makeInputItem" + _local_1)].clean();
                _local_1++;
            };
            var _local_2:int = 1;
            while (_local_2 <= 4)
            {
                this[("makePer" + _local_2)].text = "0%";
                _local_2++;
            };
            makeAward.clean();
            makeButton.enabled = false;
        }

        public function __petEquStarAllBtn_click(_arg_1:MouseEvent):void
        {
            starAll();
        }

        public function set restrainView(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._507271213restrainView;
            if (_local_2 !== _arg_1)
            {
                this._507271213restrainView = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restrainView", _local_2, _arg_1));
            };
        }

        private function initTab(_arg_1:int):void
        {
            var _local_2:ArrayCollection;
            var _local_3:Object;
            var _local_4:ArrayCollection;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:*;
            var _local_8:*;
            var _local_9:Sort;
            if (!tabInitialized[_arg_1])
            {
                switch (_arg_1)
                {
                    case 0:
                        _local_2 = new ArrayCollection();
                        _local_2.addItem({
                            "cid":"all",
                            "label":Language.EQUIPTFUNCPANEL_S[65]
                        });
                        for each (_local_6 in _core.data.gameData[GamePredef.TBL_CLASS])
                        {
                            if (_local_6)
                            {
                                _local_2.addItem({
                                    "cid":_local_6.id,
                                    "label":_local_6.name
                                });
                            };
                        };
                        classType.dataProvider = _local_2;
                        _local_3 = GamePredef.ITEM_KIND_TYPE;
                        _local_4 = new ArrayCollection();
                        _local_5 = {};
                        useEquTypeInfo = {};
                        equiptClassType = {};
                        for (_local_7 in _local_3)
                        {
                            if ((((_local_7 == GamePredef.ITEM_KIND_PET) || (_local_7 == GamePredef.ITEM_KIND_ITEM)) || (_local_7 == GamePredef.ITEM_KIND_MATERIAL))) break;
                            if (((GamePredef.ITEM_KIND_NAME[_local_7] == Language.GAMEPREDEF_S[167]) || (GamePredef.ITEM_KIND_NAME[_local_7] == Language.GAMEPREDEF_S[168])))
                            {
                                useEquTypeInfo[Number((_local_7 * 100))] = new ArrayCollection();
                                useEquTypeInfo[Number((_local_7 * 100))].removeAll();
                            };
                            _local_5[_local_7] = new ArrayCollection();
                            for (_local_8 in _local_3[_local_7])
                            {
                                _local_5[_local_7].addItem({
                                    "label":GamePredef.ITEM_TYPE_NAME[_local_8],
                                    "kind":_local_7,
                                    "type":_local_8
                                });
                                if (((GamePredef.ITEM_KIND_NAME[_local_7] == Language.GAMEPREDEF_S[167]) || (GamePredef.ITEM_KIND_NAME[_local_7] == Language.GAMEPREDEF_S[168])))
                                {
                                    useEquTypeInfo[Number((_local_7 * 100))].addItem(Number(_local_8));
                                };
                            };
                            _local_9 = new Sort();
                            _local_9.fields = [new SortField("type", true)];
                            _local_5[_local_7].sort = _local_9;
                            _local_5[_local_7].refresh();
                            _local_4.addItem({
                                "label":GamePredef.ITEM_KIND_NAME[_local_7],
                                "kind":_local_7,
                                "children":_local_5[_local_7]
                            });
                        };
                        useEquInfo.removeAll();
                        useEquInfo = _local_4;
                        makeTree.dataProvider = _local_4;
                        break;
                };
                tabInitialized[_arg_1] = true;
                activatePanel(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get lock2():CheckBox
        {
            return (this._103145575lock2);
        }

        public function set petEquModColorMoney(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._988812235petEquModColorMoney;
            if (_local_2 !== _arg_1)
            {
                this._988812235petEquModColorMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModColorMoney", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lock0():CheckBox
        {
            return (this._103145573lock0);
        }

        [Bindable(event="propertyChange")]
        public function get lock1():CheckBox
        {
            return (this._103145574lock1);
        }

        public function set autoRestrain(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._510410697autoRestrain;
            if (_local_2 !== _arg_1)
            {
                this._510410697autoRestrain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoRestrain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get materialMixItem():ItemSlotMaterial
        {
            return (this._402223208materialMixItem);
        }

        [Bindable(event="propertyChange")]
        public function get resetRequireLabel1():DescriptionLabel
        {
            return (this._1031382925resetRequireLabel1);
        }

        [Bindable(event="propertyChange")]
        public function get materialButtonOne():BasicGlowButton
        {
            return (this._192872339materialButtonOne);
        }

        private function starViewClear(_arg_1:int):void
        {
            if (_arg_1 == 5)
            {
                petEquStarItem.clean();
                petEquStarJewel.clean();
                petEquStarInfo1.label = "";
                petEquStarInfo2.label = "";
            };
            starNum = NaN;
        }

        public function __actBtn1_click(_arg_1:MouseEvent):void
        {
            activateMWPro(1);
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarBasic():NumericStepper
        {
            return (this._418363278petEquStarBasic);
        }

        public function ___EquiptFuncPanel_Canvas7_creationComplete(_arg_1:FlexEvent):void
        {
            initMWPLvUp();
        }

        [Bindable(event="propertyChange")]
        public function get resetRequireLabel2():DescriptionLabel
        {
            return (this._1031382924resetRequireLabel2);
        }

        private function MWResetSkillViewClear():void
        {
            ((MWSkills) && (MWSkills.close()));
            if (MWSkills)
            {
                MWSkills.selectedIndex = 0;
            };
            ((MWResetSkill) && (MWResetSkill.clean()));
            ((redStoneNeed) && (redStoneNeed.clean()));
        }

        public function ___EquiptFuncPanel_Canvas11_creationComplete(_arg_1:FlexEvent):void
        {
            initMWPSkill();
        }

        public function onSuccinctMW(obj:Object):void
        {
            var view:Object;
            var i:int;
            var succ:* = undefined;
            var proInfo:Object;
            var colorCode:int;
            var j:int;
            var yesAlert:String;
            var func:Function;
            succinctBtn.enabled = true;
            if (!obj)
            {
                return;
            };
            if (obj.newPro)
            {
                i = 0;
                while (i < 3)
                {
                    succ = obj.newPro[("succ" + i)];
                    if (succ)
                    {
                        proInfo = GamePredef.ACTIVATE_MW_PRO[succ["propType"]];
                        j = 0;
                        while (j < 4)
                        {
                            if (Number(succ["propVal"]) <= proInfo[("top" + j)])
                            {
                                colorCode = j;
                                break;
                            };
                            j = (j + 1);
                        };
                        if (((!(obj.lockArr[i])) && (colorCode == 3)))
                        {
                            yesAlert = Alert.yesLabel;
                            if (_reAlert)
                            {
                                PopUpManager.removePopUp(_reAlert);
                                _reAlert = null;
                            };
                            func = function (_arg_1:CloseEvent):void
                            {
                                Alert.yesLabel = yesAlert;
                            };
                            Alert.yesLabel = Language.EQUIPTFUNCPANEL_U[236];
                            _reAlert = Alert.show(Language.EQUIPTFUNCPANEL_U[235], "", Alert.YES, null, func);
                            break;
                        };
                    };
                    i = (i + 1);
                };
            };
            this.updateMWSuccView(null, obj.newPro);
            view = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
            if (view)
            {
                view.updateItemNum();
            };
        }

        private function petEquModPre():void
        {
            var _local_1:Object;
            var _local_2:Number;
            var _local_3:Number;
            petEquModPreSucc.text = "";
            if (((petEquReadyPre.slotData) && (petEquModPreItem.slotData)))
            {
                if (!_core.player.enoughMoneyAuto(1, GamePredef.MONEY_EQUFUNC_ELEMENT))
                {
                    petEquModPreInfo.htmlText = Language.EQUIPTFUNCPANEL_S[32];
                    return;
                };
                if (!ToolKit.isBigOrEqual(petEquModPreItem.stackNum, modPreReq))
                {
                    petEquModPreInfo.htmlText = Language.EQUIPTFUNCPANEL_S[56];
                    return;
                };
                _local_1 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][petEquReadyPre.slotData.itemId];
                if (_local_1.color < 3)
                {
                    petEquModPreInfo.htmlText = Language.EQUIPTFUNCPANEL_S[141];
                    return;
                };
                _local_2 = petEquReadyPre.slotData.id;
                _local_3 = petEquModPreItem.slotData.id;
                _core.remote.call("petEquModPre", new Responder(onPetEquModPre), _local_2, _local_3);
            };
        }

        public function validateSublimePet(slotId:Number, itemSid:Number, needGold:int):void
        {
            var popStr:String;
            var closeHandler:Function;
            if (_sublimePet)
            {
                PopUpManager.removePopUp(_sublimePet);
                _sublimePet = null;
            };
            popStr = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[165], {"money":needGold});
            closeHandler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.NO)
                {
                    return;
                };
                _core.remote.call("onValidateSublimePet", new Responder(onSublimePetEquip), slotId, itemSid);
            };
            _sublimePet = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _sublimePet.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        public function set jewelUpdateButtonOne(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1991736392jewelUpdateButtonOne;
            if (_local_2 !== _arg_1)
            {
                this._1991736392jewelUpdateButtonOne = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdateButtonOne", _local_2, _arg_1));
            };
        }

        private function mwResetPropChange(e:Event):void
        {
            var mwInst:Object;
            var onQueryMWResetPropMax:Function;
            var mwRate:Number;
            if (mwResetProp.slotData)
            {
                resetRequireLabel1.text = (Language.EQUIPTFUNCPANEL_U[192] + GamePredef.RESET_SPIRITUALITY_NEED);
                resetRequireLabel2.text = (Language.EQUIPTFUNCPANEL_U[193] + GamePredef.RESET_STONE_NEED);
                mwInst = _core.data.getGameData(mwResetProp.slotData.type, mwResetProp.slotData.itemId);
                curPropTA.htmlText = (Language.EQUIPTFUNCPANEL_U[194] + "<br/>");
                if (mwInst.mainProp1 > 0)
                {
                    mwRate = ((GamePredef.MW_GROW_MAP[mwInst.mainProp1]) ? GamePredef.MW_GROW_MAP[mwInst.mainProp1][mwInst.upgradeNum] : 1);
                    curPropTA.htmlText = (curPropTA.htmlText + ((((GamePredef.EQUIPT_PROP_NAME[mwInst.mainProp1] + ": ") + int((mwInst.mainPropNum1 * mwRate))) + (((mwInst.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (mwInst.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "<br/>"));
                };
                if (mwInst.mainProp2 > 0)
                {
                    mwRate = ((GamePredef.MW_GROW_MAP[mwInst.mainProp2]) ? GamePredef.MW_GROW_MAP[mwInst.mainProp2][mwInst.upgradeNum] : 1);
                    curPropTA.htmlText = (curPropTA.htmlText + (((GamePredef.EQUIPT_PROP_NAME[mwInst.mainProp2] + ": ") + int((mwInst.mainPropNum2 * mwRate))) + (((mwInst.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (mwInst.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")));
                };
                onQueryMWResetPropMax = function (_arg_1:Object):void
                {
                    var _local_2:*;
                    if (_arg_1.succ)
                    {
                        maxPropTA.htmlText = (Language.EQUIPTFUNCPANEL_U[195] + "<br/>");
                        if (mwInst.mainProp1 > 0)
                        {
                            _local_2 = ((GamePredef.MW_GROW_MAP[mwInst.mainProp1]) ? GamePredef.MW_GROW_MAP[mwInst.mainProp1][mwInst.upgradeNum] : 1);
                            maxPropTA.htmlText = (maxPropTA.htmlText + ((((GamePredef.EQUIPT_PROP_NAME[mwInst.mainProp1] + ": ") + int((_arg_1.maxMainPropNum1 * _local_2))) + (((mwInst.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (mwInst.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "<br/>"));
                        };
                        if (mwInst.mainProp2 > 0)
                        {
                            _local_2 = ((GamePredef.MW_GROW_MAP[mwInst.mainProp2]) ? GamePredef.MW_GROW_MAP[mwInst.mainProp2][mwInst.upgradeNum] : 1);
                            maxPropTA.htmlText = (maxPropTA.htmlText + (((GamePredef.EQUIPT_PROP_NAME[mwInst.mainProp2] + ": ") + int((_arg_1.maxMainPropNum2 * _local_2))) + (((mwInst.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (mwInst.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")));
                        };
                    };
                };
                _core.remote.call("queryMWResetPropMax", new Responder(onQueryMWResetPropMax), mwResetProp.slotData.id);
            }
            else
            {
                MWResetPropViewClear();
            };
        }

        [Bindable(event="propertyChange")]
        public function get restrainItem():ItemSlot
        {
            return (this._506894491restrainItem);
        }

        public function __tabBtnA0_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(0);
        }

        private function resetItemList():void
        {
            _itemList.val = -1;
            _itemList.type = -1;
            _itemList.idList = [];
        }

        [Bindable(event="propertyChange")]
        public function get petEquReadyModColor():ItemSlotEquFunc
        {
            return (this._43044678petEquReadyModColor);
        }

        public function __makeTree_change(_arg_1:ListEvent):void
        {
            makeTreeChange();
        }

        public function set petEquLevelupInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1267905437petEquLevelupInfo;
            if (_local_2 !== _arg_1)
            {
                this._1267905437petEquLevelupInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupInfo", _local_2, _arg_1));
            };
        }

        private function MWResetPropViewClear():void
        {
            ((mwResetProp) && (mwResetProp.clean()));
            ((resetStoneNeed) && (resetStoneNeed.clean()));
            if (curPropTA)
            {
                curPropTA.htmlText = "";
            };
            if (maxPropTA)
            {
                maxPropTA.htmlText = "";
            };
            if (resetRequireLabel1)
            {
                resetRequireLabel1.text = "";
            };
            if (resetRequireLabel2)
            {
                resetRequireLabel2.text = "";
            };
        }

        override public function update():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, updateLater);
                return;
            };
            if (visible)
            {
                this.activatePanel(tabA.selectedIndex);
                tabBtnAUpdate();
            }
            else
            {
                this.deactivatePanel(tabA.selectedIndex);
            };
        }

        public function set lock0(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._103145573lock0;
            if (_local_2 !== _arg_1)
            {
                this._103145573lock0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upgradeRequireLabel():DescriptionLabel
        {
            return (this._304002869upgradeRequireLabel);
        }

        public function set lock1(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._103145574lock1;
            if (_local_2 !== _arg_1)
            {
                this._103145574lock1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock1", _local_2, _arg_1));
            };
        }

        public function set materialMixItem(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object;
            _local_2 = this._402223208materialMixItem;
            if (_local_2 !== _arg_1)
            {
                this._402223208materialMixItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialMixItem", _local_2, _arg_1));
            };
        }

        public function onStar(_arg_1:Object):void
        {
            var _local_2:* = "";
            if (_arg_1)
            {
                if ((((tabA.selectedIndex == 5) && (ToolKit.isEqual(_arg_1.equSlotId, petEquStarItem.slotData.id))) && (ToolKit.isEqual(_arg_1.starSlotId, petEquStarJewel.slotData.id))))
                {
                    petEquStarOneBtn.enabled = true;
                    petEquStarAllBtn.enabled = true;
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        petEquStarJewel.stackNum = _arg_1.num;
                    }
                    else
                    {
                        petEquStarJewel.clean();
                    };
                };
                starNum = _arg_1.starNum;
                setStarInfo();
                if (_arg_1.flag)
                {
                    _local_2 = Language.EQUIPTFUNCPANEL_S[4];
                    _local_2 = _local_2.replace("{starNum}", starNum);
                    _core.sysMidNote(_local_2);
                }
                else
                {
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[6]);
                };
            };
        }

        public function set lock2(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._103145575lock2;
            if (_local_2 !== _arg_1)
            {
                this._103145575lock2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lock2", _local_2, _arg_1));
            };
        }

        public function ___EquiptFuncPanel_BasicGlowButton9_click(_arg_1:MouseEvent):void
        {
            magicWeaponResolve(1);
        }

        [Bindable(event="propertyChange")]
        public function get classType():ComboBox
        {
            return (this._9686830classType);
        }

        public function set materialButtonOne(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._192872339materialButtonOne;
            if (_local_2 !== _arg_1)
            {
                this._192872339materialButtonOne = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialButtonOne", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get newPro0():TextInput
        {
            return (this._1845096675newPro0);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            update();
        }

        [Bindable(event="propertyChange")]
        public function get newPro2():TextInput
        {
            return (this._1845096677newPro2);
        }

        public function set resetRequireLabel1(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1031382925resetRequireLabel1;
            if (_local_2 !== _arg_1)
            {
                this._1031382925resetRequireLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resetRequireLabel1", _local_2, _arg_1));
            };
        }

        private function tabBtnDClick(_arg_1:int):void
        {
            tabD.selectedIndex = _arg_1;
            introText.htmlText = Language.EQUIPTFUNCPANEL_S[introArr1[_arg_1]];
            tabBtnDUpdate();
        }

        public function set resetRequireLabel2(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1031382924resetRequireLabel2;
            if (_local_2 !== _arg_1)
            {
                this._1031382924resetRequireLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resetRequireLabel2", _local_2, _arg_1));
            };
        }

        public function updateSuccData(_arg_1:int, _arg_2:Object):void
        {
            if (!this.MwSuccinct)
            {
                return;
            };
            if (this.MwSuccinct.giid != _arg_1)
            {
                return;
            };
            this.updateMWSuccView(_arg_2, null);
        }

        [Bindable(event="propertyChange")]
        public function get eTitle():BasicTitleCanvas
        {
            return (this._1322604301eTitle);
        }

        public function __makeTree_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function __tabBtnA5_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(5);
        }

        [Bindable(event="propertyChange")]
        public function get actBtn0():BasicGlowButton
        {
            return (this._1162960634actBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get actBtn2():BasicGlowButton
        {
            return (this._1162960632actBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get newPro1():TextInput
        {
            return (this._1845096676newPro1);
        }

        public function set nextPetEqu(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1363735427nextPetEqu;
            if (_local_2 !== _arg_1)
            {
                this._1363735427nextPetEqu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPetEqu", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get actBtn1():BasicGlowButton
        {
            return (this._1162960633actBtn1);
        }

        private function sublimePetHandler(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:String;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:Boolean;
            _arg_1.stopImmediatePropagation();
            if (((!(sublimeEquip)) || (!(sublimeEquip.slotData))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[177]);
                return;
            };
            if ((((sublimeItem) && (sublimeItem.slotData)) && (!(sublimeItem.slotData.tid == GamePredef.SUBLIME_ITEMID))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[164]);
                return;
            };
            _local_2 = sublimeEquip.slotData;
            _local_3 = _core.data.getGameData(_local_2.type, _local_2.itemId);
            if (((!(_local_3)) || (!(ToolKit.isEqual(_local_3.binded, 1)))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[177]);
                return;
            };
            _local_4 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_3.tid];
            if (((!(_local_4)) || (!(int(_local_4.kind) == 9))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[177]);
                return;
            };
            if (((!(_local_3.hasOwnProperty("color"))) || (Number(_local_3.color) < 3)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[177]);
                return;
            };
            _local_5 = ((_local_3.flag) ? JSONUtil.JSONfy(_local_3.flag) : "");
            _local_6 = ((_local_5) ? com.adobe.serialization.json.JSON.decode(_local_5) : null);
            _local_7 = ((_local_6) ? int(_local_6.sublimeId) : 0);
            if (_local_7 >= GamePredef.SUBLIME_MAX)
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[178]);
                return;
            };
            _local_8 = (((sublimeItem) && (sublimeItem.slotData)) ? sublimeItem.slotData.id : null);
            _local_9 = ((autoSublime) && (autoSublime.selected));
            _core.remote.call("sublimePetEquip", new Responder(onSublimePetEquip), sublimeEquip.slotData.id, _local_8, _local_9);
        }

        [Bindable(event="propertyChange")]
        public function get makeAward():ItemSlot
        {
            return (this._1238698255makeAward);
        }

        private function magicWeaponResetProp():void
        {
            var mwInst:Object;
            var onMagicWeaponResetProp:Function;
            if (!mwResetProp.slotData)
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[109]);
                return;
            };
            mwInst = _core.data.getGameData(mwResetProp.slotData.type, mwResetProp.slotData.itemId);
            if (!ToolKit.isEqual(mwInst.binded, 1))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[115]);
                return;
            };
            if (ToolKit.isSmallThan(mwInst.upgradeNum, GamePredef.MAGIC_WEAPON_RESET_LEVEL_LIMIT))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[116]);
                return;
            };
            if (((!(_core.player.property)) || (!(Number(_core.player.property.spirituality) >= GamePredef.RESET_SPIRITUALITY_NEED))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[110]);
                return;
            };
            if (((!(resetStoneNeed.slotData)) || (!(Number(resetStoneNeed.stackNum) >= GamePredef.RESET_STONE_NEED))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[111]);
                return;
            };
            onMagicWeaponResetProp = function (_arg_1:Object):void
            {
                if (_arg_1.succ)
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        resetStoneNeed.stackNum = _arg_1.num;
                    }
                    else
                    {
                        resetStoneNeed.clean();
                    };
                };
            };
            _core.remote.call("magicWeaponResetProp", new Responder(onMagicWeaponResetProp), mwResetProp.slotData.id, resetStoneNeed.slotData.id);
        }

        private function _EquiptFuncPanel_bindingsSetup():Array
        {
            var result:Array;
            var binding:Binding;
            result = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eTitle.text = _arg_1;
            }, "eTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[57];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeCanvas.label = _arg_1;
            }, "makeCanvas.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton1.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton1.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton1.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton2.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton2.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton3.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton3.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeButton.label = _arg_1;
            }, "makeButton.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[32];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton4.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton4.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[61];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas4.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas4.label");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_CHARACTER);
            }, function (_arg_1:Object):void
            {
                _EquiptFuncPanel_Image1.source = _arg_1;
            }, "_EquiptFuncPanel_Image1.source");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                materialButtonAll.label = _arg_1;
            }, "materialButtonAll.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                materialButtonOne.label = _arg_1;
            }, "materialButtonOne.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[41];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton6.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton6.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton7.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton7.label");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton8.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton8.label");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[62];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas5.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas5.label");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_CHARACTER);
            }, function (_arg_1:Object):void
            {
                _EquiptFuncPanel_Image2.source = _arg_1;
            }, "_EquiptFuncPanel_Image2.source");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                jewelUpdateButtonAll.label = _arg_1;
            }, "jewelUpdateButtonAll.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                jewelUpdateButtonOne.label = _arg_1;
            }, "jewelUpdateButtonOne.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[42];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton10.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton10.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton11.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton11.label");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton12.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton12.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton13.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton13.label");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas6.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas6.label");
            result[23] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_MAGIC_WEAPON);
            }, function (_arg_1:Object):void
            {
                _EquiptFuncPanel_Image3.source = _arg_1;
            }, "_EquiptFuncPanel_Image3.source");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[158];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas7.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas7.label");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_MAIN);
            }, function (_arg_1:Object):void
            {
                MWChangeLevel.acceptObj = _arg_1;
            }, "MWChangeLevel.acceptObj");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton7.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton7.label");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[164];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel1.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel1.text");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[166];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton14.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton14.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = (Language.EQUIPTFUNCPANEL_U[204] + spirituality);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                spiritualityLabel.text = _arg_1;
            }, "spiritualityLabel.text");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[165];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upgradeRequireLabel.text = _arg_1;
            }, "upgradeRequireLabel.text");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[159];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas8.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas8.label");
            result[32] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW);
            }, function (_arg_1:Object):void
            {
                MWResolve.acceptObj = _arg_1;
            }, "MWResolve.acceptObj");
            result[33] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({
                    "kinds":{"5":true},
                    "ids":{
                        "4905":true,
                        "4906":true,
                        "4907":true,
                        "3849":true,
                        "3850":true,
                        "3851":true,
                        "3852":true,
                        "3853":true,
                        "3854":true,
                        "0x0F0F":true,
                        "3856":true,
                        "3857":true,
                        "3858":true
                    }
                });
            }, function (_arg_1:Object):void
            {
                MWResolve2.acceptObj = _arg_1;
            }, "MWResolve2.acceptObj");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton8.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton8.label");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton9.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton9.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[167];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton15.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton15.label");
            result[37] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[277];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton16.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton16.label");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[168];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton17.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton17.label");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[160];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas9.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas9.label");
            result[40] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW);
            }, function (_arg_1:Object):void
            {
                MWRepair.acceptObj = _arg_1;
            }, "MWRepair.acceptObj");
            result[41] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"510":true}});
            }, function (_arg_1:Object):void
            {
                blueStoneNeed.acceptObj = _arg_1;
            }, "blueStoneNeed.acceptObj");
            result[42] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[162];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton10.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton10.label");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[169];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton18.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton18.label");
            result[44] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[170];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton19.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton19.label");
            result[45] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[205];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mwSuccinctCanvas.label = _arg_1;
            }, "mwSuccinctCanvas.label");
            result[46] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_SUB);
            }, function (_arg_1:Object):void
            {
                MwSuccinct.acceptObj = _arg_1;
            }, "MwSuccinct.acceptObj");
            result[47] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[206];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label2.text = _arg_1;
            }, "_EquiptFuncPanel_Label2.text");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[207];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label3.text = _arg_1;
            }, "_EquiptFuncPanel_Label3.text");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.VIP_SUCCINCT_P[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoBuy.label = _arg_1;
            }, "autoBuy.label");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[224];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                autoBuy.toolTip = _arg_1;
            }, "autoBuy.toolTip");
            result[51] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[214];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn0.label = _arg_1;
            }, "actBtn0.label");
            result[52] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[232];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn0.toolTip = _arg_1;
            }, "actBtn0.toolTip");
            result[53] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[214];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn1.label = _arg_1;
            }, "actBtn1.label");
            result[54] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[232];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn1.toolTip = _arg_1;
            }, "actBtn1.toolTip");
            result[55] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[214];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn2.label = _arg_1;
            }, "actBtn2.label");
            result[56] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[232];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                actBtn2.toolTip = _arg_1;
            }, "actBtn2.toolTip");
            result[57] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock0.label = _arg_1;
            }, "lock0.label");
            result[58] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock0.toolTip = _arg_1;
            }, "lock0.toolTip");
            result[59] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock1.label = _arg_1;
            }, "lock1.label");
            result[60] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock1.toolTip = _arg_1;
            }, "lock1.toolTip");
            result[61] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock2.label = _arg_1;
            }, "lock2.label");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[210];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                lock2.toolTip = _arg_1;
            }, "lock2.toolTip");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[212];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton14.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton14.label");
            result[64] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[211];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                succinctBtn.label = _arg_1;
            }, "succinctBtn.label");
            result[65] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[213];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton16.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton16.label");
            result[66] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[161];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas11.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas11.label");
            result[67] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_MAIN);
            }, function (_arg_1:Object):void
            {
                MWResetSkill.acceptObj = _arg_1;
            }, "MWResetSkill.acceptObj");
            result[68] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"511":true}});
            }, function (_arg_1:Object):void
            {
                redStoneNeed.acceptObj = _arg_1;
            }, "redStoneNeed.acceptObj");
            result[69] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[163];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton17.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton17.label");
            result[70] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[171];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton20.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton20.label");
            result[71] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[172];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton21.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton21.label");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[165];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                transRequireLabel.text = _arg_1;
            }, "transRequireLabel.text");
            result[73] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[164];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel5.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel5.text");
            result[74] = binding;
            binding = new Binding(this, function ():Object
            {
                return (SKILL_PROVIDER);
            }, function (_arg_1:Object):void
            {
                MWSkills.dataProvider = _arg_1;
            }, "MWSkills.dataProvider");
            result[75] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[175];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas12.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas12.label");
            result[76] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_MAIN);
            }, function (_arg_1:Object):void
            {
                MWTransTo.acceptObj = _arg_1;
            }, "MWTransTo.acceptObj");
            result[77] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_MAIN);
            }, function (_arg_1:Object):void
            {
                MWTransFrom.acceptObj = _arg_1;
            }, "MWTransFrom.acceptObj");
            result[78] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"0x0202":true}});
            }, function (_arg_1:Object):void
            {
                transItemNeed.acceptObj = _arg_1;
            }, "transItemNeed.acceptObj");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[175];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton18.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton18.label");
            result[80] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[177];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton22.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton22.label");
            result[81] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[178];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton23.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton23.label");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[179];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton24.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton24.label");
            result[83] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[188];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas13.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas13.label");
            result[84] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_MAIN);
            }, function (_arg_1:Object):void
            {
                mwResetProp.acceptObj = _arg_1;
            }, "mwResetProp.acceptObj");
            result[85] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"519":true}});
            }, function (_arg_1:Object):void
            {
                resetStoneNeed.acceptObj = _arg_1;
            }, "resetStoneNeed.acceptObj");
            result[86] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[189];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton19.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton19.label");
            result[87] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[190];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton25.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton25.label");
            result[88] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[191];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton26.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton26.label");
            result[89] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[192];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resetRequireLabel1.text = _arg_1;
            }, "resetRequireLabel1.text");
            result[90] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[193];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                resetRequireLabel2.text = _arg_1;
            }, "resetRequireLabel2.text");
            result[91] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[160];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas14.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas14.label");
            result[92] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[238];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton27.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton27.label");
            result[93] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_MW_MAIN);
            }, function (_arg_1:Object):void
            {
                stageEqu.acceptObj = _arg_1;
            }, "stageEqu.acceptObj");
            result[94] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[239];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton28.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton28.label");
            result[95] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"522":true}});
            }, function (_arg_1:Object):void
            {
                stageItem.acceptObj = _arg_1;
            }, "stageItem.acceptObj");
            result[96] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                hintTxt.filters = _arg_1;
            }, "hintTxt.filters");
            result[97] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[240];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hintTxt.htmlText = _arg_1;
            }, "hintTxt.htmlText");
            result[98] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(hintTxt.visible));
            }, function (_arg_1:Boolean):void
            {
                _EquiptFuncPanel_Canvas15.visible = _arg_1;
            }, "_EquiptFuncPanel_Canvas15.visible");
            result[99] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.UP_ARROW);
            }, function (_arg_1:Object):void
            {
                _EquiptFuncPanel_Image4.source = _arg_1;
            }, "_EquiptFuncPanel_Image4.source");
            result[100] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(hintTxt.visible));
            }, function (_arg_1:Boolean):void
            {
                consumeTxt.visible = _arg_1;
            }, "consumeTxt.visible");
            result[101] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                consumeTxt.filters = _arg_1;
            }, "consumeTxt.filters");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[242];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton20.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton20.label");
            result[103] = binding;
            binding = new Binding(this, function ():Object
            {
                return (listArr1);
            }, function (_arg_1:Object):void
            {
                magEquFuncList.dataProvider = _arg_1;
            }, "magEquFuncList.dataProvider");
            result[104] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Canvas16.label = _arg_1;
            }, "_EquiptFuncPanel_Canvas16.label");
            result[105] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.TOTEM_PET_EQUIP);
            }, function (_arg_1:Object):void
            {
                _EquiptFuncPanel_Image5.source = _arg_1;
            }, "_EquiptFuncPanel_Image5.source");
            result[106] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                petEquStarItem.acceptObj = _arg_1;
            }, "petEquStarItem.acceptObj");
            result[107] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEquStarAllBtn.label = _arg_1;
            }, "petEquStarAllBtn.label");
            result[108] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEquStarOneBtn.label = _arg_1;
            }, "petEquStarOneBtn.label");
            result[109] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[33];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton31.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton31.label");
            result[110] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton32.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton32.label");
            result[111] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton33.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton33.label");
            result[112] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton34.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton34.label");
            result[113] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton35.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton35.label");
            result[114] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton36.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton36.label");
            result[115] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                petEquReadyLevelup.acceptObj = _arg_1;
            }, "petEquReadyLevelup.acceptObj");
            result[116] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquLevelupItemNeed.slotType = _arg_1;
            }, "petEquLevelupItemNeed.slotType");
            result[117] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_ITEM_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEquLevelupItemNeed.acceptType = _arg_1;
            }, "petEquLevelupItemNeed.acceptType");
            result[118] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquLevelupItem.slotType = _arg_1;
            }, "petEquLevelupItem.slotType");
            result[119] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.TBL_ITEM_INSTANCE]);
            }, function (_arg_1:Array):void
            {
                petEquLevelupItem.acceptType = _arg_1;
            }, "petEquLevelupItem.acceptType");
            result[120] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton37.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton37.label");
            result[121] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[77];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton38.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton38.label");
            result[122] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton39.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton39.label");
            result[123] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton40.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton40.label");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[80];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton41.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton41.label");
            result[125] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[81];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton42.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton42.label");
            result[126] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel8.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel8.text");
            result[127] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel9.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel9.text");
            result[128] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEquLevelupBtn.label = _arg_1;
            }, "petEquLevelupBtn.label");
            result[129] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                petEquReadyModColor.acceptObj = _arg_1;
            }, "petEquReadyModColor.acceptObj");
            result[130] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquModColorNeedItem.slotType = _arg_1;
            }, "petEquModColorNeedItem.slotType");
            result[131] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquModColorItem.slotType = _arg_1;
            }, "petEquModColorItem.slotType");
            result[132] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[82];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton44.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton44.label");
            result[133] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton45.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton45.label");
            result[134] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[83];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton46.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton46.label");
            result[135] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[80];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton47.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton47.label");
            result[136] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel10.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel10.text");
            result[137] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel11.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel11.text");
            result[138] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEquModColorBtn.label = _arg_1;
            }, "petEquModColorBtn.label");
            result[139] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                petEquReadyModBind.acceptObj = _arg_1;
            }, "petEquReadyModBind.acceptObj");
            result[140] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquModBindNeedItem.slotType = _arg_1;
            }, "petEquModBindNeedItem.slotType");
            result[141] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquModBindItem.slotType = _arg_1;
            }, "petEquModBindItem.slotType");
            result[142] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel12.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel12.text");
            result[143] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[82];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton49.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton49.label");
            result[144] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton50.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton50.label");
            result[145] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[83];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton51.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton51.label");
            result[146] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel13.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel13.text");
            result[147] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEquModBindBtn.label = _arg_1;
            }, "petEquModBindBtn.label");
            result[148] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                petEquReadyPre.acceptObj = _arg_1;
            }, "petEquReadyPre.acceptObj");
            result[149] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquModPreNeedItem.slotType = _arg_1;
            }, "petEquModPreNeedItem.slotType");
            result[150] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                petEquModPreItem.slotType = _arg_1;
            }, "petEquModPreItem.slotType");
            result[151] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[52];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel14.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel14.text");
            result[152] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[82];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton52.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton52.label");
            result[153] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton53.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton53.label");
            result[154] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[83];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicTxtButton54.label = _arg_1;
            }, "_EquiptFuncPanel_BasicTxtButton54.label");
            result[155] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.PETFUNCPANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_DescriptionLabel15.text = _arg_1;
            }, "_EquiptFuncPanel_DescriptionLabel15.text");
            result[156] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                petEquModPreBtn.label = _arg_1;
            }, "petEquModPreBtn.label");
            result[157] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[275];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label20.text = _arg_1;
            }, "_EquiptFuncPanel_Label20.text");
            result[158] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label20.filters = _arg_1;
            }, "_EquiptFuncPanel_Label20.filters");
            result[159] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[245];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label21.text = _arg_1;
            }, "_EquiptFuncPanel_Label21.text");
            result[160] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label21.filters = _arg_1;
            }, "_EquiptFuncPanel_Label21.filters");
            result[161] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                sublimeEquip.acceptObj = _arg_1;
            }, "sublimeEquip.acceptObj");
            result[162] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"523":true}});
            }, function (_arg_1:Object):void
            {
                sublimeItem.acceptObj = _arg_1;
            }, "sublimeItem.acceptObj");
            result[163] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[274];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                sublimeHint.htmlText = _arg_1;
            }, "sublimeHint.htmlText");
            result[164] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(sublimeHint.visible));
            }, function (_arg_1:Boolean):void
            {
                _EquiptFuncPanel_HBox2.visible = _arg_1;
            }, "_EquiptFuncPanel_HBox2.visible");
            result[165] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.UP_ARROW);
            }, function (_arg_1:Object):void
            {
                _EquiptFuncPanel_Image6.source = _arg_1;
            }, "_EquiptFuncPanel_Image6.source");
            result[166] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(sublimeHint.visible));
            }, function (_arg_1:Boolean):void
            {
                sublimeConsume.visible = _arg_1;
            }, "sublimeConsume.visible");
            result[167] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                sublimeConsume.filters = _arg_1;
            }, "sublimeConsume.filters");
            result[168] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(sublimeHint.visible));
            }, function (_arg_1:Boolean):void
            {
                _EquiptFuncPanel_HBox3.visible = _arg_1;
            }, "_EquiptFuncPanel_HBox3.visible");
            result[169] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[249];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label23.text = _arg_1;
            }, "_EquiptFuncPanel_Label23.text");
            result[170] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label23.filters = _arg_1;
            }, "_EquiptFuncPanel_Label23.filters");
            result[171] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[248];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton23.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton23.label");
            result[172] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[261];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label24.text = _arg_1;
            }, "_EquiptFuncPanel_Label24.text");
            result[173] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label24.filters = _arg_1;
            }, "_EquiptFuncPanel_Label24.filters");
            result[174] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[262];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label25.text = _arg_1;
            }, "_EquiptFuncPanel_Label25.text");
            result[175] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label25.filters = _arg_1;
            }, "_EquiptFuncPanel_Label25.filters");
            result[176] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ItemSlotEquFunc.EQUIP_PETEQU);
            }, function (_arg_1:Object):void
            {
                restrainEquip.acceptObj = _arg_1;
            }, "restrainEquip.acceptObj");
            result[177] = binding;
            binding = new Binding(this, function ():Object
            {
                return ({"types":{"524":true}});
            }, function (_arg_1:Object):void
            {
                restrainItem.acceptObj = _arg_1;
            }, "restrainItem.acceptObj");
            result[178] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[276];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                restrainHint.text = _arg_1;
            }, "restrainHint.text");
            result[179] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                restrainHint.filters = _arg_1;
            }, "restrainHint.filters");
            result[180] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(restrainHint.visible));
            }, function (_arg_1:Boolean):void
            {
                _EquiptFuncPanel_HBox4.visible = _arg_1;
            }, "_EquiptFuncPanel_HBox4.visible");
            result[181] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[264];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label27.text = _arg_1;
            }, "_EquiptFuncPanel_Label27.text");
            result[182] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label27.filters = _arg_1;
            }, "_EquiptFuncPanel_Label27.filters");
            result[183] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[266];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                restrainView.htmlText = _arg_1;
            }, "restrainView.htmlText");
            result[184] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(restrainHint.visible));
            }, function (_arg_1:Boolean):void
            {
                restrainView.visible = _arg_1;
            }, "restrainView.visible");
            result[185] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                restrainView.filters = _arg_1;
            }, "restrainView.filters");
            result[186] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[268];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label29.htmlText = _arg_1;
            }, "_EquiptFuncPanel_Label29.htmlText");
            result[187] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(restrainHint.visible));
            }, function (_arg_1:Boolean):void
            {
                _EquiptFuncPanel_Label29.visible = _arg_1;
            }, "_EquiptFuncPanel_Label29.visible");
            result[188] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label29.filters = _arg_1;
            }, "_EquiptFuncPanel_Label29.filters");
            result[189] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (!(restrainHint.visible));
            }, function (_arg_1:Boolean):void
            {
                _EquiptFuncPanel_HBox5.visible = _arg_1;
            }, "_EquiptFuncPanel_HBox5.visible");
            result[190] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[269];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_Label30.text = _arg_1;
            }, "_EquiptFuncPanel_Label30.text");
            result[191] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _EquiptFuncPanel_Label30.filters = _arg_1;
            }, "_EquiptFuncPanel_Label30.filters");
            result[192] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[270];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _EquiptFuncPanel_BasicGlowButton24.label = _arg_1;
            }, "_EquiptFuncPanel_BasicGlowButton24.label");
            result[193] = binding;
            binding = new Binding(this, function ():Object
            {
                return (listArr2);
            }, function (_arg_1:Object):void
            {
                creEquFuncList.dataProvider = _arg_1;
            }, "creEquFuncList.dataProvider");
            result[194] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA0.label = _arg_1;
            }, "tabBtnA0.label");
            result[195] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA1.label = _arg_1;
            }, "tabBtnA1.label");
            result[196] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA2.label = _arg_1;
            }, "tabBtnA2.label");
            result[197] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA3.label = _arg_1;
            }, "tabBtnA3.label");
            result[198] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[71];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA4.label = _arg_1;
            }, "tabBtnA4.label");
            result[199] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_U[72];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtnA5.label = _arg_1;
            }, "tabBtnA5.label");
            result[200] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.EQUIPTFUNCPANEL_S[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                showBag.toolTip = _arg_1;
            }, "showBag.toolTip");
            result[201] = binding;
            return (result);
        }

        private function MWTransViewClear():void
        {
            ((MWTransFrom) && (MWTransFrom.clean()));
            ((MWTransTo) && (MWTransTo.clean()));
            ((transItemNeed) && (transItemNeed.clean()));
            if (transRequireLabel)
            {
                transRequireLabel.text = Language.EQUIPTFUNCPANEL_U[165];
            };
        }

        public function set petEquLevelupReqNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1563237501petEquLevelupReqNum;
            if (_local_2 !== _arg_1)
            {
                this._1563237501petEquLevelupReqNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupReqNum", _local_2, _arg_1));
            };
        }

        public function set restrainItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._506894491restrainItem;
            if (_local_2 !== _arg_1)
            {
                this._506894491restrainItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restrainItem", _local_2, _arg_1));
            };
        }

        public function __makeList_itemClick(_arg_1:ListEvent):void
        {
            makeListChange();
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarAllBtn():BasicGlowButton
        {
            return (this._103075529petEquStarAllBtn);
        }

        public function set petEquStarBasic(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._418363278petEquStarBasic;
            if (_local_2 !== _arg_1)
            {
                this._418363278petEquStarBasic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarBasic", _local_2, _arg_1));
            };
        }

        private function jewelUpdateNumChange():void
        {
            jewelUpdatePer.label = ((jewelUpdateNum.value * 20).toString() + "%");
            jewelUpdateItemChange(null);
        }

        public function set petEquLevelupRate(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1267649387petEquLevelupRate;
            if (_local_2 !== _arg_1)
            {
                this._1267649387petEquLevelupRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupRate", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sublimeRight():AutoTextArea
        {
            return (this._1690306823sublimeRight);
        }

        public function __lock0_click(_arg_1:MouseEvent):void
        {
            chageSelected(0);
        }

        public function ___EquiptFuncPanel_BasicGlowButton24_click(_arg_1:MouseEvent):void
        {
            restrainPetHandler(_arg_1);
        }

        public function ___EquiptFuncPanel_BasicGlowButton18_click(_arg_1:MouseEvent):void
        {
            MWTrans();
        }

        public function __petEquStarOneBtn_click(_arg_1:MouseEvent):void
        {
            starOne();
        }

        [Bindable(event="propertyChange")]
        public function get petEquModColorNeedItem():ItemSlot
        {
            return (this._1621769932petEquModColorNeedItem);
        }

        public function set petEquStarJewel(_arg_1:ItemSlotStar):void
        {
            var _local_2:Object;
            _local_2 = this._410852217petEquStarJewel;
            if (_local_2 !== _arg_1)
            {
                this._410852217petEquStarJewel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarJewel", _local_2, _arg_1));
            };
        }

        public function funcBagClickHandler(_arg_1:Event):void
        {
            var _local_6:Array;
            var _local_7:String;
            var _local_8:ItemSlot;
            var _local_9:Boolean;
            var _local_10:String;
            setAutoMatchSlots();
            var _local_2:Object = _arg_1.currentTarget.slotData;
            if (!_local_2)
            {
                return;
            };
            var _local_3:Number = Number(_local_2.sid);
            var _local_4:Object = _core.getTemplateData(_local_2.type, _local_2.itemId);
            if (!_local_4)
            {
                return;
            };
            var _local_5:Array = autoMatchSlots.inputSlots;
            if (((autoMatchSlots.hasReq) && (autoMatchSlots.reqSlots)))
            {
                _local_6 = autoMatchSlots.reqSlots;
                for (_local_7 in _local_6)
                {
                    if (((_local_2.type == _local_6[_local_7].type) && (_local_4.id == _local_6[_local_7].id)))
                    {
                        _local_8 = autoMatchSlots.inputSlots[_local_7];
                        _local_8.slotData = _local_2;
                        _local_8.type = _local_2.type;
                        _local_8.giid = _local_2.itemId;
                        _local_8.stackNum = _local_2.stackNum;
                    };
                };
            }
            else
            {
                _local_6 = autoMatchSlots.reqSlots;
                if (!_local_6)
                {
                    _local_8 = autoMatchSlots.inputSlots[0];
                    _local_8.slotData = _local_2;
                    _local_8.type = _local_2.type;
                    _local_8.giid = _local_2.itemId;
                    _local_8.stackNum = _local_2.stackNum;
                }
                else
                {
                    for (_local_7 in _local_6)
                    {
                        _local_9 = true;
                        for (_local_10 in _local_6[_local_7])
                        {
                            if (_local_10 == "itemType")
                            {
                                if (_local_2.type != _local_6[_local_7][_local_10])
                                {
                                    _local_9 = false;
                                    break;
                                };
                            }
                            else
                            {
                                if (((!(_local_4.hasOwnProperty(_local_10))) || (!(_local_4[_local_10] == _local_6[_local_7][_local_10]))))
                                {
                                    _local_9 = false;
                                    break;
                                };
                            };
                        };
                        if (_local_9)
                        {
                            if ((((autoMatchSlots.orderPut) && (autoMatchSlots.menuArr)) && (_local_2.type == autoMatchSlots.orderType)))
                            {
                                for (_local_7 in autoMatchSlots.menuArr)
                                {
                                    autoMatchSlots.menuArr[_local_7].data.sData = _local_2;
                                };
                                menuPop(autoMatchSlots.menuArr);
                            }
                            else
                            {
                                if (autoMatchSlots.inputSlots[_local_7])
                                {
                                    _local_8 = autoMatchSlots.inputSlots[_local_7];
                                    _local_8.slotData = _local_2;
                                    _local_8.type = _local_2.type;
                                    _local_8.giid = _local_2.itemId;
                                    _local_8.stackNum = _local_2.stackNum;
                                };
                            };
                            break;
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModPreSucc():Label
        {
            return (this._552846995petEquModPreSucc);
        }

        public function _activateMwPro(index:int):void
        {
            var func:Function;
            func = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.nc.call("activateMWPro", new Responder(onActivateMWPro), MwSuccinct.giid, index);
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[216].replace("{num}", GamePredef.MW_PRO_COST), "", (Alert.YES | Alert.NO), null, func);
        }

        [Bindable(event="propertyChange")]
        public function get MwSuccinct():ItemSlotEquFunc
        {
            return (this._273317502MwSuccinct);
        }

        public function set petEquReadyModColor(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._43044678petEquReadyModColor;
            if (_local_2 !== _arg_1)
            {
                this._43044678petEquReadyModColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquReadyModColor", _local_2, _arg_1));
            };
        }

        public function set upgradeRequireLabel(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._304002869upgradeRequireLabel;
            if (_local_2 !== _arg_1)
            {
                this._304002869upgradeRequireLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upgradeRequireLabel", _local_2, _arg_1));
            };
        }

        private function onPetEquReadyModPre(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:*;
            var _local_5:String;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:String;
            if (petEquReadyPre.slotData)
            {
                petEquModPreInfo.htmlText = "";
                _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][petEquReadyPre.slotData.itemId];
                if (_local_2.color < 3)
                {
                    clearPetEquiptPrePanel();
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[140]);
                    return;
                };
                _local_3 = _core.getTemplateData(petEquReadyPre.slotData.type, petEquReadyPre.slotData.itemId, false);
                if (((_local_2) && (_local_3)))
                {
                    _local_4 = GamePredef.EQUIPT_STAR_NUM[_local_2.upgradeNum];
                    _local_5 = ((((((((((Language.EQUIPTFUNCPANEL_U[201] + Language.EQUIPTFUNCPANEL_U[202]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int((_local_2.mainPropNum1 * _local_4))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int((_local_2.mainPropNum2 * _local_4)));
                    if (Number(_local_2.prop1) > 0)
                    {
                        _local_5 = ((((_local_5 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + _local_2.propNum1);
                    };
                    if (Number(_local_2.prop2) > 0)
                    {
                        _local_5 = ((((_local_5 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + _local_2.propNum2);
                    };
                    _local_5 = (((((((((((((_local_5 + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + _local_2.bindMainPropNum1) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + _local_2.bindMainPropNum2) + "%");
                    curProp.htmlText = _local_5;
                    _local_6 = (_local_2.color * 5);
                    if (GamePredef.EQUIPT_QUALITY[_local_6])
                    {
                        _local_7 = GamePredef.EQUIPT_QUALITY[_local_6];
                        _local_8 = ((((((((((Language.EQUIPTFUNCPANEL_U[203] + Language.EQUIPTFUNCPANEL_U[202]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int(Math.round(((_local_3.mainPropNum1 * _local_7) * _local_4)))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int(Math.round(((_local_3.mainPropNum2 * _local_7) * _local_4))));
                        if (Number(_local_2.prop1) > 0)
                        {
                            _local_8 = ((((_local_8 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + Math.round((_local_3.propNum1 * _local_7)));
                        };
                        if (Number(_local_2.prop2) > 0)
                        {
                            _local_8 = ((((_local_8 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + Math.round((_local_3.propNum2 * _local_7)));
                        };
                        _local_8 = (((((((((((((_local_8 + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + Math.round((_local_3.bindPropNum * _local_7))) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + Math.round((_local_3.bindPropNum * _local_7))) + "%");
                        maxProp.htmlText = _local_8;
                    };
                }
                else
                {
                    curProp.htmlText = "";
                    maxProp.htmlText = "";
                };
                if (((_local_3) && (isPetEqu(_local_3))))
                {
                    modPreReq = GamePredef.MODPRE_REQ_NUM[_local_2.color].req;
                    petEquModPreNeedItem.type = GamePredef.TBL_ITEM_TEMPLATE;
                    petEquModPreNeedItem.giid = 3491;
                    if (isSpecPetEqu(_local_3))
                    {
                        if (((StringUtil.beginsWith(_local_3.reqClassId.toString(), "|")) && (StringUtil.endsWith(_local_3.reqClassId.toString(), "|"))))
                        {
                            modPreReq = (modPreReq * 4);
                        }
                        else
                        {
                            modPreReq = (modPreReq * 2);
                        };
                    };
                    modPreReqNum.htmlText = Language.EQUIPTFUNCPANEL_U[84].replace("{num}", modPreReq);
                }
                else
                {
                    modPreReqNum.htmlText = "";
                };
            };
        }

        public function __mwSuccinctCanvas_creationComplete(_arg_1:FlexEvent):void
        {
            initMWPBuild();
        }

        public function updateMWResetView(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Number;
            if (((mwResetProp.slotData) && (mwResetProp.slotData.itemId == _arg_1.itemId)))
            {
                resetRequireLabel1.text = (Language.EQUIPTFUNCPANEL_U[192] + GamePredef.RESET_SPIRITUALITY_NEED);
                resetRequireLabel2.text = (Language.EQUIPTFUNCPANEL_U[193] + GamePredef.RESET_STONE_NEED);
                _local_2 = _core.data.getGameData(mwResetProp.slotData.type, mwResetProp.slotData.itemId);
                curPropTA.htmlText = (Language.EQUIPTFUNCPANEL_U[194] + "<br/>");
                if (_local_2.mainProp1 > 0)
                {
                    _local_3 = ((GamePredef.MW_GROW_MAP[_local_2.mainProp1]) ? GamePredef.MW_GROW_MAP[_local_2.mainProp1][_local_2.upgradeNum] : 1);
                    curPropTA.htmlText = (curPropTA.htmlText + ((((GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1] + ": ") + int((_arg_1.mainPropNum1 * _local_3))) + (((_local_2.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (_local_2.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "<br/>"));
                };
                if (_local_2.mainProp2 > 0)
                {
                    _local_3 = ((GamePredef.MW_GROW_MAP[_local_2.mainProp2]) ? GamePredef.MW_GROW_MAP[_local_2.mainProp2][_local_2.upgradeNum] : 1);
                    curPropTA.htmlText = (curPropTA.htmlText + (((GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2] + ": ") + int((_arg_1.mainPropNum2 * _local_3))) + (((_local_2.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (_local_2.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")));
                };
            }
            else
            {
                if (!mwResetProp.slotData)
                {
                    MWResetPropViewClear();
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModBindInfo():Label
        {
            return (this._2008432221petEquModBindInfo);
        }

        public function set classType(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._9686830classType;
            if (_local_2 !== _arg_1)
            {
                this._9686830classType = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classType", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get modPreReqNum():Label
        {
            return (this._1252811177modPreReqNum);
        }

        public function set tabBtnA0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747498tabBtnA0;
            if (_local_2 !== _arg_1)
            {
                this._933747498tabBtnA0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA0", _local_2, _arg_1));
            };
        }

        public function set tabBtnA1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747497tabBtnA1;
            if (_local_2 !== _arg_1)
            {
                this._933747497tabBtnA1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA1", _local_2, _arg_1));
            };
        }

        public function set consumeTxt(_arg_1:AutoTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._166265644consumeTxt;
            if (_local_2 !== _arg_1)
            {
                this._166265644consumeTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "consumeTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get succinctBtn():BasicGlowButton
        {
            return (this._2124710308succinctBtn);
        }

        [Bindable(event="propertyChange")]
        public function get spiritualityLabel():DescriptionLabel
        {
            return (this._1004296629spiritualityLabel);
        }

        public function set tabBtnA4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747494tabBtnA4;
            if (_local_2 !== _arg_1)
            {
                this._933747494tabBtnA4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA4", _local_2, _arg_1));
            };
        }

        public function set tabBtnA5(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747493tabBtnA5;
            if (_local_2 !== _arg_1)
            {
                this._933747493tabBtnA5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA5", _local_2, _arg_1));
            };
        }

        private function petEquModColorClear():void
        {
            petEquReadyModColor.clean();
            petEquModColorNeedItem.clean();
            petEquModColorItem.clean();
            petEquModColorInfo.text = "";
            petEquModReqNum.text = "";
            petEquModColorMoney.text = "";
        }

        [Bindable(event="propertyChange")]
        public function get curProp():TextArea
        {
            return (this._1125939651curProp);
        }

        public function set MWResolve(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1967342366MWResolve;
            if (_local_2 !== _arg_1)
            {
                this._1967342366MWResolve = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWResolve", _local_2, _arg_1));
            };
        }

        private function MWTransFromChange(_arg_1:Event):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            if (MWTransFrom.slotData)
            {
                _local_2 = _core.data.getData(GamePredef.TBL_EQUIPT_INSTANCE, MWTransFrom.slotData.itemId);
                _local_3 = (((_local_2) && (_local_2.upgradeNum)) || (0));
                _local_4 = (((GamePredef.SPIRITUALITY_COST[_local_3]) || (0)) * GamePredef.MW_TRANS_COST_RATE);
                transRequireLabel.text = (Language.EQUIPTFUNCPANEL_U[165] + _local_4);
            };
        }

        public function set newPro1(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1845096676newPro1;
            if (_local_2 !== _arg_1)
            {
                this._1845096676newPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newPro1", _local_2, _arg_1));
            };
        }

        public function set newPro2(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1845096677newPro2;
            if (_local_2 !== _arg_1)
            {
                this._1845096677newPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newPro2", _local_2, _arg_1));
            };
        }

        private function tabBtnDUpdate():void
        {
            var _local_1:int = ((tabD) ? tabD.selectedIndex : 0);
            resetItemList();
            switch (_local_1)
            {
                case 0:
                case 1:
                    _itemList.type = 1;
                    _itemList.idList = [-1];
                    break;
                case 2:
                    _itemList.type = 1;
                    _itemList.idList = [2330];
                    break;
                case 3:
                    _itemList.type = 1;
                    _itemList.idList = [GamePredef.MW_SUCC_ITEM];
                    this.unselectAutoBuy();
                    break;
                case 4:
                    _itemList.type = 1;
                    _itemList.idList = [2331];
                    break;
                case 5:
                    _itemList.type = 1;
                    _itemList.idList = [2356];
                    break;
                case 6:
                    _itemList.type = 1;
                    _itemList.idList = [3228];
                    break;
                case 7:
                    _itemList.type = 1;
                    _itemList.idList = [GamePredef.STAGE_EIGHT_ITEMID];
                    break;
            };
            equipBag.showItem(4, _itemList);
        }

        public function set tabBtnA2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747496tabBtnA2;
            if (_local_2 !== _arg_1)
            {
                this._933747496tabBtnA2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA2", _local_2, _arg_1));
            };
        }

        public function set makeCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._217727770makeCanvas;
            if (_local_2 !== _arg_1)
            {
                this._217727770makeCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeCanvas", _local_2, _arg_1));
            };
        }

        public function set tabBtnA3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._933747495tabBtnA3;
            if (_local_2 !== _arg_1)
            {
                this._933747495tabBtnA3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtnA3", _local_2, _arg_1));
            };
        }

        public function hasSuccData():Boolean
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < 3)
            {
                if (this[("newPro" + _local_1)].htmlText != "")
                {
                    return (true);
                };
                _local_1++;
            };
            return (false);
        }

        private function canMake():Boolean
        {
            var _local_1:int = 1;
            while (_local_1 <= 3)
            {
                if (!this[("makeInputItem" + _local_1)].tempBagFlag)
                {
                    if (((this[("makeRequire" + _local_1)].type > 0) && (!((this[("makeRequire" + _local_1)].type - 1) == this[("makeInputItem" + _local_1)].type))))
                    {
                        return (false);
                    };
                }
                else
                {
                    if (((this[("makeRequire" + _local_1)].type > 0) && (this[("makeInputItem" + _local_1)].type <= 0)))
                    {
                        return (false);
                    };
                };
                _local_1++;
            };
            return (true);
        }

        public function onGetEquMake(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Sort;
            makeListAC = new ArrayCollection();
            for each (_local_2 in _arg_1)
            {
                if (_local_2)
                {
                    makeListAC.addItem({
                        "name":_local_2.name,
                        "level":(Number(_local_2.reqLevel) + 10000),
                        "equData":_local_2
                    });
                };
            };
            _local_3 = new Sort();
            _local_3.fields = [new SortField("level", true)];
            makeListAC.sort = _local_3;
            makeListAC.refresh();
            makeList.dataProvider = makeListAC;
        }

        public function set eTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1322604301eTitle;
            if (_local_2 !== _arg_1)
            {
                this._1322604301eTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eTitle", _local_2, _arg_1));
            };
        }

        public function set newPro0(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1845096675newPro0;
            if (_local_2 !== _arg_1)
            {
                this._1845096675newPro0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newPro0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get oldPro0():TextInput
        {
            return (this._1379509782oldPro0);
        }

        [Bindable(event="propertyChange")]
        public function get oldPro1():TextInput
        {
            return (this._1379509781oldPro1);
        }

        [Bindable(event="propertyChange")]
        public function get oldPro2():TextInput
        {
            return (this._1379509780oldPro2);
        }

        private function starAll():void
        {
            var equIns:Object;
            var starIns:Object;
            var func:Function;
            var e:CloseEvent;
            if ((((tabA.selectedIndex == 5) && (petEquStarItem.slotData)) && (petEquStarJewel.slotData)))
            {
                equIns = _core.data.gameData[petEquStarItem.slotData.type][petEquStarItem.slotData.itemId];
                starIns = _core.data.gameData[petEquStarJewel.slotData.type][petEquStarJewel.slotData.itemId];
                if (((equIns) && (starIns)))
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("starAll", new Responder(onStar), petEquStarBasic.value, petEquStarItem.slotData.id, petEquStarMax.value, petEquStarJewel.slotData.id);
                            petEquStarOneBtn.enabled = false;
                            petEquStarAllBtn.enabled = false;
                        };
                    };
                    if (((ToolKit.isEqual(equIns.binded, 0)) && (ToolKit.isEqual(starIns.binded, 1))))
                    {
                        Alert.show(Language.EQUIPTFUNCPANEL_S[102], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        e = new CloseEvent("");
                        e.detail = Alert.YES;
                        (func(e));
                    };
                };
            };
        }

        private function restrainPetClear():void
        {
            ((restrainEquip) && (restrainEquip.clean()));
            ((restrainItem) && (restrainItem.clean()));
            if (!restrainHint)
            {
                return;
            };
            restrainHint.visible = true;
            restrainHint.text = Language.EQUIPTFUNCPANEL_U[276];
        }

        private function deactivatePanel(_arg_1:int):void
        {
            var _local_2:int;
            if (!tabInitialized[_arg_1])
            {
                return;
            };
            switch (_arg_1)
            {
                case 0:
                    _local_2 = 1;
                    while (_local_2 <= 3)
                    {
                        if (this[("makeInputItem" + _local_2)])
                        {
                            this[("makeInputItem" + _local_2)].removeEventListener(GameEvent.SLOT_NUM_CHANGE, makeInputItemChange);
                        };
                        _local_2++;
                    };
                    break;
                case 1:
                    break;
                case 2:
                    materialMixItem.removeEventListener(GameEvent.SLOT_NUM_CHANGE, materialMixItemChange);
                    materialMixViewClear();
                    break;
                case 3:
                    jewelUpdateItem1.removeEventListener(GameEvent.SLOT_NUM_CHANGE, jewelUpdateItemChange);
                    jewelUpdateViewClear();
                    break;
                case 4:
                    ((MWResetSkill) && (MWResetSkill.removeEventListener(GameEvent.SLOT_GIID_CHANGE, MWResetSkillChange)));
                    ((MWChangeLevel) && (MWChangeLevel.removeEventListener(GameEvent.SLOT_GIID_CHANGE, MWChangeLevelChange)));
                    ((MWTransFrom) && (MWTransFrom.removeEventListener(GameEvent.SLOT_GIID_CHANGE, MWTransFromChange)));
                    ((mwResetProp) && (mwResetProp.removeEventListener(GameEvent.SLOT_GIID_CHANGE, mwResetPropChange)));
                    ((stageEqu) && (stageEqu.removeEventListener(GameEvent.SLOT_GIID_CHANGE, magicWeaponStageChange)));
                    MWChangeLevelViewClear();
                    MWResolveViewClear();
                    MWRepairViewClear();
                    MWResetSkillViewClear();
                    MWTransViewClear();
                    MWResetPropViewClear();
                    magicWeaponStageViewClear();
                    break;
                case 5:
                    petEquStarItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, starItemChange);
                    petEquStarJewel.removeEventListener(GameEvent.SLOT_NUM_CHANGE, setStarInfo);
                    petEquReadyLevelup.removeEventListener(GameEvent.SLOT_GIID_CHANGE, petEquLevelupChange);
                    petEquLevelupItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, petEquLevelupItemChange);
                    petEquReadyModColor.removeEventListener(GameEvent.SLOT_GIID_CHANGE, petEquModColorChange);
                    petEquModColorItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, petEquModColorItemChange);
                    petEquReadyModBind.removeEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquReadyModBind);
                    petEquModBindItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquModBindItem);
                    petEquReadyPre.removeEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquReadyModPre);
                    petEquModPreItem.removeEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquModPreItem);
                    ((sublimeEquip) && (sublimeEquip.removeEventListener(GameEvent.SLOT_GIID_CHANGE, sublimePetChange)));
                    ((restrainEquip) && (restrainEquip.removeEventListener(GameEvent.SLOT_GIID_CHANGE, restrainPetChange)));
                    starViewClear(_arg_1);
                    petEquLevelupClear();
                    petEquModColorClear();
                    petEquModBindClear();
                    sublimePetClear();
                    restrainPetClear();
                    break;
            };
            eventListenerAdded = false;
        }

        public function set jewelUpdateNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._60073210jewelUpdateNum;
            if (_local_2 !== _arg_1)
            {
                this._60073210jewelUpdateNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdateNum", _local_2, _arg_1));
            };
        }

        public function set petEquModColorItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._799272190petEquModColorItem;
            if (_local_2 !== _arg_1)
            {
                this._799272190petEquModColorItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModColorItem", _local_2, _arg_1));
            };
        }

        public function __petEquModBindBtn_click(_arg_1:MouseEvent):void
        {
            petEquModBind();
        }

        public function setSpirituality(_arg_1:int):void
        {
            spirituality = _arg_1;
            if (((this.visible) && (spiritualityLabel)))
            {
                spiritualityLabel.text = (Language.EQUIPTFUNCPANEL_U[204] + spirituality);
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

        public function set redStoneNeed(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1836823818redStoneNeed;
            if (_local_2 !== _arg_1)
            {
                this._1836823818redStoneNeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "redStoneNeed", _local_2, _arg_1));
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

        public function ___EquiptFuncPanel_Canvas4_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(2);
        }

        public function __creEquFuncList_creationComplete(_arg_1:FlexEvent):void
        {
            creEquFuncList.selectedIndex = 0;
        }

        private function petEquLevelupChange(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (petEquReadyLevelup.slotData)
            {
                _local_2 = _core.getTemplateData(petEquReadyLevelup.slotData.type, petEquReadyLevelup.slotData.itemId, false);
                if (((_local_2) && (isPetEqu(_local_2))))
                {
                    _local_3 = _core.data.getData(GamePredef.TBL_EQUIPT_TEMPLATE, _local_2.nextEquTid);
                    if (_local_3)
                    {
                        nextPetEqu.type = GamePredef.TBL_EQUIPT_TEMPLATE;
                        nextPetEqu.giid = _local_2.nextEquTid;
                        levelupReqId = GamePredef.LEVELUP_REQ_NUM[_local_2.reqLevel].id;
                        levelupReqNum = GamePredef.LEVELUP_REQ_NUM[_local_2.reqLevel].req;
                        if (isSpecPetEqu(_local_2))
                        {
                            if (((StringUtil.beginsWith(_local_2.reqClassId.toString(), "|")) && (StringUtil.endsWith(_local_2.reqClassId.toString(), "|"))))
                            {
                                levelupReqNum = (levelupReqNum * 2);
                            }
                            else
                            {
                                levelupReqNum = Math.round((levelupReqNum * 1.5));
                            };
                        };
                        petEquLevelupItemNeed.type = GamePredef.TBL_ITEM_TEMPLATE;
                        petEquLevelupItemNeed.giid = levelupReqId;
                        petEquLevelupReqNum.htmlText = Language.EQUIPTFUNCPANEL_U[84].replace("{num}", levelupReqNum);
                        petEquLevelupMoney.text = ((_local_3.reqLevel * _local_3.reqLevel) * GamePredef.MONEY_EQUFUNC_MAKE).toString();
                    }
                    else
                    {
                        nextPetEqu.giid = -1;
                    };
                }
                else
                {
                    petEquReadyLevelup.slotData = null;
                    petEquReadyLevelup.clean();
                };
            };
        }

        public function set transItemNeed(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._948574959transItemNeed;
            if (_local_2 !== _arg_1)
            {
                this._948574959transItemNeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "transItemNeed", _local_2, _arg_1));
            };
        }

        public function set makeAward(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1238698255makeAward;
            if (_local_2 !== _arg_1)
            {
                this._1238698255makeAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeAward", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get costInfo():Label
        {
            return (this._425010661costInfo);
        }

        public function set sublimeRight(_arg_1:AutoTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1690306823sublimeRight;
            if (_local_2 !== _arg_1)
            {
                this._1690306823sublimeRight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimeRight", _local_2, _arg_1));
            };
        }

        private function makeTreeChange2():void
        {
            var _local_1:Object;
            var _local_2:ArrayCollection;
            var _local_3:ArrayCollection;
            var _local_4:*;
            var _local_5:*;
            var _local_6:Boolean;
            var _local_7:*;
            if (classType.selectedItem.cid == "all")
            {
                makeTree.dataProvider = useEquInfo;
                makeTreeChange();
                return;
            };
            if (((equiptClassType[Number(classType.selectedItem.cid)]) && (equiptClassType[Number(classType.selectedItem.cid)][0])))
            {
                makeTree.dataProvider = equiptClassType[Number(classType.selectedItem.cid)][0];
            }
            else
            {
                _local_1 = {};
                _local_1 = getThisClassEquiptObject(Number(classType.selectedItem.cid));
                _local_2 = new ArrayCollection();
                _local_2.removeAll();
                _local_3 = new ArrayCollection();
                for (_local_4 in useEquInfo)
                {
                    if (!useEquInfo[_local_4])
                    {
                        return;
                    };
                    if (((useEquInfo[_local_4].label == GamePredef.ITEM_KIND_NAME[GamePredef.ITEM_KIND_MAINHAND]) || (useEquInfo[_local_4].label == GamePredef.ITEM_KIND_NAME[GamePredef.ITEM_KIND_SUBHAND])))
                    {
                        if (!useEquInfo[_local_4].children) continue;
                        for (_local_5 in useEquInfo[_local_4].children)
                        {
                            _local_6 = false;
                            for (_local_7 in _local_1)
                            {
                                if ((((useEquInfo[_local_4].children[_local_5]) && (useEquInfo[_local_4].children[_local_5].type)) && (useEquInfo[_local_4].children[_local_5].type == Number(_local_7))))
                                {
                                    _local_3.addItem({
                                        "label":useEquInfo[_local_4].label,
                                        "kind":useEquInfo[_local_4].kind,
                                        "children":useEquInfo[_local_4].children[_local_5]
                                    });
                                    _local_6 = true;
                                    break;
                                };
                            };
                            if (_local_6) break;
                        };
                    }
                    else
                    {
                        _local_3.addItem({
                            "label":useEquInfo[_local_4].label,
                            "kind":useEquInfo[_local_4].kind,
                            "children":useEquInfo[_local_4].children
                        });
                    };
                };
                if (!equiptClassType[Number(classType.selectedItem.cid)])
                {
                    equiptClassType[Number(classType.selectedItem.cid)] = new ArrayCollection();
                };
                equiptClassType[Number(classType.selectedItem.cid)].removeAll();
                equiptClassType[Number(classType.selectedItem.cid)].addItem(_local_3);
                makeTree.dataProvider = _local_3;
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModPreItem():ItemSlot
        {
            return (this._553145794petEquModPreItem);
        }

        private function materialMixItemChange(_arg_1:Event):void
        {
            var _local_2:int;
            if (materialMixItem.slotData)
            {
                if (materialMixItem.tempBagFlag)
                {
                    _local_2 = int((materialMixItem.slotData.q / 5));
                    if (_local_2 == 4)
                    {
                        materialMixBasicRate = 6;
                    }
                    else
                    {
                        materialMixBasicRate = 20;
                    };
                    materialMixNumChange();
                }
                else
                {
                    _core.remote.call("gdc", new Responder(onMaterialMixIns), GamePredef.TBL_ITEM_INSTANCE, materialMixItem.slotData.itemId);
                };
            };
        }

        private function petEquLevelUp():void
        {
            var _local_1:Number;
            var _local_2:Number;
            if (((petEquReadyLevelup.slotData) && (petEquLevelupItem.slotData)))
            {
                if (_core.player.enoughMoneyAuto(1, Number(petEquLevelupMoney.text)))
                {
                    _local_1 = petEquReadyLevelup.slotData.id;
                    _local_2 = petEquLevelupItem.slotData.id;
                    _core.remote.call("petEquLevelUp", new Responder(onPetEquLevelUp), _local_1, _local_2);
                }
                else
                {
                    petEquLevelupInfo.htmlText = Language.EQUIPTFUNCPANEL_S[32];
                };
            };
        }

        private function makeTreeClick(_arg_1:Event):void
        {
            var _local_2:*;
            if (!makeTree.selectedItem.type)
            {
                if (makeTree.selectedIndex == currentMakeTreeIndex)
                {
                    makeTree.expandItem(makeTree.selectedItem, (!(makeTree.isItemOpen(makeTree.selectedItem))));
                }
                else
                {
                    for each (_local_2 in makeTree.openItems)
                    {
                        makeTree.expandItem(_local_2, false);
                    };
                    makeTree.expandItem(makeTree.selectedItem, (!(makeTree.isItemOpen(makeTree.selectedItem))));
                };
                currentMakeTreeIndex = makeTree.selectedIndex;
            };
        }

        public function ___EquiptFuncPanel_BasicGlowButton7_click(_arg_1:MouseEvent):void
        {
            magicWeaponChangeLevel();
        }

        public function showEquipChangeAlert(_arg_1:Object):void
        {
            if (_arg_1.saveType)
            {
                switch (_arg_1.saveType)
                {
                    case 1:
                        this.onPetEquModBind(_arg_1);
                        return;
                    case 11:
                        equipChange.onChangeSoul(_arg_1);
                        return;
                    case 21:
                        equipChange.onChangeElement(_arg_1);
                        return;
                    case 3:
                        equipChange.onChangePrefix(_arg_1);
                        return;
                    case 4:
                        equipChange.onChangeBind(_arg_1);
                        return;
                    case 6:
                        this.onPetEquModPre(_arg_1);
                        return;
                    case 31:
                        showMWSuccinct(_arg_1);
                        return;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get itemInfo():Label
        {
            return (this._1177195105itemInfo);
        }

        private function materialMixOne():void
        {
            var _local_1:int;
            if (materialMixItem.slotData)
            {
                materialButtonAll.enabled = false;
                materialButtonOne.enabled = false;
                if (materialMixItem.tempBagFlag)
                {
                    _local_1 = materialMixItem.slotData.idx;
                }
                else
                {
                    _local_1 = materialMixItem.slotData.id;
                };
                _core.remote.call("materialMixOne", new Responder(onMaterialMix), materialMixNum.value, _local_1, materialMixItem.tempBagFlag);
            };
        }

        public function set petEquStarAllBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._103075529petEquStarAllBtn;
            if (_local_2 !== _arg_1)
            {
                this._103075529petEquStarAllBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarAllBtn", _local_2, _arg_1));
            };
        }

        public function set petEquModColorNeedItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1621769932petEquModColorNeedItem;
            if (_local_2 !== _arg_1)
            {
                this._1621769932petEquModColorNeedItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModColorNeedItem", _local_2, _arg_1));
            };
        }

        private function materialMixViewClear():void
        {
            materialMixItem.clean();
        }

        private function stageHandler(event:Event):void
        {
            var equSlot:Object;
            var equInst:Object;
            var equMeta:Object;
            var maxPropNum1:int;
            var maxPropNum2:int;
            var finalPropNum1:int;
            var finalPropNum2:int;
            var spiritNum:int;
            var itemNum:int;
            var gameDataIdx:Object;
            var stageMetaDict:Object;
            var charProp:Object;
            var onMagicWeaponStage:Function;
            var stageMeta:Object;
            event.stopImmediatePropagation();
            if (!stageEqu.slotData)
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[145]);
                return;
            };
            equSlot = stageEqu.slotData;
            equInst = _core.data.getGameData(equSlot.type, equSlot.itemId);
            if (!ToolKit.isEqual(equInst.binded, 1))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[146]);
                return;
            };
            if (ToolKit.isSmallThan(equInst.upgradeNum, GamePredef.STAGE_EIGHT_LEVEL))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[146]);
                return;
            };
            equMeta = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][equInst.tid];
            maxPropNum1 = Math.floor((Number(equMeta.mainPropNum1) * GamePredef.STAGE_EIGHT_MIN));
            maxPropNum2 = Math.floor((Number(equMeta.mainPropNum2) * GamePredef.STAGE_EIGHT_MIN));
            if (((Number(equInst.mainPropNum1) < maxPropNum1) || (Number(equInst.mainPropNum2) < maxPropNum2)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[146]);
                return;
            };
            finalPropNum1 = (Number(equMeta.mainPropNum1) * GamePredef.STAGE_EIGHT_MAX);
            finalPropNum2 = (Number(equMeta.mainPropNum2) * GamePredef.STAGE_EIGHT_MAX);
            if (((Number(equInst.mainPropNum1) >= finalPropNum1) || (Number(equInst.mainPropNum2) >= finalPropNum2)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[148]);
                return;
            };
            gameDataIdx = DataManager.getInstance().gameDataIndex;
            stageMetaDict = gameDataIdx[GamePredef.TBL_ARTIFACT][equInst.tid];
            if (((Number(equInst.mainPropNum1) == maxPropNum1) && (Number(equInst.mainPropNum2) == maxPropNum2)))
            {
                for each (stageMeta in stageMetaDict)
                {
                    if (stageMeta.level == 1)
                    {
                        spiritNum = stageMeta.spiritNum;
                        itemNum = stageMeta.itemNum;
                        break;
                    };
                };
            }
            else
            {
                for each (stageMeta in stageMetaDict)
                {
                    if (((equInst.mainPropNum1 == stageMeta.propNum1) && (equInst.mainPropNum2 == stageMeta.propNum2)))
                    {
                        spiritNum = stageMeta.spiritNum;
                        itemNum = stageMeta.itemNum;
                        break;
                    };
                };
            };
            charProp = _core.player.property;
            if (((!(charProp)) || (Number(charProp.spirituality) < spiritNum)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[110]);
                return;
            };
            if (((!(stageItem.slotData)) || (Number(stageItem.stackNum) < itemNum)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[147]);
                return;
            };
            onMagicWeaponStage = function (_arg_1:Object=null):void
            {
                var _local_2:Object;
                var _local_3:Object;
                if (!_arg_1)
                {
                    return;
                };
                ((_arg_1.msg) && (_core.sysMidNote(_arg_1.msg)));
                if (!_arg_1.hasOwnProperty("update"))
                {
                    return;
                };
                _local_2 = stageEqu.slotData;
                if (((!(_local_2)) && (!(_local_2.itemId == _arg_1.itemId))))
                {
                    magicWeaponStageViewClear();
                    return;
                };
                _local_3 = _dm.getGameData(_local_2.type, _local_2.itemId);
                if (_arg_1.hasOwnProperty("flagStr"))
                {
                    _local_3.flag = _arg_1.flagStr;
                };
                if (_arg_1.hasOwnProperty("propNum1"))
                {
                    _local_3.mainPropNum1 = _arg_1.propNum1;
                    _local_3.mainPropNum2 = _arg_1.propNum2;
                };
                _dm.updateData(_local_2.type, _local_3);
                if (_arg_1.hasOwnProperty("num"))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        stageItem.stackNum = _arg_1.num;
                    }
                    else
                    {
                        stageItem.clean();
                    };
                };
                magicWeaponStageChange();
            };
            _core.remote.call("magicWeaponStage", new Responder(onMagicWeaponStage), stageEqu.slotData.id, stageItem.slotData.id);
        }

        public function set materialMixPer(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._1788134104materialMixPer;
            if (_local_2 !== _arg_1)
            {
                this._1788134104materialMixPer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialMixPer", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hintTxt():TextArea
        {
            return (this._922290793hintTxt);
        }

        public function __tabBtnA3_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(3);
        }

        private function makeListChange(_arg_1:Boolean=true):void
        {
            var _local_2:Object;
            var _local_3:int;
            makeViewClear();
            if (makeList.selectedItem)
            {
                _local_2 = makeList.selectedItem.equData;
                resetItemList();
                if (_local_2)
                {
                    makeAward.type = GamePredef.TBL_EQUIPT_TEMPLATE;
                    makeAward.giid = _local_2.id;
                    _local_3 = 1;
                    while (_local_3 <= 3)
                    {
                        if (ToolKit.isBigThan(_local_2[("requireItem" + _local_3)], 0))
                        {
                            this[("makeRequire" + _local_3)].type = GamePredef.TBL_ITEM_TEMPLATE;
                            this[("makeRequire" + _local_3)].giid = _local_2[("requireItem" + _local_3)];
                            this[("makeRequire" + _local_3)].stackNum = _local_2[("requireNum" + _local_3)];
                            this[("makeInputItem" + _local_3)].requireSlot = {
                                "type":GamePredef.TBL_ITEM_TEMPLATE,
                                "giid":_local_2[("requireItem" + _local_3)],
                                "stackNum":_local_2[("requireNum" + _local_3)]
                            };
                            _itemList.idList.push(this[("makeRequire" + _local_3)].giid);
                        };
                        _local_3++;
                    };
                    _itemList.type = 1;
                    if (_arg_1)
                    {
                        equipBag.showItem(tabA.selectedIndex, _itemList);
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarOneBtn():BasicGlowButton
        {
            return (this._299371090petEquStarOneBtn);
        }

        public function set modBindReqNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1232558777modBindReqNum;
            if (_local_2 !== _arg_1)
            {
                this._1232558777modBindReqNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "modBindReqNum", _local_2, _arg_1));
            };
        }

        public function haveSuccData():Boolean
        {
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < 3)
            {
                if (((this[("newPro" + _local_1)]) && (!(this[("newPro" + _local_1)].htmlText == ""))))
                {
                    return (true);
                };
                _local_1++;
            };
            return (false);
        }

        [Bindable(event="propertyChange")]
        public function get jewelUpdatePer():BasicTxtButton
        {
            return (this._60074641jewelUpdatePer);
        }

        public function ___EquiptFuncPanel_Canvas12_creationComplete(_arg_1:FlexEvent):void
        {
            initMWPTransfer();
        }

        [Bindable(event="propertyChange")]
        public function get magEquFuncList():List
        {
            return (this._1292150120magEquFuncList);
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarMax():NumericStepper
        {
            return (this._1877517656petEquStarMax);
        }

        public function __jewelUpdateButtonOne_click(_arg_1:MouseEvent):void
        {
            jewelUpdateOne();
        }

        private function buyItem(alias:String):void
        {
            aliasString = alias;
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuyItem), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuyItem(true);
            };
        }

        public function set mwSuccinctCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._517338458mwSuccinctCanvas;
            if (_local_2 !== _arg_1)
            {
                this._517338458mwSuccinctCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwSuccinctCanvas", _local_2, _arg_1));
            };
        }

        public function ___EquiptFuncPanel_BasicGlowButton16_click(_arg_1:MouseEvent):void
        {
            succinctVip();
        }

        private function changeBagVis():void
        {
            if (!equipBagAdded)
            {
                equipBag = null;
                equipBag = new EquipFuncBag();
                equipBag.x = 498;
                equipBag.y = 33;
                width = 750;
                addChild((equipBag as EquipFuncBag));
                equipBag.eFuncPanel = this;
                equipBagAdded = true;
                showBag.styleName = "EquipBagLeft";
            }
            else
            {
                if (equipBag.visible)
                {
                    equipBag.visible = false;
                    showBag.styleName = "EquipBagRight";
                    width = 500;
                }
                else
                {
                    equipBag.visible = true;
                    width = 750;
                    showBag.styleName = "EquipBagLeft";
                };
            };
            if (equipBag.visible)
            {
                equipBag.showItem(tabA.selectedIndex, _itemList);
            };
            eTitle.text = eTitle.text;
        }

        public function set autoSublime(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1036064102autoSublime;
            if (_local_2 !== _arg_1)
            {
                this._1036064102autoSublime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoSublime", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupItem():ItemSlot
        {
            return (this._1267899704petEquLevelupItem);
        }

        public function set petEquModPreSucc(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._552846995petEquModPreSucc;
            if (_local_2 !== _arg_1)
            {
                this._552846995petEquModPreSucc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModPreSucc", _local_2, _arg_1));
            };
        }

        public function set stageEqu(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1306166635stageEqu;
            if (_local_2 !== _arg_1)
            {
                this._1306166635stageEqu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stageEqu", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sublimeItem():ItemSlot
        {
            return (this._1885394232sublimeItem);
        }

        private function initMWPTransfer():void
        {
            (((tabD) && (tabD.selectedIndex == 5)) && (MWTransFrom.addEventListener(GameEvent.SLOT_GIID_CHANGE, MWTransFromChange)));
        }

        public function onGetMakeColor(_arg_1:Object):void
        {
            var _local_2:int;
            if (_arg_1.canMake)
            {
                if (_arg_1.colorPerList)
                {
                    _local_2 = 1;
                    while (_local_2 <= 4)
                    {
                        this[("makePer" + _local_2)].text = (int(_arg_1.colorPerList[("makePer" + _local_2)]).toString() + "%");
                        _local_2++;
                    };
                };
                makeButton.enabled = true;
            }
            else
            {
                if (_arg_1.flag)
                {
                    if (ToolKit.isEqual(_arg_1.flag, 1))
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[64]);
                        _core.sysMsg(Language.EQUIPTFUNCPANEL_S[64]);
                    };
                };
                makeButton.enabled = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get maxProp():TextArea
        {
            return (this._843999975maxProp);
        }

        public function __petEquModColorBtn_click(_arg_1:MouseEvent):void
        {
            petEquModColor();
        }

        public function onSureSuccinctMW(_arg_1:Object):*
        {
            var _local_2:Object;
            if (!_arg_1)
            {
                return;
            };
            _local_2 = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
            if (_local_2)
            {
                _local_2.updateSuccData(this.MwSuccinct.giid, _arg_1.flag);
            };
            this.updateMWSuccView(_arg_1.flag, null);
        }

        public function set MwSuccinct(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._273317502MwSuccinct;
            if (_local_2 !== _arg_1)
            {
                this._273317502MwSuccinct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MwSuccinct", _local_2, _arg_1));
            };
        }

        public function set petEquStarInfo1(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._411523705petEquStarInfo1;
            if (_local_2 !== _arg_1)
            {
                this._411523705petEquStarInfo1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarInfo1", _local_2, _arg_1));
            };
        }

        public function set petEquStarInfo2(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._411523704petEquStarInfo2;
            if (_local_2 !== _arg_1)
            {
                this._411523704petEquStarInfo2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarInfo2", _local_2, _arg_1));
            };
        }

        private function magicWeaponRepair():void
        {
            var onMWRepair:Function;
            onMWRepair = function (_arg_1:Object):void
            {
                if (_arg_1)
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        blueStoneNeed.stackNum = _arg_1.num;
                    }
                    else
                    {
                        blueStoneNeed.clean();
                    };
                    if (_arg_1.succ)
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[76]);
                    };
                };
            };
            if (((MWRepair.slotData) && (blueStoneNeed.slotData)))
            {
                _core.remote.call("magicWeaponRepair", new Responder(onMWRepair), MWRepair.slotData.id, blueStoneNeed.slotData.id);
            }
            else
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[82]);
            };
        }

        private function onPetEquModColor(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:ISlot;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                if (ToolKit.isEqual(petEquReadyModColor.slotData.itemId, _arg_1.i))
                {
                    petEquReadyModColor.giid = _arg_1.i;
                    petEquReadyModColor.setStyleName(_arg_1.c);
                    _local_2 = _core.data.getData(petEquReadyModColor.slotData.type, petEquReadyModColor.slotData.itemId);
                    if (_local_2)
                    {
                        _local_2.color = _arg_1.c;
                        _local_3 = _core.view.getSlot(_arg_1.sid);
                        _local_3.restore();
                        equipBag.refreshSlots({
                            "sid":_arg_1.sid,
                            "giid":_arg_1.i
                        });
                    };
                };
                petEquModColorItem.stackNum = (petEquModColorItem.stackNum - _arg_1.num);
                petEquModColorInfo.htmlText = Language.EQUIPTFUNCPANEL_S[84];
                petEquModReqNum.text = "";
            }
            else
            {
                petEquModColorItem.stackNum = (petEquModColorItem.stackNum - _arg_1.num);
                petEquModColorInfo.htmlText = ((_arg_1.msg) ? _arg_1.msg : Language.EQUIPTFUNCPANEL_S[85]);
            };
            petEquModColorChange(null);
        }

        private function initMWPSkill():void
        {
            (((tabD) && (tabD.selectedIndex == 4)) && (MWResetSkill.addEventListener(GameEvent.SLOT_GIID_CHANGE, MWResetSkillChange)));
        }

        private function jewelUpdateAll():void
        {
            if (((jewelUpdateItem1.slotData) && (ToolKit.isBigThan(jewelUpdateItem2.giid, 0))))
            {
                jewelUpdateButtonAll.enabled = false;
                jewelUpdateButtonOne.enabled = false;
                _core.remote.call("jewelUpdateAll", new Responder(onJewelUpdate), jewelUpdateNum.value, jewelUpdateItem1.slotData.id, jewelUpdateItem1.tempBagFlag);
            };
        }

        private function MWTrans():void
        {
            var onMWTrans:Function;
            var onDel:Function;
            var func:Function;
            onMWTrans = function (_arg_1:Object):void
            {
                if (((_arg_1) && (_arg_1.succ)))
                {
                    MWTransTo.clean();
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        transItemNeed.stackNum = _arg_1.num;
                    }
                    else
                    {
                        transItemNeed.clean();
                    };
                };
                if (((_arg_1) && (_arg_1.msg)))
                {
                    _core.sysMidNote(_arg_1.msg);
                };
            };
            onDel = function (_arg_1:String):void
            {
                var _local_2:String;
                if (_arg_1)
                {
                    _local_2 = MD5.hash(_arg_1);
                    _core.remote.call("MWTrans", new Responder(onMWTrans), MWTransFrom.slotData.id, MWTransTo.slotData.id, transItemNeed.slotData.id, _local_2);
                };
            };
            if ((((MWTransFrom.slotData) && (MWTransTo.slotData)) && (transItemNeed.slotData)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        if (_core.delPass)
                        {
                            _core.remote.call("MWTrans", new Responder(onMWTrans), MWTransFrom.slotData.id, MWTransTo.slotData.id, transItemNeed.slotData.id, _core.delPass);
                        }
                        else
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.EQUIPTFUNCPANEL_U[56], onDel);
                        };
                    };
                };
                Alert.show(Language.EQUIPTFUNCPANEL_S[95], "", (Alert.YES | Alert.CANCEL), this, func);
            }
            else
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[82]);
            };
        }

        public function ___EquiptFuncPanel_Canvas16_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(5);
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupBasic():NumericStepper
        {
            return (this._657202407petEquLevelupBasic);
        }

        public function __makeButton_click(_arg_1:MouseEvent):void
        {
            newMake();
        }

        [Bindable(event="propertyChange")]
        public function get stageItem():ItemSlot
        {
            return (this._1836581681stageItem);
        }

        [Bindable(event="propertyChange")]
        public function get blueStoneGet():ItemSlotMaterial
        {
            return (this._1359520555blueStoneGet);
        }

        public function __eTitle_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function chageSelected(_arg_1:int):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Image;
            _local_2 = new Array();
            _local_3 = 0;
            _local_4 = 0;
            while (_local_4 < 3)
            {
                if (this[("lock" + _local_4)].visible)
                {
                    _local_3++;
                };
                if (this[("lock" + _local_4)].selected)
                {
                    _local_2.push(_local_4);
                };
                _local_4++;
            };
            if (((_local_3 == 1) || ((_local_3 - _local_2.length) == 0)))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[228], "", Alert.YES, null, null);
                this[("lock" + _arg_1)].selected = false;
                return;
            };
            _local_5 = (_local_2.length + _local_3);
            costInfo.text = Language.EQUIPTFUNCPANEL_U[209].replace("{num}", _local_5);
            if (this[("lock" + _arg_1)].selected)
            {
                _local_6 = new Image();
                _local_6.source = lockImg;
                _local_6.x = (this[("lock" + _arg_1)].x - 20);
                _local_6.y = (this[("lock" + _arg_1)].y + 3);
                lockDict[_arg_1] = _local_6;
                mwSuccinctCanvas.addChild(_local_6);
            }
            else
            {
                if (lockDict[_arg_1])
                {
                    mwSuccinctCanvas.removeChild(lockDict[_arg_1]);
                    delete lockDict[_arg_1];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModColorBtn():BasicDelayButton
        {
            return (this._718512913petEquModColorBtn);
        }

        public function set petEquModBindInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2008432221petEquModBindInfo;
            if (_local_2 !== _arg_1)
            {
                this._2008432221petEquModBindInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModBindInfo", _local_2, _arg_1));
            };
        }

        public function set succinctBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._2124710308succinctBtn;
            if (_local_2 !== _arg_1)
            {
                this._2124710308succinctBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "succinctBtn", _local_2, _arg_1));
            };
        }

        private function petEquModColor():void
        {
            var _local_1:Number;
            var _local_2:Number;
            if (((petEquReadyModColor.slotData) && (petEquModColorItem.slotData)))
            {
                if (_core.player.enoughMoneyAuto(1, Number(petEquModColorMoney.text)))
                {
                    _local_1 = petEquReadyModColor.slotData.id;
                    _local_2 = petEquModColorItem.slotData.id;
                    _core.remote.call("petEquModColor", new Responder(onPetEquModColor), _local_1, _local_2);
                }
                else
                {
                    petEquModColorInfo.htmlText = Language.EQUIPTFUNCPANEL_S[32];
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabA():ViewStack
        {
            return (this._3552076tabA);
        }

        [Bindable(event="propertyChange")]
        public function get tabC():ViewStack
        {
            return (this._3552078tabC);
        }

        [Bindable(event="propertyChange")]
        public function get tabD():ViewStack
        {
            return (this._3552079tabD);
        }

        public function set modPreReqNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1252811177modPreReqNum;
            if (_local_2 !== _arg_1)
            {
                this._1252811177modPreReqNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "modPreReqNum", _local_2, _arg_1));
            };
        }

        private function petEquModBind():void
        {
            var _local_1:Number;
            var _local_2:Number;
            petEquModBindSucc.text = "";
            if (((petEquReadyModBind.slotData) && (petEquModBindItem.slotData)))
            {
                if (!_core.player.enoughMoneyAuto(1, GamePredef.MONEY_EQUFUNC_ELEMENT))
                {
                    petEquModBindInfo.htmlText = Language.EQUIPTFUNCPANEL_S[32];
                    return;
                };
                if (!ToolKit.isBigOrEqual(petEquModBindItem.stackNum, modBindReq))
                {
                    petEquModBindInfo.htmlText = Language.EQUIPTFUNCPANEL_S[56];
                    return;
                };
                _local_1 = petEquReadyModBind.slotData.id;
                _local_2 = petEquModBindItem.slotData.id;
                _core.remote.call("petEquModBind", new Responder(onPetEquModBind), _local_1, _local_2);
            };
        }

        public function __magEquFuncList_change(_arg_1:ListEvent):void
        {
            tabBtnDClick(magEquFuncList.selectedIndex);
        }

        public function set MWChangeLevel(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1518482858MWChangeLevel;
            if (_local_2 !== _arg_1)
            {
                this._1518482858MWChangeLevel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWChangeLevel", _local_2, _arg_1));
            };
        }

        public function __materialButtonOne_click(_arg_1:MouseEvent):void
        {
            materialMixOne();
        }

        public function succinctVip():void
        {
            var gfunc:Function;
            var view:Object;
            var func:Function;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            if (((_core.player.pmLevel) && (_core.player.pmLevel > 0)))
            {
                view = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
                if (view)
                {
                    if (!view.haveSuccData())
                    {
                        view.eid = MwSuccinct.giid;
                        view.updateMWSuccView(oldSuccData, null);
                    }
                    else
                    {
                        if (MwSuccinct.giid == view.succinctId)
                        {
                            view.eid = MwSuccinct.giid;
                            view.updateMWSuccView(oldSuccData, null, false);
                        }
                        else
                        {
                            func = function (_arg_1:CloseEvent):void
                            {
                                if (_arg_1.detail == Alert.YES)
                                {
                                    view.eid = MwSuccinct.giid;
                                    view.updateMWSuccView(oldSuccData, null);
                                };
                            };
                            if (_alert)
                            {
                                PopUpManager.removePopUp(_alert);
                                _alert = null;
                            };
                            _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[218], "", (Alert.YES | Alert.NO), null, func);
                        };
                    };
                    view.visible = true;
                    view.unselectAutoBuy();
                };
            }
            else
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[234], "", Alert.YES, null, null);
            };
        }

        public function set spiritualityLabel(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._1004296629spiritualityLabel;
            if (_local_2 !== _arg_1)
            {
                this._1004296629spiritualityLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "spiritualityLabel", _local_2, _arg_1));
            };
        }

        public function set curProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1125939651curProp;
            if (_local_2 !== _arg_1)
            {
                this._1125939651curProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curProp", _local_2, _arg_1));
            };
        }

        public function set makePer3(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._40388036makePer3;
            if (_local_2 !== _arg_1)
            {
                this._40388036makePer3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makePer3", _local_2, _arg_1));
            };
        }

        public function set makePer1(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._40388034makePer1;
            if (_local_2 !== _arg_1)
            {
                this._40388034makePer1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makePer1", _local_2, _arg_1));
            };
        }

        public function set makePer2(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._40388035makePer2;
            if (_local_2 !== _arg_1)
            {
                this._40388035makePer2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makePer2", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:EquiptFuncPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _EquiptFuncPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_EquiptFuncPanelWatcherSetupUtil");
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

        public function __makeCanvas_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(0);
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupItemNeed():ItemSlot
        {
            return (this._638827390petEquLevelupItemNeed);
        }

        public function set makePer4(_arg_1:BoxLabel):void
        {
            var _local_2:Object;
            _local_2 = this._40388037makePer4;
            if (_local_2 !== _arg_1)
            {
                this._40388037makePer4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makePer4", _local_2, _arg_1));
            };
        }

        public function __classType_change(_arg_1:ListEvent):void
        {
            classType.dataProvider[0].label = Language.EQUIPTFUNCPANEL_S[0];
        }

        public function activateMWPro(index:int):void
        {
            var flag1:Boolean;
            var flag2:Boolean;
            var view:Object;
            var func:Function;
            if (MwSuccinct.giid < 0)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[226], "", Alert.YES, null, null);
            };
            flag1 = false;
            flag2 = false;
            view = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
            if (this.hasSuccData())
            {
                flag1 = true;
            }
            else
            {
                if (view)
                {
                    if (view.haveSuccData())
                    {
                        flag2 = true;
                    };
                };
            };
            if (((flag1) || (flag2)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _activateMwPro(index);
                        if (flag1)
                        {
                            this.cleanSuccData();
                        };
                        if (flag2)
                        {
                            view.clearSuccDb();
                        };
                    };
                };
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[233], "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                _activateMwPro(index);
            };
        }

        private function menuClickHandler(_arg_1:MenuEvent):void
        {
            var _local_2:ItemSlot = _arg_1.item.data.slot;
            var _local_3:Object = _arg_1.item.data.sData;
            _local_2.slotData = _local_3;
            _local_2.type = _local_3.type;
            _local_2.giid = _local_3.itemId;
            _local_2.stackNum = _local_3.stackNum;
            Menu(_arg_1.target).removeEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function set petEquModPreBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._849134127petEquModPreBtn;
            if (_local_2 !== _arg_1)
            {
                this._849134127petEquModPreBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModPreBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get materialButtonAll():BasicGlowButton
        {
            return (this._192885848materialButtonAll);
        }

        [Bindable(event="propertyChange")]
        public function get makeList():List
        {
            return (this._40272812makeList);
        }

        private function newMake():void
        {
            if (makeList.selectedItem.equData)
            {
                setTimeout(startNewMake, 2000);
                makeCanvas.enabled = false;
                progressBar.progressName = Language.EQUIPTFUNCPANEL_S[1];
                progressBar.completeFunction = completeMake;
                progressBar.showByTime(2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get restrainEquip():ItemSlotEquFunc
        {
            return (this._1469908056restrainEquip);
        }

        public function __actBtn2_click(_arg_1:MouseEvent):void
        {
            activateMWPro(2);
        }

        private function clearPetEquiptPrePanel():*
        {
            petEquReadyPre.clean();
            petEquModPreNeedItem.clean();
            petEquModPreItem.clean();
            curProp.text = "";
            maxProp.text = "";
            petEquModPreSucc.text = "";
            petEquModPreInfo.text = "";
            modPreReqNum.htmlText = "";
        }

        private function onMaterialMixIns(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (ToolKit.isEqual(_arg_1.data.color, 4))
                {
                    materialMixBasicRate = (0.3 * 20);
                }
                else
                {
                    materialMixBasicRate = 20;
                };
                materialMixNumChange();
            };
        }

        private function initMWPLvUp():void
        {
            (((tabD) && (tabD.selectedIndex == 0)) && (MWChangeLevel.addEventListener(GameEvent.SLOT_GIID_CHANGE, MWChangeLevelChange)));
        }

        private function doBuyItem(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:SystemShopPanel;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_2) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                };
                _local_3 = SystemShopPanel(_core.view.getUI(ViewManager.PANEL_SYSTEM_SHOP));
                _local_3.show();
                _local_3.setPage(aliasString);
            };
        }

        public function onScriptSublimeEquip(_arg_1:Number, _arg_2:String):void
        {
            ((equipChange) && (equipChange.onScriptSublimeEquip(_arg_1, _arg_2)));
        }

        public function set MWRepair(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._894849577MWRepair;
            if (_local_2 !== _arg_1)
            {
                this._894849577MWRepair = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWRepair", _local_2, _arg_1));
            };
        }

        private function initMWPStage():void
        {
            (((tabD) && (tabD.selectedIndex == 7)) && (stageEqu.addEventListener(GameEvent.SLOT_GIID_CHANGE, magicWeaponStageChange)));
        }

        [Bindable(event="propertyChange")]
        public function get petEquReadyPre():ItemSlotEquFunc
        {
            return (this._255603766petEquReadyPre);
        }

        [Bindable(event="propertyChange")]
        public function get showBag():BasicGlowButton
        {
            return (this._2067262411showBag);
        }

        public function set oldPro1(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1379509781oldPro1;
            if (_local_2 !== _arg_1)
            {
                this._1379509781oldPro1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPro1", _local_2, _arg_1));
            };
        }

        public function set oldPro2(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1379509780oldPro2;
            if (_local_2 !== _arg_1)
            {
                this._1379509780oldPro2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPro2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModPreInfo():Label
        {
            return (this._553151527petEquModPreInfo);
        }

        public function set oldPro0(_arg_1:TextInput):void
        {
            var _local_2:Object;
            _local_2 = this._1379509782oldPro0;
            if (_local_2 !== _arg_1)
            {
                this._1379509782oldPro0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldPro0", _local_2, _arg_1));
            };
        }

        private function MWResolveViewClear():void
        {
            ((MWResolve) && (MWResolve.clean()));
            ((blueStoneGet) && (blueStoneGet.clean()));
        }

        private function autoInputMake():void
        {
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:Object;
            var _local_6:Object;
            var _local_7:Object;
            var _local_8:Object;
            var _local_1:Object = _dm.sList;
            var _local_2:int = 1;
            while (_local_2 <= 3)
            {
                _local_3 = this[("makeInputItem" + _local_2)].requireSlot;
                _local_4 = -1;
                if (_local_3)
                {
                    for each (_local_6 in _local_1)
                    {
                        if ((((_local_6) && (ToolKit.isBigThan(_local_6.sid, GamePredef.SLOT_SID_BAG[0]))) && (ToolKit.isSmallOrEqual(_local_6.sid, GamePredef.SLOT_SID_BAG[7]))))
                        {
                            _local_7 = _core.getTemplateData(_local_6.type, _local_6.itemId);
                            if (_local_7)
                            {
                                _local_8 = _core.data.getData(_local_6.type, _local_6.itemId);
                                if (((((ToolKit.isEqual(_local_6.type, (_local_3.type - 1))) && (ToolKit.isEqual(_local_7.id, _local_3.giid))) && (ToolKit.isBigOrEqual(_local_6.stackNum, _local_3.stackNum))) && ((ToolKit.isBigThan(_local_8.color, _local_4)) && (ToolKit.isSmallThan(_local_8.color, 5)))))
                                {
                                    _local_4 = _local_8.color;
                                    _local_5 = _local_6;
                                };
                            };
                        };
                    };
                    if (((_local_5) && (_local_4 >= 0)))
                    {
                        this[("makeInputItem" + _local_2)].slotData = _local_5;
                        this[("makeInputItem" + _local_2)].type = _local_5.type;
                        this[("makeInputItem" + _local_2)].giid = _local_5.itemId;
                        this[("makeInputItem" + _local_2)].stackNum = _local_3.stackNum;
                        this[("makeInputItem" + _local_2)].tempBagFlag = false;
                    };
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelUpdateItem2():ItemSlotJewel
        {
            return (this._1891128307jewelUpdateItem2);
        }

        private function onPetEquModBindItem(_arg_1:Event):void
        {
            var _local_2:Object;
            if (_arg_1.target.slotData)
            {
                if (((petEquReadyModBind.slotData) && (ToolKit.isBigThan(petEquModBindNeedItem.giid, 0))))
                {
                    _local_2 = _core.getTemplateData(petEquModBindItem.slotData.type, petEquModBindItem.slotData.itemId, false);
                    if (((_local_2) && (ToolKit.isEqual(_local_2.id, petEquModBindNeedItem.giid))))
                    {
                        petEquModBindBtn.enabled = true;
                        return;
                    };
                    petEquModBindItem.clean();
                };
            };
            petEquModBindBtn.enabled = false;
        }

        [Bindable(event="propertyChange")]
        public function get jewelUpdateItem1():ItemSlotJewel
        {
            return (this._1891128306jewelUpdateItem1);
        }

        public function __tabBtnA1_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get petEquReadyModBind():ItemSlotEquFunc
        {
            return (this._1799691270petEquReadyModBind);
        }

        [Bindable(event="propertyChange")]
        public function get equipChange():EquipFunc
        {
            return (this._1908571136equipChange);
        }

        private function onPetEquModPre(data:Object):void
        {
            var yesAlert:String;
            var noAlert:String;
            var func:Function;
            var title:String;
            var contentMsg:String;
            var oldequData:Object;
            var rate:* = undefined;
            var newequData:Object;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (data.f)
            {
                if (!data.saveType)
                {
                    petEquModPreInfo.htmlText = "";
                };
                if (((data.saveType) || (ToolKit.isEqual(petEquModPreItem.slotData.id, data.ii))))
                {
                    if (!data.saveType)
                    {
                        if (data.n <= 0)
                        {
                            petEquModPreItem.clean();
                        };
                        petEquModPreItem.stackNum = data.n;
                    };
                    yesAlert = Alert.yesLabel;
                    noAlert = Alert.noLabel;
                    func = function (_arg_1:CloseEvent):void
                    {
                        Alert.yesLabel = yesAlert;
                        Alert.noLabel = noAlert;
                        if (_arg_1.detail == Alert.YES)
                        {
                            if (!internal::data.saveType)
                            {
                                _core.remote.nc.call("surePetEquModPre", new Responder(onSurePetEquModPre), 1);
                            }
                            else
                            {
                                _core.remote.nc.call("surePetEquModPre", null, 1);
                            };
                        }
                        else
                        {
                            if (!internal::data.saveType)
                            {
                                _core.remote.nc.call("surePetEquModPre", new Responder(onSurePetEquModPre), -1);
                            }
                            else
                            {
                                _core.remote.nc.call("surePetEquModPre", null, -1);
                            };
                        };
                    };
                    title = Language.EQUIPTFUNCPANEL_S[139];
                    contentMsg = ((("<b>" + Language.EQUIPTFUNCPANEL_S[139]) + "</b>") + "    \n");
                    if (data.saveType)
                    {
                        oldequData = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][data.i];
                    }
                    else
                    {
                        oldequData = data.oldIns;
                    };
                    rate = GamePredef.EQUIPT_STAR_NUM[oldequData.upgradeNum];
                    newequData = data.newIns;
                    if (newequData.mainProp1 > 0)
                    {
                        contentMsg = ((((((((((((((contentMsg + "\n") + GamePredef.EQUIPT_PROP_NAME[oldequData.mainProp1]) + ": ") + "<font color='#00FFFF'>") + int((oldequData.mainPropNum1 * rate))) + (((oldequData.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (oldequData.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "</font>") + Language.EQUIPTFUNCPANEL_S[129]) + GamePredef.EQUIPT_PROP_NAME[newequData.mainProp1]) + ": ") + "<font color='#00FFFF'>") + int((newequData.mainPropNum1 * rate))) + (((newequData.mainProp1 == GamePredef.EQUIPT_PROP_HP_PER) || (newequData.mainProp1 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "</font>");
                    };
                    if (newequData.mainProp2 > 0)
                    {
                        contentMsg = ((((((((((((((contentMsg + "\n") + GamePredef.EQUIPT_PROP_NAME[oldequData.mainProp2]) + ": ") + "<font color='#00FFFF'>") + int((oldequData.mainPropNum2 * rate))) + (((oldequData.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (oldequData.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "</font>") + Language.EQUIPTFUNCPANEL_S[129]) + GamePredef.EQUIPT_PROP_NAME[newequData.mainProp2]) + ": ") + "<font color='#00FFFF'>") + int((newequData.mainPropNum2 * rate))) + (((newequData.mainProp2 == GamePredef.EQUIPT_PROP_HP_PER) || (newequData.mainProp2 == GamePredef.EQUIPT_PROP_MP_PER)) ? "%" : "")) + "</font>");
                    };
                    if (newequData.prop1 > 0)
                    {
                        contentMsg = ((((((((((((contentMsg + "\n") + GamePredef.EQUIPT_PROP_NAME[oldequData.prop1]) + ": ") + "<font color='#00FFFF'>") + oldequData.propNum1) + "</font>") + Language.EQUIPTFUNCPANEL_S[129]) + GamePredef.EQUIPT_PROP_NAME[newequData.prop1]) + ": ") + "<font color='#00FFFF'>") + newequData.propNum1) + "</font>");
                    };
                    if (newequData.prop2 > 0)
                    {
                        contentMsg = ((((((((((((contentMsg + "\n") + GamePredef.EQUIPT_PROP_NAME[oldequData.prop2]) + ": ") + "<font color='#00FFFF'>") + oldequData.propNum2) + "</font>") + Language.EQUIPTFUNCPANEL_S[129]) + GamePredef.EQUIPT_PROP_NAME[newequData.prop2]) + ": ") + "<font color='#00FFFF'>") + newequData.propNum2) + "</font>");
                    };
                    if (((newequData.bindMainPropNum1 > 0) || (newequData.bindMainPropNum2 > 0)))
                    {
                        contentMsg = ((((contentMsg + "\n") + "<font color='#FF11CC'>") + Language.EQUIPTFUNCPANEL_S[138]) + "</font>");
                    };
                    if (newequData.mainProp1 > 0)
                    {
                        contentMsg = ((((((((((((((contentMsg + "\n") + GamePredef.EQUIPT_PROP_NAME[oldequData.mainProp1]) + ": ") + "<font color='#00FFFF'>") + oldequData.bindMainPropNum1) + "%") + "</font>") + Language.EQUIPTFUNCPANEL_S[129]) + GamePredef.EQUIPT_PROP_NAME[newequData.mainProp1]) + ": ") + "<font color='#00FFFF'>") + newequData.bindMainPropNum1) + "%") + "</font>");
                    };
                    if (newequData.mainProp2 > 0)
                    {
                        contentMsg = ((((((((((((((contentMsg + "\n") + GamePredef.EQUIPT_PROP_NAME[oldequData.mainProp2]) + ": ") + "<font color='#00FFFF'>") + oldequData.bindMainPropNum2) + "%") + "</font>") + Language.EQUIPTFUNCPANEL_S[129]) + GamePredef.EQUIPT_PROP_NAME[newequData.mainProp2]) + ": ") + "<font color='#00FFFF'>") + newequData.bindMainPropNum2) + "%") + "</font>");
                    };
                    msg = contentMsg.replace(/<font(.*?)>/g, "");
                    msg = msg.replace(/<\/font>/g, "");
                    msg = msg.replace(/<b>/g, "");
                    msg = msg.replace(/<\/b>/g, "");
                    Alert.yesLabel = Language.EQUIPTFUNCPANEL_S[113];
                    Alert.noLabel = Language.EQUIPTFUNCPANEL_S[127];
                    _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
                    Alert.yesLabel = yesAlert;
                    Alert.noLabel = noAlert;
                    tf = _alert.mx_internal::alertForm.mx_internal::textField;
                    tf.htmlText = contentMsg;
                    tf.filters = GamePredef.FILTER_TEXT1;
                };
            }
            else
            {
                petEquModPreInfo.htmlText = Language.EQUIPTFUNCPANEL_S[141];
            };
        }

        public function __restrainBox_change(_arg_1:ListEvent):void
        {
            restrainPetElement(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get restrainHint():Label
        {
            return (this._506854415restrainHint);
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupBtn():BasicDelayButton
        {
            return (this._1149285369petEquLevelupBtn);
        }

        public function set resetStoneNeed(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1748616716resetStoneNeed;
            if (_local_2 !== _arg_1)
            {
                this._1748616716resetStoneNeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resetStoneNeed", _local_2, _arg_1));
            };
        }

        private function MWChangeLevelViewClear():void
        {
            ((MWChangeLevel) && (MWChangeLevel.clean()));
        }

        public function showMWSuccinct(obj:Object):void
        {
            var yesAlert:String;
            var noAlert:String;
            var func:Function;
            var contentMsg:String;
            var oldPro:Object;
            var newPro:Object;
            var i:int;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            var msg1:String;
            var msg2:String;
            yesAlert = Alert.yesLabel;
            noAlert = Alert.noLabel;
            func = function (_arg_1:CloseEvent):void
            {
                Alert.yesLabel = yesAlert;
                Alert.noLabel = noAlert;
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.nc.call("onSureSuccinctMW", null, 1);
                }
                else
                {
                    _core.remote.nc.call("onSureSuccinctMW", null, -1);
                };
            };
            contentMsg = (((((("<font color='#ffffff'>" + Language.EQUIPTFUNCPANEL_U[205]) + "\n     ") + Language.EQUIPTFUNCPANEL_U[206]) + "           ") + Language.EQUIPTFUNCPANEL_U[207]) + "</font>\n");
            oldPro = obj.oldPro;
            newPro = obj.newPro;
            i = 0;
            while (i < 3)
            {
                if (oldPro[("succ" + i)])
                {
                    msg1 = encodePropInfo(oldPro[("succ" + i)], false);
                    if (newPro[("succ" + i)])
                    {
                        msg2 = encodePropInfo(newPro[("succ" + i)], false);
                        contentMsg = (contentMsg + (((msg1 + "  →  ") + msg2) + "\n"));
                    }
                    else
                    {
                        contentMsg = (contentMsg + (((msg1 + "  →  ") + msg1) + "\n"));
                    };
                };
                i = (i + 1);
            };
            msg = contentMsg.replace(/<font(.*?)>/g, "");
            msg = msg.replace(/<\/font>/g, "");
            msg = msg.replace(/<b>/g, "");
            msg = msg.replace(/<\/b>/g, "");
            Alert.yesLabel = Language.EQUIPTFUNCPANEL_S[113];
            Alert.noLabel = Language.EQUIPTFUNCPANEL_S[127];
            _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
            Alert.yesLabel = yesAlert;
            Alert.noLabel = noAlert;
            tf = _alert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = contentMsg;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        public function ___EquiptFuncPanel_BasicGlowButton20_click(_arg_1:MouseEvent):void
        {
            stageHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get sublimeConsume():Label
        {
            return (this._638137383sublimeConsume);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModColorMoney():Label
        {
            return (this._988812235petEquModColorMoney);
        }

        public function ___EquiptFuncPanel_BasicGlowButton14_click(_arg_1:MouseEvent):void
        {
            saveSuccinct();
        }

        public function ___EquiptFuncPanel_Canvas5_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(3);
        }

        public function set costInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._425010661costInfo;
            if (_local_2 !== _arg_1)
            {
                this._425010661costInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "costInfo", _local_2, _arg_1));
            };
        }

        public function __materialMixNum_change(_arg_1:NumericStepperEvent):void
        {
            materialMixNumChange();
        }

        public function __makeTree_itemClick(_arg_1:ListEvent):void
        {
            makeTreeClick(_arg_1);
        }

        private function onPetEquReadyModBind(_arg_1:Event):void
        {
            var _local_2:Object;
            if (petEquReadyModBind.slotData)
            {
                _local_2 = _core.getTemplateData(petEquReadyModBind.slotData.type, petEquReadyModBind.slotData.itemId, false);
                if (((_local_2) && (isPetEqu(_local_2))))
                {
                    modBindReq = GamePredef.MODBIND_REQ_NUM[_local_2.reqLevel].req;
                    petEquModBindNeedItem.type = GamePredef.TBL_ITEM_TEMPLATE;
                    petEquModBindNeedItem.giid = 2809;
                    if (isSpecPetEqu(_local_2))
                    {
                        if (((StringUtil.beginsWith(_local_2.reqClassId.toString(), "|")) && (StringUtil.endsWith(_local_2.reqClassId.toString(), "|"))))
                        {
                            modBindReq = (modBindReq * 4);
                        }
                        else
                        {
                            modBindReq = (modBindReq * 2);
                        };
                    };
                    modBindReqNum.htmlText = Language.EQUIPTFUNCPANEL_U[84].replace("{num}", modBindReq);
                }
                else
                {
                    modBindReqNum.htmlText = "";
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelUpdateButtonOne():BasicGlowButton
        {
            return (this._1991736392jewelUpdateButtonOne);
        }

        public function onMaterialMix(_arg_1:Object):void
        {
            materialButtonAll.enabled = true;
            materialButtonOne.enabled = true;
            var _local_2:* = "";
            if (_arg_1)
            {
                if (((ToolKit.isEqual(_arg_1.slotId, materialMixItem.slotData.id)) || (ToolKit.isEqual(_arg_1.slotId, materialMixItem.slotData.idx))))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        materialMixItem.stackNum = _arg_1.num;
                    }
                    else
                    {
                        materialMixItem.clean();
                    };
                };
                if (_arg_1.flag)
                {
                    if (_arg_1.finalNum)
                    {
                        _local_2 = Language.EQUIPTFUNCPANEL_S[11];
                        _local_2 = _local_2.replace("{finalNum}", _arg_1.finalNum);
                        _core.sysMidNote(_local_2);
                    }
                    else
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[13]);
                    };
                }
                else
                {
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[14]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupInfo():Label
        {
            return (this._1267905437petEquLevelupInfo);
        }

        private function restrainPetElement(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:int;
            var _local_10:int;
            var _local_11:String;
            var _local_12:String;
            var _local_13:String;
            var _local_14:Object;
            var _local_15:int;
            var _local_16:Object;
            var _local_17:String;
            _arg_1.stopImmediatePropagation();
            _local_2 = restrainEquip.slotData;
            _local_3 = _core.data.getGameData(_local_2.type, _local_2.itemId);
            _local_4 = ((_local_3) ? _local_3.flag : null);
            if (((!(_local_4)) || (_local_4.indexOf("sublimeId") == -1)))
            {
                return;
            };
            _local_5 = ((restrainBox) ? restrainBox.selectedItem : null);
            _local_6 = ((_local_5) ? _local_5.element : 0);
            if (_local_6 <= 0)
            {
                if (restrainView)
                {
                    restrainView.htmlText = Language.EQUIPTFUNCPANEL_U[266];
                };
                return;
            };
            _local_7 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_3.tid];
            if (!_local_7)
            {
                return;
            };
            _local_8 = GamePredef.EQUIP_FUNCTYPE[_local_7.position];
            var _local_9:int = ((_local_8 == GamePredef.EQUIP_TYPE_ATTACK) ? 1 : 3);
            _local_10 = ((_local_8 == GamePredef.EQUIP_TYPE_ATTACK) ? 254 : 0xFF);
            _local_11 = Language.EQUIPTFUNCPANEL_U[_local_10];
            _local_12 = GamePredef.ELEMENT_NAME[_local_6];
            _local_13 = GamePredef.ELEMENT_COLOR[_local_6];
            _local_12 = (((("<font color='" + _local_13) + "'>") + _local_12) + "</font>");
            _local_14 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_4));
            _local_15 = ((_local_14) ? int(_local_14.sublimeId) : 0);
            _local_16 = GameData.d[GamePredef.TBL_SUBLIMATION_PET][_local_15];
            if (!_local_16)
            {
                return;
            };
            _local_17 = (Number(_local_16.elementNum) * 100).toFixed(2);
            _local_11 = LanguageUtil.replace(_local_11, {
                "element":_local_12,
                "num":_local_17
            });
            _local_11 = (Language.EQUIPTFUNCPANEL_U[267] + _local_11);
            if (restrainView)
            {
                restrainView.htmlText = _local_11;
            };
        }

        public function set creEquFuncList(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._1482580427creEquFuncList;
            if (_local_2 !== _arg_1)
            {
                this._1482580427creEquFuncList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "creEquFuncList", _local_2, _arg_1));
            };
        }

        public function __classType_close(_arg_1:DropdownEvent):void
        {
            makeTreeChange2();
        }

        private function menuPop(_arg_1:Object):void
        {
            var _local_2:Menu = CustomMenu.createMenu(null, _arg_1);
            _local_2.show(stage.mouseX, stage.mouseY);
            _local_2.addEventListener(MenuEvent.ITEM_CLICK, menuClickHandler);
        }

        public function set MWTransTo(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._163196473MWTransTo;
            if (_local_2 !== _arg_1)
            {
                this._163196473MWTransTo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWTransTo", _local_2, _arg_1));
            };
        }

        public function ___EquiptFuncPanel_BasicGlowButton19_click(_arg_1:MouseEvent):void
        {
            magicWeaponResetProp();
        }

        [Bindable(event="propertyChange")]
        public function get nextPetEqu():ItemSlotEquFunc
        {
            return (this._1363735427nextPetEqu);
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarJewel():ItemSlotStar
        {
            return (this._410852217petEquStarJewel);
        }

        public function set petEquModPreItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._553145794petEquModPreItem;
            if (_local_2 !== _arg_1)
            {
                this._553145794petEquModPreItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModPreItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupReqNum():Label
        {
            return (this._1563237501petEquLevelupReqNum);
        }

        public function set sublimeHint(_arg_1:AutoTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1885434308sublimeHint;
            if (_local_2 !== _arg_1)
            {
                this._1885434308sublimeHint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimeHint", _local_2, _arg_1));
            };
        }

        public function __lock1_click(_arg_1:MouseEvent):void
        {
            chageSelected(1);
        }

        private function petEquLevelupItemChange(_arg_1:Event):void
        {
            var _local_2:Object;
            if (petEquLevelupItem.slotData)
            {
                _local_2 = _core.getTemplateData(petEquLevelupItem.slotData.type, petEquLevelupItem.slotData.itemId, false);
                if (((((_local_2) && (ToolKit.isEqual(_local_2.type, GamePredef.ITEM_TYPE_PETEQU_LEVELUP))) && (ToolKit.isEqual(_local_2.id, levelupReqId))) && (ToolKit.isBigOrEqual(petEquLevelupItem.stackNum, levelupReqNum))))
                {
                    petEquLevelupInfo.text = "";
                    return;
                };
            };
        }

        public function validateRestrain(slotId:Number, element:int):void
        {
            var popStr:String;
            var closeHandler:Function;
            if (_restrainAlert)
            {
                PopUpManager.removePopUp(_restrainAlert);
                _restrainAlert = null;
            };
            popStr = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[174], {"money":GamePredef.RESTRAIN_ITEM_PRICE});
            closeHandler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.NO)
                {
                    return;
                };
                _core.remote.call("onValidateRestrain", new Responder(equipChange.onRestrainEquip), slotId, element);
            };
            _restrainAlert = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _restrainAlert.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        public function set petEquStarOneBtn(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._299371090petEquStarOneBtn;
            if (_local_2 !== _arg_1)
            {
                this._299371090petEquStarOneBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarOneBtn", _local_2, _arg_1));
            };
        }

        private function starItemChange(_arg_1:Event):void
        {
            var _local_2:Object;
            if (((tabA.selectedIndex == 5) && (petEquStarItem.slotData)))
            {
                _local_2 = _core.getTemplateData(petEquStarItem.slotData.type, petEquStarItem.slotData.itemId);
                if (((_local_2) && (isPetEqu(_local_2))))
                {
                    _core.remote.call("getStarNum", new Responder(onGetStarNum), petEquStarItem.slotData.id);
                }
                else
                {
                    petEquStarItem.slotData = null;
                    petEquStarItem.clean();
                };
            };
        }

        public function set autoBuy(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._646343081autoBuy;
            if (_local_2 !== _arg_1)
            {
                this._646343081autoBuy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "autoBuy", _local_2, _arg_1));
            };
        }

        private function jewelUpdateItemChange(_arg_1:Event):void
        {
            var _local_3:Object;
            jewelUpdateItem2.clean();
            var _local_2:Object = jewelUpdateItem1.slotData;
            if (_local_2)
            {
                if (jewelUpdateItem1.tempBagFlag)
                {
                    _local_3 = _core.getTemplateData(_local_2.ti, _local_2.ii);
                }
                else
                {
                    _local_3 = _core.getTemplateData(_local_2.type, _local_2.itemId);
                };
                if (((_local_3) && (ToolKit.isEqual(_local_3.type, GamePredef.ITEM_TYPE_JEWEL))))
                {
                    jewelUpdateItem2.type = GamePredef.TBL_ITEM_TEMPLATE;
                    jewelUpdateItem2.giid = _local_3.nextJewelTid;
                };
            };
            if (jewelUpdateItem1.stackNum >= jewelUpdateNum.value)
            {
                jewelUpdateButtonAll.enabled = true;
                jewelUpdateButtonOne.enabled = true;
            }
            else
            {
                jewelUpdateButtonAll.enabled = false;
                jewelUpdateButtonOne.enabled = false;
            };
        }

        private function setStarInfo(_arg_1:Event=null):void
        {
            var _local_2:int;
            var _local_3:Object;
            if (((tabA.selectedIndex == 5) && (petEquStarItem.slotData)))
            {
                if (ToolKit.isBigOrEqual(starNum, GamePredef.EQUIPT_STAR_MAX))
                {
                    petEquStarInfo1.label = Language.EQUIPTFUNCPANEL_S[3];
                    petEquStarOneBtn.enabled = false;
                    petEquStarAllBtn.enabled = false;
                }
                else
                {
                    _local_2 = int(int(((GamePredef.EQUIPT_STAR_SUCCESS[ToolKit.add(starNum, 1)] * petEquStarBasic.value) / 5)));
                    if (_core.MC_BIRTH_FLAG[8])
                    {
                        _local_2 = int(int(((GamePredef.MC_BIRTH_CONFIG[8][ToolKit.add(starNum, 1)] * petEquStarBasic.value) / 5)));
                    };
                    _local_3 = _core.view.getUI(ViewManager.MAIN_LONGBUFF);
                    if (((_local_3) && (_local_3.isBuffOn(3263))))
                    {
                        _local_2 = int(int(((GamePredef.EQUIPT_STAR_SUCCESS_BUFF[ToolKit.add(starNum, 1)] * petEquStarBasic.value) / 5)));
                    };
                    petEquStarInfo1.label = starNum.toString();
                    petEquStarInfo2.label = _local_2.toString();
                    if (((petEquStarJewel.slotData) && (ToolKit.isBigOrEqual(petEquStarJewel.stackNum, petEquStarBasic.value))))
                    {
                        petEquStarOneBtn.enabled = true;
                        petEquStarAllBtn.enabled = true;
                    }
                    else
                    {
                        petEquStarOneBtn.enabled = false;
                        petEquStarOneBtn.enabled = false;
                    };
                };
            };
        }

        private function restrainPetHandler(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Object;
            var _local_8:int;
            var _local_9:Number;
            var _local_10:Boolean;
            _arg_1.stopImmediatePropagation();
            if (((!(restrainEquip)) || (!(restrainEquip.slotData))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[179]);
                return;
            };
            if ((((restrainItem) && (restrainItem.slotData)) && (!(restrainItem.slotData.tid == GamePredef.RESTRAIN_ITEMID))))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[173]);
                return;
            };
            _local_2 = restrainEquip.slotData;
            _local_3 = _core.data.getGameData(_local_2.type, _local_2.itemId);
            _local_4 = ((_local_3) ? _local_3.flag : null);
            if (((!(_local_4)) || (_local_4.indexOf("sublimeId") == -1)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[179]);
                return;
            };
            _local_5 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_4));
            _local_6 = ((_local_5) ? int(_local_5.sublimeElement) : 0);
            _local_7 = ((restrainBox) ? restrainBox.selectedItem : null);
            _local_8 = ((_local_7) ? _local_7.element : 0);
            if (((_local_8 <= 0) || (_local_8 == _local_6)))
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_U[271]);
                return;
            };
            _local_9 = (((restrainItem) && (restrainItem.slotData)) ? restrainItem.slotData.id : null);
            _local_10 = ((autoRestrain) && (autoRestrain.selected));
            _core.remote.call("restrainPetEquip", new Responder(onRestrainPetEquip), restrainEquip.slotData.id, _local_9, _local_8, _local_10);
        }

        public function set petEquStarItem(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1926393423petEquStarItem;
            if (_local_2 !== _arg_1)
            {
                this._1926393423petEquStarItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupRate():BasicTxtButton
        {
            return (this._1267649387petEquLevelupRate);
        }

        public function ___EquiptFuncPanel_Canvas13_creationComplete(_arg_1:FlexEvent):void
        {
            initMWPReset();
        }

        public function set itemInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1177195105itemInfo;
            if (_local_2 !== _arg_1)
            {
                this._1177195105itemInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "itemInfo", _local_2, _arg_1));
            };
        }

        public function set makeInputItem1(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object;
            _local_2 = this._1221705314makeInputItem1;
            if (_local_2 !== _arg_1)
            {
                this._1221705314makeInputItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeInputItem1", _local_2, _arg_1));
            };
        }

        public function set makeInputItem2(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object;
            _local_2 = this._1221705315makeInputItem2;
            if (_local_2 !== _arg_1)
            {
                this._1221705315makeInputItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeInputItem2", _local_2, _arg_1));
            };
        }

        private function onNewMake(_arg_1:Object):void
        {
            if (_arg_1.flag)
            {
                makeListChange(false);
            }
            else
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[2]);
            };
        }

        private function activatePanel(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if (((!(tabInitialized[_arg_1])) || (eventListenerAdded)))
            {
                return;
            };
            eventListenerAdded = true;
            switch (_arg_1)
            {
                case 0:
                    _local_5 = 1;
                    while (_local_5 <= 3)
                    {
                        if (this[("makeInputItem" + _local_5)])
                        {
                            this[("makeInputItem" + _local_5)].addEventListener(GameEvent.SLOT_NUM_CHANGE, makeInputItemChange);
                        };
                        _local_5++;
                    };
                    introText.visible = false;
                    return;
                case 1:
                    introText.width = 355;
                    introText.height = 100;
                    introText.x = 115;
                    introText.y = 75;
                    _local_2 = 46;
                    if (equipChange.selectedIndx)
                    {
                        _local_2 = introArr3[equipChange.selectedIndx];
                        if (equipChange.selectedIndx == 10)
                        {
                            introText.height = 80;
                        };
                    };
                    equipChange.equFuncList.selectedIndex = equipChange.selectedIndx;
                    introText.htmlText = Language.EQUIPTFUNCPANEL_S[_local_2];
                    introText.visible = true;
                    return;
                case 2:
                    materialMixItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, materialMixItemChange);
                    introText.width = 450;
                    introText.height = 100;
                    introText.x = 25;
                    introText.y = 70;
                    introText.htmlText = Language.EQUIPTFUNCPANEL_S[42];
                    introText.visible = true;
                    return;
                case 3:
                    jewelUpdateItem1.addEventListener(GameEvent.SLOT_NUM_CHANGE, jewelUpdateItemChange);
                    introText.width = 450;
                    introText.height = 100;
                    introText.x = 25;
                    introText.y = 70;
                    introText.htmlText = Language.EQUIPTFUNCPANEL_S[44];
                    introText.visible = true;
                    return;
                case 4:
                    ((MWResetSkill) && (MWResetSkill.addEventListener(GameEvent.SLOT_GIID_CHANGE, MWResetSkillChange)));
                    ((MWChangeLevel) && (MWChangeLevel.addEventListener(GameEvent.SLOT_GIID_CHANGE, MWChangeLevelChange)));
                    ((MWTransFrom) && (MWTransFrom.addEventListener(GameEvent.SLOT_GIID_CHANGE, MWTransFromChange)));
                    ((mwResetProp) && (mwResetProp.addEventListener(GameEvent.SLOT_GIID_CHANGE, mwResetPropChange)));
                    ((MwSuccinct) && (MwSuccinct.addEventListener(GameEvent.SLOT_GIID_CHANGE, magicWeaponSuccinict)));
                    ((stageEqu) && (stageEqu.addEventListener(GameEvent.SLOT_GIID_CHANGE, magicWeaponStageChange)));
                    introText.width = 355;
                    introText.height = 100;
                    introText.x = 115;
                    introText.y = 70;
                    _local_3 = 90;
                    if (tabD.selectedIndex)
                    {
                        _local_3 = introArr1[tabD.selectedIndex];
                    };
                    magEquFuncList.selectedIndex = tabD.selectedIndex;
                    introText.htmlText = Language.EQUIPTFUNCPANEL_S[_local_3];
                    introText.visible = true;
                    return;
                case 5:
                    petEquStarItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, starItemChange);
                    petEquStarJewel.addEventListener(GameEvent.SLOT_NUM_CHANGE, setStarInfo);
                    petEquReadyLevelup.addEventListener(GameEvent.SLOT_GIID_CHANGE, petEquLevelupChange);
                    petEquLevelupItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, petEquLevelupItemChange);
                    petEquReadyModColor.addEventListener(GameEvent.SLOT_GIID_CHANGE, petEquModColorChange);
                    petEquModColorItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, petEquModColorItemChange);
                    petEquReadyModBind.addEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquReadyModBind);
                    petEquModBindItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquModBindItem);
                    petEquReadyPre.addEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquReadyModPre);
                    petEquModPreItem.addEventListener(GameEvent.SLOT_GIID_CHANGE, onPetEquModPreItem);
                    ((sublimeEquip) && (sublimeEquip.addEventListener(GameEvent.SLOT_GIID_CHANGE, sublimePetChange)));
                    ((restrainEquip) && (restrainEquip.addEventListener(GameEvent.SLOT_GIID_CHANGE, restrainPetChange)));
                    introText.width = 355;
                    introText.height = 100;
                    introText.x = 115;
                    introText.y = 70;
                    _local_4 = ((tabC.selectedIndex) ? introArr2[tabC.selectedIndex] : 87);
                    creEquFuncList.selectedIndex = tabC.selectedIndex;
                    introText.htmlText = Language.EQUIPTFUNCPANEL_S[_local_4];
                    introText.visible = true;
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get consumeTxt():AutoTextArea
        {
            return (this._166265644consumeTxt);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA0():BasicGlowButton
        {
            return (this._933747498tabBtnA0);
        }

        public function set hintTxt(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._922290793hintTxt;
            if (_local_2 !== _arg_1)
            {
                this._922290793hintTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hintTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA2():BasicGlowButton
        {
            return (this._933747496tabBtnA2);
        }

        public function set petEquModPreNeedItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1343807092petEquModPreNeedItem;
            if (_local_2 !== _arg_1)
            {
                this._1343807092petEquModPreNeedItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModPreNeedItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get MWResolve():ItemSlotEquFunc
        {
            return (this._1967342366MWResolve);
        }

        public function set makeInputItem3(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object;
            _local_2 = this._1221705316makeInputItem3;
            if (_local_2 !== _arg_1)
            {
                this._1221705316makeInputItem3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeInputItem3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get makeCanvas():Canvas
        {
            return (this._217727770makeCanvas);
        }

        public function MWSuccinictViewClear(_arg_1:Boolean=false):void
        {
            var _local_2:int;
            var _local_3:Object;
            if (!initialized)
            {
                return;
            };
            if (!MwSuccinct)
            {
                return;
            };
            if (MwSuccinct)
            {
                MwSuccinct.clean();
            };
            _local_2 = 0;
            while (_local_2 < 3)
            {
                this[("oldPro" + _local_2)].htmlText = "";
                this[("newPro" + _local_2)].htmlText = "";
                this[("actBtn" + _local_2)].visible = false;
                this[("lock" + _local_2)].visible = false;
                this[("lock" + _local_2)].selected = false;
                if (lockDict[_local_2])
                {
                    mwSuccinctCanvas.removeChild(lockDict[_local_2]);
                    delete lockDict[_local_2];
                };
                _local_2++;
            };
            oldSuccData = null;
            this.succinctId = -1;
            if (costInfo)
            {
                costInfo.text = "";
            };
            if (!_arg_1)
            {
                return;
            };
            _local_3 = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
            if (_local_3)
            {
                _local_3.viewClear(_arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA1():BasicGlowButton
        {
            return (this._933747497tabBtnA1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA3():BasicGlowButton
        {
            return (this._933747495tabBtnA3);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA4():BasicGlowButton
        {
            return (this._933747494tabBtnA4);
        }

        public function startNewMake():void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:Object;
            var _local_1:Object = makeList.selectedItem.equData;
            if (_local_1)
            {
                if (canMake())
                {
                    _local_2 = {};
                    _local_3 = 1;
                    while (_local_3 <= 3)
                    {
                        if (this[("makeInputItem" + _local_3)].slotData)
                        {
                            _local_4 = {};
                            if (this[("makeInputItem" + _local_3)].tempBagFlag)
                            {
                                _local_4.tempBagFlag = true;
                                _local_4.idx = this[("makeInputItem" + _local_3)].slotData.idx;
                            }
                            else
                            {
                                _local_4.tempBagFlag = false;
                                _local_4.idx = this[("makeInputItem" + _local_3)].slotData.id;
                            };
                            _local_2[_local_3] = _local_4;
                        };
                        _local_3++;
                    };
                    _core.remote.call("newMake", new Responder(onNewMake), _local_2, _local_1.id);
                };
            };
        }

        private function sublimeInitHint():void
        {
            if (!sublimeHint)
            {
                return;
            };
            sublimeHint.htmlText = Language.EQUIPTFUNCPANEL_U[274];
            sublimeHint.visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get tabBtnA5():BasicGlowButton
        {
            return (this._933747493tabBtnA5);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModColorItem():ItemSlot
        {
            return (this._799272190petEquModColorItem);
        }

        [Bindable(event="propertyChange")]
        public function get redStoneNeed():ItemSlot
        {
            return (this._1836823818redStoneNeed);
        }

        private function init():void
        {
            this.addChild(introText);
            introText.visible = false;
            equipBag.showItem = function (_arg_1:int, _arg_2:Object):void
            {
                _itemList = _arg_2;
            };
            equipBag.refreshSlots = function (_arg_1:Object):void
            {
            };
        }

        [Bindable(event="propertyChange")]
        public function get jewelUpdateNum():NumericStepper
        {
            return (this._60073210jewelUpdateNum);
        }

        public function __creEquFuncList_change(_arg_1:ListEvent):void
        {
            tabBtnCClick(creEquFuncList.selectedIndex);
        }

        private function jewelUpdateViewClear():void
        {
            jewelUpdateItem1.clean();
            jewelUpdateItem2.clean();
        }

        public function set MWSkills(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._860877172MWSkills;
            if (_local_2 !== _arg_1)
            {
                this._860877172MWSkills = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWSkills", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get transItemNeed():ItemSlot
        {
            return (this._948574959transItemNeed);
        }

        private function restrainPetChange(_arg_1:Event=null):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:String;
            var _local_5:Object;
            var _local_6:int;
            var _local_7:Array;
            var _local_8:Array;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            if (((!(restrainEquip)) || (!(restrainEquip.slotData))))
            {
                this.restrainPetClear();
                return;
            };
            _local_2 = restrainEquip.slotData;
            _local_3 = _core.data.getGameData(_local_2.type, _local_2.itemId);
            _local_4 = ((_local_3) ? _local_3.flag : null);
            if (((!(_local_4)) || (_local_4.indexOf("sublimeId") == -1)))
            {
                if (restrainHint)
                {
                    restrainHint.visible = true;
                    restrainHint.text = Language.EQUIPTFUNCPANEL_U[263];
                };
                return;
            };
            if (restrainHint)
            {
                restrainHint.visible = false;
            };
            _local_5 = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_4));
            _local_6 = (((_local_5) && (_local_5.sublimeElement)) ? int(_local_5.sublimeElement) : 0);
            _local_7 = [];
            _local_8 = Language.EQUIPTFUNCPANEL_U[265];
            _local_9 = _local_8.length;
            _local_10 = 0;
            while (_local_10 < _local_9)
            {
                _local_11 = _local_8[_local_10];
                if (_local_11.element != _local_6)
                {
                    _local_7.push(_local_11);
                };
                _local_10++;
            };
            if (restrainBox)
            {
                restrainBox.dataProvider = new ArrayCollection(_local_7);
                restrainBox.selectedIndex = 0;
            };
            if (restrainView)
            {
                restrainView.htmlText = Language.EQUIPTFUNCPANEL_U[266];
            };
        }

        [Bindable(event="propertyChange")]
        public function get materialMixPer():BasicTxtButton
        {
            return (this._1788134104materialMixPer);
        }

        public function set jewelUpdatePer(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._60074641jewelUpdatePer;
            if (_local_2 !== _arg_1)
            {
                this._60074641jewelUpdatePer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdatePer", _local_2, _arg_1));
            };
        }

        public function __actBtn0_click(_arg_1:MouseEvent):void
        {
            activateMWPro(0);
        }

        public function set petEquModColorInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._799266457petEquModColorInfo;
            if (_local_2 !== _arg_1)
            {
                this._799266457petEquModColorInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModColorInfo", _local_2, _arg_1));
            };
        }

        public function set magEquFuncList(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._1292150120magEquFuncList;
            if (_local_2 !== _arg_1)
            {
                this._1292150120magEquFuncList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "magEquFuncList", _local_2, _arg_1));
            };
        }

        private function _EquiptFuncPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.EQUIPTFUNCPANEL_U[28];
            _local_1 = Language.EQUIPTFUNCPANEL_U[57];
            _local_1 = Language.EQUIPTFUNCPANEL_U[0];
            _local_1 = Language.EQUIPTFUNCPANEL_U[29];
            _local_1 = Language.EQUIPTFUNCPANEL_U[30];
            _local_1 = Language.EQUIPTFUNCPANEL_U[31];
            _local_1 = Language.EQUIPTFUNCPANEL_U[1];
            _local_1 = Language.EQUIPTFUNCPANEL_U[32];
            _local_1 = Language.EQUIPTFUNCPANEL_U[61];
            _local_1 = ResManager.TOTEM_CHARACTER;
            _local_1 = Language.EQUIPTFUNCPANEL_U[6];
            _local_1 = Language.EQUIPTFUNCPANEL_U[7];
            _local_1 = Language.EQUIPTFUNCPANEL_U[41];
            _local_1 = Language.EQUIPTFUNCPANEL_U[37];
            _local_1 = Language.EQUIPTFUNCPANEL_U[36];
            _local_1 = Language.EQUIPTFUNCPANEL_U[62];
            _local_1 = ResManager.TOTEM_CHARACTER;
            _local_1 = Language.EQUIPTFUNCPANEL_U[8];
            _local_1 = Language.EQUIPTFUNCPANEL_U[9];
            _local_1 = Language.EQUIPTFUNCPANEL_U[42];
            _local_1 = Language.EQUIPTFUNCPANEL_U[43];
            _local_1 = Language.EQUIPTFUNCPANEL_U[37];
            _local_1 = Language.EQUIPTFUNCPANEL_U[36];
            _local_1 = Language.EQUIPTFUNCPANEL_U[71];
            _local_1 = ResManager.TOTEM_MAGIC_WEAPON;
            _local_1 = Language.EQUIPTFUNCPANEL_U[158];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_MAIN;
            _local_1 = Language.EQUIPTFUNCPANEL_U[18];
            _local_1 = Language.EQUIPTFUNCPANEL_U[164];
            _local_1 = Language.EQUIPTFUNCPANEL_U[166];
            _local_1 = (Language.EQUIPTFUNCPANEL_U[204] + spirituality);
            _local_1 = Language.EQUIPTFUNCPANEL_U[165];
            _local_1 = Language.EQUIPTFUNCPANEL_U[159];
            _local_1 = ItemSlotEquFunc.EQUIP_MW;
            _local_1 = {
                "kinds":{"5":true},
                "ids":{
                    "4905":true,
                    "4906":true,
                    "4907":true,
                    "3849":true,
                    "3850":true,
                    "3851":true,
                    "3852":true,
                    "3853":true,
                    "3854":true,
                    "0x0F0F":true,
                    "3856":true,
                    "3857":true,
                    "3858":true
                }
            };
            _local_1 = Language.EQUIPTFUNCPANEL_U[20];
            _local_1 = Language.EQUIPTFUNCPANEL_U[20];
            _local_1 = Language.EQUIPTFUNCPANEL_U[167];
            _local_1 = Language.EQUIPTFUNCPANEL_U[277];
            _local_1 = Language.EQUIPTFUNCPANEL_U[168];
            _local_1 = Language.EQUIPTFUNCPANEL_U[160];
            _local_1 = ItemSlotEquFunc.EQUIP_MW;
            _local_1 = {"types":{"510":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[162];
            _local_1 = Language.EQUIPTFUNCPANEL_U[169];
            _local_1 = Language.EQUIPTFUNCPANEL_U[170];
            _local_1 = Language.EQUIPTFUNCPANEL_U[205];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_SUB;
            _local_1 = Language.EQUIPTFUNCPANEL_U[206];
            _local_1 = Language.EQUIPTFUNCPANEL_U[207];
            _local_1 = Language.VIP_SUCCINCT_P[1];
            _local_1 = Language.EQUIPTFUNCPANEL_U[224];
            _local_1 = Language.EQUIPTFUNCPANEL_U[214];
            _local_1 = Language.EQUIPTFUNCPANEL_U[232];
            _local_1 = Language.EQUIPTFUNCPANEL_U[214];
            _local_1 = Language.EQUIPTFUNCPANEL_U[232];
            _local_1 = Language.EQUIPTFUNCPANEL_U[214];
            _local_1 = Language.EQUIPTFUNCPANEL_U[232];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[210];
            _local_1 = Language.EQUIPTFUNCPANEL_U[212];
            _local_1 = Language.EQUIPTFUNCPANEL_U[211];
            _local_1 = Language.EQUIPTFUNCPANEL_U[213];
            _local_1 = Language.EQUIPTFUNCPANEL_U[161];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_MAIN;
            _local_1 = {"types":{"511":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[163];
            _local_1 = Language.EQUIPTFUNCPANEL_U[171];
            _local_1 = Language.EQUIPTFUNCPANEL_U[172];
            _local_1 = Language.EQUIPTFUNCPANEL_U[165];
            _local_1 = Language.EQUIPTFUNCPANEL_U[164];
            _local_1 = SKILL_PROVIDER;
            _local_1 = Language.EQUIPTFUNCPANEL_U[175];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_MAIN;
            _local_1 = ItemSlotEquFunc.EQUIP_MW_MAIN;
            _local_1 = {"types":{"0x0202":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[175];
            _local_1 = Language.EQUIPTFUNCPANEL_U[177];
            _local_1 = Language.EQUIPTFUNCPANEL_U[178];
            _local_1 = Language.EQUIPTFUNCPANEL_U[179];
            _local_1 = Language.EQUIPTFUNCPANEL_U[188];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_MAIN;
            _local_1 = {"types":{"519":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[189];
            _local_1 = Language.EQUIPTFUNCPANEL_U[190];
            _local_1 = Language.EQUIPTFUNCPANEL_U[191];
            _local_1 = Language.EQUIPTFUNCPANEL_U[192];
            _local_1 = Language.EQUIPTFUNCPANEL_U[193];
            _local_1 = Language.EQUIPTFUNCPANEL_U[160];
            _local_1 = Language.EQUIPTFUNCPANEL_U[238];
            _local_1 = ItemSlotEquFunc.EQUIP_MW_MAIN;
            _local_1 = Language.EQUIPTFUNCPANEL_U[239];
            _local_1 = {"types":{"522":true}};
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.EQUIPTFUNCPANEL_U[240];
            _local_1 = (!(hintTxt.visible));
            _local_1 = Assets.UP_ARROW;
            _local_1 = (!(hintTxt.visible));
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.EQUIPTFUNCPANEL_U[242];
            _local_1 = listArr1;
            _local_1 = Language.EQUIPTFUNCPANEL_U[72];
            _local_1 = ResManager.TOTEM_PET_EQUIP;
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = Language.EQUIPTFUNCPANEL_U[2];
            _local_1 = Language.EQUIPTFUNCPANEL_U[3];
            _local_1 = Language.EQUIPTFUNCPANEL_U[33];
            _local_1 = Language.EQUIPTFUNCPANEL_U[34];
            _local_1 = Language.EQUIPTFUNCPANEL_U[35];
            _local_1 = Language.EQUIPTFUNCPANEL_U[36];
            _local_1 = Language.EQUIPTFUNCPANEL_U[37];
            _local_1 = Language.EQUIPTFUNCPANEL_U[38];
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = [GamePredef.TBL_ITEM_INSTANCE];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = [GamePredef.TBL_ITEM_INSTANCE];
            _local_1 = Language.EQUIPTFUNCPANEL_U[76];
            _local_1 = Language.EQUIPTFUNCPANEL_U[77];
            _local_1 = Language.EQUIPTFUNCPANEL_U[78];
            _local_1 = Language.EQUIPTFUNCPANEL_U[79];
            _local_1 = Language.EQUIPTFUNCPANEL_U[80];
            _local_1 = Language.EQUIPTFUNCPANEL_U[81];
            _local_1 = Language.EQUIPTFUNCPANEL_U[52];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.EQUIPTFUNCPANEL_U[9];
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.EQUIPTFUNCPANEL_U[82];
            _local_1 = Language.EQUIPTFUNCPANEL_U[78];
            _local_1 = Language.EQUIPTFUNCPANEL_U[83];
            _local_1 = Language.EQUIPTFUNCPANEL_U[80];
            _local_1 = Language.EQUIPTFUNCPANEL_U[52];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.EQUIPTFUNCPANEL_U[86];
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.EQUIPTFUNCPANEL_U[52];
            _local_1 = Language.EQUIPTFUNCPANEL_U[82];
            _local_1 = Language.EQUIPTFUNCPANEL_U[78];
            _local_1 = Language.EQUIPTFUNCPANEL_U[83];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.EQUIPTFUNCPANEL_U[86];
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.EQUIPTFUNCPANEL_U[52];
            _local_1 = Language.EQUIPTFUNCPANEL_U[82];
            _local_1 = Language.EQUIPTFUNCPANEL_U[78];
            _local_1 = Language.EQUIPTFUNCPANEL_U[83];
            _local_1 = Language.PETFUNCPANEL_U[18];
            _local_1 = Language.EQUIPTFUNCPANEL_U[86];
            _local_1 = Language.EQUIPTFUNCPANEL_U[275];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_U[245];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = {"types":{"523":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[274];
            _local_1 = (!(sublimeHint.visible));
            _local_1 = Assets.UP_ARROW;
            _local_1 = (!(sublimeHint.visible));
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = (!(sublimeHint.visible));
            _local_1 = Language.EQUIPTFUNCPANEL_U[249];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_U[248];
            _local_1 = Language.EQUIPTFUNCPANEL_U[261];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_U[262];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ItemSlotEquFunc.EQUIP_PETEQU;
            _local_1 = {"types":{"524":true}};
            _local_1 = Language.EQUIPTFUNCPANEL_U[276];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = (!(restrainHint.visible));
            _local_1 = Language.EQUIPTFUNCPANEL_U[264];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_U[266];
            _local_1 = (!(restrainHint.visible));
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_U[268];
            _local_1 = (!(restrainHint.visible));
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = (!(restrainHint.visible));
            _local_1 = Language.EQUIPTFUNCPANEL_U[269];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.EQUIPTFUNCPANEL_U[270];
            _local_1 = listArr2;
            _local_1 = Language.EQUIPTFUNCPANEL_U[21];
            _local_1 = Language.EQUIPTFUNCPANEL_U[27];
            _local_1 = Language.EQUIPTFUNCPANEL_U[25];
            _local_1 = Language.EQUIPTFUNCPANEL_U[26];
            _local_1 = Language.EQUIPTFUNCPANEL_U[71];
            _local_1 = Language.EQUIPTFUNCPANEL_U[72];
            _local_1 = Language.EQUIPTFUNCPANEL_S[97];
        }

        private function onSurePetEquModPre(_arg_1:Object):void
        {
            var _local_2:*;
            var _local_3:Object;
            var _local_4:*;
            var _local_5:String;
            if (_arg_1.f == "sure")
            {
                _core.sysMidNote(Language.WING_PANEL_U[36]);
                _local_2 = _arg_1.n.id;
                _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_local_2] = _arg_1.n;
                _local_3 = _core.getTemplateData(petEquReadyPre.slotData.type, petEquReadyPre.slotData.itemId, false);
                if (_arg_1.n)
                {
                    _local_4 = GamePredef.EQUIPT_STAR_NUM[_arg_1.n.upgradeNum];
                    _local_5 = ((((((((((Language.EQUIPTFUNCPANEL_U[201] + Language.EQUIPTFUNCPANEL_U[202]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_arg_1.n.mainProp1]) + ":") + int((_arg_1.n.mainPropNum1 * _local_4))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_arg_1.n.mainProp2]) + ":") + int((_arg_1.n.mainPropNum2 * _local_4)));
                    if (_arg_1.n.prop1 > 0)
                    {
                        _local_5 = ((((_local_5 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_arg_1.n.prop1]) + ":") + _arg_1.n.propNum1);
                    };
                    if (_arg_1.n.prop2 > 0)
                    {
                        _local_5 = ((((_local_5 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_arg_1.n.prop2]) + ":") + _arg_1.n.propNum2);
                    };
                    _local_5 = (((((((((((((_local_5 + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_arg_1.n.mainProp1]) + ": ") + _arg_1.n.bindMainPropNum1) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_arg_1.n.mainProp2]) + ": ") + _arg_1.n.bindMainPropNum2) + "%");
                    curProp.htmlText = _local_5;
                };
            };
        }

        private function onSurepetEquModBind(_arg_1:Object):void
        {
            var _local_2:Object;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.f == "sure")
            {
                _local_2 = _core.getTemplateData(petEquReadyModBind.slotData.type, petEquReadyModBind.slotData.itemId, false);
                if (((_local_2) && (isPetEqu(_local_2))))
                {
                    petEquModBindSucc.htmlText = Language.EQUIPTFUNCPANEL_S[58];
                    if (ToolKit.isBigThan(_arg_1.b1, 0))
                    {
                        petEquModBindInfo.htmlText = (((((((("<font color='#FFFFFF'>" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + "</font>") + "<font color='#00FFFF'>") + _arg_1.b1) + "%") + "</font>");
                    };
                    if (ToolKit.isBigThan(_arg_1.b2, 0))
                    {
                        petEquModBindInfo.htmlText = (petEquModBindInfo.htmlText + ((((((((("\n" + "<font color='#FFFFFF'>") + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + "</font>") + "<font color='#00FFFF'>") + _arg_1.b2) + "%") + "</font>"));
                    };
                };
            }
            else
            {
                petEquModBindSucc.htmlText = "";
                petEquModBindInfo.htmlText = "";
            };
        }

        private function petEquLevelupClear():void
        {
            petEquReadyLevelup.clean();
            nextPetEqu.clean();
            petEquLevelupItemNeed.clean();
            petEquLevelupItem.clean();
            petEquLevelupInfo.text = "";
            petEquLevelupMoney.text = "";
            petEquLevelupReqNum.htmlText = "";
        }

        private function magicWeaponResetSkill():void
        {
            var onMWResetSkill:Function;
            var onConfirm:Function;
            onMWResetSkill = function (_arg_1:Object):void
            {
                var _local_2:*;
                var _local_3:*;
                var _local_4:*;
                if (((_arg_1) && (_arg_1.succ)))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        redStoneNeed.stackNum = _arg_1.num;
                    }
                    else
                    {
                        redStoneNeed.clean();
                    };
                    _local_2 = _arg_1.sid;
                    _local_3 = _core.getTemplateData(GamePredef.TBL_SKILL, _local_2);
                    _local_4 = (((_local_3) && (_local_3.name)) || (_local_2));
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[86].replace("{skillName}", _local_4));
                    MWResetSkillChange(null);
                };
            };
            if (((((MWResetSkill.slotData) && (redStoneNeed.slotData)) && (Number(MWSkills.selectedItem.position) > 0)) && (skillListReady)))
            {
                onConfirm = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.OK)
                    {
                        _core.remote.call("magicWeaponResetSkill", new Responder(onMWResetSkill), MWResetSkill.slotData.id, redStoneNeed.slotData.id, MWSkills.selectedItem.position);
                        skillResetIndex = MWSkills.selectedIndex;
                    };
                };
                Alert.show(Language.EQUIPTFUNCPANEL_S[94].replace("{skillName}", MWSkills.selectedItem.label), "", (Alert.OK | Alert.CANCEL), this, onConfirm);
            }
            else
            {
                if (Number(MWSkills.selectedItem.position) == -1)
                {
                    MWSkills.open();
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[79]);
                }
                else
                {
                    if (!skillListReady)
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[80]);
                    }
                    else
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[82]);
                    };
                };
            };
        }

        public function set petEquStarMax(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._1877517656petEquStarMax;
            if (_local_2 !== _arg_1)
            {
                this._1877517656petEquStarMax = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquStarMax", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get modBindReqNum():Label
        {
            return (this._1232558777modBindReqNum);
        }

        public function set progressBar(_arg_1:ProgressBarCanvas):void
        {
            var _local_2:Object;
            _local_2 = this._1131509414progressBar;
            if (_local_2 !== _arg_1)
            {
                this._1131509414progressBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressBar", _local_2, _arg_1));
            };
        }

        public function set makeTree(_arg_1:Tree):void
        {
            var _local_2:Object;
            _local_2 = this._40519340makeTree;
            if (_local_2 !== _arg_1)
            {
                this._40519340makeTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeTree", _local_2, _arg_1));
            };
        }

        public function updateMWSuccView(_arg_1:Object, _arg_2:Object, _arg_3:Boolean=false):void
        {
            var _local_4:int;
            var _local_5:int;
            if (_arg_1)
            {
                this.oldSuccData = _arg_1;
            };
            _local_4 = 0;
            while (_local_4 < 3)
            {
                if (_arg_1)
                {
                    if (_arg_1[("succ" + _local_4)])
                    {
                        this[("oldPro" + _local_4)].htmlText = this.encodePropInfo(_arg_1[("succ" + _local_4)], true);
                        this[("lock" + _local_4)].visible = true;
                        if (_arg_3)
                        {
                            this[("lock" + _local_4)].selected = false;
                        };
                        this[("actBtn" + _local_4)].visible = false;
                    }
                    else
                    {
                        this[("oldPro" + _local_4)].htmlText = "";
                        this[("lock" + _local_4)].visible = false;
                        this[("lock" + _local_4)].selected = false;
                        this[("actBtn" + _local_4)].visible = true;
                    };
                };
                if (_arg_2)
                {
                    if (_arg_2[("succ" + _local_4)])
                    {
                        this[("newPro" + _local_4)].htmlText = this.encodePropInfo(_arg_2[("succ" + _local_4)], true);
                    }
                    else
                    {
                        this[("newPro" + _local_4)].htmlText = "";
                    };
                }
                else
                {
                    this[("newPro" + _local_4)].htmlText = "";
                };
                if (((_arg_3) && (lockDict[_local_4])))
                {
                    mwSuccinctCanvas.removeChild(lockDict[_local_4]);
                    delete lockDict[_local_4];
                };
                _local_4++;
            };
            _local_5 = _core.getItemNum(29, GamePredef.MW_SUCC_ITEM).num;
            itemInfo.text = (Language.EQUIPTFUNCPANEL_U[208] + _local_5);
            updateCostInfo();
        }

        [Bindable(event="propertyChange")]
        public function get autoSublime():CheckBox
        {
            return (this._1036064102autoSublime);
        }

        [Bindable(event="propertyChange")]
        public function get mwSuccinctCanvas():Canvas
        {
            return (this._517338458mwSuccinctCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get stageEqu():ItemSlotEquFunc
        {
            return (this._1306166635stageEqu);
        }

        public function set makeButton(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._227709248makeButton;
            if (_local_2 !== _arg_1)
            {
                this._227709248makeButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeButton", _local_2, _arg_1));
            };
        }

        private function makeTreeChange():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:*;
            if (((makeTree.selectedItem) && (makeTree.selectedItem.type)))
            {
                _local_1 = _core.data.gameDataIndex[GamePredef.TBL_EQUIPT_TEMPLATE][makeTree.selectedItem.type];
                if (((makeTree.selectedItem.type >= 400) && (makeTree.selectedItem.type <= 403)))
                {
                    for (_local_3 in _local_1)
                    {
                        if ((((_local_1[_local_3]) && (ToolKit.isEqual(_local_1[_local_3].makable, 1))) && ((classType.selectedItem.cid == "all") || (_local_1[_local_3].reqClassId.indexOf((("|" + classType.selectedItem.cid) + "|")) >= 0))))
                        {
                            if (!_local_2)
                            {
                                _local_2 = {};
                            };
                            _local_2[_local_3] = _local_1[_local_3];
                        };
                    };
                }
                else
                {
                    for (_local_3 in _local_1)
                    {
                        if ((((_local_1[_local_3]) && (ToolKit.isEqual(_local_1[_local_3].makable, 1))) && ((classType.selectedItem.cid == "all") || (_local_1[_local_3].reqClass.indexOf((("|" + classType.selectedItem.cid) + "|")) >= 0))))
                        {
                            if (!_local_2)
                            {
                                _local_2 = {};
                            };
                            _local_2[_local_3] = _local_1[_local_3];
                        };
                    };
                };
                onGetEquMake(_local_2);
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarInfo1():BasicTxtButton
        {
            return (this._411523705petEquStarInfo1);
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarInfo2():BasicTxtButton
        {
            return (this._411523704petEquStarInfo2);
        }

        public function set petEquModBindBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._341889337petEquModBindBtn;
            if (_local_2 !== _arg_1)
            {
                this._341889337petEquModBindBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModBindBtn", _local_2, _arg_1));
            };
        }

        public function set mwResetProp(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._476789048mwResetProp;
            if (_local_2 !== _arg_1)
            {
                this._476789048mwResetProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mwResetProp", _local_2, _arg_1));
            };
        }

        public function set petEquReadyLevelup(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._643565254petEquReadyLevelup;
            if (_local_2 !== _arg_1)
            {
                this._643565254petEquReadyLevelup = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquReadyLevelup", _local_2, _arg_1));
            };
        }

        public function ___EquiptFuncPanel_BasicGlowButton8_click(_arg_1:MouseEvent):void
        {
            magicWeaponResolve();
        }

        public function set petEquLevelupItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1267899704petEquLevelupItem;
            if (_local_2 !== _arg_1)
            {
                this._1267899704petEquLevelupItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupItem", _local_2, _arg_1));
            };
        }

        public function succinct():void
        {
            var view:Object;
            var gfunc:Function;
            var func:Function;
            if (!_core.delPass)
            {
                gfunc = function (_arg_1:String):void
                {
                    _core.remote.call("unlockMoney", null, MD5.hash(_arg_1));
                };
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.DELETE_BY_PASS[1], gfunc);
                return;
            };
            if (((!(this.MwSuccinct.giid)) || (this.MwSuccinct.giid < 0)))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[226], "", Alert.YES, null, null);
                return;
            };
            view = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
            if (view)
            {
                if (view.haveSuccData())
                {
                    func = function (_arg_1:CloseEvent):*
                    {
                        var _local_2:Object;
                        if (_arg_1.detail == Alert.YES)
                        {
                            _succinct();
                            _local_2 = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
                            if (_local_2)
                            {
                                _local_2.clearSuccDb();
                            };
                        };
                    };
                    if (_alert)
                    {
                        PopUpManager.removePopUp(_alert);
                        _alert = null;
                    };
                    _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[219], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    _succinct();
                };
            };
        }

        public function set petEquModColorRate(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object;
            _local_2 = this._799522507petEquModColorRate;
            if (_local_2 !== _arg_1)
            {
                this._799522507petEquModColorRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModColorRate", _local_2, _arg_1));
            };
        }

        public function set sublimeItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1885394232sublimeItem;
            if (_local_2 !== _arg_1)
            {
                this._1885394232sublimeItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimeItem", _local_2, _arg_1));
            };
        }

        private function sublimePetClear():void
        {
            ((sublimeEquip) && (sublimeEquip.clean()));
            ((sublimeItem) && (sublimeItem.clean()));
            if (!hintTxt)
            {
                return;
            };
            hintTxt.htmlText = Language.EQUIPTFUNCPANEL_U[246];
            hintTxt.visible = true;
        }

        private function materialMixAll():void
        {
            var _local_1:int;
            if (materialMixItem.slotData)
            {
                materialButtonAll.enabled = false;
                materialButtonOne.enabled = false;
                if (materialMixItem.tempBagFlag)
                {
                    _local_1 = materialMixItem.slotData.idx;
                }
                else
                {
                    _local_1 = materialMixItem.slotData.id;
                };
                _core.remote.call("materialMixAll", new Responder(onMaterialMix), materialMixNum.value, _local_1, materialMixItem.tempBagFlag);
            };
        }

        public function __jewelUpdateButtonAll_click(_arg_1:MouseEvent):void
        {
            jewelUpdateAll();
        }

        public function __petEquModPreBtn_click(_arg_1:MouseEvent):void
        {
            petEquModPre();
        }

        [Bindable(event="propertyChange")]
        public function get MWChangeLevel():ItemSlotEquFunc
        {
            return (this._1518482858MWChangeLevel);
        }

        public function __tabBtnA4_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(4);
        }

        [Bindable(event="propertyChange")]
        public function get makePer3():BoxLabel
        {
            return (this._40388036makePer3);
        }

        [Bindable(event="propertyChange")]
        public function get makePer4():BoxLabel
        {
            return (this._40388037makePer4);
        }

        [Bindable(event="propertyChange")]
        public function get makePer1():BoxLabel
        {
            return (this._40388034makePer1);
        }

        [Bindable(event="propertyChange")]
        public function get makePer2():BoxLabel
        {
            return (this._40388035makePer2);
        }

        public function set maxProp(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._843999975maxProp;
            if (_local_2 !== _arg_1)
            {
                this._843999975maxProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxProp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModPreBtn():BasicDelayButton
        {
            return (this._849134127petEquModPreBtn);
        }

        public function ___EquiptFuncPanel_BasicGlowButton23_click(_arg_1:MouseEvent):void
        {
            sublimePetHandler(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get MWRepair():ItemSlotEquFunc
        {
            return (this._894849577MWRepair);
        }

        public function onScriptSublimePet(_arg_1:Number, _arg_2:String):void
        {
            var _local_3:Object;
            var _local_4:Object;
            if (((!(sublimeEquip)) || (!(sublimeEquip.slotData))))
            {
                return;
            };
            _local_3 = sublimeEquip.slotData;
            if (((!(_local_3)) || (!(_local_3.itemId == _arg_1))))
            {
                return;
            };
            _local_4 = _dm.getGameData(_local_3.type, _local_3.itemId);
            if (!_local_4)
            {
                return;
            };
            _local_4.flag = _arg_2;
            _dm.updateData(_local_3.type, _local_4);
            sublimePetChange();
        }

        private function buyStar():void
        {
            var bagpanel:* = _core.view.getUI(ViewManager.PANEL_BAG);
            var func:Function = function (_arg_1:String):void
            {
                _core.remote.call("unlockMoney", new Responder(doBuyStar), MD5.hash(_arg_1));
            };
            if (bagpanel.goldDisable())
            {
                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], func);
            }
            else
            {
                doBuyStar(true);
            };
        }

        private function MWChangeLevelChange(e:Event):void
        {
            var onSpiritRequire:Function = function (_arg_1:Object):void
            {
                if (_arg_1)
                {
                    if (_arg_1.value)
                    {
                        upgradeRequireLabel.text = (Language.EQUIPTFUNCPANEL_U[165] + _arg_1.value);
                    }
                    else
                    {
                        upgradeRequireLabel.text = Language.EQUIPTFUNCPANEL_U[173];
                    };
                };
            };
            if (MWChangeLevel.slotData)
            {
                _core.remote.call("getSpiritRequire", new Responder(onSpiritRequire), MWChangeLevel.slotData.id);
            };
        }

        public function __makeList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopPropagation();
        }

        public function ___EquiptFuncPanel_BasicGlowButton17_click(_arg_1:MouseEvent):void
        {
            magicWeaponResetSkill();
        }

        public function updateCostInfo():void
        {
            var _local_1:int;
            var _local_2:int;
            _local_1 = 0;
            _local_2 = 0;
            while (_local_2 < 3)
            {
                if (this[("lock" + _local_2)].visible)
                {
                    _local_1++;
                };
                if (this[("lock" + _local_2)].selected)
                {
                    _local_1++;
                };
                _local_2++;
            };
            costInfo.text = Language.EQUIPTFUNCPANEL_U[209].replace("{num}", _local_1);
        }

        [Bindable(event="propertyChange")]
        public function get resetStoneNeed():ItemSlot
        {
            return (this._1748616716resetStoneNeed);
        }

        public function onQuerySuccinictInfo(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            updateMWSuccView(_arg_1.flag, null, true);
        }

        private function initMWPReset():void
        {
            (((tabD) && (tabD.selectedIndex == 6)) && (mwResetProp.addEventListener(GameEvent.SLOT_GIID_CHANGE, mwResetPropChange)));
        }

        public function set petEquModColorBtn(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object;
            _local_2 = this._718512913petEquModColorBtn;
            if (_local_2 !== _arg_1)
            {
                this._718512913petEquModColorBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModColorBtn", _local_2, _arg_1));
            };
        }

        public function magicWeaponSuccinict(e:Event):void
        {
            var hasNewData:Boolean;
            var i:int;
            var mwInst:Object;
            var tData:Object;
            var func:Function;
            if (MwSuccinct.giid)
            {
                mwInst = _core.data.getGameData(MwSuccinct.slotData.type, MwSuccinct.giid);
                tData = _core.getTemplateData(GamePredef.TBL_EQUIPT_INSTANCE, MwSuccinct.giid);
                if ((((((!(mwInst)) || (!(int(mwInst.binded) == 1))) || (!(tData))) || (!(tData.type == GamePredef.ITEM_TYPE_SUB_MAGICWEAPON))) || (!(int(mwInst.color) == 2))))
                {
                    if (_alert)
                    {
                        PopUpManager.removePopUp(_alert);
                        _alert = null;
                    };
                    _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[221], "", Alert.YES, null, null);
                    if (((MwSuccinct.giid < 0) || (succinctId < 0)))
                    {
                        MWSuccinictViewClear();
                    }
                    else
                    {
                        MwSuccinct.giid = succinctId;
                    };
                    return;
                };
                if (_core.player.level < GamePredef.ACTIVATE_MW_LEVEL[(int(tData.position) - 16)])
                {
                    if (((MwSuccinct.giid < 0) || (succinctId < 0)))
                    {
                        MWSuccinictViewClear();
                    }
                    else
                    {
                        MwSuccinct.giid = succinctId;
                    };
                    if (_alert)
                    {
                        PopUpManager.removePopUp(_alert);
                        _alert = null;
                    };
                    _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[225].replace("{level}", GamePredef.ACTIVATE_MW_LEVEL[(int(tData.position) - 16)]), "", Alert.YES, null, null);
                    return;
                };
            };
            hasNewData = false;
            i = 0;
            while (i < 3)
            {
                if (((this[("newPro" + i)]) && (!(this[("newPro" + i)].htmlText == ""))))
                {
                    hasNewData = true;
                    break;
                };
                i = (i + 1);
            };
            if ((((succinctId > 0) && (!(MwSuccinct.giid == succinctId))) && (MwSuccinct.giid > 0)))
            {
                if (hasNewData)
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            succinctId = MwSuccinct.giid;
                            _core.remote.call("showMWInfo", new Responder(onQuerySuccinictInfo), MwSuccinct.giid);
                        }
                        else
                        {
                            MwSuccinct.giid = succinctId;
                        };
                    };
                    if (_alert)
                    {
                        PopUpManager.removePopUp(_alert);
                        _alert = null;
                    };
                    _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[218], "", (Alert.YES | Alert.NO), null, func);
                }
                else
                {
                    succinctId = MwSuccinct.giid;
                    _core.remote.call("showMWInfo", new Responder(onQuerySuccinictInfo), MwSuccinct.giid);
                };
            }
            else
            {
                if (((MwSuccinct.giid > 0) && (succinctId < 0)))
                {
                    succinctId = MwSuccinct.giid;
                    _core.remote.call("showMWInfo", new Responder(onQuerySuccinictInfo), MwSuccinct.giid);
                };
            };
        }

        public function set petEquLevelupBasic(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._657202407petEquLevelupBasic;
            if (_local_2 !== _arg_1)
            {
                this._657202407petEquLevelupBasic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupBasic", _local_2, _arg_1));
            };
        }

        public function saveSuccinct():void
        {
            var func:Function;
            if ((((!(this.MwSuccinct.giid)) || (this.MwSuccinct.giid < 0)) || (!(hasSuccData()))))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[217], "", Alert.YES, null, null);
                return;
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            func = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.nc.call("onSureSuccinctMW", new Responder(onSureSuccinctMW), 1);
                };
            };
            _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[229], "", (Alert.YES | Alert.NO), null, func);
        }

        public function set stagePropRight(_arg_1:AutoTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._144551707stagePropRight;
            if (_local_2 !== _arg_1)
            {
                this._144551707stagePropRight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stagePropRight", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get MWTransTo():ItemSlotEquFunc
        {
            return (this._163196473MWTransTo);
        }

        public function set petEquModReqNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._803512544petEquModReqNum;
            if (_local_2 !== _arg_1)
            {
                this._803512544petEquModReqNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModReqNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get sublimeHint():AutoTextArea
        {
            return (this._1885434308sublimeHint);
        }

        public function set sublimeEquip(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1678552859sublimeEquip;
            if (_local_2 !== _arg_1)
            {
                this._1678552859sublimeEquip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimeEquip", _local_2, _arg_1));
            };
        }

        private function onPetEquModPreItem(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:*;
            var _local_5:String;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:String;
            var _local_9:Object;
            if (_arg_1.target.slotData)
            {
                petEquModPreInfo.htmlText = "";
                if (petEquReadyPre.slotData)
                {
                    _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][petEquReadyPre.slotData.itemId];
                    _local_3 = _core.getTemplateData(petEquReadyPre.slotData.type, petEquReadyPre.slotData.itemId, false);
                    if (((_local_2) && (_local_3)))
                    {
                        _local_4 = GamePredef.EQUIPT_STAR_NUM[_local_2.upgradeNum];
                        _local_5 = ((((((((((Language.EQUIPTFUNCPANEL_U[201] + Language.EQUIPTFUNCPANEL_U[202]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int((_local_2.mainPropNum1 * _local_4))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int((_local_2.mainPropNum2 * _local_4)));
                        if (Number(_local_2.prop1) > 0)
                        {
                            _local_5 = ((((_local_5 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + _local_2.propNum1);
                        };
                        if (Number(_local_2.prop2) > 0)
                        {
                            _local_5 = ((((_local_5 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + _local_2.propNum2);
                        };
                        _local_5 = (((((((((((((_local_5 + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + _local_2.bindMainPropNum1) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + _local_2.bindMainPropNum2) + "%");
                        curProp.htmlText = _local_5;
                        _local_6 = (_local_2.color * 5);
                        if (GamePredef.EQUIPT_QUALITY[_local_6])
                        {
                            _local_7 = GamePredef.EQUIPT_QUALITY[_local_6];
                            _local_8 = ((((((((((Language.EQUIPTFUNCPANEL_U[203] + Language.EQUIPTFUNCPANEL_U[202]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ":") + int(Math.round(((_local_3.mainPropNum1 * _local_7) * _local_4)))) + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ":") + int(Math.round(((_local_3.mainPropNum2 * _local_7) * _local_4))));
                            if (Number(_local_2.prop1) > 0)
                            {
                                _local_8 = ((((_local_8 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop1]) + ":") + Math.round((_local_3.propNum1 * _local_7)));
                            };
                            if (Number(_local_2.prop2) > 0)
                            {
                                _local_8 = ((((_local_8 + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.prop2]) + ":") + Math.round((_local_3.propNum2 * _local_7)));
                            };
                            _local_8 = (((((((((((((_local_8 + "<br>") + Language.WING_PANEL_U[54]) + "：") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp1]) + ": ") + Math.round((_local_3.bindPropNum * _local_7))) + "%") + "<br>") + GamePredef.EQUIPT_PROP_NAME[_local_2.mainProp2]) + ": ") + Math.round((_local_3.bindPropNum * _local_7))) + "%");
                            maxProp.htmlText = _local_8;
                        };
                    }
                    else
                    {
                        curProp.htmlText = "";
                        maxProp.htmlText = "";
                    };
                };
                if (((petEquReadyPre.slotData) && (ToolKit.isBigThan(petEquModPreNeedItem.giid, 0))))
                {
                    _local_9 = _core.getTemplateData(petEquModPreItem.slotData.type, petEquModPreItem.slotData.itemId, false);
                    if (((_local_9) && (ToolKit.isEqual(_local_9.id, petEquModPreNeedItem.giid))))
                    {
                        petEquModPreBtn.enabled = true;
                        return;
                    };
                    petEquModPreItem.clean();
                };
            };
            petEquModPreBtn.enabled = false;
        }

        public function clear():void
        {
            if (equipChange)
            {
                equipChange.clear();
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquStarItem():ItemSlotEquFunc
        {
            return (this._1926393423petEquStarItem);
        }

        public function set stagePropLeft(_arg_1:AutoTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1658087640stagePropLeft;
            if (_local_2 !== _arg_1)
            {
                this._1658087640stagePropLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stagePropLeft", _local_2, _arg_1));
            };
        }

        public function __materialButtonAll_click(_arg_1:MouseEvent):void
        {
            materialMixAll();
        }

        private function petEquModColorItemChange(_arg_1:Event):void
        {
            var _local_2:Object;
            if (petEquModColorItem.slotData)
            {
                _local_2 = _core.getTemplateData(petEquModColorItem.slotData.type, petEquModColorItem.slotData.itemId, false);
                if ((((((_local_2) && (ToolKit.isEqual(_local_2.type, GamePredef.ITEM_TYPE_PETEQU_MODCOLOR))) && (ToolKit.isEqual(_local_2.id, modColorReqId))) && (!(ToolKit.isEqual(modColorReqNum, -1)))) && (ToolKit.isBigOrEqual(petEquModColorItem.stackNum, modColorReqNum))))
                {
                    petEquModColorInfo.text = "";
                    petEquModColorBtn.enabled = true;
                    return;
                };
            };
        }

        public function set blueStoneGet(_arg_1:ItemSlotMaterial):void
        {
            var _local_2:Object;
            _local_2 = this._1359520555blueStoneGet;
            if (_local_2 !== _arg_1)
            {
                this._1359520555blueStoneGet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "blueStoneGet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get autoBuy():CheckBox
        {
            return (this._646343081autoBuy);
        }

        public function ___EquiptFuncPanel_Canvas6_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(4);
        }

        private function MWResetSkillChange(e:Event):void
        {
            var onGetSkills:Function;
            onGetSkills = function (_arg_1:Object):void
            {
                var _local_2:ArrayCollection;
                var _local_3:*;
                var _local_4:*;
                var _local_5:*;
                if (_arg_1)
                {
                    _local_2 = new ArrayCollection();
                    _local_2.addItem({
                        "position":-1,
                        "label":Language.EQUIPTFUNCPANEL_S[81]
                    });
                    for (_local_3 in _arg_1)
                    {
                        _local_4 = _core.getTemplateData(GamePredef.TBL_SKILL, Number(_arg_1[_local_3]));
                        _local_5 = ((_local_4) ? _local_4.name : _arg_1[_local_3]);
                        _local_2.addItem({
                            "position":_local_3,
                            "label":_local_5
                        });
                    };
                    MWSkills.dataProvider = _local_2;
                    if (skillResetIndex != -1)
                    {
                        MWSkills.selectedIndex = skillResetIndex;
                        skillResetIndex = -1;
                    };
                    skillListReady = true;
                };
            };
            if (MWResetSkill.slotData)
            {
                skillListReady = false;
                _core.remote.call("getMWSkills", new Responder(onGetSkills), MWResetSkill.slotData.id);
            };
        }

        private function magicWeaponStageChange(_arg_1:Event=null):void
        {
            var _local_10:Object;
            var _local_13:Object;
            var _local_23:int;
            var _local_24:String;
            var _local_25:Object;
            if (!stageEqu.slotData)
            {
                magicWeaponStageViewClear();
                return;
            };
            var _local_2:Object = stageEqu.slotData;
            var _local_3:Object = _core.data.getGameData(_local_2.type, _local_2.itemId);
            if (!ToolKit.isEqual(_local_3.binded, 1))
            {
                hintTxt.y = 195;
                hintTxt.visible = true;
                hintTxt.text = Language.EQUIPTFUNCPANEL_U[240];
                return;
            };
            if (ToolKit.isSmallThan(_local_3.upgradeNum, GamePredef.STAGE_EIGHT_LEVEL))
            {
                hintTxt.y = 195;
                hintTxt.visible = true;
                hintTxt.text = Language.EQUIPTFUNCPANEL_U[240];
                return;
            };
            var _local_4:Object = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_3.tid];
            var _local_5:int = Math.floor((Number(_local_4.mainPropNum1) * GamePredef.STAGE_EIGHT_MIN));
            var _local_6:int = Math.floor((Number(_local_4.mainPropNum2) * GamePredef.STAGE_EIGHT_MIN));
            if (((Number(_local_3.mainPropNum1) < _local_5) || (Number(_local_3.mainPropNum2) < _local_6)))
            {
                hintTxt.y = 195;
                hintTxt.visible = true;
                hintTxt.text = Language.EQUIPTFUNCPANEL_U[240];
                return;
            };
            var _local_7:int = (Number(_local_4.mainPropNum1) * GamePredef.STAGE_EIGHT_MAX);
            var _local_8:int = (Number(_local_4.mainPropNum2) * GamePredef.STAGE_EIGHT_MAX);
            if (((Number(_local_3.mainPropNum1) >= _local_7) || (Number(_local_3.mainPropNum2) >= _local_8)))
            {
                hintTxt.y = 225;
                hintTxt.visible = true;
                hintTxt.text = Language.EQUIPTFUNCPANEL_U[241];
                return;
            };
            var _local_9:int = 1;
            hintTxt.visible = false;
            var _local_11:Object = DataManager.getInstance().gameDataIndex;
            var _local_12:Object = _local_11[GamePredef.TBL_ARTIFACT][_local_3.tid];
            if (((!(Number(_local_3.mainPropNum1) == _local_5)) || (!(Number(_local_3.mainPropNum2) == _local_6))))
            {
                for each (_local_13 in _local_12)
                {
                    if (((_local_3.mainPropNum1 == _local_13.propNum1) && (_local_3.mainPropNum2 == _local_13.propNum2)))
                    {
                        _local_23 = _local_13.level;
                        _local_9 = (_local_23 + 1);
                        break;
                    };
                };
            };
            for each (_local_13 in _local_12)
            {
                if (_local_13.level == _local_9)
                {
                    _local_10 = _local_13;
                    break;
                };
            };
            if (!_local_10)
            {
                magicWeaponStageViewClear();
                return;
            };
            var _local_14:* = (String(_local_10.rate) + "%");
            if (_core.MC_BIRTH_FLAG[18])
            {
                _local_14 = (String(GamePredef.MC_BIRTH_CONFIG[18][_local_10.level]) + "%");
            };
            var _local_15:int = Number(_local_10.itemNum);
            var _local_16:int = Number(_local_10.spiritNum);
            if (_local_3.flag)
            {
                _local_24 = _local_3.flag;
                if (_local_24.indexOf("stageAdd") != -1)
                {
                    _local_24 = JSONUtil.JSONfy(_local_24);
                    _local_25 = com.adobe.serialization.json.JSON.decode(_local_24);
                    if (Number(_local_25.stageAdd) > 0)
                    {
                        _local_14 = (_local_14 + ((" <font color='#00FF00'>+" + _local_25.stageAdd) + "%</font>"));
                    };
                };
            };
            var _local_17:Number = GamePredef.MW_HP_GROW_MAP[_local_3.upgradeNum];
            var _local_18:Number = GamePredef.MW_SPEED_GROW_MAP[_local_3.upgradeNum];
            var _local_19:Number = int((Number(_local_10.propNum1) * _local_17));
            var _local_20:Number = int((Number(_local_10.propNum2) * _local_18));
            var _local_21:Number = int((_local_17 * Number(_local_3.mainPropNum1)));
            var _local_22:Number = int((_local_18 * Number(_local_3.mainPropNum2)));
            stagePropLeft.htmlText = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[149], {
                "hp":_local_21,
                "sp":_local_22
            });
            stagePropRight.htmlText = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[150], {
                "hp":_local_19,
                "sp":_local_20
            });
            consumeTxt.htmlText = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[151], {
                "itemNum":_local_15,
                "spiritNum":_local_16,
                "rate":_local_14
            });
        }

        [Bindable(event="propertyChange")]
        public function get makeInputItem1():ItemSlotMaterial
        {
            return (this._1221705314makeInputItem1);
        }

        [Bindable(event="propertyChange")]
        public function get makeInputItem3():ItemSlotMaterial
        {
            return (this._1221705316makeInputItem3);
        }

        public function cleanSuccData():void
        {
            var _local_1:int;
            if (!this.MwSuccinct)
            {
                return;
            };
            _local_1 = 0;
            while (_local_1 < 3)
            {
                this[("newPro" + _local_1)].htmlText = "";
                _local_1++;
            };
        }

        public function updateItemNum():void
        {
            var _local_1:int;
            if (!itemInfo)
            {
                return;
            };
            _local_1 = _core.getItemNum(29, GamePredef.MW_SUCC_ITEM).num;
            itemInfo.text = (Language.EQUIPTFUNCPANEL_U[208] + _local_1);
        }

        public function set stageItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1836581681stageItem;
            if (_local_2 !== _arg_1)
            {
                this._1836581681stageItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stageItem", _local_2, _arg_1));
            };
        }

        private function tabBtnCUpdate():void
        {
            var _local_1:int = ((tabC) ? tabC.selectedIndex : 0);
            resetItemList();
            switch (_local_1)
            {
                case 0:
                    _itemList.type = 1;
                    _itemList.idList = [5];
                    break;
                case 1:
                    _itemList.type = 1;
                    _itemList.idList = [2333];
                    break;
                case 2:
                    _itemList.type = 1;
                    _itemList.idList = [2334, 2335];
                    break;
                case 3:
                    _itemList.type = 1;
                    _itemList.idList = [2809];
                    break;
                case 4:
                    clearPetEquiptPrePanel();
                    _itemList.type = 1;
                    _itemList.idList = [3491];
                    break;
                case 5:
                    _itemList.type = 1;
                    _itemList.idList = [GamePredef.SUBLIME_ITEMID];
                    break;
                case 6:
                    _itemList.type = 1;
                    _itemList.idList = [GamePredef.RESTRAIN_ITEMID];
                    break;
            };
            equipBag.showItem(5, _itemList);
        }

        public function set petEquModBindSucc(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2008127689petEquModBindSucc;
            if (_local_2 !== _arg_1)
            {
                this._2008127689petEquModBindSucc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModBindSucc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get creEquFuncList():List
        {
            return (this._1482580427creEquFuncList);
        }

        public function set petEquModBindNeedItem(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._228267838petEquModBindNeedItem;
            if (_local_2 !== _arg_1)
            {
                this._228267838petEquModBindNeedItem = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModBindNeedItem", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get MWSkills():ComboBox
        {
            return (this._860877172MWSkills);
        }

        [Bindable(event="propertyChange")]
        public function get makeInputItem2():ItemSlotMaterial
        {
            return (this._1221705315makeInputItem2);
        }

        private function MWRepairViewClear():void
        {
            ((MWRepair) && (MWRepair.clean()));
            ((blueStoneNeed) && (blueStoneNeed.clean()));
        }

        public function set restrainBox(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._1784770749restrainBox;
            if (_local_2 !== _arg_1)
            {
                this._1784770749restrainBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restrainBox", _local_2, _arg_1));
            };
        }

        private function onPetEquLevelUp(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:ISlot;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.flag)
            {
                petEquLevelupInfo.htmlText = Language.EQUIPTFUNCPANEL_S[33];
                if (ToolKit.isBigThan(_arg_1.num, 0))
                {
                    petEquLevelupItem.stackNum = _arg_1.num;
                    if (petEquLevelupItem.stackNum < petEquLevelupBasic.value)
                    {
                        petEquLevelupBasic.value = petEquLevelupItem.stackNum;
                        petEquLevelupRate.label = ((petEquLevelupBasic.value * 20) + "%");
                    };
                }
                else
                {
                    petEquLevelupItem.clean();
                };
                _local_2 = _core.data.gameData[GamePredef.TBL_EQUIPT_INSTANCE][_arg_1.i];
                _local_2.tid = _arg_1.tid;
                petEquReadyLevelup.giid = _arg_1.i;
                _local_3 = _core.view.getSlot(_arg_1.sid);
                if (_local_3)
                {
                    _local_3.giid = _arg_1.i;
                };
                petEquLevelupReqNum.text = "";
                nextPetEqu.giid = ((_arg_1.next > 0) ? _arg_1.next : -1);
                equipBag.refreshSlots({
                    "sid":_arg_1.sid,
                    "giid":_arg_1.i
                });
            }
            else
            {
                petEquLevelupInfo.htmlText = ((_arg_1.msg) ? _arg_1.msg : Language.EQUIPTFUNCPANEL_S[83]);
                if (_arg_1.num)
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        petEquLevelupItem.stackNum = _arg_1.num;
                        if (petEquLevelupItem.stackNum < petEquLevelupBasic.value)
                        {
                            petEquLevelupBasic.value = petEquLevelupItem.stackNum;
                            petEquLevelupRate.label = ((petEquLevelupBasic.value * 20) + "%");
                        };
                    }
                    else
                    {
                        petEquLevelupItem.clean();
                    };
                };
            };
            petEquReadyLevelup.clean();
        }

        [Bindable(event="propertyChange")]
        public function get petEquModColorInfo():Label
        {
            return (this._799266457petEquModColorInfo);
        }

        public function set tabA(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._3552076tabA;
            if (_local_2 !== _arg_1)
            {
                this._3552076tabA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabA", _local_2, _arg_1));
            };
        }

        private function materialMixNumChange():void
        {
            var _local_1:Array;
            var _local_2:Object;
            var _local_3:*;
            var _local_4:Number;
            var _local_5:Number;
            materialMixPer.label = ((materialMixNum.value * materialMixBasicRate).toString() + "%");
            if ((((_core.player.pmLevel) && (Number(_core.player.pmLevel) > 0)) && (Number(materialMixBasicRate) == 6)))
            {
                _local_1 = GameData.d[GamePredef.TBL_PM_RIGHT];
                _local_2 = null;
                for (_local_3 in _local_1)
                {
                    if (((_local_1[_local_3]) && (Number(_local_1[_local_3].id) == 8)))
                    {
                        _local_2 = _local_1[_local_3];
                        break;
                    };
                };
                if (((_local_2) && (_local_2[("value" + _core.player.pmLevel)])))
                {
                    _local_4 = (materialMixNum.value * materialMixBasicRate);
                    _local_5 = (_local_4 + Number(_local_2[("value" + _core.player.pmLevel)]));
                    materialMixPer.label = (_local_5.toString() + "%");
                };
            };
            materialMixNumCheck();
        }

        public function set tabC(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._3552078tabC;
            if (_local_2 !== _arg_1)
            {
                this._3552078tabC = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabC", _local_2, _arg_1));
            };
        }

        public function set tabD(_arg_1:ViewStack):void
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
        public function get progressBar():ProgressBarCanvas
        {
            return (this._1131509414progressBar);
        }

        [Bindable(event="propertyChange")]
        public function get makeTree():Tree
        {
            return (this._40519340makeTree);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModPreNeedItem():ItemSlot
        {
            return (this._1343807092petEquModPreNeedItem);
        }

        public function set transRequireLabel(_arg_1:DescriptionLabel):void
        {
            var _local_2:Object;
            _local_2 = this._442224809transRequireLabel;
            if (_local_2 !== _arg_1)
            {
                this._442224809transRequireLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "transRequireLabel", _local_2, _arg_1));
            };
        }

        private function starOne():void
        {
            var equIns:Object;
            var starIns:Object;
            var func:Function;
            var e:CloseEvent;
            if ((((tabA.selectedIndex == 5) && (petEquStarItem.slotData)) && (petEquStarJewel.slotData)))
            {
                equIns = _core.data.gameData[petEquStarItem.slotData.type][petEquStarItem.slotData.itemId];
                starIns = _core.data.gameData[petEquStarJewel.slotData.type][petEquStarJewel.slotData.itemId];
                if (((equIns) && (starIns)))
                {
                    func = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            _core.remote.call("starOne", new Responder(onStar), petEquStarBasic.value, petEquStarItem.slotData.id, petEquStarJewel.slotData.id);
                            petEquStarOneBtn.enabled = false;
                            petEquStarAllBtn.enabled = false;
                        };
                    };
                    if (((ToolKit.isEqual(equIns.binded, 0)) && (ToolKit.isEqual(starIns.binded, 1))))
                    {
                        Alert.show(Language.EQUIPTFUNCPANEL_S[102], "", (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        e = new CloseEvent("");
                        e.detail = Alert.YES;
                        (func(e));
                    };
                };
            };
        }

        public function __jewelUpdateNum_change(_arg_1:NumericStepperEvent):void
        {
            jewelUpdateNumChange();
        }

        [Bindable(event="propertyChange")]
        public function get makeButton():BasicGlowButton
        {
            return (this._227709248makeButton);
        }

        public function set blueStoneNeed(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._804327583blueStoneNeed;
            if (_local_2 !== _arg_1)
            {
                this._804327583blueStoneNeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "blueStoneNeed", _local_2, _arg_1));
            };
        }

        public function completeMake():void
        {
            makeCanvas.enabled = true;
        }

        [Bindable(event="propertyChange")]
        public function get mwResetProp():ItemSlotEquFunc
        {
            return (this._476789048mwResetProp);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModColorRate():BasicTxtButton
        {
            return (this._799522507petEquModColorRate);
        }

        [Bindable(event="propertyChange")]
        public function get petEquReadyLevelup():ItemSlotEquFunc
        {
            return (this._643565254petEquReadyLevelup);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModBindBtn():BasicDelayButton
        {
            return (this._341889337petEquModBindBtn);
        }

        public function ___EquiptFuncPanel_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            autoInputMake();
        }

        private function petEquModColorChange(_arg_1:Event):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            if (petEquReadyModColor.slotData)
            {
                _local_2 = _core.data.getData(petEquReadyModColor.slotData.type, petEquReadyModColor.slotData.itemId);
                _local_3 = _core.getTemplateData(petEquReadyModColor.slotData.type, petEquReadyModColor.slotData.itemId, false);
                if ((((_local_3) && (isPetEqu(_local_3))) && (_local_2.color <= 3)))
                {
                    petEquModColorNeedItem.type = GamePredef.TBL_ITEM_TEMPLATE;
                    _local_4 = -1;
                    modColorReqId = GamePredef.MODCOLOR_REQ_NUM[_local_2.color].id;
                    modColorReqNum = GamePredef.MODCOLOR_REQ_NUM[_local_2.color].req;
                    _local_4 = GamePredef.MODCOLOR_REQ_NUM[_local_2.color].rate;
                    if (_core.MC_BIRTH_FLAG[9])
                    {
                        _local_4 = GamePredef.MC_BIRTH_CONFIG[9][_local_2.color];
                    };
                    if (isSpecPetEqu(_local_3))
                    {
                        if (((StringUtil.beginsWith(_local_3.reqClassId.toString(), "|")) && (StringUtil.endsWith(_local_3.reqClassId.toString(), "|"))))
                        {
                            modColorReqNum = (modColorReqNum * 4);
                        }
                        else
                        {
                            modColorReqNum = (modColorReqNum * 2);
                        };
                    };
                    petEquModColorRate.label = (_local_4 + "%");
                    petEquModColorNeedItem.giid = modColorReqId;
                    if (((petEquModColorItem.slotData) && (!(petEquModColorItem.slotData.tid == petEquModColorNeedItem.giid))))
                    {
                        petEquModColorItem.clean();
                    };
                    if (((ToolKit.isEqual(modColorReqId, -1)) && (ToolKit.isEqual(modColorReqNum, -1))))
                    {
                        petEquModReqNum.text = Language.EQUIPTFUNCPANEL_U[85];
                        petEquModColorMoney.text = "";
                    }
                    else
                    {
                        petEquModReqNum.htmlText = Language.EQUIPTFUNCPANEL_U[84].replace("{num}", modColorReqNum);
                        petEquModColorMoney.text = ((_local_3.reqLevel * _local_3.reqLevel) * GamePredef.MONEY_EQUFUNC_MAKE).toString();
                    };
                }
                else
                {
                    petEquModColorBtn.enabled = false;
                    petEquReadyModColor.slotData = null;
                    petEquReadyModColor.clean();
                };
            };
        }

        public function onGetStarNum(_arg_1:int):void
        {
            starNum = _arg_1;
            setStarInfo();
        }

        public function set curPropTA(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._303751312curPropTA;
            if (_local_2 !== _arg_1)
            {
                this._303751312curPropTA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curPropTA", _local_2, _arg_1));
            };
        }

        public function ___EquiptFuncPanel_Canvas14_creationComplete(_arg_1:FlexEvent):void
        {
            initMWPStage();
        }

        public function encodePropInfo(_arg_1:Object, _arg_2:Boolean=false):String
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            _local_3 = GamePredef.ACTIVATE_MW_PRO[_arg_1["propType"]];
            _local_5 = 0;
            while (_local_5 < 4)
            {
                if (Number(_arg_1["propVal"]) <= _local_3[("top" + _local_5)])
                {
                    _local_4 = _local_5;
                    break;
                };
                _local_5++;
            };
            _local_6 = ((((((("<font color='" + GamePredef.MW_PRO_COLOR[_local_4]) + "'>") + GamePredef.EQUIPT_PROP_NAME[_arg_1["propType"]]) + " +") + _arg_1["propVal"]) + ((_local_4 == 3) ? Language.EQUIPTFUNCPANEL_U[223] : "")) + "</font>");
            if (_arg_2)
            {
                _local_6 = (_local_6 + (((("<font color='#ffffff'>(" + _local_3.valMin) + "-") + _local_3.valMax) + ")</font>"));
            };
            return (_local_6);
        }

        private function doBuyStar(_arg_1:Boolean):void
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:NumPanel;
            if (_arg_1)
            {
                _local_2 = _core.view.getUI(ViewManager.PANEL_BAG);
                if (((_local_2) && (_local_2.goldSelected)))
                {
                    _local_2.goldLockFlag = false;
                };
                shopData = new Object();
                _local_3 = 0;
                while (_local_3 <= GameData.d[GamePredef.TBL_SHOP_SLOT].length)
                {
                    if (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_3])
                    {
                        if (((GameData.d[GamePredef.TBL_SHOP_SLOT][_local_3].type == 29) && (GameData.d[GamePredef.TBL_SHOP_SLOT][_local_3].itemId == 5)))
                        {
                            shopData = GameData.d[GamePredef.TBL_SHOP_SLOT][_local_3];
                            shopData.type = 29;
                        };
                    };
                    _local_3++;
                };
                _local_4 = NumPanel(_core.view.getUI(ViewManager.PANEL_NUM));
                _local_4.numSelected(shopData, buySelected);
            };
        }

        public function _succinct():void
        {
            var _local_1:Boolean;
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            _local_1 = false;
            _local_2 = new Array();
            _local_3 = 0;
            _local_4 = 0;
            while (_local_4 < 3)
            {
                if (((!(this[("lock" + _local_4)].visible)) || ((this[("lock" + _local_4)].visible) && (this[("lock" + _local_4)].selected))))
                {
                    _local_2[_local_4] = true;
                }
                else
                {
                    _local_2[_local_4] = false;
                    _local_1 = true;
                };
                if (this[("lock" + _local_4)].visible)
                {
                    _local_3++;
                };
                if (this[("lock" + _local_4)].selected)
                {
                    _local_3++;
                };
                _local_4++;
            };
            if (!_local_1)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[215], "", Alert.YES, null, null);
                return;
            };
            _local_5 = _core.getItemNum(29, GamePredef.MW_SUCC_ITEM).num;
            if (((_local_5 < _local_3) && (!(this.autoBuy.selected))))
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[227], "", Alert.YES, null, null);
                itemInfo.text = (Language.EQUIPTFUNCPANEL_U[208] + _local_5);
                return;
            };
            _core.remote.nc.call("succinctMW", new Responder(onSuccinctMW), MwSuccinct.giid, _local_2, autoBuy.selected);
            succinctBtn.enabled = false;
        }

        public function set makeRequire1(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._929613690makeRequire1;
            if (_local_2 !== _arg_1)
            {
                this._929613690makeRequire1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeRequire1", _local_2, _arg_1));
            };
        }

        public function set petEquLevelupItemNeed(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._638827390petEquLevelupItemNeed;
            if (_local_2 !== _arg_1)
            {
                this._638827390petEquLevelupItemNeed = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupItemNeed", _local_2, _arg_1));
            };
        }

        public function set makeRequire2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._929613691makeRequire2;
            if (_local_2 !== _arg_1)
            {
                this._929613691makeRequire2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeRequire2", _local_2, _arg_1));
            };
        }

        public function set jewelUpdateButtonAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._1991722883jewelUpdateButtonAll;
            if (_local_2 !== _arg_1)
            {
                this._1991722883jewelUpdateButtonAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdateButtonAll", _local_2, _arg_1));
            };
        }

        public function set makeRequire3(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._929613692makeRequire3;
            if (_local_2 !== _arg_1)
            {
                this._929613692makeRequire3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeRequire3", _local_2, _arg_1));
            };
        }

        private function tabBtnAClick(_arg_1:int):void
        {
            var _local_2:int = ((tabA) ? tabA.selectedIndex : 0);
            if (_local_2 == _arg_1)
            {
                return;
            };
            this[("tabBtnA" + _local_2)].selected = false;
            deactivatePanel(_local_2);
            tabA.selectedIndex = _arg_1;
            this[("tabBtnA" + _arg_1)].selected = true;
            activatePanel(_arg_1);
            tabBtnAUpdate();
        }

        public function set MWResetSkill(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._60813428MWResetSkill;
            if (_local_2 !== _arg_1)
            {
                this._60813428MWResetSkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWResetSkill", _local_2, _arg_1));
            };
        }

        private function sublimePetChange(_arg_1:Event=null):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:String;
            var _local_13:String;
            var _local_14:String;
            var _local_15:int;
            var _local_16:Object;
            var _local_17:String;
            var _local_18:String;
            var _local_19:String;
            var _local_20:Object;
            var _local_21:int;
            var _local_22:int;
            var _local_23:int;
            var _local_24:String;
            var _local_25:String;
            var _local_26:String;
            var _local_27:Object;
            var _local_28:Object;
            var _local_29:String;
            var _local_30:String;
            var _local_31:Object;
            var _local_32:int;
            var _local_33:int;
            var _local_34:Number;
            var _local_35:int;
            var _local_36:int;
            var _local_37:Number;
            var _local_38:int;
            if (((!(sublimeEquip)) || (!(sublimeEquip.slotData))))
            {
                this.sublimePetClear();
                return;
            };
            _local_2 = sublimeEquip.slotData;
            _local_3 = _core.data.getGameData(_local_2.type, _local_2.itemId);
            if (((!(_local_3)) || (!(ToolKit.isEqual(_local_3.binded, 1)))))
            {
                sublimeInitHint();
                return;
            };
            _local_4 = GameData.d[GamePredef.TBL_EQUIPT_TEMPLATE][_local_3.tid];
            if (((!(_local_3.hasOwnProperty("color"))) || (Number(_local_3.color) < 3)))
            {
                sublimeInitHint();
                return;
            };
            _local_5 = 0;
            _local_6 = 0;
            _local_7 = 0;
            if (_local_3.hasOwnProperty("flag"))
            {
                _local_26 = JSONUtil.JSONfy(_local_3.flag);
                _local_27 = ((_local_26) ? com.adobe.serialization.json.JSON.decode(_local_26) : null);
                if (_local_27)
                {
                    _local_5 = ((_local_27.sublimeId) ? int(_local_27.sublimeId) : 0);
                    _local_6 = ((_local_27.sublimeAdd) ? int(_local_27.sublimeAdd) : 0);
                    _local_7 = ((_local_27.sublimeElement) ? int(_local_27.sublimeElement) : 0);
                };
            };
            if (_local_5 >= GamePredef.SUBLIME_MAX)
            {
                if (hintTxt)
                {
                    hintTxt.htmlText = Language.EQUIPTFUNCPANEL_U[250];
                    hintTxt.visible = true;
                };
                sublimeEquip.clean();
                ((sublimeItem) && (sublimeItem.clean()));
                return;
            };
            if (sublimeHint)
            {
                sublimeHint.visible = false;
            };
            _local_8 = _local_4.position;
            _local_9 = GamePredef.EQUIP_FUNCTYPE[_local_8];
            _local_10 = ((_local_9 == GamePredef.EQUIP_TYPE_ATTACK) ? 1 : 3);
            _local_11 = ((_local_9 == GamePredef.EQUIP_TYPE_ATTACK) ? 254 : 0xFF);
            _local_12 = Language.EQUIPTFUNCPANEL_U[_local_11];
            _local_13 = Language.EQUIPTFUNCPANEL_U[0x0100];
            if (_local_7 > 0)
            {
                _local_13 = GamePredef.ELEMENT_NAME[_local_7];
                _local_13 = (((("<font color='" + GamePredef.ELEMENT_COLOR[_local_7]) + "'>") + _local_13) + "</font>");
            };
            _local_14 = "";
            if (_local_5 <= 0)
            {
                _local_14 = Language.EQUIPTFUNCPANEL_U[253];
            }
            else
            {
                _local_28 = GameData.d[GamePredef.TBL_SUBLIMATION_PET][_local_5];
                if (!_local_28)
                {
                    return;
                };
                _local_29 = (Number(_local_28.elementNum) * 100).toFixed(2);
                _local_30 = LanguageUtil.replace(_local_12, {
                    "element":_local_13,
                    "num":_local_29
                });
                _local_14 = Language.EQUIPTFUNCPANEL_U[251];
                _local_31 = {
                    "propName0":"",
                    "propNum0":0,
                    "propName1":"",
                    "propNum1":0,
                    "element":_local_30
                };
                _local_32 = _local_10;
                while (_local_32 < (_local_10 + 2))
                {
                    _local_33 = _local_28[("prop" + _local_32)];
                    _local_34 = _local_28[("propNum" + _local_32)];
                    _local_35 = (_local_32 - _local_10);
                    _local_31[("propName" + _local_35)] = GamePredef.EQUIPT_PROP_NAME[_local_33];
                    _local_31[("propNum" + _local_35)] = _local_34;
                    _local_32++;
                };
                _local_14 = LanguageUtil.replace(_local_14, _local_31);
            };
            if (sublimeLeft)
            {
                sublimeLeft.htmlText = _local_14;
            };
            _local_15 = (_local_5 + 1);
            _local_16 = GameData.d[GamePredef.TBL_SUBLIMATION_PET][_local_15];
            if (!_local_16)
            {
                return;
            };
            _local_17 = (Number(_local_16.elementNum) * 100).toFixed(2);
            _local_18 = LanguageUtil.replace(_local_12, {
                "element":_local_13,
                "num":_local_17
            });
            _local_19 = Language.EQUIPTFUNCPANEL_U[252];
            _local_20 = {
                "propName0":"",
                "propNum0":0,
                "propName1":"",
                "propNum1":0,
                "element":_local_18
            };
            _local_21 = _local_10;
            while (_local_21 < (_local_10 + 2))
            {
                _local_36 = _local_16[("prop" + _local_21)];
                _local_37 = _local_16[("propNum" + _local_21)];
                _local_38 = (_local_21 - _local_10);
                _local_20[("propName" + _local_38)] = GamePredef.EQUIPT_PROP_NAME[_local_36];
                _local_20[("propNum" + _local_38)] = _local_37;
                _local_21++;
            };
            _local_19 = LanguageUtil.replace(_local_19, _local_20);
            if (sublimeRight)
            {
                sublimeRight.htmlText = _local_19;
            };
            _local_22 = ((_local_9 == GamePredef.EQUIP_TYPE_ATTACK) ? 1 : 2);
            _local_23 = _local_16[("itemNum" + _local_22)];
            _local_24 = (String(_local_16["rate"]) + "%");
            if (_core.MC_BIRTH_FLAG[17])
            {
                _local_24 = (String(GamePredef.MC_BIRTH_CONFIG[17][_local_16["id"]]) + "%");
            };
            if ((_local_6 > 0))
            {
                _local_24 = (_local_24 + ((" <font color='#00FF00'>+" + _local_6) + "%</font>"));
            };
            _local_25 = Language.EQUIPTFUNCPANEL_U[247];
            _local_25 = LanguageUtil.replace(_local_25, {
                "num":_local_23,
                "rate":_local_24
            });
            if (sublimeConsume)
            {
                sublimeConsume.htmlText = _local_25;
            };
        }

        public function set MWResolve2(_arg_1:ItemSlot):void
        {
            var _local_2:Object;
            _local_2 = this._858071152MWResolve2;
            if (_local_2 !== _arg_1)
            {
                this._858071152MWResolve2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWResolve2", _local_2, _arg_1));
            };
        }

        private function _EquiptFuncPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory;
            _local_1 = new ClassFactory();
            _local_1.generator = HtmlComboItemRenderer;
            return (_local_1);
        }

        public function set materialMixNum(_arg_1:NumericStepper):void
        {
            var _local_2:Object;
            _local_2 = this._1788135535materialMixNum;
            if (_local_2 !== _arg_1)
            {
                this._1788135535materialMixNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialMixNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get petEquModReqNum():Label
        {
            return (this._803512544petEquModReqNum);
        }

        public function set maxPropTA(_arg_1:TextArea):void
        {
            var _local_2:Object;
            _local_2 = this._664840300maxPropTA;
            if (_local_2 !== _arg_1)
            {
                this._664840300maxPropTA = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxPropTA", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get stagePropLeft():AutoTextArea
        {
            return (this._1658087640stagePropLeft);
        }

        private function initMWPBuild():void
        {
            (((tabD) && (tabD.selectedIndex == 3)) && (MwSuccinct.addEventListener(GameEvent.SLOT_GIID_CHANGE, magicWeaponSuccinict)));
        }

        [Bindable(event="propertyChange")]
        public function get stagePropRight():AutoTextArea
        {
            return (this._144551707stagePropRight);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModBindNeedItem():ItemSlot
        {
            return (this._228267838petEquModBindNeedItem);
        }

        public function buySelected(_arg_1:int):void
        {
            _core.remote.buySystemItemClient(shopData.id, _arg_1);
        }

        public function ___EquiptFuncPanel_BasicGlowButton10_click(_arg_1:MouseEvent):void
        {
            magicWeaponRepair();
        }

        [Bindable(event="propertyChange")]
        public function get restrainBox():ComboBox
        {
            return (this._1784770749restrainBox);
        }

        [Bindable(event="propertyChange")]
        public function get petEquModBindSucc():Label
        {
            return (this._2008127689petEquModBindSucc);
        }

        public function __petEquLevelupBtn_click(_arg_1:MouseEvent):void
        {
            petEquLevelUp();
        }

        public function set isFirst(_arg_1:String):void
        {
            var _local_2:Object;
            _local_2 = this._2058846118isFirst;
            if (_local_2 !== _arg_1)
            {
                this._2058846118isFirst = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isFirst", _local_2, _arg_1));
            };
        }

        public function __succinctBtn_click(_arg_1:MouseEvent):void
        {
            succinct();
        }

        public function __tabBtnA2_click(_arg_1:MouseEvent):void
        {
            tabBtnAClick(2);
        }

        [Bindable(event="propertyChange")]
        public function get sublimeEquip():ItemSlotEquFunc
        {
            return (this._1678552859sublimeEquip);
        }

        public function set petEquLevelupMoney(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._646631509petEquLevelupMoney;
            if (_local_2 !== _arg_1)
            {
                this._646631509petEquLevelupMoney = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquLevelupMoney", _local_2, _arg_1));
            };
        }

        public function set materialButtonAll(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._192885848materialButtonAll;
            if (_local_2 !== _arg_1)
            {
                this._192885848materialButtonAll = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "materialButtonAll", _local_2, _arg_1));
            };
        }

        public function set makeList(_arg_1:List):void
        {
            var _local_2:Object;
            _local_2 = this._40272812makeList;
            if (_local_2 !== _arg_1)
            {
                this._40272812makeList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get blueStoneNeed():ItemSlot
        {
            return (this._804327583blueStoneNeed);
        }

        [Bindable(event="propertyChange")]
        public function get transRequireLabel():DescriptionLabel
        {
            return (this._442224809transRequireLabel);
        }

        public function set restrainEquip(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._1469908056restrainEquip;
            if (_local_2 !== _arg_1)
            {
                this._1469908056restrainEquip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "restrainEquip", _local_2, _arg_1));
            };
        }

        public function __equipChange_creationComplete(_arg_1:FlexEvent):void
        {
            initTab(1);
        }

        public function set sublimeLeft(_arg_1:AutoTextArea):void
        {
            var _local_2:Object;
            _local_2 = this._1885319236sublimeLeft;
            if (_local_2 !== _arg_1)
            {
                this._1885319236sublimeLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sublimeLeft", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get makeRequire2():ItemSlot
        {
            return (this._929613691makeRequire2);
        }

        [Bindable(event="propertyChange")]
        public function get makeRequire3():ItemSlot
        {
            return (this._929613692makeRequire3);
        }

        [Bindable(event="propertyChange")]
        public function get curPropTA():TextArea
        {
            return (this._303751312curPropTA);
        }

        private function setAutoMatchSlots():void
        {
            var _local_1:int;
            var _local_2:Array;
            var _local_3:Array;
            var _local_4:int;
            var _local_5:ItemSlot;
            _local_1 = tabA.selectedIndex;
            autoMatchSlots = {};
            _local_2 = [];
            switch (_local_1)
            {
                case 0:
                    _local_3 = [];
                    autoMatchSlots.hasReq = true;
                    _local_4 = 1;
                    while (_local_4 <= 3)
                    {
                        _local_5 = this[("makeRequire" + _local_4)];
                        if (_local_5.giid > 0)
                        {
                            _local_3.push({
                                "id":_local_5.giid,
                                "type":(_local_5.type - 1),
                                "kind":_local_5.kind
                            });
                        };
                        _local_2.push(this[("makeInputItem" + _local_4)]);
                        _local_4++;
                    };
                    break;
                case 1:
                    if (equipChange.visible)
                    {
                        autoMatchSlots = equipChange.autoMatchSlots;
                    };
                    return;
                case 2:
                    autoMatchSlots.hasReq = false;
                    _local_2.push(materialMixItem);
                    break;
                case 3:
                    autoMatchSlots.hasReq = false;
                    _local_2.push(jewelUpdateItem1);
                    break;
                case 4:
                    _local_3 = [];
                    switch (tabD.selectedIndex)
                    {
                        case 0:
                            _local_2.push(MWChangeLevel);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON,
                                "position":15
                            });
                            break;
                        case 1:
                            _local_2.push(MWResolve);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON
                            });
                            break;
                        case 2:
                            _local_2.push(MWRepair);
                            _local_2.push(blueStoneNeed);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON
                            });
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_MW_REPAIR
                            });
                            break;
                        case 4:
                            _local_2.push(MWResetSkill);
                            _local_2.push(redStoneNeed);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON,
                                "position":15
                            });
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_MW_SKILL_RESET
                            });
                            break;
                        case 5:
                            autoMatchSlots.orderPut = true;
                            autoMatchSlots.orderType = GamePredef.TBL_EQUIPT_INSTANCE;
                            autoMatchSlots.menuArr = [{
                                "label":Language.EQUIPTFUNCPANEL_U[177],
                                "data":{"slot":MWTransTo}
                            }, {
                                "label":Language.EQUIPTFUNCPANEL_U[178],
                                "data":{"slot":MWTransFrom}
                            }];
                            _local_2.push(transItemNeed);
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_MW_TRANS
                            });
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON,
                                "position":15
                            });
                            break;
                        case 6:
                            _local_2.push(mwResetProp);
                            _local_2.push(resetStoneNeed);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON
                            });
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_MW_PROP_RESET
                            });
                            break;
                        case 7:
                            _local_2.push(stageEqu);
                            _local_2.push(stageItem);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_MAGICWEAPON
                            });
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_MW_STAGE_EIGHT
                            });
                            break;
                    };
                    break;
                case 5:
                    _local_3 = [];
                    switch (tabC.selectedIndex)
                    {
                        case 0:
                            _local_2.push(petEquStarItem);
                            _local_2.push(petEquStarJewel);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_PETEQU
                            });
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_STAR
                            });
                            break;
                        case 1:
                            _local_2.push(petEquReadyLevelup);
                            _local_2.push(petEquLevelupItem);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_PETEQU
                            });
                            _local_3.push({"itemType":GamePredef.TBL_ITEM_INSTANCE});
                            break;
                        case 2:
                            _local_2.push(petEquReadyModColor);
                            _local_2.push(petEquModColorItem);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_PETEQU
                            });
                            _local_3.push({"itemType":GamePredef.TBL_ITEM_INSTANCE});
                            break;
                        case 3:
                            _local_2.push(petEquReadyModBind);
                            _local_2.push(petEquModBindItem);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_PETEQU
                            });
                            _local_3.push({"itemType":GamePredef.TBL_ITEM_INSTANCE});
                            break;
                        case 4:
                            _local_2.push(petEquReadyPre);
                            _local_2.push(petEquModPreItem);
                            _local_3.push({
                                "itemType":GamePredef.TBL_EQUIPT_INSTANCE,
                                "kind":GamePredef.ITEM_KIND_PETEQU
                            });
                            _local_3.push({"itemType":GamePredef.TBL_ITEM_INSTANCE});
                            break;
                        case 5:
                            _local_2.push(sublimeEquip);
                            _local_2.push(sublimeItem);
                            _local_3.push({"itemType":GamePredef.TBL_EQUIPT_INSTANCE});
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_SUBLIME
                            });
                            break;
                        case 6:
                            _local_2.push(restrainEquip);
                            _local_2.push(restrainItem);
                            _local_3.push({"itemType":GamePredef.TBL_EQUIPT_INSTANCE});
                            _local_3.push({
                                "itemType":GamePredef.TBL_ITEM_INSTANCE,
                                "type":GamePredef.ITEM_TYPE_RESTRAIN
                            });
                            break;
                    };
                    break;
            };
            autoMatchSlots.reqSlots = _local_3;
            autoMatchSlots.inputSlots = _local_2;
        }

        private function magicWeaponResolve(type:int=0):void
        {
            var onMWResolve:Function;
            var onDel:Function;
            var onDel2:Function;
            var func:Function;
            var func2:Function;
            onMWResolve = function (_arg_1:Object):void
            {
                var _local_2:*;
                if (((_arg_1) && (_arg_1.succ)))
                {
                    blueStoneGet.type = _arg_1.type;
                    blueStoneGet.giid = _arg_1.giid;
                    blueStoneGet.stackNum = _arg_1.stackNum;
                    blueStoneGet.temp_quality = _arg_1.temp_quality;
                    MWResolve.clean();
                    MWResolve2.clean();
                    _local_2 = _core.getTemplateData(GamePredef.TBL_ITEM_TEMPLATE, _arg_1.giid);
                    if (_local_2)
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[77].replace("{itemName}", _local_2.name).replace("{itemNum}", _arg_1.stackNum));
                    };
                };
            };
            onDel = function (_arg_1:String):void
            {
                var _local_2:String;
                if (_arg_1)
                {
                    _local_2 = MD5.hash(_arg_1);
                    _core.remote.call("magicWeaponResolve", new Responder(onMWResolve), MWResolve.slotData.id, _local_2, 0);
                };
            };
            onDel2 = function (_arg_1:String):void
            {
                var _local_2:String;
                if (_arg_1)
                {
                    _local_2 = MD5.hash(_arg_1);
                    _core.remote.call("magicWeaponResolve", new Responder(onMWResolve), MWResolve2.slotData.id, _local_2, 1);
                };
            };
            if (((type == 0) && (MWResolve.slotData)))
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        if (_core.delPass)
                        {
                            _core.remote.call("magicWeaponResolve", new Responder(onMWResolve), MWResolve.slotData.id, _core.delPass, 0);
                        }
                        else
                        {
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.EQUIPTFUNCPANEL_U[56], onDel);
                        };
                    };
                };
                Alert.show(Language.EQUIPTFUNCPANEL_S[69], "", 3, this, func);
            }
            else
            {
                if (((type == 1) && (MWResolve2.slotData)))
                {
                    func2 = function (_arg_1:CloseEvent):void
                    {
                        if (_arg_1.detail == Alert.YES)
                        {
                            if (_core.delPass)
                            {
                                _core.remote.call("magicWeaponResolve", new Responder(onMWResolve), MWResolve2.slotData.id, _core.delPass, 1);
                            }
                            else
                            {
                                _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.EQUIPTFUNCPANEL_U[56], onDel2);
                            };
                        };
                    };
                    Alert.show(Language.EQUIPTFUNCPANEL_S[181], "", 3, this, func2);
                }
                else
                {
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[82]);
                };
            };
        }

        private function getThisClassEquiptObject(_arg_1:int):Object
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:ArrayCollection;
            var _local_5:*;
            var _local_6:Boolean;
            var _local_7:Object;
            _local_2 = {};
            _local_3 = {};
            for each (_local_4 in useEquTypeInfo)
            {
                for (_local_5 in _local_4)
                {
                    _local_2 = _core.data.gameDataIndex[GamePredef.TBL_EQUIPT_TEMPLATE][Number(_local_4[_local_5])];
                    _local_6 = false;
                    for each (_local_7 in _local_2)
                    {
                        if ((((((_local_7) && (_local_7.makable)) && (_local_7.reqClass)) && (ToolKit.isEqual(_local_7.makable, 1))) && (_local_7.reqClass.indexOf((("|" + _arg_1) + "|")) >= 0)))
                        {
                            _local_6 = true;
                            _local_3[Number(_local_4[_local_5])] = {};
                            _local_3[Number(_local_4[_local_5])] = Number(_local_4[_local_5]);
                            break;
                        };
                    };
                    if (_local_6) break;
                };
            };
            return (_local_3);
        }

        [Bindable(event="propertyChange")]
        public function get makeRequire1():ItemSlot
        {
            return (this._929613690makeRequire1);
        }

        [Bindable(event="propertyChange")]
        public function get MWResetSkill():ItemSlotEquFunc
        {
            return (this._60813428MWResetSkill);
        }

        public function onJewelUpdate(_arg_1:Object):void
        {
            jewelUpdateButtonAll.enabled = true;
            jewelUpdateButtonOne.enabled = true;
            var _local_2:* = "";
            if (_arg_1)
            {
                if (ToolKit.isEqual(_arg_1.slotId, jewelUpdateItem1.slotData.id))
                {
                    if (ToolKit.isBigThan(_arg_1.num, 0))
                    {
                        jewelUpdateItem1.stackNum = _arg_1.num;
                    }
                    else
                    {
                        jewelUpdateItem1.clean();
                    };
                };
                if (_arg_1.flag)
                {
                    if (_arg_1.finalNum)
                    {
                        _local_2 = Language.EQUIPTFUNCPANEL_S[15];
                        _local_2 = _local_2.replace("{finalNum}", _arg_1.finalNum);
                        _core.sysMidNote(_local_2);
                    }
                    else
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[17]);
                    };
                }
                else
                {
                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[18]);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get MWResolve2():ItemSlot
        {
            return (this._858071152MWResolve2);
        }

        [Bindable(event="propertyChange")]
        public function get materialMixNum():NumericStepper
        {
            return (this._1788135535materialMixNum);
        }

        [Bindable(event="propertyChange")]
        public function get jewelUpdateButtonAll():BasicGlowButton
        {
            return (this._1991722883jewelUpdateButtonAll);
        }

        [Bindable(event="propertyChange")]
        public function get maxPropTA():TextArea
        {
            return (this._664840300maxPropTA);
        }

        public function set petEquReadyPre(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._255603766petEquReadyPre;
            if (_local_2 !== _arg_1)
            {
                this._255603766petEquReadyPre = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquReadyPre", _local_2, _arg_1));
            };
        }

        public function set showBag(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object;
            _local_2 = this._2067262411showBag;
            if (_local_2 !== _arg_1)
            {
                this._2067262411showBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showBag", _local_2, _arg_1));
            };
        }

        public function validateRestrainPet(slotId:Number, element:int):void
        {
            var popStr:String;
            var closeHandler:Function;
            if (_restrainPet)
            {
                PopUpManager.removePopUp(_restrainPet);
                _restrainPet = null;
            };
            popStr = LanguageUtil.replace(Language.EQUIPTFUNCPANEL_S[174], {"money":GamePredef.RESTRAIN_ITEM_PRICE});
            closeHandler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.NO)
                {
                    return;
                };
                _core.remote.call("onValidateRestrainPet", new Responder(onRestrainPetEquip), slotId, element);
            };
            _restrainPet = Alert.show(LanguageUtil.html2PlainText(popStr), "", (Alert.YES | Alert.NO), null, closeHandler);
            _restrainPet.mx_internal::alertForm.mx_internal::textField.htmlText = popStr;
        }

        [Bindable(event="propertyChange")]
        public function get isFirst():String
        {
            return (this._2058846118isFirst);
        }

        public function onSublimePetEquip(_arg_1:Object=null):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (!_arg_1)
            {
                return;
            };
            _local_2 = sublimeEquip.slotData;
            if (((!(_local_2)) || (!(_local_2.itemId == _arg_1.itemId))))
            {
                sublimePetClear();
                return;
            };
            _local_3 = _dm.getGameData(_local_2.type, _local_2.itemId);
            if (_local_3)
            {
                _local_3.flag = _arg_1.flagStr;
                _dm.updateData(_local_2.type, _local_3);
                sublimePetChange();
            };
            ((_arg_1.hasOwnProperty("num")) && (((ToolKit.isBigThan(_arg_1.num, 0)) && (sublimeItem)) ? sublimeItem.stackNum = _arg_1.num : sublimeItem.clean()));
        }

        [Bindable(event="propertyChange")]
        public function get petEquLevelupMoney():Label
        {
            return (this._646631509petEquLevelupMoney);
        }

        public function set petEquModPreInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._553151527petEquModPreInfo;
            if (_local_2 !== _arg_1)
            {
                this._553151527petEquModPreInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petEquModPreInfo", _local_2, _arg_1));
            };
        }

        private function tabBtnBClick(_arg_1:int):void
        {
            introText.htmlText = Language.EQUIPTFUNCPANEL_S[introArr3[_arg_1]];
            equipChange.tabBtnBUpdate();
        }

        [Bindable(event="propertyChange")]
        public function get sublimeLeft():AutoTextArea
        {
            return (this._1885319236sublimeLeft);
        }

        private function onPetEquModBind(obj:Object):void
        {
            var yesAlert:String;
            var noAlert:String;
            var func:Function;
            var title:String;
            var contentMsg:String;
            var suffix1:String;
            var color:String;
            var suffix2:String;
            var color1:String;
            var title1:String;
            var equTmp:Object;
            var msg:String;
            var _alert:Alert;
            var tf:IUITextField;
            if (!obj)
            {
                return;
            };
            if (obj.f)
            {
                if (((!(obj.saveType)) && (ToolKit.isEqual(petEquModBindItem.slotData.id, obj.ii))))
                {
                    if (obj.n < 0)
                    {
                        petEquModBindItem.clean();
                        return;
                    };
                    if (obj.n == 0)
                    {
                        petEquModBindItem.clean();
                    };
                    petEquModBindItem.stackNum = obj.n;
                };
                yesAlert = Alert.yesLabel;
                noAlert = Alert.noLabel;
                func = function (_arg_1:CloseEvent):void
                {
                    Alert.yesLabel = yesAlert;
                    Alert.noLabel = noAlert;
                    if (_arg_1.detail == Alert.YES)
                    {
                        if (obj.saveType)
                        {
                            _core.remote.nc.call("surepetEquModBind", null, 1);
                        }
                        else
                        {
                            _core.remote.nc.call("surepetEquModBind", new Responder(onSurepetEquModBind), 1);
                        };
                    }
                    else
                    {
                        if (obj.saveType)
                        {
                            _core.remote.nc.call("surepetEquModBind", null, -1);
                        }
                        else
                        {
                            _core.remote.nc.call("surepetEquModBind", new Responder(onSurepetEquModBind), -1);
                            petEquModBindSucc.htmlText = "";
                            petEquModBindInfo.htmlText = "";
                        };
                    };
                };
                title = Language.EQUIPTFUNCPANEL_S[135];
                contentMsg = ((("<b>" + Language.EQUIPTFUNCPANEL_S[135]) + "</b>") + "    \n");
                suffix1 = "";
                suffix2 = "";
                if (!obj.saveType)
                {
                    equTmp = _core.getTemplateData(petEquReadyModBind.slotData.type, petEquReadyModBind.slotData.itemId, false);
                }
                else
                {
                    equTmp = new Object();
                    equTmp.mainProp1 = obj.mainProp1;
                    equTmp.mainProp2 = obj.mainProp2;
                };
                if (((Number(obj.b1) < Number(obj.b11)) && (ToolKit.isBigThan(Number(obj.b11), 0))))
                {
                    title = (("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp1]);
                    color = "<font color='#00ff00'>";
                    suffix1 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[106]) + "</font>");
                }
                else
                {
                    if (((Number(obj.b1) > Number(obj.b11)) && (ToolKit.isBigThan(Number(obj.b11), 0))))
                    {
                        title = (("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp1]);
                        color = "<font color='#ff0000'>";
                        suffix1 = (("<font color='#ff0000'>" + Language.EQUIPTFUNCPANEL_S[107]) + "</font>");
                    }
                    else
                    {
                        if (((Number(obj.b1) == Number(obj.b11)) && (ToolKit.isBigThan(Number(obj.b11), 0))))
                        {
                            title = (("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp1]);
                            color = "<font color='#00ff00'>";
                            suffix1 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[108]) + "</font>");
                        };
                    };
                };
                if (((Number(obj.b2) < Number(obj.b12)) && (ToolKit.isBigThan(Number(obj.b12), 0))))
                {
                    title1 = (("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp2]);
                    color1 = "<font color='#00ff00'>";
                    suffix2 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[106]) + "</font>");
                }
                else
                {
                    if (((Number(obj.b2) > Number(obj.b12)) && (ToolKit.isBigThan(Number(obj.b12), 0))))
                    {
                        title1 = (("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp2]);
                        color1 = "<font color='#ff0000'>";
                        suffix2 = (("<font color='#ff0000'>" + Language.EQUIPTFUNCPANEL_S[107]) + "</font>");
                    }
                    else
                    {
                        if (((Number(obj.b2) == Number(obj.b12)) && (ToolKit.isBigThan(Number(obj.b12), 0))))
                        {
                            title1 = (("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp2]);
                            color1 = "<font color='#00ff00'>";
                            suffix2 = (("<font color='#00ff00'>" + Language.EQUIPTFUNCPANEL_S[108]) + "</font>");
                        };
                    };
                };
                if (ToolKit.isBigThan(Number(obj.b11), 0))
                {
                    contentMsg = (contentMsg + ((((((((title + ": ") + obj.b1) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + color) + obj.b11) + "%</font>") + suffix1));
                }
                else
                {
                    if (((ToolKit.isEqual(Number(public::data.b11), 0)) && (ToolKit.isBigThan(Number(public::data.b1), 0))))
                    {
                        contentMsg = (contentMsg + (((((((((((("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp1]) + ": ") + public::data.b1) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + "<font color='#00ff00'>") + public::data.b1) + "%</font>") + "<font color='#00ff00'>") + Language.EQUIPTFUNCPANEL_S[106]) + "</font>"));
                    };
                };
                if (ToolKit.isBigThan(Number(obj.b12), 0))
                {
                    contentMsg = (((((((((contentMsg + title1) + ": ") + obj.b2) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + color1) + obj.b12) + "%</font>") + suffix2);
                }
                else
                {
                    if (((ToolKit.isEqual(Number(public::data.b12), 0)) && (ToolKit.isBigThan(Number(public::data.b2), 0))))
                    {
                        contentMsg = (contentMsg + (((((((((((("\n" + Language.BASICTOOLTIP_S[3]) + GamePredef.EQUIPT_PROP_NAME[equTmp.mainProp2]) + ": ") + public::data.b2) + "%") + Language.EQUIPTFUNCPANEL_S[129]) + "<font color='#00ff00'>") + public::data.b2) + "%</font>") + "<font color='#00ff00'>") + Language.EQUIPTFUNCPANEL_S[106]) + "</font>"));
                    };
                };
                msg = contentMsg.replace(/<font(.*?)>/g, "");
                msg = msg.replace(/<\/font>/g, "");
                msg = msg.replace(/<b>/g, "");
                msg = msg.replace(/<\/b>/g, "");
                Alert.yesLabel = Language.EQUIPTFUNCPANEL_S[113];
                Alert.noLabel = Language.EQUIPTFUNCPANEL_S[127];
                _alert = Alert.show(msg, "", (Alert.YES | Alert.NO), null, func);
                Alert.yesLabel = yesAlert;
                Alert.noLabel = noAlert;
                tf = _alert.mx_internal::alertForm.mx_internal::textField;
                tf.htmlText = contentMsg;
                tf.filters = GamePredef.FILTER_TEXT1;
            }
            else
            {
                petEquModBindInfo.htmlText = Language.EQUIPTFUNCPANEL_S[31];
                if (obj.msgFlag)
                {
                    petEquModBindInfo.htmlText = Language.EQUIPTFUNCPANEL_S[99];
                };
            };
        }

        public function __petEquLevelupBasic_change(_arg_1:NumericStepperEvent):void
        {
            petEquLevelupRate.label = ((petEquLevelupBasic.value * 20) + "%");
        }

        public function unselectAutoBuy():void
        {
            if (((this.autoBuy) && (this.autoBuy.selected)))
            {
                this.autoBuy.selected = false;
            };
        }

        private function magicWeaponChangeLevel():void
        {
            var mwEquip:Object;
            var onMWUpgrade:Function = function (_arg_1:Object):void
            {
                if (_arg_1)
                {
                    if (_arg_1.succ)
                    {
                        _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[78].toString().replace("{level}", _arg_1.level));
                        if (_arg_1.require)
                        {
                            upgradeRequireLabel.text = (Language.EQUIPTFUNCPANEL_U[165] + _arg_1.require);
                        }
                        else
                        {
                            upgradeRequireLabel.text = Language.EQUIPTFUNCPANEL_U[173];
                        };
                        if (_arg_1.color)
                        {
                            MWChangeLevel.setStyleName(Number(_arg_1.color));
                            if (MWChangeLevel.dropSlot)
                            {
                                if (Slot(MWChangeLevel.dropSlot).giid == MWChangeLevel.giid)
                                {
                                    Slot(MWChangeLevel.dropSlot).setStyleName(Number(_arg_1.color));
                                }
                                else
                                {
                                    trace("目标槽已经被移动，无法实时更新颜色");
                                };
                            };
                        };
                    }
                    else
                    {
                        if (_arg_1.failType == 1)
                        {
                            _core.sysMidNote(_arg_1.msg);
                        }
                        else
                        {
                            if (_arg_1.failType == 2)
                            {
                                _core.sysMidNote(Language.EQUIPTFUNCPANEL_U[173]);
                            }
                            else
                            {
                                if (_arg_1.failType == 3)
                                {
                                    _core.sysMidNote(Language.EQUIPTFUNCPANEL_U[174]);
                                };
                            };
                        };
                    };
                };
            };
            if (MWChangeLevel.slotData)
            {
                mwEquip = _core.data.getGameData(MWChangeLevel.type, MWChangeLevel.giid);
                if (mwEquip)
                {
                    if (((ToolKit.isSmallThan(_core.player.level, 100)) && (ToolKit.isBigOrEqual(mwEquip.upgradeNum, 16))))
                    {
                        _core.sysMsg(Language.EQUIPTFUNCPANEL_S[180]);
                        return;
                    };
                    _core.remote.call("mWeaponUpgrade", new Responder(onMWUpgrade), MWChangeLevel.slotData.id);
                };
            }
            else
            {
                _core.sysMidNote(Language.EQUIPTFUNCPANEL_S[82]);
            };
        }

        public function __lock2_click(_arg_1:MouseEvent):void
        {
            chageSelected(2);
        }

        private function magicWeaponStageViewClear(_arg_1:Boolean=false):void
        {
            if (hintTxt)
            {
                hintTxt.visible = true;
                if (_arg_1)
                {
                    hintTxt.y = 225;
                    hintTxt.text = Language.EQUIPTFUNCPANEL_U[241];
                }
                else
                {
                    hintTxt.y = 195;
                    hintTxt.text = Language.EQUIPTFUNCPANEL_U[240];
                };
            };
            ((stageEqu) && (stageEqu.clean()));
            ((stageItem) && (stageItem.clean()));
        }

        public function set MWTransFrom(_arg_1:ItemSlotEquFunc):void
        {
            var _local_2:Object;
            _local_2 = this._2082390040MWTransFrom;
            if (_local_2 !== _arg_1)
            {
                this._2082390040MWTransFrom = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "MWTransFrom", _local_2, _arg_1));
            };
        }

        public function onRestrainPetEquip(_arg_1:Object=null):void
        {
            var _local_2:Object;
            var _local_3:Object;
            if (((!(_arg_1)) || (!(restrainEquip))))
            {
                return;
            };
            _local_2 = restrainEquip.slotData;
            if (((!(_local_2)) || (!(_local_2.itemId == _arg_1.itemId))))
            {
                restrainPetClear();
                return;
            };
            _local_3 = _dm.getGameData(_local_2.type, _local_2.itemId);
            if (_local_3)
            {
                _local_3.flag = _arg_1.flagStr;
                _dm.updateData(_local_2.type, _local_3);
                restrainPetChange();
            };
            ((_arg_1.hasOwnProperty("num")) && ((ToolKit.isBigThan(_arg_1.num, 0)) ? restrainItem.stackNum = _arg_1.num : restrainItem.clean()));
        }

        private function jewelUpdateOne():void
        {
            if (((jewelUpdateItem1.slotData) && (ToolKit.isBigThan(jewelUpdateItem2.giid, 0))))
            {
                jewelUpdateButtonAll.enabled = false;
                jewelUpdateButtonOne.enabled = false;
                _core.remote.call("jewelUpdateOne", new Responder(onJewelUpdate), jewelUpdateNum.value, jewelUpdateItem1.slotData.id, jewelUpdateItem1.tempBagFlag);
            };
        }

        public function set jewelUpdateItem1(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object;
            _local_2 = this._1891128306jewelUpdateItem1;
            if (_local_2 !== _arg_1)
            {
                this._1891128306jewelUpdateItem1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdateItem1", _local_2, _arg_1));
            };
        }

        public function set jewelUpdateItem2(_arg_1:ItemSlotJewel):void
        {
            var _local_2:Object;
            _local_2 = this._1891128307jewelUpdateItem2;
            if (_local_2 !== _arg_1)
            {
                this._1891128307jewelUpdateItem2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "jewelUpdateItem2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get MWTransFrom():ItemSlotEquFunc
        {
            return (this._2082390040MWTransFrom);
        }

        public function onActivateMWPro(_arg_1:Object):void
        {
            var _local_2:Object;
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.f)
            {
                if (_alert)
                {
                    PopUpManager.removePopUp(_alert);
                    _alert = null;
                };
                _alert = Alert.show(Language.EQUIPTFUNCPANEL_U[230], "", Alert.YES, null, null);
                return;
            };
            oldSuccData[("succ" + _arg_1.index)] = _arg_1.flag;
            this[("oldPro" + _arg_1.index)].htmlText = this.encodePropInfo(_arg_1.flag, true);
            this[("actBtn" + _arg_1.index)].visible = false;
            this[("lock" + _arg_1.index)].visible = true;
            this[("lock" + _arg_1.index)].selected = false;
            updateCostInfo();
            _local_2 = _core.view.getUI(ViewManager.PANEL_VIP_SUCCINCT);
            if (_local_2)
            {
                _local_2.updateSuccData(this.MwSuccinct.giid, oldSuccData);
            };
        }

        private function materialMixNumCheck():void
        {
            if (materialMixItem.stackNum >= materialMixNum.value)
            {
                materialButtonAll.enabled = true;
                materialButtonOne.enabled = true;
            }
            else
            {
                materialButtonAll.enabled = false;
                materialButtonOne.enabled = false;
            };
        }

        private function petEquModBindClear():void
        {
            modBindReqNum.htmlText = "";
            petEquModBindSucc.text = "";
            petEquModBindInfo.text = "";
            petEquReadyModBind.clean();
            petEquModBindNeedItem.clean();
            petEquModBindItem.clean();
        }

        public function __petEquStarBasic_change(_arg_1:NumericStepperEvent):void
        {
            setStarInfo();
        }


    }
}//package com.qeedoo.ui.view.compDragable

