// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DecoratePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.ViewStack;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.RuneSlot;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.ui.view.comp.Property;
    import mx.containers.VBox;
    import mx.controls.ComboBox;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.HButtonTab;
    import com.qeedoo.ui.view.comp.MysTreBag;
    import com.qeedoo.ui.view.comp.MysTreShow;
    import mx.core.UIComponent;
    import mx.controls.CheckBox;
    import com.qeedoo.ui.view.comp.BackgroundLabel;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import com.qeedoo.ui.view.comp.RuneBagUpLvl;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.RuneClickBag;
    import com.qeedoo.ui.view.compGameStage.CreatureShowView;
    import com.qeedoo.ui.view.comp.RuneChipBag;
    import mx.controls.Tree;
    import flash.utils.Timer;
    import mx.core.UIComponentDescriptor;
    import mx.controls.HRule;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.data.DataManager;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.net.Responder;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.collections.ArrayCollection;
    import mx.events.IndexChangedEvent;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.utils.ObjectUtil;
    import com.qeedoo.ui.view.comp.RuneBagComb;
    import com.qeedoo.game.config.Language;
    import flash.events.Event;
    import com.qeedoo.game.view.ViewManager;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.utils.JSONUtil;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.comp.RuneBag;
    import mx.events.ListEvent;
    import flash.events.TimerEvent;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import mx.core.ClassFactory;
    import com.qeedoo.ui.view.comp.RuneItemRenderer;
    import com.qeedoo.ui.event.DecoEvent;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import mx.collections.ICollectionView;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.utils.TimeUtil;
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

    public class DecoratePanel extends DragableCanvas implements IBindingClient 
    {

        public static const MAX_MYS_KIND:int = 11;
        public static const MYS_TRE_NEED_SKIPT:* = {
            "1":100,
            "2":250,
            "3":700,
            "4":1000,
            "5":2000
        };
        public static const DECO_SUIT_PROP_NAME:* = {
            "1":"HP",
            "4":"Công",
            "5":"Công",
            "11":"Tốc"
        };
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1584105757viewStack:ViewStack;
        public var _DecoratePanel_Label50:Label;
        public var _DecoratePanel_Label51:Label;
        public var _DecoratePanel_Label52:Label;
        public var _DecoratePanel_Label53:Label;
        public var _DecoratePanel_Label54:Label;
        public var _DecoratePanel_Label55:Label;
        public var _DecoratePanel_Label57:Label;
        public var _DecoratePanel_Label59:Label;
        public var _DecoratePanel_Label58:Label;
        public var _DecoratePanel_Label60:Label;
        private var _1139840415HoleSlot12:RuneSlot;
        public var _DecoratePanel_Label63:Label;
        private var _223261862putMatSlot5:Slot;
        public var _DecoratePanel_Label65:Label;
        public var _DecoratePanel_Label66:Label;
        public var _DecoratePanel_Label67:Label;
        public var _DecoratePanel_Label68:Label;
        public var _DecoratePanel_Label69:Label;
        private var _926039372property10:Property;
        public var _DecoratePanel_Label61:Label;
        private var _1703430709makeListContainer:VBox;
        private var _1071609613HoleSlot1:RuneSlot;
        private var _1851478495suitProp1:Label;
        public var _DecoratePanel_Label70:Label;
        public var _DecoratePanel_Label71:Label;
        public var _DecoratePanel_Label73:Label;
        public var _DecoratePanel_Label74:Label;
        public var _DecoratePanel_Label75:Label;
        private var _1115807463headSel3:ComboBox;
        private var _1206094728hunqi1:Image;
        private var _95595307ditu1:Image;
        private var _1350446268mysTreButton6:Button;
        private var _1139840418HoleSlot15:RuneSlot;
        private var _104584967name2:Image;
        private var _1297726958pageTabPos:HButtonTab;
        private var _722608893property8:Property;
        private var _loadCid:Number = 0;
        private var _1815441400mysTreBag:MysTreBag;
        private var _1071609606HoleSlot8:RuneSlot;
        private var _1350446272mysTreButton2:Button;
        private var _1574895328pageTabRune:HButtonTab;
        private var _866543397mysTreShow8:MysTreShow;
        private var _95595308ditu2:Image;
        private var _104584968name3:Image;
        private var _282560953hasSilver:Label;
        private var _1115807462headSel4:ComboBox;
        private var _1827803948needMatSlot4:Slot;
        private var _869016272mysTreProp3:VBox;
        private var _1851478496suitProp0:Label;
        private var _912007309curLvlProp2:Label;
        private var _527458580pageTabRuneResolve:HButtonTab;
        private var _95595309ditu3:Image;
        private var _1955000865decoHoleProp1:Label;
        private var _2113119409viewHolder:UIComponent;
        private var _1085838546mysTreButton11:Button;
        private var _104584969name4:Image;
        private var _1124646448viewStackDeco:ViewStack;
        private var _1268862611footCb:CheckBox;
        private var _722608894property7:Property;
        private var _1206094726hunqi3:Image;
        private var _223261858putMatSlot1:Slot;
        private var _722608900property1:Property;
        private var _654621974upLvlExp:Label;
        private var _1125079229viewStackRune:ViewStack;
        private var _1071609607HoleSlot7:RuneSlot;
        private var _1350446269mysTreButton5:Button;
        private var _1720350188maxLvlInfo:Label;
        private var _1917234124showProp4:Label;
        private var _39561037makeLabel3:BackgroundLabel;
        private var _785164560nexLvlProp4:Label;
        private var _785164563nexLvlProp1:Label;
        public var runeBag:*;
        private var _380408707limitMakeTimes:int = 0;
        private var _866543400mysTreShow5:MysTreShow;
        private var _439996389resolveMysSil:Number = 0;
        private var _1181149659upLvlSlot:RuneSlot;
        private var _1350446273mysTreButton1:Button;
        private var _866543403mysTreShow2:MysTreShow;
        private var _1139840413HoleSlot10:RuneSlot;
        private var _223261861putMatSlot4:Slot;
        private var _2002617733mysDisplay:ViewStack;
        private var _1827803947needMatSlot3:Slot;
        private var _2048271806succRate:Label;
        private var _1318419427pageTwoCvs:Canvas;
        private var _1139840416HoleSlot13:RuneSlot;
        private var _722608895property6:Property;
        private var _1343160509needSilver:Label;
        private var _722608901property0:Property;
        private var _889670173needBindSil:Label;
        private var _569860019decoDis4:DecorateDisplay;
        private var _1071609608HoleSlot6:RuneSlot;
        private var _1322604301eTitle:BasicTitleCanvas;
        private var _1139840419HoleSlot16:RuneSlot;
        private var _1915647682listShowCbx:CheckBox;
        private var _1917234125showProp3:Label;
        private var _1955000866decoHoleProp2:Label;
        private var _2010376780runeBagPetUp:RuneBagUpLvl;
        private var _selectRecipe:int = 0;
        private var _1221271969headCb:CheckBox;
        private var _1350446265mysTreButton9:Button;
        private var suitRefreshFlag:Boolean = false;
        private var _866543396mysTreShow9:MysTreShow;
        private var _1852161545mysSilNum:Label;
        private var _866543399mysTreShow6:MysTreShow;
        public var _DecoratePanel_BasicDelayButton1:BasicDelayButton;
        public var _DecoratePanel_BasicDelayButton2:BasicDelayButton;
        public var _DecoratePanel_BasicDelayButton4:BasicDelayButton;
        public var _DecoratePanel_BasicDelayButton5:BasicDelayButton;
        public var _DecoratePanel_BasicDelayButton6:BasicDelayButton;
        private var _1860916424suitName:Label;
        private var _569860018decoDis3:DecorateDisplay;
        private var _722608896property5:Property;
        private var _869016274mysTreProp1:VBox;
        private var _1350446274mysTreButton0:Button;
        private var _912007308curLvlProp1:Label;
        private var _1071609609HoleSlot5:RuneSlot;
        private var _39561040makeLabel6:BackgroundLabel;
        private var _1827803946needMatSlot2:Slot;
        private var _1558202844mysItemDic:Object;
        private var _1917234126showProp2:Label;
        private var _395995255limitMakeTimesLabel:Label;
        private var _11953281decoTitleLb:Label;
        private var _1115800578headSlot:Slot;
        public var _DecoratePanel_BasicGlowButton2:BasicGlowButton;
        public var _DecoratePanel_BasicGlowButton3:BasicGlowButton;
        public var _DecoratePanel_BasicGlowButton4:BasicGlowButton;
        public var _DecoratePanel_BasicGlowButton5:BasicGlowButton;
        public var _DecoratePanel_BasicGlowButton6:BasicGlowButton;
        private var _2085068978runeBagCha:RuneClickBag;
        private var _1356668029hasMysSilNum:Label;
        private var _showView:CreatureShowView;
        private var _39561035makeLabel1:BackgroundLabel;
        private var _1093041699mysTreShow11:MysTreShow;
        private var _878430082runeChipBag:RuneChipBag;
        private var _1071609610HoleSlot4:RuneSlot;
        private var _1955000867decoHoleProp3:Label;
        private var _919815307runeUp:Image;
        private var _367345007buttonContainer:VBox;
        private var _39561038makeLabel4:BackgroundLabel;
        private var _394232716footSlot:Slot;
        private var _569860017decoDis2:DecorateDisplay;
        private var _785164562nexLvlProp2:Label;
        private var _1206094727hunqi2:Image;
        private var _runeBagAdded:Boolean = false;
        private var _912007311curLvlProp4:Label;
        public var _DecoratePanel_Label1:Label;
        private var _selectedDecoHole:int = 1;
        public var _DecoratePanel_Label8:Label;
        private var _1350446266mysTreButton8:Button;
        private var _722608897property4:Property;
        private var _738577227propTitle:Label;
        private var _866543402mysTreShow3:MysTreShow;
        private var _1139840414HoleSlot11:RuneSlot;
        private var _926039371property11:Property;
        private var _223261860putMatSlot3:Slot;
        private var _1917234127showProp1:Label;
        private var _1682576695bottomSlot:Slot;
        private var _223261863putMatSlot6:Slot;
        private var _2147320885skillPt:Label;
        private var _2085056559runeBagPet:RuneClickBag;
        private var _515959406pageTabRuneAct:HButtonTab;
        private var _1139840417HoleSlot14:RuneSlot;
        private var _2127905646chaRunePropBox:VBox;
        private var _1350446270mysTreButton4:Button;
        private var _1072419793petRunePropBox:VBox;
        public var _selectedLvl:int = 1;
        private var _297514627guangquan:Image;
        private var _1827803945needMatSlot1:Slot;
        private var _1093041700mysTreShow10:MysTreShow;
        private var _1071609611HoleSlot3:RuneSlot;
        private var _569860016decoDis1:DecorateDisplay;
        private var _1041132382nameImage2:Image;
        private var _1194080893linkProp:Label;
        private var _722608898property3:Property;
        private var _1115807465headSel1:ComboBox;
        private var _866543398mysTreShow7:MysTreShow;
        private var _mysMakeData:Object;
        private var _170545173lightCb:CheckBox;
        private var _1031721051makeOutputLabel:Label;
        private var _1506606598pageTabMysTre:HButtonTab;
        private var _1206094725hunqi4:Image;
        private var _1955000868decoHoleProp4:Label;
        private var _869016273mysTreProp2:VBox;
        private var _1350446267mysTreButton7:Button;
        private var _1813919509illustrateTree:Tree;
        private var _1827803950needMatSlot6:Slot;
        private var _569860015decoDis0:DecorateDisplay;
        private var _712098679hasRuneExp:Label;
        private var _1071609612HoleSlot2:RuneSlot;
        private var _689401195viewStackRuneAct:ViewStack;
        private var _223261859putMatSlot2:Slot;
        private var _1896896345pageTabRuneUplvl:HButtonTab;
        private var _1115807464headSel2:ComboBox;
        private var _1350446271mysTreButton3:Button;
        private var _95595310ditu4:Image;
        private var _2138061846bottomCb:CheckBox;
        private var _2067262411showBag:BasicGlowButton;
        private var _722608899property2:Property;
        private var _1998442121runeBagChaUp:RuneBagUpLvl;
        private var _39561036makeLabel2:BackgroundLabel;
        private var _1085838545mysTreButton10:Button;
        private var _dueObj:Object;
        public var _DecoratePanel_Label11:Label;
        public var _DecoratePanel_Label18:Label;
        private var _722608892property9:Property;
        public var _DecoratePanel_ViewStack6:ViewStack;
        public var _DecoratePanel_ViewStack7:ViewStack;
        public var _DecoratePanel_Label19:Label;
        public var _DecoratePanel_Image3:Image;
        public var _DecoratePanel_ViewStack5:ViewStack;
        public var _DecoratePanel_Image5:Image;
        public var _DecoratePanel_Image2:Image;
        public var _DecoratePanel_Image4:Image;
        private var _785164561nexLvlProp3:Label;
        public var _DecoratePanel_Label20:Label;
        private var _1565679562pageTabFirst:HButtonTab;
        private var _685643828lightSlot:Slot;
        private var _912007310curLvlProp3:Label;
        private var _39561039makeLabel5:BackgroundLabel;
        private var _2116585646runeSetDitu:Image;
        private var _1071609605HoleSlot9:RuneSlot;
        public var _DecoratePanel_Label35:Label;
        public var _DecoratePanel_Label39:Label;
        public var _DecoratePanel_Label34:Label;
        public var _DecoratePanel_Label36:Label;
        private var _866543401mysTreShow4:MysTreShow;
        private var _1827803949needMatSlot5:Slot;
        private var updateDecoTimer:Timer;
        private var _104584966name1:Image;
        public var _DecoratePanel_Label41:Label;
        public var _DecoratePanel_Label42:Label;
        public var _DecoratePanel_Label43:Label;
        public var _DecoratePanel_Label44:Label;
        public var _DecoratePanel_Label45:Label;
        public var _DecoratePanel_Label46:Label;
        public var _DecoratePanel_Label40:Label;
        public var _DecoratePanel_Label48:Label;
        public var _DecoratePanel_Label49:Label;
        public var _DecoratePanel_Label47:Label;
        private var _866543404mysTreShow1:MysTreShow;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":440,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"eTitle"
                    }), new UIComponentDescriptor({
                        "type":HButtonTab,
                        "id":"pageTabFirst",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":24,
                                "y":39,
                                "selectedIndex":0
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ViewStack,
                        "id":"viewStack",
                        "events":{
                            "creationComplete":"__viewStack_creationComplete",
                            "change":"__viewStack_change"
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "width":570,
                                "height":355,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ditu1"
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":114,
                                                        "y":24,
                                                        "width":150,
                                                        "height":180,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "clipContent":false,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DecoratePanel_Label1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.textAlign = "center";
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":5});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":UIComponent,
                                                            "id":"viewHolder",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":80,
                                                                    "y":210,
                                                                    "mouseEnabled":false,
                                                                    "mouseChildren":false
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___DecoratePanel_Button1_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "-40";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "buttonMode":true,
                                                                    "styleName":"BtnLoginTurnLeft"
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Button,
                                                            "events":{"click":"___DecoratePanel_Button2_click"},
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.horizontalCenter = "40";
                                                                this.bottom = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "buttonMode":true,
                                                                    "styleName":"BtnLoginTurnRight"
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
                                                        "x":10,
                                                        "y":215,
                                                        "width":352,
                                                        "height":130,
                                                        "verticalScrollPolicy":"auto",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"propTitle",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.horizontalCenter = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({"y":1});
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DecoratePanel_Image2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":97,
                                                                    "y":16,
                                                                    "width":35,
                                                                    "height":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DecoratePanel_Image3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":159,
                                                                    "y":16,
                                                                    "width":35,
                                                                    "height":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DecoratePanel_Image4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":222,
                                                                    "y":16,
                                                                    "width":35,
                                                                    "height":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"_DecoratePanel_Image5",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":285,
                                                                    "y":16,
                                                                    "width":35,
                                                                    "height":35
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"suitName",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showProp1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x999999;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":90,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showProp2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x999999;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":153,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showProp3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x999999;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":216,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"showProp4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x999999;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":279,
                                                                    "y":58
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DecoratePanel_Label8",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":78,
                                                                    "text":"HQuả Toàn Bộ："
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"suitProp0",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x999999;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":92,
                                                                    "y":78
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"suitProp1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0x999999;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":153,
                                                                    "y":78
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"_DecoratePanel_Label11",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.color = 0xFFFF00;
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":12,
                                                                    "y":100,
                                                                    "text":"Th.tính l.kết linh hồn："
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Label,
                                                            "id":"linkProp",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 12;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":92,
                                                                    "y":100
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HButtonTab,
                                                "id":"pageTabPos",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":374,
                                                        "y":6,
                                                        "selectedIndex":0,
                                                        "tabWidth":37
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":HRule,
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "178";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":180,
                                                        "y":48
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"viewStackDeco",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":370,
                                                        "y":25,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DecorateDisplay,
                                                            "id":"decoDis0",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "position":0,
                                                                    "decoCall":updateDecoShow
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DecorateDisplay,
                                                            "id":"decoDis1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "position":1,
                                                                    "decoCall":updateDecoShow
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DecorateDisplay,
                                                            "id":"decoDis2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "position":2,
                                                                    "decoCall":updateDecoShow
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DecorateDisplay,
                                                            "id":"decoDis3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "position":3,
                                                                    "decoCall":updateDecoShow
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":DecorateDisplay,
                                                            "id":"decoDis4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "position":4,
                                                                    "decoCall":updateDecoShow
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"name2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":278,
                                                        "y":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"nameImage2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":278,
                                                        "y":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Slot,
                                                "id":"lightSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"TransparentSlot",
                                                        "movable":false,
                                                        "acceptable":false,
                                                        "stackNum":1,
                                                        "x":299,
                                                        "y":36,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"lightCb",
                                                "events":{"click":"__lightCb_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":13.5,
                                                        "height":13.5,
                                                        "x":281,
                                                        "y":56.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"name4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":281,
                                                        "y":126
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Slot,
                                                "id":"bottomSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"TransparentSlot",
                                                        "movable":false,
                                                        "acceptable":false,
                                                        "stackNum":1,
                                                        "x":300,
                                                        "y":152,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"bottomCb",
                                                "events":{"click":"__bottomCb_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":13.5,
                                                        "height":13.5,
                                                        "x":281,
                                                        "y":172.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"name1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":29,
                                                        "y":10
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Slot,
                                                "id":"headSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"TransparentSlot",
                                                        "movable":false,
                                                        "acceptable":false,
                                                        "stackNum":1,
                                                        "x":46,
                                                        "y":36,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"headCb",
                                                "events":{"click":"__headCb_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":13.5,
                                                        "height":13.5,
                                                        "x":85,
                                                        "y":56.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"name3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":29,
                                                        "y":126
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Slot,
                                                "id":"footSlot",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"TransparentSlot",
                                                        "movable":false,
                                                        "acceptable":false,
                                                        "stackNum":1,
                                                        "x":47,
                                                        "y":152,
                                                        "width":34,
                                                        "height":34
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CheckBox,
                                                "id":"footCb",
                                                "events":{"click":"__footCb_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":13.5,
                                                        "height":13.5,
                                                        "x":86,
                                                        "y":172.5
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"headSel1",
                                                "events":{"change":"__headSel1_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":72.5,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"headSel2",
                                                "events":{"change":"__headSel2_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":281,
                                                        "y":71.5,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"headSel3",
                                                "events":{"change":"__headSel3_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":187,
                                                        "height":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ComboBox,
                                                "id":"headSel4",
                                                "events":{"change":"__headSel4_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":281,
                                                        "y":187,
                                                        "height":20
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"pageTwoCvs",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ditu2"
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "events":{"click":"___DecoratePanel_Canvas5_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":80,
                                                        "height":80,
                                                        "x":9,
                                                        "y":8,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"hunqi1",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "height":80
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "events":{"click":"___DecoratePanel_Canvas6_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":80,
                                                        "height":80,
                                                        "x":9,
                                                        "y":95,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"hunqi2",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "height":80
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "events":{"click":"___DecoratePanel_Canvas7_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":80,
                                                        "height":80,
                                                        "x":9,
                                                        "y":181,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"hunqi3",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "height":80
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "events":{"click":"___DecoratePanel_Canvas8_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":80,
                                                        "height":80,
                                                        "x":9,
                                                        "y":267,
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"hunqi4",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":80,
                                                                    "height":80
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
                                                        "width":465,
                                                        "height":340,
                                                        "styleName":"CanvasBorder",
                                                        "verticalScrollPolicy":"off",
                                                        "horizontalScrollPolicy":"off",
                                                        "x":96,
                                                        "y":8,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":200,
                                                                    "height":80,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "x":10,
                                                                    "y":8,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"decoTitleLb",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 14;
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":4});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"decoHoleProp1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":28
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"decoHoleProp2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":28
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"decoHoleProp3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":54
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"decoHoleProp4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":53
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
                                                                    "width":200,
                                                                    "height":235,
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "x":10,
                                                                    "y":96,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"StandardTitle",
                                                                                "mouseEnabled":false,
                                                                                "y":4,
                                                                                "width":160,
                                                                                "height":15,
                                                                                "mouseChildren":false,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label18",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFF00;
                                                                                        this.textAlign = "center";
                                                                                        this.horizontalCenter = "0";
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":200,
                                                                                "y":25,
                                                                                "x":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DecoratePanel_Label19",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":30,
                                                                                "y":28
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DecoratePanel_Label20",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":119,
                                                                                "y":28
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"curLvlProp1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":52
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"curLvlProp2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":67
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"curLvlProp3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":82
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"curLvlProp4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":5,
                                                                                "y":97
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nexLvlProp1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":52
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nexLvlProp2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":67
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nexLvlProp3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":82
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"nexLvlProp4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":105,
                                                                                "y":97
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"maxLvlInfo",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 15;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":121,
                                                                                "y":72
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"needSilver",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.color = 0xFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":119});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"needBindSil",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.color = 0xFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":134});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"succRate",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.color = 0xFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":149});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"_DecoratePanel_BasicDelayButton1",
                                                                        "events":{"click":"___DecoratePanel_BasicDelayButton1_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":24,
                                                                                "styleName":"BtnStdGreen",
                                                                                "x":6.5,
                                                                                "y":177
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicDelayButton,
                                                                        "id":"_DecoratePanel_BasicDelayButton2",
                                                                        "events":{"click":"___DecoratePanel_BasicDelayButton2_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "height":24,
                                                                                "styleName":"BtnStdGreen",
                                                                                "x":95.5,
                                                                                "y":177
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HRule,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":200,
                                                                                "y":204,
                                                                                "x":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"hasSilver",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":210});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":HButtonTab,
                                                            "id":"pageTabRune",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":222.5,
                                                                    "y":10,
                                                                    "selectedIndex":0
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"runeSetDitu",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":217,
                                                                    "y":30,
                                                                    "width":238,
                                                                    "height":300
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"guangquan",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":217,
                                                                    "y":30,
                                                                    "width":238,
                                                                    "height":300
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":ViewStack,
                                                            "id":"viewStackRune",
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":217,
                                                                    "y":30,
                                                                    "width":238,
                                                                    "height":300,
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":238,
                                                                                "height":300,
                                                                                "styleName":"CanvasBorder",
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "x":0,
                                                                                "y":0,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":94,
                                                                                            "y":10,
                                                                                            "runeChaHolePos":1,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":169,
                                                                                            "y":51,
                                                                                            "runeChaHolePos":3,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot5",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":178,
                                                                                            "y":131,
                                                                                            "runeChaHolePos":5,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot7",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":169,
                                                                                            "y":197,
                                                                                            "runeChaHolePos":7,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot9",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":94,
                                                                                            "y":240,
                                                                                            "runeChaHolePos":9,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot11",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":23,
                                                                                            "y":197,
                                                                                            "runeChaHolePos":11,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot13",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":131,
                                                                                            "runeChaHolePos":13,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot15",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":23,
                                                                                            "y":51,
                                                                                            "runeChaHolePos":15,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label34",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":68});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":VBox,
                                                                                    "id":"chaRunePropBox",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.verticalGap = 1;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":85});
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":238,
                                                                                "height":300,
                                                                                "styleName":"CanvasBorder",
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "x":0,
                                                                                "y":0,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":94,
                                                                                            "y":10,
                                                                                            "runePetHolePos":2,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":169,
                                                                                            "y":51,
                                                                                            "runePetHolePos":4,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot6",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":178,
                                                                                            "y":131,
                                                                                            "runePetHolePos":6,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot8",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":169,
                                                                                            "y":197,
                                                                                            "runePetHolePos":8,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot10",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":94,
                                                                                            "y":240,
                                                                                            "runePetHolePos":10,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot12",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":23,
                                                                                            "y":197,
                                                                                            "runePetHolePos":12,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot14",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":131,
                                                                                            "runePetHolePos":14,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneSlot,
                                                                                    "id":"HoleSlot16",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":23,
                                                                                            "y":51,
                                                                                            "runePetHolePos":16,
                                                                                            "width":50,
                                                                                            "height":50,
                                                                                            "styleName":"SoulSlotClose"
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label35",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":68});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":VBox,
                                                                                    "id":"petRunePropBox",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                        this.verticalGap = 1;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"y":85});
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
                                                "id":"showBag",
                                                "events":{"click":"__showBag_click"},
                                                "stylesFactory":function ():void
                                                {
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":558,
                                                        "height":200,
                                                        "width":12,
                                                        "styleName":"EquipBagRight"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ditu3"
                                            }), new UIComponentDescriptor({
                                                "type":HButtonTab,
                                                "id":"pageTabRuneAct",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":9,
                                                        "y":5,
                                                        "selectedIndex":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"viewStackRuneAct",
                                                "events":{"change":"__viewStackRuneAct_change"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":5,
                                                        "y":23,
                                                        "width":560,
                                                        "height":330,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                                this.right = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"runeUp",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"y":-20});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RuneSlot,
                                                                        "id":"upLvlSlot",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":63,
                                                                                "height":63,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "styleName":"SoulSlotOpen",
                                                                                "x":74,
                                                                                "y":76
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_DecoratePanel_Label36",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF00;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":61,
                                                                                "y":143
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"hasRuneExp",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":50,
                                                                                "y":171
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"upLvlExp",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFF;
                                                                            this.fontSize = 12;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":49,
                                                                                "y":190
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":BasicGlowButton,
                                                                        "id":"_DecoratePanel_BasicGlowButton2",
                                                                        "events":{"click":"___DecoratePanel_BasicGlowButton2_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"BtnStdGreen",
                                                                                "x":72,
                                                                                "y":218
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":HButtonTab,
                                                                        "id":"pageTabRuneUplvl",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":207,
                                                                                "y":6,
                                                                                "selectedIndex":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ViewStack,
                                                                        "id":"_DecoratePanel_ViewStack5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":197,
                                                                                "y":25,
                                                                                "width":360,
                                                                                "height":300,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":RuneBagUpLvl,
                                                                                    "id":"runeBagChaUp"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneBagUpLvl,
                                                                                    "id":"runeBagPetUp"
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
                                                                this.left = "0";
                                                                this.right = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":HButtonTab,
                                                                        "id":"pageTabRuneResolve",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":11,
                                                                                "y":9,
                                                                                "selectedIndex":0
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ViewStack,
                                                                        "id":"_DecoratePanel_ViewStack6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":10,
                                                                                "y":28,
                                                                                "width":550,
                                                                                "height":295,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":RuneClickBag,
                                                                                    "id":"runeBagCha"
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":RuneClickBag,
                                                                                    "id":"runeBagPet"
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
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "0";
                                        this.right = "0";
                                        this.top = "0";
                                        this.bottom = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"ditu4"
                                            }), new UIComponentDescriptor({
                                                "type":HButtonTab,
                                                "id":"pageTabMysTre",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":9,
                                                        "y":5,
                                                        "selectedIndex":0
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"_DecoratePanel_ViewStack7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":28,
                                                        "width":555,
                                                        "height":325,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "0";
                                                                this.right = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"CanvasBorder",
                                                                                "x":3,
                                                                                "y":3,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "width":160,
                                                                                "height":315,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"StandardTitle",
                                                                                            "mouseEnabled":false,
                                                                                            "y":10,
                                                                                            "width":140,
                                                                                            "height":19,
                                                                                            "mouseChildren":false,
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label39",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 14;
                                                                                                    this.color = 0xFFFF00;
                                                                                                    this.textAlign = "center";
                                                                                                    this.horizontalCenter = "0";
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":140,
                                                                                            "y":33,
                                                                                            "x":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":VBox,
                                                                                    "id":"buttonContainer",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.verticalGap = 1;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":40,
                                                                                            "x":3,
                                                                                            "verticalScrollPolicy":"auto",
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "width":150,
                                                                                            "height":250,
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton0",
                                                                                                "events":{"click":"__mysTreButton0_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasureSelected",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton1",
                                                                                                "events":{"click":"__mysTreButton1_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton2",
                                                                                                "events":{"click":"__mysTreButton2_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton3",
                                                                                                "events":{"click":"__mysTreButton3_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton4",
                                                                                                "events":{"click":"__mysTreButton4_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton5",
                                                                                                "events":{"click":"__mysTreButton5_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton6",
                                                                                                "events":{"click":"__mysTreButton6_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton7",
                                                                                                "events":{"click":"__mysTreButton7_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton8",
                                                                                                "events":{"click":"__mysTreButton8_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton9",
                                                                                                "events":{"click":"__mysTreButton9_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton10",
                                                                                                "events":{"click":"__mysTreButton10_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Button,
                                                                                                "id":"mysTreButton11",
                                                                                                "events":{"click":"__mysTreButton11_click"},
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"BtnMysTreasure",
                                                                                                        "width":145,
                                                                                                        "height":29
                                                                                                    });
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                })]
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ViewStack,
                                                                        "id":"mysDisplay",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":168,
                                                                                "y":4,
                                                                                "width":380,
                                                                                "height":315,
                                                                                "selectedIndex":0,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.left = "0";
                                                                                        this.right = "0";
                                                                                        this.top = "0";
                                                                                        this.bottom = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"CanvasBorder",
                                                                                            "verticalScrollPolicy":"off",
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label40",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 14;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":7,
                                                                                                        "x":9
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":HRule,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "width":350,
                                                                                                        "height":3,
                                                                                                        "y":33,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label41",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":38,
                                                                                                        "x":9
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property0",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "43";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":305,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label42",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":59,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property1",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "62";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label43",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":77,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property2",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "82";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label44",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":98,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property3",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "102";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label45",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":120,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property4",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "123";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label46",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":139,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property5",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "143";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label47",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":159,
                                                                                                        "x":10
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property6",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "96";
                                                                                                    this.top = "163";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label48",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":59,
                                                                                                        "x":194
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property7",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "280";
                                                                                                    this.top = "62";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label49",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":79,
                                                                                                        "x":194
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property8",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "280";
                                                                                                    this.top = "82";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property9",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "280";
                                                                                                    this.top = "102";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property10",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "280";
                                                                                                    this.top = "123";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Property,
                                                                                                "id":"property11",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.left = "280";
                                                                                                    this.top = "143";
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "height":13,
                                                                                                        "width":90,
                                                                                                        "styleName":"ProgressExp",
                                                                                                        "color":0
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Canvas,
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "styleName":"CanvasBorder",
                                                                                                        "width":360,
                                                                                                        "height":120,
                                                                                                        "verticalScrollPolicy":"off",
                                                                                                        "horizontalScrollPolicy":"off",
                                                                                                        "x":11,
                                                                                                        "y":186,
                                                                                                        "childDescriptors":[new UIComponentDescriptor({
                                                                                                            "type":Label,
                                                                                                            "id":"_DecoratePanel_Label50",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.fontSize = 12;
                                                                                                                this.color = 0xFFFF00;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "y":4,
                                                                                                                    "x":7
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":VBox,
                                                                                                            "id":"mysTreProp1",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.verticalGap = 1;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":30,
                                                                                                                    "y":25
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":VBox,
                                                                                                            "id":"mysTreProp2",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.verticalGap = 1;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":132,
                                                                                                                    "y":25
                                                                                                                });
                                                                                                            }
                                                                                                        }), new UIComponentDescriptor({
                                                                                                            "type":VBox,
                                                                                                            "id":"mysTreProp3",
                                                                                                            "stylesFactory":function ():void
                                                                                                            {
                                                                                                                this.verticalGap = 1;
                                                                                                            },
                                                                                                            "propertiesFactory":function ():Object
                                                                                                            {
                                                                                                                return ({
                                                                                                                    "x":235,
                                                                                                                    "y":25
                                                                                                                });
                                                                                                            }
                                                                                                        })]
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label51",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":98,
                                                                                                        "x":194
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label52",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":120,
                                                                                                        "x":194
                                                                                                    });
                                                                                                }
                                                                                            }), new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label53",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                },
                                                                                                "propertiesFactory":function ():Object
                                                                                                {
                                                                                                    return ({
                                                                                                        "y":139,
                                                                                                        "x":194
                                                                                                    });
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":1});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":2});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":3});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":4});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow5",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":5});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow6",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":6});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow7",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":7});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow8",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":8});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow9",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":9});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow10",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":10});
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreShow,
                                                                                    "id":"mysTreShow11",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({"kind":11});
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
                                                                this.left = "0";
                                                                this.right = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"CanvasBorder",
                                                                                "width":125,
                                                                                "height":310,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "y":9,
                                                                                "x":5,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"StandardTitle",
                                                                                            "mouseEnabled":false,
                                                                                            "y":10,
                                                                                            "width":140,
                                                                                            "height":19,
                                                                                            "mouseChildren":false,
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label54",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                    this.textAlign = "center";
                                                                                                    this.horizontalCenter = "0";
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":125,
                                                                                            "y":32,
                                                                                            "x":0
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BackgroundLabel,
                                                                                    "id":"makeLabel1",
                                                                                    "events":{"click":"__makeLabel1_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":40,
                                                                                            "labelWidth":115
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BackgroundLabel,
                                                                                    "id":"makeLabel2",
                                                                                    "events":{"click":"__makeLabel2_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":65,
                                                                                            "labelWidth":115
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BackgroundLabel,
                                                                                    "id":"makeLabel3",
                                                                                    "events":{"click":"__makeLabel3_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":90,
                                                                                            "labelWidth":115
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BackgroundLabel,
                                                                                    "id":"makeLabel4",
                                                                                    "events":{"click":"__makeLabel4_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":115,
                                                                                            "labelWidth":115
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BackgroundLabel,
                                                                                    "id":"makeLabel5",
                                                                                    "events":{"click":"__makeLabel5_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":140,
                                                                                            "labelWidth":115
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BackgroundLabel,
                                                                                    "id":"makeLabel6",
                                                                                    "events":{"click":"__makeLabel6_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":165,
                                                                                            "labelWidth":115
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label55",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":24,
                                                                                            "y":253
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"skillPt",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":53,
                                                                                            "y":272
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
                                                                                "width":150,
                                                                                "height":310,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "y":9,
                                                                                "x":137,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"StandardTitle",
                                                                                            "mouseEnabled":false,
                                                                                            "y":10,
                                                                                            "width":140,
                                                                                            "height":19,
                                                                                            "mouseChildren":false,
                                                                                            "childDescriptors":[new UIComponentDescriptor({
                                                                                                "type":Label,
                                                                                                "id":"_DecoratePanel_Label57",
                                                                                                "stylesFactory":function ():void
                                                                                                {
                                                                                                    this.fontSize = 12;
                                                                                                    this.color = 0xFFFF00;
                                                                                                    this.textAlign = "center";
                                                                                                    this.horizontalCenter = "0";
                                                                                                }
                                                                                            })]
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":150,
                                                                                            "y":32,
                                                                                            "x":0,
                                                                                            "height":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":VBox,
                                                                                    "id":"makeListContainer",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.verticalGap = 1;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "verticalScrollPolicy":"auto",
                                                                                            "horizontalScrollPolicy":"off",
                                                                                            "width":135,
                                                                                            "height":230,
                                                                                            "x":8,
                                                                                            "y":42
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":150,
                                                                                            "y":283,
                                                                                            "x":0,
                                                                                            "height":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":CheckBox,
                                                                                    "id":"listShowCbx",
                                                                                    "events":{"click":"__listShowCbx_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":19,
                                                                                            "y":286.5,
                                                                                            "selected":false
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label58",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":32.5,
                                                                                            "y":284
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
                                                                                "width":250,
                                                                                "height":310,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "y":9,
                                                                                "x":294,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label59",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":10,
                                                                                            "x":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":100,
                                                                                            "y":31,
                                                                                            "x":10,
                                                                                            "height":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"needMatSlot1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":38,
                                                                                            "x":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"needMatSlot2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":38,
                                                                                            "x":48
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"needMatSlot3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":38,
                                                                                            "x":86
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"needMatSlot4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":38,
                                                                                            "x":124
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"needMatSlot5",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":38,
                                                                                            "x":162
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"needMatSlot6",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":38,
                                                                                            "x":200
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label60",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":85,
                                                                                            "x":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":100,
                                                                                            "y":106,
                                                                                            "x":10,
                                                                                            "height":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"putMatSlot1",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":113,
                                                                                            "x":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"putMatSlot2",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":113,
                                                                                            "x":48
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"putMatSlot3",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":113,
                                                                                            "x":86
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"putMatSlot4",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":113,
                                                                                            "x":124
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"putMatSlot5",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":113,
                                                                                            "x":162
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Slot,
                                                                                    "id":"putMatSlot6",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "acceptable":false,
                                                                                            "movable":false,
                                                                                            "styleName":"TransparentSlot",
                                                                                            "width":34,
                                                                                            "height":34,
                                                                                            "y":113,
                                                                                            "x":200
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"_DecoratePanel_BasicGlowButton3",
                                                                                    "events":{"click":"___DecoratePanel_BasicGlowButton3_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "x":84,
                                                                                            "y":155
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label61",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF00;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":194,
                                                                                            "x":10
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"makeOutputLabel",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFFFF;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":10,
                                                                                            "y":222
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label63",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":245,
                                                                                            "x":48
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"limitMakeTimesLabel",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.color = 0xFFFF;
                                                                                        this.fontSize = 12;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "y":245,
                                                                                            "x":153
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":100,
                                                                                            "y":215,
                                                                                            "x":10,
                                                                                            "height":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "events":{"click":"___DecoratePanel_BasicDelayButton3_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnAdd",
                                                                                            "x":169,
                                                                                            "y":248,
                                                                                            "width":15,
                                                                                            "height":15
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"_DecoratePanel_BasicDelayButton4",
                                                                                    "events":{"click":"___DecoratePanel_BasicDelayButton4_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "x":38,
                                                                                            "y":277
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"_DecoratePanel_BasicDelayButton5",
                                                                                    "events":{"click":"___DecoratePanel_BasicDelayButton5_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "x":151,
                                                                                            "y":277
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
                                                                this.left = "0";
                                                                this.right = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"CanvasBorder",
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "width":265,
                                                                                "height":310,
                                                                                "y":6,
                                                                                "x":5,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label65",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 14;
                                                                                        this.color = 0xFFFF00;
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":105.5,
                                                                                            "y":13
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"StandardTitle",
                                                                                            "mouseEnabled":false,
                                                                                            "y":15,
                                                                                            "width":128,
                                                                                            "mouseChildren":false,
                                                                                            "height":16
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":220,
                                                                                            "y":34,
                                                                                            "x":22.5,
                                                                                            "height":2
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label66",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":43.5,
                                                                                            "y":39
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label67",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":154,
                                                                                            "y":39
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":MysTreBag,
                                                                                    "id":"mysTreBag",
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":21,
                                                                                            "y":59,
                                                                                            "clickCall":updateResolveSil
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
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "width":270,
                                                                                "height":310,
                                                                                "x":278,
                                                                                "y":5,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label68",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 14;
                                                                                        this.color = 0xFFFF00;
                                                                                        this.textAlign = "center";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":105.5,
                                                                                            "y":13
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Canvas,
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"StandardTitle",
                                                                                            "mouseEnabled":false,
                                                                                            "y":15,
                                                                                            "width":128,
                                                                                            "mouseChildren":false,
                                                                                            "height":16
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":220,
                                                                                            "y":34,
                                                                                            "x":22.5,
                                                                                            "height":2
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label69",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":43.5,
                                                                                            "y":39
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label70",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFF00;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":22.5,
                                                                                            "y":67
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label71",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFF00;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":43.5,
                                                                                            "y":98
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"mysSilNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":116.5,
                                                                                            "y":98
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label73",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":43.5,
                                                                                            "y":118
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label74",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":43.5,
                                                                                            "y":138
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicDelayButton,
                                                                                    "id":"_DecoratePanel_BasicDelayButton6",
                                                                                    "events":{"click":"___DecoratePanel_BasicDelayButton6_click"},
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.horizontalCenter = "0";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "y":166,
                                                                                            "width":60
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":HRule,
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":220,
                                                                                            "y":198,
                                                                                            "x":22.5,
                                                                                            "height":1
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"_DecoratePanel_Label75",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFF00;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":43.5,
                                                                                            "y":207
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":Label,
                                                                                    "id":"hasMysSilNum",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.fontSize = 12;
                                                                                        this.color = 0xFFFF;
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "x":143.5,
                                                                                            "y":207
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"_DecoratePanel_BasicGlowButton4",
                                                                                    "events":{"click":"___DecoratePanel_BasicGlowButton4_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "x":43.5,
                                                                                            "y":0x0101
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"_DecoratePanel_BasicGlowButton5",
                                                                                    "events":{"click":"___DecoratePanel_BasicGlowButton5_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "x":114.5,
                                                                                            "y":0x0101
                                                                                        });
                                                                                    }
                                                                                }), new UIComponentDescriptor({
                                                                                    "type":BasicGlowButton,
                                                                                    "id":"_DecoratePanel_BasicGlowButton6",
                                                                                    "events":{"click":"___DecoratePanel_BasicGlowButton6_click"},
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "styleName":"BtnStdGreen",
                                                                                            "x":184.5,
                                                                                            "y":0x0101
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
                                                                this.left = "0";
                                                                this.right = "0";
                                                                this.top = "0";
                                                                this.bottom = "0";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"CanvasBorder",
                                                                    "verticalScrollPolicy":"off",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Canvas,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "styleName":"CanvasBorder",
                                                                                "width":320,
                                                                                "height":310,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "y":8,
                                                                                "x":5,
                                                                                "clipContent":false,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":Tree,
                                                                                    "id":"illustrateTree",
                                                                                    "stylesFactory":function ():void
                                                                                    {
                                                                                        this.backgroundAlpha = 0;
                                                                                        this.horizontalCenter = "0";
                                                                                        this.borderStyle = "none";
                                                                                    },
                                                                                    "propertiesFactory":function ():Object
                                                                                    {
                                                                                        return ({
                                                                                            "width":299,
                                                                                            "height":288,
                                                                                            "y":10,
                                                                                            "styleName":"TreeGeneral",
                                                                                            "itemRenderer":_DecoratePanel_ClassFactory1_c()
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
                                                                                "width":215,
                                                                                "height":310,
                                                                                "x":331,
                                                                                "verticalScrollPolicy":"off",
                                                                                "horizontalScrollPolicy":"off",
                                                                                "y":8,
                                                                                "clipContent":false,
                                                                                "childDescriptors":[new UIComponentDescriptor({
                                                                                    "type":RuneChipBag,
                                                                                    "id":"runeChipBag"
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
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _dm:DataManager = DataManager.getInstance();
        private const LEVEL_ICONCODE_1:Array = [4130220000532, 4130220000533, 4130220000534, 4130220000535, 4130220000536, 4130220000537];
        private const LEVEL_ICONCODE_3:Array = [4130220000538, 4130220000539, 4130220000540, 4130220000541, 4130220000542, 4130220000543];
        private const LEVEL_ICONCODE_2:Array = [4130220000545, 4130220000546, 4130220000547, 4130220000548, 4130220000549, 4130220000550];
        private const LEVEL_ICONCODE_4:Array = [4130220000551, 4130220000552, 4130220000553, 4130220000554, 4130220000555, 4130220000556];
        private const LEVEL_COLOR_CODE:Array = [4130220000566, 4130220000567, 4130220000568, 4130220000569, 4130220000570];
        private const MYS_TRE_ADD_TIMES_GOLD:Array = [[5, 20], [10, 30], [15, 40], [20, 50], [25, 60], [40, 70]];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function DecoratePanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 440;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___DecoratePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            DecoratePanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get lightCb():CheckBox
        {
            return (this._170545173lightCb);
        }

        [Bindable(event="propertyChange")]
        public function get resolveMysSil():Number
        {
            return (this._439996389resolveMysSil);
        }

        private function turnHandler(_arg_1:Boolean):void
        {
            if (((!(_showView)) || (!(_showView.gameObject))))
            {
                return;
            };
            var _local_2:* = _showView.gameObject;
            if (_arg_1)
            {
                _local_2.dir++;
            }
            else
            {
                _local_2.dir--;
            };
            _local_2.dir = ((_local_2.dir + 8) % 8);
            _local_2.posDir = _local_2.dir;
            ((_showView) && (_showView.faceTo(_local_2.dir)));
        }

        public function __footCb_click(_arg_1:MouseEvent):void
        {
            hideDecoShow(3);
        }

        public function set mysTreBag(_arg_1:MysTreBag):void
        {
            var _local_2:Object;
            _local_2 = this._1815441400mysTreBag;
            if (_local_2 !== _arg_1)
            {
                this._1815441400mysTreBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreBag", _local_2, _arg_1));
            };
        }

        public function __showBag_click(_arg_1:MouseEvent):void
        {
            changeBagVis();
        }

        [Bindable(event="propertyChange")]
        public function get mysTreBag():MysTreBag
        {
            return (this._1815441400mysTreBag);
        }

        public function set resolveMysSil(_arg_1:Number):void
        {
            var _local_2:Object;
            _local_2 = this._439996389resolveMysSil;
            if (_local_2 !== _arg_1)
            {
                this._439996389resolveMysSil = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "resolveMysSil", _local_2, _arg_1));
            };
        }

        public function set lightCb(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._170545173lightCb;
            if (_local_2 !== _arg_1)
            {
                this._170545173lightCb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightCb", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get lightSlot():Slot
        {
            return (this._685643828lightSlot);
        }

        public function updatePageFour():void
        {
            ditu4.source = (ditu3.source = ResManager.getIconUrl(4130220000562));
            _core.remote.call("onGetMysBookData", new Responder(updateMysTreBook));
            _core.remote.call("onGetMysMakeData", new Responder(updateMysMakeCan));
            _core.remote.call("onGetMakeLimitTimes", new Responder(updateLimitMakeTimes));
            _core.remote.call("onGetMysBagData", new Responder(updateMysBagPanel));
            _core.remote.call("onGetChipBagData", new Responder(updateMysChipBagPanel));
        }

        public function updatePageOne():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:int;
            ditu1.source = ResManager.getIconUrl(4130220000561);
            name1.source = ResManager.getIconUrl(4130220000557);
            name2.source = ResManager.getIconUrl(4130220000558);
            name3.source = ResManager.getIconUrl(4130220000559);
            name4.source = ResManager.getIconUrl(4130220000560);
            _local_1 = _core.player.decoInfo;
            for (_local_2 in _local_1)
            {
                updateDecoShow(Number(_local_1[_local_2]["did"]));
            };
            _local_1 = _core.player.decoInfo;
            for (_local_3 in _local_1)
            {
                switch (Number(_local_1[_local_3]["position"]))
                {
                    case 1:
                        headSlot.clean();
                        headSlot.slotData = _local_1[_local_3];
                        headSlot.type = GamePredef.TBL_DECO_SHOW;
                        headSlot.giid = _local_1[_local_3].did;
                        headCb.selected = ((Number(_local_1[_local_3]["isShow"])) ? true : false);
                        break;
                    case 2:
                        lightSlot.clean();
                        lightSlot.slotData = _local_1[_local_3];
                        lightSlot.type = GamePredef.TBL_DECO_SHOW;
                        lightSlot.giid = _local_1[_local_3].did;
                        lightCb.selected = ((Number(_local_1[_local_3]["isShow"])) ? true : false);
                        break;
                    case 3:
                        footSlot.clean();
                        footSlot.slotData = _local_1[_local_3];
                        footSlot.type = GamePredef.TBL_DECO_SHOW;
                        footSlot.giid = _local_1[_local_3].did;
                        footCb.selected = ((Number(_local_1[_local_3]["isShow"])) ? true : false);
                        break;
                    case 4:
                        bottomSlot.clean();
                        bottomSlot.slotData = _local_1[_local_3];
                        bottomSlot.type = GamePredef.TBL_DECO_SHOW;
                        bottomSlot.giid = _local_1[_local_3].did;
                        bottomCb.selected = ((Number(_local_1[_local_3]["isShow"])) ? true : false);
                        break;
                };
            };
            _local_4 = 1;
            while (_local_4 <= 4)
            {
                _local_6 = _core.player.decoInfo[_local_4];
                _local_7 = _local_6["hid"];
                _local_8 = int(GameData.d[GamePredef.TBL_DECO_HOLE][_local_7]["level"]);
                if (_local_8 < 30)
                {
                    (this[("headSel" + _local_4)] as ComboBox).dataProvider = new ArrayCollection([{"label":"Lv1"}]);
                }
                else
                {
                    if (((_local_8 >= 30) && (_local_8 < 50)))
                    {
                        (this[("headSel" + _local_4)] as ComboBox).dataProvider = new ArrayCollection([{"label":"Lv1"}, {"label":"Lv2"}]);
                    }
                    else
                    {
                        if (_local_8 >= 50)
                        {
                            (this[("headSel" + _local_4)] as ComboBox).dataProvider = new ArrayCollection([{"label":"Lv1"}, {"label":"Lv2"}, {"label":"Lv3"}]);
                        };
                    };
                };
                _local_4++;
            };
            headSel1.selectedIndex = (Number(_local_1[1]["showLvl"]) - 1);
            headSel2.selectedIndex = (Number(_local_1[2]["showLvl"]) - 1);
            headSel3.selectedIndex = (Number(_local_1[3]["showLvl"]) - 1);
            headSel4.selectedIndex = (Number(_local_1[4]["showLvl"]) - 1);
            if (!suitRefreshFlag)
            {
                _core.remote.call("getDecoSuitProp", new Responder(onUpdateSuitProp), 2, 1, 1);
            };
            var _local_5:int;
            while (_local_5 < 5)
            {
                (this[("decoDis" + _local_5)] as DecorateDisplay).updateView();
                _local_5++;
            };
        }

        public function set showProp1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1917234127showProp1;
            if (_local_2 !== _arg_1)
            {
                this._1917234127showProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showProp1", _local_2, _arg_1));
            };
        }

        public function set showProp2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1917234126showProp2;
            if (_local_2 !== _arg_1)
            {
                this._1917234126showProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showProp2", _local_2, _arg_1));
            };
        }

        public function set petRunePropBox(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._1072419793petRunePropBox;
            if (_local_2 !== _arg_1)
            {
                this._1072419793petRunePropBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petRunePropBox", _local_2, _arg_1));
            };
        }

        public function set showProp3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1917234125showProp3;
            if (_local_2 !== _arg_1)
            {
                this._1917234125showProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showProp3", _local_2, _arg_1));
            };
        }

        public function set lightSlot(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._685643828lightSlot;
            if (_local_2 !== _arg_1)
            {
                this._685643828lightSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightSlot", _local_2, _arg_1));
            };
        }

        public function __viewStack_change(_arg_1:IndexChangedEvent):void
        {
            indexChange();
        }

        public function set showProp4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1917234124showProp4;
            if (_local_2 !== _arg_1)
            {
                this._1917234124showProp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showProp4", _local_2, _arg_1));
            };
        }

        public function set skillPt(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2147320885skillPt;
            if (_local_2 !== _arg_1)
            {
                this._2147320885skillPt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skillPt", _local_2, _arg_1));
            };
        }

        public function ___DecoratePanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            addLimitMakeTimes();
        }

        [Bindable(event="propertyChange")]
        public function get limitMakeTimesLabel():Label
        {
            return (this._395995255limitMakeTimesLabel);
        }

        public function __mysTreButton10_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(10);
        }

        [Bindable(event="propertyChange")]
        public function get curLvlProp4():Label
        {
            return (this._912007311curLvlProp4);
        }

        [Bindable(event="propertyChange")]
        public function get curLvlProp1():Label
        {
            return (this._912007308curLvlProp1);
        }

        [Bindable(event="propertyChange")]
        public function get curLvlProp3():Label
        {
            return (this._912007310curLvlProp3);
        }

        private function viewStackComp():void
        {
            viewStack.parent.setChildIndex(viewStack, 0);
        }

        [Bindable(event="propertyChange")]
        public function get curLvlProp2():Label
        {
            return (this._912007309curLvlProp2);
        }

        [Bindable(event="propertyChange")]
        public function get pageTabRuneUplvl():HButtonTab
        {
            return (this._1896896345pageTabRuneUplvl);
        }

        public function __mysTreButton1_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(1);
        }

        [Bindable(event="propertyChange")]
        public function get runeSetDitu():Image
        {
            return (this._2116585646runeSetDitu);
        }

        [Bindable(event="propertyChange")]
        public function get viewStackRune():ViewStack
        {
            return (this._1125079229viewStackRune);
        }

        public function __bottomCb_click(_arg_1:MouseEvent):void
        {
            hideDecoShow(4);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow2():MysTreShow
        {
            return (this._866543403mysTreShow2);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow3():MysTreShow
        {
            return (this._866543402mysTreShow3);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow4():MysTreShow
        {
            return (this._866543401mysTreShow4);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow5():MysTreShow
        {
            return (this._866543400mysTreShow5);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow6():MysTreShow
        {
            return (this._866543399mysTreShow6);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow7():MysTreShow
        {
            return (this._866543398mysTreShow7);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow8():MysTreShow
        {
            return (this._866543397mysTreShow8);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow9():MysTreShow
        {
            return (this._866543396mysTreShow9);
        }

        public function set limitMakeTimesLabel(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._395995255limitMakeTimesLabel;
            if (_local_2 !== _arg_1)
            {
                this._395995255limitMakeTimesLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitMakeTimesLabel", _local_2, _arg_1));
            };
        }

        public function set hunqi1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1206094728hunqi1;
            if (_local_2 !== _arg_1)
            {
                this._1206094728hunqi1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hunqi1", _local_2, _arg_1));
            };
        }

        public function set hunqi2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1206094727hunqi2;
            if (_local_2 !== _arg_1)
            {
                this._1206094727hunqi2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hunqi2", _local_2, _arg_1));
            };
        }

        public function updateResolveSil():void
        {
            var _local_1:*;
            var _local_2:Object;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:int;
            mysItemDic = mysTreBag.itemDic;
            resolveMysSil = 0;
            if (!ToolKit.isEmptyObject(mysItemDic))
            {
                for (_local_1 in mysItemDic)
                {
                    _local_2 = mysItemDic[_local_1];
                    _local_3 = _local_2["mid"];
                    _local_4 = _local_2["num"];
                    _local_5 = GameData.d[GamePredef.TBL_MYSTRE][_local_3];
                    _local_6 = _local_5["mysSil"];
                    resolveMysSil = (resolveMysSil + (_local_6 * _local_4));
                };
            }
            else
            {
                resolveMysSil = 0;
            };
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot2():RuneSlot
        {
            return (this._1071609612HoleSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot3():RuneSlot
        {
            return (this._1071609611HoleSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot4():RuneSlot
        {
            return (this._1071609610HoleSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot5():RuneSlot
        {
            return (this._1071609609HoleSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot6():RuneSlot
        {
            return (this._1071609608HoleSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot7():RuneSlot
        {
            return (this._1071609607HoleSlot7);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot8():RuneSlot
        {
            return (this._1071609606HoleSlot8);
        }

        public function set hunqi4(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1206094725hunqi4;
            if (_local_2 !== _arg_1)
            {
                this._1206094725hunqi4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hunqi4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow1():MysTreShow
        {
            return (this._866543404mysTreShow1);
        }

        public function set decoTitleLb(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._11953281decoTitleLb;
            if (_local_2 !== _arg_1)
            {
                this._11953281decoTitleLb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoTitleLb", _local_2, _arg_1));
            };
        }

        public function set hunqi3(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1206094726hunqi3;
            if (_local_2 !== _arg_1)
            {
                this._1206094726hunqi3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hunqi3", _local_2, _arg_1));
            };
        }

        public function set hasMysSilNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1356668029hasMysSilNum;
            if (_local_2 !== _arg_1)
            {
                this._1356668029hasMysSilNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hasMysSilNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot9():RuneSlot
        {
            return (this._1071609605HoleSlot9);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot1():RuneSlot
        {
            return (this._1071609613HoleSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get illustrateTree():Tree
        {
            return (this._1813919509illustrateTree);
        }

        public function __mysTreButton6_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(6);
        }

        public function set hasRuneExp(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._712098679hasRuneExp;
            if (_local_2 !== _arg_1)
            {
                this._712098679hasRuneExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hasRuneExp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get eTitle():BasicTitleCanvas
        {
            return (this._1322604301eTitle);
        }

        [Bindable(event="propertyChange")]
        public function get headSel1():ComboBox
        {
            return (this._1115807465headSel1);
        }

        [Bindable(event="propertyChange")]
        public function get headSel3():ComboBox
        {
            return (this._1115807463headSel3);
        }

        public function putMaterialIn():void
        {
            var _local_3:Slot;
            var _local_4:Object;
            var _local_5:Slot;
            var _local_6:Object;
            var _local_7:Number;
            var _local_8:Object;
            if (!_dm.sInited)
            {
                return;
            };
            var _local_1:Object = _dm.sList;
            var _local_2:int = 1;
            while (_local_2 <= 6)
            {
                _local_3 = (this[("needMatSlot" + _local_2)] as Slot);
                _local_4 = GameData.d[GamePredef.TBL_MYSTRE_RECIPE][_selectRecipe];
                _local_5 = (this[("putMatSlot" + _local_2)] as Slot);
                _local_5.clean();
                for each (_local_6 in _local_1)
                {
                    if ((((_local_6) && (ToolKit.isBigThan(_local_6.sid, GamePredef.SLOT_SID_BAG[0]))) && (ToolKit.isSmallOrEqual(_local_6.sid, GamePredef.SLOT_SID_BAG[7]))))
                    {
                        if (ToolKit.isEqual(_local_6.type, GamePredef.TBL_ITEM_INSTANCE))
                        {
                            _local_7 = Number(_local_6.itemId);
                            _local_8 = GameData.d[GamePredef.TBL_ITEM_INSTANCE][_local_7];
                            if ((((_local_8["tid"] == _local_3.giid) && (_local_8["color"] == _local_3.quality)) && (ToolKit.isBigOrEqual(_local_6.stackNum, _local_3.stackNum))))
                            {
                                _local_5.slotData = _local_6;
                                _local_5.type = GamePredef.TBL_ITEM_TEMPLATE;
                                _local_5.quality = _local_3.quality;
                                _local_5.giid = _local_3.giid;
                                _local_5.stackNum = _local_3.stackNum;
                            };
                        };
                    };
                };
                _local_2++;
            };
        }

        public function set curLvlProp1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._912007308curLvlProp1;
            if (_local_2 !== _arg_1)
            {
                this._912007308curLvlProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLvlProp1", _local_2, _arg_1));
            };
        }

        public function set curLvlProp3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._912007310curLvlProp3;
            if (_local_2 !== _arg_1)
            {
                this._912007310curLvlProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLvlProp3", _local_2, _arg_1));
            };
        }

        public function set chaRunePropBox(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._2127905646chaRunePropBox;
            if (_local_2 !== _arg_1)
            {
                this._2127905646chaRunePropBox = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chaRunePropBox", _local_2, _arg_1));
            };
        }

        private function btnClickHandler(_arg_1:int):void
        {
            (mysDisplay as ViewStack).selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= MAX_MYS_KIND)
            {
                if (_local_2 == _arg_1)
                {
                    this[("mysTreButton" + _local_2)].styleName = "BtnMysTreasureSelected";
                }
                else
                {
                    if (this[("mysTreButton" + _local_2)].styleName == "BtnMysTreasureSelected")
                    {
                        this[("mysTreButton" + _local_2)].styleName = "BtnMysTreasure";
                    };
                };
                _local_2++;
            };
        }

        public function set curLvlProp2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._912007309curLvlProp2;
            if (_local_2 !== _arg_1)
            {
                this._912007309curLvlProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLvlProp2", _local_2, _arg_1));
            };
        }

        public function set curLvlProp4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._912007311curLvlProp4;
            if (_local_2 !== _arg_1)
            {
                this._912007311curLvlProp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "curLvlProp4", _local_2, _arg_1));
            };
        }

        public function ___DecoratePanel_Button1_click(_arg_1:MouseEvent):void
        {
            turnHandler(false);
        }

        private function updateDecoShow(_arg_1:Number):void
        {
            var _local_3:Object;
            var _local_7:Object;
            var _local_8:int;
            if (!_showView)
            {
                _showView = new CreatureShowView();
                _showView.y = -80;
                _showView.decoFlag = true;
                _local_7 = ObjectUtil.copy(_core.player);
                _local_7.wp = -1;
                _local_7.name = "";
                _local_7.wingResCode = -1;
                _local_7.doubleFly = false;
                _local_7.dir = 0;
                _local_7.posDir = 0;
                _local_7.flyingState = GamePredef.FLYING_STATE_ON_GROUND;
                _local_7.mountState = GamePredef.MOUNT_STATE_OFF;
                _showView.gameObject = _local_7;
                viewHolder.addChild(_showView);
            };
            if (_arg_1 == 0)
            {
                return;
            };
            var _local_2:* = GameData.d[GamePredef.TBL_DECO_SHOW][_arg_1];
            _local_3 = _core.player.decoInfo;
            switch (Number(_local_2["position"]))
            {
                case 1:
                    _local_8 = _local_3[1]["showLvl"];
                    _showView.setDecoHeadRes(_local_2[("resCode" + ((2 * _local_8) - 1))]);
                    break;
                case 2:
                    _local_8 = _local_3[2]["showLvl"];
                    _showView.setDecoLightRes(_local_2[("resCode" + ((2 * _local_8) - 1))]);
                    _showView.setDecoLightMaskRes(_local_2[("resCode" + (2 * _local_8))]);
                    break;
                case 4:
                    _local_8 = _local_3[4]["showLvl"];
                    _showView.setDecoBottomRes(_local_2[("resCode" + ((2 * _local_8) - 1))]);
                    break;
            };
            var _local_4:int = int(_local_2["suitId"]);
            var _local_5:int = int(_local_2["linkSuitId"]);
            var _local_6:int = int(_local_2["linkId"]);
            _core.remote.call("getDecoSuitProp", new Responder(onUpdateSuitProp), _local_4, _local_5, _local_6);
        }

        public function __makeLabel4_click(_arg_1:MouseEvent):void
        {
            mysTreMakeClickHandler(4);
        }

        public function onRuneBagUpdate(_arg_1:Object=null):void
        {
            var _local_4:Object;
            ditu3.source = ResManager.getIconUrl(4130220000562);
            runeUp.source = ResManager.getIconUrl(4130220000565);
            if (!_arg_1)
            {
                return;
            };
            if (runeBag)
            {
                (runeBag as RuneBagComb).update();
            };
            (runeBagCha as RuneClickBag).update();
            (runeBagPet as RuneClickBag).update();
            (runeBagChaUp as RuneBagUpLvl).update();
            (runeBagPetUp as RuneBagUpLvl).update();
            upLvlSlot.clean();
            var _local_2:Number = _arg_1["upLvlHole"];
            if (_local_2)
            {
                _local_4 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_2];
                upLvlSlot.slotData = _local_4;
                upLvlSlot.type = GamePredef.TBL_DECO_RUNE;
                upLvlSlot.giid = _local_2;
            };
            var _local_3:Number = ((_local_2) ? _local_4["upExp"] : 0);
            upLvlExp.text = Language.DECORATE_PANEL[45].toString().replace("{num}", _local_3);
        }

        public function getNewDelay():Number
        {
            var _local_4:*;
            var _local_5:Number;
            var _local_1:Number = Number.MAX_VALUE;
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = (_local_2 + _core.timeLag);
            if (_dueObj)
            {
                for (_local_4 in _dueObj)
                {
                    _local_5 = _dueObj[_local_4];
                    if (_local_5 > _local_3)
                    {
                        if (_local_5 < _local_1)
                        {
                            _local_1 = _local_5;
                        };
                    };
                };
            };
            if ((_local_1 - _local_3) > ((60 * 60) * 1000))
            {
                return ((60 * 60) * 1000);
            };
            return (_local_1 - _local_3);
        }

        [Bindable(event="propertyChange")]
        public function get headSel2():ComboBox
        {
            return (this._1115807464headSel2);
        }

        [Bindable(event="propertyChange")]
        public function get listShowCbx():CheckBox
        {
            return (this._1915647682listShowCbx);
        }

        public function ___DecoratePanel_Canvas5_click(_arg_1:MouseEvent):void
        {
            setSelectedPosition(1);
        }

        public function ___DecoratePanel_BasicGlowButton6_click(_arg_1:MouseEvent):void
        {
            changToOtherTab(2);
        }

        public function set nameImage2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._1041132382nameImage2;
            if (_local_2 !== _arg_1)
            {
                this._1041132382nameImage2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameImage2", _local_2, _arg_1));
            };
        }

        private function refreshDecoShow(_arg_1:Event):void
        {
            var _local_4:Object;
            var _local_5:*;
            var _local_6:Number;
            var _local_7:int;
            var _local_8:Object;
            var _local_9:int;
            var _local_2:Number = new Date().getTime();
            var _local_3:Number = (_local_2 + _core.timeLag);
            if (_dueObj)
            {
                _local_4 = {};
                for (_local_5 in _dueObj)
                {
                    _local_6 = _dueObj[_local_5];
                    if (_local_6 > 1)
                    {
                        if (_local_6 < _local_3)
                        {
                            _local_7 = int(_local_5);
                            trace(("到期的形象id>>>>>>>>>>" + _local_7));
                            _local_8 = GameData.d[GamePredef.TBL_DECO_SHOW][_local_7];
                            _local_9 = _local_8["position"];
                            if (!_local_4[_local_9])
                            {
                                _local_4[_local_9] = {};
                            };
                            _local_4[_local_9][_local_7] = _local_7;
                        };
                    };
                };
                _core.remote.call("updateActiveDecoShow", new Responder(updateDecoInfo), _local_4);
            };
            resetDecoTimer();
        }

        public function set putMatSlot2(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._223261859putMatSlot2;
            if (_local_2 !== _arg_1)
            {
                this._223261859putMatSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "putMatSlot2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get headSel4():ComboBox
        {
            return (this._1115807462headSel4);
        }

        public function set putMatSlot3(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._223261860putMatSlot3;
            if (_local_2 !== _arg_1)
            {
                this._223261860putMatSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "putMatSlot3", _local_2, _arg_1));
            };
        }

        public function set putMatSlot4(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._223261861putMatSlot4;
            if (_local_2 !== _arg_1)
            {
                this._223261861putMatSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "putMatSlot4", _local_2, _arg_1));
            };
        }

        public function set putMatSlot1(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._223261858putMatSlot1;
            if (_local_2 !== _arg_1)
            {
                this._223261858putMatSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "putMatSlot1", _local_2, _arg_1));
            };
        }

        public function set putMatSlot5(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._223261862putMatSlot5;
            if (_local_2 !== _arg_1)
            {
                this._223261862putMatSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "putMatSlot5", _local_2, _arg_1));
            };
        }

        public function set pageTabRuneUplvl(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._1896896345pageTabRuneUplvl;
            if (_local_2 !== _arg_1)
            {
                this._1896896345pageTabRuneUplvl = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabRuneUplvl", _local_2, _arg_1));
            };
        }

        public function set putMatSlot6(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._223261863putMatSlot6;
            if (_local_2 !== _arg_1)
            {
                this._223261863putMatSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "putMatSlot6", _local_2, _arg_1));
            };
        }

        public function set runeSetDitu(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._2116585646runeSetDitu;
            if (_local_2 !== _arg_1)
            {
                this._2116585646runeSetDitu = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeSetDitu", _local_2, _arg_1));
            };
        }

        private function setSelectedPosition(_arg_1:int):void
        {
            var _local_9:*;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:RuneSlot;
            var _local_13:int;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            _selectedDecoHole = _arg_1;
            var _local_2:Object = _core.player.decoInfo;
            var _local_3:Object = _local_2[_arg_1];
            var _local_4:Object = GameData.d[GamePredef.TBL_DECO_HOLE][Number(_local_3["hid"])];
            var _local_5:Number = _local_4["level"];
            if (_local_5 >= 10)
            {
                guangquan.source = ResManager.getIconUrl(LEVEL_COLOR_CODE[(Math.floor((_local_5 / 10)) - 1)]);
            }
            else
            {
                guangquan.source = null;
            };
            decoTitleLb.text = (((Language.DECORATE_PANEL[6][(_arg_1 - 1)] + "(Lv") + _local_4["level"]) + ")");
            decoHoleProp1.text = ((Language.DECORATE_PANEL[22] + "+") + _local_4["propNum1"]);
            decoHoleProp2.text = ((Language.DECORATE_PANEL[24] + "+") + _local_4["propNum2"]);
            decoHoleProp3.text = ((Language.DECORATE_PANEL[25] + "+") + _local_4["propNum3"]);
            decoHoleProp4.text = ((Language.DECORATE_PANEL[23] + "+") + _local_4["propNum4"]);
            curLvlProp1.text = ((Language.DECORATE_PANEL[22] + "+") + _local_4["propNum1"]);
            curLvlProp2.text = ((Language.DECORATE_PANEL[24] + "+") + _local_4["propNum2"]);
            curLvlProp3.text = ((Language.DECORATE_PANEL[25] + "+") + _local_4["propNum3"]);
            curLvlProp4.text = ((Language.DECORATE_PANEL[23] + "+") + _local_4["propNum4"]);
            if (ToolKit.isBigOrEqual(_local_4["level"], 50))
            {
                maxLvlInfo.visible = true;
                nexLvlProp1.visible = false;
                nexLvlProp2.visible = false;
                nexLvlProp3.visible = false;
                nexLvlProp4.visible = false;
            }
            else
            {
                maxLvlInfo.visible = false;
                _local_10 = int(_local_4["nextId"]);
                _local_11 = GameData.d[GamePredef.TBL_DECO_HOLE][_local_10];
                nexLvlProp1.text = ((Language.DECORATE_PANEL[22] + "+") + _local_11["propNum1"]);
                nexLvlProp2.text = ((Language.DECORATE_PANEL[24] + "+") + _local_11["propNum2"]);
                nexLvlProp3.text = ((Language.DECORATE_PANEL[25] + "+") + _local_11["propNum3"]);
                nexLvlProp4.text = ((Language.DECORATE_PANEL[23] + "+") + _local_11["propNum4"]);
                nexLvlProp1.visible = true;
                nexLvlProp2.visible = true;
                nexLvlProp3.visible = true;
                nexLvlProp4.visible = true;
            };
            needSilver.text = (Language.DECORATE_PANEL[27] + _local_4["costNum"]);
            needBindSil.text = (Language.DECORATE_PANEL[28] + _local_4["costSil"]);
            succRate.text = ((Language.DECORATE_PANEL[29] + _local_4["rate"]) + "%");
            var _local_6:Object = _core.view.getUI(ViewManager.MAIN_LONGBUFF);
            if (((_local_6) && (_local_6.isBuffOn(3264))))
            {
                succRate.text = (succRate.text + " +10%");
            }
            else
            {
                if (_core.MC_BIRTH_FLAG[22])
                {
                    succRate.text = (succRate.text + ((" +" + GamePredef.MC_BIRTH_CONFIG[22]) + "%"));
                };
            };
            updateDecoRuneProp(1);
            updateDecoRuneProp(2);
            var _local_7:Object = com.adobe.serialization.json.JSON.decode(JSONUtil.JSONfy(_local_3.activeFlag));
            var _local_8:Object = _local_7["r"];
            for (_local_9 in _local_8)
            {
                this[("HoleSlot" + (_local_9 + 1))].clean();
                this[("HoleSlot" + (_local_9 + 1))].decoPosition = _selectedDecoHole;
                if (Number(_local_8[_local_9]))
                {
                    _local_12 = (this[("HoleSlot" + (_local_9 + 1))] as RuneSlot);
                    _local_12.toolTip = null;
                    _local_12.styleName = "SoulSlotOpen";
                    if (_local_12.slotType == Slot.SLOT_RUNE_CHA_HOLE)
                    {
                        _local_13 = _local_12.runeChaHolePos;
                        _local_14 = _local_3[("r" + _local_13)];
                        _local_12.slotData = GameData.d[GamePredef.TBL_DECO_RUNE][_local_14];
                        _local_12.type = GamePredef.TBL_DECO_RUNE;
                        _local_12.giid = _local_14;
                    }
                    else
                    {
                        _local_15 = _local_12.runePetHolePos;
                        _local_16 = _local_3[("r" + _local_15)];
                        _local_12.slotData = GameData.d[GamePredef.TBL_DECO_RUNE][_local_16];
                        _local_12.type = GamePredef.TBL_DECO_RUNE;
                        _local_12.giid = _local_16;
                    };
                }
                else
                {
                    this[("HoleSlot" + (_local_9 + 1))].styleName = "SoulSlotClose";
                    switch ((_local_9 + 1))
                    {
                        case 1:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[66];
                            break;
                        case 2:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[66];
                            break;
                        case 3:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[67];
                            break;
                        case 4:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[67];
                            break;
                        case 5:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[68];
                            break;
                        case 6:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[68];
                            break;
                        case 7:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[69];
                            break;
                        case 8:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[69];
                            break;
                        case 9:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[70];
                            break;
                        case 10:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[70];
                            break;
                        case 11:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[71];
                            break;
                        case 12:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[71];
                            break;
                        case 13:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[72];
                            break;
                        case 14:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[72];
                            break;
                        case 15:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[73];
                            break;
                        case 16:
                            this[("HoleSlot" + (_local_9 + 1))].toolTip = Language.DECORATE_PANEL[73];
                            break;
                    };
                };
            };
        }

        private function _DecoratePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eTitle.text = _arg_1;
            }, "eTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabFirst.filters = _arg_1;
            }, "pageTabFirst.filters");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[1]);
            }, function (_arg_1:Array):void
            {
                pageTabFirst.dataArray = _arg_1;
            }, "pageTabFirst.dataArray");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabFirst.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStack.selectedIndex = _arg_1;
            }, "viewStack.selectedIndex");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label1.text = _arg_1;
            }, "_DecoratePanel_Label1.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label1.filters = _arg_1;
            }, "_DecoratePanel_Label1.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                propTitle.text = _arg_1;
            }, "propTitle.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                propTitle.filters = _arg_1;
            }, "propTitle.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(LEVEL_ICONCODE_1[0]));
            }, function (_arg_1:Object):void
            {
                _DecoratePanel_Image2.source = _arg_1;
            }, "_DecoratePanel_Image2.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(LEVEL_ICONCODE_2[0]));
            }, function (_arg_1:Object):void
            {
                _DecoratePanel_Image3.source = _arg_1;
            }, "_DecoratePanel_Image3.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(LEVEL_ICONCODE_3[0]));
            }, function (_arg_1:Object):void
            {
                _DecoratePanel_Image4.source = _arg_1;
            }, "_DecoratePanel_Image4.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(LEVEL_ICONCODE_4[0]));
            }, function (_arg_1:Object):void
            {
                _DecoratePanel_Image5.source = _arg_1;
            }, "_DecoratePanel_Image5.source");
            result[11] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                suitName.filters = _arg_1;
            }, "suitName.filters");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                showProp1.filters = _arg_1;
            }, "showProp1.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                showProp2.filters = _arg_1;
            }, "showProp2.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                showProp3.filters = _arg_1;
            }, "showProp3.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                showProp4.filters = _arg_1;
            }, "showProp4.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label8.filters = _arg_1;
            }, "_DecoratePanel_Label8.filters");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                suitProp0.filters = _arg_1;
            }, "suitProp0.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                suitProp1.filters = _arg_1;
            }, "suitProp1.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label11.filters = _arg_1;
            }, "_DecoratePanel_Label11.filters");
            result[20] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                linkProp.filters = _arg_1;
            }, "linkProp.filters");
            result[21] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabPos.filters = _arg_1;
            }, "pageTabPos.filters");
            result[22] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[3]);
            }, function (_arg_1:Array):void
            {
                pageTabPos.dataArray = _arg_1;
            }, "pageTabPos.dataArray");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabPos.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStackDeco.selectedIndex = _arg_1;
            }, "viewStackDeco.selectedIndex");
            result[24] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoTitleLb.filters = _arg_1;
            }, "decoTitleLb.filters");
            result[25] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoHoleProp1.filters = _arg_1;
            }, "decoHoleProp1.filters");
            result[26] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoHoleProp2.filters = _arg_1;
            }, "decoHoleProp2.filters");
            result[27] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoHoleProp3.filters = _arg_1;
            }, "decoHoleProp3.filters");
            result[28] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                decoHoleProp4.filters = _arg_1;
            }, "decoHoleProp4.filters");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label18.text = _arg_1;
            }, "_DecoratePanel_Label18.text");
            result[30] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label18.filters = _arg_1;
            }, "_DecoratePanel_Label18.filters");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label19.text = _arg_1;
            }, "_DecoratePanel_Label19.text");
            result[32] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label19.filters = _arg_1;
            }, "_DecoratePanel_Label19.filters");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label20.text = _arg_1;
            }, "_DecoratePanel_Label20.text");
            result[34] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label20.filters = _arg_1;
            }, "_DecoratePanel_Label20.filters");
            result[35] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curLvlProp1.filters = _arg_1;
            }, "curLvlProp1.filters");
            result[36] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curLvlProp2.filters = _arg_1;
            }, "curLvlProp2.filters");
            result[37] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curLvlProp3.filters = _arg_1;
            }, "curLvlProp3.filters");
            result[38] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                curLvlProp4.filters = _arg_1;
            }, "curLvlProp4.filters");
            result[39] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexLvlProp1.filters = _arg_1;
            }, "nexLvlProp1.filters");
            result[40] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexLvlProp2.filters = _arg_1;
            }, "nexLvlProp2.filters");
            result[41] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexLvlProp3.filters = _arg_1;
            }, "nexLvlProp3.filters");
            result[42] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                nexLvlProp4.filters = _arg_1;
            }, "nexLvlProp4.filters");
            result[43] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                maxLvlInfo.text = _arg_1;
            }, "maxLvlInfo.text");
            result[44] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                maxLvlInfo.filters = _arg_1;
            }, "maxLvlInfo.filters");
            result[45] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needSilver.filters = _arg_1;
            }, "needSilver.filters");
            result[46] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                needBindSil.filters = _arg_1;
            }, "needBindSil.filters");
            result[47] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                succRate.filters = _arg_1;
            }, "succRate.filters");
            result[48] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[35];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicDelayButton1.label = _arg_1;
            }, "_DecoratePanel_BasicDelayButton1.label");
            result[49] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DECORATE_PANEL[36];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicDelayButton2.label = _arg_1;
            }, "_DecoratePanel_BasicDelayButton2.label");
            result[50] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.DECORATE_PANEL[30] + _core.player.decoSilver);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hasSilver.text = _arg_1;
            }, "hasSilver.text");
            result[51] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                hasSilver.filters = _arg_1;
            }, "hasSilver.filters");
            result[52] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabRune.filters = _arg_1;
            }, "pageTabRune.filters");
            result[53] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[21]);
            }, function (_arg_1:Array):void
            {
                pageTabRune.dataArray = _arg_1;
            }, "pageTabRune.dataArray");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabRune.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStackRune.selectedIndex = _arg_1;
            }, "viewStackRune.selectedIndex");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot1.slotType = _arg_1;
            }, "HoleSlot1.slotType");
            result[56] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot3.slotType = _arg_1;
            }, "HoleSlot3.slotType");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot5.slotType = _arg_1;
            }, "HoleSlot5.slotType");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot7.slotType = _arg_1;
            }, "HoleSlot7.slotType");
            result[59] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot9.slotType = _arg_1;
            }, "HoleSlot9.slotType");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot11.slotType = _arg_1;
            }, "HoleSlot11.slotType");
            result[61] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot13.slotType = _arg_1;
            }, "HoleSlot13.slotType");
            result[62] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_CHA_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot15.slotType = _arg_1;
            }, "HoleSlot15.slotType");
            result[63] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label34.text = _arg_1;
            }, "_DecoratePanel_Label34.text");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot2.slotType = _arg_1;
            }, "HoleSlot2.slotType");
            result[65] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot4.slotType = _arg_1;
            }, "HoleSlot4.slotType");
            result[66] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot6.slotType = _arg_1;
            }, "HoleSlot6.slotType");
            result[67] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot8.slotType = _arg_1;
            }, "HoleSlot8.slotType");
            result[68] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot10.slotType = _arg_1;
            }, "HoleSlot10.slotType");
            result[69] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot12.slotType = _arg_1;
            }, "HoleSlot12.slotType");
            result[70] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot14.slotType = _arg_1;
            }, "HoleSlot14.slotType");
            result[71] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_PET_HOLE);
            }, function (_arg_1:int):void
            {
                HoleSlot16.slotType = _arg_1;
            }, "HoleSlot16.slotType");
            result[72] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label35.text = _arg_1;
            }, "_DecoratePanel_Label35.text");
            result[73] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabRuneAct.filters = _arg_1;
            }, "pageTabRuneAct.filters");
            result[74] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[47]);
            }, function (_arg_1:Array):void
            {
                pageTabRuneAct.dataArray = _arg_1;
            }, "pageTabRuneAct.dataArray");
            result[75] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabRuneAct.selectedIndex);
            }, function (_arg_1:int):void
            {
                viewStackRuneAct.selectedIndex = _arg_1;
            }, "viewStackRuneAct.selectedIndex");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_RUNE_UP);
            }, function (_arg_1:int):void
            {
                upLvlSlot.slotType = _arg_1;
            }, "upLvlSlot.slotType");
            result[77] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[43];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label36.text = _arg_1;
            }, "_DecoratePanel_Label36.text");
            result[78] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label36.filters = _arg_1;
            }, "_DecoratePanel_Label36.filters");
            result[79] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[44].toString().replace("{num}", _core.player.runeExp);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hasRuneExp.htmlText = _arg_1;
            }, "hasRuneExp.htmlText");
            result[80] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                hasRuneExp.filters = _arg_1;
            }, "hasRuneExp.filters");
            result[81] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                upLvlExp.filters = _arg_1;
            }, "upLvlExp.filters");
            result[82] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicGlowButton2.label = _arg_1;
            }, "_DecoratePanel_BasicGlowButton2.label");
            result[83] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabRuneUplvl.filters = _arg_1;
            }, "pageTabRuneUplvl.filters");
            result[84] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[33]);
            }, function (_arg_1:Array):void
            {
                pageTabRuneUplvl.dataArray = _arg_1;
            }, "pageTabRuneUplvl.dataArray");
            result[85] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabRuneUplvl.selectedIndex);
            }, function (_arg_1:int):void
            {
                _DecoratePanel_ViewStack5.selectedIndex = _arg_1;
            }, "_DecoratePanel_ViewStack5.selectedIndex");
            result[86] = binding;
            binding = new Binding(this, function ():uint
            {
                return (RuneBag.RUNE_CHAR_BAG);
            }, function (_arg_1:uint):void
            {
                runeBagChaUp.runeBagType = _arg_1;
            }, "runeBagChaUp.runeBagType");
            result[87] = binding;
            binding = new Binding(this, function ():uint
            {
                return (RuneBag.RUNE_PET_BAG);
            }, function (_arg_1:uint):void
            {
                runeBagPetUp.runeBagType = _arg_1;
            }, "runeBagPetUp.runeBagType");
            result[88] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabRuneResolve.filters = _arg_1;
            }, "pageTabRuneResolve.filters");
            result[89] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[33]);
            }, function (_arg_1:Array):void
            {
                pageTabRuneResolve.dataArray = _arg_1;
            }, "pageTabRuneResolve.dataArray");
            result[90] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabRuneResolve.selectedIndex);
            }, function (_arg_1:int):void
            {
                _DecoratePanel_ViewStack6.selectedIndex = _arg_1;
            }, "_DecoratePanel_ViewStack6.selectedIndex");
            result[91] = binding;
            binding = new Binding(this, function ():uint
            {
                return (RuneBag.RUNE_CHAR_BAG);
            }, function (_arg_1:uint):void
            {
                runeBagCha.runeBagType = _arg_1;
            }, "runeBagCha.runeBagType");
            result[92] = binding;
            binding = new Binding(this, function ():uint
            {
                return (RuneBag.RUNE_PET_BAG);
            }, function (_arg_1:uint):void
            {
                runeBagPet.runeBagType = _arg_1;
            }, "runeBagPet.runeBagType");
            result[93] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                pageTabMysTre.filters = _arg_1;
            }, "pageTabMysTre.filters");
            result[94] = binding;
            binding = new Binding(this, function ():Array
            {
                return (Language.DECORATE_PANEL[59]);
            }, function (_arg_1:Array):void
            {
                pageTabMysTre.dataArray = _arg_1;
            }, "pageTabMysTre.dataArray");
            result[95] = binding;
            binding = new Binding(this, function ():int
            {
                return (pageTabMysTre.selectedIndex);
            }, function (_arg_1:int):void
            {
                _DecoratePanel_ViewStack7.selectedIndex = _arg_1;
            }, "_DecoratePanel_ViewStack7.selectedIndex");
            result[96] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[83];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label39.text = _arg_1;
            }, "_DecoratePanel_Label39.text");
            result[97] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label39.filters = _arg_1;
            }, "_DecoratePanel_Label39.filters");
            result[98] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton0.label = _arg_1;
            }, "mysTreButton0.label");
            result[99] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton1.label = _arg_1;
            }, "mysTreButton1.label");
            result[100] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton2.label = _arg_1;
            }, "mysTreButton2.label");
            result[101] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton3.label = _arg_1;
            }, "mysTreButton3.label");
            result[102] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton4.label = _arg_1;
            }, "mysTreButton4.label");
            result[103] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton5.label = _arg_1;
            }, "mysTreButton5.label");
            result[104] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton6.label = _arg_1;
            }, "mysTreButton6.label");
            result[105] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton7.label = _arg_1;
            }, "mysTreButton7.label");
            result[106] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton8.label = _arg_1;
            }, "mysTreButton8.label");
            result[107] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton9.label = _arg_1;
            }, "mysTreButton9.label");
            result[108] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton10.label = _arg_1;
            }, "mysTreButton10.label");
            result[109] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysTreButton11.label = _arg_1;
            }, "mysTreButton11.label");
            result[110] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label40.text = _arg_1;
            }, "_DecoratePanel_Label40.text");
            result[111] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[85];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label41.text = _arg_1;
            }, "_DecoratePanel_Label41.text");
            result[112] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label42.text = _arg_1;
            }, "_DecoratePanel_Label42.text");
            result[113] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label43.text = _arg_1;
            }, "_DecoratePanel_Label43.text");
            result[114] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label44.text = _arg_1;
            }, "_DecoratePanel_Label44.text");
            result[115] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label45.text = _arg_1;
            }, "_DecoratePanel_Label45.text");
            result[116] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label46.text = _arg_1;
            }, "_DecoratePanel_Label46.text");
            result[117] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label47.text = _arg_1;
            }, "_DecoratePanel_Label47.text");
            result[118] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label48.text = _arg_1;
            }, "_DecoratePanel_Label48.text");
            result[119] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label49.text = _arg_1;
            }, "_DecoratePanel_Label49.text");
            result[120] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[86];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label50.text = _arg_1;
            }, "_DecoratePanel_Label50.text");
            result[121] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label51.text = _arg_1;
            }, "_DecoratePanel_Label51.text");
            result[122] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label52.text = _arg_1;
            }, "_DecoratePanel_Label52.text");
            result[123] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[84][11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label53.text = _arg_1;
            }, "_DecoratePanel_Label53.text");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[88];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label54.text = _arg_1;
            }, "_DecoratePanel_Label54.text");
            result[125] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label54.filters = _arg_1;
            }, "_DecoratePanel_Label54.filters");
            result[126] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[87][0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeLabel1.labelText = _arg_1;
            }, "makeLabel1.labelText");
            result[127] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[87][1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeLabel2.labelText = _arg_1;
            }, "makeLabel2.labelText");
            result[128] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[87][2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeLabel3.labelText = _arg_1;
            }, "makeLabel3.labelText");
            result[129] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[87][3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeLabel4.labelText = _arg_1;
            }, "makeLabel4.labelText");
            result[130] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[87][4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeLabel5.labelText = _arg_1;
            }, "makeLabel5.labelText");
            result[131] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[87][5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                makeLabel6.labelText = _arg_1;
            }, "makeLabel6.labelText");
            result[132] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[89];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label55.text = _arg_1;
            }, "_DecoratePanel_Label55.text");
            result[133] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[90];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label57.text = _arg_1;
            }, "_DecoratePanel_Label57.text");
            result[134] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label57.filters = _arg_1;
            }, "_DecoratePanel_Label57.filters");
            result[135] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[91];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label58.text = _arg_1;
            }, "_DecoratePanel_Label58.text");
            result[136] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[92];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label59.text = _arg_1;
            }, "_DecoratePanel_Label59.text");
            result[137] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[92];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label60.text = _arg_1;
            }, "_DecoratePanel_Label60.text");
            result[138] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MYSTRE);
            }, function (_arg_1:int):void
            {
                putMatSlot1.slotType = _arg_1;
            }, "putMatSlot1.slotType");
            result[139] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MYSTRE);
            }, function (_arg_1:int):void
            {
                putMatSlot2.slotType = _arg_1;
            }, "putMatSlot2.slotType");
            result[140] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MYSTRE);
            }, function (_arg_1:int):void
            {
                putMatSlot3.slotType = _arg_1;
            }, "putMatSlot3.slotType");
            result[141] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MYSTRE);
            }, function (_arg_1:int):void
            {
                putMatSlot4.slotType = _arg_1;
            }, "putMatSlot4.slotType");
            result[142] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MYSTRE);
            }, function (_arg_1:int):void
            {
                putMatSlot5.slotType = _arg_1;
            }, "putMatSlot5.slotType");
            result[143] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_MYSTRE);
            }, function (_arg_1:int):void
            {
                putMatSlot6.slotType = _arg_1;
            }, "putMatSlot6.slotType");
            result[144] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[93];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicGlowButton3.label = _arg_1;
            }, "_DecoratePanel_BasicGlowButton3.label");
            result[145] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[94];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label61.text = _arg_1;
            }, "_DecoratePanel_Label61.text");
            result[146] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[95];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label63.text = _arg_1;
            }, "_DecoratePanel_Label63.text");
            result[147] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = limitMakeTimes;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                limitMakeTimesLabel.text = _arg_1;
            }, "limitMakeTimesLabel.text");
            result[148] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[96];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicDelayButton4.label = _arg_1;
            }, "_DecoratePanel_BasicDelayButton4.label");
            result[149] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicDelayButton5.label = _arg_1;
            }, "_DecoratePanel_BasicDelayButton5.label");
            result[150] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[97];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label65.text = _arg_1;
            }, "_DecoratePanel_Label65.text");
            result[151] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label65.filters = _arg_1;
            }, "_DecoratePanel_Label65.filters");
            result[152] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[98];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label66.text = _arg_1;
            }, "_DecoratePanel_Label66.text");
            result[153] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[99];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label67.text = _arg_1;
            }, "_DecoratePanel_Label67.text");
            result[154] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[100];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label68.text = _arg_1;
            }, "_DecoratePanel_Label68.text");
            result[155] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _DecoratePanel_Label68.filters = _arg_1;
            }, "_DecoratePanel_Label68.filters");
            result[156] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[101];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label69.text = _arg_1;
            }, "_DecoratePanel_Label69.text");
            result[157] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[102];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label70.text = _arg_1;
            }, "_DecoratePanel_Label70.text");
            result[158] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[103];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label71.text = _arg_1;
            }, "_DecoratePanel_Label71.text");
            result[159] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = resolveMysSil;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mysSilNum.text = _arg_1;
            }, "mysSilNum.text");
            result[160] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[104];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label73.text = _arg_1;
            }, "_DecoratePanel_Label73.text");
            result[161] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[105];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label74.text = _arg_1;
            }, "_DecoratePanel_Label74.text");
            result[162] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[106];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicDelayButton6.label = _arg_1;
            }, "_DecoratePanel_BasicDelayButton6.label");
            result[163] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[107];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_Label75.text = _arg_1;
            }, "_DecoratePanel_Label75.text");
            result[164] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = _core.player.decoSilver;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hasMysSilNum.text = _arg_1;
            }, "hasMysSilNum.text");
            result[165] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[108];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicGlowButton4.label = _arg_1;
            }, "_DecoratePanel_BasicGlowButton4.label");
            result[166] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[109];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicGlowButton5.label = _arg_1;
            }, "_DecoratePanel_BasicGlowButton5.label");
            result[167] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:*;
                var _local_2:*;
                _local_1 = Language.DECORATE_PANEL[110];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _DecoratePanel_BasicGlowButton6.label = _arg_1;
            }, "_DecoratePanel_BasicGlowButton6.label");
            result[168] = binding;
            return (result);
        }

        public function set viewHolder(_arg_1:UIComponent):void
        {
            var _local_2:Object;
            _local_2 = this._2113119409viewHolder;
            if (_local_2 !== _arg_1)
            {
                this._2113119409viewHolder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewHolder", _local_2, _arg_1));
            };
        }

        public function set propTitle(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._738577227propTitle;
            if (_local_2 !== _arg_1)
            {
                this._738577227propTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "propTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get footCb():CheckBox
        {
            return (this._1268862611footCb);
        }

        public function set viewStackRune(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._1125079229viewStackRune;
            if (_local_2 !== _arg_1)
            {
                this._1125079229viewStackRune = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStackRune", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get guangquan():Image
        {
            return (this._297514627guangquan);
        }

        public function set limitMakeTimes(_arg_1:int):void
        {
            var _local_2:Object;
            _local_2 = this._380408707limitMakeTimes;
            if (_local_2 !== _arg_1)
            {
                this._380408707limitMakeTimes = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitMakeTimes", _local_2, _arg_1));
            };
        }

        private function _DecoratePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DECORATE_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[1];
            _local_1 = pageTabFirst.selectedIndex;
            _local_1 = Language.DECORATE_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[18];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = ResManager.getIconUrl(LEVEL_ICONCODE_1[0]);
            _local_1 = ResManager.getIconUrl(LEVEL_ICONCODE_2[0]);
            _local_1 = ResManager.getIconUrl(LEVEL_ICONCODE_3[0]);
            _local_1 = ResManager.getIconUrl(LEVEL_ICONCODE_4[0]);
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
            _local_1 = Language.DECORATE_PANEL[3];
            _local_1 = pageTabPos.selectedIndex;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[19];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[37];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[38];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[26];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[35];
            _local_1 = Language.DECORATE_PANEL[36];
            _local_1 = (Language.DECORATE_PANEL[30] + _core.player.decoSilver);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[21];
            _local_1 = pageTabRune.selectedIndex;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Slot.SLOT_RUNE_CHA_HOLE;
            _local_1 = Language.DECORATE_PANEL[34];
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Slot.SLOT_RUNE_PET_HOLE;
            _local_1 = Language.DECORATE_PANEL[34];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[47];
            _local_1 = pageTabRuneAct.selectedIndex;
            _local_1 = Slot.SLOT_RUNE_UP;
            _local_1 = Language.DECORATE_PANEL[43];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[44].toString().replace("{num}", _core.player.runeExp);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[46];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[33];
            _local_1 = pageTabRuneUplvl.selectedIndex;
            _local_1 = RuneBag.RUNE_CHAR_BAG;
            _local_1 = RuneBag.RUNE_PET_BAG;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[33];
            _local_1 = pageTabRuneResolve.selectedIndex;
            _local_1 = RuneBag.RUNE_CHAR_BAG;
            _local_1 = RuneBag.RUNE_PET_BAG;
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[59];
            _local_1 = pageTabMysTre.selectedIndex;
            _local_1 = Language.DECORATE_PANEL[83];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[84][0];
            _local_1 = Language.DECORATE_PANEL[84][1];
            _local_1 = Language.DECORATE_PANEL[84][2];
            _local_1 = Language.DECORATE_PANEL[84][3];
            _local_1 = Language.DECORATE_PANEL[84][4];
            _local_1 = Language.DECORATE_PANEL[84][5];
            _local_1 = Language.DECORATE_PANEL[84][6];
            _local_1 = Language.DECORATE_PANEL[84][7];
            _local_1 = Language.DECORATE_PANEL[84][8];
            _local_1 = Language.DECORATE_PANEL[84][9];
            _local_1 = Language.DECORATE_PANEL[84][10];
            _local_1 = Language.DECORATE_PANEL[84][11];
            _local_1 = Language.DECORATE_PANEL[84][0];
            _local_1 = Language.DECORATE_PANEL[85];
            _local_1 = Language.DECORATE_PANEL[84][1];
            _local_1 = Language.DECORATE_PANEL[84][2];
            _local_1 = Language.DECORATE_PANEL[84][3];
            _local_1 = Language.DECORATE_PANEL[84][4];
            _local_1 = Language.DECORATE_PANEL[84][5];
            _local_1 = Language.DECORATE_PANEL[84][6];
            _local_1 = Language.DECORATE_PANEL[84][7];
            _local_1 = Language.DECORATE_PANEL[84][8];
            _local_1 = Language.DECORATE_PANEL[86];
            _local_1 = Language.DECORATE_PANEL[84][9];
            _local_1 = Language.DECORATE_PANEL[84][10];
            _local_1 = Language.DECORATE_PANEL[84][11];
            _local_1 = Language.DECORATE_PANEL[88];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[87][0];
            _local_1 = Language.DECORATE_PANEL[87][1];
            _local_1 = Language.DECORATE_PANEL[87][2];
            _local_1 = Language.DECORATE_PANEL[87][3];
            _local_1 = Language.DECORATE_PANEL[87][4];
            _local_1 = Language.DECORATE_PANEL[87][5];
            _local_1 = Language.DECORATE_PANEL[89];
            _local_1 = Language.DECORATE_PANEL[90];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[91];
            _local_1 = Language.DECORATE_PANEL[92];
            _local_1 = Language.DECORATE_PANEL[92];
            _local_1 = Slot.SLOT_MYSTRE;
            _local_1 = Slot.SLOT_MYSTRE;
            _local_1 = Slot.SLOT_MYSTRE;
            _local_1 = Slot.SLOT_MYSTRE;
            _local_1 = Slot.SLOT_MYSTRE;
            _local_1 = Slot.SLOT_MYSTRE;
            _local_1 = Language.DECORATE_PANEL[93];
            _local_1 = Language.DECORATE_PANEL[94];
            _local_1 = Language.DECORATE_PANEL[95];
            _local_1 = limitMakeTimes;
            _local_1 = Language.DECORATE_PANEL[96];
            _local_1 = Language.DECORATE_PANEL[97];
            _local_1 = Language.DECORATE_PANEL[97];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[98];
            _local_1 = Language.DECORATE_PANEL[99];
            _local_1 = Language.DECORATE_PANEL[100];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DECORATE_PANEL[101];
            _local_1 = Language.DECORATE_PANEL[102];
            _local_1 = Language.DECORATE_PANEL[103];
            _local_1 = resolveMysSil;
            _local_1 = Language.DECORATE_PANEL[104];
            _local_1 = Language.DECORATE_PANEL[105];
            _local_1 = Language.DECORATE_PANEL[106];
            _local_1 = Language.DECORATE_PANEL[107];
            _local_1 = _core.player.decoSilver;
            _local_1 = Language.DECORATE_PANEL[108];
            _local_1 = Language.DECORATE_PANEL[109];
            _local_1 = Language.DECORATE_PANEL[110];
        }

        public function set mysTreButton10(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1085838545mysTreButton10;
            if (_local_2 !== _arg_1)
            {
                this._1085838545mysTreButton10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton10", _local_2, _arg_1));
            };
        }

        public function set mysTreButton11(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1085838546mysTreButton11;
            if (_local_2 !== _arg_1)
            {
                this._1085838546mysTreButton11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton11", _local_2, _arg_1));
            };
        }

        public function set mysTreShow1(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543404mysTreShow1;
            if (_local_2 !== _arg_1)
            {
                this._866543404mysTreShow1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow1", _local_2, _arg_1));
            };
        }

        public function set mysTreShow2(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543403mysTreShow2;
            if (_local_2 !== _arg_1)
            {
                this._866543403mysTreShow2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow2", _local_2, _arg_1));
            };
        }

        public function set mysTreShow3(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543402mysTreShow3;
            if (_local_2 !== _arg_1)
            {
                this._866543402mysTreShow3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow3", _local_2, _arg_1));
            };
        }

        public function set mysTreShow4(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543401mysTreShow4;
            if (_local_2 !== _arg_1)
            {
                this._866543401mysTreShow4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow4", _local_2, _arg_1));
            };
        }

        private function mysTreMakeClickHandler(_arg_1:int):void
        {
            _selectedLvl = _arg_1;
            var _local_2:int = 1;
            while (_local_2 <= 6)
            {
                if (this[("makeLabel" + _local_2)].labelSelected)
                {
                    this[("makeLabel" + _local_2)].labelSelected = false;
                };
                _local_2++;
            };
            this[("makeLabel" + _arg_1)].labelSelected = true;
            updateMakeList(_arg_1);
        }

        public function set mysTreShow6(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543399mysTreShow6;
            if (_local_2 !== _arg_1)
            {
                this._866543399mysTreShow6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow6", _local_2, _arg_1));
            };
        }

        public function set mysTreShow7(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543398mysTreShow7;
            if (_local_2 !== _arg_1)
            {
                this._866543398mysTreShow7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow7", _local_2, _arg_1));
            };
        }

        public function set mysTreShow5(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543400mysTreShow5;
            if (_local_2 !== _arg_1)
            {
                this._866543400mysTreShow5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow5", _local_2, _arg_1));
            };
        }

        public function set mysTreShow9(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543396mysTreShow9;
            if (_local_2 !== _arg_1)
            {
                this._866543396mysTreShow9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow9", _local_2, _arg_1));
            };
        }

        public function __headSel3_change(_arg_1:ListEvent):void
        {
            changeShowLvl(3);
        }

        public function set mysTreShow8(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._866543397mysTreShow8;
            if (_local_2 !== _arg_1)
            {
                this._866543397mysTreShow8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow8", _local_2, _arg_1));
            };
        }

        private function decoChangeHandler(_arg_1:Event):void
        {
            this.updateViewDeco();
        }

        public function set illustrateTree(_arg_1:Tree):void
        {
            var _local_2:Object;
            _local_2 = this._1813919509illustrateTree;
            if (_local_2 !== _arg_1)
            {
                this._1813919509illustrateTree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "illustrateTree", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow10():MysTreShow
        {
            return (this._1093041700mysTreShow10);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreShow11():MysTreShow
        {
            return (this._1093041699mysTreShow11);
        }

        public function canMake():Boolean
        {
            var _local_1:int = 1;
            while (_local_1 <= 6)
            {
                if (this[("putMatSlot" + _local_1)].type != GamePredef.TBL_ITEM_TEMPLATE)
                {
                    return (false);
                };
                _local_1++;
            };
            return (true);
        }

        public function set HoleSlot2(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609612HoleSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1071609612HoleSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot2", _local_2, _arg_1));
            };
        }

        public function ___DecoratePanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            addDecoHoleLvl();
        }

        public function set HoleSlot3(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609611HoleSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1071609611HoleSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot3", _local_2, _arg_1));
            };
        }

        public function set HoleSlot7(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609607HoleSlot7;
            if (_local_2 !== _arg_1)
            {
                this._1071609607HoleSlot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot7", _local_2, _arg_1));
            };
        }

        public function set HoleSlot4(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609610HoleSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1071609610HoleSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot4", _local_2, _arg_1));
            };
        }

        public function set HoleSlot6(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609608HoleSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1071609608HoleSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot6", _local_2, _arg_1));
            };
        }

        public function set property1(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608900property1;
            if (_local_2 !== _arg_1)
            {
                this._722608900property1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property1", _local_2, _arg_1));
            };
        }

        public function set property2(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608899property2;
            if (_local_2 !== _arg_1)
            {
                this._722608899property2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property2", _local_2, _arg_1));
            };
        }

        public function set HoleSlot8(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609606HoleSlot8;
            if (_local_2 !== _arg_1)
            {
                this._1071609606HoleSlot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot8", _local_2, _arg_1));
            };
        }

        public function updateMysTreBuff(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:Label;
            if (mysTreProp1.numChildren > 0)
            {
                mysTreProp1.removeAllChildren();
            };
            if (mysTreProp2.numChildren > 0)
            {
                mysTreProp2.removeAllChildren();
            };
            if (mysTreProp3.numChildren > 0)
            {
                mysTreProp3.removeAllChildren();
            };
            for (_local_2 in _arg_1)
            {
                _local_3 = new Label();
                switch (_local_2)
                {
                    case "hp":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[0]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "attack":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[4]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "mAttack":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[5]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "speed":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[10]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "hit":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[7]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "dodge":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[6]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "resiDizzy2":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[13]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "debuffSuccRate":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[14]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "critical":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[8]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "resiCritical":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[9]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "enhPhyHurtPer":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[17]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "enhMagicHurtPer":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[18]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "praDef":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[15]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                    case "praMagDef":
                        _local_3.htmlText = (((((("<font color='#FFFFFF'/>" + Language.TALENT_PANEL_INFOU[16]) + "</font>") + "<font color='#00FFFF'/>") + "+") + _arg_1[_local_2]) + "</font>");
                        break;
                };
                if (((((((((Number(_arg_1[_local_2])) && (!(_local_2 == "resiFire2"))) && (!(_local_2 == "resiIce2"))) && (!(_local_2 == "resiLight2"))) && (!(_local_2 == "resiPoison2"))) && (!(_local_2 == "resiRage2"))) && (!(_local_2 == "resiSleep2"))) && (!(_local_2 == "resiConfusion2"))))
                {
                    if (mysTreProp1.numChildren < 5)
                    {
                        mysTreProp1.addChild(_local_3);
                    }
                    else
                    {
                        if (mysTreProp2.numChildren < 5)
                        {
                            mysTreProp2.addChild(_local_3);
                        }
                        else
                        {
                            if (mysTreProp3.numChildren < 5)
                            {
                                mysTreProp3.addChild(_local_3);
                            };
                        };
                    };
                };
            };
        }

        public function set HoleSlot9(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609605HoleSlot9;
            if (_local_2 !== _arg_1)
            {
                this._1071609605HoleSlot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot9", _local_2, _arg_1));
            };
        }

        public function set HoleSlot1(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609613HoleSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1071609613HoleSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot1", _local_2, _arg_1));
            };
        }

        public function set property5(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608896property5;
            if (_local_2 !== _arg_1)
            {
                this._722608896property5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property5", _local_2, _arg_1));
            };
        }

        public function set property6(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608895property6;
            if (_local_2 !== _arg_1)
            {
                this._722608895property6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property6", _local_2, _arg_1));
            };
        }

        public function set property7(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608894property7;
            if (_local_2 !== _arg_1)
            {
                this._722608894property7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property7", _local_2, _arg_1));
            };
        }

        public function set property0(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608901property0;
            if (_local_2 !== _arg_1)
            {
                this._722608901property0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysSilNum():Label
        {
            return (this._1852161545mysSilNum);
        }

        public function resetDecoTimer():void
        {
            var _local_1:Number;
            if (!updateDecoTimer)
            {
                addDecoTimer();
            }
            else
            {
                _local_1 = getNewDelay();
                updateDecoTimer.delay = _local_1;
            };
        }

        public function set property3(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608898property3;
            if (_local_2 !== _arg_1)
            {
                this._722608898property3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property3", _local_2, _arg_1));
            };
        }

        public function set property4(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608897property4;
            if (_local_2 !== _arg_1)
            {
                this._722608897property4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property4", _local_2, _arg_1));
            };
        }

        public function set property9(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608892property9;
            if (_local_2 !== _arg_1)
            {
                this._722608892property9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property9", _local_2, _arg_1));
            };
        }

        public function set HoleSlot5(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1071609609HoleSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1071609609HoleSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot5", _local_2, _arg_1));
            };
        }

        public function changeToMysMake():void
        {
            pageTabMysTre.selectedIndex = 1;
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

        private function changeShowLvl(_arg_1:int):*
        {
            var _local_2:int = ((this[("headSel" + _arg_1)] as ComboBox).selectedIndex + 1);
            _core.remote.call("changeShowLvl", new Responder(updateDecoInfo), _local_2, _arg_1);
        }

        public function set property8(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._722608893property8;
            if (_local_2 !== _arg_1)
            {
                this._722608893property8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get decoHoleProp1():Label
        {
            return (this._1955000865decoHoleProp1);
        }

        [Bindable(event="propertyChange")]
        public function get decoHoleProp3():Label
        {
            return (this._1955000867decoHoleProp3);
        }

        [Bindable(event="propertyChange")]
        public function get decoHoleProp4():Label
        {
            return (this._1955000868decoHoleProp4);
        }

        [Bindable(event="propertyChange")]
        public function get decoHoleProp2():Label
        {
            return (this._1955000866decoHoleProp2);
        }

        public function set upLvlExp(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._654621974upLvlExp;
            if (_local_2 !== _arg_1)
            {
                this._654621974upLvlExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upLvlExp", _local_2, _arg_1));
            };
        }

        public function set headSel1(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._1115807465headSel1;
            if (_local_2 !== _arg_1)
            {
                this._1115807465headSel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headSel1", _local_2, _arg_1));
            };
        }

        public function ___DecoratePanel_BasicDelayButton6_click(_arg_1:MouseEvent):void
        {
            resolveMysTre();
        }

        public function set headSel3(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._1115807463headSel3;
            if (_local_2 !== _arg_1)
            {
                this._1115807463headSel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headSel3", _local_2, _arg_1));
            };
        }

        public function set headSel4(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._1115807462headSel4;
            if (_local_2 !== _arg_1)
            {
                this._1115807462headSel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headSel4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get makeListContainer():VBox
        {
            return (this._1703430709makeListContainer);
        }

        public function set headSel2(_arg_1:ComboBox):void
        {
            var _local_2:Object;
            _local_2 = this._1115807464headSel2;
            if (_local_2 !== _arg_1)
            {
                this._1115807464headSel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headSel2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get succRate():Label
        {
            return (this._2048271806succRate);
        }

        [Bindable(event="propertyChange")]
        public function get runeBagPetUp():RuneBagUpLvl
        {
            return (this._2010376780runeBagPetUp);
        }

        public function set mysTreProp3(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._869016272mysTreProp3;
            if (_local_2 !== _arg_1)
            {
                this._869016272mysTreProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreProp3", _local_2, _arg_1));
            };
        }

        public function set mysTreProp1(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._869016274mysTreProp1;
            if (_local_2 !== _arg_1)
            {
                this._869016274mysTreProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreProp1", _local_2, _arg_1));
            };
        }

        public function set mysTreProp2(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._869016273mysTreProp2;
            if (_local_2 !== _arg_1)
            {
                this._869016273mysTreProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreProp2", _local_2, _arg_1));
            };
        }

        public function updateMysMakeCan(_arg_1:Object):void
        {
            _mysMakeData = _arg_1;
            var _local_2:int = _arg_1["skiLvl"];
            var _local_3:int = _arg_1["skiPt"];
            skillPt.text = ((_local_3 + "/") + ((MYS_TRE_NEED_SKIPT[_local_2]) ? MYS_TRE_NEED_SKIPT[_local_2] : "--"));
            makeLabel1.labelSelected = true;
            var _local_4:int = 1;
            while (_local_4 <= 6)
            {
                if (_local_4 > _local_2)
                {
                    this[("makeLabel" + _local_4)].setLabelColor(0xFF0000);
                }
                else
                {
                    this[("makeLabel" + _local_4)].setLabelColor(0xFFFFFF);
                };
                _local_4++;
            };
            mysTreMakeClickHandler(_selectedLvl);
        }

        public function __mysTreButton4_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(4);
        }

        [Bindable(event="propertyChange")]
        public function get mysDisplay():ViewStack
        {
            return (this._2002617733mysDisplay);
        }

        public function set listShowCbx(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1915647682listShowCbx;
            if (_local_2 !== _arg_1)
            {
                this._1915647682listShowCbx = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "listShowCbx", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get linkProp():Label
        {
            return (this._1194080893linkProp);
        }

        [Bindable(event="propertyChange")]
        public function get viewStackRuneAct():ViewStack
        {
            return (this._689401195viewStackRuneAct);
        }

        public function __mysTreButton9_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(9);
        }

        [Bindable(event="propertyChange")]
        public function get property10():Property
        {
            return (this._926039372property10);
        }

        public function __makeLabel2_click(_arg_1:MouseEvent):void
        {
            mysTreMakeClickHandler(2);
        }

        public function ___DecoratePanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            changeToMysMake();
        }

        [Bindable(event="propertyChange")]
        public function get property11():Property
        {
            return (this._926039371property11);
        }

        private function changeBagVis():void
        {
            if (!_runeBagAdded)
            {
                runeBag = null;
                runeBag = new RuneBagComb();
                runeBag.x = 560;
                runeBag.y = 7;
                width = 800;
                viewStack.width = 775;
                (pageTwoCvs as UIComponent).width = 775;
                (pageTwoCvs as UIComponent).addChild(runeBag);
                _runeBagAdded = true;
                showBag.styleName = "EquipBagLeft";
                ditu2.source = ResManager.getIconUrl(4130220000563);
            }
            else
            {
                if (runeBag.visible)
                {
                    runeBag.visible = false;
                    showBag.styleName = "EquipBagRight";
                    width = 600;
                    viewStack.width = 570;
                    (pageTwoCvs as UIComponent).width = 570;
                    ditu2.source = ResManager.getIconUrl(4130220000562);
                }
                else
                {
                    runeBag.visible = true;
                    width = 800;
                    viewStack.width = 775;
                    (pageTwoCvs as UIComponent).width = 775;
                    showBag.styleName = "EquipBagLeft";
                    ditu2.source = ResManager.getIconUrl(4130220000563);
                };
            };
            eTitle.text = eTitle.text;
        }

        [Bindable(event="propertyChange")]
        public function get bottomSlot():Slot
        {
            return (this._1682576695bottomSlot);
        }

        public function set footCb(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1268862611footCb;
            if (_local_2 !== _arg_1)
            {
                this._1268862611footCb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "footCb", _local_2, _arg_1));
            };
        }

        public function set buttonContainer(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._367345007buttonContainer;
            if (_local_2 !== _arg_1)
            {
                this._367345007buttonContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "buttonContainer", _local_2, _arg_1));
            };
        }

        public function updateDecoInfo(_arg_1:Object):void
        {
            DecorateLogic.updateDecoInfo(_arg_1);
        }

        public function addDecoTimer():void
        {
            var _local_1:*;
            if (((!(updateDecoTimer)) && (_dueObj)))
            {
                _local_1 = getNewDelay();
                updateDecoTimer = new Timer(_local_1, 0);
                updateDecoTimer.addEventListener(TimerEvent.TIMER, refreshDecoShow);
                updateDecoTimer.start();
            };
        }

        public function set guangquan(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._297514627guangquan;
            if (_local_2 !== _arg_1)
            {
                this._297514627guangquan = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guangquan", _local_2, _arg_1));
            };
        }

        override public function show():void
        {
            var _local_1:int;
            if (!ToolKit.isEqual(_loadCid, _core.cid))
            {
                _loadCid = _core.cid;
                if (((viewHolder) && (viewHolder.numChildren > 0)))
                {
                    viewHolder.removeChild(_showView);
                };
                _showView = null;
                runeBag = null;
                _runeBagAdded = false;
                _local_1 = 1;
                while (_local_1 <= 6)
                {
                    ((this[("needMatSlot" + _local_1)]) && ((this[("needMatSlot" + _local_1)] as Slot).clean()));
                    ((this[("putMatSlot" + _local_1)]) && ((this[("putMatSlot" + _local_1)] as Slot).clean()));
                    _local_1++;
                };
                ((this.initialized) && (this.updateView()));
            };
            ((this.initialized) && (this.updatePageOne()));
            _core.remote.call("onGetMakeLimitTimes", new Responder(updateLimitMakeTimes));
            super.show();
        }

        public function ___DecoratePanel_Canvas8_click(_arg_1:MouseEvent):void
        {
            setSelectedPosition(4);
        }

        public function updateView():void
        {
            this.updateViewDeco();
            this.updatePageThree();
            this.updatePageFour();
        }

        private function indexChange():void
        {
            if (viewStack.selectedIndex != 1)
            {
                this.width = 600;
                viewStack.width = 570;
                ditu2.source = ResManager.getIconUrl(4130220000562);
            }
            else
            {
                if (((_runeBagAdded) && (runeBag.visible)))
                {
                    this.width = 800;
                    viewStack.width = 775;
                    ditu2.source = ResManager.getIconUrl(4130220000563);
                };
            };
            eTitle.text = eTitle.text;
            if (viewStack.selectedIndex == 2)
            {
                runeBagCha.clean();
                runeBagPet.clean();
            };
        }

        public function set pageTabRuneAct(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._515959406pageTabRuneAct;
            if (_local_2 !== _arg_1)
            {
                this._515959406pageTabRuneAct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabRuneAct", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needMatSlot1():Slot
        {
            return (this._1827803945needMatSlot1);
        }

        [Bindable(event="propertyChange")]
        public function get needMatSlot2():Slot
        {
            return (this._1827803946needMatSlot2);
        }

        [Bindable(event="propertyChange")]
        public function get ditu1():Image
        {
            return (this._95595307ditu1);
        }

        [Bindable(event="propertyChange")]
        public function get ditu2():Image
        {
            return (this._95595308ditu2);
        }

        [Bindable(event="propertyChange")]
        public function get ditu3():Image
        {
            return (this._95595309ditu3);
        }

        [Bindable(event="propertyChange")]
        public function get needMatSlot3():Slot
        {
            return (this._1827803947needMatSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get needMatSlot4():Slot
        {
            return (this._1827803948needMatSlot4);
        }

        [Bindable(event="propertyChange")]
        public function get needMatSlot5():Slot
        {
            return (this._1827803949needMatSlot5);
        }

        public function changToOtherTab(_arg_1:int):void
        {
            pageTabFirst.selectedIndex = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get suitName():Label
        {
            return (this._1860916424suitName);
        }

        [Bindable(event="propertyChange")]
        public function get ditu4():Image
        {
            return (this._95595310ditu4);
        }

        public function set HoleSlot12(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840415HoleSlot12;
            if (_local_2 !== _arg_1)
            {
                this._1139840415HoleSlot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton1():Button
        {
            return (this._1350446273mysTreButton1);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton2():Button
        {
            return (this._1350446272mysTreButton2);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton3():Button
        {
            return (this._1350446271mysTreButton3);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton4():Button
        {
            return (this._1350446270mysTreButton4);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton5():Button
        {
            return (this._1350446269mysTreButton5);
        }

        public function set HoleSlot15(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840418HoleSlot15;
            if (_local_2 !== _arg_1)
            {
                this._1139840418HoleSlot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot15", _local_2, _arg_1));
            };
        }

        public function set HoleSlot16(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840419HoleSlot16;
            if (_local_2 !== _arg_1)
            {
                this._1139840419HoleSlot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot16", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton9():Button
        {
            return (this._1350446265mysTreButton9);
        }

        public function updateTotalProgress(_arg_1:Object):void
        {
            var _local_5:Object;
            var _local_6:Number;
            var _local_7:Object;
            var _local_8:Object;
            var _local_9:Number;
            var _local_10:Object;
            var _local_2:Number = 0;
            var _local_3:Number = 0;
            var _local_4:int = 1;
            while (_local_4 <= MAX_MYS_KIND)
            {
                _local_5 = _dm.gameDataIndex[GamePredef.TBL_MYSTRE][_local_4];
                _local_6 = 0;
                for each (_local_7 in _local_5)
                {
                    if (_local_7)
                    {
                        _local_6++;
                    };
                };
                _local_8 = _arg_1[_local_4];
                _local_9 = 0;
                for each (_local_10 in _local_8)
                {
                    if (_local_10)
                    {
                        _local_9++;
                    };
                };
                (this[("property" + _local_4)] as Property).v = _local_9;
                (this[("property" + _local_4)] as Property).m = _local_6;
                (this[("property" + _local_4)] as Property).label = ((_local_9 + "/") + _local_6);
                _local_2 = (_local_2 + _local_6);
                _local_3 = (_local_3 + _local_9);
                _local_4++;
            };
            property0.v = _local_3;
            property0.m = _local_2;
            property0.label = ((_local_3 + "/") + _local_2);
            _core.remote.call("getMysTreBuffSimpleData", new Responder(updateMysTreBuff));
        }

        public function set HoleSlot14(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840417HoleSlot14;
            if (_local_2 !== _arg_1)
            {
                this._1139840417HoleSlot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot14", _local_2, _arg_1));
            };
        }

        public function set HoleSlot11(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840414HoleSlot11;
            if (_local_2 !== _arg_1)
            {
                this._1139840414HoleSlot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton7():Button
        {
            return (this._1350446267mysTreButton7);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton8():Button
        {
            return (this._1350446266mysTreButton8);
        }

        public function set HoleSlot13(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840416HoleSlot13;
            if (_local_2 !== _arg_1)
            {
                this._1139840416HoleSlot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot13", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needMatSlot6():Slot
        {
            return (this._1827803950needMatSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton0():Button
        {
            return (this._1350446274mysTreButton0);
        }

        public function set HoleSlot10(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1139840413HoleSlot10;
            if (_local_2 !== _arg_1)
            {
                this._1139840413HoleSlot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "HoleSlot10", _local_2, _arg_1));
            };
        }

        public function __listShowCbx_click(_arg_1:MouseEvent):void
        {
            listShowCbxHandler();
        }

        public function initDecoTimer(_arg_1:Object):void
        {
            _dueObj = _arg_1;
            resetDecoTimer();
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton6():Button
        {
            return (this._1350446268mysTreButton6);
        }

        [Bindable(event="propertyChange")]
        public function get runeUp():Image
        {
            return (this._919815307runeUp);
        }

        public function addLimitMakeTimes():void
        {
            _core.remote.call("onGetMysAddTimes", new Responder(onAddLimitMakeTimes));
        }

        private function runeIndexChange():void
        {
            if (viewStackRuneAct.selectedIndex == 1)
            {
                runeBagCha.clean();
                runeBagPet.clean();
            };
        }

        [Bindable(event="propertyChange")]
        public function get footSlot():Slot
        {
            return (this._394232716footSlot);
        }

        override public function initialize():void
        {
            var target:DecoratePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _DecoratePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_DecoratePanelWatcherSetupUtil");
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

        public function ___DecoratePanel_BasicDelayButton4_click(_arg_1:MouseEvent):void
        {
            makeMysTre();
        }

        public function set mysTreShow10(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._1093041700mysTreShow10;
            if (_local_2 !== _arg_1)
            {
                this._1093041700mysTreShow10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow10", _local_2, _arg_1));
            };
        }

        public function set mysTreShow11(_arg_1:MysTreShow):void
        {
            var _local_2:Object;
            _local_2 = this._1093041699mysTreShow11;
            if (_local_2 !== _arg_1)
            {
                this._1093041699mysTreShow11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreShow11", _local_2, _arg_1));
            };
        }

        public function __mysTreButton11_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(11);
        }

        [Bindable(event="propertyChange")]
        public function get showBag():BasicGlowButton
        {
            return (this._2067262411showBag);
        }

        public function set needBindSil(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._889670173needBindSil;
            if (_local_2 !== _arg_1)
            {
                this._889670173needBindSil = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needBindSil", _local_2, _arg_1));
            };
        }

        public function set maxLvlInfo(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1720350188maxLvlInfo;
            if (_local_2 !== _arg_1)
            {
                this._1720350188maxLvlInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxLvlInfo", _local_2, _arg_1));
            };
        }

        public function set pageTabPos(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._1297726958pageTabPos;
            if (_local_2 !== _arg_1)
            {
                this._1297726958pageTabPos = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabPos", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTwoCvs():Canvas
        {
            return (this._1318419427pageTwoCvs);
        }

        public function __mysTreButton2_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(2);
        }

        [Bindable(event="propertyChange")]
        public function get bottomCb():CheckBox
        {
            return (this._2138061846bottomCb);
        }

        public function set mysSilNum(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1852161545mysSilNum;
            if (_local_2 !== _arg_1)
            {
                this._1852161545mysSilNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysSilNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get headSlot():Slot
        {
            return (this._1115800578headSlot);
        }

        public function set pageTabMysTre(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._1506606598pageTabMysTre;
            if (_local_2 !== _arg_1)
            {
                this._1506606598pageTabMysTre = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabMysTre", _local_2, _arg_1));
            };
        }

        public function listShowCbxHandler():void
        {
            updateMakeList(_selectedLvl);
        }

        public function __mysTreButton7_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(7);
        }

        [Bindable(event="propertyChange")]
        public function get petRunePropBox():VBox
        {
            return (this._1072419793petRunePropBox);
        }

        [Bindable(event="propertyChange")]
        public function get showProp1():Label
        {
            return (this._1917234127showProp1);
        }

        [Bindable(event="propertyChange")]
        public function get showProp2():Label
        {
            return (this._1917234126showProp2);
        }

        private function updatePageTwo():void
        {
            var _local_1:Object = _core.player.decoInfo;
            var _local_2:Number = _local_1[1]["hid"];
            var _local_3:Number = _local_1[2]["hid"];
            var _local_4:Number = _local_1[3]["hid"];
            var _local_5:Number = _local_1[4]["hid"];
            var _local_6:Number = GameData.d[GamePredef.TBL_DECO_HOLE][_local_2]["level"];
            var _local_7:Number = GameData.d[GamePredef.TBL_DECO_HOLE][_local_3]["level"];
            var _local_8:Number = GameData.d[GamePredef.TBL_DECO_HOLE][_local_4]["level"];
            var _local_9:Number = GameData.d[GamePredef.TBL_DECO_HOLE][_local_5]["level"];
            hunqi1.source = ResManager.getIconUrl(LEVEL_ICONCODE_1[Math.floor((_local_6 / 10))]);
            hunqi2.source = ResManager.getIconUrl(LEVEL_ICONCODE_2[Math.floor((_local_7 / 10))]);
            hunqi3.source = ResManager.getIconUrl(LEVEL_ICONCODE_3[Math.floor((_local_8 / 10))]);
            hunqi4.source = ResManager.getIconUrl(LEVEL_ICONCODE_4[Math.floor((_local_9 / 10))]);
            ditu2.source = ResManager.getIconUrl(4130220000562);
            runeSetDitu.source = ResManager.getIconUrl(4130220000564);
            setSelectedPosition(_selectedDecoHole);
            if (runeBag)
            {
                (runeBag as RuneBagComb).update();
            };
        }

        public function ___DecoratePanel_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            upRuneLvl();
        }

        [Bindable(event="propertyChange")]
        public function get showProp3():Label
        {
            return (this._1917234125showProp3);
        }

        [Bindable(event="propertyChange")]
        public function get showProp4():Label
        {
            return (this._1917234124showProp4);
        }

        [Bindable(event="propertyChange")]
        public function get skillPt():Label
        {
            return (this._2147320885skillPt);
        }

        public function set suitProp0(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1851478496suitProp0;
            if (_local_2 !== _arg_1)
            {
                this._1851478496suitProp0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitProp0", _local_2, _arg_1));
            };
        }

        public function set decoHoleProp1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1955000865decoHoleProp1;
            if (_local_2 !== _arg_1)
            {
                this._1955000865decoHoleProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoHoleProp1", _local_2, _arg_1));
            };
        }

        public function set decoHoleProp2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1955000866decoHoleProp2;
            if (_local_2 !== _arg_1)
            {
                this._1955000866decoHoleProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoHoleProp2", _local_2, _arg_1));
            };
        }

        public function set decoHoleProp3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1955000867decoHoleProp3;
            if (_local_2 !== _arg_1)
            {
                this._1955000867decoHoleProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoHoleProp3", _local_2, _arg_1));
            };
        }

        public function set decoHoleProp4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1955000868decoHoleProp4;
            if (_local_2 !== _arg_1)
            {
                this._1955000868decoHoleProp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoHoleProp4", _local_2, _arg_1));
            };
        }

        public function set suitProp1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1851478495suitProp1;
            if (_local_2 !== _arg_1)
            {
                this._1851478495suitProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitProp1", _local_2, _arg_1));
            };
        }

        public function set upLvlSlot(_arg_1:RuneSlot):void
        {
            var _local_2:Object;
            _local_2 = this._1181149659upLvlSlot;
            if (_local_2 !== _arg_1)
            {
                this._1181149659upLvlSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upLvlSlot", _local_2, _arg_1));
            };
        }

        public function set mysItemDic(_arg_1:Object):void
        {
            var _local_2:Object;
            _local_2 = this._1558202844mysItemDic;
            if (_local_2 !== _arg_1)
            {
                this._1558202844mysItemDic = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysItemDic", _local_2, _arg_1));
            };
        }

        public function ___DecoratePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set viewStackDeco(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._1124646448viewStackDeco;
            if (_local_2 !== _arg_1)
            {
                this._1124646448viewStackDeco = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStackDeco", _local_2, _arg_1));
            };
        }

        public function ___DecoratePanel_Button2_click(_arg_1:MouseEvent):void
        {
            turnHandler(true);
        }

        public function set makeListContainer(_arg_1:VBox):void
        {
            var _local_2:Object;
            _local_2 = this._1703430709makeListContainer;
            if (_local_2 !== _arg_1)
            {
                this._1703430709makeListContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeListContainer", _local_2, _arg_1));
            };
        }

        public function changeToMysBag():void
        {
            pageTabMysTre.selectedIndex = 2;
        }

        public function __makeLabel5_click(_arg_1:MouseEvent):void
        {
            mysTreMakeClickHandler(5);
        }

        [Bindable(event="propertyChange")]
        public function get hunqi2():Image
        {
            return (this._1206094727hunqi2);
        }

        [Bindable(event="propertyChange")]
        public function get hunqi3():Image
        {
            return (this._1206094726hunqi3);
        }

        [Bindable(event="propertyChange")]
        public function get hunqi4():Image
        {
            return (this._1206094725hunqi4);
        }

        [Bindable(event="propertyChange")]
        public function get hasMysSilNum():Label
        {
            return (this._1356668029hasMysSilNum);
        }

        public function ___DecoratePanel_Canvas6_click(_arg_1:MouseEvent):void
        {
            setSelectedPosition(2);
        }

        [Bindable(event="propertyChange")]
        public function get decoTitleLb():Label
        {
            return (this._11953281decoTitleLb);
        }

        public function set succRate(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._2048271806succRate;
            if (_local_2 !== _arg_1)
            {
                this._2048271806succRate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "succRate", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hunqi1():Image
        {
            return (this._1206094728hunqi1);
        }

        [Bindable(event="propertyChange")]
        public function get hasRuneExp():Label
        {
            return (this._712098679hasRuneExp);
        }

        public function updateMysTreBook(_arg_1:Object):void
        {
            var _local_2:int = 1;
            while (_local_2 <= MAX_MYS_KIND)
            {
                (this[("mysTreShow" + _local_2)] as MysTreShow).updateView(_arg_1);
                _local_2++;
            };
            updateTotalProgress(_arg_1);
        }

        public function set hasSilver(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._282560953hasSilver;
            if (_local_2 !== _arg_1)
            {
                this._282560953hasSilver = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hasSilver", _local_2, _arg_1));
            };
        }

        public function set runeBagPetUp(_arg_1:RuneBagUpLvl):void
        {
            var _local_2:Object;
            _local_2 = this._2010376780runeBagPetUp;
            if (_local_2 !== _arg_1)
            {
                this._2010376780runeBagPetUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeBagPetUp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get chaRunePropBox():VBox
        {
            return (this._2127905646chaRunePropBox);
        }

        [Bindable(event="propertyChange")]
        public function get limitMakeTimes():int
        {
            return (this._380408707limitMakeTimes);
        }

        [Bindable(event="propertyChange")]
        public function get nameImage2():Image
        {
            return (this._1041132382nameImage2);
        }

        private function _DecoratePanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = RuneItemRenderer;
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get putMatSlot3():Slot
        {
            return (this._223261860putMatSlot3);
        }

        [Bindable(event="propertyChange")]
        public function get putMatSlot4():Slot
        {
            return (this._223261861putMatSlot4);
        }

        public function updateMysTreShow(_arg_1:Number, _arg_2:Object):void
        {
            (this[("mysTreShow" + _arg_1)] as MysTreShow).updateView(_arg_2);
        }

        [Bindable(event="propertyChange")]
        public function get putMatSlot6():Slot
        {
            return (this._223261863putMatSlot6);
        }

        [Bindable(event="propertyChange")]
        public function get putMatSlot1():Slot
        {
            return (this._223261858putMatSlot1);
        }

        private function hideDecoShow(_arg_1:int):void
        {
            var _local_2:Object = _core.player.decoInfo;
            if (Number(_local_2[_arg_1]["isShow"]))
            {
                trace("隐藏形象");
                _core.remote.call("hideDecoShow", new Responder(updateDecoInfo), _arg_1);
            }
            else
            {
                trace("显示形象");
                _core.remote.call("showDecoShow", new Responder(updateDecoInfo), _arg_1);
            };
        }

        [Bindable(event="propertyChange")]
        public function get putMatSlot5():Slot
        {
            return (this._223261862putMatSlot5);
        }

        [Bindable(event="propertyChange")]
        public function get viewHolder():UIComponent
        {
            return (this._2113119409viewHolder);
        }

        [Bindable(event="propertyChange")]
        public function get propTitle():Label
        {
            return (this._738577227propTitle);
        }

        public function __viewStackRuneAct_change(_arg_1:IndexChangedEvent):void
        {
            runeIndexChange();
        }

        [Bindable(event="propertyChange")]
        public function get putMatSlot2():Slot
        {
            return (this._223261859putMatSlot2);
        }

        public function set headCb(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._1221271969headCb;
            if (_local_2 !== _arg_1)
            {
                this._1221271969headCb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headCb", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton10():Button
        {
            return (this._1085838545mysTreButton10);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreButton11():Button
        {
            return (this._1085838546mysTreButton11);
        }

        public function __headSel2_change(_arg_1:ListEvent):void
        {
            changeShowLvl(2);
        }

        public function updateViewDeco():void
        {
            this.updatePageOne();
            this.updatePageTwo();
        }

        public function resolveMysTre():void
        {
            if (!ToolKit.isEmptyObject(mysItemDic))
            {
                _core.remote.call("mysTreObjResolve", null, mysItemDic);
            };
        }

        public function set mysDisplay(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._2002617733mysDisplay;
            if (_local_2 !== _arg_1)
            {
                this._2002617733mysDisplay = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysDisplay", _local_2, _arg_1));
            };
        }

        private function updateDecoRuneProp(_arg_1:int):void
        {
            var _local_6:Number;
            var _local_7:Object;
            var _local_8:Number;
            var _local_9:Object;
            var _local_10:*;
            var _local_11:Label;
            var _local_2:Object = _core.player.decoInfo;
            var _local_3:Object = {};
            var _local_4:Object = _local_2[_selectedDecoHole];
            var _local_5:int = 1;
            for (;_local_5 <= 8;_local_5++)
            {
                if (_arg_1 == 1)
                {
                    _local_6 = Number(_local_4[("r" + ((2 * _local_5) - 1))]);
                    _local_7 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_6];
                    if (!_local_7) continue;
                    _local_3[Number(_local_7["propType"])] = Number(_local_7["propNum"]);
                }
                else
                {
                    _local_8 = Number(_local_4[("r" + (2 * _local_5))]);
                    _local_9 = GameData.d[GamePredef.TBL_DECO_RUNE][_local_8];
                    if (_local_9)
                    {
                        _local_3[Number(_local_9["propType"])] = Number(_local_9["propNum"]);
                    };
                };
            };
            if (_arg_1 == 1)
            {
                if (chaRunePropBox.numChildren)
                {
                    chaRunePropBox.removeAllChildren();
                };
                for (_local_10 in _local_3)
                {
                    _local_11 = new Label();
                    _local_11.setStyle("color", 0xFFFFFF);
                    switch (_local_10)
                    {
                        case 1:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 11:
                            _local_11.text = (Language.TIPPROP_S[_local_10] + _local_3[_local_10]);
                            break;
                        case 8:
                        case 9:
                        case 13:
                        case 14:
                        case 31:
                        case 32:
                        case 58:
                        case 61:
                            _local_11.text = (Language.TIPPROP_S[_local_10] + (_local_3[_local_10] / 10000));
                            break;
                        case 34:
                        case 59:
                        case 60:
                        case 62:
                        case 63:
                        case 71:
                            _local_11.text = ((Language.TIPPROP_S[_local_10] + (_local_3[_local_10] / 100)) + "%");
                            break;
                    };
                    chaRunePropBox.addChild(_local_11);
                };
            }
            else
            {
                if (petRunePropBox.numChildren)
                {
                    petRunePropBox.removeAllChildren();
                };
                for (_local_10 in _local_3)
                {
                    _local_11 = new Label();
                    _local_11.setStyle("color", 0xFFFFFF);
                    switch (_local_10)
                    {
                        case 1:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 11:
                            _local_11.text = (Language.TIPPROP_S[_local_10] + _local_3[_local_10]);
                            break;
                        case 8:
                        case 9:
                        case 13:
                        case 14:
                        case 31:
                        case 32:
                        case 58:
                        case 61:
                            _local_11.text = (Language.TIPPROP_S[_local_10] + (_local_3[_local_10] / 10000));
                            break;
                        case 34:
                        case 59:
                        case 60:
                        case 62:
                        case 63:
                        case 71:
                            _local_11.text = ((Language.TIPPROP_S[_local_10] + (_local_3[_local_10] / 100)) + "%");
                            break;
                    };
                    petRunePropBox.addChild(_local_11);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get property0():Property
        {
            return (this._722608901property0);
        }

        [Bindable(event="propertyChange")]
        public function get property1():Property
        {
            return (this._722608900property1);
        }

        [Bindable(event="propertyChange")]
        public function get property2():Property
        {
            return (this._722608899property2);
        }

        [Bindable(event="propertyChange")]
        public function get property4():Property
        {
            return (this._722608897property4);
        }

        [Bindable(event="propertyChange")]
        public function get property5():Property
        {
            return (this._722608896property5);
        }

        public function set linkProp(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1194080893linkProp;
            if (_local_2 !== _arg_1)
            {
                this._1194080893linkProp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "linkProp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get property7():Property
        {
            return (this._722608894property7);
        }

        [Bindable(event="propertyChange")]
        public function get property8():Property
        {
            return (this._722608893property8);
        }

        public function __lightCb_click(_arg_1:MouseEvent):void
        {
            hideDecoShow(2);
        }

        [Bindable(event="propertyChange")]
        public function get property6():Property
        {
            return (this._722608895property6);
        }

        [Bindable(event="propertyChange")]
        public function get property9():Property
        {
            return (this._722608892property9);
        }

        [Bindable(event="propertyChange")]
        public function get property3():Property
        {
            return (this._722608898property3);
        }

        public function init():void
        {
            trace("魂器主面板创建完毕----------");
            updateView();
            _loadCid = _core.cid;
            DecorateLogic.decoProxy.addEventListener(DecoEvent.DECO_CHANGE, decoChangeHandler);
        }

        public function set runeBagChaUp(_arg_1:RuneBagUpLvl):void
        {
            var _local_2:Object;
            _local_2 = this._1998442121runeBagChaUp;
            if (_local_2 !== _arg_1)
            {
                this._1998442121runeBagChaUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeBagChaUp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upLvlExp():Label
        {
            return (this._654621974upLvlExp);
        }

        public function set viewStackRuneAct(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._689401195viewStackRuneAct;
            if (_local_2 !== _arg_1)
            {
                this._689401195viewStackRuneAct = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStackRuneAct", _local_2, _arg_1));
            };
        }

        public function updateMysChipBagPanel(_arg_1:Object):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:ArrayCollection;
            var _local_7:Object;
            var _local_8:Sort;
            var _local_9:Sort;
            var _local_10:Number;
            var _local_11:Object;
            var _local_12:Object;
            var _local_13:Sort;
            var _local_14:int;
            var _local_15:Object;
            var _local_16:Object;
            var _local_17:int;
            var _local_18:Object;
            var _local_19:Object;
            var _local_20:Number;
            var _local_21:Number;
            var _local_22:Object;
            var _local_23:Object;
            var _local_24:Object;
            var _local_2:Object = {};
            for each (_local_3 in _arg_1)
            {
                _local_2[int(_local_3["chipId"])] = int(_local_3["num"]);
            };
            _local_4 = 1;
            _local_5 = {};
            _local_6 = new ArrayCollection();
            _local_7 = _dm.gameDataIndex[GamePredef.TBL_DECO_RUNE][_local_4];
            _local_8 = new Sort();
            _local_8.fields = [new SortField("quality", false, false, true)];
            _local_9 = new Sort();
            _local_9.fields = [new SortField("type", false, false, true)];
            _local_10 = 0;
            for each (_local_11 in _local_7)
            {
                _local_14 = _local_11["kind"];
                _local_15 = _local_11["chipId"];
                if (_local_2[_local_15])
                {
                    _local_19 = GameData.d[GamePredef.TBL_RUNE_CHIP][_local_15];
                    _local_20 = _local_19["num"];
                    _local_21 = _local_2[_local_15];
                    _local_10 = Math.floor((_local_21 / _local_20));
                }
                else
                {
                    _local_10 = 0;
                };
                if (!_local_5[_local_14])
                {
                    _local_22 = {};
                    _local_22.kindNum = 0;
                    _local_22.kind = _local_14;
                    _local_22.name = Language.DECORATE_PANEL[21][(_local_14 - 1)];
                    _local_22.children = new ArrayCollection();
                    (_local_22.children as ArrayCollection).sort = _local_8;
                    _local_6.addItem(_local_22);
                    _local_5[_local_14] = _local_22;
                };
                _local_16 = _local_5[_local_14];
                _local_16.kindNum = (Number(_local_16.kindNum) + _local_10);
                _local_17 = _local_11["qulity"];
                if (!_local_5[_local_14][_local_17])
                {
                    _local_23 = {};
                    _local_23.qualityNum = 0;
                    _local_23.quality = _local_17;
                    _local_23.name = Language.DECORATE_PANEL[60][(_local_17 - 1)];
                    _local_23.children = new ArrayCollection();
                    (_local_23.children as ArrayCollection).sort = _local_9;
                    (_local_16.children as ArrayCollection).addItem(_local_23);
                    _local_5[_local_14][_local_17] = _local_23;
                };
                _local_18 = _local_5[_local_14][_local_17];
                _local_18.qualityNum = (Number(_local_18.qualityNum) + _local_10);
                _local_11.itemNum = _local_10;
                (_local_18.children as ArrayCollection).addItem(_local_11);
            };
            for each (_local_12 in _local_6)
            {
                if (((_local_12) && (_local_12.hasOwnProperty("children"))))
                {
                    _local_24 = _local_12.children;
                    if (((_local_24) && (_local_24 is ICollectionView)))
                    {
                        (_local_24 as ICollectionView).refresh();
                    };
                };
            };
            _local_13 = new Sort();
            _local_13.fields = [new SortField("kind", false, false, true)];
            _local_6.sort = _local_9;
            _local_6.refresh();
            illustrateTree.dataProvider = _local_6;
            _local_8 = null;
            _local_9 = null;
            _local_13 = null;
            runeChipBag.chipBagData = _arg_1;
            runeChipBag.updateView();
        }

        [Bindable(event="propertyChange")]
        public function get mysTreProp3():VBox
        {
            return (this._869016272mysTreProp3);
        }

        public function ___DecoratePanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            addDecoHoleLvlTenTimes();
        }

        [Bindable(event="propertyChange")]
        public function get mysTreProp1():VBox
        {
            return (this._869016274mysTreProp1);
        }

        [Bindable(event="propertyChange")]
        public function get mysTreProp2():VBox
        {
            return (this._869016273mysTreProp2);
        }

        public function recipeClickHandler(_arg_1:int):void
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_5:Array;
            var _local_6:int;
            var _local_7:*;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:Slot;
            _selectRecipe = _arg_1;
            var _local_2:Array = makeListContainer.getChildren();
            for each (_local_3 in _local_2)
            {
                if (_local_3.name == ("bgLabel" + _arg_1))
                {
                    _local_3.labelSelected = true;
                }
                else
                {
                    _local_3.labelSelected = false;
                };
            };
            _local_4 = GameData.d[GamePredef.TBL_MYSTRE_RECIPE][_arg_1];
            _local_5 = [];
            _local_6 = 1;
            while (_local_6 <= 6)
            {
                _local_8 = int(_local_4[("t" + _local_6)]);
                _local_9 = int(_local_4[("n" + _local_6)]);
                _local_10 = int(_local_4[("q" + _local_6)]);
                if (_local_8)
                {
                    _local_11 = {
                        "t":_local_8,
                        "n":_local_9,
                        "q":_local_10
                    };
                    _local_5.push(_local_11);
                };
                _local_6++;
            };
            for (_local_7 in _local_5)
            {
                _local_12 = (this[("needMatSlot" + (int(_local_7) + 1))] as Slot);
                _local_12.clean();
                _local_12.slotType = Slot.SLOT_MYSTRE;
                _local_12.type = GamePredef.TBL_ITEM_TEMPLATE;
                _local_12.quality = _local_5[_local_7]["q"];
                _local_12.giid = _local_5[_local_7]["t"];
                _local_12.stackNum = _local_5[_local_7]["n"];
            };
            makeOutputLabel.htmlText = ((("<font color='#00FF00'>" + _local_4["name"]) + "</font>") + Language.DECORATE_PANEL[81]);
            putMaterialIn();
        }

        public function __mysTreButton0_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(0);
        }

        public function set property10(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._926039372property10;
            if (_local_2 !== _arg_1)
            {
                this._926039372property10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get buttonContainer():VBox
        {
            return (this._367345007buttonContainer);
        }

        public function set property11(_arg_1:Property):void
        {
            var _local_2:Object;
            _local_2 = this._926039371property11;
            if (_local_2 !== _arg_1)
            {
                this._926039371property11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "property11", _local_2, _arg_1));
            };
        }

        private function updatePageThree():void
        {
            _core.remote.call("getRuneBagData", new Responder(onRuneBagUpdate), _core.cid);
        }

        public function set bottomSlot(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1682576695bottomSlot;
            if (_local_2 !== _arg_1)
            {
                this._1682576695bottomSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomSlot", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTabRuneAct():HButtonTab
        {
            return (this._515959406pageTabRuneAct);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot10():RuneSlot
        {
            return (this._1139840413HoleSlot10);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot11():RuneSlot
        {
            return (this._1139840414HoleSlot11);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot12():RuneSlot
        {
            return (this._1139840415HoleSlot12);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot14():RuneSlot
        {
            return (this._1139840417HoleSlot14);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot15():RuneSlot
        {
            return (this._1139840418HoleSlot15);
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot16():RuneSlot
        {
            return (this._1139840419HoleSlot16);
        }

        public function updateLimitMakeTimes(_arg_1:Object):*
        {
            if (_arg_1)
            {
                limitMakeTimes = _arg_1["n"];
            };
        }

        [Bindable(event="propertyChange")]
        public function get HoleSlot13():RuneSlot
        {
            return (this._1139840416HoleSlot13);
        }

        public function __mysTreButton5_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(5);
        }

        public function set pageTabRune(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._1574895328pageTabRune;
            if (_local_2 !== _arg_1)
            {
                this._1574895328pageTabRune = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabRune", _local_2, _arg_1));
            };
        }

        public function set viewStack(_arg_1:ViewStack):void
        {
            var _local_2:Object;
            _local_2 = this._1584105757viewStack;
            if (_local_2 !== _arg_1)
            {
                this._1584105757viewStack = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewStack", _local_2, _arg_1));
            };
        }

        public function set pageTabRuneResolve(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._527458580pageTabRuneResolve;
            if (_local_2 !== _arg_1)
            {
                this._527458580pageTabRuneResolve = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabRuneResolve", _local_2, _arg_1));
            };
        }

        public function set nexLvlProp1(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._785164563nexLvlProp1;
            if (_local_2 !== _arg_1)
            {
                this._785164563nexLvlProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexLvlProp1", _local_2, _arg_1));
            };
        }

        public function set nexLvlProp2(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._785164562nexLvlProp2;
            if (_local_2 !== _arg_1)
            {
                this._785164562nexLvlProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexLvlProp2", _local_2, _arg_1));
            };
        }

        public function set nexLvlProp4(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._785164560nexLvlProp4;
            if (_local_2 !== _arg_1)
            {
                this._785164560nexLvlProp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexLvlProp4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get needBindSil():Label
        {
            return (this._889670173needBindSil);
        }

        public function set nexLvlProp3(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._785164561nexLvlProp3;
            if (_local_2 !== _arg_1)
            {
                this._785164561nexLvlProp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nexLvlProp3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTabPos():HButtonTab
        {
            return (this._1297726958pageTabPos);
        }

        [Bindable(event="propertyChange")]
        public function get maxLvlInfo():Label
        {
            return (this._1720350188maxLvlInfo);
        }

        public function __makeLabel3_click(_arg_1:MouseEvent):void
        {
            mysTreMakeClickHandler(3);
        }

        public function ___DecoratePanel_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            changToOtherTab(1);
        }

        [Bindable(event="propertyChange")]
        public function get pageTabMysTre():HButtonTab
        {
            return (this._1506606598pageTabMysTre);
        }

        public function set name3(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._104584968name3;
            if (_local_2 !== _arg_1)
            {
                this._104584968name3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name3", _local_2, _arg_1));
            };
        }

        public function set name4(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._104584969name4;
            if (_local_2 !== _arg_1)
            {
                this._104584969name4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name4", _local_2, _arg_1));
            };
        }

        public function set name1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._104584966name1;
            if (_local_2 !== _arg_1)
            {
                this._104584966name1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name1", _local_2, _arg_1));
            };
        }

        public function set name2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._104584967name2;
            if (_local_2 !== _arg_1)
            {
                this._104584967name2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "name2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get suitProp0():Label
        {
            return (this._1851478496suitProp0);
        }

        [Bindable(event="propertyChange")]
        public function get suitProp1():Label
        {
            return (this._1851478495suitProp1);
        }

        [Bindable(event="propertyChange")]
        public function get upLvlSlot():RuneSlot
        {
            return (this._1181149659upLvlSlot);
        }

        [Bindable(event="propertyChange")]
        public function get mysItemDic():Object
        {
            return (this._1558202844mysItemDic);
        }

        [Bindable(event="propertyChange")]
        public function get viewStackDeco():ViewStack
        {
            return (this._1124646448viewStackDeco);
        }

        [Bindable(event="propertyChange")]
        public function get hasSilver():Label
        {
            return (this._282560953hasSilver);
        }

        public function set needMatSlot1(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1827803945needMatSlot1;
            if (_local_2 !== _arg_1)
            {
                this._1827803945needMatSlot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needMatSlot1", _local_2, _arg_1));
            };
        }

        public function set needMatSlot2(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1827803946needMatSlot2;
            if (_local_2 !== _arg_1)
            {
                this._1827803946needMatSlot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needMatSlot2", _local_2, _arg_1));
            };
        }

        public function set ditu1(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95595307ditu1;
            if (_local_2 !== _arg_1)
            {
                this._95595307ditu1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ditu1", _local_2, _arg_1));
            };
        }

        public function set ditu2(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95595308ditu2;
            if (_local_2 !== _arg_1)
            {
                this._95595308ditu2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ditu2", _local_2, _arg_1));
            };
        }

        public function set ditu3(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95595309ditu3;
            if (_local_2 !== _arg_1)
            {
                this._95595309ditu3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ditu3", _local_2, _arg_1));
            };
        }

        public function set needMatSlot3(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1827803947needMatSlot3;
            if (_local_2 !== _arg_1)
            {
                this._1827803947needMatSlot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needMatSlot3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get headCb():CheckBox
        {
            return (this._1221271969headCb);
        }

        public function set needMatSlot5(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1827803949needMatSlot5;
            if (_local_2 !== _arg_1)
            {
                this._1827803949needMatSlot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needMatSlot5", _local_2, _arg_1));
            };
        }

        public function set ditu4(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._95595310ditu4;
            if (_local_2 !== _arg_1)
            {
                this._95595310ditu4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ditu4", _local_2, _arg_1));
            };
        }

        public function set needMatSlot4(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1827803948needMatSlot4;
            if (_local_2 !== _arg_1)
            {
                this._1827803948needMatSlot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needMatSlot4", _local_2, _arg_1));
            };
        }

        private function addDecoHoleLvl():void
        {
            _core.remote.call("addDecoHoleLevel", new Responder(updateDecoInfo), _selectedDecoHole);
        }

        public function set suitName(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1860916424suitName;
            if (_local_2 !== _arg_1)
            {
                this._1860916424suitName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "suitName", _local_2, _arg_1));
            };
        }

        public function set mysTreButton0(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446274mysTreButton0;
            if (_local_2 !== _arg_1)
            {
                this._1350446274mysTreButton0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton0", _local_2, _arg_1));
            };
        }

        public function set mysTreButton1(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446273mysTreButton1;
            if (_local_2 !== _arg_1)
            {
                this._1350446273mysTreButton1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton1", _local_2, _arg_1));
            };
        }

        public function set mysTreButton3(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446271mysTreButton3;
            if (_local_2 !== _arg_1)
            {
                this._1350446271mysTreButton3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton3", _local_2, _arg_1));
            };
        }

        public function set mysTreButton4(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446270mysTreButton4;
            if (_local_2 !== _arg_1)
            {
                this._1350446270mysTreButton4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton4", _local_2, _arg_1));
            };
        }

        public function set mysTreButton5(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446269mysTreButton5;
            if (_local_2 !== _arg_1)
            {
                this._1350446269mysTreButton5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton5", _local_2, _arg_1));
            };
        }

        public function set mysTreButton2(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446272mysTreButton2;
            if (_local_2 !== _arg_1)
            {
                this._1350446272mysTreButton2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton2", _local_2, _arg_1));
            };
        }

        public function set mysTreButton6(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446268mysTreButton6;
            if (_local_2 !== _arg_1)
            {
                this._1350446268mysTreButton6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton6", _local_2, _arg_1));
            };
        }

        public function set needMatSlot6(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1827803950needMatSlot6;
            if (_local_2 !== _arg_1)
            {
                this._1827803950needMatSlot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needMatSlot6", _local_2, _arg_1));
            };
        }

        public function set mysTreButton8(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446266mysTreButton8;
            if (_local_2 !== _arg_1)
            {
                this._1350446266mysTreButton8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton8", _local_2, _arg_1));
            };
        }

        public function set needSilver(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1343160509needSilver;
            if (_local_2 !== _arg_1)
            {
                this._1343160509needSilver = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "needSilver", _local_2, _arg_1));
            };
        }

        public function __headSel4_change(_arg_1:ListEvent):void
        {
            changeShowLvl(4);
        }

        public function set makeLabel1(_arg_1:BackgroundLabel):void
        {
            var _local_2:Object;
            _local_2 = this._39561035makeLabel1;
            if (_local_2 !== _arg_1)
            {
                this._39561035makeLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeLabel1", _local_2, _arg_1));
            };
        }

        public function set makeLabel2(_arg_1:BackgroundLabel):void
        {
            var _local_2:Object;
            _local_2 = this._39561036makeLabel2;
            if (_local_2 !== _arg_1)
            {
                this._39561036makeLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeLabel2", _local_2, _arg_1));
            };
        }

        public function set mysTreButton7(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446267mysTreButton7;
            if (_local_2 !== _arg_1)
            {
                this._1350446267mysTreButton7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton7", _local_2, _arg_1));
            };
        }

        public function set makeLabel3(_arg_1:BackgroundLabel):void
        {
            var _local_2:Object;
            _local_2 = this._39561037makeLabel3;
            if (_local_2 !== _arg_1)
            {
                this._39561037makeLabel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeLabel3", _local_2, _arg_1));
            };
        }

        public function set mysTreButton9(_arg_1:Button):void
        {
            var _local_2:Object;
            _local_2 = this._1350446265mysTreButton9;
            if (_local_2 !== _arg_1)
            {
                this._1350446265mysTreButton9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mysTreButton9", _local_2, _arg_1));
            };
        }

        public function set makeLabel6(_arg_1:BackgroundLabel):void
        {
            var _local_2:Object;
            _local_2 = this._39561040makeLabel6;
            if (_local_2 !== _arg_1)
            {
                this._39561040makeLabel6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeLabel6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get runeBagChaUp():RuneBagUpLvl
        {
            return (this._1998442121runeBagChaUp);
        }

        public function set makeLabel4(_arg_1:BackgroundLabel):void
        {
            var _local_2:Object;
            _local_2 = this._39561038makeLabel4;
            if (_local_2 !== _arg_1)
            {
                this._39561038makeLabel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeLabel4", _local_2, _arg_1));
            };
        }

        public function set makeLabel5(_arg_1:BackgroundLabel):void
        {
            var _local_2:Object;
            _local_2 = this._39561039makeLabel5;
            if (_local_2 !== _arg_1)
            {
                this._39561039makeLabel5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeLabel5", _local_2, _arg_1));
            };
        }

        public function set runeBagCha(_arg_1:RuneClickBag):void
        {
            var _local_2:Object;
            _local_2 = this._2085068978runeBagCha;
            if (_local_2 !== _arg_1)
            {
                this._2085068978runeBagCha = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeBagCha", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTabRune():HButtonTab
        {
            return (this._1574895328pageTabRune);
        }

        [Bindable(event="propertyChange")]
        public function get viewStack():ViewStack
        {
            return (this._1584105757viewStack);
        }

        public function set runeUp(_arg_1:Image):void
        {
            var _local_2:Object;
            _local_2 = this._919815307runeUp;
            if (_local_2 !== _arg_1)
            {
                this._919815307runeUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeUp", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pageTabRuneResolve():HButtonTab
        {
            return (this._527458580pageTabRuneResolve);
        }

        [Bindable(event="propertyChange")]
        public function get nexLvlProp1():Label
        {
            return (this._785164563nexLvlProp1);
        }

        [Bindable(event="propertyChange")]
        public function get nexLvlProp2():Label
        {
            return (this._785164562nexLvlProp2);
        }

        [Bindable(event="propertyChange")]
        public function get nexLvlProp3():Label
        {
            return (this._785164561nexLvlProp3);
        }

        public function ___DecoratePanel_BasicDelayButton5_click(_arg_1:MouseEvent):void
        {
            changeToMysBag();
        }

        public function __viewStack_creationComplete(_arg_1:FlexEvent):void
        {
            viewStackComp();
        }

        [Bindable(event="propertyChange")]
        public function get nexLvlProp4():Label
        {
            return (this._785164560nexLvlProp4);
        }

        [Bindable(event="propertyChange")]
        public function get name1():Image
        {
            return (this._104584966name1);
        }

        [Bindable(event="propertyChange")]
        public function get name2():Image
        {
            return (this._104584967name2);
        }

        [Bindable(event="propertyChange")]
        public function get name3():Image
        {
            return (this._104584968name3);
        }

        [Bindable(event="propertyChange")]
        public function get name4():Image
        {
            return (this._104584969name4);
        }

        public function set runeChipBag(_arg_1:RuneChipBag):void
        {
            var _local_2:Object;
            _local_2 = this._878430082runeChipBag;
            if (_local_2 !== _arg_1)
            {
                this._878430082runeChipBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeChipBag", _local_2, _arg_1));
            };
        }

        public function set footSlot(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._394232716footSlot;
            if (_local_2 !== _arg_1)
            {
                this._394232716footSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "footSlot", _local_2, _arg_1));
            };
        }

        public function __mysTreButton3_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(3);
        }

        [Bindable(event="propertyChange")]
        public function get needSilver():Label
        {
            return (this._1343160509needSilver);
        }

        [Bindable(event="propertyChange")]
        public function get makeLabel1():BackgroundLabel
        {
            return (this._39561035makeLabel1);
        }

        [Bindable(event="propertyChange")]
        public function get makeLabel2():BackgroundLabel
        {
            return (this._39561036makeLabel2);
        }

        [Bindable(event="propertyChange")]
        public function get makeLabel3():BackgroundLabel
        {
            return (this._39561037makeLabel3);
        }

        [Bindable(event="propertyChange")]
        public function get makeLabel6():BackgroundLabel
        {
            return (this._39561040makeLabel6);
        }

        public function set makeOutputLabel(_arg_1:Label):void
        {
            var _local_2:Object;
            _local_2 = this._1031721051makeOutputLabel;
            if (_local_2 !== _arg_1)
            {
                this._1031721051makeOutputLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "makeOutputLabel", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get makeLabel4():BackgroundLabel
        {
            return (this._39561038makeLabel4);
        }

        [Bindable(event="propertyChange")]
        public function get makeLabel5():BackgroundLabel
        {
            return (this._39561039makeLabel5);
        }

        public function set decoDis1(_arg_1:DecorateDisplay):void
        {
            var _local_2:Object;
            _local_2 = this._569860016decoDis1;
            if (_local_2 !== _arg_1)
            {
                this._569860016decoDis1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoDis1", _local_2, _arg_1));
            };
        }

        public function set decoDis2(_arg_1:DecorateDisplay):void
        {
            var _local_2:Object;
            _local_2 = this._569860017decoDis2;
            if (_local_2 !== _arg_1)
            {
                this._569860017decoDis2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoDis2", _local_2, _arg_1));
            };
        }

        public function set decoDis3(_arg_1:DecorateDisplay):void
        {
            var _local_2:Object;
            _local_2 = this._569860018decoDis3;
            if (_local_2 !== _arg_1)
            {
                this._569860018decoDis3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoDis3", _local_2, _arg_1));
            };
        }

        public function set decoDis0(_arg_1:DecorateDisplay):void
        {
            var _local_2:Object;
            _local_2 = this._569860015decoDis0;
            if (_local_2 !== _arg_1)
            {
                this._569860015decoDis0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoDis0", _local_2, _arg_1));
            };
        }

        public function onAddLimitMakeTimes(obj:Object):void
        {
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("addLimitMakeTimes", new Responder(updateLimitMakeTimes));
                };
            };
            var addTimes:Number = obj["n"];
            var lastAddTime:String = obj["t"];
            var nowTimemillis:Number = ((new Date().getTime() + _core.timeLag) + TimeUtil.timeOSOffSet);
            var now:Date = new Date(nowTimemillis);
            var nDate:Number = now.getDate();
            var nMonth:Number = now.getMonth();
            var nowStr:String = ((nMonth + "|") + nDate);
            if (nowStr != lastAddTime)
            {
                addTimes = 0;
            };
            var needMoney:Number = 0;
            var i:int;
            while (i < 6)
            {
                if (addTimes < MYS_TRE_ADD_TIMES_GOLD[i][0])
                {
                    needMoney = MYS_TRE_ADD_TIMES_GOLD[i][1];
                    break;
                };
                i = (i + 1);
            };
            if (needMoney)
            {
                Alert.show(Language.DECORATE_PANEL[64].toString().replace("{num}", needMoney), "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                Alert.show(Language.DECORATE_PANEL[65]);
            };
        }

        public function __mysTreButton8_click(_arg_1:MouseEvent):void
        {
            btnClickHandler(8);
        }

        public function makeMysTre():void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:Object;
            var _local_1:Object = GameData.d[GamePredef.TBL_MYSTRE_RECIPE][_selectRecipe];
            if (_local_1)
            {
                if (canMake())
                {
                    _local_2 = {};
                    _local_3 = {};
                    _local_4 = 1;
                    while (_local_4 <= 6)
                    {
                        if (this[("putMatSlot" + _local_4)].slotData)
                        {
                            _local_5 = {};
                            _local_5.idx = this[("putMatSlot" + _local_4)].slotData.id;
                            _local_2[_local_4] = _local_5;
                            _local_3[_local_4] = this[("putMatSlot" + _local_4)].stackNum;
                        };
                        _local_4++;
                    };
                    _core.remote.call("makeMysTre", null, _selectRecipe, _local_2, _local_3);
                }
                else
                {
                    Alert.show(Language.DECORATE_PANEL[82]);
                };
            };
        }

        public function ___DecoratePanel_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            putMaterialIn();
        }

        private function upRuneLvl():void
        {
            _core.remote.call("runeUpLvl", new Responder(onRuneBagUpdate));
        }

        public function set decoDis4(_arg_1:DecorateDisplay):void
        {
            var _local_2:Object;
            _local_2 = this._569860019decoDis4;
            if (_local_2 !== _arg_1)
            {
                this._569860019decoDis4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "decoDis4", _local_2, _arg_1));
            };
        }

        public function __makeLabel1_click(_arg_1:MouseEvent):void
        {
            mysTreMakeClickHandler(1);
        }

        [Bindable(event="propertyChange")]
        public function get runeBagCha():RuneClickBag
        {
            return (this._2085068978runeBagCha);
        }

        public function __headCb_click(_arg_1:MouseEvent):void
        {
            hideDecoShow(1);
        }

        [Bindable(event="propertyChange")]
        public function get runeChipBag():RuneChipBag
        {
            return (this._878430082runeChipBag);
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

        public function set runeBagPet(_arg_1:RuneClickBag):void
        {
            var _local_2:Object;
            _local_2 = this._2085056559runeBagPet;
            if (_local_2 !== _arg_1)
            {
                this._2085056559runeBagPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "runeBagPet", _local_2, _arg_1));
            };
        }

        public function updateMakeList(_arg_1:int):void
        {
            var _local_4:*;
            var _local_5:int;
            var _local_6:BackgroundLabel;
            var _local_2:Object = _mysMakeData["learnedRec"];
            if (makeListContainer.numChildren > 0)
            {
                makeListContainer.removeAllChildren();
            };
            var _local_3:Object = _dm.gameDataIndex[GamePredef.TBL_MYSTRE_RECIPE][_arg_1];
            for each (_local_4 in _local_3)
            {
                _local_5 = _local_4["id"];
                if (listShowCbx.selected)
                {
                    if (_local_2[_local_5])
                    {
                        _local_6 = new BackgroundLabel();
                        _local_6.labelWidth = 115;
                        _local_6.labelText = _local_4["name"];
                        makeListContainer.addChild(_local_6);
                        _local_6.setLabelColor(0xFFFFFF);
                        _local_6.recipeId = _local_5;
                        _local_6.name = ("bgLabel" + _local_5);
                        _local_6.clickCall = recipeClickHandler;
                    };
                }
                else
                {
                    if (_local_2[_local_5])
                    {
                        _local_6 = new BackgroundLabel();
                        _local_6.labelWidth = 115;
                        _local_6.labelText = _local_4["name"];
                        makeListContainer.addChild(_local_6);
                        _local_6.setLabelColor(0xFFFFFF);
                        _local_6.recipeId = _local_5;
                        _local_6.name = ("bgLabel" + _local_5);
                        _local_6.clickCall = recipeClickHandler;
                    }
                    else
                    {
                        _local_6 = new BackgroundLabel();
                        _local_6.labelWidth = 115;
                        _local_6.labelText = _local_4["name"];
                        makeListContainer.addChild(_local_6);
                        _local_6.setLabelColor(0xFF0000);
                        _local_6.recipeId = _local_5;
                        _local_6.name = ("bgLabel" + _local_5);
                        _local_6.clickCall = recipeClickHandler;
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get decoDis0():DecorateDisplay
        {
            return (this._569860015decoDis0);
        }

        [Bindable(event="propertyChange")]
        public function get decoDis1():DecorateDisplay
        {
            return (this._569860016decoDis1);
        }

        [Bindable(event="propertyChange")]
        public function get decoDis2():DecorateDisplay
        {
            return (this._569860017decoDis2);
        }

        [Bindable(event="propertyChange")]
        public function get decoDis3():DecorateDisplay
        {
            return (this._569860018decoDis3);
        }

        [Bindable(event="propertyChange")]
        public function get decoDis4():DecorateDisplay
        {
            return (this._569860019decoDis4);
        }

        [Bindable(event="propertyChange")]
        public function get makeOutputLabel():Label
        {
            return (this._1031721051makeOutputLabel);
        }

        public function __makeLabel6_click(_arg_1:MouseEvent):void
        {
            mysTreMakeClickHandler(6);
        }

        public function updateMysBagPanel(_arg_1:Object):void
        {
            mysTreBag.mysTreBagData = _arg_1;
            mysTreBag.clean();
            mysTreBag.updateView();
            mysItemDic = mysTreBag.itemDic;
            if (!mysItemDic)
            {
                resolveMysSil = 0;
            };
        }

        private function addDecoHoleLvlTenTimes():void
        {
            _core.remote.call("addDecoHoleLevelTenTimes", new Responder(updateDecoInfo), _selectedDecoHole);
        }

        public function set pageTwoCvs(_arg_1:Canvas):void
        {
            var _local_2:Object;
            _local_2 = this._1318419427pageTwoCvs;
            if (_local_2 !== _arg_1)
            {
                this._1318419427pageTwoCvs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTwoCvs", _local_2, _arg_1));
            };
        }

        public function onUpdateSuitProp(_arg_1:Object):void
        {
            var _local_2:Label;
            var _local_3:Object;
            var _local_4:Object;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Label;
            var _local_9:int;
            var _local_10:Object;
            var _local_11:*;
            var _local_12:Array;
            var _local_13:int;
            var _local_14:Object;
            var _local_15:int;
            var _local_16:Array;
            var _local_17:int;
            var _local_18:Object;
            suitRefreshFlag = true;
            if (_arg_1)
            {
                suitName.text = (_arg_1["actName"] + "：");
                if (_arg_1["suitIdObj"])
                {
                    _local_3 = _arg_1["suitIdObj"];
                    for (_local_4 in _local_3)
                    {
                        _local_5 = int(_local_4);
                        _local_6 = GameData.d[GamePredef.TBL_DECO_SHOW][_local_5];
                        _local_7 = int(_local_6["position"]);
                        _local_8 = (this[("showProp" + _local_7)] as Label);
                        _local_9 = int(_local_6["propType1"]);
                        _local_8.text = (("+" + _local_6["propNum1"]) + DECO_SUIT_PROP_NAME[_local_9]);
                        _local_10 = _arg_1["actArr"];
                        _local_8.setStyle("color", 0x999999);
                        for (_local_11 in _local_10)
                        {
                            if (Number(_local_10[_local_11]) == _local_5)
                            {
                                _local_8.setStyle("color", 0xFFFF);
                            };
                        };
                    };
                };
                if (_arg_1["suitProp"])
                {
                    _local_12 = _arg_1["suitProp"];
                    _local_13 = 0;
                    while (_local_13 < _local_12.length)
                    {
                        _local_14 = _local_12[_local_13];
                        _local_9 = int(_local_14["t"]);
                        if (_local_9 != 5)
                        {
                            _local_15 = int(_local_14["propVal"]);
                            (this[("suitProp" + _local_13)] as Label).text = (("+" + _local_15) + DECO_SUIT_PROP_NAME[_local_9]);
                            (this[("suitProp" + _local_13)] as Label).setStyle("color", 0x999999);
                            if (_arg_1["actFlag"])
                            {
                                (this[("suitProp" + _local_13)] as Label).setStyle("color", 0xFFFF);
                            };
                        };
                        _local_13++;
                    };
                };
                _local_2 = (this["linkProp"] as Label);
                if (_arg_1["linkProp"] == "null")
                {
                    _local_2.htmlText = "<font color='#999999'>None</font>";
                }
                else
                {
                    if (_arg_1["linkProp"])
                    {
                        _local_16 = _arg_1["linkProp"];
                        _local_2.htmlText = "";
                        _local_17 = 0;
                        while (_local_17 < _local_16.length)
                        {
                            _local_18 = _local_16[_local_17];
                            _local_9 = int(_local_18["t"]);
                            if (_local_9 != 5)
                            {
                                _local_15 = int(_local_18["propVal"]);
                                if (_arg_1["linkFlag"])
                                {
                                    _local_2.htmlText = (_local_2.htmlText + (((("<font color='#00FFFF'>" + "+") + _local_15) + DECO_SUIT_PROP_NAME[_local_9]) + "</font>"));
                                }
                                else
                                {
                                    _local_2.htmlText = (_local_2.htmlText + (((("<font color='#999999'>" + "+") + _local_15) + DECO_SUIT_PROP_NAME[_local_9]) + "</font>"));
                                };
                            };
                            _local_17++;
                        };
                        if (_arg_1["actFlag"])
                        {
                            _local_2.htmlText = (_local_2.htmlText + ((("<font color='#FFFF00'>" + "(") + _arg_1["actName"]) + "</font>"));
                        }
                        else
                        {
                            _local_2.htmlText = (_local_2.htmlText + ((("<font color='#999999'>" + "(") + _arg_1["actName"]) + "</font>"));
                        };
                        _local_2.htmlText = (_local_2.htmlText + (("<font color='#FFFFFF'>" + "∞") + "</font>"));
                        if (_arg_1["actLinkSuitFlag"])
                        {
                            _local_2.htmlText = (_local_2.htmlText + ((("<font color='#FFFF00'>" + _arg_1["actLinkSuitName"]) + ")") + "</font>"));
                        }
                        else
                        {
                            _local_2.htmlText = (_local_2.htmlText + ((("<font color='#999999'>" + _arg_1["actLinkSuitName"]) + ")") + "</font>"));
                        };
                    };
                };
            };
        }

        public function ___DecoratePanel_Canvas7_click(_arg_1:MouseEvent):void
        {
            setSelectedPosition(3);
        }

        [Bindable(event="propertyChange")]
        public function get pageTabFirst():HButtonTab
        {
            return (this._1565679562pageTabFirst);
        }

        public function set pageTabFirst(_arg_1:HButtonTab):void
        {
            var _local_2:Object;
            _local_2 = this._1565679562pageTabFirst;
            if (_local_2 !== _arg_1)
            {
                this._1565679562pageTabFirst = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageTabFirst", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get runeBagPet():RuneClickBag
        {
            return (this._2085056559runeBagPet);
        }

        public function set bottomCb(_arg_1:CheckBox):void
        {
            var _local_2:Object;
            _local_2 = this._2138061846bottomCb;
            if (_local_2 !== _arg_1)
            {
                this._2138061846bottomCb = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomCb", _local_2, _arg_1));
            };
        }

        public function __headSel1_change(_arg_1:ListEvent):void
        {
            changeShowLvl(1);
        }

        public function set headSlot(_arg_1:Slot):void
        {
            var _local_2:Object;
            _local_2 = this._1115800578headSlot;
            if (_local_2 !== _arg_1)
            {
                this._1115800578headSlot = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headSlot", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

